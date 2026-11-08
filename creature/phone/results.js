// This screen only shares an explicitly supplied, public HTTPS player address.
// Generating a QR is not a claim that a remote host or a physical phone was tested.
export function playerUrl(value) {
  const url = new URL(value);
  const host = url.hostname.toLowerCase().replace(/\.$/, '');
  if (url.protocol !== 'https:' || url.username || url.password || url.port && url.port !== '443') throw new Error('Use a public HTTPS player URL without credentials or a custom port.');
  if (!host.includes('.') || host.includes(':') || /^\d+(?:\.\d+){3}$/.test(host)
      || /(?:^|\.)(?:localhost|local|internal|lan|test|invalid|example)$/.test(host)
      || /(?:^|\.)(?:localhost\.localdomain|nip\.io|sslip\.io|localtest\.me|lvh\.me)$/.test(host)) throw new Error('Use a public player address. Local and IP addresses cannot be shared here.');
  if (url.pathname.endsWith('/results.html')) url.pathname = url.pathname.slice(0, -'results.html'.length);
  url.search = ''; url.hash = '';
  url.searchParams.set('game', 'doom');
  url.searchParams.set('demo', '1');
  return url.href;
}

if (typeof document !== 'undefined') {
  const $ = id => document.getElementById(id);
  let configured = null;
  let generation = 0;
  const supplied = new URLSearchParams(location.search).get('player');
  try { configured = playerUrl(supplied || new URL('./', location.href).href); }
  catch (error) { if (supplied) $('setup-error').textContent = error.message; }
  if (configured) $('player-url').value = configured;
  if (/^(localhost|127\.|\[::1\])/.test(location.hostname)) $('preview').hidden = false;

  async function reveal() {
    const thisGeneration = ++generation;
    $('idle').hidden = true;
    $('handoff').hidden = false;
    $('code').replaceChildren();
    $('qr-frame').hidden = true;
    $('phone-link').hidden = true;
    $('controls-note').hidden = true;
    $('handoff-title').focus({ preventScroll: true });
    if (!configured) {
      $('handoff-title').textContent = 'Your phone is next.';
      $('handoff-description').textContent = 'Doom is selected.';
      $('handoff-status').textContent = 'Phone link is being prepared.';
      return;
    }
    $('handoff-title').textContent = 'Scan. Then play.';
    $('handoff-description').textContent = "Open your phone's camera and point it here.";
    $('handoff-status').textContent = 'Preparing your code…';
    try {
      const { default: qrcode } = await import('./core/qrcode.mjs');
      if (generation !== thisGeneration) return;
      const qr = qrcode(0, 'M');
      qr.addData(configured); qr.make();
      // Only trusted encoder output is inserted; the configured URL is rendered via textContent.
      $('code').innerHTML = qr.createSvgTag({ cellSize: 6, margin: 4, scalable: true });
      $('qr-frame').hidden = false;
      $('phone-link').href = configured;
      $('phone-link').textContent = configured;
      $('phone-link').hidden = false;
      $('controls-note').hidden = false;
      $('handoff-status').textContent = '';
    } catch {
      $('handoff-status').textContent = 'The code could not load. Open the link below, or try again.';
      $('phone-link').href = configured;
      $('phone-link').textContent = configured;
      $('phone-link').hidden = false;
    }
  }

  $('choose').addEventListener('click', reveal);
  $('setup-form').addEventListener('submit', event => {
    event.preventDefault();
    try {
      configured = playerUrl($('player-url').value.trim());
      $('setup-error').textContent = '';
      $('player-url').value = configured;
      const page = new URL(location.href); page.searchParams.set('player', configured);
      history.replaceState(null, '', page);
      reveal();
    } catch (error) {
      configured = null;
      $('setup-error').textContent = error.message;
      $('player-url').focus();
      if (!$('handoff').hidden) reveal();
    }
  });

  // Read only the local host's verified report; do not attach its proof to another URL.
  if (configured && new URL(configured).origin === location.origin) {
    fetch('status.json', { cache: 'no-store' }).then(r => r.ok ? r.json() : null).then(status => {
      const pct = status?.build?.pct_agent_code;
      if (status?.rom && typeof pct === 'number' && Number.isFinite(pct) && pct >= 0 && pct <= 100) {
        $('build-fact').textContent = `This host's verified rebuild contains ${pct}% agent-written game code by size. The rebuilt engine is byte-identical to its original. Gameplay runs in the mGBA emulator.`;
      }
    }).catch(() => {});
  }
}
