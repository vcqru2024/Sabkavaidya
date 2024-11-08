using Cross.DNN.Common.UserDefinedTable;
using Cross.DNN.Common.Utility;
using Cross.Modules.CP_Product.Business;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Services.Localization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Cross.Modules.CP_Product.View
{

    public partial class ProductListTab : CPModuleBase
    {
        public List<DotNetNuke.Common.FileItem> Tabs;

        private List<UDFieldInfo> UDFieldList
        {
            get
            {
                List<Cross.Modules.CP_Product.Business.UDFieldInfo> list = new List<Cross.Modules.CP_Product.Business.UDFieldInfo>();

                if (SupportsContentLocalization)
                {
                    list = (from p in Cross.Modules.CP_Product.Business.UDFieldController.GetByPortals(PortalId)
                            where p.TypeId == Settings_ListTab.General.TypeId
                            select p).ToList();
                    foreach (var item in list)
                    {
                        LocalizeObject_UDField(item);
                    }
                }
                else
                {
                    list = (from p in Cache_UdtList where p.TypeId == Settings_ListTab.General.TypeId select p).ToList();
                }
                return list;
            }
        }
        public Cross.Modules.CP_Product.Business.TypeInfo CurrentType
        {
            get
            {
                if (Settings_ListTab.General.TypeId != -1)
                {
                    return TypeController.Get(Settings_ListTab.General.TypeId);
                }
                else
                {
                    return new Cross.Modules.CP_Product.Business.TypeInfo();
                }
            }
        }

        #region eventhandler
        public Setting_ListTab Settings_ListTab;

        override protected void OnInit(EventArgs e)
        {
            Settings_ListTab = new Setting_ListTab(ModuleId, TabId, ModuleConfiguration.ModuleSettings);
            if (Settings_ListTab.General.TypeId == -1)
            {
                Settings_ListTab = new Setting_ListTab(ModuleId, TabId);
            }
            base.OnInit(e);
        }
        /// <summary>
        /// Init the tab data
        /// </summary>
        private void InitTabData()
        {
            Tabs = new List<DotNetNuke.Common.FileItem>();
            DotNetNuke.Common.FileItem objFileItem;
            CategoryInfo objCategory = new CategoryInfo();
            if (Settings_ListTab.Category.TabCategory1 != -1)
            {
                objCategory = CategoryController.Get(Settings_ListTab.Category.TabCategory1);
                if (objCategory != null && objCategory.TypeId == Settings_ListTab.General.TypeId)
                {
                    LocalizeObject_Category(objCategory);
                    objFileItem = new FileItem(objCategory.Id.ToString(),
                        string.IsNullOrEmpty(Settings_ListTab.Category.TabCategory1Title) ? objCategory.Name : Settings_ListTab.Category.TabCategory1Title);
                    Tabs.Add(objFileItem);
                }
            }
            if (Settings_ListTab.Category.TabCategory2 != -1)
            {
                objCategory = CategoryController.Get(Settings_ListTab.Category.TabCategory2);
                if (objCategory != null && objCategory.TypeId == Settings_ListTab.General.TypeId)
                {
                    LocalizeObject_Category(objCategory);
                    objFileItem = new FileItem(objCategory.Id.ToString(),
                        string.IsNullOrEmpty(Settings_ListTab.Category.TabCategory2Title) ? objCategory.Name : Settings_ListTab.Category.TabCategory2Title);
                    Tabs.Add(objFileItem);
                }
            }
            if (Settings_ListTab.Category.TabCategory3 != -1)
            {
                LocalizeObject_Category(objCategory);
                objCategory = CategoryController.Get(Settings_ListTab.Category.TabCategory3);
                if (objCategory != null && objCategory.TypeId == Settings_ListTab.General.TypeId)
                {
                    objFileItem = new FileItem(objCategory.Id.ToString(),
                        string.IsNullOrEmpty(Settings_ListTab.Category.TabCategory3Title) ? objCategory.Name : Settings_ListTab.Category.TabCategory3Title);
                    Tabs.Add(objFileItem);
                }
            }

            if (Settings_ListTab.Category.TabCategory4 != -1)
            {
                objCategory = CategoryController.Get(Settings_ListTab.Category.TabCategory4);
                if (objCategory != null && objCategory.TypeId == Settings_ListTab.General.TypeId)
                {
                    LocalizeObject_Category(objCategory);
                    objFileItem = new FileItem(objCategory.Id.ToString(),
                        string.IsNullOrEmpty(Settings_ListTab.Category.TabCategory4Title) ? objCategory.Name : Settings_ListTab.Category.TabCategory4Title);
                    Tabs.Add(objFileItem);
                }
            }
            if (Settings_ListTab.Category.TabCategory5 != -1)
            {
                objCategory = CategoryController.Get(Settings_ListTab.Category.TabCategory5);
                if (objCategory != null && objCategory.TypeId == Settings_ListTab.General.TypeId)
                {
                    LocalizeObject_Category(objCategory);
                    objFileItem = new FileItem(objCategory.Id.ToString(),
                        string.IsNullOrEmpty(Settings_ListTab.Category.TabCategory5Title) ? objCategory.Name : Settings_ListTab.Category.TabCategory5Title);
                    Tabs.Add(objFileItem);
                }
            }
            if (Settings_ListTab.Category.TabCategory6 != -1)
            {
                objCategory = CategoryController.Get(Settings_ListTab.Category.TabCategory6);
                if (objCategory != null && objCategory.TypeId == Settings_ListTab.General.TypeId)
                {
                    LocalizeObject_Category(objCategory);
                    objFileItem = new FileItem(objCategory.Id.ToString(),
                        string.IsNullOrEmpty(Settings_ListTab.Category.TabCategory6Title) ? objCategory.Name : Settings_ListTab.Category.TabCategory6Title);
                    Tabs.Add(objFileItem);
                }
            }
            if (Settings_ListTab.Category.TabCategory7 != -1)
            {
                objCategory = CategoryController.Get(Settings_ListTab.Category.TabCategory7);
                if (objCategory != null && objCategory.TypeId == Settings_ListTab.General.TypeId)
                {
                    LocalizeObject_Category(objCategory);
                    objFileItem = new FileItem(objCategory.Id.ToString(),
                         string.IsNullOrEmpty(Settings_ListTab.Category.TabCategory7Title) ? objCategory.Name : Settings_ListTab.Category.TabCategory7Title);
                    Tabs.Add(objFileItem);
                }
            }
            if (Settings_ListTab.Category.TabCategory8 != -1)
            {
                objCategory = CategoryController.Get(Settings_ListTab.Category.TabCategory8);
                if (objCategory != null && objCategory.TypeId == Settings_ListTab.General.TypeId)
                {
                    LocalizeObject_Category(objCategory);
                    objFileItem = new FileItem(objCategory.Id.ToString(),
                          string.IsNullOrEmpty(Settings_ListTab.Category.TabCategory8Title) ? objCategory.Name : Settings_ListTab.Category.TabCategory8Title);
                    Tabs.Add(objFileItem);
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Cache_TypeList.Count < 1 || Settings_ListTab.General.TypeId == -1)
            {
                return;
            }
            InitTabData();

            LocalResourceFile = Localization.GetResourceFile(this, "ProductListTab.ascx");

            if (!IsPostBack)
            {
                if (Tabs.Count > 0)
                {
                    BindProduct();
                    RegisterScript();
                }
                DataBind();
            }
        }

        private void RegisterScript()
        {
        
            DotNetNuke.Framework.JavaScriptLibraries.JavaScript.RequestRegistration(DotNetNuke.Framework.JavaScriptLibraries.CommonJs.jQueryUI);
            StringBuilder sb = new StringBuilder();

            //Jquery ui
            sb.AppendFormat("<link rel=\"stylesheet\" href=\"{0}/desktopmodules/crossclassified/css/jquery-ui-themes-1.11.4/Themes/{1}/jquery-ui.css\" type=\"text/css\"/>",
                FullDomainName, Settings_ListTab.JqueryTab.CssStyle);
            litTabCss.Text = sb.ToString();
        }

        #endregion


        #region methods


        public string GetPriceCss(string productId)
        {
            if (PromoPriceAvailable(productId))
            {
                return "Line-through";
            }
            return "NormalRed";
        }

        public bool PromoPriceAvailable(string productId)
        {
            ProductInfo objItem = ProductController.Get(Convert.ToInt32(productId));
            return objItem.PromoPriceAvailable;
        }
        public string GetShortDate(string dateTime)
        {
            DateTime day = Convert.ToDateTime(dateTime);
            if (Null.IsNull(day))
            {
                return "";
            }
            return day.ToShortDateString();
        }


        private List<ProductInfo> GetProducts(int categoryId)
        {
            int pageSize = Settings_ListTab.General.RowCount * Settings_ListTab.General.ColCount;
            List<ProductInfo> list = new List<ProductInfo>();
            int totalRecords = 0;
            list = ProductController.GetByModuleSettings(Settings_ListTab.General.TypeId, GetUserId(),
                categoryId.ToString(), "",
          Settings_ListTab.General.ShowFeaturedOnly, Settings_ListTab.General.ShowPromoOnly, Settings_ListTab.Image.ShowImageOnly,
          "", Settings_ListTab.General.SortField
          , pageSize, false,
          GetCurrentCultureCode(), pageSize, 0, ref totalRecords);

            foreach (var item in list)
            {
                LocalizeObject_Product(item);
            }

            return list;
        }

        private void BindProduct()
        {
            if (Tabs.Count > 0)
            {
                dlProduct1.DataSource = GetProducts(Convert.ToInt32(Tabs[0].Value));
                dlProduct1.DataBind();
            }

            if (Tabs.Count > 1)
            {
                dlProduct2.DataSource = GetProducts(Convert.ToInt32(Tabs[1].Value));
                dlProduct2.DataBind();
            }

            if (Tabs.Count > 2)
            {
                dlProduct3.DataSource = GetProducts(Convert.ToInt32(Tabs[2].Value));
                dlProduct3.DataBind();
            }

            if (Tabs.Count > 3)
            {
                dlProduct4.DataSource = GetProducts(Convert.ToInt32(Tabs[3].Value));
                dlProduct4.DataBind();
            }

            if (Tabs.Count > 4)
            {
                dlProduct5.DataSource = GetProducts(Convert.ToInt32(Tabs[4].Value));
                dlProduct5.DataBind();
            }

            if (Tabs.Count > 5)
            {
                dlProduct6.DataSource = GetProducts(Convert.ToInt32(Tabs[5].Value));
                dlProduct6.DataBind();
            }

            if (Tabs.Count > 6)
            {
                dlProduct7.DataSource = GetProducts(Convert.ToInt32(Tabs[6].Value));
                dlProduct7.DataBind();
            }

            if (Tabs.Count > 7)
            {
                dlProduct8.DataSource = GetProducts(Convert.ToInt32(Tabs[7].Value));
                dlProduct8.DataBind();
            }


        }


        protected string GetVendorCompany(string userId)
        {
            Cross.Modules.CP_Product.Business.UserInfo objVendor = Cross.Modules.CP_Product.Business.UserController.Get(Convert.ToInt32(userId));
            return objVendor == null ? "" : objVendor.Company;
        }

        protected string GetRatingImage(string productId)
        {
            ProductInfo objProduct = ProductController.Get(Convert.ToInt32(productId));
            string imgRating = Settings_ListTab.Content.RatingImage;
            return LocalUtils.ModuleRootPath + "images/ratings/" + imgRating + "/" + imgRating + objProduct.RatingAverage.ToString() + ".gif";
        }
        protected string GetShortenSummary(string productId, string summary)
        {
            int length = Settings_ListTab.Content.SummaryLength;
            if (summary == "")
            {
                ProductInfo objProduct = ProductController.Get(Convert.ToInt32(productId));
                LocalizeObject_Product(objProduct);
                summary = HtmlUtils.Shorten(Utils.RemoveAllHtmlTags(objProduct.Description), length > 200 ? length : 200, "..");
            }
            return length > 0 ?
                DotNetNuke.Common.Utilities.HtmlUtils.Shorten(summary, length, "..").Replace(Microsoft.VisualBasic.Constants.vbCrLf, "<br/>") : summary.Replace(Microsoft.VisualBasic.Constants.vbCrLf, "<br/>");
        }
        protected string GetNavigate(string productId, string productName)
        {
            int detailTabId = GetSubModulePageId_Detail(Settings_ListTab.General.DetailTab, Settings_ListTab.General.TypeId);
            return GenerateProductDetailUrl(detailTabId, productId, productName);
        }
        protected string GetUserNavigate(string userId)
        {
            int userTab = TabId;

            userTab = GetSubModulePageId_List(Settings_ListTab.General.TypeId);

            return Globals.NavigateURL(userTab, "", "ProductUserId=" + userId, "ProductTypeId=" + Settings_ListTab.General.TypeId);
        }

        #endregion


        protected void dlProduct1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (UDFieldList.Count > 0
                && Settings_ListTab.UDField.UseBuiltInTemplate
                && !string.IsNullOrEmpty(Settings_ListTab.UDField.UDFieldList))
            {
                System.Web.UI.HtmlControls.HtmlTable tblUDT = (System.Web.UI.HtmlControls.HtmlTable)e.Item.FindControl("tblUserDefinedField");
                int productId = Convert.ToInt32(((Label)e.Item.FindControl("lblId")).Text);
                string[] displayList = Settings_ListTab.UDField.UDFieldList.Split(',');

                foreach (string fieldId in displayList)
                {
                    UDFieldInfo objUDField = UDFieldController.Get(Convert.ToInt32(fieldId));
                    if (objUDField != null)
                    {
                        LocalizeObject_UDField(objUDField);
                        HtmlTableRow objRow = new HtmlTableRow();
                        objRow.VAlign = "Top";
                        // Caption for the field
                        HtmlTableCell objCell = new HtmlTableCell();
                        objCell.VAlign = "Top";
                        Label lblControl = new Label();
                        string title = string.IsNullOrEmpty(objUDField.FieldTitle) ? objUDField.FieldName : objUDField.FieldTitle;
                        if (!title.EndsWith(":"))
                        {
                            title += ": ";
                        }
                        lblControl.Text = title;
                        //lblControl.CssClass = "Normal";
                        objCell.Controls.Add(lblControl);

                        //add field value
                        objCell.Controls.Add(GetUDFieldValueControl(objUDField.Id, productId));
                        objRow.Cells.Add(objCell);
                        tblUDT.Rows.Add(objRow);
                    }
                }
            }
        }

        protected void dlProduct2_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (UDFieldList.Count > 0
                && Settings_ListTab.UDField.UseBuiltInTemplate
                && !string.IsNullOrEmpty(Settings_ListTab.UDField.UDFieldList))
            {
                System.Web.UI.HtmlControls.HtmlTable tblUDT = (System.Web.UI.HtmlControls.HtmlTable)e.Item.FindControl("tblUserDefinedField");
                int productId = Convert.ToInt32(((Label)e.Item.FindControl("lblId")).Text);
                string[] displayList = Settings_ListTab.UDField.UDFieldList.Split(',');

                foreach (string fieldId in displayList)
                {
                    UDFieldInfo objUDField = UDFieldController.Get(Convert.ToInt32(fieldId));
                    if (objUDField != null)
                    {
                        LocalizeObject_UDField(objUDField);
                        HtmlTableRow objRow = new HtmlTableRow();
                        objRow.VAlign = "Top";
                        // Caption for the field
                        HtmlTableCell objCell = new HtmlTableCell();
                        objCell.VAlign = "Top";
                        Label lblControl = new Label();
                        string title = string.IsNullOrEmpty(objUDField.FieldTitle) ? objUDField.FieldName : objUDField.FieldTitle;
                        if (!title.EndsWith(":"))
                        {
                            title += ": ";
                        }
                        lblControl.Text = title;
                        //lblControl.CssClass = "Normal";
                        objCell.Controls.Add(lblControl);

                        //add field value
                        objCell.Controls.Add(GetUDFieldValueControl(objUDField.Id, productId));
                        objRow.Cells.Add(objCell);
                        tblUDT.Rows.Add(objRow);
                    }
                }
            }
        }

        protected void dlProduct3_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (UDFieldList.Count > 0
                && Settings_ListTab.UDField.UseBuiltInTemplate
                && !string.IsNullOrEmpty(Settings_ListTab.UDField.UDFieldList))
            {
                System.Web.UI.HtmlControls.HtmlTable tblUDT = (System.Web.UI.HtmlControls.HtmlTable)e.Item.FindControl("tblUserDefinedField");
                int productId = Convert.ToInt32(((Label)e.Item.FindControl("lblId")).Text);
                string[] displayList = Settings_ListTab.UDField.UDFieldList.Split(',');

                foreach (string fieldId in displayList)
                {
                    UDFieldInfo objUDField = UDFieldController.Get(Convert.ToInt32(fieldId));
                    if (objUDField != null)
                    {
                        LocalizeObject_UDField(objUDField);
                        HtmlTableRow objRow = new HtmlTableRow();
                        objRow.VAlign = "Top";
                        // Caption for the field
                        HtmlTableCell objCell = new HtmlTableCell();
                        objCell.VAlign = "Top";
                        Label lblControl = new Label();
                        string title = string.IsNullOrEmpty(objUDField.FieldTitle) ? objUDField.FieldName : objUDField.FieldTitle;
                        if (!title.EndsWith(":"))
                        {
                            title += ": ";
                        }
                        lblControl.Text = title;
                        //lblControl.CssClass = "Normal";
                        objCell.Controls.Add(lblControl);

                        //add field value
                        objCell.Controls.Add(GetUDFieldValueControl(objUDField.Id, productId));
                        objRow.Cells.Add(objCell);
                        tblUDT.Rows.Add(objRow);
                    }
                }
            }
        }

        protected void dlProduct4_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (UDFieldList.Count > 0
                && Settings_ListTab.UDField.UseBuiltInTemplate
                && !string.IsNullOrEmpty(Settings_ListTab.UDField.UDFieldList))
            {
                System.Web.UI.HtmlControls.HtmlTable tblUDT = (System.Web.UI.HtmlControls.HtmlTable)e.Item.FindControl("tblUserDefinedField");
                int productId = Convert.ToInt32(((Label)e.Item.FindControl("lblId")).Text);
                string[] displayList = Settings_ListTab.UDField.UDFieldList.Split(',');

                foreach (string fieldId in displayList)
                {
                    UDFieldInfo objUDField = UDFieldController.Get(Convert.ToInt32(fieldId));
                    if (objUDField != null)
                    {
                        LocalizeObject_UDField(objUDField);
                        HtmlTableRow objRow = new HtmlTableRow();
                        objRow.VAlign = "Top";
                        // Caption for the field
                        HtmlTableCell objCell = new HtmlTableCell();
                        objCell.VAlign = "Top";
                        Label lblControl = new Label();
                        string title = string.IsNullOrEmpty(objUDField.FieldTitle) ? objUDField.FieldName : objUDField.FieldTitle;
                        if (!title.EndsWith(":"))
                        {
                            title += ": ";
                        }
                        lblControl.Text = title;
                        //lblControl.CssClass = "Normal";
                        objCell.Controls.Add(lblControl);

                        //add field value
                        objCell.Controls.Add(GetUDFieldValueControl(objUDField.Id, productId));
                        objRow.Cells.Add(objCell);
                        tblUDT.Rows.Add(objRow);
                    }
                }
            }
        }

        protected void dlProduct5_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (UDFieldList.Count > 0
                && Settings_ListTab.UDField.UseBuiltInTemplate
                && !string.IsNullOrEmpty(Settings_ListTab.UDField.UDFieldList))
            {
                System.Web.UI.HtmlControls.HtmlTable tblUDT = (System.Web.UI.HtmlControls.HtmlTable)e.Item.FindControl("tblUserDefinedField");
                int productId = Convert.ToInt32(((Label)e.Item.FindControl("lblId")).Text);
                string[] displayList = Settings_ListTab.UDField.UDFieldList.Split(',');

                foreach (string fieldId in displayList)
                {
                    UDFieldInfo objUDField = UDFieldController.Get(Convert.ToInt32(fieldId));
                    if (objUDField != null)
                    {
                        LocalizeObject_UDField(objUDField);
                        HtmlTableRow objRow = new HtmlTableRow();
                        objRow.VAlign = "Top";
                        // Caption for the field
                        HtmlTableCell objCell = new HtmlTableCell();
                        objCell.VAlign = "Top";
                        Label lblControl = new Label();
                        string title = string.IsNullOrEmpty(objUDField.FieldTitle) ? objUDField.FieldName : objUDField.FieldTitle;
                        if (!title.EndsWith(":"))
                        {
                            title += ": ";
                        }
                        lblControl.Text = title;
                        //lblControl.CssClass = "Normal";
                        objCell.Controls.Add(lblControl);

                        //add field value
                        objCell.Controls.Add(GetUDFieldValueControl(objUDField.Id, productId));
                        objRow.Cells.Add(objCell);
                        tblUDT.Rows.Add(objRow);
                    }
                }
            }
        }

        protected void dlProduct6_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (UDFieldList.Count > 0
                && Settings_ListTab.UDField.UseBuiltInTemplate
                && !string.IsNullOrEmpty(Settings_ListTab.UDField.UDFieldList))
            {
                System.Web.UI.HtmlControls.HtmlTable tblUDT = (System.Web.UI.HtmlControls.HtmlTable)e.Item.FindControl("tblUserDefinedField");
                int productId = Convert.ToInt32(((Label)e.Item.FindControl("lblId")).Text);
                string[] displayList = Settings_ListTab.UDField.UDFieldList.Split(',');

                foreach (string fieldId in displayList)
                {
                    UDFieldInfo objUDField = UDFieldController.Get(Convert.ToInt32(fieldId));
                    if (objUDField != null)
                    {
                        LocalizeObject_UDField(objUDField);
                        HtmlTableRow objRow = new HtmlTableRow();
                        objRow.VAlign = "Top";
                        // Caption for the field
                        HtmlTableCell objCell = new HtmlTableCell();
                        objCell.VAlign = "Top";
                        Label lblControl = new Label();
                        string title = string.IsNullOrEmpty(objUDField.FieldTitle) ? objUDField.FieldName : objUDField.FieldTitle;
                        if (!title.EndsWith(":"))
                        {
                            title += ": ";
                        }
                        lblControl.Text = title;
                        //lblControl.CssClass = "Normal";
                        objCell.Controls.Add(lblControl);

                        //add field value
                        objCell.Controls.Add(GetUDFieldValueControl(objUDField.Id, productId));
                        objRow.Cells.Add(objCell);
                        tblUDT.Rows.Add(objRow);
                    }
                }
            }
        }
        protected void dlProduct7_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (UDFieldList.Count > 0
                && Settings_ListTab.UDField.UseBuiltInTemplate
                && !string.IsNullOrEmpty(Settings_ListTab.UDField.UDFieldList))
            {
                System.Web.UI.HtmlControls.HtmlTable tblUDT = (System.Web.UI.HtmlControls.HtmlTable)e.Item.FindControl("tblUserDefinedField");
                int productId = Convert.ToInt32(((Label)e.Item.FindControl("lblId")).Text);
                string[] displayList = Settings_ListTab.UDField.UDFieldList.Split(',');

                foreach (string fieldId in displayList)
                {
                    UDFieldInfo objUDField = UDFieldController.Get(Convert.ToInt32(fieldId));
                    if (objUDField != null)
                    {
                        LocalizeObject_UDField(objUDField);
                        HtmlTableRow objRow = new HtmlTableRow();
                        objRow.VAlign = "Top";
                        // Caption for the field
                        HtmlTableCell objCell = new HtmlTableCell();
                        objCell.VAlign = "Top";
                        Label lblControl = new Label();
                        string title = string.IsNullOrEmpty(objUDField.FieldTitle) ? objUDField.FieldName : objUDField.FieldTitle;
                        if (!title.EndsWith(":"))
                        {
                            title += ": ";
                        }
                        lblControl.Text = title;
                        //lblControl.CssClass = "Normal";
                        objCell.Controls.Add(lblControl);

                        //add field value
                        objCell.Controls.Add(GetUDFieldValueControl(objUDField.Id, productId));
                        objRow.Cells.Add(objCell);
                        tblUDT.Rows.Add(objRow);
                    }
                }
            }
        }
        protected void dlProduct8_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (UDFieldList.Count > 0
                && Settings_ListTab.UDField.UseBuiltInTemplate
                && !string.IsNullOrEmpty(Settings_ListTab.UDField.UDFieldList))
            {
                System.Web.UI.HtmlControls.HtmlTable tblUDT = (System.Web.UI.HtmlControls.HtmlTable)e.Item.FindControl("tblUserDefinedField");
                int productId = Convert.ToInt32(((Label)e.Item.FindControl("lblId")).Text);
                string[] displayList = Settings_ListTab.UDField.UDFieldList.Split(',');

                foreach (string fieldId in displayList)
                {
                    UDFieldInfo objUDField = UDFieldController.Get(Convert.ToInt32(fieldId));
                    if (objUDField != null)
                    {
                        LocalizeObject_UDField(objUDField);
                        HtmlTableRow objRow = new HtmlTableRow();
                        objRow.VAlign = "Top";
                        // Caption for the field
                        HtmlTableCell objCell = new HtmlTableCell();
                        objCell.VAlign = "Top";
                        Label lblControl = new Label();
                        string title = string.IsNullOrEmpty(objUDField.FieldTitle) ? objUDField.FieldName : objUDField.FieldTitle;
                        if (!title.EndsWith(":"))
                        {
                            title += ": ";
                        }
                        lblControl.Text = title;
                        //lblControl.CssClass = "Normal";
                        objCell.Controls.Add(lblControl);

                        //add field value
                        objCell.Controls.Add(GetUDFieldValueControl(objUDField.Id, productId));
                        objRow.Cells.Add(objCell);
                        tblUDT.Rows.Add(objRow);
                    }
                }
            }
        }

        private Control GetUDFieldValueControl(int udFieldId, int productId)
        {
            Label lblDefault = new Label();
            lblDefault.Text = "";

            UDFieldInfo objUDField = UDFieldController.Get(udFieldId);
            LocalizeObject_UDField(objUDField);

            UDDataInfo objData = UDDataController.GetByCulture(udFieldId, productId,
                GetCurrentCultureCode());

            string productValue = string.Empty;

            if (!string.IsNullOrEmpty(objUDField.DefaultValue))//first, we take objUDField.DefaultValue
            {
                productValue = objUDField.DefaultValue;
            }
            //then take objData.FieldValue
            if (objData != null)
            {
                productValue = objData.FieldValue;
            }

            //if there is no value
            if (string.IsNullOrEmpty(productValue))
            {
                return lblDefault;
            }
            else
            {
                DataType udType = DataType.get_ByName(objUDField.FieldType);
                DisplayControl ctlControl = udType.DisplayControl;
                ctlControl.FieldName = objUDField.FieldName;
                ctlControl.FieldTitle = objUDField.FieldTitle;
                ctlControl.FieldType = objUDField.FieldType;
                ctlControl.FieldID = objUDField.Id;
                ctlControl.ExistingValue = productValue.Trim();
                ctlControl.Width = Settings_ListTab.UDField.UDField_ImageWidth;
                ctlControl.Height = Settings_ListTab.UDField.UDField_ImageHeight;
                ctlControl.NormalizeFlag = objUDField.NormalizeFlag;
                ctlControl.OutputSettings = objUDField.OutputSettings;
                ctlControl.Target = Settings_ListTab.General.LinkTarget;
                ctlControl.InputSettings = objUDField.InputSettings;
                ctlControl.CheckBoxList_Enabled = Settings_ListTab.UDField.UDField_CheckBoxList_Enabled;
                ctlControl.CheckBoxList_RepeatColumns = Settings_ListTab.UDField.UDField_CheckBoxList_RepeatColumns;
                return ctlControl;
            }
        }
        protected string GetUDFieldValue(string fieldName, string productId)
        {
            UDFieldInfo objUDField = UDFieldController.GetByName(fieldName, CurrentType.Id);
            if (objUDField == null)
            {
                return "Unknow field name, please check it";
            }
            LocalizeObject_UDField(objUDField);

            UDDataInfo objData = UDDataController.GetByCulture(objUDField.Id, Convert.ToInt32(productId),
                GetCurrentCultureCode());

            string productValue = string.Empty;

            if (!string.IsNullOrEmpty(objUDField.DefaultValue))//first, we take objUDField.DefaultValue
            {
                productValue = objUDField.DefaultValue;
            }
            //then take objData.FieldValue
            if (objData != null)
            {
                productValue = objData.FieldValue;
            }

            if (string.IsNullOrEmpty(productValue.Trim()))
            {
                return "";
            }
            else
            {
                if (productValue.StartsWith("FileID="))
                {
                    if (objUDField.FieldType.ToLower() == "image" || objUDField.FieldType.ToLower() == "url")
                    {
                        return GetRelativeUrlByFileId_Local(productValue);//user defined field 只能retrieve 本地文件
                    }

                }
                if (objUDField.FieldType.ToLower() == "url" && Utils.IsNumber(productValue))
                {
                    return Globals.NavigateURL(Convert.ToInt32(productValue));
                }
                return productValue;
            }
        }
    }
}
   
   

