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
using Saatvik.Modules.AddServices.Models;
using System;
using System.Web.Mvc;

namespace Saatvik.Modules.AddServices.Controllers
{
    [DnnModuleAuthorize(AccessLevel = SecurityAccessLevel.Edit)]
    [DnnHandleError]
    public class SettingsController : DnnController
    {
        /// <summary>
        /// Displays the settings form.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Settings()
        {
            var settings = GetSettings();
            return View(settings);
        }

        /// <summary>
        /// Handles the form submission for updating settings.
        /// </summary>
        /// <param name="settings">The updated settings.</param>
        /// <returns></returns>
        [HttpPost]
        [ValidateInput(false)]
        [DotNetNuke.Web.Mvc.Framework.ActionFilters.ValidateAntiForgeryToken]
        public ActionResult Settings(Settings settings)
        {
            UpdateSettings(settings);

            return RedirectToDefaultRoute();
        }

        // Implement these methods based on your data retrieval and storage logic
        private Settings GetSettings()
        {
            // Replace this with actual logic to retrieve settings
            return new Settings
            {
                IsActive = ModuleContext.Configuration.ModuleSettings.GetValueOrDefault("AddServices_IsActive", false)
            };
        }

        private void UpdateSettings(Settings settings)
        {
            // Replace this with actual logic to update settings
            ModuleContext.Configuration.ModuleSettings["AddServices_IsActive"] = settings.IsActive.ToString();
        }
    }
}
