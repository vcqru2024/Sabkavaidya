using Cross.Modules.CP_Product.Business;
using DotNetNuke.Common;
using DotNetNuke.Services.Localization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace Cross.Modules.CP_Product.View
{
    public partial class AccountLink : CPModuleBase
    {
        protected bool ShowAuction
        {
            get
            {
                if ((from p in Cache_TypeList where p.ListingType == Convert.ToInt16(ListingType.Auction) select p).ToList().Count > 0
                    && Settings_Portal.Feature.EnableAuction && Settings_AccountLink.General.ShowAuction)
                {
                    return true;
                }
                return false;
            }
        }
        public Setting_AccountLink Settings_AccountLink;

        override protected void OnInit(EventArgs e)
        {
            Settings_AccountLink = new Setting_AccountLink(ModuleId, TabId, ModuleConfiguration.ModuleSettings);
            base.OnInit(e);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.LocalResourceFile = Localization.GetResourceFile(this, "AccountLink.ascx");

            if (!IsPostBack)
            {
                lblCart.Text = Localization.GetString("lblCart", LocalResourceFile);
                if (UserId == -1)
                {
                    lblCart.Text += "(0)";
                    string returnUrl = HttpContext.Current.Request.RawUrl;
                    if (returnUrl.IndexOf("?returnurl=") != -1)
                    {
                        returnUrl = returnUrl.Substring(0, returnUrl.IndexOf("?returnurl="));
                    }
                    returnUrl = HttpUtility.UrlEncode(returnUrl);
                    string loginUrl = DotNetNuke.Common.Globals.LoginURL(returnUrl, Request.QueryString["override"] != null);

                    hlCart.NavigateUrl = loginUrl;
                    hlOrder.NavigateUrl = loginUrl;
                    hlProduct.NavigateUrl = loginUrl;
                    hlAuction.NavigateUrl = loginUrl;
                    hlAccount.NavigateUrl = loginUrl;

                    hlCart.Target = "_self";
                    hlOrder.Target = "_self";
                    hlAuction.Target = "_self";
                    hlAccount.Target = "_self";
                    hlProduct.Target = "_self";

                }
                else
                {
                    //first set to default value
                    int pageId = Settings_Portal.General.ModulePage_Admin;
                    int moduleId = Settings_Portal.General.ModuleId_Admin;

                    if (SupportsContentLocalization)//netural culture code =""
                    {
                        List<Cross.Modules.CP_Content.Business.PageInfo> pages =
               Cross.Modules.CP_Content.Business.PageController.GetByCulture(PortalId, PortalSettings.ActiveTab.CultureCode).ToList();

                        if (pages.Count > 0)//find out the module page for current culture
                        {
                            if (pages[0].ModulePage_Buyer > 0)
                            {
                                pageId = pages[0].ModulePage_Buyer;
                                moduleId = pages[0].ModuleId_Buyer;
                            }
                        }
                    }
                    else
                    {
                        if (Settings_Portal.General.ModulePage_Buyer > 0)//split into different parts
                        {
                            pageId = Settings_Portal.General.ModulePage_Buyer;
                            moduleId = Settings_Portal.General.ModuleId_Buyer;
                        }
                    }

                    hlCart.NavigateUrl = Globals.NavigateURL(pageId, "", "mid=" + moduleId,
                 "ctl=UserBuyer_Cart");

                    lblCart.Text += " (" + CartController.GetByClient(UserId, -1, PortalId).Count.ToString() + ")";
                    hlOrder.NavigateUrl = Globals.NavigateURL(pageId, "", "mid=" + moduleId,
                 "ctl=UserBuyer_Order");

                    hlProduct.NavigateUrl = Globals.NavigateURL(pageId, "", "mid=" + moduleId,
              "ctl=UserBuyer_Product");

                    hlAuction.NavigateUrl = Globals.NavigateURL(pageId, "", "mid=" + moduleId,
             "ctl=UserBuyer_Auction");

                    hlAccount.NavigateUrl = Globals.NavigateURL(pageId);

                    hlCart.Target = Settings_AccountLink.General.Target;
                    hlOrder.Target = Settings_AccountLink.General.Target;
                    hlProduct.Target = Settings_AccountLink.General.Target;
                    hlAuction.Target = Settings_AccountLink.General.Target;
                    hlAccount.Target = Settings_AccountLink.General.Target;

                }

                hlHelp.NavigateUrl = Globals.NavigateURL(Settings_Portal.General.ModulePage_Help);
                hlHelp.Target = Settings_AccountLink.General.Target;
                DataBind();
            }
        }
    }
}

