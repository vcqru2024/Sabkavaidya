using Cross.Modules.CP_Product.Business;
using DotNetNuke.Common;
using DotNetNuke.Services.Localization;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Cross.Modules.CP_Product.View
{
    public partial class Author : CPModuleBase
    {
        public Setting_Author Settings_Author;

        override protected void OnInit(EventArgs e)
        {
            Settings_Author = new Setting_Author(ModuleId, TabId, ModuleConfiguration.ModuleSettings);
            if (Settings_Author.General.TypeId == -1)
            {
                Settings_Author = new Setting_Author(ModuleId, TabId);
            }
            base.OnInit(e);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LocalResourceFile = Localization.GetResourceFile(this, "Author.ascx");
                List<UserInfo> list = UserController.GetByType(Settings_Author.General.TypeId);

                //process localization
                foreach (var item in list)
                {
                    LocalizeObject_User(item);
                }

                if (Settings_Author.General.SortFiled.ToLower() == "authorname")
                {
                    var authorList = from p in list orderby p.DisplayName select p;
                    dlAuthor.DataSource = authorList;
                }

                dlAuthor.DataBind();

            }
        }


        protected string GetAuthorAvatar(string userId, string avartarEmail)
        {
            //first we take site avartar
            DotNetNuke.Entities.Users.UserInfo objUser = DotNetNuke.Entities.Users.UserController.GetUserById(PortalId, Convert.ToInt32(userId));
            if (objUser != null)
            {
                if (!string.IsNullOrEmpty(objUser.Profile.PhotoURL))
                {
                    return objUser.Profile.PhotoURL;
                }
            }
            return GetGravatarUrl(avartarEmail, "32");
        }
        protected string GetNavigate(string userId)
        {
            int tab = TabId;
            if(Settings_Author.General.VendorLinkTarget==LocalUtils.VendorLinkTarget_List)
            {
                tab = GetSubModulePageId_List(Settings_Author.General.ProductListPage, Settings_Author.General.TypeId);
            }
            else
            {
                tab = GetSubModulePageId_VendorProfile(Settings_Author.General.VendorProfilePage, Settings_Author.General.TypeId);
            }

            return Globals.NavigateURL(tab, "", "ProductUserId=" + userId + "&ProductTypeId=" + Settings_Author.General.TypeId);

        }
        protected string GetRssUrl(string userId)
        {
            return FullDomainName + "/DesktopModules/CrossClassified/ProductRss.aspx?ProductUserId="
                + userId + "&ProductTypeId=" + Settings_Author.General.TypeId
                 + "&tabid=" + TabId.ToString();
        }
    }

}

