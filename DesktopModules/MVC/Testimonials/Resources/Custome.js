$(document).ready(function () {
    $('.owl-carousel').owlCarousel({
        loop: true,
        margin: 10,
        nav: true,
        autoplay: true, // Enable autoplay
        autoplayTimeout: 2000, // Autoplay interval in milliseconds
        autoplayHoverPause: true, // Pause autoplay when hovering over carousel
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 2
            },
            1000: {
                items: 3
            }
        }
    });
});
