using Cross.Modules.CP_Product.Business;
using DotNetNuke.Common;
using DotNetNuke.Services.Localization;
using System;
using System.Collections.Generic;
namespace Cross.Modules.CP_Product.View
{
    public partial class ManufacturerList : CPModuleBase
    {
        public Setting_Manufacturer Settings_Manufacturer;

        override protected void OnInit(EventArgs e)
        {
            Settings_Manufacturer = new Setting_Manufacturer(ModuleId, TabId, ModuleConfiguration.ModuleSettings);
            if (Settings_Manufacturer.General.TypeId == -1)
            {
                Settings_Manufacturer = new Setting_Manufacturer(ModuleId, TabId);
            }
            base.OnInit(e);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            this.LocalResourceFile = Localization.GetResourceFile(this, "ManufacturerList.ascx");
            if (!IsPostBack)
            {
                int total = 0;
                List<ManufacturerInfo> manufacturerList = new List<ManufacturerInfo>();
                if (string.IsNullOrEmpty(Settings_Manufacturer.General.ManufacturerList))
                {
                    manufacturerList = ManufacturerController.GetByType(Settings_Manufacturer.General.TypeId, 5000, 0, ref total);
                }
                else
                {
                    foreach (var item in Settings_Manufacturer.General.ManufacturerList.Split(','))
                    {
                        if (ManufacturerController.Get(Convert.ToInt32(item)) != null)
                        {
                            manufacturerList.Add(ManufacturerController.Get(Convert.ToInt32(item)));
                        }
                    }

                }

                foreach (var item in manufacturerList)
                {
                    LocalizeObject_Manufacturer(item);
                }
                dlManufacturer.DataSource = manufacturerList;
                dlManufacturer.DataBind();

            }
        }

        protected string GetRssUrl(string manufacturerId)
        {
            return FullDomainName + "/DesktopModules/CrossClassified/ProductRss.aspx?ProductManufacturerId="
                + manufacturerId + "&ProductTypeId="
                + Settings_Manufacturer.General.TypeId.ToString() + "&tabid=" + TabId.ToString();
        }

        protected string GetNavigate(string manufacturerId)
        {

            int tab = GetSubModulePageId_List(Settings_Manufacturer.General.ProductListPage, Settings_Manufacturer.General.TypeId);

            return Globals.NavigateURL(tab, "", "ProductManufacturerId=" + manufacturerId, "ProductTypeId=" + Settings_Manufacturer.General.TypeId.ToString());
        }
    }
}

