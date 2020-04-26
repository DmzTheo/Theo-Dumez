$(".pages.home").ready(function() {
  anime({
    targets: '.img-banner-section',
    translateX: 800,
    direction: 'reverse',
    easing: 'easeInOutSine',
    autoplay: true,
    duration: 1000
  });
  // Wrap every letter in a span
  var textWrapper = document.querySelector('.ml12');
  textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

  anime.timeline({})
    .add({
      targets: '.ml12 .letter',
      translateX: [40,0],
      translateZ: 0,
      opacity: [0,1],
      easing: "easeOutExpo",
      duration: 1200,
      delay: (el, i) => 1000 + 30 * i
    });

  anime.timeline({})
    .add({
      targets: '.rotating-text-word',
      translateX: [40,0],
      translateZ: 0,
      opacity: [0,1],
      easing: "easeOutExpo",
      duration: 1200,
      delay: (el, i) => 1000 + 30 * i
    });

  anime.timeline({})
    .add({
      targets: '.rouge-font',
      translateX: [40,0],
      translateZ: 0,
      opacity: [0,1],
      easing: "easeOutExpo",
      duration: 1200,
      delay: (el, i) => 1000 + 30 * i
    });

  // bleu cercle
  function randomValues() {
    anime({
      targets: '.bleu-cercle-banner',
      translateX: function() {
        return anime.random(0, 270);
      },
      easing: 'easeInOutQuad',
      duration: 750,
      complete: randomValues
    });
  }

  randomValues();
});