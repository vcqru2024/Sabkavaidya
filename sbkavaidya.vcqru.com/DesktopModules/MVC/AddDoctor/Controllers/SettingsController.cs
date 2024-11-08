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

using DotNetNuke.Collections;
using DotNetNuke.Security;
using DotNetNuke.Web.Mvc.Framework.ActionFilters;
using DotNetNuke.Web.Mvc.Framework.Controllers;
using System;
using System.Web.Mvc;

namespace Saatvik.Modules.AddDoctor.Controllers
{
    [DnnModuleAuthorize(AccessLevel = SecurityAccessLevel.Edit)]
    [DnnHandleError]
    public class SettingsController : DnnController
    {
        /// <summary>
        /// Retrieves module settings.
        /// </summary>
        [HttpGet]
        public ActionResult Settings()
        {
            var settings = new Models.Settings();
            settings.PageSize = Convert.ToInt32(ModuleContext.Configuration.ModuleSettings.GetValueOrDefault("SaatvikDoctorModule_PageSize", 10));

            return View(settings);
        }

        /// <summary>
        /// Updates module settings.
        /// </summary>
        [HttpPost]
        [ValidateInput(false)]
        [DotNetNuke.Web.Mvc.Framework.ActionFilters.ValidateAntiForgeryToken]
        public ActionResult Settings(Models.Settings settings)
        {
            // Validate and handle the PageSize setting
            if (settings.PageSize <= 0)
            {
                ModelState.AddModelError("PageSize", "Page Size must be greater than 0.");
                return View(settings);
            }

            ModuleContext.Configuration.ModuleSettings["SaatvikDoctorModule_PageSize"] = settings.PageSize.ToString();

            return RedirectToDefaultRoute();
        }
    }
}