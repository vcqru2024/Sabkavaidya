using Cross.DNN.Common.UserDefinedTable;
using Cross.DNN.Common.Utility;
using Cross.DNN.Common.Utility.TreeHelper;
using Cross.Modules.CP_Product.Business;
using DotNetNuke.Common;
using DotNetNuke.Security;
using DotNetNuke.Services.Localization;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Cross.Modules.CP_Product.View
{
    public partial class Search : CPModuleBase
    {
        #region private fields
        /// <summary>
        /// edit controls which used to present data
        /// </summary>
        private EditControls ListEditControls;

        /// <summary>
        /// udfield info list which used to search
        /// </summary>
        private List<UDFieldInfo> UdtList;

        public Setting_Search Settings_Search;

        override protected void OnInit(EventArgs e)
        {
            Settings_Search = new Setting_Search(ModuleId, TabId, ModuleConfiguration.ModuleSettings);
            if (Settings_Search.General.TypeId == -1)
            {
                Settings_Search = new Setting_Search(ModuleId, TabId);
            }
            base.OnInit(e);
        }

        private void InitUdtList()
        {
            UdtList = new List<UDFieldInfo>();
            List<int> idList = new List<int>();
            int id = -1;
            if (!string.IsNullOrEmpty(Settings_Search.Advanced.UDT_1)
                && Settings_Search.Advanced.UDT_1 != "-1")
            {
                id = Convert.ToInt32(Settings_Search.Advanced.UDT_1);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_Search.Advanced.UDT_2)
                && Settings_Search.Advanced.UDT_2 != "-1")
            {
                id = Convert.ToInt32(Settings_Search.Advanced.UDT_2);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_Search.Advanced.UDT_3)
              && Settings_Search.Advanced.UDT_3 != "-1")
            {
                id = Convert.ToInt32(Settings_Search.Advanced.UDT_3);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_Search.Advanced.UDT_4)
             && Settings_Search.Advanced.UDT_4 != "-1")
            {
                id = Convert.ToInt32(Settings_Search.Advanced.UDT_4);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_Search.Advanced.UDT_5)
             && Settings_Search.Advanced.UDT_5 != "-1")
            {
                id = Convert.ToInt32(Settings_Search.Advanced.UDT_5);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_Search.Advanced.UDT_6)
             && Settings_Search.Advanced.UDT_6 != "-1")
            {
                id = Convert.ToInt32(Settings_Search.Advanced.UDT_6);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_Search.Advanced.UDT_7)
             && Settings_Search.Advanced.UDT_7 != "-1")
            {
                id = Convert.ToInt32(Settings_Search.Advanced.UDT_7);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_Search.Advanced.UDT_8)
             && Settings_Search.Advanced.UDT_8 != "-1")
            {
                id = Convert.ToInt32(Settings_Search.Advanced.UDT_8);
                idList.Add(id);
            }
            if (!string.IsNullOrEmpty(Settings_Search.Advanced.UDT_9)
             && Settings_Search.Advanced.UDT_9 != "-1")
            {
                id = Convert.ToInt32(Settings_Search.Advanced.UDT_9);
                idList.Add(id);
            }

            if (!string.IsNullOrEmpty(Settings_Search.Advanced.UDT_10)
             && Settings_Search.Advanced.UDT_10 != "-1")
            {
                id = Convert.ToInt32(Settings_Search.Advanced.UDT_10);
                idList.Add(id);
            }
            List<UDFieldInfo> list = new List<UDFieldInfo>();
            //find out the repeated id
            List<int> validIdList = (from p in idList select p).Distinct().ToList();

            foreach (var item in validIdList)
            {
                if (UDFieldController.Get(item) != null)
                {
                    UdtList.Add(UDFieldController.Get(item));
                }
            }
            foreach (var item in UdtList)
            {
                LocalizeObject_UDField(item);
            }
        }
        /// <summary>
        /// operator for udfield info
        /// </summary>
        private List<DropDownList> UdtOperList;

        private void InitUdtOperList()
        {

            UdtOperList = new List<DropDownList>();
            for (int i = 0; i < UdtList.Count; i++)
            {
                DropDownList ddlItem = new DropDownList();
                ddlItem.Width = Convert.ToInt32(Settings_Search.Advanced.Width_Operator);
                //user defined data which have list of values specified
                if (!string.IsNullOrEmpty(UdtList[i].InputSettings) &&
                    UdtList[i].InputSettings.IndexOf(';') > 0)
                {
                    //for check box list values, we should provide contain / not contain search feature.
                    if (UdtList[i].InputSettings.EndsWith(Cross.DNN.Common.UserDefinedTable.Definition.verticalCheckBoxListEnabledToken)
                        || UdtList[i].InputSettings.EndsWith(Cross.DNN.Common.UserDefinedTable.Definition.horizontalCheckBoxListEnabledToken))
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
                    switch (UdtList[i].FieldType.ToLower())
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
                UdtOperList.Add(ddlItem);
            }
        }


        #endregion
        public TypeInfo CurrentType
        {
            get
            {
                if (Settings_Search.General.TypeId != -1)
                {
                    return TypeController.Get(Settings_Search.General.TypeId);
                }
                else
                {
                    return new TypeInfo();
                }
            }
        }

        #region user defined fields

        private void BuildUDFieldForm()
        {
            InitUdtList();
            if (UdtList.Count < 1)
            {
                return;
            }
            InitUdtOperList();
            List<FormColumnInfo> listEditFrom = new List<FormColumnInfo>();
            FormColumnInfo objColumn;
            ListEditControls = new EditControls(ModuleContext);

            //edit style will use the input width settings
            string editStyle = string.Format("width:{0}px", Settings_Search.Advanced.Width_Input);

            for (int i = 0; i < UdtList.Count; i++)
            {
                objColumn = new FormColumnInfo();
                objColumn.Name = UdtList[i].FieldName;
                objColumn.IsUserDefinedField = true;
                objColumn.Help = UdtList[i].HelpText;
                objColumn.Title = string.IsNullOrEmpty(UdtList[i].FieldTitle) ? UdtList[i].FieldName : UdtList[i].FieldTitle;
                //add : to make it looks better
                if (objColumn.Title.EndsWith(":") == false)
                {
                    objColumn.Title += ":";
                }
                objColumn.Required = false;
                objColumn.Visible = true;
                objColumn.EditControl = ListEditControls.Add(objColumn.Name, objColumn.Title, UdtList[i].FieldType, UdtList[i].Id,
                    objColumn.Help, UdtList[i].DefaultValue, objColumn.Required,
                    UdtList[i].ValidationRule, UdtList[i].ValidationMessage, editStyle, UdtList[i].InputSettings,
                    UdtList[i].OutputSettings, UdtList[i].NormalizeFlag, Settings_Search.Advanced.RepeatColumns);

                listEditFrom.Add(objColumn);
            }
            BuildFormAsTable(listEditFrom);
        }

        public Control CreateTitleControl(string title)
        {
            Label lblControl = new Label();
            lblControl.Text = title;
            lblControl.Width = int.Parse(Settings_Search.Advanced.Width_Label);
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
                    objCell.Controls.Add(UdtOperList[i]);
                    objCell.Width = Unit.Pixel(Convert.ToInt32(Settings_Search.Advanced.Width_Label)
                        + Convert.ToInt32(Settings_Search.Advanced.Width_Operator));
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
                tblUserSearch.Rows.Add(objRow);
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

            this.LocalResourceFile = Localization.GetResourceFile(this, "Search.ascx");

            if (!IsPostBack)
            {
                if (Settings_Search.General.Mode == LocalUtils.SearchMode_Basic)
                {
                    pnlBasic.Visible = true;
                }
                if (Settings_Search.General.Mode == LocalUtils.SearchMode_Advanced)
                {
                    BindSearchLayout_Advanced();
                    if (Settings_Search.Advanced.BuiltInField_Price)
                    {
                        OnOper_PriceSelectedIndexChanged();
                    }
                    if (CurrentType.AllowLocation && Settings_Search.Advanced.BuiltInField_Country)
                    {
                        BindLocationCountry();
                        OnLocationCountry_SelectedIndexChanged();
                    }
                }
                BindCategories();
                BindAuthorList();
                DataBind();
            }
            if (Settings_Search.General.Mode == LocalUtils.SearchMode_Advanced)
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
            if (CurrentType.AllowLocation && Settings_Search.Advanced.BuiltInField_Country && Settings_Search.Advanced.BuiltInField_State)
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
                && Settings_Search.Advanced.BuiltInField_Country
                && Settings_Search.Advanced.BuiltInField_State
                && Settings_Search.Advanced.BuiltInField_City)
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
                && Settings_Search.Advanced.BuiltInField_Country
                && Settings_Search.Advanced.BuiltInField_State
                && Settings_Search.Advanced.BuiltInField_City
                && Settings_Search.Advanced.BuiltInField_Town)
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
        private void BindSearchLayout_Advanced()
        {
            pSearch.Visible = true;
            tblUserSearch.Visible = true;
        }
        public void BindAuthorList()
        {
            bool bind = false;
            if (Settings_Search.General.Mode == LocalUtils.SearchMode_Basic && Settings_Search.Basic.ShowAuthorList)
            {
                bind = true;
            }
            if (Settings_Search.General.Mode == LocalUtils.SearchMode_Advanced && Settings_Search.Advanced.BuiltInField_Author)
            {
                bind = true;
            }
            if (bind == false)
            {
                return;
            }

            List<Cross.Modules.CP_Product.Business.UserInfo> listAuthor = Cross.Modules.CP_Product.Business.UserController.GetByType(Settings_Search.General.TypeId);
            Cross.Modules.CP_Product.Business.UserInfo ai = new Cross.Modules.CP_Product.Business.UserInfo();
            ai.Username = "< " + Localization.GetString("SelectAuthor", LocalResourceFile) + " >";
            ai.UserId = -1;

            listAuthor.Add(ai);

            if (Settings_Search.General.Mode == LocalUtils.SearchMode_Basic && Settings_Search.Basic.ShowAuthorList)
            {
                ddlAuthorList.DataSource = listAuthor;
                ddlAuthorList.DataBind();
                ddlAuthorList.SelectedValue = "-1";
            }
            if (Settings_Search.General.Mode == LocalUtils.SearchMode_Advanced && Settings_Search.Advanced.BuiltInField_Author)
            {
                ddlBuiltInField_Author.DataSource = listAuthor;
                ddlBuiltInField_Author.DataBind();
                ddlBuiltInField_Author.SelectedValue = "-1";
            }

        }
        private void BindCategories()
        {
            bool bind = false;
            if (Settings_Search.General.Mode == LocalUtils.SearchMode_Basic && Settings_Search.Basic.ShowCategory)
            {
                bind = true;
            }
            if (Settings_Search.General.Mode == LocalUtils.SearchMode_Advanced && Settings_Search.Advanced.BuiltInField_Category)
            {
                bind = true;
            }
            if (bind == false)
            {
                return;
            }

            //v6.9 let administrator specify category which will be searched
            if (string.IsNullOrEmpty(Settings_Search.General.CategoryList))
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
            List<CategoryInfo> list = CategoryController.GetByType(Settings_Search.General.TypeId);
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

            if (Settings_Search.General.Mode == LocalUtils.SearchMode_Basic && Settings_Search.Basic.ShowCategory)
            {
                ddlCategory.DataSource = listCategory;
                ddlCategory.DataBind();
                ddlCategory.SelectedValue = "-1";
            }
            if (Settings_Search.General.Mode == LocalUtils.SearchMode_Advanced && Settings_Search.Advanced.BuiltInField_Category)
            {
                ddlBuiltInField_Category.DataSource = listCategory;
                ddlBuiltInField_Category.DataBind();
                ddlBuiltInField_Category.SelectedValue = "-1";
            }
        }

        private void BindCategoryAsList()
        {
            List<CategoryInfo> list = CategoryController.GetByList(Settings_Search.General.CategoryList);
            foreach (var item in list)
            {
                LocalizeObject_Category(item);
            }
            CategoryInfo a = new CategoryInfo();
            a.Id = -1;
            a.Name = "< " + Localization.GetString("SelectCategory", LocalResourceFile) + " >";
            list.Add(a);

            if (Settings_Search.General.Mode == LocalUtils.SearchMode_Basic && Settings_Search.Basic.ShowCategory)
            {
                ddlCategory.DataSource = list;
                ddlCategory.DataBind();
                ddlCategory.SelectedValue = "-1";
            }

            if (Settings_Search.General.Mode == LocalUtils.SearchMode_Advanced && Settings_Search.Advanced.BuiltInField_Category)
            {
                ddlBuiltInField_Category.DataSource = list;
                ddlBuiltInField_Category.DataBind();
                ddlBuiltInField_Category.SelectedValue = "-1";
            }
        }
        private string GetUrl()
        {
            int tab = GetSubModulePageId_List(Settings_Search.General.ProductListPage, Settings_Search.General.TypeId);

            return Globals.NavigateURL(tab);
        }
        protected void btnAdvancedSearch_Click(object sender, EventArgs e)
        {
            Cross.DNN.Common.RemoteForm.RemoteForm remoteForm = new DNN.Common.RemoteForm.RemoteForm("ProductSearch", GetUrl());

            remoteForm.Fields.Add("ProductTypeId", Settings_Search.General.TypeId.ToString());
            remoteForm.Fields.Add("S_Mode", "adv");


            string searchValue = string.Empty;
            DateTime searchDate;

            if (Settings_Search.Advanced.BuiltInField_Title)
            {
                if (!string.IsNullOrEmpty(txtBuiltInField_Title.Text))
                {
                    searchValue = txtBuiltInField_Title.Text.Trim();
                }
                if (!string.IsNullOrEmpty(searchValue))
                {
                    remoteForm.Fields.Add("S_Title", searchValue);
                    remoteForm.Fields.Add("S_Title_Oper", ddlOper_Title.SelectedValue);
                }
            }
            if (Settings_Search.Advanced.BuiltInField_Sku)
            {
                if (!string.IsNullOrEmpty(txtBuiltInField_Sku.Text))
                {
                    searchValue = txtBuiltInField_Sku.Text.Trim();
                }
                if (!string.IsNullOrEmpty(searchValue))
                {
                    remoteForm.Fields.Add("S_Sku", searchValue);
                    remoteForm.Fields.Add("S_Sku_Oper", ddlOper_Sku.SelectedValue);
                }
            }
            if (Settings_Search.Advanced.BuiltInField_Category && ddlBuiltInField_Category.SelectedValue != "-1")
            {
                remoteForm.Fields.Add("S_Category", ddlBuiltInField_Category.SelectedValue);
                remoteForm.Fields.Add("S_Category_Oper", ddlOper_Category.SelectedValue);
            }
            if (Settings_Search.Advanced.BuiltInField_Price)
            {
                //between, we need to check both from and to
                if (ddlOper_Price.SelectedValue == "between"
                    && LocalUtils.IsDecimal(txtBuiltInField_Price_From.Text)
                    && LocalUtils.IsDecimal(txtBuiltInField_Price_To.Text))
                {
                    if (decimal.Parse(txtBuiltInField_Price_To.Text) >= decimal.Parse(txtBuiltInField_Price_From.Text))
                    {
                        remoteForm.Fields.Add("S_Price_From", txtBuiltInField_Price_From.Text);
                        remoteForm.Fields.Add("S_Price_To", txtBuiltInField_Price_To.Text);
                        remoteForm.Fields.Add("S_Price_Oper", ddlOper_Price.SelectedValue);
                    }
                }
                //other operation
                if (ddlOper_Price.SelectedValue != "between"
                    && LocalUtils.IsDecimal(txtBuiltInField_Price.Text))
                {
                    remoteForm.Fields.Add("S_Price", txtBuiltInField_Price.Text);
                    remoteForm.Fields.Add("S_Price_Oper", ddlOper_Price.SelectedValue);
                }

            }
            if (Settings_Search.Advanced.BuiltInField_Author && ddlBuiltInField_Author.SelectedValue != "-1")
            {
                remoteForm.Fields.Add("S_Author", ddlBuiltInField_Author.SelectedValue);
                remoteForm.Fields.Add("S_Author_Oper", ddlOper_Author.SelectedValue);
            }
            if (Settings_Search.Advanced.BuiltInField_CreatedDate
                && ddpCreatedDate.SelectedDate != null
                && !string.IsNullOrEmpty(ddpCreatedDate.SelectedDate.Value.ToString()))
            {
                if (LocalUtils.IsDate(ddpCreatedDate.SelectedDate.Value.ToString()))
                {
                    searchDate = ddpCreatedDate.SelectedDate.Value;
                    remoteForm.Fields.Add("S_CreatedDate", searchDate.ToShortDateString());
                    remoteForm.Fields.Add("S_CreatedDate_Oper", ddlOper_CreatedDate.SelectedValue);
                }
            }
            if (Settings_Search.Advanced.BuiltInField_PublishDate
              && ddpPublishDate.SelectedDate != null
              && !string.IsNullOrEmpty(ddpPublishDate.SelectedDate.Value.ToString()))
            {
                if (LocalUtils.IsDate(ddpPublishDate.SelectedDate.Value.ToString()))
                {
                    searchDate = ddpPublishDate.SelectedDate.Value;
                    remoteForm.Fields.Add("S_PublishDate", searchDate.ToShortDateString());
                    remoteForm.Fields.Add("S_PublishDate_Oper", ddlOper_PublishDate.SelectedValue);
                }
            }

            if (Settings_Search.Advanced.BuiltInField_ExpireDate
            && ddpExpireDate.SelectedDate != null
            && !string.IsNullOrEmpty(ddpExpireDate.SelectedDate.Value.ToString()))
            {
                if (LocalUtils.IsDate(ddpExpireDate.SelectedDate.Value.ToString()))
                {
                    searchDate = ddpExpireDate.SelectedDate.Value;
                    remoteForm.Fields.Add("S_ExpireDate", searchDate.ToShortDateString());
                    remoteForm.Fields.Add("S_ExpireDate_Oper", ddlOper_ExpireDate.SelectedValue);
                }
            }
            if (Settings_Search.Advanced.BuiltInField_Views)
            {
                if (!string.IsNullOrEmpty(txtBuiltInField_Views.Text)
                    && Utils.IsNumber(txtBuiltInField_Views.Text)
                    && txtBuiltInField_Views.Text != "0")
                {
                    searchValue = txtBuiltInField_Views.Text.Trim();
                    if (!string.IsNullOrEmpty(searchValue))
                    {
                        remoteForm.Fields.Add("S_Views", searchValue);
                        remoteForm.Fields.Add("S_Views_Oper", ddlOper_Views.SelectedValue);
                    }
                }
            }
            if (Settings_Search.Advanced.BuiltInField_RatingAverage
                && ddlBuiltInField_RatingAverage.SelectedValue != "-1")
            {
                remoteForm.Fields.Add("S_RatingAverage", ddlBuiltInField_RatingAverage.SelectedValue);
                remoteForm.Fields.Add("S_RatingAverage_Oper", ddlOper_RatingAverage.SelectedValue);
            }

            if (CurrentType.AllowLocation
                && Settings_Search.Advanced.BuiltInField_Country
              && ddlBuiltInField_Country.SelectedValue != "-1")
            {
                remoteForm.Fields.Add("S_Country", ddlBuiltInField_Country.SelectedValue);
                remoteForm.Fields.Add("S_Country_Oper", ddlOper_Country.SelectedValue);
            }

            if (CurrentType.AllowLocation
               && Settings_Search.Advanced.BuiltInField_Country
               && Settings_Search.Advanced.BuiltInField_State
             && ddlBuiltInField_State.SelectedValue != "-1")
            {
                remoteForm.Fields.Add("S_State", ddlBuiltInField_State.SelectedValue);
                remoteForm.Fields.Add("S_State_Oper", ddlOper_State.SelectedValue);
            }
            if (CurrentType.AllowLocation
              && Settings_Search.Advanced.BuiltInField_Country
               && Settings_Search.Advanced.BuiltInField_State
              && Settings_Search.Advanced.BuiltInField_City
            && ddlBuiltInField_City.SelectedValue != "-1")
            {
                remoteForm.Fields.Add("S_City", ddlBuiltInField_City.SelectedValue);
                remoteForm.Fields.Add("S_City_Oper", ddlOper_City.SelectedValue);
            }
            if (CurrentType.AllowLocation
               && Settings_Search.Advanced.BuiltInField_Country
               && Settings_Search.Advanced.BuiltInField_State
              && Settings_Search.Advanced.BuiltInField_City
              && Settings_Search.Advanced.BuiltInField_Town
            && ddlBuiltInField_Town.SelectedValue != "-1")
            {
                remoteForm.Fields.Add("S_Town", ddlBuiltInField_Town.SelectedValue);
                remoteForm.Fields.Add("S_Town_Oper", ddlOper_Town.SelectedValue);
            }

            if (ListEditControls != null)
            {
                int i = 0;
                foreach (EditControl item in ListEditControls.Values)
                {
                    if (!string.IsNullOrEmpty(item.Value)
                        && !string.IsNullOrEmpty(UdtOperList[i].SelectedValue))
                    {
                        searchValue = item.Value.Trim();
                        remoteForm.Fields.Add(string.Format("S_UDT{0}_ID", i.ToString()), item.FieldID.ToString());
                        remoteForm.Fields.Add(string.Format("S_UDT{0}_Value", i.ToString()), searchValue);
                        remoteForm.Fields.Add(string.Format("S_UDT{0}_Oper", i.ToString()), UdtOperList[i].SelectedValue);
                    }
                    i += 1;
                }
            }
            remoteForm.Post();
        }
        private void OpenSearch(string parm)
        {
            string url = string.Empty;

            int tab = GetSubModulePageId_List(Settings_Search.General.ProductListPage, Settings_Search.General.TypeId);

            url = Globals.NavigateURL(tab, "", parm);
            if (Settings_Search.General.Target == "_self")//设置为本窗口打开
            {
                Response.Redirect(url, true);
            }
            else
            {
                Response.Write("<script>window.open('" + url + "','_blank')</script>");//设置为新窗口打开
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string parm = string.Empty;
            string url = string.Empty;

            parm = "&ProductTypeId=" + Settings_Search.General.TypeId.ToString();
            if (Settings_Search.Basic.ShowCategory)
            {
                parm += "&ProductCategoryId=" + ddlCategory.SelectedValue;
            }
            if (Settings_Search.Basic.ShowAuthorList)
            {
                parm += "&ProductUserId=" + ddlAuthorList.SelectedValue;
            }

            if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
            {
                PortalSecurity ps = new PortalSecurity();
                string s = ps.InputFilter(txtSearch.Text.Trim(), PortalSecurity.FilterFlag.NoSQL);//防止sql 注入
                if (s != "")
                {
                    if (parm != string.Empty)
                    {
                        parm += "&ProductSearchTerm=" + Server.UrlEncode(s);
                    }
                    else
                    {
                        parm += "ProductSearchTerm=" + Server.UrlEncode(s);
                    }
                }
            }
            OpenSearch(parm);
        }
        protected string GetCategoryBreakString()
        {
            if (Settings_Search.Basic.BreakOnCategory && Settings_Search.Basic.ShowCategory)
            {
                return "<br/>";

            }
            else
            {
                return "";
            }
        }
        protected string GetAuthorListBreakString()
        {
            if (Settings_Search.Basic.BreakOnAuthorList && Settings_Search.Basic.ShowAuthorList)
            {
                return "<br/>";

            }
            else
            {
                return "";
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

