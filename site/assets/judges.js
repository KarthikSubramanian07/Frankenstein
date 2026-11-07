// For judges: the small-screen menu (same behaviour as the home page) and copy buttons for agent addresses.
(function () {
  var menu = document.querySelector('.menu-btn'), nav = document.querySelector('.nav');
  if (menu && nav) {
    var close = function () { nav.classList.remove('open'); menu.setAttribute('aria-expanded', 'false'); };
    menu.addEventListener('click', function () {
      var open = nav.classList.toggle('open');
      menu.setAttribute('aria-expanded', open ? 'true' : 'false');
    });
    document.querySelectorAll('.nav-links a').forEach(function (a) { a.addEventListener('click', close); });
    document.addEventListener('keydown', function (e) { if (e.key === 'Escape' && nav.classList.contains('open')) { close(); menu.focus(); } });
  }
  if (!navigator.clipboard) return;
  document.querySelectorAll('button[data-copy]').forEach(function (b) {
    b.hidden = false;
    b.setAttribute('aria-label', 'Copy the address of ' + b.parentElement.querySelector('b').textContent);
    b.addEventListener('click', function () {
      navigator.clipboard.writeText(b.dataset.copy).then(function () {
        b.textContent = 'Copied';
        setTimeout(function () { b.textContent = 'Copy'; }, 1600);
      });
    });
  });
})();
