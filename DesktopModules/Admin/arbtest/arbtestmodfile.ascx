<%@ Control Language="C#" ClassName="Admin.arbtest" Inherits="DotNetNuke.Entities.Modules.PortalModuleBase" %>
using Microsoft.AspNetCore.Mvc;
using System.Net.Mail;
using System.Threading.Tasks;


<script runat="server">

</script>
<!-- header -->
<div class="hero">
<div class="container-fluid">
<div class="row">
<div class="col-lg-8 col-xl-8 col-xxl-8 d-flex">
<div class="banner"><a href="/Surgical-icons"><img alt="nainu" class="img-fluid" src="/portals/0/Web_banner1.jpg?ver=pKSptbotX7ClaUm5qGrfaA%3d%3d" /></a></div>
</div>

<div class="col-lg-4 col-xl-4 col-xxl-4 d-flex">
<div class="card-appointment" style="width:100%">
<h5>Book an appointment</h5>

<p>Simply enter your text and choose the case you want to convert it to.</p>

<div class="g-3 row">
<div class="col-6 col-lg-6 col-md-3 d-flex">
<div class="appointment-icons" style="background-color:#7ec14366"><img alt="Video" src="/portals/0/Frame 22_1.png?ver=Nm33E6T46kIZssNJVi4_Uw%3d%3d" /> <button class="btn stretched-link" type="button" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal">Video</button></div>
</div>

<div class="col-6 col-lg-6 col-md-3 d-flex">
<div class="appointment-icons" style="background-color:#27b0d266"><img alt="Chat" src="/portals/0/Frame 23.png?ver=Nm33E6T46kIZssNJVi4_Uw%3d%3d" /> <button class="btn stretched-link" type="button" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal">Chat</button></div>
</div>

<div class="col-6 col-lg-6 col-md-3 d-flex">
<div class="appointment-icons" style="background-color:#27b0d266"><img alt="Telephonic" src="/portals/0/Frame 24.png?ver=_HjELGbS5lINfV5gajaggw%3d%3d" /> <button class="btn stretched-link" type="button" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal">Telephonic</button></div>
</div>

<div class="col-6 col-lg-6 col-md-3 d-flex">
<div class="appointment-icons" style="background-color:#7ec14366"><img alt="Offline" src="/portals/0/Frame 25.png?ver=Nm33E6T46kIZssNJVi4_Uw%3d%3d" /> <button class="btn stretched-link" type="button" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal">Offline</button></div>
</div>
</div>
</div>
</div>
</div>
</div>
<!-- Modal -->

<div class="fade modal" id="exampleModal">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">
<div class="modal-header">
<h5>Book an Appointment</h5>
</div>
<div class="modal-body">
 <form id="appointmentForm">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="phone">Phone:</label>
        <input type="tel" id="phone" name="phone" required><br><br>
        
        <label for="date">Appointment Date:</label>
        <input type="date" id="date" name="date" required><br><br>
        
        <button type="submit">Book Appointment</button>
    </form>
    </div>
</div>
</div>
</div>
</div>
<!-- end -->
<script>
    // formHandler.js

    document.getElementById('appointmentForm').addEventListener('submit', function (event) {
        event.preventDefault();

        const formData = new FormData(this);

        fetch('/api/appointments', {
            method: 'POST',
            body: JSON.stringify(Object.fromEntries(formData)),
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => response.text())
            .then(data => {
                alert('Appointment booked successfully. Check your email for confirmation.');
            })
            .catch(error => {
                console.error('Error:', error);
                alert('There was an error booking your appointment. Please try again.');
            });
    });

</script>
