$(".pages.home").ready(function() {
	var swiper = new Swiper('.swiper-container', {
		slidesPerView: 'auto',
		centeredSlides: true,
		spaceBetween: 30,
		autoplay: 1,
	    loop: true,
		speed: 3100,
		disableOnInteraction: false,
	});
});