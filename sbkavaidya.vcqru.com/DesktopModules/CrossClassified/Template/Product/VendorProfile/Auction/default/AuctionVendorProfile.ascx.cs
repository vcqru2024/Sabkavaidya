using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Cross.DNN.Common.UserDefinedTable;
using Cross.DNN.Common.Utility;
using Cross.DNN.Common.Utility.TreeHelper;
using Cross.Modules.CP_Product.Business;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Security;
using DotNetNuke.Services.Localization;
namespace Cross.Modules.CP_Product.View
{
    public partial class AuctionVendorProfile : CPModuleBase
    {
        /// <summary>
        /// maintain current status, can be 
        /// none/localsearch_basic/localsearch_advanced/externalsearch_basic/externalsearch_advanced
        /// </summary>
        private string CurrentSearchStatus
        {
            get
            {
                if (ViewState["CurrentSearchStatus"] != null)
                {
                    return Convert.ToString(ViewState["CurrentSearchStatus"]);
                }

                return "none";
            }
            set
            {
                ViewState["CurrentSearchStatus"] = value;
            }
        }
        public int VendorId
        {
            get

            {
                if (ViewState["ProductUserId"] != null)
                {
                    return Convert.ToInt32(ViewState["ProductUserId"]);
                }
                else
                {
                    int id = -1;
                    //check user id mapping
                    if (!string.IsNullOrEmpty(Settings_VendorProfile.General.UserIdMapping))
                    {
                        if (Request.QueryString[Settings_VendorProfile.General.UserIdMapping] != null && Utils.IsNumber(Request.Params[Settings_VendorProfile.General.UserIdMapping].ToString()))
                        {
                            id = Convert.ToInt32(Request.Params[Settings_VendorProfile.General.UserIdMapping]);
                        }
                    }

                    if ((Request.Params["ProductUserId"] != null) && (Request.Params["ProductUserId"] != ""))
                    {
                        id = Int32.Parse(Request.Params["ProductUserId"]);
                    }
                    ViewState["ProductUserId"] = id;
                    return id;
                }
            }
        }
        public Cross.Modules.CP_Product.Business.UserInfo objAuthor
        {
            get
            {
                Cross.Modules.CP_Product.Business.UserInfo ai = new Cross.Modules.CP_Product.Business.UserInfo();
                ai = Cross.Modules.CP_Product.Business.UserController.Get(VendorId);
                if (ai == null)
                {
                    return new Cross.Modules.CP_Product.Business.UserInfo();
                }
                LocalizeObject_User(ai);
                return ai;
            }
        }

        private List<UDFieldInfo> UDFieldList
        {
            get
            {
                List<Cross.Modules.CP_Product.Business.UDFieldInfo> list = new List<Cross.Modules.CP_Product.Business.UDFieldInfo>();

                if (SupportsContentLocalization)
                {
                    list = (from p in Cross.Modules.CP_Product.Business.UDFieldController.GetByPortals(PortalId)
                            where p.TypeId == Settings_VendorProfile.General.TypeId
                            select p).ToList();
                    foreach (var item in list)
                    {
                        LocalizeObject_UDField(item);
                    }
                }
                else
                {
                    list = (from p in Cache_UdtList where p.TypeId == Settings_VendorProfile.General.TypeId select p).ToList();
                }
                return list;
            }
        }
        public bool IsEnglishAuction
        {
            get
            {
                return CurrentType.AuctionType == Convert.ToInt32(CP_Auction.Business.AuctionType.English);
            }
        }
        public bool IsSecondItemAuction
        {
            get
            {
                return CurrentType.AuctionType == Convert.ToInt32(CP_Auction.Business.AuctionType.Second_item);
            }
        }
        public Cross.Modules.CP_Product.Business.TypeInfo CurrentType
        {
            get
            {
                if (Settings_VendorProfile.General.TypeId != -1)
                {
                    return TypeController.Get(Settings_VendorProfile.General.TypeId);
                }
                else
                {
                    return new Cross.Modules.CP_Product.Business.TypeInfo();
                }
            }
        }
        #region advanced search fields
        /// <summary>
        /// edit controls which used to present data
        /// </summary>
        private EditControls ListEditControls;

        /// <summary>
        /// udfield info list which used to search
        /// </summary>
        private List<UDFieldInfo> Udt_SearchList;


        private void Init_Udt_SearchList()
        {
            Udt_SearchList = new List<UDFieldInfo>();
            List<int> idList = new List<int>();
            int id = -1;
            if (!string.IsNullOrEmpty(Settings_VendorProfile.Product_Search_Advanced.UDT_1)
                && Settings_VendorProfile.Product_Search_Advanced.UDT_1 != "-1")
            {
                id = Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.UDT_1);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_VendorProfile.Product_Search_Advanced.UDT_2)
                && Settings_VendorProfile.Product_Search_Advanced.UDT_2 != "-1")
            {
                id = Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.UDT_2);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_VendorProfile.Product_Search_Advanced.UDT_3)
              && Settings_VendorProfile.Product_Search_Advanced.UDT_3 != "-1")
            {
                id = Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.UDT_3);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_VendorProfile.Product_Search_Advanced.UDT_4)
             && Settings_VendorProfile.Product_Search_Advanced.UDT_4 != "-1")
            {
                id = Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.UDT_4);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_VendorProfile.Product_Search_Advanced.UDT_5)
             && Settings_VendorProfile.Product_Search_Advanced.UDT_5 != "-1")
            {
                id = Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.UDT_5);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_VendorProfile.Product_Search_Advanced.UDT_6)
             && Settings_VendorProfile.Product_Search_Advanced.UDT_6 != "-1")
            {
                id = Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.UDT_6);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_VendorProfile.Product_Search_Advanced.UDT_7)
             && Settings_VendorProfile.Product_Search_Advanced.UDT_7 != "-1")
            {
                id = Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.UDT_7);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_VendorProfile.Product_Search_Advanced.UDT_8)
             && Settings_VendorProfile.Product_Search_Advanced.UDT_8 != "-1")
            {
                id = Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.UDT_8);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_VendorProfile.Product_Search_Advanced.UDT_9)
             && Settings_VendorProfile.Product_Search_Advanced.UDT_9 != "-1")
            {
                id = Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.UDT_9);
                idList.Add(id);
            }

            if (!string.IsNullOrEmpty(Settings_VendorProfile.Product_Search_Advanced.UDT_10)
             && Settings_VendorProfile.Product_Search_Advanced.UDT_10 != "-1")
            {
                id = Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.UDT_10);
                idList.Add(id);
            }
            List<UDFieldInfo> list = new List<UDFieldInfo>();
            //find out the repeated id
            List<int> validIdList = (from p in idList select p).Distinct().ToList();

            foreach (var item in validIdList)
            {
                if (UDFieldController.Get(item) != null)
                {
                    Udt_SearchList.Add(UDFieldController.Get(item));
                }
            }
            foreach (var item in Udt_SearchList)
            {
                LocalizeObject_UDField(item);
            }
        }
        /// <summary>
        /// operator for udfield info
        /// </summary>
        private List<DropDownList> Udt_SearchOperList;

        private void Init_Udt_SearchOperList()
        {
            Udt_SearchOperList = new List<DropDownList>();
            for (int i = 0; i < Udt_SearchList.Count; i++)
            {
                DropDownList ddlItem = new DropDownList();
                ddlItem.Width = Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator);
                //user defined data which have list of values specified
                if (!string.IsNullOrEmpty(Udt_SearchList[i].InputSettings) &&
                    Udt_SearchList[i].InputSettings.IndexOf(';') > 0)
                {
                    //for check box list values, we should provide contain / not contain search feature.
                    if (Udt_SearchList[i].InputSettings.EndsWith(Cross.DNN.Common.UserDefinedTable.Definition.verticalCheckBoxListEnabledToken)
                        || Udt_SearchList[i].InputSettings.EndsWith(Cross.DNN.Common.UserDefinedTable.Definition.horizontalCheckBoxListEnabledToken))
                    {
                        ddlItem.Items.Add(new ListItem(Localization.GetString("li_Oper_contain", LocalResourceFile), "contain"));
                        ddlItem.Items.Add(new ListItem(Localization.GetString("li_Oper_notcontain", LocalResourceFile), "notcontain"));
                    }
                    else
                    {
                        ddlItem.Items.Add(new ListItem(Localization.GetString("li_Oper_equal", LocalResourceFile), "equal"));
                        ddlItem.Items.Add(new ListItem(Localization.GetString("li_Oper_unequal", LocalResourceFile), "unequal"));
                    }
                }
                else
                {
                    switch (Udt_SearchList[i].FieldType.ToLower())
                    {
                        case "int32":
                        case "decimal":
                        case "datetime":
                        case "date":
                        case "time":
                        case "currency": //< = >
                            ddlItem.Items.Add(new ListItem(Localization.GetString("li_Oper_lessthan", LocalResourceFile), "lessthan"));
                            ddlItem.Items.Add(new ListItem(Localization.GetString("li_Oper_equal", LocalResourceFile), "equal"));
                            ddlItem.Items.Add(new ListItem(Localization.GetString("li_Oper_greaterthan", LocalResourceFile), "greaterthan"));
                            break;
                        case "string":
                        case "email":
                        case "url":
                        case "image":
                        case "texthtml"://like, unlike
                            ddlItem.Items.Add(new ListItem(Localization.GetString("li_Oper_like", LocalResourceFile), "like"));
                            ddlItem.Items.Add(new ListItem(Localization.GetString("li_Oper_unlike", LocalResourceFile), "unlike"));
                            break;
                        case "boolean":// = <>
                            ddlItem.Items.Add(new ListItem(Localization.GetString("li_Oper_equal", LocalResourceFile), "equal"));
                            ddlItem.Items.Add(new ListItem(Localization.GetString("li_Oper_unequal", LocalResourceFile), "unequal"));
                            break;
                        default:
                            break;
                    }
                }
                Udt_SearchOperList.Add(ddlItem);
            }
        }

        #endregion
        #region advanced search  conditions

        private void BuildUDFieldForm()
        {
            Init_Udt_SearchList();
            if (Udt_SearchList.Count < 1)
            {
                return;
            }
            Init_Udt_SearchOperList();
            List<FormColumnInfo> listEditFrom = new List<FormColumnInfo>();
            FormColumnInfo objColumn;
            ListEditControls = new EditControls(ModuleContext);

            //edit style will use the input width settings
            string editStyle = string.Format("width:{0}px", Settings_VendorProfile.Product_Search_Advanced.Width_Input);

            for (int i = 0; i < Udt_SearchList.Count; i++)
            {
                objColumn = new FormColumnInfo();
                objColumn.Name = Udt_SearchList[i].FieldName;
                objColumn.IsUserDefinedField = true;
                objColumn.Help = Udt_SearchList[i].HelpText;
                objColumn.Title = string.IsNullOrEmpty(Udt_SearchList[i].FieldTitle) ? Udt_SearchList[i].FieldName : Udt_SearchList[i].FieldTitle;
                //add : to make it looks better
                if (objColumn.Title.EndsWith(":") == false)
                {
                    objColumn.Title += ":";
                }
                objColumn.Required = false;
                objColumn.Visible = true;
                objColumn.EditControl = ListEditControls.Add(objColumn.Name, objColumn.Title, Udt_SearchList[i].FieldType, Udt_SearchList[i].Id,
                    objColumn.Help, Udt_SearchList[i].DefaultValue, objColumn.Required,
                    Udt_SearchList[i].ValidationRule, Udt_SearchList[i].ValidationMessage, editStyle, Udt_SearchList[i].InputSettings,
                    Udt_SearchList[i].OutputSettings, Udt_SearchList[i].NormalizeFlag, Settings_VendorProfile.Product_Search_Advanced.RepeatColumns);

                listEditFrom.Add(objColumn);
            }
            BuildFormAsTable(listEditFrom);
        }

        public Control CreateTitleControl(string title)
        {
            Label lblControl = new Label();
            lblControl.Text = title;
            lblControl.Width = int.Parse(Settings_VendorProfile.Product_Search_Advanced.Width_Label);
            return lblControl;
        }

        private void BuildFormAsTable(List<FormColumnInfo> listEditFrom)
        {
            for (int i = 0; i < listEditFrom.Count; i++)
            {
                TableRow objRow = new TableRow();
                //1st column: Caption for the field
                TableCell objCell = new TableCell();

                //objCell.VerticalAlign = VerticalAlign.Top;
                objCell.HorizontalAlign = HorizontalAlign.Right;
                objCell.Controls.Add(CreateTitleControl(listEditFrom[i].Title));
                objCell.Wrap = false;
                if (listEditFrom[i].EditControl == null)
                {
                    objCell.ColumnSpan = 2;
                    objRow.Cells.Add(objCell);
                }
                else
                {
                    // objCell.CssClass = "Normal";
                    objCell.Controls.Add(Udt_SearchOperList[i]);
                    objCell.Width = Unit.Pixel(Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Label)
                        + Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator));
                    objRow.Cells.Add(objCell);



                    //3rd column: Dynamic control
                    objCell = new TableCell();
                    //  objCell.VerticalAlign = VerticalAlign.Top;
                    //operator

                    //edit control
                    objCell.Controls.Add(listEditFrom[i].EditControl);
                    objCell.Width = Unit.Percentage(100);
                    //row visibility:
                    objRow.Cells.Add(objCell);
                    objRow.Visible = true;
                }
                tblAdvancedSearchCondition.Rows.Add(objRow);
            }
        }



        private void BindCategories()
        {

            if (Settings_VendorProfile.General.ProductSearchMode != LocalUtils.SearchMode_Advanced
                || Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Category == false)
            {
                return;
            }


            BindCategoryAsTree();

        }
        private void BindCategoryAsTree()
        {
            List<CategoryInfo> list = CategoryController.GetByType(Settings_VendorProfile.General.TypeId);
            foreach (var item in list)
            {
                LocalizeObject_Category(item);
            }
            for (int i = 0; i < list.Count; i++)
            {
                list[i].Name = Utils.FormatLevelName(list[i].Name, list[i].Level, "..");
            }
            List<RecursiveCategoryData> listRecursiveData = new List<RecursiveCategoryData>();
            listRecursiveData = LocalUtils.ConvertCategoryListToRecursiveList(list);


            RecursiveCategoryItem orderedItems = RecursiveHelper.ConvertListToRecursiveItem(listRecursiveData);

            ArrayList listCategory = orderedItems.GetListOrdered();
            RecursiveCategoryItem a = new RecursiveCategoryItem();
            a.Id = -1;
            a.Name = "< " + Localization.GetString("SelectCategory", LocalResourceFile) + " >";
            listCategory.Add(a);

            ddlBuiltInField_Category.DataSource = listCategory;
            ddlBuiltInField_Category.DataBind();
            ddlBuiltInField_Category.SelectedValue = "-1";

        }

      

        protected void btnAdvancedSearch_Click(object sender, EventArgs e)
        {
            CurrentSearchStatus = "localsearch_advanced";
            BindProduct(0);
        }
        #endregion
        #region eventhandler
        public Setting_VendorProfile Settings_VendorProfile;

        override protected void OnInit(EventArgs e)
        {
            Settings_VendorProfile = new Setting_VendorProfile(ModuleId, TabId, ModuleConfiguration.ModuleSettings);
            if (Settings_VendorProfile.General.TypeId == -1)
            {
                Settings_VendorProfile = new Setting_VendorProfile(ModuleId, TabId);
            }
            base.OnInit(e);
        }
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Settings_VendorProfile.General.ProductStyle == LocalUtils.Product_ListStyle_Grid)
                {
                    GenerateUDFieldToGrid();
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Cache_TypeList.Count < 1 || Settings_VendorProfile.General.TypeId == -1)
            {
                return;
            }

            LocalResourceFile = Localization.GetResourceFile(this, "AuctionVendorProfile.ascx");
            ctlPagingControl.ResourceFile = Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared;

            if (!IsPostBack)
            {
                CurrentSearchStatus = "none";
             

                tblBasicSearch.Visible = Settings_VendorProfile.General.ProductSearchMode == LocalUtils.SearchMode_Basic;
                tblAdvancedSearchCondition.Visible = Settings_VendorProfile.General.ProductSearchMode == LocalUtils.SearchMode_Advanced;
                tblAdvancedSearchButton.Visible = Settings_VendorProfile.General.ProductSearchMode == LocalUtils.SearchMode_Advanced;

                if (Settings_VendorProfile.General.ProductSearchMode == LocalUtils.SearchMode_Advanced)
                {
                    BindCategories();
                   
                    if (Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Price)
                    {
                        OnOper_PriceSelectedIndexChanged();
                    }
                    if (CurrentType.AllowLocation && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Country)
                    {
                        BindLocationCountry();
                        OnLocationCountry_SelectedIndexChanged();
                    }
                }

                if (ddlSortField.Items.FindByValue(Settings_VendorProfile.General.SortField) != null)
                {
                    ddlSortField.SelectedIndex = -1;
                    ddlSortField.Items.FindByValue(Settings_VendorProfile.General.SortField).Selected = true;
                }
                if (ddlBuiltInField_Sort.Items.FindByValue(Settings_VendorProfile.General.SortField) != null)
                {
                    ddlBuiltInField_Sort.SelectedIndex = -1;
                    ddlBuiltInField_Sort.Items.FindByValue(Settings_VendorProfile.General.SortField).Selected = true;
                }

                //init the paging select
                int pageSize = 10;

                if (Settings_VendorProfile.General.ProductStyle == LocalUtils.Product_ListStyle_List)//List 支持多列绑定 
                {
                    pageSize = Settings_VendorProfile.Product_Paging.RowCount * Settings_VendorProfile.Product_Paging.ColCount;
                }
                else
                {
                    pageSize = Settings_VendorProfile.Product_Paging.RowCount;
                }
                List<int> pagingList = new List<int> { 5, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 500 };
                if (!pagingList.Contains(pageSize))
                {
                    pagingList.Add(pageSize);
                }
                foreach (var item in (from p in pagingList orderby p select p).ToList())
                {
                    ddlPage.Items.Add(new ListItem(item.ToString(), item.ToString()));
                    ddlBuiltInField_Paging.Items.Add(new ListItem(item.ToString(), item.ToString()));
                }
                ddlPage.Items.FindByValue(pageSize.ToString()).Selected = true;
                ddlBuiltInField_Paging.Items.FindByValue(pageSize.ToString()).Selected = true;

                BindProduct(0);


                //Rss
                hlRss.NavigateUrl = FullDomainName + "/DesktopModules/CrossClassified/ProductRss.aspx?ProductUserId=" +
                     VendorId.ToString() + "&ProductTypeId=" + Settings_VendorProfile.General.TypeId.ToString()
                     + "&tabid=" + TabId.ToString();
                DataBind();
            }
            if (Settings_VendorProfile.General.ProductSearchMode == LocalUtils.SearchMode_Advanced)
            {
                BuildUDFieldForm();
            }
        }
        #region location
        private void BindLocationCountry()
        {
            List<CountryInfo> list = CountryController.GetByPortals(PortalId);
            foreach (var item in list)
            {
                LocalizeObject_Country(item);
            }
            if (list.Count == 0)
            {
                return;
            }
            if (list.Count == 1)
            {
                trBuiltInField_Country.Visible = false;
                ddlBuiltInField_Country.DataSource = list;
                ddlBuiltInField_Country.DataBind();
            }
            else
            {
                trBuiltInField_Country.Visible = true;
                CountryInfo objNone = new CountryInfo();
                objNone.Name = "< " + DotNetNuke.Services.Localization.Localization.GetString("None_Specified") + " >";
                objNone.Id = -1;
                list.Insert(0, objNone);
                ddlBuiltInField_Country.DataSource = list;
                ddlBuiltInField_Country.DataBind();
                if (ddlBuiltInField_Country.Items.FindByValue("-1") != null)
                {
                    ddlBuiltInField_Country.SelectedIndex = -1;
                    ddlBuiltInField_Country.Items.FindByValue("-1").Selected = true;
                }
            }
        }
        protected void ddlBuiltInField_Country_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            OnLocationCountry_SelectedIndexChanged();
        }
        private void OnLocationCountry_SelectedIndexChanged()
        {
            if (CurrentType.AllowLocation && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Country && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_State)
            {
                trBuiltInField_State.Visible = true;
                ddlBuiltInField_State.Items.Clear();

                foreach (var item in StateController.GetByCountry(Convert.ToInt32(ddlBuiltInField_Country.SelectedValue)))
                {
                    LocalizeObject_State(item);
                    ddlBuiltInField_State.Items.Add(new ListItem(item.Name, item.Id.ToString()));
                }

                ddlBuiltInField_State.Items.Add(new ListItem("< " + DotNetNuke.Services.Localization.Localization.GetString("None_Specified") + " >", "-1"));

                ddlBuiltInField_State.DataBind();
                ddlBuiltInField_State.SelectedIndex = -1;
                ddlBuiltInField_State.Items.FindByValue("-1").Selected = true;

                OnLocationState_SelectedIndexChanged();
            }
        }

        protected void ddlBuiltInField_State_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            OnLocationState_SelectedIndexChanged();
        }
        private void OnLocationState_SelectedIndexChanged()
        {
            if (CurrentType.AllowLocation
                && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Country
                && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_State
                && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_City)
            {
                trBuiltInField_City.Visible = true;
                ddlBuiltInField_City.Items.Clear();

                foreach (var item in CityController.GetByState(Convert.ToInt32(ddlBuiltInField_State.SelectedValue)))
                {
                    LocalizeObject_City(item);
                    ddlBuiltInField_City.Items.Add(new ListItem(item.Name, item.Id.ToString()));

                }

                ddlBuiltInField_City.Items.Add(new ListItem("< " + DotNetNuke.Services.Localization.Localization.GetString("None_Specified") + " >", "-1"));

                ddlBuiltInField_City.DataBind();
                ddlBuiltInField_City.SelectedIndex = -1;
                ddlBuiltInField_City.Items.FindByValue("-1").Selected = true;
                OnLocationCity_SelectedIndexChanged();
            }
        }

        protected void ddlBuiltInField_City_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            OnLocationCity_SelectedIndexChanged();
        }

        private void OnLocationCity_SelectedIndexChanged()
        {
            if (CurrentType.AllowLocation
                && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Country
                && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_State
                && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_City
                && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Town)
            {
                trBuiltInField_Town.Visible = true;
                ddlBuiltInField_Town.Items.Clear();

                foreach (var item in TownController.GetByCity(Convert.ToInt32(ddlBuiltInField_City.SelectedValue)))
                {
                    LocalizeObject_Town(item);
                    ddlBuiltInField_Town.Items.Add(new ListItem(item.Name, item.Id.ToString()));

                }

                ddlBuiltInField_Town.Items.Add(new ListItem("< " + DotNetNuke.Services.Localization.Localization.GetString("None_Specified") + " >", "-1"));

                ddlBuiltInField_Town.DataBind();

                ddlBuiltInField_Town.SelectedIndex = -1;
                ddlBuiltInField_Town.Items.FindByValue("-1").Selected = true;
            }
        }
        #endregion
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            CurrentSearchStatus = "localsearch_basic";
            BindProduct(0);
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            CurrentSearchStatus = "localsearch_basic";
            BindProduct(0);
        }
        protected void btnAdvancedClear_Click(object sender, EventArgs e)
        {
            CurrentSearchStatus = "none";
            BindProduct(0);
        }
        protected void ctlPagingControl_PageChanged(object sender, EventArgs e)
        {
            BindProduct(ctlPagingControl.CurrentPage);
        }
        #endregion


        #region methods

        /// <summary>
        /// auction 的review 与其它不同，应该获取当前vendor 的所有产品review 平均，因为auction 通常都是一次性消费，在没有卖出之前，是没有机会获取review的
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        protected string GetRatingImage(string productId)
        {
            ProductInfo objProduct = ProductController.Get(Convert.ToInt32(productId));

            string imgRating = Settings_VendorProfile.Product_Content.RatingImage;
            return LocalUtils.ModuleRootPath + "images/ratings/" + imgRating + "/" + imgRating +
                Convert.ToInt32(RatingController.GetAverageForVendor(objProduct.UserId)).ToString() + ".gif";
        }

       
        public string GetCurrentBid(string productId)
        {
            return CP_Auction.Business.BidController.GetCurrentBid(Convert.ToInt32(productId)).Bid.ToString();
        }
        public string GetCurrentBidder(string productId)
        {
            return CP_Auction.Business.BidController.GetCurrentBid(Convert.ToInt32(productId)).BidderName;
        }
     

    

        public string GetBidCount(string productId)
        {
            return CP_Auction.Business.BidController.GetByProduct(Convert.ToInt32(productId)).Count().ToString();
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
        public string GetRemainTime(string productId)
        {
            ProductInfo objProduct = ProductController.Get(Convert.ToInt32(productId));
            TimeSpan objSpan = objProduct.ExpireDate - DateTime.Now;
            if (objSpan.Days > 0)
            {
                return objSpan.Days.ToString() + " " + Localization.GetString("Days", LocalResourceFile)
                    + ", " + objSpan.Hours.ToString() + " " + Localization.GetString("Hours", LocalResourceFile);
            }
            else
            {
                return objSpan.Hours.ToString() + " " + Localization.GetString("Hours", LocalResourceFile);
            }
        }
        #endregion
        #region data bind
        /// <summary>
        /// return product list when current search status = "none"
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="totalRecords"></param>
        /// <returns></returns>
        private List<ProductInfo> GetProducts_None(int pageIndex, ref int pageSize, ref int totalRecords)
        {
            if (Settings_VendorProfile.General.ProductStyle == LocalUtils.Product_ListStyle_List)//List 支持多列绑定 
            {
                pageSize = Settings_VendorProfile.Product_Paging.RowCount * Settings_VendorProfile.Product_Paging.ColCount;
            }
            else
            {
                pageSize = Settings_VendorProfile.Product_Paging.RowCount;
            }

            string cultureCode = "";
            if (!SupportsContentLocalization
                || string.IsNullOrEmpty(PortalSettings.ActiveTab.CultureCode)
                || PortalSettings.ActiveTab.CultureCode == PortalSettings.DefaultLanguage)
            {
                cultureCode = "";
            }
            else
            {
                cultureCode = PortalSettings.ActiveTab.CultureCode;
            }

            List<ProductInfo> list = new List<ProductInfo>();

            list = ProductController.GetByModuleSettings(Settings_VendorProfile.General.TypeId, GetUserId(), "", VendorId.ToString(),
          false, false, Settings_VendorProfile.Product_Image.ShowImageOnly,
          "", Settings_VendorProfile.General.SortField
          , pageSize, Settings_VendorProfile.Product_Paging.ShowPage, cultureCode, pageSize, pageIndex, ref totalRecords);


            return list;
        }
        /// <summary>
        /// return product list when current search = localsearch_basic
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="totalRecords"></param>
        /// <returns></returns>
        private List<ProductInfo> GetProducts_LocalSearch_Basic(int pageIndex, ref int pageSize, ref int totalRecords)
        {
            if (Settings_VendorProfile.General.ProductStyle == LocalUtils.Product_ListStyle_List)//List 支持多列绑定 
            {
                pageSize = Settings_VendorProfile.Product_Paging.RowCount * Settings_VendorProfile.Product_Paging.ColCount;
            }
            else
            {
                pageSize = Settings_VendorProfile.Product_Paging.RowCount;
            }

            //if we allow user to choose paging
            if (Settings_VendorProfile.Product_Search_Basic.ShowPageInSearch)
            {
                pageSize = Convert.ToInt32(ddlPage.SelectedValue);
            }

            string cultureCode = "";
            if (!SupportsContentLocalization
                || string.IsNullOrEmpty(PortalSettings.ActiveTab.CultureCode)
                || PortalSettings.ActiveTab.CultureCode == PortalSettings.DefaultLanguage)
            {
                cultureCode = "";
            }
            else
            {
                cultureCode = PortalSettings.ActiveTab.CultureCode;
            }

            List<ProductInfo> list = new List<ProductInfo>();
            PortalSecurity ps = new PortalSecurity();


            list = ProductController.GetByModuleSettings(Settings_VendorProfile.General.TypeId, GetUserId(), "", VendorId.ToString(),
          false, false, Settings_VendorProfile.Product_Image.ShowImageOnly,
           ps.InputFilter(txtSearch.Text.Trim(), PortalSecurity.FilterFlag.NoSQL),

          Settings_VendorProfile.Product_Search_Basic.ShowSortInSearch ? ddlSortField.SelectedValue : Settings_VendorProfile.General.SortField,
           pageSize, Settings_VendorProfile.Product_Paging.ShowPage, cultureCode, pageSize, pageIndex, ref totalRecords);


            return list;
        }


        /// <summary>
        /// return data source when in local advanced search
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="totalRecords"></param>
        /// <returns></returns>
        private List<ProductInfo> GetProducts_LocalSearch_Advanced(int pageIndex, ref int pageSize, ref int totalRecords)
        {
            if (Settings_VendorProfile.General.ProductStyle == LocalUtils.Product_ListStyle_List)//List 支持多列绑定 
            {
                pageSize = Settings_VendorProfile.Product_Paging.RowCount * Settings_VendorProfile.Product_Paging.ColCount;
            }
            else
            {
                pageSize = Settings_VendorProfile.Product_Paging.RowCount;
            }

            if (Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Paging)
            {
                pageSize = Convert.ToInt32(ddlBuiltInField_Paging.SelectedValue);
            }
            string sort = Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Sort ? ddlBuiltInField_Sort.SelectedValue : Settings_VendorProfile.General.SortField;

            List<string> idList = new List<string>();
            List<string> valueList = new List<string>();
            List<string> operList = new List<string>();

            if (ListEditControls != null
                && Udt_SearchList != null
                && Udt_SearchList.Count > 0)
            {
                int i = 0;

                foreach (EditControl item in ListEditControls.Values)
                {
                    if (!string.IsNullOrEmpty(item.Value)
                        && !string.IsNullOrEmpty(Udt_SearchOperList[i].SelectedValue))
                    {
                        idList.Add(item.FieldID.ToString());
                        valueList.Add(item.Value.Trim());
                        operList.Add(Udt_SearchOperList[i].SelectedValue);
                    }
                    i += 1;
                }
            }


            List<ProductInfo> wholeList = (from p in ProductController.GetByDnnSearch(Settings_VendorProfile.General.TypeId) where p.UserId == VendorId select p).ToList();

            List<ProductInfo> validList = new List<ProductInfo>();
            string value, oper;
            DateTime searchDate;
            foreach (var item in wholeList)
            {
                ProductInfo objProduct = ProductController.Get(item.Id);
                LocalizeObject_Product(objProduct);
                //first check product title
                if (Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Title
                    && !string.IsNullOrEmpty(txtBuiltInField_Title.Text.Trim()))
                {
                    value = txtBuiltInField_Title.Text.Trim();
                    oper = ddlOper_Title.SelectedValue;
                    switch (oper.ToLower())
                    {
                        //if like, check unlike
                        case "like":
                            if (objProduct.Name.ToLower().Contains(value.ToLower())==false)
                            {
                                continue;
                            }
                            break;
                        case "unlike"://if unlike, check like
                            if (objProduct.Name.ToLower().Contains(value.ToLower())==true)
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                            break;
                    }
                }
                //check product Sku
                if (Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Sku
                    && !string.IsNullOrEmpty(txtBuiltInField_Sku.Text.Trim()))
                {
                    value = txtBuiltInField_Sku.Text.Trim();
                    oper = ddlOper_Sku.SelectedValue;
                    switch (oper.ToLower())
                    {
                        //if like, check unlike
                        case "like":
                            if (objProduct.Sku.ToLower().Contains(value.ToLower())==false)
                            {
                                continue;
                            }
                            break;
                        case "unlike"://if unlike, check like
                            if (objProduct.Sku.ToLower().Contains(value.ToLower())==true)
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                            break;
                    }
                }
                if (Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Price)
                {
                    oper = ddlOper_Price.SelectedValue;
                    switch (oper.ToLower())
                    {
                        case "between":
                            if (LocalUtils.IsDecimal(txtBuiltInField_Price_From.Text)
                       && LocalUtils.IsDecimal(txtBuiltInField_Price_To.Text))
                            {
                                if (decimal.Parse(txtBuiltInField_Price_To.Text) >= decimal.Parse(txtBuiltInField_Price_From.Text))
                                {
                                    if (objProduct.StartPrice < decimal.Parse(txtBuiltInField_Price_From.Text)
                                        || objProduct.StartPrice > decimal.Parse(txtBuiltInField_Price_To.Text))
                                    {
                                        continue;
                                    }
                                }
                            }
                            break;
                        case "lessthan":
                            if (LocalUtils.IsDecimal(txtBuiltInField_Price.Text) && objProduct.StartPrice >= decimal.Parse(txtBuiltInField_Price.Text))
                                continue;
                            break;
                        case "equal":
                            if (LocalUtils.IsDecimal(txtBuiltInField_Price.Text) && objProduct.StartPrice != decimal.Parse(txtBuiltInField_Price.Text))
                                continue;
                            break;
                        case "greaterthan":
                            if (LocalUtils.IsDecimal(txtBuiltInField_Price.Text) && objProduct.StartPrice <= decimal.Parse(txtBuiltInField_Price.Text))
                                continue;
                            break;
                        default:
                            continue;
                            break;
                    }
                }
                if (Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Category && ddlBuiltInField_Category.SelectedValue != "-1")
                {
                    value = ddlBuiltInField_Category.SelectedValue;
                    oper = ddlOper_Category.SelectedValue;
                    string[] categoryList = objProduct.Categories.Split(',');
                    switch (oper.ToLower())
                    {
                        //if equal
                        case "equal":
                            if (categoryList.Contains(value) == false)
                            {
                                continue;
                            }
                            break;
                        case "unequal"://if unequal
                            if (categoryList.Contains(value) == true)
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                            break;
                    }
                }
              
                if (Settings_VendorProfile.Product_Search_Advanced.BuiltInField_CreatedDate
                && ddpCreatedDate.SelectedDate != null
                && !string.IsNullOrEmpty(ddpCreatedDate.SelectedDate.Value.ToString())
                    && LocalUtils.IsDate(ddpCreatedDate.SelectedDate.Value.ToString()))
                {
                    searchDate = ddpCreatedDate.SelectedDate.Value;
                    oper = ddlOper_CreatedDate.SelectedValue;

                    switch (oper.ToLower())
                    {
                        case "lessthan":
                            if (objProduct.CreatedDate >= searchDate)
                            {
                                continue;
                            }
                            break;
                        case "equal":
                            //if create in same day
                            if (objProduct.CreatedDate.ToShortDateString() != searchDate.ToShortDateString())
                            {
                                continue;
                            }
                            break;
                        case "greaterthan":
                            if (objProduct.CreatedDate <= searchDate)
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                    }
                }
                if (Settings_VendorProfile.Product_Search_Advanced.BuiltInField_PublishDate
              && ddpPublishDate.SelectedDate != null
              && !string.IsNullOrEmpty(ddpPublishDate.SelectedDate.Value.ToString())
                    && LocalUtils.IsDate(ddpPublishDate.SelectedDate.Value.ToString()))
                {
                    searchDate = ddpPublishDate.SelectedDate.Value;
                    oper = ddlOper_PublishDate.SelectedValue;

                    switch (oper.ToLower())
                    {
                        case "lessthan":
                            if (objProduct.PublishDate >= searchDate)
                            {
                                continue;
                            }
                            break;
                        case "equal":
                            //if create in same day
                            if (objProduct.PublishDate.ToShortDateString() != searchDate.ToShortDateString())
                            {
                                continue;
                            }
                            break;
                        case "greaterthan":
                            if (objProduct.PublishDate <= searchDate)
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                    }
                }
                if (Settings_VendorProfile.Product_Search_Advanced.BuiltInField_ExpireDate
            && ddpExpireDate.SelectedDate != null
            && !string.IsNullOrEmpty(ddpExpireDate.SelectedDate.Value.ToString())
                    && LocalUtils.IsDate(ddpExpireDate.SelectedDate.Value.ToString()))
                {
                    searchDate = ddpExpireDate.SelectedDate.Value;
                    oper = ddlOper_ExpireDate.SelectedValue;

                    switch (oper.ToLower())
                    {
                        case "lessthan":
                            if (objProduct.ExpireDate != null
                                && Null.IsNull(objProduct.ExpireDate) == false
                                && objProduct.ExpireDate >= searchDate)
                            {
                                continue;
                            }
                            break;
                        case "equal":
                            if (objProduct.ExpireDate == null
                                || Null.IsNull(objProduct.ExpireDate) == true
                                || objProduct.ExpireDate.ToShortDateString() != searchDate.ToShortDateString())
                            {
                                continue;
                            }
                            break;
                        case "greaterthan":
                            if (objProduct.ExpireDate == null
                                || Null.IsNull(objProduct.ExpireDate) == true
                                || objProduct.ExpireDate <= searchDate)
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                    }
                }
                if (Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Views &&
                !string.IsNullOrEmpty(txtBuiltInField_Views.Text)
                    && Utils.IsNumber(txtBuiltInField_Views.Text)
                    && txtBuiltInField_Views.Text != "0")
                {
                    value = txtBuiltInField_Views.Text.Trim();
                    oper = ddlOper_Views.SelectedValue;

                    switch (oper.ToLower())
                    {
                        case "lessthan":
                            if (objProduct.Views >= int.Parse(value))
                            {
                                continue;
                            }
                            break;
                        case "equal":
                            if (objProduct.Views != int.Parse(value))
                            {
                                continue;
                            }
                            break;
                        case "greaterthan":
                            if (objProduct.Views <= int.Parse(value))
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                    }
                }
                if (Settings_VendorProfile.Product_Search_Advanced.BuiltInField_RatingAverage
                && ddlBuiltInField_RatingAverage.SelectedValue != "-1")
                {
                    value = ddlBuiltInField_RatingAverage.SelectedValue;
                    oper = ddlOper_RatingAverage.SelectedValue;

                    switch (oper.ToLower())
                    {
                        case "lessthan":
                            if (objProduct.RatingAverage >= int.Parse(value))
                            {
                                continue;
                            }
                            break;
                        case "equal":
                            if (objProduct.RatingAverage != int.Parse(value))
                            {
                                continue;
                            }
                            break;
                        case "greaterthan":
                            if (objProduct.RatingAverage <= int.Parse(value))
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                    }
                }
                //Country
                if (CurrentType.AllowLocation
              && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Country
            && ddlBuiltInField_Country.SelectedValue != "-1")
                {
                    value = ddlBuiltInField_Country.SelectedValue;
                    oper = ddlOper_Country.SelectedValue;
                    switch (oper.ToLower())
                    {
                        //if equal
                        case "equal":
                            if (objProduct.CountryId.ToString() != value)
                            {
                                continue;
                            }
                            break;
                        case "unequal"://if unequal
                            if (objProduct.CountryId.ToString() == value)
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                            break;
                    }
                }
                //State
                if (CurrentType.AllowLocation
                    && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Country
              && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_State
            && ddlBuiltInField_State.SelectedValue != "-1")
                {
                    value = ddlBuiltInField_State.SelectedValue;
                    oper = ddlOper_State.SelectedValue;
                    switch (oper.ToLower())
                    {
                        //if equal
                        case "equal":
                            if (objProduct.StateId.ToString() != value)
                            {
                                continue;
                            }
                            break;
                        case "unequal"://if unequal
                            if (objProduct.StateId.ToString() == value)
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                            break;
                    }
                }
                //City
                if (CurrentType.AllowLocation
                         && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Country
              && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_State
              && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_City
            && ddlBuiltInField_City.SelectedValue != "-1")
                {
                    value = ddlBuiltInField_City.SelectedValue;
                    oper = ddlOper_City.SelectedValue;
                    switch (oper.ToLower())
                    {
                        //if equal
                        case "equal":
                            if (objProduct.CityId.ToString() != value)
                            {
                                continue;
                            }
                            break;
                        case "unequal"://if unequal
                            if (objProduct.CityId.ToString() == value)
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                            break;
                    }
                }
                //Town
                if (CurrentType.AllowLocation
                      && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Country
              && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_State
              && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_City
              && Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Town
            && ddlBuiltInField_Town.SelectedValue != "-1")
                {
                    value = ddlBuiltInField_Town.SelectedValue;
                    oper = ddlOper_Town.SelectedValue;
                    switch (oper.ToLower())
                    {
                        //if equal
                        case "equal":
                            if (objProduct.TownId.ToString() != value)
                            {
                                continue;
                            }
                            break;
                        case "unequal"://if unequal
                            if (objProduct.TownId.ToString() == value)
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                            break;
                    }
                }
                //在单独的函数中检查是否满足udt search
                if (MeetUDTSearch(objProduct.Id, idList, valueList, operList) == false)
                {
                    continue;
                }
                validList.Add(objProduct);
            }

            List<ProductInfo> sortedList = new List<ProductInfo>();
            sortedList = GetSortedList(validList, false, sort);

            //now we get sorted list
            totalRecords = sortedList.Count;
            return sortedList.Skip(pageSize * (pageIndex)).Take(pageSize).ToList();
        }
        /// <summary>
        /// this code piece exists in both GetProducts_LocalSearch_Advanced and GetProducts_ExternalSearch_Advanced,
        /// so we need to abstrace it as a single method
        /// </summary>
        /// <param name="validList"></param>
        /// <param name="ignoreSortIndex"></param>
        /// <param name="sortField"></param>
        /// <returns></returns>
        private List<ProductInfo> GetSortedList(List<ProductInfo> validList, bool ignoreSortIndex, string sortField)
        {
            List<ProductInfo> sortedList = new List<ProductInfo>();
            if (ignoreSortIndex == true)
            {
                switch (sortField)
                {
                    case "CreationDateDesc":
                        sortedList = (from p in validList orderby p.CreatedDate descending select p).ToList();
                        break;
                    case "CreationDateAsc":
                        sortedList = (from p in validList orderby p.CreatedDate ascending select p).ToList();
                        break;
                    case "PublishDateDesc":
                        sortedList = (from p in validList orderby p.PublishDate descending select p).ToList();
                        break;
                    case "PublishDateAsc":
                        sortedList = (from p in validList orderby p.PublishDate ascending select p).ToList();
                        break;
                    case "LastModifiedDateDesc":
                        sortedList = (from p in validList orderby p.LastModifiedDate descending select p).ToList();
                        break;
                    case "LastModifiedDateAsc":
                        sortedList = (from p in validList orderby p.LastModifiedDate ascending select p).ToList();
                        break;
                    case "ViewsDesc":
                        sortedList = (from p in validList orderby p.Views descending select p).ToList();
                        break;
                    case "ViewsAsc":
                        sortedList = (from p in validList orderby p.Views ascending select p).ToList();
                        break;
                    case "NameDesc":
                        sortedList = (from p in validList orderby p.Name descending select p).ToList();
                        break;
                    case "NameAsc":
                        sortedList = (from p in validList orderby p.Name ascending select p).ToList();
                        break;
                    case "PurchasePriceDesc":
                        sortedList = (from p in validList orderby p.PurchasePrice descending select p).ToList();
                        break;
                    case "PurchasePriceAsc":
                        sortedList = (from p in validList orderby p.PurchasePrice ascending select p).ToList();
                        break;
                    case "StartPriceDesc":
                        sortedList = (from p in validList orderby p.StartPrice descending select p).ToList();
                        break;
                    case "StartPriceAsc":
                        sortedList = (from p in validList orderby p.StartPrice ascending select p).ToList();
                        break;
                    default:
                        sortedList = (from p in validList orderby p.CreatedDate descending select p).ToList();
                        break;
                }
            }
            else
            {
                switch (sortField)
                {
                    case "CreationDateDesc":
                        sortedList = (from p in validList orderby p.Order ascending, p.CreatedDate descending select p).ToList();
                        break;
                    case "CreationDateAsc":
                        sortedList = (from p in validList orderby p.Order ascending, p.CreatedDate ascending select p).ToList();
                        break;
                    case "PublishDateDesc":
                        sortedList = (from p in validList orderby p.Order ascending, p.PublishDate descending select p).ToList();
                        break;
                    case "PublishDateAsc":
                        sortedList = (from p in validList orderby p.Order ascending, p.PublishDate ascending select p).ToList();
                        break;
                    case "LastModifiedDateDesc":
                        sortedList = (from p in validList orderby p.Order ascending, p.LastModifiedDate descending select p).ToList();
                        break;
                    case "LastModifiedDateAsc":
                        sortedList = (from p in validList orderby p.Order ascending, p.LastModifiedDate ascending select p).ToList();
                        break;
                    case "ViewsDesc":
                        sortedList = (from p in validList orderby p.Order ascending, p.Views descending select p).ToList();
                        break;
                    case "ViewsAsc":
                        sortedList = (from p in validList orderby p.Order ascending, p.Views ascending select p).ToList();
                        break;
                    case "NameDesc":
                        sortedList = (from p in validList orderby p.Order ascending, p.Name descending select p).ToList();
                        break;
                    case "NameAsc":
                        sortedList = (from p in validList orderby p.Order ascending, p.Name ascending select p).ToList();
                        break;
                    case "PurchasePriceDesc":
                        sortedList = (from p in validList orderby p.Order ascending, p.PurchasePrice descending select p).ToList();
                        break;
                    case "PurchasePriceAsc":
                        sortedList = (from p in validList orderby p.Order ascending, p.PurchasePrice ascending select p).ToList();
                        break;
                    case "StartPriceDesc":
                        sortedList = (from p in validList orderby p.Order ascending, p.StartPrice descending select p).ToList();
                        break;
                    case "StartPriceAsc":
                        sortedList = (from p in validList orderby p.Order ascending, p.StartPrice ascending select p).ToList();
                        break;
                    default:
                        sortedList = (from p in validList orderby p.Order ascending, p.CreatedDate descending select p).ToList();
                        break;
                }
            }
            return sortedList;

        }
       

        /// <summary>
        /// whether current product pass the udt search
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        private bool MeetUDTSearch(int productId, List<string> idList, List<string> valueList, List<string> operList)
        {
            string id, value, oper;

            for (int i = 0; i < idList.Count; i++)
            {
                id = idList[i];
                value = valueList[i];
                oper = operList[i];


                UDFieldInfo objUDField = UDFieldController.Get(int.Parse(id));
                if (objUDField == null || objUDField.TypeId != Settings_VendorProfile.General.TypeId)
                {
                    return false;
                }
                LocalizeObject_UDField(objUDField);
                UDDataInfo objUDData = UDDataController.GetByCulture(int.Parse(id), productId,GetCurrentCultureCode());
                    
                //when objUDData is null, get its udt field default value
                string productValue = objUDData == null ? objUDField.DefaultValue : objUDData.FieldValue;
                if (string.IsNullOrEmpty(productValue))
                {
                    return false;
                }

                //now compare values
                switch (oper.ToLower())
                {
                    case "equal":
                        if (value.ToLower() != productValue.ToLower())
                        {
                            return false;
                        }
                        break;
                    case "unequal":
                        if (value.ToLower() == productValue.ToLower())
                        {
                            return false;
                        }
                        break;
                    case "like":
                        if (productValue.ToLower().Contains(value.ToLower()) == false)
                        {
                            return false;
                        }
                        break;
                    case "unlike":
                        if (productValue.ToLower().Contains(value.ToLower()) == true)
                        {
                            return false;
                        }
                        break;
                    case "contain":
                    case "notcontain":

                        string[] existingValues = productValue.Split(';');
                        if (oper.ToLower() == "contain")
                        {
                            foreach (var item in value.Split(';'))
                            {
                                if (!existingValues.Contains(item))
                                {
                                    return false;
                                }
                            }
                        }
                        if (oper.ToLower() == "notcontain")
                        {
                            foreach (var item in value.Split(';'))
                            {
                                if (existingValues.Contains(item))
                                {
                                    return false;
                                }
                            }
                        }

                        break;
                    case "lessthan":

                        if (objUDField.FieldType.ToLower() == "int32")
                        {
                            if (Utils.IsNumber(value) == false || Utils.IsNumber(productValue) == false)
                            {
                                return false;
                            }
                            if (int.Parse(productValue) >= int.Parse(value))
                            {
                                return false;
                            }
                        }

                        if (objUDField.FieldType.ToLower() == "decimal"
                            || objUDField.FieldType.ToLower() == "currency")
                        {
                            if (Microsoft.VisualBasic.Information.IsNumeric(value) == false
                                || Microsoft.VisualBasic.Information.IsNumeric(productValue) == false)
                            {
                                return false;
                            }
                            if (Decimal.Parse(productValue) >= Decimal.Parse(value))
                            {
                                return false;
                            }
                        }

                        if (objUDField.FieldType.ToLower() == "datetime"
                            || objUDField.FieldType.ToLower() == "date"
                            || objUDField.FieldType.ToLower() == "time")
                        {
                            if (LocalUtils.IsDate(value) == false || LocalUtils.IsDate(productValue) == false)
                            {
                                return false;
                            }
                            if (DateTime.Parse(productValue) >= DateTime.Parse(value))
                            {
                                return false;
                            }
                        }
                        break;

                    case "greaterthan":

                        if (objUDField.FieldType.ToLower() == "int32")
                        {
                            if (Utils.IsNumber(value) == false || Utils.IsNumber(productValue) == false)
                            {
                                return false;
                            }
                            if (int.Parse(productValue) <= int.Parse(value))
                            {
                                return false;
                            }
                        }

                        if (objUDField.FieldType.ToLower() == "decimal"
                            || objUDField.FieldType.ToLower() == "currency")
                        {
                            if (Microsoft.VisualBasic.Information.IsNumeric(value) == false
                                || Microsoft.VisualBasic.Information.IsNumeric(productValue) == false)
                            {
                                return false;
                            }
                            if (Decimal.Parse(productValue) <= Decimal.Parse(value))
                            {
                                return false;
                            }
                        }

                        if (objUDField.FieldType.ToLower() == "datetime"
                            || objUDField.FieldType.ToLower() == "date"
                            || objUDField.FieldType.ToLower() == "time")
                        {
                            if (LocalUtils.IsDate(value) == false || LocalUtils.IsDate(productValue) == false)
                            {
                                return false;
                            }
                            if (DateTime.Parse(productValue) <= DateTime.Parse(value))
                            {
                                return false;
                            }
                        }
                        break;
                    default:
                        break;
                }
            }
            return true;
        }


        private void BindProduct(int pageIndex)
        {
            int totalRecords = 0;
            int pageSize = 10;

            List<ProductInfo> list = new List<ProductInfo>();

            switch (CurrentSearchStatus.ToLower())
            {
                case "none":
                    list = GetProducts_None(pageIndex, ref pageSize, ref totalRecords);
                    break;
                case "localsearch_basic":
                    list = GetProducts_LocalSearch_Basic(pageIndex, ref pageSize, ref totalRecords);
                    break;
                case "localsearch_advanced":
                    list = GetProducts_LocalSearch_Advanced(pageIndex, ref pageSize, ref totalRecords);
                    break;
              
                default:
                    list = GetProducts_None(pageIndex, ref pageSize, ref totalRecords);
                    break;
            }
            foreach (var item in list)
            {
                LocalizeObject_Product(item);
            }

            ////开始绑定数据
            if (Settings_VendorProfile.General.ProductStyle == LocalUtils.Product_ListStyle_List)
            {
                dlProduct.Visible = true;
                dlProduct.DataSource = list;
                dlProduct.DataBind();
            }

            if (Settings_VendorProfile.General.ProductStyle == LocalUtils.Product_ListStyle_Grid)
            {
                grProduct.Visible = true;
                //仅在需要的时候才绑定自定义数据
                if (UDFieldList.Count > 0 && Settings_VendorProfile.Product_UDField.UseBuiltInTemplate && Settings_VendorProfile.Product_UDField.UDFieldList.Trim() != "")
                {
                    grProduct.DataSource = CreateCustomizeDataTable(list);
                }
                else
                {
                    grProduct.DataSource = list;
                }
                grProduct.DataBind();
            }

            if (Settings_VendorProfile.Product_Paging.ShowPage)
            {
                tblPaging.Visible = true;
                ctlPagingControl.Span = Settings_VendorProfile.Product_Paging.PageSpan;
                ctlPagingControl.ShowPageInfo = Settings_VendorProfile.Product_Paging.ShowPageInfo;
                ctlPagingControl.CurrentPage = pageIndex;
                ctlPagingControl.PageSize = pageSize;
                ctlPagingControl.RecordCount = totalRecords;
            }
        }
        private void GenerateUDFieldToGrid()
        {
            //仅在需要的时候才加入自定义数据的template field
            if (UDFieldList.Count > 0 && Settings_VendorProfile.Product_UDField.UseBuiltInTemplate && Settings_VendorProfile.Product_UDField.UDFieldList.Trim() != "")
            {
                string[] listDisplay = Settings_VendorProfile.Product_UDField.UDFieldList.Split(',');
                List<UDFieldInfo> listUDField = new List<UDFieldInfo>();
                foreach (UDFieldInfo item in UDFieldList)
                {
                    foreach (string id in listDisplay)
                    {
                        if (item.Id.ToString() == id)
                        {
                            listUDField.Add(item);
                            break;
                        }
                    }
                }
                foreach (UDFieldInfo item in listUDField)
                {
                    DisplayControl ctlControl = DataType.get_ByName(item.FieldType).DisplayControl;
                    ctlControl.FieldName = item.FieldName;
                    ctlControl.FieldTitle = item.FieldTitle;
                    ctlControl.FieldType = item.FieldType;
                    ctlControl.Width = Settings_VendorProfile.Product_UDField.UDField_ImageWidth;
                    ctlControl.Height = Settings_VendorProfile.Product_UDField.UDField_ImageHeight;
                    ctlControl.Target = Settings_VendorProfile.General.LinkTarget;
                    DataControlField bound = ctlControl.BoundField;
                    grProduct.Columns.Add(bound);
                }
            }
        }
        private System.Data.DataTable CreateCustomizeDataTable(List<ProductInfo> list)
        {
            DataTable dt = new DataTable();

            //First we need select out udfields which will display 
            string[] listDisplay = Settings_VendorProfile.Product_UDField.UDFieldList.Split(',');
            List<UDFieldInfo> listUDField = new List<UDFieldInfo>();
            foreach (UDFieldInfo item in UDFieldList)
            {
                foreach (string id in listDisplay)
                {
                    if (item.Id.ToString() == id)
                    {
                        listUDField.Add(item);
                        break;
                    }
                }
            }

            foreach (PropertyInfo info in typeof(ProductInfo).GetProperties())
            {
                dt.Columns.Add(new DataColumn(info.Name, info.PropertyType));
            }
            foreach (UDFieldInfo item in listUDField)
            {
                DataColumn objColumn = new DataColumn();
                objColumn.ColumnName = item.FieldName;
                objColumn.DataType = typeof(string);
                dt.Columns.Add(objColumn);
            }
            foreach (ProductInfo item in list)
            {
                DataRow row = dt.NewRow();
                foreach (PropertyInfo info in typeof(ProductInfo).GetProperties())
                {
                    row[info.Name] = info.GetValue(item, null);
                }
                foreach (UDFieldInfo objField in listUDField)
                {

                    string value = string.Empty;
                    //first, take default value
                    if (!string.IsNullOrEmpty(objField.DefaultValue))
                    {
                        value = objField.DefaultValue;
                    }
                    //then take database value
                    UDDataInfo objData = UDDataController.GetByCulture(objField.Id, item.Id,
                        GetCurrentCultureCode());

                    if (objData != null)
                    {
                        value = objData.FieldValue;
                    }
                    if (!string.IsNullOrEmpty(value))
                    {
                        if (value.StartsWith("FileID=") && (objField.FieldType.ToLower() == "url" || objField.FieldType.ToLower() == "image"))
                        {
                            value = GetRelativeUrlByFileId_Local(value);//user defined field 只能retrieve 本地文件
                        }
                        if (objField.FieldType.ToLower() == "url" && Utils.IsNumber(value))
                        {
                            value = Globals.NavigateURL(Convert.ToInt32(value));
                        }
                    }

                    row[objField.FieldName] = string.IsNullOrEmpty(value) ? "" : value;
                }
                dt.Rows.Add(row);
            }
            return dt;
        }

        protected string GetShortenSummary(string productId, string summary)
        {
            int length = Settings_VendorProfile.Product_Content.SummaryLength;
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
            int detailTabId = GetSubModulePageId_Detail(Settings_VendorProfile.General.DetailTab, Settings_VendorProfile.General.TypeId);

          
            return GenerateProductDetailUrl(detailTabId, productId, productName);
        }
        protected string GetUserNavigate(string userId)
        {
            int userTab = TabId;

            userTab = GetSubModulePageId_List(Settings_VendorProfile.General.TypeId);

            return Globals.NavigateURL(userTab, "", "ProductUserId=" + userId, "ProductTypeId=" + Settings_VendorProfile.General.TypeId);
        }

        protected string GetAuthorAvatar(string userId, string avartarEmail)
        {
            //first we take site avartar
            if (!string.IsNullOrEmpty(userId) && userId.Trim() != "-1")
            {
                DotNetNuke.Entities.Users.UserInfo objUser = DotNetNuke.Entities.Users.UserController.GetUserById(PortalId, Convert.ToInt32(userId));
                if (objUser != null)
                {
                    if (!string.IsNullOrEmpty(objUser.Profile.PhotoURL))
                    {
                        return objUser.Profile.PhotoURL;
                    }
                }
            }
            return GetGravatarUrl(avartarEmail, "48");
        }
        #endregion


        protected void dlProduct_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (UDFieldList.Count > 0
                && Settings_VendorProfile.Product_UDField.UseBuiltInTemplate
                && !string.IsNullOrEmpty(Settings_VendorProfile.Product_UDField.UDFieldList))
            {
                System.Web.UI.HtmlControls.HtmlTable tblUDT = (System.Web.UI.HtmlControls.HtmlTable)e.Item.FindControl("tblUserDefinedField");
                int productId = Convert.ToInt32(((Label)e.Item.FindControl("lblId")).Text);
                string[] displayList = Settings_VendorProfile.Product_UDField.UDFieldList.Split(',');

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

                        //lblControl.Text = string.IsNullOrEmpty(objUDField.FieldTitle) ? objUDField.FieldName : objUDField.FieldTitle + ":";
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


        #region bid now button

        protected void grProduct_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument);
            ProductInfo objProduct = ProductController.Get(productId);
            LocalizeObject_Product(objProduct);
            switch (e.CommandName)
            {
                case "BidNow":
                    Response.Redirect(GetNavigate(objProduct.Id.ToString(), objProduct.Name), true);
                    break;
                default:
                    break;
            }
        }
        protected void dlProduct_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument);
            ProductInfo objProduct = ProductController.Get(productId);
            LocalizeObject_Product(objProduct);
            switch (e.CommandName)
            {
                case "BidNow":
                    Response.Redirect(GetNavigate(objProduct.Id.ToString(), objProduct.Name), true);
                    break;
                default:
                    break;
            }
        }

        #endregion
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
                ctlControl.Width = Settings_VendorProfile.Product_UDField.UDField_ImageWidth;
                ctlControl.Height = Settings_VendorProfile.Product_UDField.UDField_ImageHeight;
                ctlControl.NormalizeFlag = objUDField.NormalizeFlag;
                ctlControl.OutputSettings = objUDField.OutputSettings;
                ctlControl.Target = Settings_VendorProfile.General.LinkTarget;
                ctlControl.InputSettings = objUDField.InputSettings;
                ctlControl.CheckBoxList_Enabled = Settings_VendorProfile.Product_UDField.UDField_CheckBoxList_Enabled;
                ctlControl.CheckBoxList_RepeatColumns = Settings_VendorProfile.Product_UDField.UDField_CheckBoxList_RepeatColumns;
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

        protected void grProduct_DataBinding(object sender, EventArgs e)
        {
            if (grProduct.Columns[0] != null)//image
            {
                grProduct.Columns[0].Visible = Settings_VendorProfile.Product_Image.ShowImage && CurrentType.FieldEnable_Image;
            }

            if (grProduct.Columns[1] != null)//name
            {
                grProduct.Columns[1].Visible = Settings_VendorProfile.Product_Content.ShowName;
            }
          
            if (grProduct.Columns[2] != null)//rating
            {
                grProduct.Columns[2].Visible = Settings_VendorProfile.Product_Content.ShowRating;
            }
            if (grProduct.Columns[3] != null)//views
            {
                grProduct.Columns[3].Visible = Settings_VendorProfile.Product_Content.ShowViews;
            }
            if (grProduct.Columns[4] != null)//country
            {
                grProduct.Columns[4].Visible = CurrentType.AllowLocation && Settings_VendorProfile.Product_Content.ShowLocation_Country;
            }
            if (grProduct.Columns[5] != null)//state
            {
                grProduct.Columns[5].Visible = CurrentType.AllowLocation && Settings_VendorProfile.Product_Content.ShowLocation_State;
            }
            if (grProduct.Columns[6] != null)//city
            {
                grProduct.Columns[6].Visible = CurrentType.AllowLocation && Settings_VendorProfile.Product_Content.ShowLocation_City;
            }
            if (grProduct.Columns[7] != null)//town
            {
                grProduct.Columns[7].Visible = CurrentType.AllowLocation && Settings_VendorProfile.Product_Content.ShowLocation_Town;
            }
           
            if (grProduct.Columns[8] != null)//Sku
            {
                grProduct.Columns[8].Visible = Settings_VendorProfile.Product_Content.ShowSku && CurrentType.FieldEnable_Sku;
            }
            if (grProduct.Columns[9] != null)//weight
            {
                grProduct.Columns[9].Visible = Settings_VendorProfile.Product_Content.ShowWeight && CurrentType.FieldEnable_Weight;
            }
            if (grProduct.Columns[10] != null)//StartPrice
            {
                grProduct.Columns[10].Visible = Settings_VendorProfile.Product_Content.ShowStartPrice;
            }
            if (grProduct.Columns[11] != null)//BuyNowPrice
            {
                grProduct.Columns[11].Visible = Settings_VendorProfile.Product_Content.ShowBuyNowPrice && !IsSecondItemAuction;
            }
            if (grProduct.Columns[12] != null)//CurrentBid
            {
                grProduct.Columns[12].Visible = Settings_VendorProfile.Product_Content.ShowCurrentBid && IsEnglishAuction;
            }
            if (grProduct.Columns[13] != null)//CurrentBidder
            {
                grProduct.Columns[13].Visible = Settings_VendorProfile.Product_Content.ShowCurrentBidder && IsEnglishAuction;
            }
            if (grProduct.Columns[14] != null)//BidCount
            {
                grProduct.Columns[14].Visible = Settings_VendorProfile.Product_Content.ShowBidCount;
            }

            if (grProduct.Columns[15] != null)//PublishDate
            {
                grProduct.Columns[15].Visible = Settings_VendorProfile.Product_Content.ShowPublishDate;
            }

            if (grProduct.Columns[16] != null)//ExpireDate
            {
                grProduct.Columns[16].Visible = Settings_VendorProfile.Product_Content.ShowExpireDate;
            }

            if (grProduct.Columns[17] != null)//RemainTime
            {
                grProduct.Columns[17].Visible = Settings_VendorProfile.Product_Content.ShowRemainTime;
            }

            if (grProduct.Columns[18] != null)//FeaturedField
            {
                grProduct.Columns[18].Visible = Settings_VendorProfile.Product_Content.ShowFeaturedField;
            }

            if (grProduct.Columns[19] != null)//Summary
            {
                grProduct.Columns[19].Visible = Settings_VendorProfile.Product_Content.ShowSummary && CurrentType.FieldEnable_Summary;
            }

            if (grProduct.Columns[20] != null)//bid now button
            {
                grProduct.Columns[20].Visible = Settings_VendorProfile.Product_Content.ShowBidButton;
            }
        }
        protected void ddlOper_Price_SelectedIndexChanged(object sender, EventArgs e)
        {
            OnOper_PriceSelectedIndexChanged();
        }
        private void OnOper_PriceSelectedIndexChanged()
        {
            txtBuiltInField_Price.Visible = ddlOper_Price.SelectedValue != "between";
            txtBuiltInField_Price_From.Visible = ddlOper_Price.SelectedValue == "between";
            lblBuiltInField_And.Visible = ddlOper_Price.SelectedValue == "between";
            txtBuiltInField_Price_To.Visible = ddlOper_Price.SelectedValue == "between";
        }
    }
}
   
   

