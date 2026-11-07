// FRANKENSTEIN site: tiny progressive enhancement. The page works fully without this file.
(function () {
  var reduce = window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  // Versus card: replay the rejected claim line by line, but only if it starts below the fold.
  var vs = document.querySelector(".vs");
  if (vs && !reduce && "IntersectionObserver" in window && vs.getBoundingClientRect().top > window.innerHeight) {
    vs.classList.add("arm");
    var io = new IntersectionObserver(function (entries) {
      if (entries.some(function (e) { return e.isIntersecting; })) { vs.classList.add("go"); io.disconnect(); }
    }, { threshold: 0.35 });
    io.observe(vs);
  }

  // PRESS START also answers the Enter key on the title screen, like a real one.
  var start = document.querySelector(".start");
  document.addEventListener("keydown", function (e) {
    if (e.key !== "Enter" || !start) return;
    if (e.target && e.target !== document.body) return;
    if (window.scrollY > window.innerHeight * 0.5) return;
    e.preventDefault();
    start.click();
  });
})();
