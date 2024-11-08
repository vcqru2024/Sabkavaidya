using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DotNetNuke.Web.Api;

namespace Saatvik.ModulesDieseas.Models
{
    public class RouteMapper : IServiceRouteMapper
    {
        public void RegisterRoutes(IMapRoute mapRouteManager)
        {
            mapRouteManager.MapHttpRoute("Dieseas", "default", "{controller}/{action}", new[]
            { "Saatvik.ModulesDieseas.Models" });
        }
    }
}