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

using DotNetNuke.Data;
using DotNetNuke.Framework;
using Saatvik.Modules.AddServices.Models;
using System.Collections.Generic;

namespace Saatvik.Modules.AddServices.Components
{
    internal interface IServiceManager
    {
        void CreateService(Service service);
        void DeleteService(int serviceId, int moduleId);
        void DeleteService(Service service);
        IEnumerable<Service> GetServices(int moduleId);
        Service GetService(int serviceId, int moduleId);
        void UpdateService(Service service);
    }

    internal class ServiceManager : ServiceLocator<IServiceManager, ServiceManager>, IServiceManager
    {
        public void CreateService(Service service)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Service>();
                rep.Insert(service);
            }
        }

        public void DeleteService(int serviceId, int moduleId)
        {
            var service = GetService(serviceId, moduleId);
            DeleteService(service);
        }

        public void DeleteService(Service service)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Service>();
                rep.Delete(service);
            }
        }

        public IEnumerable<Service> GetServices(int moduleId)
        {
            IEnumerable<Service> services;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Service>();
                services = rep.Find("WHERE ModuleId = @0 AND IsActive = @1", moduleId, true);
            }
            return services;
        }


        public Service GetService(int serviceId, int moduleId)
        {
            Service service;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Service>();
                service = rep.GetById(serviceId, moduleId);
            }
            return service;
        }

        public void UpdateService(Service service)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Service>();
                rep.Update(service);
            }
        }

        protected override System.Func<IServiceManager> GetFactory()
        {
            return () => new ServiceManager();
        }
    }
}
