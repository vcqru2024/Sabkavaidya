//2009/07/22 基于dnn framework 的urlcontrol修改，用于显示特定用户的所属文件夹和文件
//2010/7/15  重新编写以同时适应local storage and amason a3
//2010/11/5 用filesystemutils类来创建根目录和用户目录的，这样可以同时设置文件夹的读写权限
//2018/7/2 upgrade to compatible with dnn 9.2
using Cross.DNN.Common.A3;
using DotNetNuke.Services.FileSystem;
using DotNetNuke.Services.Localization;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI.WebControls;
namespace Cross.Modules.CP_Product.View
{
    public partial class UserFileSelect : DotNetNuke.Framework.UserControlBase
    {
        #region "Private Members"
        private string _localResourceFile = "";
        #endregion

        #region "Public Members"
        public string FileFilter
        {
            get
            {
                if (ViewState["FileFilter"] != null)
                {
                    return Convert.ToString(ViewState["FileFilter"]);
                }
                else
                {
                    return "";
                }
            }
            set
            {
                ViewState["FileFilter"] = value;
            }
        }
        public bool ShowControlBar
        {
            get
            {
                if (ViewState["ShowControlBar"] != null)
                {
                    return Convert.ToBoolean(ViewState["ShowControlBar"]);
                }
                else
                {
                    return false;
                }
            }
            set
            {
                ViewState["ShowControlBar"] = value;
            }
        }
        public bool ShowFolderListOnly
        {
            get
            {
                if (ViewState["ShowFolderListOnly"] != null)
                {
                    return Convert.ToBoolean(ViewState["ShowFolderListOnly"]);
                }
                else
                {
                    return false;
                }
            }
            set
            {
                ViewState["ShowFolderListOnly"] = value;
            }
        }
        public List<DotNetNuke.Common.FileItem> FileListInCurrentFolder
        {
            get
            {
                if (!ShowFolderListOnly)
                {
                    return new List<DotNetNuke.Common.FileItem>();
                }

                System.Collections.Generic.List<DotNetNuke.Common.FileItem> list = new System.Collections.Generic.List<DotNetNuke.Common.FileItem>();
                if (StorageMode.ToLower() == "local")
                {
                    foreach (DotNetNuke.Common.FileItem item in DotNetNuke.Common.Globals.GetFileList(PortalSettings.PortalId, FileFilter, false, ddlFolderList.SelectedItem.Value, false))
                    {
                        //显示thumbnail 或者 当前并非 thumb_开头
                        if (ShowThumbnailImage || !item.Text.ToLower().StartsWith("thumb_"))
                        {
                            list.Add(item);
                        }
                    }
                }
                if (StorageMode.ToLower() == "a3")
                {
                    list = A3FileController.GetByFolderAsArrayList(Convert.ToInt32(ddlFolderList.SelectedValue), FileFilter, false, ShowThumbnailImage);
                }
                return list;
            }
        }
        public bool ShowThumbnailImage
        {
            get
            {
                if (ViewState["ShowThumbnailImage"] != null)
                {
                    return Convert.ToBoolean(ViewState["ShowThumbnailImage"]);
                }
                else
                {
                    return true;
                }
            }
            set
            {
                ViewState["ShowThumbnailImage"] = value;
            }
        }
        public bool ShowFile
        {
            get
            {
                if (ViewState["ShowFile"] != null)
                {
                    return Convert.ToBoolean(ViewState["ShowFile"]);
                }
                else
                {
                    return false;
                }
            }
            set
            {
                ViewState["ShowFile"] = value;
            }
        }
        public bool ShowUrl
        {
            get
            {
                if (ViewState["ShowUrl"] != null)
                {
                    return Convert.ToBoolean(ViewState["ShowUrl"]);
                }
                else
                {
                    return false;
                }
            }
            set
            {
                ViewState["ShowUrl"] = value;

            }
        }
        public bool ShowEmbed
        {
            get
            {
                if (ViewState["ShowEmbed"] != null)
                {
                    return Convert.ToBoolean(ViewState["ShowEmbed"]);
                }
                else
                {
                    return false;
                }
            }
            set
            {
                ViewState["ShowEmbed"] = value;
            }
        }
        public string UploadUrl
        {
            get
            {
                if (ViewState["UploadUrl"] != null)
                {
                    return Convert.ToString(ViewState["UploadUrl"]);
                }
                else
                {
                    return "";
                }
            }
            set
            {
                ViewState["UploadUrl"] = value;
                hlUpload.NavigateUrl = value;
            }
        }

        public string LocalResourceFile
        {
            get
            {
                return _localResourceFile == "" ? this.TemplateSourceDirectory + "/" + Localization.LocalResourceDirectory + "/UserFileSelect.ascx" : _localResourceFile;

            }
            set
            {
                _localResourceFile = value;
            }
        }
        public int ModuleId
        {
            get
            {
                if (ViewState["ModuleId"] != null)
                {
                    return Convert.ToInt32(ViewState["ModuleId"]);
                }
                else
                {
                    if (Request.QueryString["mid"] != null)
                    {
                        return Convert.ToInt32(Request.QueryString["mid"]);
                    }
                }
                return -2;
            }
            set
            {
                ViewState["ModuleId"] = value;
            }
        }
        public string Local_FolderRootPrefix
        {
            get
            {
                if (ViewState["Local_FolderRootPrefix"] != null)
                {
                    return Convert.ToString(ViewState["Local_FolderRootPrefix"]);
                }
                else
                {
                    return "";
                }
            }
            set
            {
                ViewState["Local_FolderRootPrefix"] = value;
            }
        }
        private string Local_UserFolderPath
        {
            get
            {
                return Local_FolderRootPrefix + "\\" + CurrentUserId.ToString() + "\\";
            }
        }
        private string Local_UserFolderPath_Relative
        {
            get
            {
                return Local_FolderRootPrefix + "/" + CurrentUserId.ToString() + "/";
            }
        }
        private string Local_UserFolderPath_Physical
        {
            get
            {
                return PortalSettings.HomeDirectoryMapPath + Local_UserFolderPath;
            }
        }
        public int CurrentUserId
        {
            get
            {
                if (ViewState["CurrentUserId"] != null)
                {
                    return Convert.ToInt32(ViewState["CurrentUserId"]);
                }
                else
                {
                    return DotNetNuke.Entities.Users.UserController.Instance.GetCurrentUserInfo().UserID;
                }
            }
            set
            {
                ViewState["CurrentUserId"] = value;
            }
        }
        public string StorageMode
        {
            get
            {
                if (ViewState["StorageMode"] != null)
                {
                    return Convert.ToString(ViewState["StorageMode"]);
                }
                else
                {
                    return "local";
                }
            }
            set
            {
                ViewState["StorageMode"] = value.ToLower(); ;
            }
        }
        private string CurrentMode
        {
            get
            {
                if (ViewState["CurrentMode"] != null)
                {
                    return Convert.ToString(ViewState["CurrentMode"]);
                }
                else
                {
                    return "url";
                }
            }
            set
            {
                ViewState["CurrentMode"] = value.ToLower(); ;
            }
        }
        public string Url
        {
            get
            {
                string url = "";
                if (CurrentMode.ToLower() == "url" && txtUrl.Text.Trim() != "")//empty
                {
                    url = txtUrl.Text.Trim();
                    if (!url.ToLower().StartsWith("http"))//没有http or https
                    {
                        url = "http://" + url;
                    }
                }
                if (CurrentMode.ToLower() == "file")
                {
                    if (ddlFile.SelectedItem.Value != "")
                    {
                        url = "FileID=" + ddlFile.SelectedItem.Value;
                    }
                }
                if (CurrentMode.ToLower() == "embed" && txtEmbed.Text.Trim() != "")//embed code
                {
                    url = txtEmbed.Text.Trim();
                }
                return url;
            }
            set
            {
                ViewState["Url"] = value;

                if (value.Trim() == "")//empty value
                {
                    if (CurrentMode.ToLower() == "url" && ShowUrl)//当前显示模式为url
                    {
                        txtUrl.Text = value;
                    }
                    if (CurrentMode.ToLower() == "file" && ShowFile)
                    {
                        if (ddlFile.Items.FindByValue(value) != null)//empty value,so should select none specified
                        {
                            ddlFile.SelectedIndex = -1;
                            ddlFile.Items.FindByValue(value).Selected = true;
                        }
                    }
                    if (CurrentMode.ToLower() == "embed" && ShowEmbed)//当前显示模式为embed code
                    {
                        txtEmbed.Text = value;
                    }
                    return;
                }
                //StartsWith("http:") 这个地方有错，忘记考虑https的情况,这个问题存在其他模块
                if (value.ToLower().StartsWith("http") && ShowUrl)//http value,so we should display url textbox
                {
                    CurrentMode = "url";
                    tblFile.Visible = false;
                    tblEmbed.Visible = false;
                    tblUrl.Visible = true;
                    txtUrl.Text = value;
                    if (ShowControlBar)
                    {
                        rblControlBar.SelectedValue = "url";
                    }
                    return;
                }

                if (value.StartsWith("FileID=") && ShowFile)//File id
                {
                    CurrentMode = "file";
                    tblFile.Visible = true;
                    tblEmbed.Visible = false;
                    tblUrl.Visible = false;
                    if (ShowControlBar)
                    {
                        rblControlBar.SelectedValue = "file";
                    }
                    int fileId = Convert.ToInt32(value.Replace("FileID=", ""));
                    if (StorageMode.ToLower() == "local")
                    {

                        DotNetNuke.Services.FileSystem.IFileInfo fi = DotNetNuke.Services.FileSystem.FileManager.Instance.GetFile(fileId);
                        if (fi == null)
                        {
                            return;
                        }
                        DotNetNuke.Services.FileSystem.FolderController ctlFolder = new FolderController();
                        DotNetNuke.Services.FileSystem.IFolderInfo folder = DotNetNuke.Services.FileSystem.FolderManager.Instance.GetFolder(fi.FolderId);
                        if (ddlFolder.Items.FindByValue(folder.FolderPath) != null)
                        {
                            ddlFolder.SelectedIndex = -1;
                            ddlFolder.Items.FindByValue(folder.FolderPath).Selected = true;
                        }
                        GetFileList(true);
                        if (ddlFile.Items.FindByValue(fileId.ToString()) != null)
                        {
                            ddlFile.SelectedIndex = -1;
                            ddlFile.Items.FindByValue(fileId.ToString()).Selected = true;
                        }
                    }

                    if (StorageMode.ToLower() == "a3")
                    {
                        A3FileInfo fi = A3FileController.Get(fileId);
                        if (fi == null)
                        {
                            return;
                        }
                        A3FolderInfo folder = A3FolderController.Get(fi.FolderId);
                        if (ddlFolder.Items.FindByValue(folder.Id.ToString()) != null)
                        {
                            ddlFolder.SelectedIndex = -1;
                            ddlFolder.Items.FindByValue(folder.Id.ToString()).Selected = true;
                        }
                        GetFileList(true);
                        if (ddlFile.Items.FindByValue(fileId.ToString()) != null)
                        {
                            ddlFile.SelectedIndex = -1;
                            ddlFile.Items.FindByValue(fileId.ToString()).Selected = true;
                        }
                    }
                    return;
                }
                if (ShowEmbed)//not url and file id,them it must be embed code
                {
                    CurrentMode = "embed";
                    tblFile.Visible = false;
                    tblEmbed.Visible = true;
                    tblUrl.Visible = false;
                    txtEmbed.Text = value;
                    if (ShowControlBar)
                    {
                        rblControlBar.SelectedValue = "embed";
                    }
                    return;
                }

            }
        }

        /// <summary>
        /// 完整路径
        /// </summary>
        public string FullUrl
        {
            get
            {
                string url = "";
                if (CurrentMode.ToLower() == "url" && txtUrl.Text.Trim() != "")//empty
                {
                    url = txtUrl.Text.Trim();
                    if (!url.ToLower().StartsWith("http"))//没有http or https
                    {
                        url = "http://" + url;
                    }
                }
                if (CurrentMode.ToLower() == "file" && ddlFile.SelectedItem.Value != "")
                {
                    int fileId = Convert.ToInt32(ddlFile.SelectedValue);
                    if (StorageMode.ToLower() == "local")
                    {

                        DotNetNuke.Services.FileSystem.IFileInfo objFile = new DotNetNuke.Services.FileSystem.FileInfo();
                        DotNetNuke.Entities.Portals.PortalController ctlPortal = new DotNetNuke.Entities.Portals.PortalController();
                        DotNetNuke.Entities.Portals.PortalInfo pi = ctlPortal.GetPortal(PortalSettings.PortalId);
                        objFile = DotNetNuke.Services.FileSystem.FileManager.Instance.GetFile(fileId);
                        url = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + objFile.Folder + objFile.FileName;
                    }
                    if (StorageMode.ToLower() == "a3")
                    {
                        url = A3FileController.Get(fileId).A3Url;
                    }
                }
                if (CurrentMode.ToLower() == "embed" && txtEmbed.Text.Trim() != "")//embed code
                {
                    url = txtEmbed.Text.Trim();
                }
                return url;
            }
        }
        public string Width
        {
            get
            {
                if (ViewState["SkinControlWidth"] != null)
                {
                    return Convert.ToString(ViewState["SkinControlWidth"]);
                }
                else
                {
                    return "300";
                }
            }
            set
            {
                ViewState["SkinControlWidth"] = value;
                ddlFolder.Width = System.Web.UI.WebControls.Unit.Parse(value);
                ddlFile.Width = System.Web.UI.WebControls.Unit.Parse(value);
                txtUrl.Width = System.Web.UI.WebControls.Unit.Parse(value);
                txtEmbed.Width = System.Web.UI.WebControls.Unit.Parse(value);
                ddlFolderList.Width = System.Web.UI.WebControls.Unit.Parse(value);
            }
        }
        #endregion
        #region "Private Methods"
        private void GetFileList(bool noneSpecified)
        {
            ddlFile.Items.Clear();
            if (StorageMode.ToLower() == "local")
            {
                System.Collections.Generic.List<DotNetNuke.Common.FileItem> list = new System.Collections.Generic.List<DotNetNuke.Common.FileItem>();
                foreach (DotNetNuke.Common.FileItem item in DotNetNuke.Common.Globals.GetFileList(PortalSettings.PortalId, FileFilter, noneSpecified, ddlFolder.SelectedItem.Value, false))
                {
                    //显示thumbnail 或者 当前并非 thumb_开头
                    if (ShowThumbnailImage || !item.Text.ToLower().StartsWith("thumb_"))
                    {
                        list.Add(item);
                    }
                }
                ddlFile.DataSource = list;
            }
            if (StorageMode.ToLower() == "a3")
            {
                ddlFile.DataSource = A3FileController.GetByFolderAsArrayList(Convert.ToInt32(ddlFolder.SelectedValue), FileFilter, noneSpecified, ShowThumbnailImage);
            }
            ddlFile.DataBind();
        }
        private void LoadFolders()
        {
            if (!ShowFolderListOnly)
            {
                ddlFolder.Items.Clear();
            }
            else
            {
                ddlFolderList.Items.Clear();
            }

            if (StorageMode.ToLower() == "local")
            {
                IEnumerable<IFolderInfo> folders = DotNetNuke.Services.FileSystem.FolderManager.Instance.GetFolders(PortalSettings.PortalId);
                foreach (DotNetNuke.Services.FileSystem.FolderInfo item in folders)
                {
                    ListItem folderItem = new ListItem();
                    if (item.FolderPath.StartsWith(Local_UserFolderPath_Relative))
                    {
                        if (item.FolderPath == Local_UserFolderPath_Relative)
                        {
                            folderItem.Text = Localization.GetString("UserRootPath", LocalResourceFile);
                        }
                        else
                        {
                            folderItem.Text = item.FolderPath.Replace(Local_UserFolderPath_Relative, "");
                        }
                        folderItem.Value = item.FolderPath;
                        if (!ShowFolderListOnly)
                        {
                            ddlFolder.Items.Add(folderItem);
                        }
                        else
                        {
                            ddlFolderList.Items.Add(folderItem);
                        }

                    }
                }
            }
            if (StorageMode.ToLower() == "a3")
            {
                foreach (A3FolderInfo item in A3FolderController.GetByUser(CurrentUserId))
                {
                    if (!ShowFolderListOnly)
                    {
                        ddlFolder.Items.Add(new ListItem(item.Name, item.Id.ToString()));
                    }
                    else
                    {
                        ddlFolderList.Items.Add(new ListItem(item.Name, item.Id.ToString()));
                    }

                }
            }
            if (!ShowFolderListOnly)
            {
                ddlFolder.DataBind();
            }
            else
            {
                ddlFolderList.DataBind();
            }

        }
        /// <summary>
        /// v8.4 同时提供silverlight upload  和DNN built-in upload control. Silverlight 可以上传文件到desktopmodules 这个目录下，
        /// 而后者只能上传文件到portals /portalid 目录， 因此不管是a3 还是local, 要支持DNN built-in upload control, 都需要创建 这些临时上传的
        /// 用户目录
        /// </summary>
        private void CheckUserTempUploadFolder_ForDNNUpload()
        {

            //Normal 版本的File Upload 临时上传根目录
            if (!System.IO.Directory.Exists(PortalSettings.HomeDirectoryMapPath + Local_FolderRootPrefix + @"\TempUpload\"))
            {
                if (DotNetNuke.Services.FileSystem.FolderManager.Instance.GetFolder(PortalSettings.PortalId, Local_FolderRootPrefix + @"/TempUpload/") == null)
                {
                    DotNetNuke.Services.FileSystem.FolderManager.Instance.AddFolder(PortalSettings.PortalId, Local_FolderRootPrefix + @"/TempUpload/");
                }
                else
                {
                    System.IO.Directory.CreateDirectory(PortalSettings.HomeDirectoryMapPath + Local_FolderRootPrefix + @"\TempUpload\");
                }
            }
            //Normal 版本的File Upload 临时上传用户目录
            if (!System.IO.Directory.Exists(PortalSettings.HomeDirectoryMapPath + Local_FolderRootPrefix + @"\TempUpload\" + CurrentUserId.ToString() + @"\"))
            {
                if (FolderManager.Instance.GetFolder(PortalSettings.PortalId, Local_FolderRootPrefix + @"/TempUpload/" + CurrentUserId.ToString() + "/") == null)
                {
                    FolderManager.Instance.AddFolder(PortalSettings.PortalId, Local_FolderRootPrefix + @"/TempUpload/" + CurrentUserId.ToString() + "/");
                }
                else
                {
                    System.IO.Directory.CreateDirectory(PortalSettings.HomeDirectoryMapPath + Local_FolderRootPrefix + @"\TempUpload\" + CurrentUserId.ToString() + @"\");
                }
            }
        }
        private void CheckUserFolderExist_Local()
        {

            //Create root folder
            if (!Directory.Exists(PortalSettings.HomeDirectoryMapPath + Local_FolderRootPrefix))
            {
                //此处会出现一个bug, 有时候文件目录不存在，但其folderpath已经在数据库中存在，此时调用
                //FileSystemUtils.AddFolder( 就会出现 "AddFolderAlreadyExists", "The provided folder path already exists. The folder has not been added" 这个异常.
                //这个问题由一个客户Glenn报告。
                //解决办法，先检查一下folderpath在数据库中是否存在，如果不存在，则调用FileSystemUtils.AddFolder, 如果存在，则仅创建目录
                if (FolderManager.Instance.GetFolder(PortalSettings.PortalId, Local_FolderRootPrefix + "/") == null)//检查该folder是否存在数据库中，
                {
                    FolderManager.Instance.AddFolder(PortalSettings.PortalId, Local_FolderRootPrefix + "/");
                }
                else
                {
                    Directory.CreateDirectory(PortalSettings.HomeDirectoryMapPath + Local_FolderRootPrefix);
                }
            }


            //Check user root folder
            if (!Directory.Exists(Local_UserFolderPath_Physical))
            {
                if (FolderManager.Instance.GetFolder(PortalSettings.PortalId, Local_UserFolderPath_Relative) == null)
                {
                    FolderManager.Instance.AddFolder(PortalSettings.PortalId, Local_UserFolderPath_Relative);
                }
                else
                {
                    Directory.CreateDirectory(Local_UserFolderPath_Physical);
                }

                //为用户创建几个缺省子目录，省得他们不知道咋办
                CreateSubFolderForUser("Images");
                CreateSubFolderForUser("Videos");
                CreateSubFolderForUser("Audio");
                CreateSubFolderForUser("Documents");
                CreateSubFolderForUser("Others");
            }
            CheckUserTempUploadFolder_ForDNNUpload();

        }


        private void CreateSubFolderForUser(string folderName)
        {
            if (!System.IO.Directory.Exists(Local_UserFolderPath_Physical + folderName))
            {
                if (FolderManager.Instance.GetFolder(PortalSettings.PortalId, Local_UserFolderPath_Relative + folderName + "/") == null)
                {
                    FolderManager.Instance.AddFolder(PortalSettings.PortalId, Local_UserFolderPath_Relative + folderName + "/");
                }
                else
                {
                    Directory.CreateDirectory(Local_UserFolderPath_Physical + folderName);
                }
            }
        }

        private void CheckUserFolderExist_A3()
        {
            if (A3FolderController.GetByUser(CurrentUserId).Count < 1)//Add some default folder
            {
                A3FolderInfo objFolder = new A3FolderInfo();
                objFolder.PortalId = PortalSettings.PortalId;
                objFolder.UserId = CurrentUserId;
                objFolder.Name = "Images";
                A3FolderController.Add(objFolder);
                objFolder.Name = "Videos";
                A3FolderController.Add(objFolder);
                objFolder.Name = "Audio";
                A3FolderController.Add(objFolder);
                objFolder.Name = "Documents";
                A3FolderController.Add(objFolder);
                objFolder.Name = "Others";
                A3FolderController.Add(objFolder);
            }
            CheckUserTempUploadFolder_ForDNNUpload();
        }
        #endregion
        protected void Page_Init(object sender, EventArgs e)
        {
            //  prevent unauthorized access
            if (!Request.IsAuthenticated)
            {
                this.Visible = false;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!Request.IsAuthenticated)
                {
                    return;
                }
                if (ShowFolderListOnly)//仅仅显示FolderList
                {
                    ddlFolderList.Visible = true;
                    tblControlBar.Visible = false;
                    tblFile.Visible = false;
                    tblUrl.Visible = false;
                    tblEmbed.Visible = false;
                    //bind folder and file list
                    if (StorageMode.ToLower() == "local")
                    {
                        CheckUserFolderExist_Local();
                    }
                    if (StorageMode.ToLower() == "a3")
                    {
                        CheckUserFolderExist_A3();
                    }
                    LoadFolders();
                    return;
                }
                //设置 Control bar
                tblControlBar.Visible = ShowControlBar;
                if (ShowControlBar)
                {
                    if (ShowFile)
                    {
                        rblControlBar.Items.Add(new ListItem(Localization.GetString("rbFile", LocalResourceFile), "file"));
                    }
                    if (ShowUrl)
                    {
                        rblControlBar.Items.Add(new ListItem(Localization.GetString("rbUrl", LocalResourceFile), "url"));
                    }
                    if (ShowEmbed)
                    {
                        rblControlBar.Items.Add(new ListItem(Localization.GetString("rbEmbed", LocalResourceFile), "embed"));
                    }
                    if (ShowFile)
                    {
                        rblControlBar.SelectedValue = "file";
                    }
                    else
                    {
                        if (ShowUrl)
                        {
                            rblControlBar.SelectedValue = "url";
                        }
                        else
                        {
                            if (ShowEmbed)
                            {
                                rblControlBar.SelectedValue = "embed";
                            }
                        }
                    }
                }

                //设置其他的layout
                if (ShowFile)
                {
                    CurrentMode = "file";//file 可用，则首选择file
                    tblFile.Visible = true;
                    tblUrl.Visible = false;
                    tblEmbed.Visible = false;
                    //bind folder and file list
                    if (StorageMode.ToLower() == "local")
                    {
                        CheckUserFolderExist_Local();
                    }
                    if (StorageMode.ToLower() == "a3")
                    {
                        CheckUserFolderExist_A3();
                    }
                    LoadFolders();
                    GetFileList(true);
                }
                else
                {
                    if (ShowUrl)
                    {
                        CurrentMode = "url";
                        tblFile.Visible = false;
                        tblUrl.Visible = true;
                        tblEmbed.Visible = false;
                    }
                    else
                    {
                        if (ShowEmbed)
                        {
                            CurrentMode = "embed";
                            tblFile.Visible = false;
                            tblUrl.Visible = false;
                            tblEmbed.Visible = true;
                        }
                    }
                }
            }
        }
        protected void ddlFolder_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetFileList(true);
        }
        protected void btnRefresh_Command(object sender, CommandEventArgs e)
        {
            GetFileList(true);
        }

        private void ChangeLayout()
        {
            //change layout based radio button checked
            tblFile.Visible = CurrentMode == "file";
            tblUrl.Visible = CurrentMode == "url";
            tblEmbed.Visible = CurrentMode == "embed";
        }
        protected void rblControlBar_SelectedIndexChanged(object sender, EventArgs e)
        {
            CurrentMode = rblControlBar.SelectedValue;
            ChangeLayout();
        }
    }
}
