using Cross.DNN.Common.Utility.TreeHelper;
using Cross.Modules.CP_Product.Business;
using DotNetNuke.Common;
using DotNetNuke.Services.Localization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;


namespace Cross.Modules.CP_Product.View
{
    public partial class CategoryList : CPModuleBase
    {
        public Setting_Category Settings_Category;

        override protected void OnInit(EventArgs e)
        {
            Settings_Category = new Setting_Category(ModuleId, TabId, ModuleConfiguration.ModuleSettings);
            if (Settings_Category.General.TypeId == -1)
            {
                Settings_Category = new Setting_Category(ModuleId, TabId);
            }
            base.OnInit(e);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            this.LocalResourceFile = Localization.GetResourceFile(this, "CategoryList.ascx");
            if (!IsPostBack)
            {
                if (Settings_Category.General.DisplayStyle == LocalUtils.Category_ListStyle_List)
                {
                    tvCategory.Visible = false;
                    dlCategory.Visible = true;

                    List<CategoryInfo> categoryList = new List<CategoryInfo>();
                    if (string.IsNullOrEmpty(Settings_Category.General.CategoryList))
                    {
                        categoryList = (from p in CategoryController.GetByPortals(PortalId) where p.TypeId == Settings_Category.General.TypeId select p).ToList();
                    }
                    else
                    {
                        categoryList = CategoryController.GetByList(Settings_Category.General.CategoryList);
                    }
                    foreach (var item in categoryList)
                    {
                        LocalizeObject_Category(item);
                    }

                    dlCategory.DataSource = categoryList;
                    dlCategory.DataBind();
                }
                else
                {
                    tvCategory.Visible = true;
                    dlCategory.Visible = false;

                    LoadCategories();

                }

            }

        }


        private void LoadCategories()
        {
            tvCategory.ImageSet = RecursiveHelper.GetTreeViewImageSet(Settings_Category.General.TreeViewImageSet);

            List<CategoryInfo> list = (from p in CategoryController.GetByPortals(PortalId) where p.TypeId == Settings_Category.General.TypeId select p).ToList();

            foreach (var item in list)
            {
                LocalizeObject_Category(item);
            }

            List<RecursiveCategoryData> listRecursive = LocalUtils.ConvertCategoryListToRecursiveList(list);
            if (Settings_Category.General.ShowProductCounts)
            {
                for (int i = 0; i < listRecursive.Count; i++)
                {
                    CategoryInfo ci = CategoryController.Get(listRecursive[i].Id);
                    listRecursive[i].Name += " (" + ci.ProductCounts.ToString() + ")";
                }

            }
            if (Settings_Category.General.DisplayRss)
            {
                for (int i = 0; i < listRecursive.Count; i++)
                {
                    CategoryInfo ci = CategoryController.Get(listRecursive[i].Id);
                    string rssUrl = string.Format("<a href='{0}' target='_blank'><Img Src='{1}' style='border-width:0px;'/></a>",
                        GetRssUrl(ci.Id.ToString()), FullDomainName + "/DesktopModules/CrossClassified/Images/feed-icon-12x12.gif");
                    listRecursive[i].Name += "  " + rssUrl;
                }
            }
            RecursiveCategoryItem m_recursiveCategoryRoot;
            m_recursiveCategoryRoot = RecursiveHelper.ConvertListToRecursiveItem(listRecursive);

            RecursiveHelper.ConvertRecursiveItemToAspNetTree(ref this.tvCategory, m_recursiveCategoryRoot);
            tvCategory.ExpandDepth = Settings_Category.General.TreeExpandDepth;

        }

        protected string GetRssUrl(string categoryId)
        {
            return FullDomainName + "/DesktopModules/CrossClassified/ProductRss.aspx?ProductCategoryId="
                + categoryId + "&ProductTypeId=" + Settings_Category.General.TypeId.ToString()
                 + "&tabid=" + TabId.ToString();
        }




        protected string GetNavigate(string categoryId)
        {
            int tab = GetSubModulePageId_List(Settings_Category.General.ProductListPage, Settings_Category.General.TypeId); 

            return Globals.NavigateURL(tab, "", "ProductCategoryId=" + categoryId, "ProductTypeId=" + Settings_Category.General.TypeId.ToString());
        }
        protected void tvCategory_SelectedNodeChanged(object sender, EventArgs e)
        {
            TreeNode current = tvCategory.SelectedNode;
            if (current != null)
            {
                if (Settings_Category.General.Target.ToLower() == "_blank")
                {
                    Response.Write("<script>window.open('" + GetNavigate(current.Value) + "','_blank')</script>");
                }
                else
                {
                    Response.Redirect(GetNavigate(current.Value), true);
                }
            }
        }

    }

}

