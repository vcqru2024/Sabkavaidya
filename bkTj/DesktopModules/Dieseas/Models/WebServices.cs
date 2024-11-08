using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Users;
using DotNetNuke.Web.Api;
using DotNetNuke.Security;

namespace Saatvik.ModulesDieseas.Models
{
    public class ModuleTaskController : DnnApiController
    {
        [AllowAnonymous]
        [HttpGet]
        public HttpResponseMessage HelloWorld()
        {
            return Request.CreateResponse(HttpStatusCode.OK, "Hello World!");
        }
        [AllowAnonymous]
        [HttpGet]
        public HttpResponseMessage GetDisease(int moduleId)
        {
            try
            {
                var tasks = new DieseasController().GetDisease(moduleId).ToJson();
                return Request.CreateResponse(HttpStatusCode.OK, tasks);
            }
            catch (Exception exc)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, exc);
            }
        }
        public class DieseasToCreateDTO
        {
            public string DTC_DieseasName { get; set; }
            public string DTC_DieseasDescription { get; set; }
            public bool DTC_isActivated { get; set; }
            public int DTC_ModuleID { get; set; }
            public int DTC_UserId { get; set; }
        }
        [DnnModuleAuthorize(AccessLevel = SecurityAccessLevel.View)]
        [ValidateAntiForgeryToken]
        [HttpPost]
        public HttpResponseMessage AddDieseas(DieseasToCreateDTO DTO)
        {
            try
            {
                var dieseas = new Dieseas()
                {
                    DieseasName = DTO.DTC_DieseasName,
                    DieseasDescription = DTO.DTC_DieseasDescription,
                    isActivated = DTO.DTC_isActivated,
                    ModuleId = DTO.DTC_ModuleID,
                    UserId = DTO.DTC_UserId
                };
                DieseasController dc = new DieseasController();
                dc.AddDieseas(dieseas);
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception exc)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, exc);
            }
        }
        public class DiseaseToUpdate
        {
            public string DTU_DiseaseName { get; set; }
            public string DTU_DiseaseDescription { get; set; }
            public bool DTU_IsActivated { get; set; }
            public int DTU_DiseaseID { get; set; }
        }

        [DnnModuleAuthorize(AccessLevel = SecurityAccessLevel.View)]
        [ValidateAntiForgeryToken]
        [HttpPost]
        public HttpResponseMessage UpdateDisease(DiseaseToUpdate DTO)
        {
            try
            {
                var disease = new Dieseas()
                {
                    DieseasName = DTO.DTU_DiseaseName,
                    DieseasDescription = DTO.DTU_DiseaseDescription,
                    isActivated = DTO.DTU_IsActivated,
                    DieseasId = DTO.DTU_DiseaseID
                };
                DieseasController dc = new DieseasController();
                dc.UpdateDisease(disease);
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception exc)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, exc);
            }
        }
        public class DiseaseToDelete
        {
            public int DTD_DiseaseId { get; set; }
        }

        [DnnModuleAuthorize(AccessLevel = SecurityAccessLevel.View)]
        [ValidateAntiForgeryToken]
        [HttpPost]
        public HttpResponseMessage DeleteDisease(DiseaseToDelete DTO)
        {
            try
            {
                var disease = new Dieseas()
                {
                    DieseasId = DTO.DTD_DiseaseId
                };

                DieseasController dc = new DieseasController();
                dc.DeleteDisease(disease.DieseasId);
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception exc)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, exc);
            }
        }
        [AllowAnonymous]
        [HttpGet]
        public HttpResponseMessage GetActivatedDisease(int moduleId)
        {
            try
            {
                var disease = new DieseasController().GetActivatedDisease(moduleId).ToJson();
                return Request.CreateResponse(HttpStatusCode.OK, disease);
            }
            catch (Exception exc)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, exc);
            }

        }
    }
}