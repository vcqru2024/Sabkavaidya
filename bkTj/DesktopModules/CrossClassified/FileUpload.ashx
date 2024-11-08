<%@ WebHandler Language="C#" Class="Cross.Modules.CP_Product.SilverlightFileUpload.FileUpload" %>
// see License.txt
using System;
using System.Web;
using Cross.DNN.Common.SilverlightUpload;
namespace Cross.Modules.CP_Product.SilverlightFileUpload
{
    public class FileUpload : IHttpHandler
    {
        private HttpContext ctx;
        public void ProcessRequest(HttpContext context)
        {
            ctx = context;
            string allowedExtensions = string.Empty;
            foreach (var item in DotNetNuke.Entities.Host.Host.AllowedExtensionWhitelist.AllowedExtensions)
            {
                 allowedExtensions = allowedExtensions + item + ",";
            }
            FileUploadProcess fileUpload = new FileUploadProcess(DotNetNuke.Common.Globals.ApplicationMapPath + "\\DesktopModules\\CrossClassified\\Temp\\",
                allowedExtensions);
            fileUpload.FileUploadCompleted += new FileUploadCompletedEvent(fileUpload_FileUploadCompleted);
            fileUpload.ProcessRequest(context);


        }

        void fileUpload_FileUploadCompleted(object sender, FileUploadCompletedEventArgs args)
        {

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}