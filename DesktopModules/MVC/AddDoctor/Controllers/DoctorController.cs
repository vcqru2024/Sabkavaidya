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
using Saatvik.Modules.AddDoctor.Components;
using Saatvik.Modules.AddDoctor.Models;
using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Saatvik.Modules.AddDoctor.Controllers
{
    [DnnHandleError]
    public class DoctorController : DnnController
    {

        public ActionResult Delete(int doctorId)
        {
            DoctorManager.Instance.DeleteDoctor(doctorId, ModuleContext.ModuleId);
            return RedirectToDefaultRoute();
        }



        public ActionResult Edit(int doctorId = -1)
        {
            DotNetNuke.Framework.JavaScriptLibraries.JavaScript.RequestRegistration(CommonJs.DnnPlugins);

            var doctorModel = (doctorId == -1)
                 ? new Doctor { ModuleId = ModuleContext.ModuleId }
                 : DoctorManager.Instance.GetDoctor(doctorId, ModuleContext.ModuleId);

            return View(doctorModel);
        }

        [HttpPost]
        [DotNetNuke.Web.Mvc.Framework.ActionFilters.ValidateAntiForgeryToken]
        public ActionResult Edit(Doctor doctorModel, HttpPostedFileBase file)
        {
            // Check if the ModelState is valid
            if (!ModelState.IsValid)
            {
                return View(doctorModel);
            }

            // Process the image upload
            if (file != null && file.ContentLength > 0)
            {
                // Create the folder path if it doesn't exist
                string imgPath = Server.MapPath("~/Portals/0/Restaurant/");
                if (!Directory.Exists(imgPath))
                {
                    Directory.CreateDirectory(imgPath);
                }

                // Save the uploaded image to the Portals/0/Restaurant/ folder
                var fileName = Path.GetFileName(file.FileName);
                var filePath = Path.Combine(imgPath, fileName);
                file.SaveAs(filePath);

                // Set the ImageUrl property in the doctorModel
                doctorModel.ImageUrl = $"~/Portals/0/Restaurant/{fileName}";
            }

            // Process the doctorModel based on whether it's a new doctor or an existing one
            if (doctorModel.DoctorId == -1)
            {
                // Logic for creating a new doctor
                doctorModel.CreatedByUserId = User.UserID;
                doctorModel.CreatedOnDate = DateTime.UtcNow;
                doctorModel.LastModifiedByUserId = User.UserID;
                doctorModel.LastModifiedOnDate = DateTime.UtcNow;

                DoctorManager.Instance.CreateDoctor(doctorModel);
            }
            else
            {
                // Logic for updating an existing doctor
                var existingDoctorModel = DoctorManager.Instance.GetDoctor(doctorModel.DoctorId, doctorModel.ModuleId);
                existingDoctorModel.LastModifiedByUserId = User.UserID;
                existingDoctorModel.LastModifiedOnDate = DateTime.UtcNow;
                existingDoctorModel.Name = doctorModel.Name;
                existingDoctorModel.ImageUrl = doctorModel.ImageUrl;
                existingDoctorModel.Rating = doctorModel.Rating;
                existingDoctorModel.Degree = doctorModel.Degree;
                existingDoctorModel.Experience = doctorModel.Experience;
                existingDoctorModel.Location = doctorModel.Location;

                DoctorManager.Instance.UpdateDoctor(existingDoctorModel);
            }

            // Redirect to the default route after processing the form data
            return RedirectToDefaultRoute();
        }
        [ModuleAction(ControlKey = "Edit", TitleKey = "AddDoctor")]
        public ActionResult Index(int page = 1)
        {
            var pageSize = ModuleContext.Settings["SaatvikDoctorModule_PageSize"] != null
                ? Convert.ToInt32(ModuleContext.Settings["SaatvikDoctorModule_PageSize"])
                : 10;

            // Assuming you have a total count of doctors, you can calculate the total pages
            var totalDoctors = DoctorManager.Instance.GetTotalDoctors(ModuleContext.ModuleId);
            var totalPages = (int)Math.Ceiling((double)totalDoctors / pageSize);

            var doctorModels = DoctorManager.Instance.GetDoctors(ModuleContext.ModuleId);

            // Pagination logic
            var viewModel = new DoctorIndexViewModel
            {
                Doctors = doctorModels,
                PageNumber = page,
                PageSize = pageSize,
                TotalPages = totalPages
            };

            return View(viewModel);
        }

    }
}
