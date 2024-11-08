/*
' Copyright (c) 2024  Vcqru.com
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
*/


using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using System;

namespace Saatvik.Modules.Header
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The EditHeader class is used to manage content
    /// 
    /// Typically your edit control would be used to create new content, or edit existing content within your module.
    /// The ControlKey for this control is "Edit", and is defined in the manifest (.dnn) file.
    /// 
    /// Because the control inherits from HeaderModuleBase you have access to any custom properties
    /// defined there, as well as properties from DNN such as PortalId, ModuleId, TabId, UserId and many more.
    /// 
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class Edit : HeaderModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (ModuleContext.Settings["ContentTitle"] != null)
                    {
                        TitleTextBox.Text = ModuleContext.Settings["ContentTitle"].ToString();
                    }
                    if (ModuleContext.Settings["ContentDescription"] != null)
                    {
                        DescriptionTextBox.Text = ModuleContext.Settings["ContentDescription"].ToString();
                    }
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            ModuleController controller = new ModuleController();
            controller.UpdateModuleSetting(ModuleId, "ContentTitle", TitleTextBox.Text);
            controller.UpdateModuleSetting(ModuleId, "ContentDescription", DescriptionTextBox.Text);
            if (ImageUpload.HasFile)
            {
                string fileName = ImageUpload.FileName;
                string filePath = Server.MapPath("~/Portals/" + PortalId + "/" + fileName);
                ImageUpload.SaveAs(filePath);
                controller.UpdateModuleSetting(ModuleId, "ImagePath", "~/Portals/" + PortalId + "/" + fileName);
            }
        }
    }
}