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
using DotNetNuke.Entities.Users;
using DotNetNuke.Framework.JavaScriptLibraries;
using DotNetNuke.Web.Mvc.Framework.ActionFilters;
using DotNetNuke.Web.Mvc.Framework.Controllers;
using Saatvik.Modules.AddServices.Components;
using Saatvik.Modules.AddServices.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace Saatvik.Modules.AddServices.Controllers
{
    [DnnHandleError]
    public class ServiceController : DnnController
    {
        public ActionResult Delete(int serviceId)
        {
            ServiceManager.Instance.DeleteService(serviceId, ModuleContext.ModuleId);
            return RedirectToDefaultRoute();
        }

        public ActionResult Edit(int serviceId = -1)
        {
            DotNetNuke.Framework.JavaScriptLibraries.JavaScript.RequestRegistration(CommonJs.DnnPlugins);

            var service = (serviceId == -1)
                 ? new Service { ModuleId = ModuleContext.ModuleId }
                 : ServiceManager.Instance.GetService(serviceId, ModuleContext.ModuleId);

            return View(service);
        }

        [HttpPost]
        [DotNetNuke.Web.Mvc.Framework.ActionFilters.ValidateAntiForgeryToken]
        public ActionResult Edit(Service service)
        {
            if (service.ServiceId == -1)
            {
                service.CreatedByUserId = User.UserID;
                service.CreatedOnDate = DateTime.UtcNow;
                service.LastModifiedByUserId = User.UserID;
                service.LastModifiedOnDate = DateTime.UtcNow;

                ServiceManager.Instance.CreateService(service);
            }
            else
            {
                var existingService = ServiceManager.Instance.GetService(service.ServiceId, service.ModuleId);
                existingService.LastModifiedByUserId = User.UserID;
                existingService.LastModifiedOnDate = DateTime.UtcNow;
                existingService.ServiceName = service.ServiceName;
                existingService.ServiceDescription = service.ServiceDescription;
                existingService.IsActive = service.IsActive;

                ServiceManager.Instance.UpdateService(existingService);
            }

            return RedirectToDefaultRoute();
        }

        [ModuleAction(ControlKey = "Edit", TitleKey = "AddService")]
        public ActionResult Index()
        {
            var settings = new Settings
            {
                IsActive = ModuleContext.Configuration.ModuleSettings.GetValueOrDefault("AddServices_IsActive", false)
            };

            var services = ServiceManager.Instance.GetServices(ModuleContext.ModuleId);
            settings.Services = settings.IsActive ? services.Where(s => s.IsActive) : services;

            return View(settings);
        }


    }
}
