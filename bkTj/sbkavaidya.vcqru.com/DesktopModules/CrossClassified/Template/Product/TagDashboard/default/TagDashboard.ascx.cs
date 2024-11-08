using Cross.Modules.CP_Product.Business;
using DotNetNuke.Common;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
namespace Cross.Modules.CP_Product.View
{
    /// <summary>

    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class TagDashboard : CPModuleBase
    {
        char seprator = '|';//分隔符    
        private string FlashScriptName
        {
            get
            {
                return "CrossImageNavigateScript" + ModuleId.ToString();
            }
        }
        #region Event Handlers
        public Setting_TagDashboard Settings_TagDashboard;

        override protected void OnInit(EventArgs e)
        {
            Settings_TagDashboard = new Setting_TagDashboard(ModuleId, TabId, ModuleConfiguration.ModuleSettings);
            if (Settings_TagDashboard.General.TypeId == -1)
            {
                Settings_TagDashboard = new Setting_TagDashboard(ModuleId, TabId);
            }
            base.OnInit(e);
        }
        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Page_Load runs when the control is loaded
        /// </summary>
        /// <remarks>
        /// </remarks>
        /// <history>
        /// </history>
        /// -----------------------------------------------------------------------------
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                RegisterSwfObject();
                LocalResourceFile = Localization.GetResourceFile(this, "TagDashborad.ascx");
                if (!Page.IsPostBack)
                {
                    BuildTagScript();
                    DataBind();
                }

            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }

        }

        private void BuildTagScript()
        {
            List<TagInfo> list = TagController.GetByType(Settings_TagDashboard.General.TypeId, GetCurrentCultureCode());
              


            if (list.Count < 1)//没有记录
            {
                return;
            }

            int flashHeight = Convert.ToInt32(Settings_TagDashboard.Flash.Height);



            string bgColor = Settings_TagDashboard.Flash.BgColor.Replace("0x", "#");
            string flashFile = DotNetNuke.Common.Globals.ApplicationPath + "/DesktopModules/CrossClassified/Flash/TagCloud.swf";

            int tagLimit = list.Count > Settings_TagDashboard.General.Rows ? Settings_TagDashboard.General.Rows : list.Count;

            var tagList = (from p in list orderby p.ProductCounts descending select p).Take(tagLimit);
            StringBuilder tagCloud = new StringBuilder();
            tagCloud.Append("<tags>");
            int fontSize = tagLimit;
            foreach (TagInfo ti in tagList)
            {
                if (Settings_TagDashboard.General.LinkTarget == "_blank")
                {
                    tagCloud.AppendFormat("<a href='{0}' style='{1}' target='_blank'>{2}</a>", GetNavigate(ti.Id), fontSize.ToString(), ti.Tag);
                }
                else
                {
                    tagCloud.AppendFormat("<a href='{0}' style='{1}'>{2}</a>", GetNavigate(ti.Id), fontSize.ToString(), ti.Tag);
                }
                fontSize = fontSize - 1;//递减fontsize

            }
            tagCloud.Append("</tags>");


            System.Text.StringBuilder sb = new System.Text.StringBuilder();


            //    RegisterSwfObject();
            sb.AppendLine("<script type=\"text/javascript\">");

            sb.AppendFormat("\tvar s{0} = new SWFObject(\"{1}\",\"{2}\",\"{3}\",\"{4}\",\"{5}\");{6}", ModuleId, flashFile, "TagCloud" + ModuleId.ToString(), Settings_TagDashboard.Flash.Width, flashHeight, "10", "\r\n");

            //去掉menu
            sb.AppendFormat("   s{0}.addParam(\"menu\",\"false\");{1}", this.ModuleId, "\r\n");


            sb.AppendFormat("   s{0}.addParam(\"scale\",\"noScale\");{1}", this.ModuleId, "\r\n");

            sb.AppendFormat("   s{0}.addParam(\"wmode\",\"{1}\");{2}", this.ModuleId, Settings_TagDashboard.Flash.WMode, "\r\n");
            sb.AppendFormat("   s{0}.addParam(\"allowScriptAccess\",\"sameDomain\");{1}", this.ModuleId, "\r\n");
            sb.AppendFormat("   s{0}.addParam(\"bgcolor\",\"{1}\");{2}", ModuleId, bgColor, "\r\n");

            sb.AppendFormat("   s{0}.addVariable(\"mode\",\"{1}\");{2}", this.ModuleId, "tags", "\r\n");
            sb.AppendFormat("   s{0}.addVariable(\"distr\",\"{1}\");{2}", this.ModuleId, Settings_TagDashboard.Flash.Distr.ToString().ToLower(), "\r\n");
            sb.AppendFormat("   s{0}.addVariable(\"tcolor\",\"{1}\");{2}", this.ModuleId, Settings_TagDashboard.Flash.Tcolor, "\r\n");

            if (Settings_TagDashboard.Flash.Tcolor2 != "")
            {
                sb.AppendFormat("   s{0}.addVariable(\"tcolor2\",\"{1}\");{2}", this.ModuleId, Settings_TagDashboard.Flash.Tcolor2, "\r\n");

            }
            sb.AppendFormat("   s{0}.addVariable(\"hicolor\",\"{1}\");{2}", this.ModuleId, Settings_TagDashboard.Flash.Hicolor, "\r\n");
            sb.AppendFormat("   s{0}.addVariable(\"tspeed\",\"{1}\");{2}", this.ModuleId, Settings_TagDashboard.Flash.Tspeed, "\r\n");
            sb.AppendFormat("   s{0}.addVariable(\"tagcloud\",\"{1}\");{2}", this.ModuleId, tagCloud.ToString(), "\r\n");

            sb.AppendFormat("   s{0}.write(\"{1}\");{2}", this.ModuleId, flash.ClientID, "\r\n");
            sb.AppendLine("</script>");
            litFlash.Text = sb.ToString();
        }


        protected string GetNavigate(int tagId)
        {
            int tab = GetSubModulePageId_List(Settings_TagDashboard.General.ListTab, Settings_TagDashboard.General.TypeId);

            return Globals.NavigateURL(tab, "", "ProductTagId=" + tagId + "&ProductTypeId=" + Settings_TagDashboard.General.TypeId.ToString());
        }
        private void RegisterSwfObject()
        {
            if (!this.Page.ClientScript.IsClientScriptBlockRegistered("UltraFlashSwfObject"))
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat("<script type=\"text/javascript\" src=\"{0}/Js/swfobject.js\"></script>{1}",
                    DotNetNuke.Common.Globals.ApplicationPath + "/DesktopModules/CrossClassified", "\r\n");
                this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "UltraFlashSwfObject", sb.ToString(), false);
            }
        }


        #endregion


    }
}

