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

using DotNetNuke.Entities.Portals; // Add this using directive
using DotNetNuke.Entities.Users;
using DotNetNuke.Framework.JavaScriptLibraries;
using DotNetNuke.Web.Mvc.Framework.ActionFilters;
using DotNetNuke.Web.Mvc.Framework.Controllers;
using Saatvik.Modules.AddDisease.Components;
using Saatvik.Modules.AddDisease.Models;
using System;
using System.Linq;
using System.Web.Mvc;
using DotNetNuke.Entities.Tabs;
using DotNetNuke.Web.Mvc.Helpers;
using DotNetNuke.Collections;




namespace Saatvik.Modules.AddDisease.Controllers
{
    [DnnHandleError]
    public class DiseaseController : DnnController
    {
        public ActionResult Delete(int diseaseId)
        {
            DiseaseManager.Instance.DeleteDisease(diseaseId, ModuleContext.ModuleId);
            return RedirectToDefaultRoute();
        }

        public ActionResult Edit(int diseaseId = -1)
        {
            DotNetNuke.Framework.JavaScriptLibraries.JavaScript.RequestRegistration(CommonJs.DnnPlugins);

            var disease = (diseaseId == -1)
                ? new Disease { ModuleId = ModuleContext.ModuleId }
                : DiseaseManager.Instance.GetDisease(diseaseId, ModuleContext.ModuleId);

            return View(disease);
        }

        [HttpPost]
        [DotNetNuke.Web.Mvc.Framework.ActionFilters.ValidateAntiForgeryToken]
        public ActionResult Edit(Disease disease)
        {
            if (disease.DiseaseId == -1)
            {
                disease.CreatedByUserId = User.UserID;
                disease.CreatedOnDate = DateTime.UtcNow;
                disease.LastModifiedByUserId = User.UserID;
                disease.LastModifiedOnDate = DateTime.UtcNow;

                DiseaseManager.Instance.CreateDisease(disease);
            }
            else
            {
                var existingDisease = DiseaseManager.Instance.GetDisease(disease.DiseaseId, disease.ModuleId);
                existingDisease.LastModifiedByUserId = User.UserID;
                existingDisease.LastModifiedOnDate = DateTime.UtcNow;
                existingDisease.DiseaseName = disease.DiseaseName;
                existingDisease.DiseaseDescription = disease.DiseaseDescription;

                DiseaseManager.Instance.UpdateDisease(existingDisease);
            }

            return RedirectToDefaultRoute();
        }

        [ModuleAction(ControlKey = "Edit", TitleKey = "AddDisease")]
        public ActionResult Index()
        {
            var diseases = DiseaseManager.Instance.GetDiseases(ModuleContext.ModuleId);
            return View(diseases);
        }

        public ActionResult Descriptive(int diseaseId)
        {
            var disease = DiseaseManager.Instance.GetDisease(diseaseId, ModuleContext.ModuleId);
            if (disease == null)
            {
                return HttpNotFound();
            }

            return View(disease);
        }
    }
}
