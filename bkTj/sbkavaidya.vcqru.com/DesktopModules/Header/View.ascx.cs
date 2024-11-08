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
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using System;
using System.Web;

namespace Saatvik.Modules.Header
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The View class displays the content
    /// 
    /// Typically your view control would be used to display content or functionality in your module.
    /// 
    /// View may be the only control you have in your project depending on the complexity of your module
    /// 
    /// Because the control inherits from HeaderModuleBase you have access to any custom properties
    /// defined there, as well as properties from DNN such as PortalId, ModuleId, TabId, UserId and many more.
    /// 
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class View : HeaderModuleBase, IActionable
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    LoadContent();
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }
        private void LoadContent()
        {
            // Retrieve content from module settings
            string contentTitle = ModuleContext.Settings["ContentTitle"]?.ToString();
            string ContentTitle1 = ModuleContext.Settings["ContentTitle1"]?.ToString();
            string contentDescription = ModuleContext.Settings["ContentDescription"]?.ToString();
            string ContentDescription1 = ModuleContext.Settings["ContentDescription1"]?.ToString();
            string ButtonText = ModuleContext.Settings["ButtonText"]?.ToString();
            string ButtonText1 = ModuleContext.Settings["ButtonText1"]?.ToString();
            string ButtonText2 = ModuleContext.Settings["ButtonText2"]?.ToString();
            string ButtonText3 = ModuleContext.Settings["ButtonText3"]?.ToString();
            string ButtonText4 = ModuleContext.Settings["ButtonText4"]?.ToString();
            string ButtonUrl = ModuleContext.Settings["ButtonUrl"]?.ToString();
            string ButtonUrl1 = ModuleContext.Settings["ButtonUrl1"]?.ToString();
            string ButtonUrl2 = ModuleContext.Settings["ButtonUrl2"]?.ToString();
            string ButtonUrl3= ModuleContext.Settings["ButtonUrl3"]?.ToString();
            string ButtonUrl4 = ModuleContext.Settings["ButtonUrl4"]?.ToString();
            string imagePath = ModuleContext.Settings["ImagePath"]?.ToString();
            string imagePath1 = ModuleContext.Settings["ImagePath1"]?.ToString();
            string imagePath2 = ModuleContext.Settings["ImagePath2"]?.ToString();
            string imagePath3 = ModuleContext.Settings["ImagePath3"]?.ToString();
            string imagePath4 = ModuleContext.Settings["ImagePath4"]?.ToString();






            // Set content to the placeholders
            ContentTitleLiteral.Text = contentTitle;
            ContentTitle1Literal.Text = ContentTitle1;
            ContentDescriptionLiteral.Text = contentDescription;
            ContentDescription1Literal.Text = ContentDescription1;
            
            ContentTitleLiteral.Text = contentTitle;
            ContentTitleLiteral.Text = contentTitle;
            
            if (!string.IsNullOrEmpty(imagePath))
            {
                ContentImage.ImageUrl = ResolveUrl(imagePath);
                ContentImage.Visible = true;
            }
            else
            {
                ContentImage.Visible = false;
            }
        }
        public ModuleActionCollection ModuleActions
        {
            get
            {
                var actions = new ModuleActionCollection
                    {
                        {
                            GetNextActionID(), Localization.GetString("EditModule", LocalResourceFile), "", "", "",
                            EditUrl(), false, SecurityAccessLevel.Edit, true, false
                        }
                    };
                return actions;
            }
        }
    }
}