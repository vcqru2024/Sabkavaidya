using Cross.Modules.CP_Product.Business;
using DotNetNuke.Common;
using DotNetNuke.Services.Localization;
using System;
using System.Collections.Generic;

namespace Cross.Modules.CP_Product.View
{
    public partial class TypeList : CPModuleBase
    {
        public Setting_Type Settings_Type;

        override protected void OnInit(EventArgs e)
        {
            Settings_Type = new Setting_Type(ModuleId, TabId, ModuleConfiguration.ModuleSettings);
            base.OnInit(e);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            this.LocalResourceFile = Localization.GetResourceFile(this, "TypeList.ascx");
            if (!IsPostBack)
            {
                List<TypeInfo> list = string.IsNullOrEmpty(Settings_Type.General.TypeList) ? TypeController.GetByPortals(PortalId) :
                    TypeController.GetByList(Settings_Type.General.TypeList);
                foreach (var item in list)
                {
                    LocalizeObject_Type(item);
                }
                dlType.DataSource = list;
                dlType.DataBind();
            }
        }



        protected string GetRssUrl(string typeId)
        {
            return FullDomainName + "/DesktopModules/CrossClassified/ProductRss.aspx?ProductTypeId=" + typeId + "&tabid=" + TabId.ToString();
        }

        protected string GetNavigate(string typeId)
        {
            int tab = GetSubModulePageId_List(Convert.ToInt32(typeId));

            return Globals.NavigateURL(tab, "", "ProductTypeId=" + typeId);

        }
    }

}

