/* Visual presentation only. The ROM's static face is the primary demo. */
(() => {
  'use strict';
  const params = new URLSearchParams(location.search);
  const sample = params.get('sample') === '1';
  const preview = params.get('preview') === '1';
  document.body.classList.toggle('preview', preview);
  document.body.classList.toggle('sample-mode', sample);
  const canvas = document.getElementById('noise');
  const ctx = canvas.getContext('2d', {alpha:true});
  const status = document.getElementById('status');
  const pixels = ctx.createImageData(240,160);
  const regions = [
    {id:'world',x:0,y:0,w:240,h:128},
    {id:'enemies',x:0,y:0,w:240,h:128},
    {id:'weapons',x:76,y:64,w:88,h:64},
    {id:'hud',x:0,y:128,w:240,h:32}
  ];
  let reduced = matchMedia('(prefers-reduced-motion: reduce)').matches || params.get('motion') === 'off';
  let lastMessage = 0, lastPaint = 0, socket, retry, online = false, latest = null, previousRun = null;
  let completions = new Map(), previousHeal = {};
  const clamp = n => Number.isFinite(n) ? Math.max(0,Math.min(1,n)) : 0;
  function label(text, kind='') { status.textContent=text;status.className=kind; }
  function accept(frame) {
    if (!frame || frame.v !== 1 || !frame.heal || typeof frame.heal !== 'object') return;
    if (frame.run_id !== previousRun) {completions.clear();previousHeal={};previousRun=frame.run_id;}
    const next={};
    for (const r of regions) {
      next[r.id]=clamp(frame.heal[r.id]);
      if(previousHeal[r.id] !== undefined && previousHeal[r.id]<1 && next[r.id]===1) completions.set(r.id,performance.now());
    }
    previousHeal=next;latest={...frame,heal:next};lastMessage=performance.now();online=true;
  }
  function connect() {
    const endpoint=params.get('ws') || 'ws://127.0.0.1:7301';
    try { const u=new URL(endpoint);if(!['ws:','wss:'].includes(u.protocol))throw Error('invalid websocket URL');socket=new WebSocket(u); }
    catch {label('NO SIGNAL · INVALID BRIDGE URL');return;}
    socket.onmessage=e=>{try{accept(JSON.parse(e.data));}catch{ /* malformed data cannot heal */ }};
    socket.onclose=()=>{online=false;clearTimeout(retry);retry=setTimeout(connect,1500);};
    socket.onerror=()=>socket.close();
  }
  function state(now) {
    if (!online || !latest || now-lastMessage>5000) return {ok:false,text:sample?'SAMPLE DATA · NO SIGNAL':'NO SIGNAL · WAITING FOR BRIDGE'};
    const fixture=sample || latest.fixture===true;
    const source=typeof latest.status==='string'?latest.status:(latest.status?.source || latest.source_status || '');
    const stale=latest.sample_age_s != null && latest.sample_age_s>5;
    if(stale || source.startsWith('invalid:') || ['disconnected','missing','error','waiting','no_signal'].includes(source))return {ok:false,text:(fixture?'SAMPLE DATA · ':'')+'NO SIGNAL · SOURCE UNAVAILABLE'};
    if(latest.tap_connected===false && !fixture)return {ok:false,text:'NO SIGNAL · EMULATOR DISCONNECTED'};
    return {ok:true,fixture,text:fixture?'SAMPLE DATA · PRESENTATION EFFECT':'RECOVERY OVERLAY · PRESENTATION EFFECT'};
  }
  function paint(now) {
    requestAnimationFrame(paint);
    if(now-lastPaint<(reduced?200:33))return;lastPaint=now;
    const s=state(now);label(s.text,s.fixture?'sample':'');
    pixels.data.fill(0);
    // World and enemy code share the view. Use the less recovered coverage.
    const heal=s.ok?latest.heal:{world:0,enemies:0,weapons:0,hud:0};
    const view=Math.min(heal.world,heal.enemies);
    for(let y=0;y<160;y++) for(let x=0;x<240;x++) {
      let intensity=1-(y>=128?heal.hud:(x>=76&&x<164&&y>=64?heal.weapons:view));
      if(intensity<=0)continue;
      const noise=reduced?((x*19+y*31)%101)/101:Math.random();
      const n=(y*240+x)*4;
      const value=noise>0.78?190:noise>0.4?55:8;
      pixels.data[n]=value;pixels.data[n+1]=value;pixels.data[n+2]=Math.min(255,value+25);
      pixels.data[n+3]=Math.round(intensity*(noise>0.85?205:130));
    }
    ctx.putImageData(pixels,0,0);
    if(s.ok&&!reduced)for(const r of regions){
      const start=completions.get(r.id);if(start===undefined)continue;
      const t=(now-start)/450;if(t>=1){completions.delete(r.id);continue;}
      ctx.fillStyle=`rgba(124,242,200,${(1-t)*.65})`;ctx.fillRect(r.x+Math.floor(t*r.w),r.y,2,r.h);
    }
  }
  if(sample){
    const choose=n=>accept({v:1,fixture:true,run_id:'visual-check',frame:0,heal:{world:n,enemies:n,weapons:n,hud:n},tap_connected:false});
    document.querySelectorAll('[data-step]').forEach(b=>b.onclick=()=>choose(Number(b.dataset.step)));
    document.getElementById('disconnect').onclick=()=>{online=false;};
    document.getElementById('motion').onclick=()=>{reduced=!reduced;};
    choose(0);setInterval(()=>{if(online)lastMessage=performance.now();},1000);
  } else connect();
  requestAnimationFrame(paint);
})();
