document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('bookAppointmentButton').addEventListener('click', function () {
        var fullName = document.querySelector('input[type="text"]:nth-of-type(1)').value;
        var contactNumber = document.getElementById('Text1').value;
        var diseases = document.querySelector('input[type="text"]:nth-of-type(2)').value;
        var city = document.querySelector('input[type="text"]:nth-of-type(3)').value;

        if (fullName && contactNumber && diseases && city) {
            alert('Appointment booked successfully!');
            // Here you can add an AJAX call to save the appointment data
        } else {
            alert('Please fill all the fields.');
        }
    });
});
