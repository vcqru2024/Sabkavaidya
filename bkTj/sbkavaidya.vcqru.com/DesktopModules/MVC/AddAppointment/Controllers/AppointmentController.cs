/*
' Copyright (c) 2024 dipak tiwari
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
*/

using DotNetNuke.Entities.Users;
using DotNetNuke.Framework.JavaScriptLibraries;
using DotNetNuke.Web.Mvc.Framework.ActionFilters;
using DotNetNuke.Web.Mvc.Framework.Controllers;
using Saatvik.Modules.AddAppointment.Components;
using Saatvik.Modules.AddAppointment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace Saatvik.Modules.AddAppointment.Controllers
{
    [DnnHandleError]
    public class AppointmentController : DnnController
    {
        public ActionResult Delete(int appointmentId)
        {
            AppointmentManager.Instance.DeleteAppointment(appointmentId, ModuleContext.ModuleId);
            return RedirectToDefaultRoute();
        }

        public ActionResult Index(int appointmentId = -1)
        {
            DotNetNuke.Framework.JavaScriptLibraries.JavaScript.RequestRegistration(CommonJs.DnnPlugins);

            // Replace the user list with the doctor list
            var doctorList = AppointmentManager.Instance.GetDoctorList();
            var doctors = doctorList.Select(doctor => new SelectListItem { Text = doctor.Name, Value = doctor.DoctorId.ToString() });

            ViewBag.Doctors = doctors;

            var appointment = (appointmentId == -1)
                 ? new AppointmentBooking { ModuleId = ModuleContext.ModuleId }
                 : AppointmentManager.Instance.GetAppointment(appointmentId, ModuleContext.ModuleId);

            return View(appointment);
        }

        [HttpPost]
        [DotNetNuke.Web.Mvc.Framework.ActionFilters.ValidateAntiForgeryToken]
        [ModuleAction(ControlKey = "Edit", TitleKey = "AddAppointment")]
        public ActionResult Edit()
        {
            var user = UserController.Instance.GetCurrentUserInfo();
            var appointments = AppointmentManager.Instance.GetAppointments(ModuleContext.ModuleId, user, ModuleContext.Configuration);
            return View(appointments);
        }

        

        [HttpPost]
        [DotNetNuke.Web.Mvc.Framework.ActionFilters.ValidateAntiForgeryToken]
        public ActionResult Index(AppointmentBooking appointment)
        {
            if (appointment.AppointmentId == -1)
            {
                appointment.CreatedByUserId = User.UserID;
                appointment.CreatedOnDate = DateTime.UtcNow;
                appointment.LastModifiedByUserId = User.UserID;
                appointment.LastModifiedOnDate = DateTime.UtcNow;

                AppointmentManager.Instance.CreateAppointment(appointment);
            }
            else
            {
                var existingAppointment = AppointmentManager.Instance.GetAppointment(appointment.AppointmentId, appointment.ModuleId);
                existingAppointment.LastModifiedByUserId = User.UserID;
                existingAppointment.LastModifiedOnDate = DateTime.UtcNow;
                existingAppointment.PatientName = appointment.PatientName;
                existingAppointment.PatientPhone = appointment.PatientPhone;
                existingAppointment.DoctorId = appointment.DoctorId;
                existingAppointment.DoctorName = appointment.DoctorName;
                existingAppointment.AppointmentDate = appointment.AppointmentDate;
                existingAppointment.AppointmentTime = appointment.AppointmentTime;
                existingAppointment.IsApproved = appointment.IsApproved;

                AppointmentManager.Instance.UpdateAppointment(existingAppointment);
            }

            return RedirectToDefaultRoute();
        }
    }
}
