// For judges: copy an agent address to paste into ASI:One. Buttons stay hidden without JS or the Clipboard API.
(function () {
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
