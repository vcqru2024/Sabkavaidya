// scripts.js
document.addEventListener('DOMContentLoaded', function () {
    var accordionToggles = document.querySelectorAll('.accordion-toggle');

    accordionToggles.forEach(function (toggle) {
        toggle.addEventListener('click', function () {
            // Close all other open accordions
            accordionToggles.forEach(function (otherToggle) {
                if (otherToggle !== toggle) {
                    var otherContent = otherToggle.nextElementSibling;
                    otherContent.style.display = 'none';
                }
            });

            // Toggle the clicked accordion
            var content = this.nextElementSibling;
            if (content.style.display === 'block') {
                content.style.display = 'none';
            } else {
                content.style.display = 'block';
            }
        });
    });
});


function updateMainImage(src) {
    document.getElementById('mainImage').src = src;
}