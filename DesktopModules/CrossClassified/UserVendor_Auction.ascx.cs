using Cross.DNN.Common.A3;
using Cross.DNN.Common.UserDefinedTable;
using Cross.DNN.Common.Utility;
using Cross.DNN.Common.Utility.TreeHelper;
using Cross.Modules.CP_Product.Business;
using DotNetNuke.Common;
using DotNetNuke.Services.FileSystem;
using DotNetNuke.Services.Localization;
using DotNetNuke.UI.Skins.Controls;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Common.Utilities;

namespace Cross.Modules.CP_Product.View
{
    public partial class UserVendor_Auction : CPModuleBase
    {
        #region private fields

        private EditControls ListEditControls;

        private List<UDFieldInfo> TypeUdtList
        {
            get
            {
                List<UDFieldInfo> list = (from p in Cache_UdtList where p.TypeId == TypeId select p).ToList();
                return list;
            }
        }
        private int TypeId
        {
            get
            {
                if (ViewState["TypeId"] != null)
                {
                    return Convert.ToInt32(ViewState["TypeId"]);
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                ViewState["TypeId"] = value;
            }
        }
        public TypeInfo CurrentType
        {
            get
            {
                if (TypeId != -1)
                {
                    return TypeController.Get(TypeId);
                }
                else
                {
                    return new TypeInfo();
                }
            }
        }
        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] != null)
                {
                    return Convert.ToInt32(ViewState["CurrentPage"]);
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }


        private int ProductId
        {
            get
            {
                if (ViewState["ProductId"] != null)
                {
                    return Convert.ToInt32(ViewState["ProductId"]);
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                ViewState["ProductId"] = value;
            }
        }

      

        private int VideoId
        {
            get
            {
                if (ViewState["VideoId"] != null)
                {
                    return Convert.ToInt32(ViewState["VideoId"]);
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                ViewState["VideoId"] = value;
            }
        }
        private int AudioId
        {
            get
            {
                if (ViewState["AudioId"] != null)
                {
                    return Convert.ToInt32(ViewState["AudioId"]);
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                ViewState["AudioId"] = value;
            }
        }
        private int ImageId
        {
            get
            {
                if (ViewState["ImageId"] != null)
                {
                    return Convert.ToInt32(ViewState["ImageId"]);
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                ViewState["ImageId"] = value;
            }
        }

     
     


        private string CurrentTarget
        {
            get
            {
                if (ViewState["CurrentTarget"] != null)
                {
                    return Convert.ToString(ViewState["CurrentTarget"]);
                }
                else
                {
                    return "Product";
                }
            }
            set
            {
                ViewState["CurrentTarget"] = value;
            }
        }



        public bool HasManagePermission
        {
            get
            {
                return UserInfo.IsInRole(PortalSettings.AdministratorRoleName) 
                    || Utils.HasRolePermission(Settings_Portal.General.DataManageRoles);
            }
        }
        public bool IsGoods
        {
            get
            {
                TypeInfo objItem = TypeController.Get(TypeId);
                if (objItem != null)
                {
                    return objItem.SellType == Convert.ToInt32(SellType.Goods);
                }
                return false;
            }
        }
        public string GetCurrentBid(string productId)
        {
            return CP_Auction.Business.BidController.GetCurrentBid(Convert.ToInt32(productId)).Bid.ToString();
        }

        public bool Sellable
        {
            get
            {
                return true;
            }
        }
        public bool IsSoftware
        {
            get
            {

                TypeInfo objItem = TypeController.Get(TypeId);
                if (objItem != null)
                {
                    return objItem.SellType == Convert.ToInt32(SellType.Software);
                }

                return false;
            }
        }
   

        /// <summary>
        /// 当前type 下是否增加了manufacturer,没有的话应该不显示Manufacturer drop down list box
        /// </summary>
        public bool HasManufacturer
        {
            get
            {
                int totalRecords = 0;
                return ManufacturerController.GetByType(TypeId, 5, 0, ref totalRecords).Count > 0;
            }
        }
        #endregion
        #region DNN built-in upload control
        public string TemporaryUploadFolderPath
        {
            get { return Settings_Portal.Local.UserFolderRoot + "/TempUpload/" + UserId.ToString() + "/"; }
        }

        public string TemporaryUploadFolderId
        {
            get
            {
                return DotNetNuke.Services.FileSystem.FolderManager.Instance.GetFolder(PortalId,
                    TemporaryUploadFolderPath).FolderID.ToString();
            }
        }
        public string TemporaryUploadFolderName
        {
            get { return "Temporary Upload Directory"; }
        }
        protected override void OnInit(EventArgs e)
        {

            base.OnInit(e);

            ctlUploadJs.ModuleId = ModuleId;
            ctlUploadJs.Options.Parameters.Add("isHostPortal", "false");
            // ctlUploadJs.Options.Extensions
            ctlUploadJs.Options.FolderPicker.Disabled = true;
            //新添加的DNN File Upload Control 在administrator 下正常工作，但在一般用户的时候就会出错，
            //通过对比controls/filepickeruploader.ascx 源代码，发现区别在于DnnFilePickerUploader.cs 的OnLoad 方法多以下几个js注册，
            //逐个排查后，发现仅需要 DotNetNuke.Framework.JavaScriptLibraries.JavaScript.RequestRegistration(DotNetNuke.Framework.JavaScriptLibraries.CommonJs.DnnPlugins);
            //这句即可正常工作。
            //另外，还需要设置TemporaryUploadFolderPath 的权限为everyone can write to folder, 否则会出现no permission 错误提示
            //  DotNetNuke.Framework.jQuery.RegisterFileUpload(Page);
            if (!UserInfo.IsInRole(PortalSettings.AdministratorRoleName))
            {
                DotNetNuke.Framework.JavaScriptLibraries.JavaScript.RequestRegistration(DotNetNuke.Framework.JavaScriptLibraries.CommonJs.DnnPlugins);
            }
        }

        /// <summary>
        /// for normal user, we need to check if all users has write permission to upload folders
        /// </summary>
        private void CheckFolderWritePermission()
        {
            int roleId = Int32.Parse(Globals.glbRoleAllUsers);
            IFolderInfo objUploadFolder = DotNetNuke.Services.FileSystem.FolderManager.Instance.GetFolder(PortalId,
                    TemporaryUploadFolderPath);

            //First we need to check if all users already has write permission
            var folderPermission =
                (from DotNetNuke.Security.Permissions.FolderPermissionInfo p in objUploadFolder.FolderPermissions
                 where p.PermissionKey == "WRITE" && p.FolderID == objUploadFolder.FolderID
                 && p.RoleID == roleId && p.UserID == Null.NullInteger
                 && p.AllowAccess == true
                 select p).SingleOrDefault();

            if (folderPermission != null)//already has write permission, so we just return back
            {
                return;
            }
            int permissionId = 0;
            foreach (var item in DotNetNuke.Security.Permissions.PermissionController.GetPermissionsByFolder())
            {
                var objPermission = (DotNetNuke.Security.Permissions.PermissionInfo)item;
                if (objPermission.PermissionKey == "WRITE")
                {
                    permissionId = objPermission.PermissionID;
                    break;
                }
            }
            if (permissionId > 0)
            {
                DotNetNuke.Services.FileSystem.FolderManager.Instance.SetFolderPermission(objUploadFolder, permissionId, roleId);
            }
        }

        /// <summary>
        /// Delete existing folders (files) for the normal version of DNN upload control
        /// </summary>
        private void DeleteExistingFoldersAndFiles()
        {
            // first we need delete all existing files and folders, because these folders and files 
            //are stored under DNN database, so we can't simply using DirectoryInfo.Delete method to delete them
            IFolderInfo objParentFolder = FolderManager.Instance.GetFolder(PortalId,
                    TemporaryUploadFolderPath);
            if (objParentFolder == null)
            {
                return;
            }
            //first delete all existing files
            foreach (var item in FolderManager.Instance.GetFiles(objParentFolder, true))
            {
                FileManager.Instance.DeleteFile(item);
            }
            //second, delete all existing folders
            foreach (var item in FolderManager.Instance.GetFolders(objParentFolder))
            {
                FolderManager.Instance.DeleteFolder(item);
            }

            //After that, we also need to use the System.Io.Directory to check the physical 
            //sub directories (and files), and delete them
            //sometimes, the files (directories) in physical maybe not exist in DNN
            System.IO.DirectoryInfo objDest = new DirectoryInfo(TempUploadFolder_NormalVersion);
            if (objDest.Exists)
            {
                foreach (var item in objDest.GetDirectories())
                {
                    item.Delete(true);
                }
                foreach (var item in objDest.GetFiles())
                {
                    item.Delete();
                }
            }
        }
        #endregion

        #region user defined fields
        protected System.Drawing.Color GetForeColor(string auctionCheckResult)
        {
            switch (auctionCheckResult)
            {
                case "0":
                    return System.Drawing.Color.Black; 
                    break;
                case "1":
                    return System.Drawing.Color.Red; 
                    break;
                case "2":
                    return System.Drawing.Color.Orange; 
                    break;
                case "3":
                    return System.Drawing.Color.Blue; 
                    break;
                case "4":
                    return System.Drawing.Color.Green; 
                    break;
                default:
                    return System.Drawing.Color.Black; 
                    break;
            }
        }
        private void BuildUDFieldForm()
        {
            List<UDFieldInfo> list = (from p in Cache_UdtList where p.TypeId == TypeId select p).ToList();
            if (list.Count < 1)
            {
                if (tblUserDefinedField.Visible == true)
                {
                    tblUserDefinedField.Rows.Clear();
                    tblUserDefinedField.Visible = false;
                }
                return;
            }
            List<FormColumnInfo> listEditFrom = new List<FormColumnInfo>();
            FormColumnInfo objColumn;
            ListEditControls = new EditControls(ModuleContext);

            foreach (UDFieldInfo objUDField in list)
            {
                objColumn = new FormColumnInfo();
                objColumn.Name = objUDField.FieldName;
                objColumn.IsUserDefinedField = true;
                objColumn.Help = objUDField.HelpText;
                objColumn.Title = (objUDField.FieldTitle == null || objUDField.FieldTitle.Trim() == "") ? objUDField.FieldName : objUDField.FieldTitle;
                objColumn.Required = objUDField.Required;
                objColumn.Visible = true;
                objColumn.EditControl = ListEditControls.Add(objColumn.Name, objColumn.Title, objUDField.FieldType, objUDField.Id, objColumn.Help,
                    objUDField.DefaultValue, objColumn.Required,
                    objUDField.ValidationRule, objUDField.ValidationMessage, objUDField.EditStyle, objUDField.InputSettings,
                    objUDField.OutputSettings, objUDField.NormalizeFlag);
                listEditFrom.Add(objColumn);
            }
            BuildFormAsTable(listEditFrom);
        }
        private void BuildFormAsTable(List<FormColumnInfo> listEditFrom)
        {
            tblUserDefinedField.Visible = true;
            tblUserDefinedField.Rows.Clear();
            foreach (FormColumnInfo objColumn in listEditFrom)
            {
                TableRow objRow = new TableRow();
                //1st column: Caption for the field
                TableCell objCell = new TableCell();
              //  objCell.VerticalAlign = VerticalAlign.Top;
                objCell.HorizontalAlign = HorizontalAlign.Right;
                objCell.Controls.Add(GetUdtTitleControl(objColumn.Title, objColumn.Help, objColumn.Required, false));
                if (objColumn.EditControl == null)
                {
                    objCell.ColumnSpan = 2;
                    objRow.Cells.Add(objCell);
                }
                else
                {
                    //  objCell.CssClass = "Normal";
                    objCell.Width = Unit.Pixel(150);
                    objRow.Cells.Add(objCell);


                    //3rd column: Dynamic control
                    objCell = new TableCell();
                  //  objCell.VerticalAlign = VerticalAlign.Top;
                    objCell.Controls.Add(objColumn.EditControl);
                    objCell.Width = Unit.Percentage(80);
                    //row visibility:
                    objRow.Cells.Add(objCell);
                    objRow.Visible = true;
                }
                tblUserDefinedField.Rows.Add(objRow);
            }
        }

        private void UpdateUserDefinedData(int productId)
        {
            if (TypeUdtList.Count > 0)
            {
                UDDataInfo objUDData = new UDDataInfo();
                objUDData.ProductId = productId;
                foreach (EditControl item in ListEditControls.Values)
                {
                    objUDData.FieldId = item.FieldID;
                    objUDData.FieldValue = item.Value;
                    UDDataController.Update(objUDData);
                }
            }
        }
        private void CopyUserDefinedData(int originalProductId, int newProductId)
        {
            if (TypeUdtList.Count > 0)
            {
                UDDataController.CopyUserDefinedData(originalProductId, newProductId);
            }
        }
        private void BindUserDefinedData(int productId)
        {
            if (TypeUdtList.Count > 0)
            {
                List<UDDataInfo> listUDData = UDDataController.GetByProduct(productId);

                foreach (UDDataInfo objData in listUDData)
                {
                    UDFieldInfo objField = UDFieldController.Get(objData.FieldId);
                    if (objField != null && objData.FieldValue != null && ListEditControls[objField.FieldName] != null)
                    {
                        ListEditControls[objField.FieldName].Value = objData.FieldValue;
                    }

                }
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterScriptAndCss();
           if (!IsPostBack)
            {
                CheckSecurity();

                // v7.9 中限制user 的auction department 
                ddlType.DataSource = GetUserDepartments_Auction(UserId);
                ddlType.DataBind();

                TypeId = Convert.ToInt32(ddlType.SelectedValue);

                ProductId = -1;
                BindControl();
                LoadCategories();
                BindManufacturers();
                BindTag();
                BindProductList();
                BindLocationCountry();
                OnLocationCountry_SelectedIndexChanged();
                CurrentTarget = "Product";
                SetLayout("ViewProductList");

                OnShippingFeeType_SelectedIndexChanged(rblShippingFeeType.SelectedValue);
                OnTaxRateType_SelectedIndexChanged(rblTaxRateType.SelectedValue);

                lbl_Tip_SelectCategory.Text = string.Format(Localization.GetString("Tip_SelectCategory", LocalResourceFile),
                    Settings_Portal.General.CategorySelectCount.ToString());

                //we need to check if all users has read/browse/write permission to upload folder. this is for the DNN　built-in file upload control
                if (!UserInfo.IsInRole(PortalSettings.AdministratorRoleName))
                {
                    CheckFolderWritePermission();
                }

                DataBind();
            }
            BuildUDFieldForm();
        }
      
        private void RegisterScriptAndCss()
        {
            DotNetNuke.Framework.JavaScriptLibraries.JavaScript.RequestRegistration(DotNetNuke.Framework.JavaScriptLibraries.CommonJs.jQueryUI);
          
            StringBuilder sb = new StringBuilder();
            //Jquery ui
             sb.AppendFormat("<link rel=\"stylesheet\" href=\"{0}/desktopmodules/crossclassified/css/jquery-ui-themes-1.11.4/themes/{1}/jquery-ui.css\" type=\"text/css\"  />{2}",
                FullDomainName, Settings_Portal.General.TabStyle, "\r\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Cp_Detail_Script", sb.ToString());
        }
        //设定控件的初始状态
        private void BindControl()
        {
            lblProductQuota.Text =
                string.Format(Localization.GetString("lblProductQuota", LocalResourceFile),
                ProductCount == Cross.Modules.CP_Product.Business.LocalUtils.ItemCount_Unlimited ?
                Localization.GetString("Unlimited", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) : ProductCount.ToString(),
                ProductController.GetItemCount(PortalId, UserId).ToString());
            ctlPagingControl.ResourceFile = Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared;//绑定资源文件

            string fileStorage = Settings_Portal.General.FileStorage;
            string uploadUrl = Settings_Portal.General.FileStorage == Cross.Modules.CP_Product.Business.LocalUtils.FileStorage_A3 ? EditUrl("UserGeneral_A3File") : EditUrl("UserGeneral_LocalFileUpload2");

            ctlImage.ShowControlBar = InFileManageRoles;
            ctlImage.ShowFile = InFileManageRoles;
            ctlImage.ShowEmbed = false;
            ctlImage.ShowUrl = true;
            ctlImage.ShowThumbnailImage = false;
            ctlImage.StorageMode = fileStorage;
            ctlImage.UploadUrl = uploadUrl;
            ctlImage.Local_FolderRootPrefix = Settings_Portal.Local.UserFolderRoot;

            ctlAttachment.ShowControlBar = InFileManageRoles;
            ctlAttachment.ShowFile = InFileManageRoles;
            ctlAttachment.ShowEmbed = false;
            ctlAttachment.ShowUrl = true;
            ctlAttachment.ShowThumbnailImage = true;
            ctlAttachment.StorageMode = fileStorage;
            ctlAttachment.UploadUrl = uploadUrl;
            ctlAttachment.Local_FolderRootPrefix = Settings_Portal.Local.UserFolderRoot;

            ctlVideoFile.ShowControlBar = true;
            ctlVideoFile.ShowFile = InFileManageRoles;
            ctlVideoFile.ShowEmbed = true;
            ctlVideoFile.ShowUrl = true;
            ctlVideoFile.ShowThumbnailImage = true;
            ctlVideoFile.StorageMode = fileStorage;
            ctlVideoFile.UploadUrl = uploadUrl;
            ctlVideoFile.Local_FolderRootPrefix = Settings_Portal.Local.UserFolderRoot;


            ctlAudioFile.ShowControlBar = InFileManageRoles;
            ctlAudioFile.ShowFile = InFileManageRoles;
            ctlAudioFile.ShowEmbed = false;
            ctlAudioFile.ShowUrl = true;
            ctlAudioFile.ShowThumbnailImage = true;
            ctlAudioFile.StorageMode = fileStorage;
            ctlAudioFile.UploadUrl = uploadUrl;
            ctlAudioFile.Local_FolderRootPrefix = Settings_Portal.Local.UserFolderRoot;


            ctlImageFile.ShowControlBar = InFileManageRoles;
            ctlImageFile.ShowFile = InFileManageRoles;
            ctlImageFile.ShowEmbed = false;
            ctlImageFile.ShowUrl = true;
            ctlImageFile.ShowThumbnailImage = false;
            ctlImageFile.StorageMode = fileStorage;
            ctlImageFile.UploadUrl = uploadUrl;
            ctlImageFile.Local_FolderRootPrefix = Settings_Portal.Local.UserFolderRoot;

            if (InFileManageRoles)
            {
                ctlVideoFolder.ShowFolderListOnly = true;
                ctlVideoFolder.StorageMode = fileStorage;
                ctlVideoFolder.Local_FolderRootPrefix = Settings_Portal.Local.UserFolderRoot;

                ctlAudioFolder.ShowFolderListOnly = true;
                ctlAudioFolder.StorageMode = fileStorage;
                ctlAudioFolder.Local_FolderRootPrefix = Settings_Portal.Local.UserFolderRoot;

                ctlImageFolder.ShowFolderListOnly = true;
                ctlImageFolder.StorageMode = fileStorage;
                ctlImageFolder.Local_FolderRootPrefix = Settings_Portal.Local.UserFolderRoot;
                ctlImageFolder.ShowThumbnailImage = false;

            }



            lblPortalDisableComment.Visible = !Settings_Portal.Comment.AllowComment;
            lblPortalDisableRating.Visible = !Settings_Portal.Rating.AllowRating;


            txtOrder.Text = "10000";
            txtAuctionDays.Text = CurrentType.MaxAuctionDays.ToString();
            lblActionDaysLimit.Text = "1 - " + CurrentType.MaxAuctionDays.ToString();

            txtBidIncrement.Text = CurrentType.BidIncrement.ToString();

            chkAuthed.Checked = !Settings_Portal.General.RequireApproval;

            lblFileExtension.Text = string.Format(Localization.GetString("Tip_FileExtension", LocalResourceFile), Settings_Portal.Software.SoftwareExtension);
            //ViewRoles
            cblViewRoles = Utils.FillRolesCheckBox(cblViewRoles, Settings_Portal.General.ViewRoles, PortalSettings.AdministratorRoleId, PortalId);

            //Rating value
            chkAllowRating.Checked = Settings_Portal.Rating.AllowRating;
            cblRatingRoles = Utils.FillRolesCheckBox(cblRatingRoles, Settings_Portal.Rating.RatingRoles, PortalSettings.AdministratorRoleId, PortalId);

            //Comment value
            chkAllowComment.Checked = Settings_Portal.Comment.AllowComment;
            chkAutoAuthComment.Checked = Settings_Portal.Comment.AutoAuthComment;
            cblCommentRoles = Utils.FillRolesCheckBox(cblCommentRoles, Settings_Portal.Comment.CommentRoles, PortalSettings.AdministratorRoleId, PortalId);

            cblDownloadRoles = Utils.FillRolesCheckBox(cblDownloadRoles, Settings_Portal.Download.DownloadRoles, PortalSettings.AdministratorRoleId, PortalId);
        }
        private void BindTag()
        {
            txtTag2.Visible = Settings_Portal.General.TagSelectCount > 1;
            txtTag3.Visible = Settings_Portal.General.TagSelectCount > 2;
            txtTag4.Visible = Settings_Portal.General.TagSelectCount > 3;
            txtTag5.Visible = Settings_Portal.General.TagSelectCount > 4;
            txtTag6.Visible = Settings_Portal.General.TagSelectCount > 5;
            txtTag7.Visible = Settings_Portal.General.TagSelectCount > 6;
            txtTag8.Visible = Settings_Portal.General.TagSelectCount > 7;
            txtTag9.Visible = Settings_Portal.General.TagSelectCount > 8;
            txtTag10.Visible = Settings_Portal.General.TagSelectCount > 9;

            List<TagInfo> tagList = TagController.GetByType(TypeId);
            var popularList = from p in tagList orderby p.ProductCounts descending select new { Tag = p.Tag };
            ddlPopularTag.DataSource = popularList.Take(80);
            ddlPopularTag.DataBind();

        }

        private void CheckSecurity()
        {

            if (TrialExpired)
            {
                Response.Redirect(DotNetNuke.Common.Globals.NavigateURL(TabId), true);
            }
            if (Cache_TypeList.Count < 1)
            {
                Response.Redirect(DotNetNuke.Common.Globals.NavigateURL(TabId), true);
            }

            //检查是否为每个type 都设置了category
            foreach (Cross.Modules.CP_Product.Business.TypeInfo item in Cache_TypeList)
            {
                if ((from p in Cache_CategoryList where p.TypeId == item.Id select p).ToList().Count < 1)
                {
                    Response.Redirect(DotNetNuke.Common.Globals.NavigateURL(TabId), true);
                }
            }
            //检查当前用户是否有有效的auction type list
            if (GetUserDepartments_Auction(UserId).Count < 1)
            {
                Response.Redirect(DotNetNuke.Common.Globals.NavigateURL(TabId), true);
            }
            if (InVendorRoles)
            {
                return;
            }
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL("Access Denied"), true);
        }

        private void LoadCategories()
        {
            List<CategoryInfo> validList = (from p in Cache_CategoryList where p.TypeId == TypeId select p).ToList();
            //转换目录信息列表至树形节点列表
            List<RecursiveCategoryData> listRecursive = Cross.Modules.CP_Product.Business.LocalUtils.ConvertCategoryListToRecursiveList(validList);
            RecursiveCategoryItem m_recursiveCategoryRoot;
            m_recursiveCategoryRoot = RecursiveHelper.ConvertListToRecursiveItem(listRecursive);


            RecursiveHelper.ConvertRecursiveItemToAspNetTree(ref this.tvCategory, m_recursiveCategoryRoot);

            List<CategoryInfo> list = CategoryController.GetByType(TypeId);

            //if there is only 1 category, we should mark it as selected
            if (list.Count == 1)
            {
                foreach (TreeNode node in tvCategory.Nodes)
                {
                    node.Checked = true;
                }
            }

            for (int i = 0; i < list.Count; i++)
            {
                list[i].Name = Utils.FormatLevelName(list[i].Name, list[i].Level, "..");
            }

            List<RecursiveCategoryData> listRecursiveData = new List<RecursiveCategoryData>();
            listRecursiveData = Cross.Modules.CP_Product.Business.LocalUtils.ConvertCategoryListToRecursiveList(list);


            RecursiveCategoryItem orderedItems = RecursiveHelper.ConvertListToRecursiveItem(listRecursiveData);

            ArrayList listCategory = orderedItems.GetListOrdered();
            RecursiveCategoryItem a = new RecursiveCategoryItem();
            a.Id = -1;
            a.Name = "<" + DotNetNuke.Services.Localization.Localization.GetString("None_Specified") + ">";
            listCategory.Add(a);
            ddlCategory.DataSource = listCategory;
            ddlCategory.DataBind();
            ddlCategory.SelectedValue = "-1";

        }

        private void BindPreviousVersion(int productId)
        {
            ddlPreviousVersion.Items.Clear();
            ddlPreviousVersion.Items.Add(new ListItem("<" + Localization.GetString("None_Specified") + ">", "-1"));

            foreach (ProductInfo item in ProductController.GetPreviousVersion(TypeId, UserId, productId))
            {
                ddlPreviousVersion.Items.Add(new ListItem(item.Name, item.Id.ToString()));
            }
        }

        #region button event
        protected void btnAdd_Click(object sender, EventArgs e)
        {

            //first we need check if there is enough permission
            if (CurrentTarget == "Product")
            {
                //Unregister standard version.
                if ((CurrentEdition == Cross.DNN.Common.License.Edition.Standard) && (!Settings_Portal.General.Registered))
                {
                    if (ProductController.GetItemCount(PortalId, -1) > Cross.Modules.CP_Product.Business.LocalUtils.ItemCount_UnregisterVersionLimit)
                    {
                        DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("RegModuleTip", LocalResourceFile), ModuleMessage.ModuleMessageType.YellowWarning);
                        return;
                    }
                }
                //already reach products quota, can't add new product anymore.
                if (ProductCount != Cross.Modules.CP_Product.Business.LocalUtils.ItemCount_Unlimited
                    && ProductController.GetItemCount(PortalId, UserId) >= ProductCount)
                {
                    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Warning_ExceedQuota", LocalResourceFile), ModuleMessage.ModuleMessageType.YellowWarning);
                    return;
                }
            }

            //Set layout
            SetLayout("Add" + CurrentTarget);
            switch (CurrentTarget)
            {
                case "Product":

                    ProductId = -1;
                    if (CurrentType.FieldEnable_PreviousVersion)
                    {
                        BindPreviousVersion(ProductId);
                    }

                    Cross.Modules.CP_Product.Business.UserInfo objCurrentUser = Cross.Modules.CP_Product.Business.UserController.Get(UserId);
                    if (objCurrentUser.Support.Trim() != "")
                    {
                        txtSupport.Text = Server.HtmlDecode(objCurrentUser.Support);
                    }
                    if (objCurrentUser.Delivery.Trim() != "" && IsGoods)
                    {
                        txtDelivery.Text = Server.HtmlDecode(objCurrentUser.Delivery);
                    }
                    if (objCurrentUser.License.Trim() != "" && IsSoftware)
                    {
                        txtLicense.Text = Server.HtmlDecode(objCurrentUser.License);
                    }
                    TypeInfo objType = TypeController.Get(TypeId);
                    if (CurrentType.EnableField1)
                    {
                        txtField1.Text = Server.HtmlDecode(objType.Field1Default);
                    }
                    if (CurrentType.EnableField2)
                    {
                        txtField2.Text = Server.HtmlDecode(objType.Field2Default);
                    }
                    if (CurrentType.EnableField3)
                    {
                        txtField3.Text = Server.HtmlDecode(objType.Field3Default);
                    }
                    if (CurrentType.EnableField4)
                    {
                        txtField4.Text = Server.HtmlDecode(objType.Field4Default);
                    }
                    if (CurrentType.EnableField5)
                    {
                        txtField5.Text = Server.HtmlDecode(objType.Field5Default);
                    }
                    txtName.Text = "";
                    txtName.Focus();
                    //auto set start date/end date
                    startDatePicker.SelectedDate = DateTime.Now;
                    endDatePicker.SelectedDate = startDatePicker.SelectedDate.Value.AddDays(CurrentType.MaxAuctionDays);

                    startDatePicker.Enabled = true;
                    endDatePicker.Enabled = true;
                    //当add product 时，总是把divbasic第一个显示
                    //hidLastTab.Value = "#divBasic";
                    hidLastTab.Value = "0";
                    break;
                case "Download":
                    // first we need delete all existing files
                    System.IO.DirectoryInfo objDest = new System.IO.DirectoryInfo(TempUploadFolder_SilverlightVersion);
                    if (objDest.Exists)
                    {
                        objDest.Delete(true);
                    }
                    string filter = Settings_Portal.Software.SoftwareExtension;
                    // string filter = "Winzip Files(*.zip)|*.zip|Pdf files|*.pdf";
                    string password = "cross";
                    long maxUpload = -1;
                    string ashxPath = string.Format("{0}/DesktopModules/CrossClassified/FileUpload.ashx?p={1}&m={2}&u={3}&tp={4}&tabid={5}", FullDomainName, PortalId.ToString(), ModuleId.ToString(), UserId.ToString(), password, TabId.ToString());
                    string parms = string.Format("UploadPage={0},UploadChunkSize={1},MaximumTotalUpload={2},MaximumUpload={3},MaxConcurrentUploads={4},ResizeImage={5},ImageSize={6},Multiselect={7},Filter={8},AllowThumbnail={9},JavascriptCompleteFunction={10},MaxNumberToUpload={11},"
                            , ashxPath, "4194304", maxUpload.ToString(), maxUpload.ToString(), "1", "false", "300", "true", filter, "true", "OnComplete", "-1");
                    ctlUpload.InitParameters = parms;

                    //then we also need to delete folders/files for DNN normal upload control
                    DeleteExistingFoldersAndFiles();
                    break;
                default:
                    break;
            }
        }

        protected void btnChooseDownloadFromFile_Click(object sender, EventArgs e)
        {
            SetLayout("AddDownloadFromFile");
        }

        protected void btnSynchronize_Click(object sender, EventArgs e)
        {
            AddDownload_Silverlight();
            AddDownload_Normal();
            BindDownloadList();
            SetLayout("ViewDownloadList");
        }
        protected void btnAddFromFile_Click(object sender, EventArgs e)
        {
            if (!ctlDownloadFromFile.Url.StartsWith("FileID="))
            {
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Error_SpecifyZipFile", LocalResourceFile),
                      DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                return;
            }
            DotNetNuke.Services.FileSystem.IFileInfo objDnnFile = GetFileInfoById(ctlDownloadFromFile.Url);
            if (!System.IO.File.Exists(objDnnFile.PhysicalPath))
            {
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Error_FileNotExist", LocalResourceFile),
                      DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                return;
            }

            System.IO.FileInfo objActualFile = new System.IO.FileInfo(objDnnFile.PhysicalPath);


            DownloadInfo objItem = new DownloadInfo();
            objItem.ProductId = ProductId;
            objItem.OptionId = -1;
            objItem.FileName = objActualFile.Name;
            string random = Utils.GetRandomPassword();
            objItem.ActualName = random + objActualFile.Name;
            objItem.Size = objActualFile.Length;
            DownloadController.Add(objItem);

            if (!Directory.Exists(DownloadStorageFolder))//check if download directory exist
            {
                Directory.CreateDirectory(DownloadStorageFolder);
            }
            //Copy file to download folder
            File.Copy(objActualFile.FullName, DownloadStorageFolder + "\\" + random + objActualFile.Name);
            if (chkDeleteFileAfterAdded.Checked)//delete portal files to if option is checked.
            {
              //  DotNetNuke.Common.Utilities.FileSystemUtils.DeleteFile(objActualFile.FullName, PortalSettings, true);
                DotNetNuke.Services.FileSystem.FileManager.Instance.DeleteFile(objDnnFile);
            }
            BindDownloadList();
            SetLayout("ViewDownloadList");
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            switch (CurrentTarget)
            {
                case "Product":
                    ProductId = -1;
                   // hidLastTab.Value = "#divBasic";
                    hidLastTab.Value = "0";
                    SetLayout("ViewProductList");
                    break;
                case "Bidding":
               
                    SetLayout("ViewOptionList");
                    break;

                case "Download":
                    SetLayout("ViewDownloadList");
                    break;
                case "Video":
                    SetLayout("ViewVideoList");
                    break;
                case "Audio":
                    SetLayout("ViewAudioList");
                    break;
                case "Image":
                    SetLayout("ViewImageList");
                    break;
              
                default:
                    break;
            }

        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            switch (CurrentTarget)
            {
                case "Product":
                    //First we need delete related download files for this product
                    DeleteDownloadFiles_Product(ProductId);
                    ProductController.Delete(ProductId);
                    ProductId = -1;
                    BindProductList();
                    SetLayout("ViewProductList");
                    break;

                case "Video":
                    VideoController.Delete(VideoId);
                    VideoId = -1;
                    BindVideoList();
                    SetLayout("ViewVideoList");
                    break;
                case "Audio":
                    AudioController.Delete(AudioId);
                    AudioId = -1;
                    BindAudioList();
                    SetLayout("ViewAudioList");
                    break;
                case "Image":
                    ImageController.Delete(ImageId);
                    ImageId = -1;
                    BindImageList();
                    SetLayout("ViewImageList");
                    break;
                default:
                    break;
            }
            DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Tip_DeleteSuccess", LocalResourceFile), 
                DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);

        }

        protected void btnAddVideoFolder_Click(object sender, EventArgs e)
        {
            foreach (FileItem item in ctlVideoFolder.FileListInCurrentFolder)
            {
                int fileId = Convert.ToInt32(item.Value);
                VideoInfo objItem = new VideoInfo();
                objItem.Duration = GetVideoDuration(fileId);
                objItem.Thumbnail = GetVideoThumbnail(fileId);
                objItem.ProductId = ProductId;
                objItem.Title = item.Text;
                objItem.Description = "";
                objItem.Views = 1;
                objItem.VideoPath = GetFileFullUrl(fileId);
                objItem.VideoFile = "FileID=" + item.Value;
                VideoController.Add(objItem);
            }
            BindVideoList();
        }
        private string GetFileFullUrl(int fileId)
        {
            string url = "";

            if (Settings_Portal.General.FileStorage.ToLower() == "local")
            {
               
                DotNetNuke.Services.FileSystem.IFileInfo objFile = new DotNetNuke.Services.FileSystem.FileInfo();
                DotNetNuke.Entities.Portals.PortalController ctlPortal = new DotNetNuke.Entities.Portals.PortalController();
                DotNetNuke.Entities.Portals.PortalInfo pi = ctlPortal.GetPortal(PortalSettings.PortalId);

                objFile = DotNetNuke.Services.FileSystem.FileManager.Instance.GetFile(fileId);
                if (objFile != null)
                {
                    url = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + objFile.Folder + objFile.FileName;
                }

            }
            if (Settings_Portal.General.FileStorage.ToLower() == "a3")
            {
                if (A3FileController.Get(fileId) != null)
                {
                    url = A3FileController.Get(fileId).A3Url;
                }
            }
            return url;
        }
        protected void btnAddAudioFolder_Click(object sender, EventArgs e)
        {
            foreach (FileItem item in ctlAudioFolder.FileListInCurrentFolder)
            {
                AudioInfo objItem = new AudioInfo();
                objItem.ProductId = ProductId;
                objItem.Title = item.Text;
                objItem.Description = "";
                objItem.Views = 1;
                objItem.AudioPath = GetFileFullUrl(Convert.ToInt32(item.Value));
                objItem.AudioFile = "FileID=" + item.Value;
                AudioController.Add(objItem);
            }
            BindAudioList();
        }
        protected void btnAddImageFolder_Click(object sender, EventArgs e)
        {
            foreach (FileItem item in ctlImageFolder.FileListInCurrentFolder)
            {
                int fileId = Convert.ToInt32(item.Value);
                ImageInfo objItem = new ImageInfo();
                objItem.ImagePath = GetFileFullUrl(fileId);
                objItem.ImageFile = "FileID=" + item.Value;
                objItem.Thumbnail = objItem.ImagePath;
                string thumbnail = GetImageThumbnail(fileId);
                if (thumbnail != "")
                {
                    objItem.Thumbnail = thumbnail;
                }
                objItem.ProductId = ProductId;
                objItem.Title = item.Text;
                objItem.Description = "";
                objItem.Views = 1;

                ImageController.Add(objItem);
            }
            BindImageList();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            switch (CurrentTarget)
            {
                case "Product":
                    if (!IsProductDataValid())
                    {
                        return;
                    }
                    UpdateProduct();
                    ProductId = -1;
                    BindProductList();
                    SetLayout("ViewProductList");
                    break;
         
                case "Video":
                    if (!IsVideoDataValid())
                    {
                        return;
                    }
                    UpdateVideo();
                    BindVideoList();
                    SetLayout("ViewVideoList");
                    break;
                case "Audio":
                    if (!IsAudioDataValid())
                    {
                        return;
                    }
                    UpdateAudio();
                    BindAudioList();
                    SetLayout("ViewAudioList");
                    break;
                case "Image":
                    if (!IsImageDataValid())
                    {
                        return;
                    }
                    UpdateImage();
                    BindImageList();
                    SetLayout("ViewImageList");
                    break;
             
                default:
                    break;
            }
            DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Tip_UpdateSuccess", LocalResourceFile), 
                DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            BindProductList();
        }
     
        protected void btnRepublishSelected_Click(object sender, EventArgs e)
        {
            bool republish = false;//if there is something to republish
            switch (CurrentTarget)
            {
                case "Product":
                    foreach (GridViewRow item in gvList.Rows)
                    {
                        CheckBox chkItem = (CheckBox)item.FindControl("chkItem_Product");
                        if (chkItem.Checked == true)
                        {
                            Label lblId = (Label)item.FindControl("lblId");
                            ProductInfo objProduct = ProductController.Get(Convert.ToInt32(lblId.Text));
                           
                            if (objProduct.Expired && objProduct.StockQuantity > 0)
                            {
                                ProductController.RepublishAuctionItem(objProduct);
                              
                                republish = true;
                            }
                        }
                    }
                    if (republish)
                    {
                        BindProductList();
                    }

                    break;
                default:
                    break;
            }
            if (republish)
            {
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Tip_RepublishSuccess", LocalResourceFile),
                    DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
            }
        }
        protected void btnDeleteSelected_Click(object sender, EventArgs e)
        {
            bool deleted = false;//if there is something to deleted
            switch (CurrentTarget)
            {
                case "Product":
                    foreach (GridViewRow item in gvList.Rows)
                    {
                        CheckBox chkItem = (CheckBox)item.FindControl("chkItem_Product");
                        if (chkItem.Checked == true)
                        {
                            Label lblId = (Label)item.FindControl("lblId");
                            DeleteDownloadFiles_Product(Convert.ToInt32(lblId.Text));
                            ProductController.Delete(Convert.ToInt32(lblId.Text));
                            deleted = true;
                        }
                    }
                    if (deleted)
                    {
                        BindProductList();
                    }

                    break;
          
                case "Download":
                    foreach (GridViewRow item in gvDownloadList.Rows)
                    {
                        CheckBox chkItem = (CheckBox)item.FindControl("chkItem_Download");
                        if (chkItem.Checked == true)
                        {
                            Label lblId = (Label)item.FindControl("lblId");
                            //首先要删除相关文件,这个地方以前疏忽了，真不应该
                            DownloadInfo objDownload = DownloadController.Get(Convert.ToInt32(lblId.Text));
                            if (System.IO.File.Exists(DownloadStorageFolder + "\\" + objDownload.ActualName))
                            {
                                System.IO.File.Delete(DownloadStorageFolder + "\\" + objDownload.ActualName);
                            }
                            DownloadController.Delete(Convert.ToInt32(lblId.Text));
                            deleted = true;
                        }
                    }
                    if (deleted)
                    {
                        BindDownloadList();
                    }
                    break;
                case "Video":
                    foreach (GridViewRow item in gvVideoList.Rows)
                    {
                        CheckBox chkItem = (CheckBox)item.FindControl("chkItem_Video");
                        if (chkItem.Checked == true)
                        {
                            Label lblId = (Label)item.FindControl("lblId");
                            VideoController.Delete(Convert.ToInt32(lblId.Text));
                            deleted = true;
                        }
                    }
                    if (deleted)
                    {
                        BindVideoList();
                    }
                    break;
                case "Audio":
                    foreach (GridViewRow item in gvAudioList.Rows)
                    {
                        CheckBox chkItem = (CheckBox)item.FindControl("chkItem_Audio");
                        if (chkItem.Checked == true)
                        {
                            Label lblId = (Label)item.FindControl("lblId");
                            AudioController.Delete(Convert.ToInt32(lblId.Text));
                            deleted = true;
                        }
                    }
                    if (deleted)
                    {
                        BindAudioList();
                    }
                    break;
                case "Image":
                    foreach (GridViewRow item in gvImageList.Rows)
                    {
                        CheckBox chkItem = (CheckBox)item.FindControl("chkItem_Image");
                        if (chkItem.Checked == true)
                        {
                            Label lblId = (Label)item.FindControl("lblId");
                            ImageController.Delete(Convert.ToInt32(lblId.Text));
                            deleted = true;
                        }
                    }
                    if (deleted)
                    {
                        BindImageList();
                    }
                    break;
                case "Attachment":
                    foreach (GridViewRow item in gvAttachmentList.Rows)
                    {
                        CheckBox chkItem = (CheckBox)item.FindControl("chkItem_Attachment");
                        if (chkItem.Checked == true)
                        {
                            Label lblId = (Label)item.FindControl("lblId");
                            AttachmentController.Delete(Convert.ToInt32(lblId.Text));
                            deleted = true;
                        }
                    }
                    if (deleted)
                    {
                        BindAttachmentList();
                    }
                    break;
       
                default:
                    break;
            }
            if (deleted)
            {
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Tip_DeleteSuccess", LocalResourceFile),
                    DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
            }
        }
        #endregion
        private void AddDownload_Silverlight()
        {
            DirectoryInfo objDest = new DirectoryInfo(TempUploadFolder_SilverlightVersion);
            if (!objDest.Exists)
            {
                return;
            }
            //silverlight upload control already limit the upload file extension
            //  System.IO.FileInfo[] listZipFile = objDest.GetFiles("*.zip");
            System.IO.FileInfo[] listZipFile = objDest.GetFiles("*.*");
            foreach (System.IO.FileInfo item in listZipFile)
            {
                DownloadInfo objItem = new DownloadInfo();
                objItem.ProductId = ProductId;
                objItem.OptionId = -1;
                objItem.FileName = item.Name;
                string random = Utils.GetRandomPassword();
                objItem.ActualName = random + item.Name;
                objItem.Size = item.Length;
                File.Move(item.FullName, item.DirectoryName + "\\" + random + item.Name);//rename name
                DownloadController.Add(objItem);
                if (!Directory.Exists(DownloadStorageFolder))//check if download directory exist
                {
                    Directory.CreateDirectory(DownloadStorageFolder);
                }
                //Copy file to download folder
                File.Copy(item.DirectoryName + "\\" + random + item.Name, DownloadStorageFolder + "\\" + random + item.Name);
            }
            objDest.Delete(true);//Delete temporaty category.
        }
        private void AddDownload_Normal()
        {
            DirectoryInfo objDest = new DirectoryInfo(TempUploadFolder_NormalVersion);
            if (!objDest.Exists)
            {
                return;
            }
            //允许vendor upload 任意类型的文件
            //  System.IO.FileInfo[] listZipFile = objDest.GetFiles("*.zip");
            System.IO.FileInfo[] listZipFile = objDest.GetFiles("*.*");
            foreach (System.IO.FileInfo item in listZipFile)
            {
                // string filter = "Winzip Files(*.zip)|*.zip|Pdf files|*.pdf";
                // we need to check if upload files are in software extension
                if (Settings_Portal.Software.SoftwareExtension.ToLower().Contains(item.Extension.ToLower()))
                {
                    DownloadInfo objItem = new DownloadInfo();
                    objItem.ProductId = ProductId;
                    objItem.OptionId = -1;
                    objItem.FileName = item.Name;
                    string random = Utils.GetRandomPassword();
                    objItem.ActualName = random + item.Name;
                    objItem.Size = item.Length;
                    File.Move(item.FullName, item.DirectoryName + "\\" + random + item.Name);//rename name
                    DownloadController.Add(objItem);
                    if (!Directory.Exists(DownloadStorageFolder))//check if download directory exist
                    {
                        Directory.CreateDirectory(DownloadStorageFolder);
                    }
                    //Copy file to download folder
                    File.Copy(item.DirectoryName + "\\" + random + item.Name, DownloadStorageFolder + "\\" + random + item.Name);
                }
            }
            DeleteExistingFoldersAndFiles();
        }
        #region update data

        private void UpdateProduct()
        {
            ProductInfo objProduct = new ProductInfo();

            if (ProductId != -1)//update 
            {
                objProduct = ProductController.Get(ProductId);
            }
            objProduct.Id = ProductId;
            objProduct.PortalId = PortalId;
            objProduct.TypeId = TypeId;
            objProduct.UserId = UserId;
            //Normal 
            objProduct.Name = txtName.Text;

            objProduct.PreviousVersion = CurrentType.FieldEnable_PreviousVersion ? Convert.ToInt32(ddlPreviousVersion.SelectedValue) : -1;

            objProduct.ManufacturerId = HasManufacturer ? Convert.ToInt32(ddlManufacturer.SelectedValue) : -1;

            //auction item, put below values as 0
            objProduct.PurchasePrice = 0;
            objProduct.EnablePromoPrice = false;
            objProduct.PromoPrice = 0;
            objProduct.PromoStart = DateTime.Now;

         
            objProduct.StartPrice = Convert.ToDecimal(txtStartPrice.Text);
            objProduct.BidIncrement = ( CurrentType.AuctionType == Convert.ToInt32(CP_Auction.Business.AuctionType.English) ||
                CurrentType.AuctionType == Convert.ToInt32(CP_Auction.Business.AuctionType.Vickrey) ? Convert.ToDecimal(txtBidIncrement.Text):0);
            objProduct.ReservePrice = Convert.ToDecimal(txtReservePrice.Text);

            objProduct.BuyNowPrice = (CurrentType.AuctionType == Convert.ToInt32(CP_Auction.Business.AuctionType.Second_item) ? 0 : Convert.ToDecimal(txtBuyNowPrice.Text));
          
    
            //仅对second_item 有效
            objProduct.StockQuantity = CurrentType.AuctionType == Convert.ToInt16(CP_Auction.Business.AuctionType.Second_item) ? Convert.ToInt32(txtStockQuantity.Text) : 1;

            //对于auction product 来说，其LowThreshold = 1, 因此当东西卖完（stock quantity = 0)时即为lowStockQuantity
            objProduct.LowThreshold = 1;
            objProduct.Sku = CurrentType.FieldEnable_Sku ? txtSku.Text : string.Empty;
            objProduct.ShippingProperty = txtShippingProperty.Text;

            objProduct.Weight = IsGoods && CurrentType.FieldEnable_Weight && !string.IsNullOrEmpty(txtWeight.Text)?
                                Convert.ToDecimal(txtWeight.Text) : 0;
            objProduct.ShippingFeeType = Convert.ToInt32(rblShippingFeeType.SelectedValue);
            objProduct.FixedShippingFee = !string.IsNullOrEmpty(txtFixedShippingFee.Text) ? Convert.ToDecimal(txtFixedShippingFee.Text) : 0;

            objProduct.PackageFee = IsGoods && CurrentType.FieldEnable_PackageFee && Sellable && !string.IsNullOrEmpty(txtPackageFee.Text)? 
                                       Convert.ToDecimal(txtPackageFee.Text) : 0;

            objProduct.TaxRateType = Convert.ToInt32(rblTaxRateType.SelectedValue);
            objProduct.FixedTaxRate = !string.IsNullOrEmpty(txtFixedTaxRate.Text) ? Convert.ToDecimal(txtFixedTaxRate.Text) : 0;


            //recursive billing
            if (Sellable && CurrentType.AllowRecursiveBill)
            {
                objProduct.RecursiveBill = chkRecursiveBill.Checked;
                objProduct.BillFrequency = Convert.ToInt32(ddlBillFrequency.SelectedValue);
                objProduct.BillPeriod = Convert.ToInt32(txtBillPeriod.Text);
            }
            else
            {
                objProduct.RecursiveBill = false;
                objProduct.BillPeriod = 1;
                objProduct.BillFrequency = Convert.ToInt32(BillFrequency.Day);
            }

            objProduct.LinkUrl = CurrentType.FieldEnable_LinkUrl ? ctlLinkUrl.Url : string.Empty;

            //location
            objProduct.CountryId = Convert.ToInt32(ddlLocationCountry.SelectedValue);
            objProduct.Country = ddlLocationCountry.SelectedValue == "-1" ? "" : ddlLocationCountry.SelectedItem.Text;

            objProduct.StateId = Convert.ToInt32(ddlLocationState.SelectedValue);
            objProduct.State = ddlLocationState.SelectedValue == "-1" ? "" : ddlLocationState.SelectedItem.Text;

            objProduct.CityId = Convert.ToInt32(ddlLocationCity.SelectedValue);
            objProduct.City = ddlLocationCity.SelectedValue == "-1" ? "" : ddlLocationCity.SelectedItem.Text;

            objProduct.TownId = Convert.ToInt32(ddlLocationTown.SelectedValue);
            objProduct.Town = ddlLocationTown.SelectedValue == "-1" ? "" : ddlLocationTown.SelectedItem.Text;

            //Google map
            objProduct.Longitude = txtLongitude.Text;
            objProduct.Latitude = txtLatitude.Text;
            objProduct.MapTitle = txtMapTitle.Text;

            objProduct.Active = chkActive.Checked;
            if (HasManagePermission)
            {
                objProduct.Featured = chkFeatured.Checked;
                objProduct.Authed = Settings_Portal.General.RequireApproval == true ? chkAuthed.Checked : true;
                objProduct.Order = Convert.ToInt32(txtOrder.Text);
            }
            else
            {
                objProduct.Featured = false;
                objProduct.Authed = !Settings_Portal.General.RequireApproval;
                objProduct.Order = 10000;
            }

            if (CurrentType.FieldEnable_Image)
            {
                //Image and thumbnail
                objProduct.Image = ctlImage.Url;
                objProduct.Thumbnail = "";
            }
            else
            {
                objProduct.Image = string.Empty;
                objProduct.Thumbnail = string.Empty;
            }

            //File
            if (objProduct.Image.StartsWith("FileID="))
            {
                //local file
                if (Settings_Portal.General.FileStorage == Cross.Modules.CP_Product.Business.LocalUtils.FileStorage_Local)
                {
                   
                    DotNetNuke.Services.FileSystem.IFileInfo fi = new DotNetNuke.Services.FileSystem.FileInfo();
                    DotNetNuke.Entities.Portals.PortalController ctlPortal = new DotNetNuke.Entities.Portals.PortalController();
                    DotNetNuke.Entities.Portals.PortalInfo pi = ctlPortal.GetPortal(PortalId);
                    fi = GetFileInfoById(objProduct.Image);
                    if (fi != null && System.IO.File.Exists(fi.PhysicalPath))
                    {
                        objProduct.Thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + fi.Folder + fi.FileName;
                        System.IO.FileInfo physicalFile = new System.IO.FileInfo(fi.PhysicalPath);

                        if (!fi.FileName.ToLower().StartsWith("thumb_"))//文件没有以"thumb_"开头，则先查找是否存在以thumb_ 开头的同名图片
                        {
                            if (System.IO.File.Exists(physicalFile.DirectoryName + "\\" + "thumb_" + physicalFile.Name))//存在该文件，则自动指向
                            {
                                objProduct.Thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + fi.Folder + "thumb_" + fi.FileName;
                            }
                            else//不存在，则生成该文件，然后指向
                            {
                                if (Settings_Portal.General.GenerateThumb)
                                {
                                    Utils.ResizeImage(fi.PhysicalPath, Settings_Portal.General.ThumbnailSize, physicalFile.DirectoryName + "\\" + "thumb_" + physicalFile.Name);
                                    objProduct.Thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + fi.Folder + "thumb_" + fi.FileName;
                                }
                            }
                        }
                    }
                }
                //a3
                if (Settings_Portal.General.FileStorage == Cross.Modules.CP_Product.Business.LocalUtils.FileStorage_A3)
                {
                    int a3FileId = Convert.ToInt32(objProduct.Image.Replace("FileID=", ""));
                    A3FileInfo objA3File = A3FileController.Get(a3FileId);
                    if (objA3File != null && A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + "thumb_" + objA3File.FileName) != null)
                    {
                        objProduct.Thumbnail = A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + "thumb_" + objA3File.FileName).A3Url;
                    }
                }
            }
            //External images
            if (objProduct.Image.ToLower().StartsWith("http"))
            {
                objProduct.Thumbnail = objProduct.Image;
            }

            //Add Categories

            objProduct.Categories = RecursiveHelper.GetAspNetTreeCheckList(tvCategory);

            objProduct.Summary = CurrentType.FieldEnable_Summary ? txtSummary.Text : string.Empty;
            objProduct.Description = CurrentType.FieldEnable_Description ? GetHtmlEditorText(txtDescription.Text) : string.Empty;
            objProduct.SpecialOffer = CurrentType.FieldEnable_SpecialOffer ? GetHtmlEditorText(txtSpecialOffer.Text) : string.Empty;

            objProduct.Delivery = CurrentType.FieldEnable_Delivery && IsGoods ? GetHtmlEditorText(txtDelivery.Text) : string.Empty;


            objProduct.License = CurrentType.FieldEnable_License && IsSoftware ? GetHtmlEditorText(txtLicense.Text) : string.Empty;


            objProduct.Field1 = CurrentType.EnableField1 ? GetHtmlEditorText(txtField1.Text) : string.Empty;
            objProduct.Field2 = CurrentType.EnableField2 ? GetHtmlEditorText(txtField2.Text) : string.Empty;
            objProduct.Field3 = CurrentType.EnableField3 ? GetHtmlEditorText(txtField3.Text) : string.Empty;
            objProduct.Field4 = CurrentType.EnableField4 ? GetHtmlEditorText(txtField4.Text) : string.Empty;
            objProduct.Field5 = CurrentType.EnableField5 ? GetHtmlEditorText(txtField5.Text) : string.Empty;


            objProduct.Support = CurrentType.FieldEnable_Support ? GetHtmlEditorText(txtSupport.Text) : string.Empty;
            if (HasManagePermission)
            {
                objProduct.ViewRoles = Utils.GetCheckedItems(cblViewRoles, PortalSettings.AdministratorRoleId);
                //Rating
                objProduct.AllowRating = chkAllowRating.Checked;
                objProduct.RatingRoles = Utils.GetCheckedItems(cblRatingRoles, PortalSettings.AdministratorRoleId);

                //Comment
                objProduct.AllowComment = chkAllowComment.Checked;
                objProduct.CommentRoles = Utils.GetCheckedItems(cblCommentRoles, PortalSettings.AdministratorRoleId);
                objProduct.AutoAuthComment = chkAutoAuthComment.Checked;

                //Download roles
                objProduct.DownloadRoles = Utils.GetCheckedItems(cblDownloadRoles, PortalSettings.AdministratorRoleId);
            }
            else
            {
                objProduct.ViewRoles = Settings_Portal.General.ViewRoles;
                objProduct.AllowRating = Settings_Portal.Rating.AllowRating;
                objProduct.RatingRoles = Settings_Portal.Rating.RatingRoles;

                objProduct.AllowComment = Settings_Portal.Comment.AllowComment;
                objProduct.CommentRoles = Settings_Portal.Comment.CommentRoles;
                objProduct.AutoAuthComment = Settings_Portal.Comment.AutoAuthComment;

                objProduct.DownloadRoles = Settings_Portal.Download.DownloadRoles;

            }

            //Add Tags
            objProduct.Tags = "";
            TagInfo objTag = new TagInfo();
            List<int> tagList = new List<int>();
            if (txtTag1.Text.Trim() != "")
            {
                objTag = TagController.GetByTag(txtTag1.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.TypeId = TypeId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag1.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag2.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 1)
            {
                objTag = TagController.GetByTag(txtTag2.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.TypeId = TypeId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag2.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag3.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 2)
            {
                objTag = TagController.GetByTag(txtTag3.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.TypeId = TypeId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag3.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag4.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 3)
            {
                objTag = TagController.GetByTag(txtTag4.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.TypeId = TypeId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag4.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag5.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 4)
            {
                objTag = TagController.GetByTag(txtTag5.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.TypeId = TypeId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag5.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag6.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 5)
            {
                objTag = TagController.GetByTag(txtTag6.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.TypeId = TypeId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag6.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag7.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 6)
            {
                objTag = TagController.GetByTag(txtTag7.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.TypeId = TypeId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag7.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag8.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 7)
            {
                objTag = TagController.GetByTag(txtTag8.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.TypeId = TypeId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag8.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag9.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 8)
            {
                objTag = TagController.GetByTag(txtTag9.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.TypeId = TypeId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag9.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag10.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 9)
            {
                objTag = TagController.GetByTag(txtTag10.Text.Trim(), PortalId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.TypeId = TypeId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag10.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            var newTaglist = (from p in tagList select p).Distinct();//remove the  repeated tag item.

            foreach (int item in newTaglist)
            {
                objProduct.Tags += item.ToString() + ",";
            }
            objProduct.Tags = Utils.RemoveSeperator(objProduct.Tags, ",");
            //Tags end

            objProduct.ShareType = Convert.ToInt16(ShareType.Public);
            objProduct.Protected = false;
            objProduct.ProtectPassword = string.Empty;
            objProduct.Friends = false;
            objProduct.Followers = false;
            objProduct.Groups = string.Empty;

            //Now processing attachment
            int newProductId = -1;
            if (ProductId == -1)
            {
                //only allow modify below values when add item
                //auction price
                int auctionDays = Convert.ToInt32(txtAuctionDays.Text);
                //不允许属于大于department最大auciont days
                if (auctionDays > CurrentType.MaxAuctionDays)
                {
                    auctionDays = CurrentType.MaxAuctionDays;
                }
                objProduct.AuctionDays = auctionDays;
                objProduct.IsAuction = true;

                //add a start date, 如果当前的start date 就设置为今天日期，那么就取当前时间
                objProduct.PublishDate = startDatePicker.SelectedDate == null ? DateTime.Now : startDatePicker.SelectedDate.Value;

                objProduct.ExpireDate = endDatePicker.SelectedDate == null ? objProduct.PublishDate.AddDays(auctionDays) : endDatePicker.SelectedDate.Value;
                //Reset auction days, to avoid confuse
                if (startDatePicker.SelectedDate!=null && endDatePicker.SelectedDate!=null)
                {
                    TimeSpan ts = endDatePicker.SelectedDate.Value - startDatePicker.SelectedDate.Value;
                    objProduct.AuctionDays =ts.Days;
                }
                objProduct.AuctionCheck = false;
                objProduct.AuctionCheckResult = Convert.ToInt32(CP_Auction.Business.AuctionResult.InBidding);
                newProductId = ProductController.Add(objProduct);
            }
            else
            {
                ProductController.Update(objProduct, true);
                newProductId = ProductId;
            }

            UpdateUserDefinedData(newProductId);
            //Reset all 
            ProductId = -1;

        }
        private void UpdateAudio()
        {
            AudioInfo objItem = new AudioInfo();
            if (AudioId != -1)
            {
                objItem = AudioController.Get(AudioId);
            }
            objItem.Id = AudioId;
            objItem.ProductId = ProductId;
            objItem.Title = txtAudioTitle.Text.Trim();
            objItem.Description = txtAudioDescription.Text;
            objItem.AudioFile = ctlAudioFile.Url;
            objItem.AudioPath = ctlAudioFile.FullUrl;
            objItem.Views = 1;
            if (AudioId == -1)
            {
                AudioController.Add(objItem);
            }
            else
            {
                AudioController.Update(objItem);
            }
            AudioId = -1;
        }
        private void UpdateVideo()
        {
            VideoInfo objItem = new VideoInfo();
            if (VideoId != -1)
            {
                objItem = VideoController.Get(VideoId);
            }
            objItem.Id = VideoId;
            objItem.Duration = txtVideoDuration.Text.Trim();
            objItem.Thumbnail = txtVideoThumbnail.Text.Trim();
            if (ctlVideoFile.Url.StartsWith("FileID="))// 当前选择为文件，因此试图获取其duration,thunmnail
            {
                int fileId = Convert.ToInt32(ctlVideoFile.Url.Replace("FileID=", ""));
                if (txtVideoDuration.Text.Trim() == "")
                {
                    objItem.Duration = GetVideoDuration(fileId);
                }
                if (txtVideoThumbnail.Text.Trim() == "")
                {
                    objItem.Thumbnail = GetVideoThumbnail(fileId);
                }
            }

            objItem.ProductId = ProductId;
            objItem.Title = txtVideoTitle.Text.Trim();
            objItem.Description = txtVideoDescription.Text;
            objItem.VideoFile = ctlVideoFile.Url;
            objItem.VideoPath = ctlVideoFile.FullUrl;
            objItem.Views = 1;
            if (VideoId == -1)
            {
                VideoController.Add(objItem);
            }
            else
            {
                VideoController.Update(objItem);
            }
            VideoId = -1;
        }
        private void UpdateImage()
        {
            ImageInfo objItem = new ImageInfo();
            if (ImageId != -1)//这个地方一定要改
            {
                objItem = ImageController.Get(ImageId);
            }
            objItem.Id = ImageId;
            objItem.Thumbnail = ctlImageFile.FullUrl;
            if (ctlImageFile.Url.StartsWith("FileID="))// 当前选择为文件，因此试图获取thunmnail
            {
                string thumbnail = GetImageThumbnail(Convert.ToInt32(ctlImageFile.Url.Replace("FileID=", "")));
                if (thumbnail != "")
                {
                    objItem.Thumbnail = thumbnail;
                }
            }

            objItem.ProductId = ProductId;
            objItem.Title = txtImageTitle.Text.Trim();
            objItem.Description = txtImageDescription.Text;
            objItem.ImageFile = ctlImageFile.Url;
            objItem.ImagePath = ctlImageFile.FullUrl;
            objItem.Views = 1;
            if (ImageId == -1)
            {
                ImageController.Add(objItem);
            }
            else
            {
                ImageController.Update(objItem);
            }
            ImageId = -1;
        }

        #endregion
        private string GetVideoDuration(int fileId)
        {
            string duration = "";
            if (Settings_Portal.General.FileStorage == Cross.Modules.CP_Product.Business.LocalUtils.FileStorage_Local)
            {
               
                DotNetNuke.Services.FileSystem.IFileInfo objFile = new DotNetNuke.Services.FileSystem.FileInfo();
                DotNetNuke.Entities.Portals.PortalController ctlPortal = new DotNetNuke.Entities.Portals.PortalController();
                DotNetNuke.Entities.Portals.PortalInfo pi = ctlPortal.GetPortal(PortalId);
                objFile = DotNetNuke.Services.FileSystem.FileManager.Instance.GetFile(fileId);

                if (objFile != null && File.Exists(objFile.PhysicalPath))
                {
                    System.IO.FileInfo objPhysical = new System.IO.FileInfo(objFile.PhysicalPath);
                    if (Settings_Portal.Video.VideoConvert && Settings_Portal.Video.PassPermissionCheck)
                    {
                        Cross.DNN.Common.VideoManage.VideoManageOption option = new Cross.DNN.Common.VideoManage.VideoManageOption();
                        option.General.FFMPEGPath = ExeFileFolder + "\\ffmpeg\\ffmpeg.exe";
                        option.General.FLVToolPath = ExeFileFolder + "\\ffmpeg\\flvtool2.exe";
                        option.General.MencoderPath = ExeFileFolder + "\\mencoder\\mencoder.exe";
                        option.General.MencoderDirectory = ExeFileFolder + "\\mencoder";
                        option.General.InputPath = objPhysical.Directory.FullName;
                        option.General.OutputPath = objPhysical.Directory.FullName;
                        option.Video.ExitProcess = Settings_Portal.Video.ProcessExitTime;
                        option.General.FileName = objPhysical.Name;
                        Cross.DNN.Common.VideoManage.VideoController ctlVideo = new Cross.DNN.Common.VideoManage.VideoController(option);
                        duration = ctlVideo.Get_Info().Duration;

                    }
                }
            }
            if (Settings_Portal.General.FileStorage == Cross.Modules.CP_Product.Business.LocalUtils.FileStorage_A3)
            {
                A3FileInfo objA3File = A3FileController.Get(fileId);
                if (objA3File != null)
                {
                    duration = objA3File.Duration;
                }
            }
            return duration.Trim();
        }
        private string GetVideoThumbnail(int fileId)
        {
            string thumbnail = "";
            if (Settings_Portal.General.FileStorage == Cross.Modules.CP_Product.Business.LocalUtils.FileStorage_Local)
            {
              
                DotNetNuke.Services.FileSystem.IFileInfo objFile = new DotNetNuke.Services.FileSystem.FileInfo();
                DotNetNuke.Entities.Portals.PortalController ctlPortal = new DotNetNuke.Entities.Portals.PortalController();
                DotNetNuke.Entities.Portals.PortalInfo pi = ctlPortal.GetPortal(PortalId);
                objFile = DotNetNuke.Services.FileSystem.FileManager.Instance.GetFile(fileId);

                if (objFile != null && File.Exists(objFile.PhysicalPath))
                {
                    System.IO.FileInfo objPhysical = new System.IO.FileInfo(objFile.PhysicalPath);

                    if (File.Exists(objPhysical.DirectoryName + "\\" + "thumb_" + objPhysical.Name.Replace(objPhysical.Extension, ".jpg")))//Find if exist thumbnail image
                    {
                        thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + objFile.Folder + "thumb_" + objFile.FileName.Replace(objPhysical.Extension, ".jpg");
                    }
                    else
                    {
                        if (File.Exists(objPhysical.DirectoryName + "\\" + objPhysical.Name.Replace(objPhysical.Extension, ".jpg")))//Find if exist same name image
                        {
                            thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + objFile.Folder + objFile.FileName.Replace(objPhysical.Extension, ".jpg");
                        }
                    }
                }
            }
            if (Settings_Portal.General.FileStorage == Cross.Modules.CP_Product.Business.LocalUtils.FileStorage_A3)
            {
                A3FileInfo objA3File = A3FileController.Get(fileId);
                if (objA3File != null)
                {
                    if (A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + "thumb_" + objA3File.FileName.Replace(objA3File.Extension, ".jpg")) != null)
                    {
                        thumbnail = A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + "thumb_" + objA3File.FileName.Replace(objA3File.Extension, ".jpg")).A3Url;
                    }
                    else
                    {
                        if (A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + objA3File.FileName.Replace(objA3File.Extension, ".jpg")) != null)
                        {
                            thumbnail = A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + objA3File.FileName.Replace(objA3File.Extension, ".jpg")).A3Url;
                        }
                    }
                }
            }
            return thumbnail;
        }


        private string GetImageThumbnail(int fileId)
        {
            string thumbnail = "";
            if (Settings_Portal.General.FileStorage == Cross.Modules.CP_Product.Business.LocalUtils.FileStorage_Local)
            {
               
                DotNetNuke.Services.FileSystem.IFileInfo objFile = new DotNetNuke.Services.FileSystem.FileInfo();
                DotNetNuke.Entities.Portals.PortalController ctlPortal = new DotNetNuke.Entities.Portals.PortalController();
                DotNetNuke.Entities.Portals.PortalInfo pi = ctlPortal.GetPortal(PortalId);
                objFile = DotNetNuke.Services.FileSystem.FileManager.Instance.GetFile(fileId);

                if (objFile != null && File.Exists(objFile.PhysicalPath))
                {
                    System.IO.FileInfo objPhysical = new System.IO.FileInfo(objFile.PhysicalPath);

                    if (File.Exists(objPhysical.DirectoryName + "\\" + "thumb_" + objPhysical.Name))//Find if exist thumbnail image
                    {
                        thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + objFile.Folder + "thumb_" + objFile.FileName;
                    }
                }
            }
            if (Settings_Portal.General.FileStorage == Cross.Modules.CP_Product.Business.LocalUtils.FileStorage_A3)
            {
                A3FileInfo objA3File = A3FileController.Get(fileId);
                if (objA3File != null)
                {
                    if (A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + "thumb_" + objA3File.FileName) != null)
                    {
                        thumbnail = A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + "thumb_" + objA3File.FileName).A3Url;
                    }
                }
            }
            return thumbnail;
        }

        private Boolean IsProductDataValid()
        {
         
            if (Page.IsValid == false)
            {
                return false;
            }
            hidLastTab.Value = "0";
            string warningMessage = string.Empty;
            string udtError = string.Empty;
            if (TypeUdtList.Count > 0)
            {
                foreach (EditControl item in ListEditControls.Values)
                {
                    if (!item.IsValid())
                    {
                        udtError = item.ValidationMessage;
                        if (udtError.EndsWith(".ErrorMessage"))
                        {
                            udtError = Localization.GetString(udtError, Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Udt);
                        }
                        warningMessage += String.Format("<li><b>{0}</b><br />{1}</li>", item.FieldTitle, udtError);
                    }
                }
                if (warningMessage != string.Empty)
                {
                    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, warningMessage, DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.RedError);
                    return false;
                }
            }
            string category = RecursiveHelper.GetAspNetTreeCheckList(tvCategory);

            if (category == "" || category == null || category.Split(',').Length > Settings_Portal.General.CategorySelectCount)
            {
                hidLastTab.Value =  "1";
              
                warningMessage = string.Format(Localization.GetString("ErrorMessage_Category", LocalResourceFile), Settings_Portal.General.CategorySelectCount.ToString());
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, warningMessage, DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                return false;
            }
            //检查second item 的stock quantity ,对于新增加的second item auction, 不允许stock quantity < 2
            if (CurrentType.AuctionType == Convert.ToInt32(CP_Auction.Business.AuctionType.Second_item) 
                && Convert.ToInt32(txtStockQuantity.Text)<2
                && ProductId ==-1)
            {
                warningMessage = Localization.GetString("ErrorMessage_Stock", LocalResourceFile);
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, warningMessage, DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                return false;
            }
            //检查start price, 不允许 < 0
            if (Convert.ToDecimal(txtStartPrice.Text) <= 0)
            {
                warningMessage = Localization.GetString("ErrorMessage_StartPrice", LocalResourceFile);
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, warningMessage, DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);

                return false;
            }
            //检查Minimum Bidding Increment, 不允许 < 0
            if (CurrentType.AuctionType == Convert.ToInt32(CP_Auction.Business.AuctionType.English)
                && Convert.ToDecimal(txtBidIncrement.Text) <= 0)
            {
                warningMessage = Localization.GetString("ErrorMessage_BidIncrement", LocalResourceFile);
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, warningMessage, DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                return false;
            }
            //buy now price 不应该大于start price
            if (CurrentType.AuctionType != Convert.ToInt32(CP_Auction.Business.AuctionType.Second_item)
                && ( Convert.ToDecimal(txtBuyNowPrice.Text) > 0 && Convert.ToDecimal(txtBuyNowPrice.Text) < Convert.ToDecimal(txtStartPrice.Text))
                )
            {
                warningMessage = Localization.GetString("ErrorMessage_BuyNowPrice", LocalResourceFile);
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, warningMessage, DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                return false;
            }
            //we need to make sure start date/time is valid
            if (startDatePicker.SelectedDate != null)
            {
                try
                {
                    string s = startDatePicker.SelectedDate.Value.ToString();
                }
                catch (Exception exc)
                {
                    warningMessage = Localization.GetString("ErrorMessage_WrongDateFormat_Start", LocalResourceFile);
                    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, warningMessage, DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                    return false;
                }
            }
            //we need to make sure end date/time is valid
            if (endDatePicker.SelectedDate != null)
            {
                try
                {
                    string s = endDatePicker.SelectedDate.Value.ToString();
                }
                catch (Exception exc)
                {
                    warningMessage = Localization.GetString("ErrorMessage_WrongDateFormat_End", LocalResourceFile);
                    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, warningMessage, DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                    return false;
                }
            }
           
           
         
           //check if start/date time and end datetime is valid
            if (startDatePicker.SelectedDate!=null 
                &&endDatePicker.SelectedDate!=null)
            {
                if (endDatePicker.SelectedDate.Value < startDatePicker.SelectedDate.Value)
                {
                    warningMessage = Localization.GetString("ErrorMessage_EndDateLower", LocalResourceFile);
                    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, warningMessage, DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                    return false;
                }
                TimeSpan ts = endDatePicker.SelectedDate.Value - startDatePicker.SelectedDate.Value;
                if (ts.Days>CurrentType.MaxAuctionDays)
                {
                     warningMessage = string.Format(Localization.GetString("ErrorMessage_DateDifferThan", LocalResourceFile),CurrentType.MaxAuctionDays.ToString());
                    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, warningMessage, DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                    return false;
                }
            }
            //check if auction days is valid
            if ( endDatePicker.SelectedDate==null 
                && int.Parse(txtAuctionDays.Text) > CurrentType.MaxAuctionDays)
            {
                warningMessage = string.Format(Localization.GetString("ErrorMessage_AuctionDays", LocalResourceFile), CurrentType.MaxAuctionDays.ToString());
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, warningMessage, DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                return false;
            }
            return true;
        }

        private Boolean IsVideoDataValid()
        {
            if (Page.IsValid == false)
            {
                return false;
            }
            if (ctlVideoFile.Url.Trim() == "")
            {
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Error_SpecifyVideo", LocalResourceFile), DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                return false;
            }
            return true;
        }
        private Boolean IsAudioDataValid()
        {
            if (Page.IsValid == false)
            {
                return false;
            }
            if (ctlAudioFile.Url.Trim() == "")
            {
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Error_SpecifyAudio", LocalResourceFile), DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                return false;
            }
            return true;
        }
        private Boolean IsImageDataValid()
        {
            if (Page.IsValid == false)
            {
                return false;
            }
            if (ctlImageFile.Url.Trim() == "")
            {
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Error_SpecifyImage", LocalResourceFile), DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                return false;
            }
            return true;
        }



        private void SetLayout(string command)
        {

            tblButton.Visible = true;
            btnChooseDownloadFromFile.Visible = false;


            btnBackToList.Visible = false;
            btnDeleteSelected.Visible = false;
            btnRepublishSelected.Visible = false;

            tblProductList.Visible = false;
            divProductDetail.Visible = false;

            tblBiddingList.Visible = false;
        
            tblDownloadList.Visible = false;
            tblDownloadDetail.Visible = false;
            tblAddFromFile.Visible = false;

            tblVideoList.Visible = false;
            tblVideoDetail.Visible = false;

            tblAudioList.Visible = false;
            tblAudioDetail.Visible = false;

            tblImageList.Visible = false;
            tblImageDetail.Visible = false;

            tblAttachment.Visible = false;


            ProductInfo objProduct = new ProductInfo();
            if (ProductId != -1)
            {
                objProduct = ProductController.Get(ProductId);
            }
            switch (command)
            {
                case "ViewProductList":
                    lblProductQuota.Visible = true;
                    lblType.Visible = true;

                    ddlType.Visible = true;
                    btnAdd.Visible = true;
                    btnAdd.Text = Localization.GetString("btnAddProduct", LocalResourceFile);

                    btnDeleteSelected.Visible = true;
                    btnRepublishSelected.Visible = true;
                    btnDelete.Visible = false;
                    btnDelete1.Visible = false;

                    btnUpdate.Visible = false;
                    btnUpdate1.Visible = false;

                    btnCancel.Visible = false;
                    btnCancel1.Visible = false;

                    tblProductList.Visible = true;
                    CurrentTarget = "Product";
                    break;

                case "AddProduct":
                    lblProductQuota.Visible = false;
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;
                    txtName.Text = "";
                    btnDelete.Visible = false;
                    btnDelete1.Visible = false;

                    btnUpdate.Visible = true;
                    btnUpdate1.Visible = true;
                    btnCancel.Visible = true;
                    btnCancel1.Visible = true;

                    divProductDetail.Visible = true;
                    txtAuctionDays.Enabled = true;
                    CurrentTarget = "Product";
                    break;
                case "SelectProduct":
                    lblProductQuota.Visible = false;
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;

                    btnDelete.Visible = true;
                    btnDelete1.Visible = true;

                    btnUpdate.Visible = true;
                    btnUpdate1.Visible = true;
                    btnCancel.Visible = true;
                    btnCancel1.Visible = true;

                    divProductDetail.Visible = true;
                    //we don't allow to change below values after add
                    txtAuctionDays.Enabled = false;
                    startDatePicker.Enabled = false;
                    endDatePicker.Enabled = false;
                    CurrentTarget = "Product";
                    break;

                case "ViewAttachmentList":
                    lblProductQuota.Visible = false;
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;

                    btnDelete.Visible = false;
                    btnDeleteSelected.Visible = true;

                    btnUpdate.Visible = false;

                    btnCancel.Visible = false;


                    tblAttachment.Visible = true;
                    lblAttachmentList.Text = string.Format(Localization.GetString("lblAttachmentList", LocalResourceFile), objProduct.Name);
                    CurrentTarget = "Attachment";
                    break;

                case "ViewBiddingList":
                    lblProductQuota.Visible = false;
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;
                   
                    btnDelete.Visible = false;
                    btnDeleteSelected.Visible = false;

                    btnUpdate.Visible = false;

                    btnCancel.Visible = false;


                    tblBiddingList.Visible = true;
                    lblBiddingList.Text = string.Format(Localization.GetString("lblBiddingList", LocalResourceFile), objProduct.Name);
                    CurrentTarget = "Bidding";
                    break;

                case "ViewDownloadList":
                    lblProductQuota.Visible = false;
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = true;
                    btnAdd.Text = Localization.GetString("btnAddDownload", LocalResourceFile);

                    //仅允许Site administrator 选择已有文件作为download item.
                    btnChooseDownloadFromFile.Visible = UserInfo.IsInRole(PortalSettings.AdministratorRoleName);
                    btnDelete.Visible = false;
                    btnDeleteSelected.Visible = true;

                    btnUpdate.Visible = false;

                    btnCancel.Visible = false;


                    tblDownloadList.Visible = true;
                    lblDownloadList.Text = string.Format(Localization.GetString("lblDownloadList", LocalResourceFile), objProduct.Name);
                    CurrentTarget = "Download";
                    break;

                case "AddDownload":
                    lblProductQuota.Visible = false;
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;

                    btnDelete.Visible = false;


                    //  btnUpdate.Visible = true;

                    btnCancel.Visible = true;


                    tblDownloadDetail.Visible = true;
                    //upload from ftp only visible for site administrators
                    lblUploadNewFile.Visible = UserInfo.IsInRole(PortalSettings.AdministratorRoleName);


                    CurrentTarget = "Download";
                    break;

                case "AddDownloadFromFile":
                    lblProductQuota.Visible = false;
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;

                    btnDelete.Visible = false;

                    btnCancel.Visible = true;


                    tblAddFromFile.Visible = true;
                    CurrentTarget = "Download";
                    break;

                case "ViewVideoList":
                    lblProductQuota.Visible = false;
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = true;
                    btnAdd.Text = Localization.GetString("btnAddVideo", LocalResourceFile);
                    btnDelete.Visible = false;
                    btnDeleteSelected.Visible = true;

                    btnUpdate.Visible = false;

                    btnCancel.Visible = false;


                    tblVideoList.Visible = true;
                    lblVideoList.Text = string.Format(Localization.GetString("lblVideoList", LocalResourceFile), objProduct.Name);
                    CurrentTarget = "Video";
                    break;

                case "AddVideo":
                    lblProductQuota.Visible = false;
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;
                    txtVideoTitle.Text = "";
                    btnDelete.Visible = false;


                    btnUpdate.Visible = true;

                    btnCancel.Visible = true;


                    tblVideoDetail.Visible = true;
                    CurrentTarget = "Video";
                    break;
                case "SelectVideo":
                    lblProductQuota.Visible = false;
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;

                    btnDelete.Visible = true;


                    btnUpdate.Visible = true;

                    btnCancel.Visible = true;


                    tblVideoDetail.Visible = true;
                    CurrentTarget = "Video";
                    break;
                case "ViewAudioList":
                    lblProductQuota.Visible = false;
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = true;
                    btnAdd.Text = Localization.GetString("btnAddAudio", LocalResourceFile);
                    btnDelete.Visible = false;

                    btnDeleteSelected.Visible = true;
                    btnUpdate.Visible = false;

                    btnCancel.Visible = false;


                    tblAudioList.Visible = true;
                    lblAudioList.Text = string.Format(Localization.GetString("lblAudioList", LocalResourceFile), objProduct.Name);
                    CurrentTarget = "Audio";
                    break;

                case "AddAudio":
                    lblProductQuota.Visible = false;
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;
                    txtAudioTitle.Text = "";
                    btnDelete.Visible = false;


                    btnUpdate.Visible = true;

                    btnCancel.Visible = true;


                    tblAudioDetail.Visible = true;
                    CurrentTarget = "Audio";
                    break;
                case "SelectAudio":
                    lblProductQuota.Visible = false;
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;

                    btnDelete.Visible = true;


                    btnUpdate.Visible = true;

                    btnCancel.Visible = true;


                    tblAudioDetail.Visible = true;
                    CurrentTarget = "Audio";
                    break;
                case "ViewImageList":
                    lblProductQuota.Visible = false;
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = true;
                    btnAdd.Text = Localization.GetString("btnAddImage", LocalResourceFile);
                    btnDelete.Visible = false;
                    btnDeleteSelected.Visible = true;

                    btnUpdate.Visible = false;

                    btnCancel.Visible = false;


                    tblImageList.Visible = true;
                    lblImageList.Text = string.Format(Localization.GetString("lblImageList", LocalResourceFile), objProduct.Name);
                    CurrentTarget = "Image";
                    break;

                case "AddImage":
                    lblProductQuota.Visible = false;
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;
                    txtImageTitle.Text = "";
                    btnDelete.Visible = false;


                    btnUpdate.Visible = true;

                    btnCancel.Visible = true;


                    tblImageDetail.Visible = true;
                    CurrentTarget = "Image";
                    break;
                case "SelectImage":
                    lblProductQuota.Visible = false;
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;

                    btnDelete.Visible = true;


                    btnUpdate.Visible = true;

                    btnCancel.Visible = true;


                    tblImageDetail.Visible = true;
                    CurrentTarget = "Image";
                    break;
            }
            if (CurrentTarget != "Product")
            {
                btnBackToList.Visible = true;
            }
        }


        private void DeleteDownloadFiles_Product(int productId)
        {
            List<DownloadInfo> list = DownloadController.GetByProduct(productId);
            foreach (DownloadInfo download in list)
            {
                //check if file exist
                if (System.IO.File.Exists(DownloadStorageFolder + "\\" + download.ActualName))
                {
                    System.IO.File.Delete(DownloadStorageFolder + "\\" + download.ActualName);
                }
            }
        }

        protected void ctlPagingControl_PageChanged(object sender, EventArgs e)
        {
            CurrentPage = ctlPagingControl.CurrentPage;
            BindProductList();
        }

        #region bind data list
        private void BindProductList()
        {
            int totalRecords = 0;

            int pageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            DotNetNuke.Security.PortalSecurity ps = new DotNetNuke.Security.PortalSecurity();
            string search = ps.InputFilter(txtSearch.Text, DotNetNuke.Security.PortalSecurity.FilterFlag.NoSQL);
            List<ProductInfo> list = ProductController.GetByType(TypeId, Convert.ToInt32(ddlCategory.SelectedValue), UserId,
                ddlProductStatus.SelectedValue == "UnAuthed", ddlProductStatus.SelectedValue == "Featured",
                ddlProductStatus.SelectedValue == "UnActive", ddlProductStatus.SelectedValue == "Expired",
                false, Convert.ToInt32(ddlAuctionResult.SelectedValue), search, pageSize, CurrentPage, ref totalRecords);


            gvList.DataSource = list;
            gvList.DataBind();

            ctlPagingControl.RecordCount = totalRecords;
            ctlPagingControl.PageSize = pageSize;
            ctlPagingControl.CurrentPage = CurrentPage;
            ctlPagingControl.Span = 5;

            divLegend.Visible = list.Count > 0;
        }

        private void BindBiddingList()
        {
            gvBiddingList.DataSource = CP_Auction.Business.BidController.GetByProduct(ProductId);
            gvBiddingList.DataBind();
        }

        private void BindDownloadList()
        {
            gvDownloadList.DataSource = (from p in DownloadController.GetByProduct(ProductId) orderby p.OptionId, p.FileName select p).ToList();
            gvDownloadList.DataBind();
        }
        private void BindVideoList()
        {
            gvVideoList.DataSource = VideoController.GetByProduct(ProductId);
            gvVideoList.DataBind();
        }
        private void BindAudioList()
        {
            gvAudioList.DataSource = AudioController.GetByProduct(ProductId);
            gvAudioList.DataBind();
        }
        private void BindImageList()
        {
            gvImageList.DataSource = ImageController.GetByProduct(ProductId);
            gvImageList.DataBind();
        }

        private void BindAttachmentList()
        {
            gvAttachmentList.DataSource = AttachmentController.GetByProduct(ProductId);
            gvAttachmentList.DataBind();
        }
        #endregion
       

        protected void btnAddAttachment_Click(object sender, EventArgs e)
        {
            string url = ctlAttachment.Url;

            if (string.IsNullOrEmpty(url))//当前没有选择有效文件，直接返回
            {
                return;
            }
            AttachmentInfo objAttachment = new AttachmentInfo();

            objAttachment.FilePath = ctlAttachment.FullUrl;
            objAttachment.ProductId = ProductId;
            AttachmentController.Add(objAttachment);
            BindAttachmentList();

        }

        #region bind item
      
        private void BindManufacturers()
        {
            if (HasManufacturer == false)
            {
                return;
            }
            ddlManufacturer.Items.Clear();
            ddlManufacturer.Items.Add(new ListItem("<" + Localization.GetString("None_Specified") + ">", "-1"));

            int totalRecords = 0;
            foreach (ManufacturerInfo item in ManufacturerController.GetByType(TypeId, 500, 0, ref totalRecords))
            {
                ddlManufacturer.Items.Add(new ListItem(item.Name, item.Id.ToString()));
            }
        }

        private void BindProduct(int productId)
        {
            ProductInfo objProduct = new ProductInfo();

            objProduct = ProductController.Get(productId);

            if (objProduct == null)
            {
                return;
            }
            txtName.Text = objProduct.Name;
            if (CurrentType.FieldEnable_PreviousVersion)
            {
                BindPreviousVersion(productId);
                if (ddlPreviousVersion.Items.FindByValue(objProduct.PreviousVersion.ToString()) != null)
                {
                    ddlPreviousVersion.SelectedIndex = -1;
                    ddlPreviousVersion.Items.FindByValue(objProduct.PreviousVersion.ToString()).Selected = true;
                }
            }

            if (ddlManufacturer.Items.FindByValue(objProduct.ManufacturerId.ToString()) != null)
            {
                ddlManufacturer.SelectedIndex = -1;
                ddlManufacturer.Items.FindByValue(objProduct.ManufacturerId.ToString()).Selected = true;
            }

            txtStartPrice.Text = objProduct.StartPrice.ToString();
            txtBidIncrement.Text = objProduct.BidIncrement.ToString();
            txtReservePrice.Text = objProduct.ReservePrice.ToString();
            txtBuyNowPrice.Text = objProduct.BuyNowPrice.ToString();

            if (!DotNetNuke.Common.Utilities.Null.IsNull(objProduct.PublishDate))
            {
                startDatePicker.SelectedDate = objProduct.PublishDate;
            }
            if (!DotNetNuke.Common.Utilities.Null.IsNull(objProduct.ExpireDate))
            {
                endDatePicker.SelectedDate = objProduct.ExpireDate;
            }

            txtAuctionDays.Text = objProduct.AuctionDays.ToString();


            txtStockQuantity.Text = objProduct.StockQuantity.ToString();

            txtSku.Text = objProduct.Sku;
            txtShippingProperty.Text = objProduct.ShippingProperty;

            //weight and shipping fee
            txtWeight.Text = objProduct.Weight.ToString();
            if (rblShippingFeeType.Items.FindByValue(objProduct.ShippingFeeType.ToString()) != null)
            {
                rblShippingFeeType.SelectedIndex = -1;
                rblShippingFeeType.Items.FindByValue(objProduct.ShippingFeeType.ToString()).Selected = true;
            }
            txtFixedShippingFee.Text = objProduct.FixedShippingFee.ToString();
            OnShippingFeeType_SelectedIndexChanged(rblShippingFeeType.SelectedValue);

            txtPackageFee.Text = objProduct.PackageFee.ToString();

            //tax rate
            if (rblTaxRateType.Items.FindByValue(objProduct.TaxRateType.ToString()) != null)
            {
                rblTaxRateType.SelectedIndex = -1;
                rblTaxRateType.Items.FindByValue(objProduct.TaxRateType.ToString()).Selected = true;
            }
            txtFixedTaxRate.Text = objProduct.FixedTaxRate.ToString();
            OnTaxRateType_SelectedIndexChanged(rblTaxRateType.SelectedValue);

            //recursive billing
            if (Sellable && CurrentType.AllowRecursiveBill)
            {
                if (ddlBillFrequency.Items.FindByValue(objProduct.BillFrequency.ToString()) != null)
                {
                    ddlBillFrequency.SelectedIndex = -1;
                    ddlBillFrequency.Items.FindByValue(objProduct.BillFrequency.ToString()).Selected = true;
                }
                chkRecursiveBill.Checked = objProduct.RecursiveBill;
                txtBillPeriod.Text = objProduct.BillPeriod.ToString();
            }

            txtOrder.Text = Convert.ToString(objProduct.Order);



            RecursiveHelper.FillAspNetTreeCheckBox(ref tvCategory, objProduct.Categories, true);


            ctlImage.Url = objProduct.Image;

            List<ProductToTagInfo> tags = (from t in ProductToTagController.GetByProduct(productId) select t).ToList();

            txtTag1.Text = tags.Count > 0 ? tags[0].Tag : "";
            txtTag2.Text = tags.Count > 1 ? tags[1].Tag : "";
            txtTag3.Text = tags.Count > 2 ? tags[2].Tag : "";
            txtTag4.Text = tags.Count > 3 ? tags[3].Tag : "";
            txtTag5.Text = tags.Count > 4 ? tags[4].Tag : "";
            txtTag6.Text = tags.Count > 5 ? tags[5].Tag : "";
            txtTag7.Text = tags.Count > 6 ? tags[6].Tag : "";
            txtTag8.Text = tags.Count > 7 ? tags[7].Tag : "";
            txtTag9.Text = tags.Count > 8 ? tags[8].Tag : "";
            txtTag10.Text = tags.Count > 9 ? tags[9].Tag : "";

            //Other

            chkFeatured.Checked = objProduct.Featured;
            chkAuthed.Checked = objProduct.Authed;
            chkActive.Checked = objProduct.Active;


            cblViewRoles = Utils.FillRolesCheckBox(cblViewRoles, objProduct.ViewRoles, PortalSettings.AdministratorRoleId, PortalId);

            //rating 
            chkAllowRating.Checked = objProduct.AllowRating;
            cblRatingRoles = Utils.FillRolesCheckBox(cblRatingRoles, objProduct.RatingRoles, PortalSettings.AdministratorRoleId, PortalId);

            //Comment value
            chkAllowComment.Checked = objProduct.AllowComment;
            chkAutoAuthComment.Checked = objProduct.AutoAuthComment;
            cblCommentRoles = Utils.FillRolesCheckBox(cblCommentRoles, objProduct.CommentRoles, PortalSettings.AdministratorRoleId, PortalId);


            //download
            cblDownloadRoles = Utils.FillRolesCheckBox(cblDownloadRoles, objProduct.DownloadRoles, PortalSettings.AdministratorRoleId, PortalId);


            ctlLinkUrl.Url = objProduct.LinkUrl;

            BindProductLocation(objProduct);
            //Google map
            txtLongitude.Text = objProduct.Longitude;
            txtLatitude.Text = objProduct.Latitude;
            txtMapTitle.Text = objProduct.MapTitle;


            txtSummary.Text = objProduct.Summary;
            txtDescription.Text = Server.HtmlDecode(objProduct.Description);
            txtSpecialOffer.Text = Server.HtmlDecode(objProduct.SpecialOffer);
            if (IsGoods)
            {
                txtDelivery.Text = Server.HtmlDecode(objProduct.Delivery);
            }
            if (IsSoftware)
            {
                txtLicense.Text = Server.HtmlDecode(objProduct.License);
            }
            if (CurrentType.EnableField1)
            {
                txtField1.Text = Server.HtmlDecode(objProduct.Field1);
            }
            if (CurrentType.EnableField2)
            {
                txtField2.Text = Server.HtmlDecode(objProduct.Field2);
            }
            if (CurrentType.EnableField3)
            {
                txtField3.Text = Server.HtmlDecode(objProduct.Field3);
            }
            if (CurrentType.EnableField4)
            {
                txtField4.Text = Server.HtmlDecode(objProduct.Field4);
            }
            if (CurrentType.EnableField5)
            {
                txtField5.Text = Server.HtmlDecode(objProduct.Field5);
            }
            txtSupport.Text = Server.HtmlDecode(objProduct.Support);

            BindUserDefinedData(productId);
        }
    
        private void BindVideo()
        {
            VideoInfo objItem = VideoController.Get(VideoId);
            if (objItem == null)
            {
                return;
            }
            txtVideoTitle.Text = objItem.Title;
            txtVideoDescription.Text = objItem.Description;
            txtVideoThumbnail.Text = objItem.Thumbnail;
            ctlVideoFile.Url = objItem.VideoFile;
            txtVideoDuration.Text = objItem.Duration;
        }
        private void BindAudio()
        {
            AudioInfo objItem = AudioController.Get(AudioId);
            if (objItem == null)
            {
                return;
            }
            txtAudioTitle.Text = objItem.Title;
            txtAudioDescription.Text = objItem.Description;
            ctlAudioFile.Url = objItem.AudioFile;

        }
        private void BindImage()
        {
            ImageInfo objItem = ImageController.Get(ImageId);
            if (objItem == null)
            {
                return;
            }
            txtImageTitle.Text = objItem.Title;
            txtImageDescription.Text = objItem.Description;
            ctlImageFile.Url = objItem.ImageFile;
        }
  
        #endregion
        #region gridview row command events
        protected void gvList_DataBinding(object sender, EventArgs e)
        {
            if (gvList.Columns[1] != null)//image
            {
                gvList.Columns[1].Visible = CurrentType.FieldEnable_Image;
            }
        }
        protected void gvList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ProductId = Convert.ToInt32(e.CommandArgument);
            ProductInfo objProduct = ProductController.Get(ProductId);
            switch (e.CommandName)
            {
                case "Select":
                    BindProduct(ProductId);
                    SetLayout("SelectProduct");
                    break;
                case "Copy":
                    ProductInfo objNewProduct = objProduct;
                    objNewProduct.UserId = UserId;
                    objNewProduct.Name += " (New)";
                    objNewProduct.Views = 0;

                    //reset bid information
                   
                    objNewProduct.PublishDate = DateTime.Now;
                    objNewProduct.ExpireDate = objNewProduct.PublishDate.AddDays(objNewProduct.AuctionDays);
                    objNewProduct.IsAuction = true;
                    objNewProduct.AuctionCheck = false;
                    objNewProduct.AuctionCheckResult = Convert.ToInt32(CP_Auction.Business.AuctionResult.InBidding);

                    int originalProductId = ProductId;
                    ProductId = ProductController.Add(objNewProduct);
                    //复制自定义数据
                    CopyUserDefinedData(originalProductId, ProductId);
                    BindProductList();
                    BindProduct(ProductId);
                    SetLayout("SelectProduct");
                    break;
                case "Del":
                    DeleteDownloadFiles_Product(ProductId);
                    ProductController.Delete(ProductId);
                    ProductId = -1;
                    BindProductList();
                    break;

                case "Auth":
                    objProduct.Authed = !objProduct.Authed;
                    ProductController.Update(objProduct, false);
                    BindProductList();
                    break;
                case "Active":
                    objProduct.Active = !objProduct.Active;
                    ProductController.Update(objProduct, false);
                    BindProductList();
                    break;
                case "Featured":
                    objProduct.Featured = !objProduct.Featured;
                    ProductController.Update(objProduct, false);
                    break;

                case "BiddingHistory":
                    BindBiddingList();
                    SetLayout("ViewBiddingList");
                    break;

                //重新发布aution product
                case "Republish":
                    ProductController.RepublishAuctionItem(objProduct);
                    BindProductList();
                 

                    break;

                case "Download":
                    BindDownloadList();
                    SetLayout("ViewDownloadList");
                    break;
                case "Video":
                    BindVideoList();
                    SetLayout("ViewVideoList");
                    break;
                case "Audio":
                    BindAudioList();
                    SetLayout("ViewAudioList");
                    break;
                case "Image":
                    BindImageList();
                    SetLayout("ViewImageList");
                    break;
                case "Attachment":
                    BindAttachmentList();
                    SetLayout("ViewAttachmentList");
                    break;

                default:
                    break;
            }
        }
        protected void gvDownloadList_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int downloadId = Convert.ToInt32(e.CommandArgument);
            DownloadInfo objItem = DownloadController.Get(downloadId);
            switch (e.CommandName)
            {
                case "Del":
                    if (System.IO.File.Exists(DownloadStorageFolder + "\\" + objItem.ActualName))
                    {
                        System.IO.File.Delete(DownloadStorageFolder + "\\" + objItem.ActualName);
                    }
                    DownloadController.Delete(downloadId);
                    BindDownloadList();
                    break;
                default:
                    break;
            }
        }

     
        protected void gvVideoList_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            VideoId = Convert.ToInt32(e.CommandArgument);
            switch (e.CommandName)
            {
                case "Select":
                    BindVideo();
                    SetLayout("SelectVideo");
                    break;
                case "Del":
                    VideoController.Delete(VideoId);
                    BindVideoList();
                    VideoId = -1;
                    break;
                default:
                    break;
            }
        }
        protected void gvAudioList_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            AudioId = Convert.ToInt32(e.CommandArgument);
            switch (e.CommandName)
            {
                case "Select":
                    BindAudio();
                    SetLayout("SelectAudio");
                    break;
                case "Del":
                    AudioController.Delete(AudioId);
                    BindAudioList();
                    AudioId = -1;
                    break;
                default:
                    break;
            }
        }
        protected void gvImageList_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            ImageId = Convert.ToInt32(e.CommandArgument);
            switch (e.CommandName)
            {
                case "Select":
                    BindImage();
                    SetLayout("SelectImage");
                    break;
                case "Del":
                    ImageController.Delete(ImageId);
                    BindImageList();
                    ImageId = -1;
                    break;
                default:
                    break;
            }
        }
        protected void gvAttachmentList_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            switch (e.CommandName)
            {
                case "Del":
                    AttachmentController.Delete(id);
                    BindAttachmentList();
                    break;
                default:
                    break;
            }
        }

        #endregion

        protected void btnBackToList_Click(object sender, EventArgs e)
        {
            VideoId = -1;
            AudioId = -1;
            ImageId = -1;
            SetLayout("ViewProductList");
        }
        #region dropdown list box command events
        private void BindProductLocation(ProductInfo objProduct)
        {
            if (ddlLocationCountry.Items.FindByValue(objProduct.CountryId.ToString()) != null)
            {
                ddlLocationCountry.SelectedIndex = -1;
                ddlLocationCountry.Items.FindByValue(objProduct.CountryId.ToString()).Selected = true;
            }
            //连环触发country/state/city/town 绑定
            OnLocationCountry_SelectedIndexChanged();
        }
        private void BindLocationCountry()
        {
            ddlLocationCountry.DataSource = CountryController.GetByPortals(PortalId);
            ddlLocationCountry.DataBind();
        }
        protected void ddlLocationCountry_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            OnLocationCountry_SelectedIndexChanged();
        }
        private void OnLocationCountry_SelectedIndexChanged()
        {

            ddlLocationState.Items.Clear();
            bool hasValue = false;
            foreach (var item in StateController.GetByCountry(Convert.ToInt32(ddlLocationCountry.SelectedValue)))
            {
                ddlLocationState.Items.Add(new ListItem(item.Name, item.Id.ToString()));
                hasValue = true;
            }
            if (!hasValue)
            {
                ddlLocationState.Items.Add(new ListItem("< " + DotNetNuke.Services.Localization.Localization.GetString("None_Specified") + " >", "-1"));
            }
            ddlLocationState.DataBind();

            if (ProductId != -1)
            {
                ProductInfo objProduct = ProductController.Get(ProductId);
                if (ddlLocationState.Items.FindByValue(objProduct.StateId.ToString()) != null)
                {
                    ddlLocationState.SelectedIndex = -1;
                    ddlLocationState.Items.FindByValue(objProduct.StateId.ToString()).Selected = true;
                }
            }
            OnLocationState_SelectedIndexChanged();
        }

        protected void ddlLocationState_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            OnLocationState_SelectedIndexChanged();
        }
        private void OnLocationState_SelectedIndexChanged()
        {
            ddlLocationCity.Items.Clear();
            bool hasValue = false;
            foreach (var item in CityController.GetByState(Convert.ToInt32(ddlLocationState.SelectedValue)))
            {
                ddlLocationCity.Items.Add(new ListItem(item.Name, item.Id.ToString()));
                hasValue = true;
            }
            if (!hasValue)
            {
                ddlLocationCity.Items.Add(new ListItem("< " + DotNetNuke.Services.Localization.Localization.GetString("None_Specified") + " >", "-1"));
            }
            ddlLocationCity.DataBind();
            if (ProductId != -1)
            {
                ProductInfo objProduct = ProductController.Get(ProductId);
                if (ddlLocationCity.Items.FindByValue(objProduct.CityId.ToString()) != null)
                {
                    ddlLocationCity.SelectedIndex = -1;
                    ddlLocationCity.Items.FindByValue(objProduct.CityId.ToString()).Selected = true;
                }
            }
            OnLocationCity_SelectedIndexChanged();
        }

        protected void ddlLocationCity_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            OnLocationCity_SelectedIndexChanged();
        }

        private void OnLocationCity_SelectedIndexChanged()
        {

            ddlLocationTown.Items.Clear();
            bool hasValue = false;
            foreach (var item in TownController.GetByCity(Convert.ToInt32(ddlLocationCity.SelectedValue)))
            {
                ddlLocationTown.Items.Add(new ListItem(item.Name, item.Id.ToString()));
                hasValue = true;
            }
            if (!hasValue)
            {
                ddlLocationTown.Items.Add(new ListItem("< " + DotNetNuke.Services.Localization.Localization.GetString("None_Specified") + " >", "-1"));
            }
            ddlLocationTown.DataBind();
            if (ProductId != -1)
            {
                ProductInfo objProduct = ProductController.Get(ProductId);
                if (ddlLocationTown.Items.FindByValue(objProduct.TownId.ToString()) != null)
                {
                    ddlLocationTown.SelectedIndex = -1;
                    ddlLocationTown.Items.FindByValue(objProduct.TownId.ToString()).Selected = true;
                }
            }
        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            TypeId = Convert.ToInt32(ddlType.SelectedValue);
            BuildUDFieldForm();
            ProductId = -1;

            CurrentPage = 0;
            BindControl();
            LoadCategories();
            BindManufacturers();
            BindTag();
            BindProductList();
            SetLayout("ViewProductList");
            CurrentTarget = "Product";
            DataBind();
        }
        protected void rblShippingFeeType_SelectedIndexChanged(object sender, EventArgs e)
        {
            OnShippingFeeType_SelectedIndexChanged(rblShippingFeeType.SelectedValue);
        }
        private void OnShippingFeeType_SelectedIndexChanged(string type)
        {
            tr_FixedShippingFee.Visible = (type == "1" );
        }
        protected void rblTaxRateType_SelectedIndexChanged(object sender, EventArgs e)
        {
            OnTaxRateType_SelectedIndexChanged(rblTaxRateType.SelectedValue);
        }
        private void OnTaxRateType_SelectedIndexChanged(string type)
        {
            tr_FixedTaxRate.Visible = (type == "1");
        }
        protected bool IsAuctionExpired(string productId)
        {
            ProductInfo objProduct= ProductController.Get(Convert.ToInt32(productId));
            return objProduct.Expired && objProduct.StockQuantity > 0;
        }

     
        #endregion
    }
}



