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

    public partial class ProductList_Repeater : CPModuleBase
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
                else
                {
                    if (InExternalSearch_Basic)
                    {
                        return "externalsearch_basic";
                    }
                    if (InExternalSearch_Advanced)
                    {
                        return "externalsearch_advanced";
                    }
                }
                return "none";
            }
            set
            {
                ViewState["CurrentSearchStatus"] = value;
            }
        }

        /// <summary>
        /// currently in basic search mode
        /// </summary>
        private bool InExternalSearch_Basic
        {
            get
            {
                if (!Settings_List.General.AcceptSearchParm) return false;

                //first we check if UserIdMapping is provided
                if (!string.IsNullOrEmpty(Settings_List.General.UserIdMapping)
                    && (Request.QueryString[Settings_List.General.UserIdMapping] != null)
               && (Utils.IsNumber(Request.QueryString[Settings_List.General.UserIdMapping].ToString())))
                {
                    return true;
                }


                //仅接受和typeid 一样的查询
                if (Request.QueryString["ProductTypeId"] == null || !Utils.IsNumber(Request.QueryString["ProductTypeId"].ToString()))
                {
                    return false;
                }
                if (Convert.ToString(Request.QueryString["ProductTypeId"]) != Settings_List.General.TypeId.ToString())
                {
                    return false;
                }

                string[] searchParm = { "ProductCategoryId", "ProductTagId", "ProductUserId", "ProductSearchTerm", "ProductDate", "ProductManufacturerId" };
                foreach (string parm in searchParm)
                {
                    if (Request.QueryString[parm] != null)
                    {
                        return true;
                    }
                }


                return false;
            }
        }
        /// <summary>
        /// currently in advanced search mode,
        /// note, we have to use post method to do the advanced search
        /// </summary>
        private bool InExternalSearch_Advanced
        {
            get
            {
                if (!Settings_List.General.AcceptSearchParm) return false;

                //仅接受和typeid 一样的查询
                if (Request.Form["ProductTypeId"] == null || !Utils.IsNumber(Request.Form["ProductTypeId"].ToString()))
                {
                    return false;
                }
                if (Convert.ToString(Request.Form["ProductTypeId"]) != Settings_List.General.TypeId.ToString())
                {
                    return false;
                }
                if (Request.Form["S_Mode"] != null && Request.Form["S_Mode"].ToString().ToLower() == "adv")
                {
                    return true;
                }
                return false;
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
                            where p.TypeId == Settings_List.General.TypeId
                            select p).ToList();
                    foreach (var item in list)
                    {
                        LocalizeObject_UDField(item);
                    }
                }
                else
                {
                    list = (from p in Cache_UdtList where p.TypeId == Settings_List.General.TypeId select p).ToList();
                }
                return list;
            }
        }
        public Cross.Modules.CP_Product.Business.TypeInfo CurrentType
        {
            get
            {
                if (Settings_List.General.TypeId != -1)
                {
                    return TypeController.Get(Settings_List.General.TypeId);
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
            if (!string.IsNullOrEmpty(Settings_List.Search_Advanced.UDT_1)
                && Settings_List.Search_Advanced.UDT_1 != "-1")
            {
                id = Convert.ToInt32(Settings_List.Search_Advanced.UDT_1);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_List.Search_Advanced.UDT_2)
                && Settings_List.Search_Advanced.UDT_2 != "-1")
            {
                id = Convert.ToInt32(Settings_List.Search_Advanced.UDT_2);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_List.Search_Advanced.UDT_3)
              && Settings_List.Search_Advanced.UDT_3 != "-1")
            {
                id = Convert.ToInt32(Settings_List.Search_Advanced.UDT_3);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_List.Search_Advanced.UDT_4)
             && Settings_List.Search_Advanced.UDT_4 != "-1")
            {
                id = Convert.ToInt32(Settings_List.Search_Advanced.UDT_4);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_List.Search_Advanced.UDT_5)
             && Settings_List.Search_Advanced.UDT_5 != "-1")
            {
                id = Convert.ToInt32(Settings_List.Search_Advanced.UDT_5);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_List.Search_Advanced.UDT_6)
             && Settings_List.Search_Advanced.UDT_6 != "-1")
            {
                id = Convert.ToInt32(Settings_List.Search_Advanced.UDT_6);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_List.Search_Advanced.UDT_7)
             && Settings_List.Search_Advanced.UDT_7 != "-1")
            {
                id = Convert.ToInt32(Settings_List.Search_Advanced.UDT_7);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_List.Search_Advanced.UDT_8)
             && Settings_List.Search_Advanced.UDT_8 != "-1")
            {
                id = Convert.ToInt32(Settings_List.Search_Advanced.UDT_8);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_List.Search_Advanced.UDT_9)
             && Settings_List.Search_Advanced.UDT_9 != "-1")
            {
                id = Convert.ToInt32(Settings_List.Search_Advanced.UDT_9);
                idList.Add(id);
            }

            if (!string.IsNullOrEmpty(Settings_List.Search_Advanced.UDT_10)
             && Settings_List.Search_Advanced.UDT_10 != "-1")
            {
                id = Convert.ToInt32(Settings_List.Search_Advanced.UDT_10);
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
                ddlItem.Width = Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator);
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
            string editStyle = string.Format("width:{0}px", Settings_List.Search_Advanced.Width_Input);

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
                    Udt_SearchList[i].OutputSettings, Udt_SearchList[i].NormalizeFlag, Settings_List.Search_Advanced.RepeatColumns);

                listEditFrom.Add(objColumn);
            }
            BuildFormAsTable(listEditFrom);
        }

        public Control CreateTitleControl(string title)
        {
            Label lblControl = new Label();
            lblControl.Text = title;
            lblControl.Width = int.Parse(Settings_List.Search_Advanced.Width_Label);
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
                    objCell.Width = Unit.Pixel(Convert.ToInt32(Settings_List.Search_Advanced.Width_Label)
                        + Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator));
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


        public void BindAuthorList()
        {
            if (Settings_List.General.SearchMode != LocalUtils.SearchMode_Advanced
                || Settings_List.Search_Advanced.BuiltInField_Author == false)
            {
                return;
            }
            List<Cross.Modules.CP_Product.Business.UserInfo> listAuthor = Cross.Modules.CP_Product.Business.UserController.GetByType(Settings_List.General.TypeId);
            Cross.Modules.CP_Product.Business.UserInfo ai = new Cross.Modules.CP_Product.Business.UserInfo();
            ai.Username = "< " + Localization.GetString("SelectAuthor", LocalResourceFile) + " >";
            ai.UserId = -1;

            listAuthor.Add(ai);

            ddlBuiltInField_Author.DataSource = listAuthor;
            ddlBuiltInField_Author.DataBind();
            ddlBuiltInField_Author.SelectedValue = "-1";
        }
        private void BindCategories()
        {

            if (Settings_List.General.SearchMode != LocalUtils.SearchMode_Advanced
                || Settings_List.Search_Advanced.BuiltInField_Category == false)
            {
                return;
            }

            //v6.9 let administrator specify category which will be searched
            if (string.IsNullOrEmpty(Settings_List.General.CategoryList))
            {
                BindCategoryAsTree();
            }
            else
            {
                BindCategoryAsList();
            }
        }
        private void BindCategoryAsTree()
        {
            List<CategoryInfo> list = CategoryController.GetByType(Settings_List.General.TypeId);
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

        private void BindCategoryAsList()
        {
            List<CategoryInfo> list = CategoryController.GetByList(Settings_List.General.CategoryList);
            foreach (var item in list)
            {
                LocalizeObject_Category(item);
            }
            CategoryInfo a = new CategoryInfo();
            a.Id = -1;
            a.Name = "< " + Localization.GetString("SelectCategory", LocalResourceFile) + " >";
            list.Add(a);

            ddlBuiltInField_Category.DataSource = list;
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
        public Setting_List Settings_List;

        override protected void OnInit(EventArgs e)
        {
            Settings_List = new Setting_List(ModuleId, TabId, ModuleConfiguration.ModuleSettings);
            if (Settings_List.General.TypeId == -1)
            {
                Settings_List = new Setting_List(ModuleId, TabId);
            }
            base.OnInit(e);
        }
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Settings_List.General.ListStyle == LocalUtils.Product_ListStyle_Grid)
                {
                    GenerateUDFieldToGrid();
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Cache_TypeList.Count < 1 || Settings_List.General.TypeId == -1)
            {
                return;
            }


            LocalResourceFile = Localization.GetResourceFile(this, "ProductList.ascx");
            ctlPagingControl.ResourceFile = Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared;
            //if (Settings_List.Image.UseLightBoxEffect && Settings_List.Image.ShowImage)//注册图片直接弹出效果
            //{
            //    RegisterFancyBoxScript();
            //}
            if (!IsPostBack)
            {
                CurrentSearchStatus = "none";
                if (InExternalSearch_Basic)
                {
                    CurrentSearchStatus = "externalsearch_basic";
                }
                if (InExternalSearch_Advanced)
                {
                    CurrentSearchStatus = "externalsearch_advanced";
                }

                tblBasicSearch.Visible = Settings_List.General.SearchMode == LocalUtils.SearchMode_Basic;
                tblAdvancedSearchCondition.Visible = Settings_List.General.SearchMode == LocalUtils.SearchMode_Advanced;
                tblAdvancedSearchButton.Visible = Settings_List.General.SearchMode == LocalUtils.SearchMode_Advanced;

                if (Settings_List.General.SearchMode == LocalUtils.SearchMode_Advanced)
                {
                    BindCategories();
                    BindAuthorList();
                    if (Settings_List.Search_Advanced.BuiltInField_Price)
                    {
                        OnOper_PriceSelectedIndexChanged();
                    }
                    if (CurrentType.AllowLocation && Settings_List.Search_Advanced.BuiltInField_Country)
                    {
                        BindLocationCountry();
                        OnLocationCountry_SelectedIndexChanged();
                    }
                }

                if (ddlSortField.Items.FindByValue(Settings_List.General.SortField) != null)
                {
                    ddlSortField.SelectedIndex = -1;
                    ddlSortField.Items.FindByValue(Settings_List.General.SortField).Selected = true;
                }
                if (ddlBuiltInField_Sort.Items.FindByValue(Settings_List.General.SortField) != null)
                {
                    ddlBuiltInField_Sort.SelectedIndex = -1;
                    ddlBuiltInField_Sort.Items.FindByValue(Settings_List.General.SortField).Selected = true;
                }
                //init the paging select
                int pageSize = 10;

                if (Settings_List.General.ListStyle == LocalUtils.Product_ListStyle_List)//List 支持多列绑定 
                {
                    pageSize = Settings_List.Paging.RowCount * Settings_List.Paging.ColCount;
                }
                else
                {
                    pageSize = Settings_List.Paging.RowCount;
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
                if (Settings_List.MoreProduct.ShowMoreProducts && Settings_List.MoreProduct.MoreProductsLink != -1)
                {
                    hlMoreProducts.Visible = true;
                    if (Settings_List.MoreProduct.MoreProductsText == null || Settings_List.MoreProduct.MoreProductsText == "")
                    {
                        hlMoreProducts.Text = "More Products..";
                    }
                    else
                    {

                        hlMoreProducts.Text = Settings_List.MoreProduct.MoreProductsText;
                    }
                    if (Settings_List.MoreProduct.MoreProductsLink != -1)
                    {
                        hlMoreProducts.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL(Settings_List.MoreProduct.MoreProductsLink);
                    }
                }
                //Rss
                hlRss.NavigateUrl = FullDomainName + "/DesktopModules/CrossClassified/ProductRss.aspx?ProductModuleId=" +
                    ModuleId.ToString() + "&ProductTypeId=" + Settings_List.General.TypeId.ToString()
                    + "&tabid=" + TabId.ToString();
                DataBind();
            }
            if (Settings_List.General.SearchMode == LocalUtils.SearchMode_Advanced)
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
            if (CurrentType.AllowLocation && Settings_List.Search_Advanced.BuiltInField_Country && Settings_List.Search_Advanced.BuiltInField_State)
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
                && Settings_List.Search_Advanced.BuiltInField_Country
                && Settings_List.Search_Advanced.BuiltInField_State
                && Settings_List.Search_Advanced.BuiltInField_City)
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
                && Settings_List.Search_Advanced.BuiltInField_Country
                && Settings_List.Search_Advanced.BuiltInField_State
                && Settings_List.Search_Advanced.BuiltInField_City
                && Settings_List.Search_Advanced.BuiltInField_Town)
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

        public string GetMarqueeBegin()
        {
            string marqueeBegin = "";
            if (Settings_List.Roll.Roll)
            {
                marqueeBegin = "<marquee style='BOTTOM: 0px; FONT-WEIGHT: 100px; HEIGHT:" + Settings_List.Roll.MarHeight + "px;" + " TEXT-ALIGN: left; TOP: 0px'  scrollamount=" + Settings_List.Roll.ScrollAmount + " scrolldelay='10' behavior='loop' direction='" + Settings_List.Roll.Direction + "' border='0' onmouseover='this.stop()' onmouseout='this.start()'>";
            }
            return marqueeBegin;
        }
        public string GetMarqueeEnd()
        {
            if (Settings_List.Roll.Roll) return "</marquee>";
            else return "";
        }
        public string GetHeight()
        {
            if (Settings_List.Roll.Roll) return Settings_List.Roll.MarHeight;
            else return "100%";
        }
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

        /// <summary>
        /// return product list when current search status = "none"
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="totalRecords"></param>
        /// <returns></returns>
        private List<ProductInfo> GetProducts_None(int pageIndex, ref int pageSize, ref int totalRecords)
        {
            if (Settings_List.General.ListStyle == LocalUtils.Product_ListStyle_List)//List 支持多列绑定 
            {
                pageSize = Settings_List.Paging.RowCount * Settings_List.Paging.ColCount;
            }
            else
            {
                pageSize = Settings_List.Paging.RowCount;
            }

          

            List<ProductInfo> list = new List<ProductInfo>();

            list = ProductController.GetByModuleSettings(Settings_List.General.TypeId, GetUserId(), Settings_List.General.CategoryList, Settings_List.General.VendorList,
          Settings_List.General.ShowFeaturedOnly, Settings_List.General.ShowPromoOnly, Settings_List.Image.ShowImageOnly,
          "", Settings_List.General.SortField
          , pageSize, Settings_List.Paging.ShowPage,
          GetCurrentCultureCode(), pageSize, pageIndex, ref totalRecords);

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
            if (Settings_List.General.ListStyle == LocalUtils.Product_ListStyle_List)//List 支持多列绑定 
            {
                pageSize = Settings_List.Paging.RowCount * Settings_List.Paging.ColCount;
            }
            else
            {
                pageSize = Settings_List.Paging.RowCount;
            }

            //if we allow user to choose paging
            if (Settings_List.Search_Basic.ShowPageInSearch)
            {
                pageSize = Convert.ToInt32(ddlPage.SelectedValue);
            }
          

            List<ProductInfo> list = new List<ProductInfo>();
            PortalSecurity ps = new PortalSecurity();


            list = ProductController.GetByModuleSettings(Settings_List.General.TypeId, GetUserId(), Settings_List.General.CategoryList, Settings_List.General.VendorList,
          Settings_List.General.ShowFeaturedOnly, Settings_List.General.ShowPromoOnly, Settings_List.Image.ShowImageOnly,
           ps.InputFilter(txtSearch.Text.Trim(), PortalSecurity.FilterFlag.NoSQL),

          Settings_List.Search_Basic.ShowSortInSearch ? ddlSortField.SelectedValue : Settings_List.General.SortField,
           pageSize, Settings_List.Paging.ShowPage, GetCurrentCultureCode(), pageSize, pageIndex, ref totalRecords);

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
            if (Settings_List.General.ListStyle == LocalUtils.Product_ListStyle_List)//List 支持多列绑定 
            {
                pageSize = Settings_List.Paging.RowCount * Settings_List.Paging.ColCount;
            }
            else
            {
                pageSize = Settings_List.Paging.RowCount;
            }

            if (Settings_List.Search_Advanced.BuiltInField_Paging)
            {
                pageSize = Convert.ToInt32(ddlBuiltInField_Paging.SelectedValue);
            }
            string sort = Settings_List.Search_Advanced.BuiltInField_Sort ? ddlBuiltInField_Sort.SelectedValue : Settings_List.General.SortField;

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


            List<ProductInfo> wholeList = ProductController.GetByDnnSearch(Settings_List.General.TypeId);

            List<ProductInfo> validList = new List<ProductInfo>();
            string value, oper;
            DateTime searchDate;
            foreach (var item in wholeList)
            {
                ProductInfo objProduct = ProductController.Get(item.Id);
                LocalizeObject_Product(objProduct);
                //first check product title
                if (Settings_List.Search_Advanced.BuiltInField_Title
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
                if (Settings_List.Search_Advanced.BuiltInField_Sku
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
                if (Settings_List.Search_Advanced.BuiltInField_Price)
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
                                    if (objProduct.CurrentPrice < decimal.Parse(txtBuiltInField_Price_From.Text)
                                        || objProduct.CurrentPrice > decimal.Parse(txtBuiltInField_Price_To.Text))
                                    {
                                        continue;
                                    }
                                }
                            }
                            break;
                        case "lessthan":
                            if (LocalUtils.IsDecimal(txtBuiltInField_Price.Text) && objProduct.CurrentPrice >= decimal.Parse(txtBuiltInField_Price.Text))
                                continue;
                            break;
                        case "equal":
                            if (LocalUtils.IsDecimal(txtBuiltInField_Price.Text) && objProduct.CurrentPrice != decimal.Parse(txtBuiltInField_Price.Text))
                                continue;
                            break;
                        case "greaterthan":
                            if (LocalUtils.IsDecimal(txtBuiltInField_Price.Text) && objProduct.CurrentPrice <= decimal.Parse(txtBuiltInField_Price.Text))
                                continue;
                            break;
                        default:
                            continue;
                            break;
                    }
                }
                if (Settings_List.Search_Advanced.BuiltInField_Category && ddlBuiltInField_Category.SelectedValue != "-1")
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
                if (Settings_List.Search_Advanced.BuiltInField_Author && ddlBuiltInField_Author.SelectedValue != "-1")
                {
                    value = ddlBuiltInField_Author.SelectedValue;
                    oper = ddlOper_Author.SelectedValue;

                    switch (oper.ToLower())
                    {
                        //if equal
                        case "equal":
                            if (objProduct.UserId.ToString() != value)
                            {
                                continue;
                            }
                            break;
                        case "unequal"://if unequal
                            if (objProduct.UserId.ToString() == value)
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                            break;
                    }
                }
                if (Settings_List.Search_Advanced.BuiltInField_CreatedDate
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
                if (Settings_List.Search_Advanced.BuiltInField_PublishDate
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
                if (Settings_List.Search_Advanced.BuiltInField_ExpireDate
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
                if (Settings_List.Search_Advanced.BuiltInField_Views &&
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
                if (Settings_List.Search_Advanced.BuiltInField_RatingAverage
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
              && Settings_List.Search_Advanced.BuiltInField_Country
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
                    && Settings_List.Search_Advanced.BuiltInField_Country
              && Settings_List.Search_Advanced.BuiltInField_State
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
                         && Settings_List.Search_Advanced.BuiltInField_Country
              && Settings_List.Search_Advanced.BuiltInField_State
              && Settings_List.Search_Advanced.BuiltInField_City
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
                      && Settings_List.Search_Advanced.BuiltInField_Country
              && Settings_List.Search_Advanced.BuiltInField_State
              && Settings_List.Search_Advanced.BuiltInField_City
              && Settings_List.Search_Advanced.BuiltInField_Town
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
                        sortedList = (from p in validList orderby p.CurrentPrice descending select p).ToList();
                        break;
                    case "PurchasePriceAsc":
                        sortedList = (from p in validList orderby p.CurrentPrice ascending select p).ToList();
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
                        sortedList = (from p in validList orderby p.Order ascending, p.CurrentPrice descending select p).ToList();
                        break;
                    case "PurchasePriceAsc":
                        sortedList = (from p in validList orderby p.Order ascending, p.CurrentPrice ascending select p).ToList();
                        break;
                    default:
                        sortedList = (from p in validList orderby p.Order ascending, p.CreatedDate descending select p).ToList();
                        break;
                }
            }
            return sortedList;

        }
        /// <summary>
        /// get product search when currentsearchmode="externalsearch_basic"
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="totalRecords"></param>
        /// <returns></returns>
        private List<ProductInfo> GetProducts_ExternalSearch_Basic(int pageIndex, ref int pageSize, ref int totalRecords)
        {
            if (Settings_List.General.ListStyle == LocalUtils.Product_ListStyle_List)//List 支持多列绑定 
            {
                pageSize = Settings_List.Paging.RowCount * Settings_List.Paging.ColCount;
            }
            else
            {
                pageSize = Settings_List.Paging.RowCount;
            }

            PortalSecurity ps = new PortalSecurity();
            List<ProductInfo> list = new List<ProductInfo>();
            if (Request.Params["ProductDate"] != null) // 查询模式的日期查询
            {
                DateTime productDate = new DateTime();
                productDate = Convert.ToDateTime(Request.Params["ProductDate"]);
                string dateType = "month";
                if (Request.Params["DateType"] != null)
                {
                    dateType = Convert.ToString(Request.Params["DateType"]);
                }
                if (dateType == "month")
                {
                    list = ProductController.GetByMonth(Settings_List.General.TypeId, GetUserId(), productDate, Settings_List.General.SortField, pageSize,
                        Settings_List.Paging.ShowPage, pageSize, pageIndex, ref totalRecords);
                }
                else
                {
                    list = ProductController.GetByDate(Settings_List.General.TypeId, GetUserId(), productDate, Settings_List.General.SortField, pageSize,
                       Settings_List.Paging.ShowPage, pageSize, pageIndex, ref totalRecords);
                }
            }
            else //查询模式的其他查询
            {
                string searchTerm = "";
                int categoryId = -1;
                int tagId = -1;
                int userId = -1;
                int manufacturerId = -1;
                if (txtSearch.Text.Trim() != "")//首先检查查询输入框
                {
                    searchTerm = txtSearch.Text.Trim();
                }
                else
                {
                    if ((Request.Params["ProductSearchTerm"] != null) && (Request.Params["ProductSearchTerm"] != ""))
                    {
                        searchTerm = Server.UrlDecode(Request.Params["ProductSearchTerm"]);
                    }
                }
                if (searchTerm != "")
                {
                    searchTerm = ps.InputFilter(searchTerm.Trim(), PortalSecurity.FilterFlag.NoSQL);//防止sql 注入
                }


                if ((Request.Params["ProductCategoryId"] != null) && (Request.Params["ProductCategoryId"] != "") && (Utils.IsNumber(Request.Params["ProductCategoryId"].ToString())))
                {
                    categoryId = Convert.ToInt32(Request.Params["ProductCategoryId"]);
                }
                if ((Request.Params["ProductTagId"] != null) && (Request.Params["ProductTagId"] != "") && (Utils.IsNumber(Request.Params["ProductTagId"].ToString())))
                {
                    tagId = Convert.ToInt32(Request.Params["ProductTagId"]);
                }
               
                if ((Request.Params["ProductUserId"] != null) && (Request.Params["ProductUserId"] != "") && (Utils.IsNumber(Request.Params["ProductUserId"].ToString())))
                {
                    userId = Convert.ToInt32(Request.Params["ProductUserId"]);
                }
                //多加一个user id mapping ,为争取一个客户，希望能成功
                if (!string.IsNullOrEmpty(Settings_List.General.UserIdMapping))
                {
                    if (Request.QueryString[Settings_List.General.UserIdMapping] != null && Utils.IsNumber(Request.Params[Settings_List.General.UserIdMapping].ToString()))
                    {
                        userId = Convert.ToInt32(Request.Params[Settings_List.General.UserIdMapping]);
                    }
                }
                if ((Request.Params["ProductManufacturerId"] != null) && (Request.Params["ProductManufacturerId"] != "") && (Utils.IsNumber(Request.Params["ProductManufacturerId"].ToString())))
                {
                    manufacturerId = Convert.ToInt32(Request.Params["ProductManufacturerId"]);
                }
                //auction and fixed price products don't support group id
                int groupId = -1;
                list = ProductController.GetByParm(Settings_List.General.TypeId, GetUserId(), categoryId, tagId, userId, groupId, manufacturerId, searchTerm,
                        Settings_List.General.SortField, pageSize, Settings_List.Paging.ShowPage, pageSize, pageIndex, ref totalRecords);
            }
            return list;

        }

        /// <summary>
        /// return data source when in external advanced search
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="totalRecords"></param>
        /// <returns></returns>
        private List<ProductInfo> GetProducts_ExternalSearch_Advanced(int pageIndex, ref int pageSize, ref int totalRecords)
        {
            if (Settings_List.General.ListStyle == LocalUtils.Product_ListStyle_List)//List 支持多列绑定 
            {
                pageSize = Settings_List.Paging.RowCount * Settings_List.Paging.ColCount;
            }
            else
            {
                pageSize = Settings_List.Paging.RowCount;
            }

            List<ProductInfo> wholeList = ProductController.GetByDnnSearch(Settings_List.General.TypeId);

            List<ProductInfo> validList = new List<ProductInfo>();
            string value, oper;

            List<string> idList = new List<string>();
            List<string> valueList = new List<string>();
            List<string> operList = new List<string>();
            for (int i = 0; i < 10; i++)
            {
                if (Request.Form["S_UDT" + i.ToString() + "_ID"] != null
   && Request.Form["S_UDT" + i.ToString() + "_Value"] != null
    && Request.Form["S_UDT" + i.ToString() + "_Oper"] != null
     && Utils.IsNumber(Request.Form["S_UDT" + i.ToString() + "_ID"]))
                {
                    idList.Add(Request.Form["S_UDT" + i.ToString() + "_ID"]);
                    valueList.Add(Request.Form["S_UDT" + i.ToString() + "_Value"]);
                    operList.Add(Request.Form["S_UDT" + i.ToString() + "_Oper"]);
                }
            }


            foreach (var item in wholeList)
            {
                ProductInfo objProduct = ProductController.Get(item.Id);
                LocalizeObject_Product(objProduct);
                //first check product title
                if (Request.Form["S_Title"] != null && Request.Form["S_Title_Oper"] != null)
                {
                    value = Request.Form["S_Title"];
                    oper = Request.Form["S_Title_Oper"];
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
                if (Request.Form["S_Sku"] != null && Request.Form["S_Sku_Oper"] != null)
                {
                    value = Request.Form["S_Sku"];
                    oper = Request.Form["S_Sku_Oper"];
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
                if (Request.Form["S_Price_Oper"] != null)
                {
                    oper = Request.Form["S_Price_Oper"];
                    switch (oper.ToLower())
                    {
                        case "between":
                            if (Request.Form["S_Price_From"] != null
                                && Request.Form["S_Price_To"] != null
                                && LocalUtils.IsDecimal(Request.Form["S_Price_From"].ToString())
                                && LocalUtils.IsDecimal(Request.Form["S_Price_To"].ToString())
                                && decimal.Parse(Request.Form["S_Price_To"].ToString()) >= decimal.Parse(Request.Form["S_Price_From"].ToString()))
                            {
                                if (objProduct.CurrentPrice < decimal.Parse(Request.Form["S_Price_From"].ToString())
                                    || objProduct.CurrentPrice > decimal.Parse(Request.Form["S_Price_To"].ToString()))
                                {
                                    continue;
                                }
                            }
                            break;
                        case "lessthan":
                            if (Request.Form["S_Price"] != null
                                && LocalUtils.IsDecimal(Request.Form["S_Price"].ToString())
                                && objProduct.CurrentPrice >= decimal.Parse(Request.Form["S_Price"].ToString()))
                            {
                                continue;
                            }
                            break;
                        case "equal":
                            if (Request.Form["S_Price"] != null
                                && LocalUtils.IsDecimal(Request.Form["S_Price"].ToString())
                                && objProduct.CurrentPrice != decimal.Parse(Request.Form["S_Price"].ToString()))
                            {
                                continue;
                            }
                            break;
                        case "greaterthan":
                            if (Request.Form["S_Price"] != null
                                && LocalUtils.IsDecimal(Request.Form["S_Price"].ToString())
                                && objProduct.CurrentPrice <= decimal.Parse(Request.Form["S_Price"].ToString()))
                            {
                                continue;
                            }
                            break;

                        default:
                            break;
                    }
                }
                if (Request.Form["S_Category"] != null && Request.Form["S_Category_Oper"] != null)
                {
                    value = Request.Form["S_Category"];
                    oper = Request.Form["S_Category_Oper"];
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
                if (Request.Form["S_Author"] != null && Request.Form["S_Author_Oper"] != null)
                {
                    value = Request.Form["S_Author"];
                    oper = Request.Form["S_Author_Oper"];

                    switch (oper.ToLower())
                    {
                        //if equal
                        case "equal":
                            if (objProduct.UserId.ToString() != value)
                            {
                                continue;
                            }
                            break;
                        case "unequal"://if unequal
                            if (objProduct.UserId.ToString() == value)
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                            break;
                    }
                }
                if (Request.Form["S_CreatedDate"] != null
                    && Request.Form["S_CreatedDate_Oper"] != null
                    && LocalUtils.IsDate(Request.Form["S_CreatedDate"]))
                {
                    value = Request.Form["S_CreatedDate"];
                    oper = Request.Form["S_CreatedDate_Oper"];

                    switch (oper.ToLower())
                    {
                        case "lessthan":
                            if (objProduct.CreatedDate >= DateTime.Parse(value))
                            {
                                continue;
                            }
                            break;
                        case "equal":
                            //if create in same day
                            if (objProduct.CreatedDate.ToShortDateString() != DateTime.Parse(value).ToShortDateString())
                            {
                                continue;
                            }
                            break;
                        case "greaterthan":
                            if (objProduct.CreatedDate <= DateTime.Parse(value))
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                    }
                }
                if (Request.Form["S_PublishDate"] != null
                   && Request.Form["S_PublishDate_Oper"] != null
                   && LocalUtils.IsDate(Request.Form["S_PublishDate"]))
                {
                    value = Request.Form["S_PublishDate"];
                    oper = Request.Form["S_PublishDate_Oper"];

                    switch (oper.ToLower())
                    {
                        case "lessthan":
                            if (objProduct.PublishDate >= DateTime.Parse(value))
                            {
                                continue;
                            }
                            break;
                        case "equal":
                            //if create in same day
                            if (objProduct.PublishDate.ToShortDateString() != DateTime.Parse(value).ToShortDateString())
                            {
                                continue;
                            }
                            break;
                        case "greaterthan":
                            if (objProduct.PublishDate <= DateTime.Parse(value))
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                    }
                }
                if (Request.Form["S_ExpireDate"] != null
                   && Request.Form["S_ExpireDate_Oper"] != null
                   && LocalUtils.IsDate(Request.Form["S_ExpireDate"]))
                {
                    value = Request.Form["S_ExpireDate"];
                    oper = Request.Form["S_ExpireDate_Oper"];

                    switch (oper.ToLower())
                    {
                        case "lessthan":
                            if (objProduct.ExpireDate != null
                                && Null.IsNull(objProduct.ExpireDate) == false
                                && objProduct.ExpireDate >= DateTime.Parse(value))
                            {
                                continue;
                            }
                            break;
                        case "equal":
                            if (objProduct.ExpireDate == null
                                || Null.IsNull(objProduct.ExpireDate) == true
                                || objProduct.ExpireDate.ToShortDateString() != DateTime.Parse(value).ToShortDateString())
                            {
                                continue;
                            }
                            break;
                        case "greaterthan":
                            if (objProduct.ExpireDate == null
                                || Null.IsNull(objProduct.ExpireDate) == true
                                || objProduct.ExpireDate <= DateTime.Parse(value))
                            {
                                continue;
                            }
                            break;
                        default:
                            continue;
                    }
                }
                if (Request.Form["S_Views"] != null
                 && Request.Form["S_Views_Oper"] != null
                 && Utils.IsNumber(Request.Form["S_Views"]))
                {
                    value = Request.Form["S_Views"];
                    oper = Request.Form["S_Views_Oper"];

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
                if (Request.Form["S_RatingAverage"] != null
                 && Request.Form["S_RatingAverage_Oper"] != null
                 && Utils.IsNumber(Request.Form["S_RatingAverage"]))
                {
                    value = Request.Form["S_RatingAverage"];
                    oper = Request.Form["S_RatingAverage_Oper"];

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
                //country
                if (CurrentType.AllowLocation &&
                    Request.Form["S_Country"] != null && Request.Form["S_Country_Oper"] != null)
                {
                    value = Request.Form["S_Country"];
                    oper = Request.Form["S_Country_Oper"];
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
                if (CurrentType.AllowLocation &&
                    Request.Form["S_State"] != null && Request.Form["S_State_Oper"] != null)
                {
                    value = Request.Form["S_State"];
                    oper = Request.Form["S_State_Oper"];
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
                if (CurrentType.AllowLocation &&
                    Request.Form["S_City"] != null && Request.Form["S_City_Oper"] != null)
                {
                    value = Request.Form["S_City"];
                    oper = Request.Form["S_City_Oper"];
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
                if (CurrentType.AllowLocation &&
                    Request.Form["S_Town"] != null && Request.Form["S_Town_Oper"] != null)
                {
                    value = Request.Form["S_Town"];
                    oper = Request.Form["S_Town_Oper"];
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
            sortedList = GetSortedList(validList, false, Settings_List.General.SortField);

            //now we get sorted list
            totalRecords = sortedList.Count;
            return sortedList.Skip(pageSize * (pageIndex - 1)).Take(pageSize).ToList();
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
                if (objUDField == null || objUDField.TypeId != Settings_List.General.TypeId)
                {
                    return false;
                }
                LocalizeObject_UDField(objUDField);
                UDDataInfo objUDData = UDDataController.GetByCulture(int.Parse(id), productId,
                    GetCurrentCultureCode());
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
                case "externalsearch_basic":
                    list = GetProducts_ExternalSearch_Basic(pageIndex, ref pageSize, ref totalRecords);
                    break;
                case "externalsearch_advanced":
                    list = GetProducts_ExternalSearch_Advanced(pageIndex, ref pageSize, ref totalRecords);
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
            if (Settings_List.General.ListStyle == LocalUtils.Product_ListStyle_List)
            {
                dlProduct.Visible = true;
                dlProduct.DataSource = list;
                dlProduct.DataBind();
            }

            if (Settings_List.General.ListStyle == LocalUtils.Product_ListStyle_Grid)
            {
                grProduct.Visible = true;
                //仅在需要的时候才绑定自定义数据
                if (UDFieldList.Count > 0 && Settings_List.UDField.UseBuiltInTemplate && Settings_List.UDField.UDFieldList.Trim() != "")
                {
                    grProduct.DataSource = CreateCustomizeDataTable(list);
                }
                else
                {
                    grProduct.DataSource = list;
                }
                grProduct.DataBind();
            }

            if (Settings_List.Paging.ShowPage)
            {
                tblPaging.Visible = true;
                ctlPagingControl.Span = Settings_List.Paging.PageSpan;
                ctlPagingControl.ShowPageInfo = Settings_List.Paging.ShowPageInfo;
                ctlPagingControl.CurrentPage = pageIndex;
                ctlPagingControl.PageSize = pageSize;
                ctlPagingControl.RecordCount = totalRecords;
            }
        }
        private void GenerateUDFieldToGrid()
        {
            //仅在需要的时候才加入自定义数据的template field
            if (UDFieldList.Count > 0 && Settings_List.UDField.UseBuiltInTemplate && Settings_List.UDField.UDFieldList.Trim() != "")
            {
                string[] listDisplay = Settings_List.UDField.UDFieldList.Split(',');
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
                    ctlControl.Width = Settings_List.UDField.UDField_ImageWidth;
                    ctlControl.Height = Settings_List.UDField.UDField_ImageHeight;
                    ctlControl.Target = Settings_List.General.LinkTarget;
                    DataControlField bound = ctlControl.BoundField;
                    grProduct.Columns.Add(bound);
                }
            }
        }
        private System.Data.DataTable CreateCustomizeDataTable(List<ProductInfo> list)
        {
            DataTable dt = new DataTable();

            //First we need select out udfields which will display 
            string[] listDisplay = Settings_List.UDField.UDFieldList.Split(',');
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
        protected string GetVendorCompany(string userId)
        {
            Cross.Modules.CP_Product.Business.UserInfo objVendor = Cross.Modules.CP_Product.Business.UserController.Get(Convert.ToInt32(userId));
            return objVendor == null ? "" : objVendor.Company;
        }

        protected string GetRatingImage(string productId)
        {
            ProductInfo objProduct = ProductController.Get(Convert.ToInt32(productId));
            string imgRating = Settings_List.Content.RatingImage;
            return LocalUtils.ModuleRootPath + "images/ratings/" + imgRating + "/" + imgRating + objProduct.RatingAverage.ToString() + ".gif";
        }
        protected string GetShortenSummary(string productId, string summary)
        {
            int length = Settings_List.Content.SummaryLength;
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
            int detailTabId = GetSubModulePageId_Detail(Settings_List.General.DetailTab, Settings_List.General.TypeId);
            return GenerateProductDetailUrl(detailTabId, productId, productName);
        }
        protected string GetUserNavigate(string userId)
        {
            int userTab = TabId;
            if (Settings_List.Content.VendorLinkTarget == LocalUtils.VendorLinkTarget_List)
            {
                userTab = GetSubModulePageId_List(Settings_List.General.TypeId);
            }
            else
            {
                userTab = GetSubModulePageId_VendorProfile(Settings_List.General.TypeId);
            }

            return Globals.NavigateURL(userTab, "", "ProductUserId=" + userId, "ProductTypeId=" + Settings_List.General.TypeId);
        }

        #endregion


        protected void dlProduct_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (UDFieldList.Count > 0
                && Settings_List.UDField.UseBuiltInTemplate
                && !string.IsNullOrEmpty(Settings_List.UDField.UDFieldList))
            {
                System.Web.UI.HtmlControls.HtmlTable tblUDT = (System.Web.UI.HtmlControls.HtmlTable)e.Item.FindControl("tblUserDefinedField");
                int productId = Convert.ToInt32(((Label)e.Item.FindControl("lblId")).Text);
                string[] displayList = Settings_List.UDField.UDFieldList.Split(',');

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


        #region add cart and order now in product list

        protected void grProduct_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument);
            ProductInfo objProduct = ProductController.Get(productId);
            LocalizeObject_Product(objProduct);
            switch (e.CommandName)
            {
                case "OrderNow":
                    AddToCart(true, objProduct);
                    break;
                case "AddCart":
                    AddToCart(false, objProduct);
                    break;
                default:
                    break;
            }
        }
        protected void dlProduct_ItemCommand(object source, CommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument);
            ProductInfo objProduct = ProductController.Get(productId);
            LocalizeObject_Product(objProduct);
            switch (e.CommandName)
            {
                case "OrderNow":
                    AddToCart(true, objProduct);
                    break;
                case "AddCart":
                    AddToCart(false, objProduct);
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// if user doesn't login,require login first
        /// </summary>
        private void LoginFirst()
        {
            if (UserId == -1)
            {
                string returnUrl = System.Web.HttpContext.Current.Request.RawUrl;
                if (returnUrl.IndexOf("?returnurl=") != -1)
                {
                    returnUrl = returnUrl.Substring(0, returnUrl.IndexOf("?returnurl="));
                }
                returnUrl = System.Web.HttpUtility.UrlEncode(returnUrl);
                // UrlUtils.PopUpUrl(DotNetNuke.Common.Globals.LoginURL(returnUrl, (Request.QueryString["override"] != null)), this, PortalSettings, true, false);
                //popupurl 并不可靠，当前user 可以简单的取消登录，这样会出现很多user id = -1 的购买记录。还不如直接重定向
                Response.Redirect(DotNetNuke.Common.Globals.LoginURL(returnUrl, (Request.QueryString["override"] != null)), true);
            }
        }
        /// <summary>
        /// check if product has enough stock quantity
        /// </summary>
        /// <param name="objProduct"></param>
        /// <returns></returns>
        private bool QuantityValid(ProductInfo objProduct)
        {
            lblInvalidQuantity.Visible = false;
            int quantity = objProduct.MinSellQuantity > 0 ? objProduct.MinSellQuantity : 1;

            List<OptionInfo> options = (from p in OptionController.GetByProduct(objProduct.Id, true) where p.IsDefault == true select p).ToList();
            //first check default option stock quantity
            if (options.Count > 0 && options[0].StockQuantity != -1 && quantity > options[0].StockQuantity)
            {
                lblInvalidQuantity.Visible = true;
                return false;
            }

            //when add cart in product list, the default quantity is 1
            if ((objProduct.StockQuantity != -1) && quantity > objProduct.StockQuantity)
            {
                lblInvalidQuantity.Visible = true;
                return false;
            }
            return true;
        }
        /// <summary>
        /// check if user already in this role and its expire date is empty.
        /// </summary>
        /// <returns></returns>
        private bool RoleValid(ProductInfo objProduct)
        {
            lblAlreadyInRole.Visible = false;
            lblSiteAdministrator.Visible = false;
            Cross.Modules.CP_Product.Business.TypeInfo objType = TypeController.Get(objProduct.TypeId);

            if (objType.SellType == Convert.ToInt32(SellType.Role))
            {
                int roleId = objProduct.RoleAfterOrder;
                List<OptionInfo> options = (from p in OptionController.GetByProduct(objProduct.Id, true) where p.IsDefault == true select p).ToList();
                if (options.Count > 0)
                {
                    roleId = options[0].RoleAfterOrder;
                }

                if (UserInfo.IsInRole(PortalSettings.AdministratorRoleName))//already administrator ,dont' need buy any role
                {
                    lblSiteAdministrator.Visible = true;
                    return false;
                }
                DotNetNuke.Security.Roles.RoleController ctlRole = new DotNetNuke.Security.Roles.RoleController();
                DotNetNuke.Entities.Users.UserRoleInfo objUserRole = ctlRole.GetUserRole(PortalId, UserId, roleId);
                if (objUserRole != null && Null.IsNull(objUserRole.ExpiryDate))//already in this role,and expire date is empty
                {
                    lblAlreadyInRole.Visible = true;
                    return false;
                }
            }
            return true;
        }
        /// <summary>
        /// 为支持Recursive billing, module  需要确保当前用户的cart中只能有一个需要recursive billing 的项目，为此需要检查两点.
        /// 1. 如果当前product 就是 recursive billing, 那么需要确认当前cart 为空.
        /// 2. 如果当前product 不支持recursive billing,那么需要检查当前cart中是否已经包括需要recursive charge 的项目，
        /// 如果有的话，显示lblHaveSubscriber 提示，返回false,不允许添加当前项目
        /// </summary>
        /// <returns></returns>
        private bool CanAddRecrusiveItem(ProductInfo objProduct)
        {
            lblHaveSubscriber.Visible = false;
            lblHaveItem.Visible = false;

            List<CartInfo> cartList = CartController.GetByClient(UserId, -1,PortalId);
            Cross.Modules.CP_Product.Business.TypeInfo objType = TypeController.Get(objProduct.TypeId);

            //如果当前product 就是 recursive billing, 那么需要确认当前cart 为空.
            //注意，如果当前type 是sell portal roles, 那么即使objType.AllowRecursiveBill = false 也是不行的
            if (objProduct.RecursiveBill == true && (objType.AllowRecursiveBill == true || objType.SellType == Convert.ToInt16(SellType.Role)))
            {
                if (cartList.Count > 0)
                {
                    lblHaveItem.Visible = true;
                    return false;
                }
            }
            else //如果当前product 不支持recursive billing,那么需要检查当前cart中是否已经包括需要recursive charge 的项目，
            {
                foreach (CartInfo objCart in cartList)
                {
                    ProductInfo objCartProduct = ProductController.Get(objCart.ProductId);
                    if (objCartProduct != null && objCartProduct.RecursiveBill == true)
                    {
                        Cross.Modules.CP_Product.Business.TypeInfo objCartType = TypeController.Get(objCartProduct.TypeId);
                        if (objCartType.AllowRecursiveBill == true || objCartType.SellType == Convert.ToInt16(SellType.Role))
                        {
                            lblHaveSubscriber.Visible = true;
                            return false;
                        }
                    }
                }
            }
            return true;
        }
        private void AddToCart(bool redirect, ProductInfo objProduct)
        {
            lblAddSuccess.Visible = false;
            lblAlreadyInRole.Visible = false;
            lblSiteAdministrator.Visible = false;
            lblHaveSubscriber.Visible = false;
            lblHaveItem.Visible = false;
            lblInvalidQuantity.Visible = false;
            LoginFirst();
            if (!QuantityValid(objProduct))
            {
                return;
            }
            if (!RoleValid(objProduct))
            {
                return;
            }
            if (!CanAddRecrusiveItem(objProduct))
            {
                return;
            }
            CartInfo objCart = new CartInfo();
            objCart.ProductId = objProduct.Id;
            objCart.ProductName = objProduct.Name;
            objCart.ClientId = UserId;
            objCart.ClientName = UserInfo.Username;
            objCart.VendorId = objProduct.UserId;
            objCart.VendorName = objProduct.UserName;

            objCart.Quantity = objProduct.MinSellQuantity > 0 ? objProduct.MinSellQuantity : 1;

            objCart.UnitPrice = objProduct.CurrentPrice;

            List<OptionInfo> options = (from p in OptionController.GetByProduct(objProduct.Id, true) where p.IsDefault == true select p).ToList();
            if (options.Count > 0)
            {
                objCart.OptionId = options[0].Id;
                objCart.OptionName = options[0].Name;
                objCart.UnitPrice = objProduct.CurrentPrice + options[0].BonusPrice;
            }
            else
            {
                objCart.OptionId = -1;
                objCart.OptionName = "";
            }
            objCart.ShipFee = 0;//Ship fee doesn't available yet
            objCart.TaxFee = 0;//tax fee will caculate after ship destination is specified

            objCart.ItemSum = objCart.UnitPrice * objCart.Quantity + objCart.ShipFee + objCart.TaxFee;
            CartController.Add(objCart);
            if (redirect)
            {
                Response.Redirect(Globals.NavigateURL(GetSubModulePageId_Buyer(), "", "mid=" + GetSubModuleId_Buyer(),
                    "ctl=UserBuyer_Cart"), true);
            }
            else
            {
                if (Settings_List.Content.RefreshAfterAddCart)
                {
                    Response.Redirect(Globals.NavigateURL(TabId), true);
                }
                else
                {
                    lblAddSuccess.Visible = true;
                }

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
                ctlControl.Width = Settings_List.UDField.UDField_ImageWidth;
                ctlControl.Height = Settings_List.UDField.UDField_ImageHeight;
                ctlControl.NormalizeFlag = objUDField.NormalizeFlag;
                ctlControl.OutputSettings = objUDField.OutputSettings;
                ctlControl.Target = Settings_List.General.LinkTarget;
                ctlControl.InputSettings = objUDField.InputSettings;
                ctlControl.CheckBoxList_Enabled = Settings_List.UDField.UDField_CheckBoxList_Enabled;
                ctlControl.CheckBoxList_RepeatColumns = Settings_List.UDField.UDField_CheckBoxList_RepeatColumns;
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
                grProduct.Columns[0].Visible = Settings_List.Image.ShowImage && CurrentType.FieldEnable_Image;
            }

            if (grProduct.Columns[1] != null)//name
            {
                grProduct.Columns[1].Visible = Settings_List.Content.ShowName;
            }
            if (grProduct.Columns[2] != null)//UserName
            {
                grProduct.Columns[2].Visible = Settings_List.Content.ShowUserName;
            }
            if (grProduct.Columns[3] != null)//VendorCompany
            {
                grProduct.Columns[3].Visible = Settings_List.Content.ShowVendorCompany;
            }
            if (grProduct.Columns[4] != null)//rating
            {
                grProduct.Columns[4].Visible = Settings_List.Content.ShowRating;
            }
            if (grProduct.Columns[5] != null)//views
            {
                grProduct.Columns[5].Visible = Settings_List.Content.ShowViews;
            }
            if (grProduct.Columns[6] != null)//country
            {
                grProduct.Columns[6].Visible = CurrentType.AllowLocation && Settings_List.Content.ShowLocation_Country;
            }
            if (grProduct.Columns[7] != null)//state
            {
                grProduct.Columns[7].Visible = CurrentType.AllowLocation && Settings_List.Content.ShowLocation_State;
            }
            if (grProduct.Columns[8] != null)//city
            {
                grProduct.Columns[8].Visible = CurrentType.AllowLocation && Settings_List.Content.ShowLocation_City;
            }
            if (grProduct.Columns[9] != null)//town
            {
                grProduct.Columns[9].Visible = CurrentType.AllowLocation && Settings_List.Content.ShowLocation_Town;
            }
            if (grProduct.Columns[10] != null)//Sku
            {
                grProduct.Columns[10].Visible = Settings_List.Content.ShowSku && CurrentType.FieldEnable_Sku;
            }
            if (grProduct.Columns[11] != null)//weight
            {
                grProduct.Columns[11].Visible = Settings_List.Content.ShowWeight && CurrentType.FieldEnable_Weight;
            }
            if (grProduct.Columns[12] != null)//package fee
            {
                grProduct.Columns[12].Visible = Settings_List.Content.ShowPackageFee && CurrentType.FieldEnable_PackageFee;
            }
            if (grProduct.Columns[13] != null)//Price
            {
                grProduct.Columns[13].Visible = Settings_List.Content.ShowPrice && CurrentType.FieldEnable_Price;
            }
            if (grProduct.Columns[14] != null)//PromoStart
            {
                grProduct.Columns[14].Visible = Settings_List.Content.ShowPromoStart && CurrentType.FieldEnable_Price;
            }
            if (grProduct.Columns[15] != null)//PromoEnd
            {
                grProduct.Columns[15].Visible = Settings_List.Content.ShowPromoEnd && CurrentType.FieldEnable_Price;
            }
            if (grProduct.Columns[16] != null)//CreatedDate
            {
                grProduct.Columns[16].Visible = Settings_List.Content.ShowCreatedDate;
            }

            if (grProduct.Columns[17] != null)//Featured
            {
                grProduct.Columns[17].Visible = Settings_List.Content.ShowFeaturedField;
            }


            if (grProduct.Columns[18] != null)//Summary
            {
                grProduct.Columns[18].Visible = Settings_List.Content.ShowSummary && CurrentType.FieldEnable_Summary;
            }

            if (grProduct.Columns[19] != null)//add cart and order now button
            {
                grProduct.Columns[19].Visible = Settings_List.Content.ShowOrderNow || Settings_List.Content.ShowAddCart;
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
   
   

