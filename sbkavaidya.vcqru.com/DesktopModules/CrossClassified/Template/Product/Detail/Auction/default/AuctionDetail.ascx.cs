using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Cross.DNN.Common.UserDefinedTable;
using Cross.DNN.Common.Utility;
using Cross.Modules.CP_Auction.Business;
using Cross.Modules.CP_Product.Business;
using DotNetNuke.Common;
using DotNetNuke.Security;
using DotNetNuke.Services.Localization;
namespace Cross.Modules.CP_Product.View
{
    public partial class AuctionDetail : CPModuleBase
    {
        public Setting_Detail Settings_Detail;

        override protected void OnInit(EventArgs e)
        {
            Settings_Detail = new Setting_Detail(ModuleId, TabId, ModuleConfiguration.ModuleSettings);
            if (Settings_Detail.General.TypeId == -1)
            {
                Settings_Detail = new Setting_Detail(ModuleId, TabId);
            }
            base.OnInit(e);
        }
        public int ProductId
        {
            get
            {
                if (ViewState["ProductId"] != null)
                {
                    return Convert.ToInt32(ViewState["ProductId"]);
                }
                else
                {
                    if ((Request.Params["ProductId"] != null) && (Request.Params["ProductId"] != ""))
                    {
                        ViewState["ProductId"] = Int32.Parse(Request.Params["ProductId"]);
                        return Int32.Parse(Request.Params["ProductId"]);
                    }
                    else
                    {
                        return -1;
                    }
                }
            }
        }
       public decimal CurrentBid
        {
            get
            {
                return BidController.GetCurrentBid(ProductId).Bid;
            }
        }
       public string CurrentBidder
       {
           get
           {
               return BidController.GetCurrentBid(ProductId).BidderName;
           }
       }
        public ProductInfo objProduct
        {
            get
            {
                ProductInfo pi = new ProductInfo();
                pi = ProductController.Get(ProductId);
                LocalizeObject_Product(pi);
                return pi;
            }
        }
        public Cross.Modules.CP_Product.Business.UserInfo objAuthor
        {
            get
            {
                Cross.Modules.CP_Product.Business.UserInfo ai = new Cross.Modules.CP_Product.Business.UserInfo();
                ai = Cross.Modules.CP_Product.Business.UserController.Get(objProduct.UserId);
                if (ai == null)
                {
                    return new Cross.Modules.CP_Product.Business.UserInfo();
                }
                return ai;
            }
        }
        /// <summary>
        /// 当前有多少个 tabs,如果仅有一个的话，可以不用jquery tabs 方式显示
        /// </summary>
        public int TabCounts
        {
            get
            {
                int tab = 0;
                if (objType.FieldEnable_Description && Settings_Detail.General.ShowDescription && !string.IsNullOrEmpty(objProduct.Description.Trim()))
                {
                    tab += 1;
                }
                if (Settings_Detail.General.ShowField1 && objType.EnableField1 && !string.IsNullOrEmpty(objProduct.Field1.Trim()))
                {
                    tab += 1;
                }
                if (Settings_Detail.General.ShowField2 && objType.EnableField2 && !string.IsNullOrEmpty(objProduct.Field2.Trim()))
                {
                    tab += 1;
                }
                if (Settings_Detail.General.ShowField3 && objType.EnableField3 && !string.IsNullOrEmpty(objProduct.Field3.Trim()))
                {
                    tab += 1;
                }
                if (Settings_Detail.General.ShowField4 && objType.EnableField4 && !string.IsNullOrEmpty(objProduct.Field4.Trim()))
                {
                    tab += 1;
                }
                if (Settings_Detail.General.ShowField5 && objType.EnableField5 && !string.IsNullOrEmpty(objProduct.Field5.Trim()))
                {
                    tab += 1;
                }

                if (objType.FieldEnable_SpecialOffer && Settings_Detail.General.ShowSpecialOffer && !string.IsNullOrEmpty(objProduct.SpecialOffer.Trim()))
                {
                    tab += 1;
                }
                if (objType.FieldEnable_License && Settings_Detail.General.ShowLicense && !string.IsNullOrEmpty(objProduct.License.Trim()))
                {
                    tab += 1;
                }
                if (objType.FieldEnable_Delivery && Settings_Detail.General.ShowDelivery && !string.IsNullOrEmpty(objProduct.Delivery.Trim()))
                {
                    tab += 1;
                }
                if (objType.FieldEnable_Support && Settings_Detail.General.ShowSupport && !string.IsNullOrEmpty(objProduct.Support.Trim()))
                {
                    tab += 1;
                }
                if (ShowRelatedVideo)
                {
                    tab += 1;
                }

                if (ShowAttachment)
                {
                    tab += 1;
                }

                if (ShowRelatedVideo)
                {
                    tab += 1;
                }

                if (ShowRelatedAudio)
                {
                    tab += 1;
                }

                if (ShowRelatedImage)
                {
                    tab += 1;
                }

                if (ShowBidHistory)
                {
                    tab += 1;
                }
            

                if (Settings_Detail.VendorProfile.ShowVendorProfile)
                {
                    tab += 1;
                }

                if (Settings_Portal.Rating.AllowRating && Settings_Detail.Rating.ShowRating )
                {
                    tab += 1;
                }

                if (Settings_Portal.Comment.AllowComment && objProduct.AllowComment && Settings_Detail.Comment.ShowComment)
                {
                    tab += 1;
                }

                if (ShowRelatedProduct)
                {
                    tab += 1;
                }
                if (Settings_Detail.Auction.ShowAuctionExplaination)
                {
                    tab += 1;
                }
             
                return tab;
            }
        }
        /// <summary>
        /// replace " ' from map title
        /// </summary>
        public string MapTitle
        {
            get
            {
                if (string.IsNullOrEmpty(objProduct.MapTitle))
                {
                    return objProduct.Name.Replace("\"", " ").Replace("\'", " ");
                }
                else
                {
                    return objProduct.MapTitle.Replace("\"", " ").Replace("\'", " ");
                }
            }
        }
        public bool IsEnglishAuction
        {
            get
            {
                return objType.AuctionType == Convert.ToInt16(CP_Auction.Business.AuctionType.English);
            }
        }
        public bool IsSecondItemAuction
        {
            get
            {
                return objType.AuctionType == Convert.ToInt16(CP_Auction.Business.AuctionType.Second_item);
            }
        }
   
        public TypeInfo objType
        {
            get
            {
                TypeInfo item = new TypeInfo();
                item = TypeController.Get(objProduct.TypeId);
                LocalizeObject_Type(item);
                return item;
            }
        }
       
        public string ShippingOptions
        {
            get
            {
                if (objType.SellType != Convert.ToInt16(SellType.Goods))
                {
                    return string.Empty;
                }
                if (objProduct.ShippingFeeType == Convert.ToInt16(ShippingFeeType.Default))
                {
                    return Localization.GetString("ShippingFeeType_Default", LocalResourceFile);
                }
                if (objProduct.ShippingFeeType == Convert.ToInt16(ShippingFeeType.FixedShippingFee))
                {
                    return string.Format(Localization.GetString("ShippingFeeType_FixedShippingFee", LocalResourceFile),
                        Settings_Portal.Order.CurrencySymbol, objProduct.FixedShippingFee.ToString());
                }
                if (objProduct.ShippingFeeType == Convert.ToInt16(ShippingFeeType.NoShippingFee))
                {
                    return string.Format(Localization.GetString("ShippingFeeType_NoShippingFee", LocalResourceFile),
                        Settings_Portal.Order.CurrencySymbol);
                }
                return string.Empty;

                
            }
        }

        public bool ShowGoogleMap
        {
            get
            {
                if (Settings_Detail.GoogleMap.ShowGoogleMap
                    && objType.AllowGoogleMap
                 //   && !string.IsNullOrEmpty(Settings_Portal.GoogleMap.GoogleMapAccessKey)
                    && !string.IsNullOrEmpty(objProduct.Longitude)
                    && !string.IsNullOrEmpty(objProduct.Latitude))
                {
                    return true;
                }
                return false;
            }
        }


        public bool ShowBidHistory
        {
            get
            {
                //bid history 应当仅对english 有效
                if (Settings_Detail.Auction.ShowBidHistory && IsEnglishAuction)
                {
                    return true;
                }
                return false;
            }
        }


        public bool ShowAttachment
        {
            get
            {
                if (Settings_Detail.General.ShowAttachment && Settings_Portal.Feature.EnableDocument
                    && AttachmentController.GetByProduct(ProductId).Count > 0)
                {
                    return true;
                }
                return false;
            }
        }

        public bool ShowRelatedProduct
        {
            get
            {
                if (Settings_Detail.RelatedProduct.ShowRelatedProduct
                    && ProductController.GetRelatedRows(objProduct.TypeId, UserId, ProductId, Settings_Detail.RelatedProduct.RelatedProductRows).Count > 0)
                {
                    return true;
                }
                return false;
            }
        }
        public bool ShowRelatedVideo
        {
            get
            {
                if (Settings_Detail.RelatedVideo.ShowRelatedVideo && Settings_Portal.Feature.EnableVideo
                    && VideoController.GetByProduct(ProductId).Count > 0)
                {
                    return true;
                }
                return false;
            }
        }
        public bool ShowRelatedAudio
        {
            get
            {
                if (Settings_Detail.RelatedAudio.ShowRelatedAudio && Settings_Portal.Feature.EnableAudio
                    && AudioController.GetByProduct(ProductId).Count > 0)
                {
                    return true;
                }
                return false;
            }
        }
        public bool ShowRelatedImage
        {
            get
            {
                if (Settings_Detail.RelatedImage.ShowRelatedImage && Settings_Portal.Feature.EnableImage
                    && ImageController.GetByProduct(ProductId).Count > 0)
                {
                    return true;
                }
                return false;
            }
        }
        public Int64 RemainTotalSeconds
        {
            get
            {
               // return -1;
                if (objProduct.StockQuantity <= 0)
                {
                    return -1;
                }
                if (objProduct.ExpireDate < DateTime.Now)
                {
                    return -2;
                }

                TimeSpan objSpan = objProduct.ExpireDate - DateTime.Now;
                return Convert.ToInt64(objSpan.TotalSeconds);
            }
        }
        public string GetRemainTime()
        {
            if (objProduct.StockQuantity <=0 )
            {
                return Localization.GetString("Tip_SoldOut", LocalResourceFile);
            }
            if (objProduct.ExpireDate < DateTime.Now)
            {
                return string.Format(Localization.GetString("Tip_Expired", LocalResourceFile),objProduct.ExpireDate.ToString());
            }
            
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
        public string GetWinnerTip()
        {
            
            if (IsEnglishAuction && UserId != -1 && UserInfo.Username == CurrentBidder)
            {
                return "<font color='green'>" + " (" + Localization.GetString("Tip_YouAreWinner", LocalResourceFile) + ")" + "</font>";
            }
            return string.Empty;
        }
        public string GetReservePriceTip()
        {

            if (objProduct.ReservePrice > 0)
            {
                if (CurrentBid >= objProduct.ReservePrice)
                {
                    return "<font color='green'>" + Localization.GetString("Tip_ReservePriceMet", LocalResourceFile) + "</font>";
                }
                else
                {
                    return "<font color='red'>" + Localization.GetString("Tip_ReservePriceNotMet", LocalResourceFile) + "</font>";
                }
            }
            return Localization.GetString("Tip_NoReservePrice", LocalResourceFile);
        }
        public string GetBidCount()
        {
            return string.Format(Localization.GetString("BidCount", LocalResourceFile), 
                CP_Auction.Business.BidController.GetByProduct(objProduct.Id).Count().ToString());
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
        #region Event handler
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (ProductId == -1 || objProduct == null)
                {
                    return;
                }
                RegisterScriptAndCss();
                ctlRating.ResourceFile = LocalUtils.ResourcesFile_Shared;
                ctlComment.ResourceFile = LocalUtils.ResourcesFile_Shared;
                ctlBidHistory.ResourceFile = LocalUtils.ResourcesFile_Shared;
                this.LocalResourceFile = Localization.GetResourceFile(this, "AuctionDetail.ascx");
                //Social bookmarks

                AddSocialBookmarks(objProduct.Name, Globals.NavigateURL(TabId, "", "ProductId=" + ProductId.ToString()));

                BindUDField();
                if (!IsPostBack)
                {
                    ProductController.UpdateViews(ProductId);

                    //if link url exists ,simply redirect
                    if (objProduct.LinkUrl != null && objProduct.LinkUrl.Trim() != "")
                    {
                        if (objProduct.LinkUrl.ToLower().StartsWith("fileid=") || objProduct.LinkUrl.ToLower().StartsWith("userid=")
                            || Microsoft.VisualBasic.Information.IsNumeric(objProduct.LinkUrl))//当前链接到文件,当前用户信息，或者网站页面
                        {
                            Response.Redirect(Globals.LinkClick(objProduct.LinkUrl, TabId, ModuleId), true);
                        }
                        else
                        {
                            Response.Redirect(objProduct.LinkUrl, true);
                        }
                    }
                    if (objType.FieldEnable_PreviousVersion)
                    {
                        ProductInfo objNewVersion = ProductController.GetNewVersion(ProductId);
                        if (objNewVersion != null)
                        {
                            hlNewVersion.Visible = true;
                            hlNewVersion.NavigateUrl = GetProductNavigate(objNewVersion.Id.ToString(), objNewVersion.Name);
                        }
                    }
                    //bind tags
                    BindProductTags();
                    BindAttachments();
                    // bind related Product
                    BindRelatedProduct();
                    BindRelatedVideo();
                    BindRelatedAudio();
                    BindRelatedImage();
                    BindRating();
                    BindComment();
                    BindBidHistory();
                    BindAuctionData();
                    if (UserInfo.UserID != -1)
                    {
                        txtName.Text = UserInfo.DisplayName;
                        txtEmail.Text = UserInfo.Email;
                    }
                    //set bid price
                    if (IsEnglishAuction && CurrentBid > 0)//english aution 并且当前已有bid item
                    {
                        txtBid.Text = (CurrentBid + objProduct.BidIncrement).ToString();
                    }
                    else//其它情况 start price + bid increment
                    {
                        if (objProduct.StartPrice > 0)
                        {
                            txtBid.Text = objProduct.StartPrice.ToString();
                        }
                        else
                        {
                            txtBid.Text = objProduct.BidIncrement.ToString();
                        }
                    }
                    if (IsSecondItemAuction)
                    {
                        txtOrderCount.Focus();
                    }
                    else
                    {
                        txtBid.Focus();
                    }
                    trCurrentBidder.Visible = IsEnglishAuction && Settings_Detail.Auction.ShowCurrentBidder && !string.IsNullOrEmpty(CurrentBidder);

                    DataBind();
                }
            }
            catch (Exception exc)
            {
                DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException("Error: Unable to load the product details page.", this, exc, true);
            }
        }
   
        private void BindUDField()
        {
            List<UDFieldInfo> list = (from p in Cache_UdtList where p.TypeId == objProduct.TypeId select p).ToList();
            if (list.Count > 0 && Settings_Detail.UDField.UseBuiltInTemplate
                && !string.IsNullOrEmpty(Settings_Detail.UDField.UDFieldList))
            {
                string[] displayList = Settings_Detail.UDField.UDFieldList.Split(',');
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
                        objCell.Align = "Left";
                        Label lblControl = new Label();
                        lblControl.Text = (objUDField.FieldTitle == null || objUDField.FieldTitle.Trim() == "") ? objUDField.FieldName : objUDField.FieldTitle + ":";
                        objCell.Controls.Add(lblControl);
                        objRow.Cells.Add(objCell);

                        objCell = new HtmlTableCell();
                        objCell.Align = "Left";
                        //add field value
                        objCell.Controls.Add(GetUDFieldValueControl(objUDField.Id, ProductId));
                        objRow.Cells.Add(objCell);
                        tblUserDefinedField.Rows.Add(objRow);
                    }
                }
            }
        }
        private Control GetUDFieldValueControl(int udFieldId, int productId)
        {
            Label lblDefault = new Label();
            lblDefault.Text = "";
            UDFieldInfo objUDField = UDFieldController.Get(udFieldId);
            if (objUDField == null)
            {
                return lblDefault;
            }

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
                ctlControl.Width = Settings_Detail.UDField.UDField_ImageWidth;
                ctlControl.Height = Settings_Detail.UDField.UDField_ImageHeight;
                ctlControl.NormalizeFlag = objUDField.NormalizeFlag;
                ctlControl.OutputSettings = objUDField.OutputSettings;
                ctlControl.InputSettings = objUDField.InputSettings;
                ctlControl.Target = "_self";
                ctlControl.CheckBoxList_Enabled = Settings_Detail.UDField.UDField_CheckBoxList_Enabled;
                ctlControl.CheckBoxList_RepeatColumns = Settings_Detail.UDField.UDField_CheckBoxList_RepeatColumns;
                return ctlControl;
            }
        }
        protected string GetUDFieldValue(string fieldName)
        {
            UDFieldInfo objUDField = UDFieldController.GetByName(fieldName, objType.Id);
            if (objUDField == null)
            {
                return "Unknow field name, please check it";
            }
            UDDataInfo objData = UDDataController.GetByCulture(objUDField.Id, ProductId,
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
        private void RegisterScriptAndCss()
        {
            // CheckXhtml();
            DotNetNuke.Framework.JavaScriptLibraries.JavaScript.RequestRegistration(DotNetNuke.Framework.JavaScriptLibraries.CommonJs.jQueryUI);
        //    DotNetNuke.Framework.jQuery.RequestUIRegistration();
            StringBuilder sb = new StringBuilder();
            //Jquery ui
            //sb.AppendFormat("<link rel=\"stylesheet\" href=\"{0}/desktopmodules/crossclassified/css/jquery/{1}\" type=\"text/css\"  />{2}",
            //    FullDomainName, Settings_Detail.General.TabStyle, "\r\n");
            sb.AppendFormat("<link rel=\"stylesheet\" href=\"{0}/desktopmodules/crossclassified/css/jquery-ui-themes-1.11.4/Themes/{1}/jquery-ui.css\" type=\"text/css\"  />{2}",
               FullDomainName, Settings_Detail.General.TabStyle, "\r\n");

            Page.ClientScript.RegisterStartupScript(this.GetType(), "Cp_Detail_Script", sb.ToString());
            //video box is used to play related videos and audios
            if (ShowRelatedVideo || ShowRelatedAudio)
            {
                RegisterScript_LightVideo();
                if (ShowRelatedVideo)//thick box is used to play embed videos
                {
                    RegisterScript_ThickBox();
                }
            }
            //fancy box is used to play images
            if (ShowRelatedImage)
            {
                RegisterScript_FancyBox();
            }
            if (ShowGoogleMap)
            {
                RegisterScript_GoogleMap();
            }
            //if (Settings_Detail.JQZoom.RegisterJQZoomScript)
            //{
            //    RegisterScript_JqZoom();
            //}
        }
        /// <summary>
        /// Register google map script
        /// </summary>
        private void RegisterScript_GoogleMap()
        {
            if (!this.Page.ClientScript.IsClientScriptBlockRegistered("GoogleMapScript"))
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat("<script type=\"text/javascript\" src=\"{0}maps.googleapis.com/maps/api/js?sensor=true\"></script>{1}",
                  System.Web.HttpContext.Current.Request.IsSecureConnection ? "https://" : "http://", "\r\n");

                //sb.AppendFormat("<script type=\"text/javascript\" src=\"{0}maps.googleapis.com/maps/api/js?key={1}&sensor=true\"></script>{2}",
                //    System.Web.HttpContext.Current.Request.IsSecureConnection ? "https://" : "http://",
                //    Settings_Portal.GoogleMap.GoogleMapAccessKey, "\r\n");
                this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "GoogleMapScript", sb.ToString(), false);
            }
        }

        private void RegisterScript_FancyBox()
        {
            if (!this.Page.ClientScript.IsClientScriptBlockRegistered("FancyBoxScript"))
            {
                //v8.7 introduces fancybox 2.1.5, to replace the old version
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                //  < !--Add mousewheel plugin (this is optional)-- >
                sb.AppendFormat("<script type=\"text/javascript\" src=\"{0}/js/fancyapps-fancyBox-v2.1.5/lib/jquery.mousewheel-3.0.6.pack.js\"></script>{1}",
                    FullDomainName + "/DesktopModules/CrossClassified", "\r\n");
                //<!-- Add fancyBox main JS and CSS files -->
                sb.AppendFormat("<script type=\"text/javascript\" src=\"{0}/js/fancyapps-fancyBox-v2.1.5/source/jquery.fancybox.js?v=2.1.5\"></script>{1}",
                    FullDomainName + "/DesktopModules/CrossClassified", "\r\n");
                sb.AppendFormat("<link rel=\"stylesheet\" href=\"{0}/js/fancyapps-fancyBox-v2.1.5/source/jquery.fancybox.css?v=2.1.5\" type=\"text/css\" media=\"screen\" />{1}",
                    FullDomainName + "/DesktopModules/CrossClassified", "\r\n");

                // < !--Add Button helper (this is optional)-- >
                sb.AppendFormat("<link rel=\"stylesheet\" href=\"{0}/js/fancyapps-fancyBox-v2.1.5/source/helpers/jquery.fancybox-buttons.css?v=1.0.5\" type=\"text/css\" media=\"screen\" />{1}",
                    FullDomainName + "/DesktopModules/CrossClassified", "\r\n");

                sb.AppendFormat("<script type=\"text/javascript\" src=\"{0}/js/fancyapps-fancyBox-v2.1.5/source/helpers/jquery.fancybox-buttons.js?v=1.0.5\"></script>{1}",
                    FullDomainName + "/DesktopModules/CrossClassified", "\r\n");

                this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "FancyBoxScript", sb.ToString(), false);
            }
        }
        /// <summary>
        /// JQuery zoom is a javascript image magnifier which can show your product images elegantly,check http://www.mind-projects.it/projects/jqzoom/demos.php#demo1.
        /// </summary>
        private void RegisterScript_JqZoom()
        {
            if (!this.Page.ClientScript.IsClientScriptBlockRegistered("JqZoomScript"))
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat("<script type=\"text/javascript\" src=\"{0}/js/JqZoom/jquery.jqzoom-core-pack.js\"></script>{1}",
                    FullDomainName + "/DesktopModules/CrossClassified", "\r\n");
                sb.AppendFormat("<link rel=\"stylesheet\" href=\"{0}/js/JqZoom/jquery.jqzoom.css\" type=\"text/css\" />{1}",
                    FullDomainName + "/DesktopModules/CrossClassified", "\r\n");
                this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "JqZoomScript", sb.ToString(), false);
            }
        }

        private void RegisterScript_ThickBox()
        {
            if (!this.Page.ClientScript.IsClientScriptBlockRegistered("ThickBoxScript"))
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat("<link rel=\"stylesheet\" href=\"{0}/js/thickbox/thickbox.css\" type=\"text/css\" media=\"screen\" />{1}",
                    FullDomainName + "/DesktopModules/CrossClassified", "\r\n");
                sb.AppendLine(RegisterPah_ThickBoxLoadingGif());
                sb.AppendFormat("<script type=\"text/javascript\" src=\"{0}/js/thickbox/thickbox.js\"></script>{1}",
                    FullDomainName + "/DesktopModules/CrossClassified", "\r\n");
                this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "ThickBoxScript", sb.ToString(), false);
            }
        }
        private void RegisterScript_SwfObject()
        {
            if (!this.Page.ClientScript.IsClientScriptBlockRegistered("UltraFlashSwfObject"))
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat("<script type=\"text/javascript\" src=\"{0}swfobject.js\"></script>{1}",
                    FullDomainName + "/DesktopModules/CrossClassified/Js/", "\r\n");
                this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "UltraFlashSwfObject", sb.ToString(), false);
            }
        }
        private void CheckXhtml()
        {
            if (Settings_Detail.General.CheckXhtmlDocType)//添加一个check xhtml 选项让用户可以禁止自动添加doctype
            {
                Control ctlDocType = BasePage.FindControl("skinDocType");//light box video needs xhtml doctype
                if (ctlDocType != null)
                {
                    System.Web.UI.WebControls.Literal lit = (System.Web.UI.WebControls.Literal)ctlDocType;
                    lit.Text = @"<!DOCTYPE html
                            PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN'
                            'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'> ";

                }
            }
        }
        private void RegisterScript_LightVideo()
        {

            RegisterScript_Mootools();
            RegisterScript_SwfObject();

            if (!Page.ClientScript.IsClientScriptBlockRegistered("CrossLiveVideoLightBoxScript"))
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat("<link rel=\"stylesheet\" href=\"{0}/css/VideoBox.css\" type=\"text/css\" media=\"screen\" />{1}",
                    FullDomainName + "/DesktopModules/CrossClassified", "\r\n");
                sb.AppendLine(RegisterPah_LightVideoFlv());
                sb.AppendFormat("<script type=\"text/javascript\" src=\"{0}/js/videobox/videobox.namespaced.js\"></script>{1}",
                    FullDomainName + "/DesktopModules/CrossClassified", "\r\n");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CrossLiveVideoLightBoxScript", sb.ToString());

            }
        }
        private void RegisterScript_Mootools()
        {
            if (!this.Page.ClientScript.IsClientScriptBlockRegistered("MootoolsScript"))
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat("<script type=\"text/javascript\" src=\"{0}/js/videobox/mootools.v1.11.namespaced.js\"></script>{1}",
                    FullDomainName + "/DesktopModules/CrossClassified", "\r\n"); ;
                this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "MootoolsScript", sb.ToString(), false);
            }
        }

        private string RegisterPah_LightVideoFlv()
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("\r\n");
            sb.Append("<script type='text/javascript'> ");
            sb.Append("\r\n");
            //This global variable is used to set the domain name, so the flv flash player path  is correct
            sb.AppendFormat("var CROSS_ULTRAFLASHPLAYER_FLV_PLAYER_FILE='{0}'; ",
                FullDomainName + "/Desktopmodules/CrossClassified/flash/mediaplayer.swf");
            sb.Append("\r\n");
            sb.Append("</script> ");
            sb.Append("\r\n");

            return sb.ToString();
        }

        private string RegisterPah_ThickBoxLoadingGif()
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("\r\n");
            sb.Append("<script type='text/javascript'> ");
            sb.Append("\r\n");
            //This global variable is used to set the domain name, so the ThickBox_Loading  is correct
            sb.AppendFormat("var Cross_ThickBox_Loading_Gif='{0}'; ", FullDomainName + "/Desktopmodules/CrossClassified/Js/thickbox/loadingAnimation.gif");
            sb.Append("\r\n");
            sb.Append("</script> ");
            sb.Append("\r\n");

            return sb.ToString();
        }


        private void BindBidHistory()
        {
            if (ShowBidHistory)
            {
                DotNetNuke.Collections.IPagedList<BidInfo> bidList = BidController.PageByProduct(ProductId, ctlBidHistory.CurrentPage, Settings_Detail.Auction.BidHistoryPerPage);
                grBidHistory.DataSource = bidList;
                grBidHistory.DataBind();

                ctlBidHistory.RecordCount = bidList.TotalCount;
                ctlBidHistory.PageSize = Settings_Detail.Auction.BidHistoryPerPage;
                ctlBidHistory.Span = 3;
            }
        }
     
        private void BindAttachments()
        {

            List<AttachmentInfo> list = AttachmentController.GetByProduct(ProductId);
            if (list.Count > 0)
            {
                if (PortalSecurity.IsInRoles(PortalSettings.AdministratorRoleName) || Utils.HasRolePermission(objProduct.DownloadRoles))
                {
                    lblAttacmentNeedLoggedIn.Visible = false;
                    dlAttachment.Visible = true;
                    foreach (var item in list)
                    {
                        LocalizeObject_Attachment(item);
                    }
                    dlAttachment.DataSource = list;
                    dlAttachment.DataBind();
                }
                else
                {
                    lblAttacmentNeedLoggedIn.Visible = true;
                    dlAttachment.Visible = false;
                }
            }
        }

        private void BindProductTags()
        {
            if (Settings_Detail.Tag.ShowTags)
            {
                dlTags.DataSource = ProductToTagController.GetByProduct(ProductId,
                    GetCurrentCultureCode());
                dlTags.DataBind();
            }
        }

        private void BindComment()
        {
            if (Settings_Portal.Comment.AllowComment && objProduct.AllowComment && Settings_Detail.Comment.ShowComment)
            {
                int totalRecords = 0;
                Boolean showUnAuthed = PortalSecurity.IsInRole(PortalSettings.AdministratorRoleName) ? true : false;

                List<CommentInfo> list = CommentController.GetByProduct(ProductId, showUnAuthed, showUnAuthed,
                    Settings_Detail.Comment.CommentRowCount, ctlComment.CurrentPage, ref totalRecords);
                dlComments.DataSource = list;
                dlComments.DataBind();

                ctlComment.RecordCount = totalRecords;
                ctlComment.PageSize = Settings_Detail.Comment.CommentRowCount;
                ctlComment.Span = 3;

                if (PortalSecurity.IsInRoles(PortalSettings.AdministratorRoleName) || Utils.HasRolePermission(objProduct.CommentRoles))
                {
                    trComment.Visible = true;
                    if (!Settings_Portal.Comment.AutoAuthComment)
                    {
                        lblCommentNeedAuth.Visible = true;
                        lblCommentNeedLoggedIn.Visible = false;
                    }
                    else
                    {
                        lblCommentNeedAuth.Visible = false;
                        lblCommentNeedLoggedIn.Visible = false;
                    }
                }
                else
                {
                    trComment.Visible = false;
                    lblCommentNeedLoggedIn.Visible = true;
                    lblCommentNeedAuth.Visible = false;
                }
            }
        }

        private void AddSocialBookmarks(string entryTitle, string entryUrl)
        {
            if (Settings_Detail.General.ShowSocialBookmarks)
            {
                // Antonio Chagoury - 5/11/2008
                // Adding social bookmarks
                // Initialize the ShareBadge Chicklets Array
                StringBuilder sb = new StringBuilder();

                if (!Page.ClientScript.IsClientScriptBlockRegistered("SB_CHICKLETS"))
                {
                    sb = new StringBuilder();
                    sb.AppendLine("<script language=\"javascript1.2\" type=\"text/javascript\">");
                    sb.AppendFormat("var strImagePath = \"{0}/DesktopModules/CrossClassified/ShareBadge/\";", FullDomainName);
                    sb.AppendLine("</script>");

                    sb.AppendFormat("<script src=\"{0}/DesktopModules/CrossClassified/ShareBadge/js/ShareBadgeChicklets.js\" language=\"javascript1.2\" type=\"text/javascript\"></script>", FullDomainName);

                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "SB_CHICKLETS", sb.ToString());
                }
                // Initialize the main ShareBadge Script
                if (!Page.ClientScript.IsClientScriptBlockRegistered("SB_PRO"))
                {
                    string SbProScript = ("<script src=\""
                                + (FullDomainName + "/DesktopModules/CrossClassified/ShareBadge/js/ShareBadgePro.js\" language=\"javascript1.2\" type=\"text/javascript\"></script>"));
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "SB_PRO", SbProScript);
                }
                // Initialize the CSS for ShareBadge
                if (!Page.ClientScript.IsClientScriptBlockRegistered("SB_PRO_CSS"))
                {
                    string SbProCss = ("<link rel=\"stylesheet\" href=\""
                                + (FullDomainName + "/DesktopModules/CrossClassified/ShareBadge/css/ShareBadge.css\" type=\"text/css\" />"));
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "SB_PRO_CSS", SbProCss);
                }
                // Display the Bookmarks Toolbar
                if (!Page.ClientScript.IsStartupScriptRegistered("SB_PRO_TOOLBAR"))
                {
                    string SbToolbar = ("<script type=\"text/javascript\">" + ("initializeShareBadge(\"ShareBadgePRO_Toolbar\",\""
                                + (entryTitle.Replace("\"", "\'") + ("\", \""
                                + (entryUrl + ("\");" + ("addBadgeItem(7);" + ("addBadgeItem(33);" + ("addBadgeItem(9);" + ("addBadgeItem(14);" + ("addBadgeItem(17);" + ("addBadgeItem(20);" + ("addBadgeItem(27);" + ("addBadgeItem(28);" + ("addBadgeItem(31);" + ("addBadgeItem(32);" + "</script>"))))))))))))))));
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SB_PRO_TOOLBAR", SbToolbar);
                }
            }
        }

        protected string GetUserNavigate(string userId)
        {
            int tab = TabId;
            if (Settings_Detail.General.VendorLinkTarget == LocalUtils.VendorLinkTarget_List)
            {
                tab = GetSubModulePageId_List(objType.Id);
            }

            else
            {
                tab = GetSubModulePageId_VendorProfile(objType.Id);
            }
            return Globals.NavigateURL(tab, "", "ProductUserId=" + userId, "ProductTypeId=" + objType.Id);
        }
        /// <summary>
        /// auction 的review 与其它不同，应该获取当前vendor 的所有产品review 平均，因为auction 通常都是一次性消费，在没有卖出之前，是没有机会获取review的
        /// </summary>
        private void BindRating()
        {
           
            if (Settings_Portal.Rating.AllowRating && Settings_Detail.Rating.ShowRating)
            {
                int totalRecords = 0;
                //get rating for current vendor
                dlRating.DataSource = RatingController.GetByVendor(objAuthor.UserId,-1, Settings_Detail.Rating.RatingRowCount, ctlRating.CurrentPage, ref totalRecords);
                dlRating.DataBind();

                ctlRating.PageSize = Settings_Detail.Rating.RatingRowCount;
                ctlRating.RecordCount = totalRecords;
                ctlRating.Span = 3;

                //Load rating
                lblVotes.Text = totalRecords.ToString();
                string imgRating = Settings_Detail.Rating.RatingImage;
                imgAverage.ImageUrl = GetVendorRatingImage();
            }
        }
   

        private void BindRelatedProduct()
        {
            if (Settings_Detail.RelatedProduct.ShowRelatedProduct)
            {
                List<ProductInfo> list = ProductController.GetRelatedRows(objProduct.TypeId, GetUserId(), ProductId, Settings_Detail.RelatedProduct.RelatedProductRows);
                if (list.Count > 0)
                {
                    foreach (var item in list)
                    {
                        LocalizeObject_Product(item);
                    }
                    dlRelatedProduct.DataSource = list;
                    dlRelatedProduct.DataBind();
                }
            }
        }
        private void BindRelatedVideo()
        {
            if (Settings_Detail.RelatedVideo.ShowRelatedVideo)
            {
                List<VideoInfo> list = VideoController.GetByProduct(ProductId);
                if (list.Count > 0)
                {
                    foreach (var item in list)
                    {
                        LocalizeObject_Video(item);
                    }
                    dlRelatedVideo.DataSource = list;
                    dlRelatedVideo.DataBind();
                }
            }
        }

        protected void dlRelatedVideo_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            int videoId = Convert.ToInt32(((Label)e.Item.FindControl("lblId")).Text);
            VideoInfo objItem = VideoController.Get(videoId);
            HyperLink hlImage = (HyperLink)e.Item.FindControl("hlImage");
            HyperLink hlTitle = (HyperLink)e.Item.FindControl("hlTitle");
            Label lblEmbedCode = (Label)e.Item.FindControl("lblEmbedCode");
            string videoWidth = Settings_Detail.RelatedVideo.VideoPlayerWidth.ToString();
            string videoHeight = Settings_Detail.RelatedVideo.VideoPlayerHeight.ToString();
            if (objItem.VideoPath.ToLower().StartsWith("http") || objItem.VideoFile.StartsWith("FileID=")) //http url or file id
            {
                hlImage.NavigateUrl = objItem.VideoPath;
                hlTitle.NavigateUrl = objItem.VideoPath;
                hlImage.Attributes.Add("rel", string.Format("vidbox {0} {1}", videoWidth, videoHeight));
                hlTitle.Attributes.Add("rel", string.Format("vidbox {0} {1}", videoWidth, videoHeight));
                lblEmbedCode.Text = "";

            }
            else
            {
                lblEmbedCode.Text = objItem.VideoPath;
                //以width=开头，接着一个或者0个" ,然后任意个单词或者字母,然后又是一个或者0个" ,最后以空白结尾
                string pattern = "\\bwidth=\"?\\w*\"?\\s\\b";
                Regex reg = new Regex(pattern, RegexOptions.IgnoreCase);

                Match m = reg.Match(objItem.VideoPath);
                if (m.Success)
                {
                    videoWidth = m.Value.ToLower().Replace("width=", "").Replace("\"", "").Replace("px", "").Replace("%", "").Trim();
                    if (Utils.IsNumber(videoWidth))
                    {
                        videoWidth = (Convert.ToInt32(videoWidth) + 20).ToString();
                    }
                }
                pattern = "\\bheight=\"?\\w*\"?\\s\\b";
                reg = new Regex(pattern, RegexOptions.IgnoreCase);
                m = reg.Match(objItem.VideoPath);
                if (m.Success)
                {
                    videoHeight = m.Value.ToLower().Replace("height=", "").Replace("\"", "").Replace("px", "").Replace("%", "").Trim();
                    if (Utils.IsNumber(videoHeight))
                    {
                        videoHeight = (Convert.ToInt32(videoHeight) + 30).ToString();
                    }
                }
                hlTitle.CssClass = "thickbox";
                hlImage.CssClass = "thickbox";
                hlTitle.NavigateUrl = string.Format("/#TB_inline?height={0}&width={1}&inlineId={2}", videoHeight, videoWidth, lblEmbedCode.ClientID);
                hlImage.NavigateUrl = string.Format("/#TB_inline?height={0}&width={1}&inlineId={2}", videoHeight, videoWidth, lblEmbedCode.ClientID);
            }
        }


        private void BindRelatedAudio()
        {
            if (Settings_Detail.RelatedAudio.ShowRelatedAudio)
            {
                List<AudioInfo> list = AudioController.GetByProduct(ProductId);
                if (list.Count > 0)
                {
                    foreach (var item in list)
                    {
                        LocalizeObject_Audio(item);
                    }
                    dlRelatedAudio.DataSource = list;
                    dlRelatedAudio.DataBind();
                }
            }
        }
        private void BindRelatedImage()
        {
            if (Settings_Detail.RelatedImage.ShowRelatedImage)
            {
                List<ImageInfo> list = ImageController.GetByProduct(ProductId);
                if (list.Count > 0)
                {
                    foreach (var item in list)
                    {
                        LocalizeObject_Image(item);
                    }
                    //把product 的设定image 加入到related image 里面，这样在jquery zoom 里面就可以一起显示
                    if (Settings_Detail.MainImage.ShowMainImage && objType.FieldEnable_Image && !string.IsNullOrEmpty(objProduct.Image.Trim()))
                    {
                        ImageInfo objMainImage = new ImageInfo();
                        objMainImage.Thumbnail = GetRelativeUrlByFileId(objProduct.Image);
                        objMainImage.ImagePath = objMainImage.Thumbnail;
                        objMainImage.Title = objProduct.Name;
                        //检查当前的image list 里面是否已经包括了同样路径的图片，如果有的话就不用加入
                        if ((from p in list where p.ImagePath.ToLower() == objMainImage.ImagePath.ToLower() select p).ToList().Count < 1)
                        {
                            list.Insert(0, objMainImage);
                        }
                    }
                    dlRelatedImage.DataSource = list;
                    dlRelatedImage.DataBind();
                }
            }
        }

  
        protected void btnAddComment_Click(object sender, EventArgs e)
        {
          //  hidLastTab.Value = "#divComment";
            //当前显示captcha 但验证码不对,返回
            if (Settings_Detail.Comment.ShowCaptchaInComment && !ctlCaptcha.IsValid)
            {
                return;
            }
            if (Page.IsValid)
            {
                CommentInfo ci = new CommentInfo();
                ci.PortalId = PortalId;
                ci.UserId = UserId;
                ci.UserName = txtName.Text.Trim();
                ci.ProductId = ProductId;
                ci.ProductName = objProduct.Name;
                if ((PortalSecurity.IsInRole(PortalSettings.AdministratorRoleName)) || (objProduct.AutoAuthComment == true))
                {
                    ci.Authed = true;
                }
                else
                {
                    ci.Authed = false;
                }
                ci.Comment = txtComment.Text;


                ci.Mail = txtEmail.Text.Trim();
                ci.Url = txtUrl.Text.Trim();
                ci.CreatedDate = DateTime.Now;
                ci.IsPrivate = chkPrivate.Checked;

                CommentController.Add(ci);
                BindComment();
            }
        }
        protected void ctlBidHistory_PageChanged(object sender, EventArgs e)
        {
           // hidLastTab.Value = "#divBidHistory";
            BindBidHistory();
        }

        protected void ctlComment_PageChanged(object sender, EventArgs e)
        {
          //  hidLastTab.Value = "#divComment";
            BindComment();
        }
        protected void ctlRating_PageChanged(object sender, EventArgs e)
        {
           // hidLastTab.Value = "#divRating";
            BindRating();
        }
        #endregion
        /// <summary>
        /// auction 的review 与其它不同，应该获取当前vendor 的所有产品review 平均
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        protected string GetRatingImage(string productId)
        {
            ProductInfo objProduct = ProductController.Get(Convert.ToInt32(productId));
            string imgRating = Settings_Detail.Rating.RatingImage;
            return LocalUtils.ModuleRootPath + "images/ratings/" + imgRating + "/" + imgRating + 
                Convert.ToInt32(RatingController.GetAverageForVendor(objProduct.UserId)).ToString() + ".gif";
        }
        /// <summary>
        /// auction 的review 与其它不同，应该获取当前vendor 的所有产品review 平均，因为auction 通常都是一次性消费，在没有卖出之前，是没有机会获取review的
        /// </summary>
        /// <returns></returns>
        protected string GetVendorRatingImage()
        {
            string imgRating = Settings_Detail.Rating.RatingImage;
            return LocalUtils.ModuleRootPath + "images/ratings/" + imgRating + "/" + imgRating +
               Convert.ToInt32(RatingController.GetAverageForVendor(objProduct.UserId)).ToString() + ".gif";
           // return this.ModuleRootPath + "images/ratings/" + imgRating + "/" + imgRating + rating + ".gif";
        }
        protected string GetVendorAverageRating()
        {
            return RatingController.GetAverageForVendor(objProduct.UserId).ToString();
        }

        /// <summary>
        /// 获取单个产品的rating image,用于rating data binding
        /// </summary>
        /// <param name="rating"></param>
        /// <returns></returns>
        protected string GetSingleRatingImage(string rating)
        {
            string imgRating = Settings_Detail.Rating.RatingImage;
            return LocalUtils.ModuleRootPath + "images/ratings/" + imgRating + "/" + imgRating + rating + ".gif";
        }

        protected string GetProductNavigate(string productId, string productName)
        {
            return GenerateProductDetailUrl(TabId, productId, productName);
        }
        protected string GetTagNavigate(string tagId)
        {
            int listTabId = GetSubModulePageId_List(objType.Id);
            return Globals.NavigateURL(listTabId, "", "ProductTagId=" + tagId, "ProductTypeId=" + objType.Id);
        }


        protected void btnOrderNow_Click(object sender, CommandEventArgs e)
        {
            if ( IsSecondItemAuction ||  objProduct.BuyNowPrice <= 0 || objProduct.Expired == true)
            {
                return;
            }
            AddToCart(true);
        }
        private void AddToCart(bool redirect)
        {
            LoginFirst();
            HideLabelTip();
            ProductInfo objNewProduct = ProductController.Get(ProductId);
            //已经过期
            if (objNewProduct.ExpireDate < DateTime.Now)
            {
                lblItemExpired.Visible = true;
                return;
            }

            //auction 不可能销售role
            //if (!RoleValid())
            //{
            //    return;
            //}
            if (!CanAddRecrusiveItem())
            {
                return;
            }
            CartInfo objCart = new CartInfo();
            objCart.ProductId = ProductId;
            objCart.ProductName = objProduct.Name;
            objCart.ClientId = UserId;
            objCart.ClientName = UserInfo.Username;
            objCart.VendorId = objProduct.UserId;
            objCart.VendorName = objProduct.UserName;
            objCart.Quantity = 1;
            objCart.UnitPrice = objProduct.BuyNowPrice;

            objCart.OptionId = -1;
            objCart.OptionName = "";
            //以下这段代码需要同步到product detail 中, 对 fixed price product 同样有效
            if (objProduct.ShippingFeeType == Convert.ToInt16(ShippingFeeType.Default) 
                || objProduct.ShippingFeeType == Convert.ToInt16(ShippingFeeType.NoShippingFee))
            {
                objCart.ShipFee = 0 + objProduct.PackageFee * objCart.Quantity;//Ship fee doesn't available yet
            }
            else // fixed shipping fee
            {
                objCart.ShipFee = (objProduct.FixedShippingFee + objProduct.PackageFee) * objCart.Quantity;
            }
            if (objProduct.TaxRateType == Convert.ToInt16(TaxRateType.Default)
                || objProduct.TaxRateType == Convert.ToInt16(TaxRateType.NoTax))
            {
                objCart.TaxFee = 0;//tax fee will caculate after ship destination is specified
            }
            else//fixed tax rate
            {
                objCart.TaxFee = (objCart.UnitPrice * objCart.Quantity * objProduct.FixedTaxRate) / 100;
            }

            objCart.ItemSum = (objCart.UnitPrice * objCart.Quantity) + objCart.ShipFee + objCart.TaxFee ;

            CartController.Add(objCart);
            if (redirect)
            {
                Response.Redirect(Globals.NavigateURL(GetSubModulePageId_Buyer(), "", "mid=" + GetSubModuleId_Buyer(),
                    "ctl=UserBuyer_Cart"), true);
            }
        }
        /// <summary>
        /// 对于second item auction type, 应该检查当前的order count 是否有效
        /// </summary>
        /// <returns></returns>
        private bool QuantityValid()
        {
            lblInvalidQuantity.Visible = false;
            if (IsSecondItemAuction)
            {
                if (!Utils.IsNumber(txtOrderCount.Text))// 无效数字
                {
                    lblInvalidQuantity.Visible = true;
                    return false;
                }
                //超过stock quantity
                if ((objProduct.StockQuantity != -1) && Convert.ToInt32(txtOrderCount.Text) > objProduct.StockQuantity)
                {
                    lblInvalidQuantity.Visible = true;
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
        private bool CanAddRecrusiveItem()
        {
            lblHaveSubscriber.Visible = false;
            lblHaveItem.Visible = false;

            List<CartInfo> cartList = CartController.GetByClient(UserId, -1, PortalId);

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
                        TypeInfo objCartType = TypeController.Get(objCartProduct.TypeId);
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

        protected void btnSubmitBid_Click(object sender, CommandEventArgs e)
        {

            LoginFirst();
            HideLabelTip();

            //不允许卖主本人竞标
            if (objProduct.UserId == UserId)
            {
                lblCanNotBidYourself.Visible = true;
                return;
            }
            ProductInfo objNewProduct = ProductController.Get(ProductId);
            //已经过期
            if (objNewProduct.ExpireDate < DateTime.Now)
            {
                lblItemExpired.Visible = true;
                return;
            }
            //检查当前用户是否已经提交过bid
            if (!IsEnglishAuction)//仅english aution 允许重复bid
            {
                //当前用户已经bid 
                if ((from p in BidController.GetByProduct(ProductId) where p.BidderId == UserId select p).ToList().Count > 0)
                {
                    lblAlreadyBid.Visible = true;
                    return;
                }
            }
            //检查当前出价是否有效数值
            try
            {
                decimal d = Convert.ToDecimal(txtBid.Text);
            }
            catch (Exception)//无效数值
            {
                lblInvalidBidPrice.Text = Localization.GetString("Tip_InvalidBidPrice", LocalResourceFile);
                lblInvalidBidPrice.Visible = true;
                return;
            }
         
            //其次检查当前的出价是否合乎标准
            ProductInfo objCurrentProduct = ProductController.Get(ProductId);
            decimal minimumPrice = 0;
            //english auction，当前已有价格
            if (IsEnglishAuction && CurrentBid > 0)
            {
                minimumPrice = CurrentBid + objProduct.BidIncrement;
            }
            else
            {
                if (objProduct.StartPrice > 0)
                {
                    minimumPrice = objProduct.StartPrice;
                }
                else
                {
                    minimumPrice = objProduct.BidIncrement;
                }
            }
            decimal bid = Convert.ToDecimal(txtBid.Text);

            //对于非second item auction 而言，不能输入大于buy now price 的数值 
            if (!IsSecondItemAuction && objProduct.BuyNowPrice > 0)
            {
                if (bid < minimumPrice || bid > objProduct.BuyNowPrice)
                {
                    lblInvalidBidPrice.Text = string.Format(Localization.GetString("Tip_PriceBetween", LocalResourceFile),
                        minimumPrice.ToString(), objProduct.BuyNowPrice.ToString());
                    lblInvalidBidPrice.Visible = true;

                    //english auction, 但目前出价小于上一出价，说明有可能在客户浏览网页这个时间段内，有别的人出价，需要刷新bid 数据
                    if (IsEnglishAuction && bid < minimumPrice)
                    {
                        BindBidHistory();
                        BindAuctionData();
                    }
                    //update txtbid.text price
                    txtBid.Text = minimumPrice.ToString();
                    return;
                }
            }
            else
            {
                //compare with current price
                if (bid < minimumPrice)
                {
                    lblInvalidBidPrice.Text = string.Format(Localization.GetString("Tip_PriceLower", LocalResourceFile),
                      minimumPrice.ToString());
                    lblInvalidBidPrice.Visible = true;
                    //english auction, 但目前出价小于上一出价，说明有可能在客户浏览网页这个时间段内，有别的人出价，需要刷新bid 数据
                    if (IsEnglishAuction)
                    {
                        BindBidHistory();
                        BindAuctionData();
                    }
                    //update txtbid.text price
                    txtBid.Text = minimumPrice.ToString();
                    return;
                }
            }
            //检查数量是否有效
            if (!QuantityValid())
            {
                return;
            }
            //bid price 有效, 开始处理
            decimal proxyBid = bid;
            //是否需要代理出价
            if (IsEnglishAuction && objType.AllowProxyBidding
                && chkProxy.Checked && bid > minimumPrice)
            {
                //代理出价，应该取最小值
                proxyBid = minimumPrice;
                //检查当前用户是否已有proxy bid
                ProxyInfo objProxy = new ProxyInfo();
                List<ProxyInfo> proxyList = (from p in ProxyController.GetByProduct(ProductId) where p.BidderId == UserId select p).ToList();
                if (proxyList.Count > 0) //更新已有数据
                {
                    objProxy = proxyList[0];
                    objProxy.Proxy = bid;
                    objProxy.UpdateDate = DateTime.Now;
                    ProxyController.Update(objProxy);
                }
                else // add a proxy item
                {
                    objProxy.BidderId = UserId;
                    objProxy.BidderName = UserInfo.Username;
                    objProxy.PortalId = PortalId;
                    objProxy.ProductId = ProductId;
                    objProxy.ProductName = objProduct.Name;
                    objProxy.Proxy = bid;
                    objProxy.TypeId = objProduct.TypeId;
                    objProxy.UpdateDate = DateTime.Now;
                    objProxy.VendorId = objProduct.UserId;
                    objProxy.VendorName = objProduct.UserName;
                    ProxyController.Add(objProxy);
                }
            }
            //首先检查是否有同样价格的代理出价记录存在，有的话应该先插入它们
            if (IsEnglishAuction && objType.AllowProxyBidding)
            {
                ProxyController.ProxyBid_ForSameAmount(ProductId, proxyBid, UserId);
            }
            //检查完毕后，加入当前的出价记录
            BidInfo objBid = new BidInfo();
            objBid.Bid = proxyBid;
            objBid.BidderId = UserId;
            objBid.BidderName = UserInfo.Username;
            objBid.CreatedDate = DateTime.Now;
            objBid.PortalId = PortalId;
            objBid.ProductId = ProductId;
            objBid.ProductName = objProduct.Name;
            objBid.Quantity = IsSecondItemAuction ? Convert.ToInt32(txtOrderCount.Text) : 1;
            objBid.TypeId = objProduct.TypeId;
            objBid.VendorId = objProduct.UserId;
            objBid.VendorName = objProduct.UserName;
            objBid.Status = Convert.ToInt16(BidStatus.Active);
            BidController.Add(objBid);

            //当前出价记录添加完成后，处理比当前出价更高的代理出价记录
            if (IsEnglishAuction && objType.AllowProxyBidding)
            {
                ProxyController.ProxyBid_ForBigAmount(ProductId, proxyBid, UserId);
            }
            if (IsEnglishAuction)
            {
                BindBidHistory();
            }
            //非english auction ,显示bid success
            if (!IsEnglishAuction)
            {
                lblBidSuccess.Visible = true;
            }
            else
            {
                // english auction, 但出价被超过
                if (BidController.GetCurrentBid(ProductId).BidderId != UserId)
                {
                    lblBidWasBeyond.Visible = true;
                }
                else
                {
                    lblBidSuccess.Visible = true;
                }

                txtBid.Text = (CurrentBid + objProduct.BidIncrement).ToString();

            }

            //重新绑定auction数据,这个地方需要测试
            BindAuctionData();
        }
        /// <summary>
        /// submit bid 后，需要刷新一些数据
        /// </summary>
        private void BindAuctionData()
        {
            lblCurrentBidData.Text = Settings_Portal.Order.CurrencySymbol + CurrentBid.ToString();
           // lblRemainTimeData.Text = GetRemainTime();
            lblBidHistoryData.Text = GetBidCount();

            trCurrentBidder.Visible = IsEnglishAuction && Settings_Detail.Auction.ShowCurrentBidder && !string.IsNullOrEmpty(CurrentBidder);
            lblCurrentBidderData.Text = CurrentBidder + GetWinnerTip();
            lblReservePriceTip.Text = GetReservePriceTip();
        }
        /// <summary>
        /// hide tip label first
        /// </summary>
        private void HideLabelTip()
        {
            lblInvalidQuantity.Visible = false;
            lblWatchAddSuccess.Visible = false;
            lblBidSuccess.Visible = false;
            lblBidWasBeyond.Visible = false;
            lblItemExpired.Visible = false;

            lblInvalidBidPrice.Visible = false;
            lblCanNotBidYourself.Visible = false;
            lblAlreadyBid.Visible = false;
            lblHaveSubscriber.Visible = false;
            lblHaveItem.Visible = false;

        }
        protected void btnAddWatch_Click(object sender, CommandEventArgs e)
        {
            LoginFirst();
            HideLabelTip();
            //add before
            if ((from p in WatchController.GetByUser(UserId) where p.ProductId == ProductId select p.Id).Count() > 0)
            {
                lblWatchAddSuccess.Visible = true;
                return;
            }
            WatchInfo objWatch = new WatchInfo();
            objWatch.ProductId = ProductId;
            objWatch.PortalId = PortalId;
            objWatch.UserId = UserId;
            objWatch.ProductName = objProduct.Name;
            WatchController.Add(objWatch);
            lblWatchAddSuccess.Visible = true;
        }
        protected void btnAddTicket_Click(object sender, CommandEventArgs e)
        {
            LoginFirst();
            Response.Redirect(Globals.NavigateURL(Settings_Portal.General.ModulePage_Admin, "", "mid=" + Settings_Portal.General.ModuleId_Admin,
                  "ctl=UserBuyer_AddTicket", "ProductId=" + ProductId.ToString()), true);
        }
        private void LoginFirst()
        {
            if (UserId == -1)
            {
                string returnUrl = HttpContext.Current.Request.RawUrl;
                if (returnUrl.IndexOf("?returnurl=") != -1)
                {
                    returnUrl = returnUrl.Substring(0, returnUrl.IndexOf("?returnurl="));
                }
                returnUrl = HttpUtility.UrlEncode(returnUrl);
                // UrlUtils.PopUpUrl(DotNetNuke.Common.Globals.LoginURL(returnUrl, (Request.QueryString["override"] != null)), this, PortalSettings, true, false);
                //popupurl 并不可靠，当前user 可以简单的取消登录，这样会出现很多user id = -1 的购买记录。还不如直接重定向
                Response.Redirect(DotNetNuke.Common.Globals.LoginURL(returnUrl, (Request.QueryString["override"] != null)), true);
            }
        }
    }
}