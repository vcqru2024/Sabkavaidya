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
using Cross.Modules.CP_Product.Business;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Security;
using DotNetNuke.Services.Localization;
namespace Cross.Modules.CP_Product.View
{
    public partial class ProductDetail : CPModuleBase
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
        /// <summary>
        /// when pass optionid, we will check it and bind to certern options
        /// </summary>
        public int OptionId
        {
            get
            {
                if (ViewState["OptionId"] != null)
                {
                    return Convert.ToInt32(ViewState["OptionId"]);
                }
                else
                {
                    if ((Request.Params["OptionId"] != null) && (Request.Params["OptionId"] != "") && Utils.IsNumber(Request.Params["OptionId"]))
                    {
                        ViewState["OptionId"] = Int32.Parse(Request.Params["OptionId"]);
                        return Int32.Parse(Request.Params["OptionId"]);
                    }
                    else
                    {
                        return -1;
                    }
                }
            }
        }
        /// <summary>
        /// when pass Quantity, we will check it and bind to certern quantitys
        /// </summary>
        public int Quantity
        {
            get
            {
                if (ViewState["Quantity"] != null)
                {
                    return Convert.ToInt32(ViewState["Quantity"]);
                }
                else
                {
                    if ((Request.Params["Quantity"] != null) && (Request.Params["Quantity"] != "") && Utils.IsNumber(Request.Params["Quantity"]))
                    {
                        ViewState["Quantity"] = Int32.Parse(Request.Params["Quantity"]);
                        return Int32.Parse(Request.Params["Quantity"]);
                    }
                    else
                    {
                        return -1;
                    }
                }
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
                LocalizeObject_User(ai);
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

                if (ShowTransactionHistory)
                {
                    tab += 1;
                }


                if (Settings_Detail.VendorProfile.ShowVendorProfile)
                {
                    tab += 1;
                }

                if (Settings_Portal.Rating.AllowRating && Settings_Detail.Rating.ShowRating && (Sellable || objProduct.AllowRating))
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
                //discount
                if (HasDiscounts && Sellable && Settings_Detail.Discount.ShowDiscountTab)
                {
                    tab += 1;
                }
                return tab;
            }
        }
        /// <summary>
        /// if there is any discount for current product
        /// </summary>
        public bool HasDiscounts
        {
            get
            {
                return HasDiscounts_Product || HasDiscounts_Customer
                    || HasDiscounts_Quantity || HasDiscounts_Coupon_Public
                    || HasDiscounts_Role || HasDiscounts_Date || HasDiscounts_FirstBuyer;
            }
        }

        /// <summary>
        /// if there is any product discount which belong to current product
        /// </summary>
        public bool HasDiscounts_Product
        {
            get
            {
                if ((from p in CP_Discount.Business.ProductController.GetByProduct(ProductId)
                     where p.Active == true
                     && (p.StartDate < DateTime.Now && (Null.IsNull(p.EndDate)
                     || p.EndDate > DateTime.Now))
                     select p).ToList().Count > 0)
                {
                    return true;
                }
                return false;
            }
        }
        public string Discounts_Product
        {
            get
            {
                if (HasDiscounts_Product == false)
                {
                    return string.Empty;
                }
                else
                {
                    StringBuilder sb = new StringBuilder();

                    foreach (var item in (from p in CP_Discount.Business.ProductController.GetByProduct(ProductId)
                                          where p.Active == true
                                          && (p.StartDate < DateTime.Now && (Null.IsNull(p.EndDate)
                                          || p.EndDate > DateTime.Now))
                                          select p).ToList())
                    {

                        string productLink = item.OptionId == -1 ?
                            Globals.NavigateURL(TabId, "", "ProductId=" + item.ProductId.ToString()) :
                            Globals.NavigateURL(TabId, "", "ProductId=" + item.ProductId.ToString(), "OptionId=" + item.OptionId.ToString());

                        string orderedProductLink = item.OrderedOptionId == -1 ?
                            Globals.NavigateURL(TabId, "", "ProductId=" + item.OrderedProductId.ToString()) :
                            Globals.NavigateURL(TabId, "", "ProductId=" + item.OrderedProductId.ToString(), "OptionId=" + item.OrderedOptionId.ToString());

                        sb.AppendFormat(Localization.GetString("DiscountFormat_Product", LocalResourceFile),
                            item.Discount.ToString() + "%",
                            productLink,
                            item.OptionId == -1 ? objProduct.Name : objProduct.Name + " (" + item.OptionName + ")",
                            orderedProductLink,
                            item.OrderedOptionId == -1 ? item.OrderedProductName : item.OrderedProductName + " (" + item.OrderedOptionName + ")");
                        if (!Null.IsNull(item.EndDate) && item.EndDate.Year != LocalUtils.GetMinDateTime().Year)
                        {
                            sb.AppendFormat(Localization.GetString("DiscountFormat_Expire", LocalResourceFile),
                            item.EndDate.ToShortDateString()
                            );
                        }
                        sb.AppendLine("<br/>");
                    }
                    return sb.ToString();
                }
            }
        }
        public string Discounts_Quantity
        {
            get
            {
                if (HasDiscounts_Quantity == false)
                {
                    return string.Empty;
                }
                else
                {
                    StringBuilder sb = new StringBuilder();

                    foreach (var item in (from p in CP_Discount.Business.QuantityController.GetByProduct(ProductId)
                                          where p.Active == true
                                          && (p.StartDate < DateTime.Now && (Null.IsNull(p.EndDate)
                                          || p.EndDate > DateTime.Now))
                                          select p).ToList())
                    {

                        string quantityLink = item.OptionId == -1 ?
                            Globals.NavigateURL(TabId, "", "ProductId=" + item.ProductId.ToString(), "Quantity=" + item.Quantity.ToString()) :
                            Globals.NavigateURL(TabId, "", "ProductId=" + item.ProductId.ToString(),
                            "OptionId=" + item.OptionId.ToString(),
                            "Quantity=" + item.Quantity.ToString());



                        sb.AppendFormat(Localization.GetString("DiscountFormat_Quantity", LocalResourceFile),
                            item.Discount.ToString() + "%",
                            quantityLink,
                            item.OptionId == -1 ? objProduct.Name : objProduct.Name + " (" + item.OptionName + ")",
                            item.Quantity.ToString());
                        if (!Null.IsNull(item.EndDate) && item.EndDate.Year != LocalUtils.GetMinDateTime().Year)
                        {
                            sb.AppendFormat(Localization.GetString("DiscountFormat_Expire", LocalResourceFile),
                            item.EndDate.ToShortDateString()
                            );
                        }
                        sb.AppendLine("<br/>");
                    }
                    return sb.ToString();
                }
            }
        }
        public string Discounts_Customer
        {
            get
            {
                if (HasDiscounts_Customer == false)
                {
                    return string.Empty;
                }
                else
                {
                    StringBuilder sb = new StringBuilder();

                    foreach (var item in (from p in CP_Discount.Business.CustomerController.GetByProduct(ProductId)
                                          where p.Active == true
                                          && p.CustomerId == UserId
                                          && (p.StartDate < DateTime.Now && (Null.IsNull(p.EndDate)
                                          || p.EndDate > DateTime.Now))
                                          select p).ToList())
                    {

                        string customerLink = item.OptionId == -1 ?
                            Globals.NavigateURL(TabId, "", "ProductId=" + item.ProductId.ToString()) :
                            Globals.NavigateURL(TabId, "", "ProductId=" + item.ProductId.ToString(), "OptionId=" + item.OptionId.ToString());



                        sb.AppendFormat(Localization.GetString("DiscountFormat_Customer", LocalResourceFile),
                            item.Discount.ToString() + "%",
                            customerLink,
                            item.OptionId == -1 ? objProduct.Name : objProduct.Name + " (" + item.OptionName + ")"
                            );
                        if (!Null.IsNull(item.EndDate) && item.EndDate.Year != LocalUtils.GetMinDateTime().Year)
                        {
                            sb.AppendFormat(Localization.GetString("DiscountFormat_Expire", LocalResourceFile),
                            item.EndDate.ToShortDateString()
                            );
                        }
                        sb.AppendLine("<br/>");
                    }
                    return sb.ToString();
                }
            }
        }

        public string Discounts_Coupon
        {
            get
            {
                if (HasDiscounts_Coupon_Public == false)
                {
                    return string.Empty;
                }

                StringBuilder sb = new StringBuilder();

                foreach (var item in (from p in CP_Discount.Business.CouponController.GetByProduct(ProductId)
                                      where p.Active == true
                                       && p.IsPublic == true
                                      && (p.StartDate < DateTime.Now && (Null.IsNull(p.EndDate)
                                      || p.EndDate > DateTime.Now))
                                      select p).ToList())
                {

                    string couponLink = item.OptionId == -1 ?
                        Globals.NavigateURL(TabId, "", "ProductId=" + item.ProductId.ToString()) :
                        Globals.NavigateURL(TabId, "", "ProductId=" + item.ProductId.ToString(), "OptionId=" + item.OptionId.ToString());



                    sb.AppendFormat(Localization.GetString("DiscountFormat_Coupon", LocalResourceFile),
                        item.Discount.ToString() + "%",
                        couponLink,
                        item.OptionId == -1 ? objProduct.Name : objProduct.Name + " (" + item.OptionName + ")",
                        item.Coupon);
                    if (!Null.IsNull(item.EndDate) && item.EndDate.Year != LocalUtils.GetMinDateTime().Year)
                    {
                        sb.AppendFormat(Localization.GetString("DiscountFormat_Expire", LocalResourceFile),
                        item.EndDate.ToShortDateString()
                        );
                    }
                    sb.AppendLine("<br/>");
                }

                //check global coupon
                List<CP_Discount.Business.GlobalCouponInfo> globalCouponList =
                    (from p in CP_Discount.Business.GlobalCouponController.GetByPortalAndUser(objProduct.PortalId, -1)
                     where p.Active == true
                     && p.IsPublic == true
                     && (string.IsNullOrEmpty(p.Types) || p.Types.Split(',').Contains(objProduct.TypeId.ToString()))
                     && p.StartDate < DateTime.Now
                     && (Null.IsNull(p.EndDate)
                     || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                     || p.EndDate > DateTime.Now)
                     select p).ToList();

                foreach (var item in globalCouponList)
                {
                    sb.AppendFormat(Localization.GetString("DiscountFormat_Coupon_Site", LocalResourceFile),
                        item.Discount.ToString() + "%",
                        item.Coupon);
                    if (!Null.IsNull(item.EndDate) && item.EndDate.Year != LocalUtils.GetMinDateTime().Year)
                    {
                        sb.AppendFormat(Localization.GetString("DiscountFormat_Expire", LocalResourceFile),
                        item.EndDate.ToShortDateString()
                        );
                    }
                    sb.AppendLine("<br/>");
                }

                //check vendor common coupon
                List<CP_Discount.Business.GlobalCouponInfo> vendorCouponList =
                    (from p in CP_Discount.Business.GlobalCouponController.GetByPortalAndUser(objProduct.PortalId, objProduct.UserId)
                     where p.Active == true
                     && p.IsPublic == true
                      && (string.IsNullOrEmpty(p.Types) || p.Types.Split(',').Contains(objProduct.TypeId.ToString()))
                      && p.StartDate < DateTime.Now
                      && (Null.IsNull(p.EndDate)
                     || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                     || p.EndDate > DateTime.Now)
                     select p).ToList();

                foreach (var item in vendorCouponList)
                {
                    sb.AppendFormat(Localization.GetString("DiscountFormat_Coupon_Vendor", LocalResourceFile),
                        item.Discount.ToString() + "%",
                        item.Coupon);
                    if (!Null.IsNull(item.EndDate) && item.EndDate.Year != LocalUtils.GetMinDateTime().Year)
                    {
                        sb.AppendFormat(Localization.GetString("DiscountFormat_Expire", LocalResourceFile),
                        item.EndDate.ToShortDateString()
                        );
                    }
                    sb.AppendLine("<br/>");
                }

                return sb.ToString();

            }
        }

        public string Discounts_FirstBuyer
        {
            get
            {
                if (HasDiscounts_FirstBuyer == false)
                {
                    return string.Empty;
                }

                StringBuilder sb = new StringBuilder();

                List<CP_Discount.Business.FirstCustomerInfo> firstCustomerDiscountList =
                   (from p in CP_Discount.Business.FirstCustomerController.GetByProduct(ProductId)
                    where p.Active == true
                    && p.StartDate < DateTime.Now
                    && (Null.IsNull(p.EndDate)
                    || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                    || p.EndDate > DateTime.Now)
                    select p).ToList();

                foreach (var item in firstCustomerDiscountList)
                {

                    string firstBuyerLink = item.OptionId == -1 ?
                        Globals.NavigateURL(TabId, "", "ProductId=" + item.ProductId.ToString()) :
                        Globals.NavigateURL(TabId, "", "ProductId=" + item.ProductId.ToString(),
                        "OptionId=" + item.OptionId.ToString());



                    sb.AppendFormat(Localization.GetString("DiscountFormat_FirstBuyer", LocalResourceFile),
                        item.Discount.ToString() + "%",
                        firstBuyerLink,
                        item.OptionId == -1 ? objProduct.Name : objProduct.Name + " (" + item.OptionName + ")",
                        item.FirstCustomer.ToString());
                    if (!Null.IsNull(item.EndDate) && item.EndDate.Year != LocalUtils.GetMinDateTime().Year)
                    {
                        sb.AppendFormat(Localization.GetString("DiscountFormat_Expire", LocalResourceFile),
                        item.EndDate.ToShortDateString()
                        );
                    }
                    sb.AppendLine("<br/>");
                }
                return sb.ToString();
            }
        }
        public string Discounts_Date
        {
            get
            {
                if (HasDiscounts_Date == false)
                {
                    return string.Empty;
                }

                StringBuilder sb = new StringBuilder();

                foreach (var item in (from p in CP_Discount.Business.DateController.GetByProduct(ProductId)
                                      where p.Active == true
                                       && p.StartDate < DateTime.Now
                     && (Null.IsNull(p.EndDate)
                     || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                     || p.EndDate > DateTime.Now)
                                      select p).ToList())
                {

                    string DateLink = item.OptionId == -1 ?
                        Globals.NavigateURL(TabId, "", "ProductId=" + item.ProductId.ToString()) :
                        Globals.NavigateURL(TabId, "", "ProductId=" + item.ProductId.ToString(), "OptionId=" + item.OptionId.ToString());



                    sb.AppendFormat(Localization.GetString("DiscountFormat_Date", LocalResourceFile),
                        item.Discount.ToString() + "%",
                        DateLink,
                        item.OptionId == -1 ? objProduct.Name : objProduct.Name + " (" + item.OptionName + ")",
                        item.StartDate.ToShortDateString());
                    if (!Null.IsNull(item.EndDate) && item.EndDate.Year != LocalUtils.GetMinDateTime().Year)
                    {
                        sb.AppendFormat(Localization.GetString("DiscountFormat_Expire", LocalResourceFile),
                        item.EndDate.ToShortDateString()
                        );
                    }
                    sb.AppendLine("<br/>");
                }

                //check global Date
                List<CP_Discount.Business.GlobalDateInfo> globalDateList =
                    (from p in CP_Discount.Business.GlobalDateController.GetByPortalAndUser(objProduct.PortalId, -1)
                     where p.Active == true
                     && (string.IsNullOrEmpty(p.Types) || p.Types.Split(',').Contains(objProduct.TypeId.ToString()))
                     && p.StartDate < DateTime.Now
                     && (Null.IsNull(p.EndDate)
                     || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                     || p.EndDate > DateTime.Now)
                     select p).ToList();

                foreach (var item in globalDateList)
                {
                    sb.AppendFormat(Localization.GetString("DiscountFormat_Date_Site", LocalResourceFile),
                        item.Discount.ToString() + "%",
                        item.StartDate.ToShortDateString());
                    if (!Null.IsNull(item.EndDate) && item.EndDate.Year != LocalUtils.GetMinDateTime().Year)
                    {
                        sb.AppendFormat(Localization.GetString("DiscountFormat_Expire", LocalResourceFile),
                        item.EndDate.ToShortDateString()
                        );
                    }
                    sb.AppendLine("<br/>");
                }

                //check vendor common Date
                List<CP_Discount.Business.GlobalDateInfo> vendorDateList =
                    (from p in CP_Discount.Business.GlobalDateController.GetByPortalAndUser(objProduct.PortalId, objProduct.UserId)
                     where p.Active == true
                      && (string.IsNullOrEmpty(p.Types) || p.Types.Split(',').Contains(objProduct.TypeId.ToString()))
                      && p.StartDate < DateTime.Now
                      && (Null.IsNull(p.EndDate)
                     || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                     || p.EndDate > DateTime.Now)
                     select p).ToList();

                foreach (var item in vendorDateList)
                {
                    sb.AppendFormat(Localization.GetString("DiscountFormat_Date_Vendor", LocalResourceFile),
                        item.Discount.ToString() + "%",
                        item.StartDate.ToShortDateString());
                    if (!Null.IsNull(item.EndDate) && item.EndDate.Year != LocalUtils.GetMinDateTime().Year)
                    {
                        sb.AppendFormat(Localization.GetString("DiscountFormat_Expire", LocalResourceFile),
                        item.EndDate.ToShortDateString()
                        );
                    }
                    sb.AppendLine("<br/>");
                }

                return sb.ToString();

            }
        }

        public string Discounts_Role
        {
            get
            {
                if (HasDiscounts_Role == false)
                {
                    return string.Empty;
                }
                else
                {
                    StringBuilder sb = new StringBuilder();

                    foreach (var item in (from p in CP_Discount.Business.RoleController.GetByProduct(ProductId)
                                          where p.Active == true
                                          && (p.StartDate < DateTime.Now && (Null.IsNull(p.EndDate)
                                          || p.EndDate > DateTime.Now))
                                          select p).ToList())
                    {

                        string productLink = item.OptionId == -1 ?
                            Globals.NavigateURL(TabId, "", "ProductId=" + item.ProductId.ToString()) :
                            Globals.NavigateURL(TabId, "", "ProductId=" + item.ProductId.ToString(), "OptionId=" + item.OptionId.ToString());



                        sb.AppendFormat(Localization.GetString("DiscountFormat_Role", LocalResourceFile),
                            item.Discount.ToString() + "%", item.RoleName,
                            productLink,
                            item.OptionId == -1 ? objProduct.Name : objProduct.Name + " (" + item.OptionName + ")"
                            );
                        if (!Null.IsNull(item.EndDate) && item.EndDate.Year != LocalUtils.GetMinDateTime().Year)
                        {
                            sb.AppendFormat(Localization.GetString("DiscountFormat_Expire", LocalResourceFile),
                            item.EndDate.ToShortDateString()
                            );
                        }
                        sb.AppendLine("<br/>");
                    }
                    //global role discount
                    List<CP_Discount.Business.GlobalRoleInfo> globalRoleList =
                       (from p in CP_Discount.Business.GlobalRoleController.GetByPortalAndUser(objProduct.PortalId, -1)
                        where p.Active == true
                         && (string.IsNullOrEmpty(p.Types) || p.Types.Split(',').Contains(objProduct.TypeId.ToString()))
                        && p.StartDate < DateTime.Now
                        && (Null.IsNull(p.EndDate)
                             || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                             || p.EndDate > DateTime.Now)
                        select p).ToList();

                    foreach (var item in globalRoleList)
                    {
                        sb.AppendFormat(Localization.GetString("DiscountFormat_Role_Site", LocalResourceFile),
                            item.Discount.ToString() + "%", item.RoleName);
                        if (!Null.IsNull(item.EndDate) && item.EndDate.Year != LocalUtils.GetMinDateTime().Year)
                        {
                            sb.AppendFormat(Localization.GetString("DiscountFormat_Expire", LocalResourceFile),
                            item.EndDate.ToShortDateString()
                            );
                        }
                        sb.AppendLine("<br/>");
                    }
                    //vendor role discount
                    List<CP_Discount.Business.GlobalRoleInfo> vendorRoleList =
                      (from p in CP_Discount.Business.GlobalRoleController.GetByPortalAndUser(objProduct.PortalId, objProduct.UserId)
                       where p.Active == true
                        && (string.IsNullOrEmpty(p.Types) || p.Types.Split(',').Contains(objProduct.TypeId.ToString()))
                       && p.StartDate < DateTime.Now
                       && (Null.IsNull(p.EndDate)
                            || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                            || p.EndDate > DateTime.Now)
                       select p).ToList();

                    foreach (var item in vendorRoleList)
                    {
                        sb.AppendFormat(Localization.GetString("DiscountFormat_Role_Vendor", LocalResourceFile),
                            item.Discount.ToString() + "%", item.RoleName);
                        if (!Null.IsNull(item.EndDate) && item.EndDate.Year != LocalUtils.GetMinDateTime().Year)
                        {
                            sb.AppendFormat(Localization.GetString("DiscountFormat_Expire", LocalResourceFile),
                            item.EndDate.ToShortDateString()
                            );
                        }
                        sb.AppendLine("<br/>");
                    }
                    return sb.ToString();
                }
            }
        }

        /// <summary>
        /// if there is any role discount which belong to current product
        /// </summary>
        public bool HasDiscounts_Role
        {
            get
            {
                if ((from p in CP_Discount.Business.RoleController.GetByProduct(ProductId)
                     where p.Active == true
                     && (p.StartDate < DateTime.Now && (Null.IsNull(p.EndDate)
                     || p.EndDate > DateTime.Now))
                     select p).ToList().Count > 0)
                {
                    return true;
                }

                List<CP_Discount.Business.GlobalRoleInfo> globalRoleList =
                       (from p in CP_Discount.Business.GlobalRoleController.GetByPortalAndUser(objProduct.PortalId, -1)
                        where p.Active == true
                         && (string.IsNullOrEmpty(p.Types) || p.Types.Split(',').Contains(objProduct.TypeId.ToString()))
                        && p.StartDate < DateTime.Now
                        && (Null.IsNull(p.EndDate)
                             || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                             || p.EndDate > DateTime.Now)
                        select p).ToList();

                if (globalRoleList.Count>0)
                {
                    return true;
                }

                List<CP_Discount.Business.GlobalRoleInfo> vendorRoleList =
                        (from p in CP_Discount.Business.GlobalRoleController.GetByPortalAndUser(objProduct.PortalId, objProduct.UserId)
                         where p.Active == true
                          && (string.IsNullOrEmpty(p.Types) || p.Types.Split(',').Contains(objProduct.TypeId.ToString()))
                         && p.StartDate < DateTime.Now
                         && (Null.IsNull(p.EndDate)
                              || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                              || p.EndDate > DateTime.Now)
                         select p).ToList();

                if (vendorRoleList.Count > 0)
                {
                    return true;
                }

                return false;
            }
        }
        /// <summary>
        /// if there is any quantity discount which belong to current product
        /// </summary>
        public bool HasDiscounts_Quantity
        {
            get
            {
                if ((from p in CP_Discount.Business.QuantityController.GetByProduct(ProductId)
                     where p.Active == true
                     && (p.StartDate < DateTime.Now && (Null.IsNull(p.EndDate)
                     || p.EndDate > DateTime.Now))
                     select p).ToList().Count > 0)
                {
                    return true;
                }

                return false;
            }
        }
        /// <summary>
        /// if there is any customer discount which belong to current product
        /// </summary>
        public bool HasDiscounts_Customer
        {
            get
            {
                if (UserId == -1)
                {
                    return false;
                }
                if ((from p in CP_Discount.Business.CustomerController.GetByProduct(ProductId)
                     where p.Active == true
                     && p.CustomerId == UserId
                     && (p.StartDate < DateTime.Now && (Null.IsNull(p.EndDate)
                     || p.EndDate > DateTime.Now))
                     select p).ToList().Count > 0)
                {
                    return true;
                }

                return false;
            }
        }
        public bool HasDiscounts_FirstBuyer
        {
            get
            {
                //计算First customer discount
                List<CP_Discount.Business.FirstCustomerInfo> firstCustomerDiscountList =
                    (from p in CP_Discount.Business.FirstCustomerController.GetByProduct(ProductId)
                     where p.Active == true
                     && p.StartDate < DateTime.Now
                     && (Null.IsNull(p.EndDate)
                     || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                     || p.EndDate > DateTime.Now)
                     select p).ToList();
                if (firstCustomerDiscountList.Count > 0)
                {
                    return true;
                }

                return false;
            }
        }
        /// <summary>
        /// if there is any public coupons which belong to current product
        /// </summary>
        public bool HasDiscounts_Coupon_Public
        {
            get
            {
                if ((from p in CP_Discount.Business.CouponController.GetByProduct(ProductId)
                     where p.Active == true
                     && p.IsPublic == true
                     && (p.StartDate < DateTime.Now && (Null.IsNull(p.EndDate)
                     || p.EndDate > DateTime.Now))
                     select p).ToList().Count > 0)
                {
                    return true;
                }

                //check global coupon
                List<CP_Discount.Business.GlobalCouponInfo> globalCouponList =
                    (from p in CP_Discount.Business.GlobalCouponController.GetByPortalAndUser(objProduct.PortalId, -1)
                     where p.Active == true
                     && p.IsPublic == true
                     && (string.IsNullOrEmpty(p.Types) || p.Types.Split(',').Contains(objProduct.TypeId.ToString()))
                     && p.StartDate < DateTime.Now
                     && (Null.IsNull(p.EndDate)
                     || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                     || p.EndDate > DateTime.Now)
                     select p).ToList();
                if (globalCouponList.Count > 0)
                {
                    return true;
                }

                //check vendor common coupon
                List<CP_Discount.Business.GlobalCouponInfo> vendorCouponList =
                    (from p in CP_Discount.Business.GlobalCouponController.GetByPortalAndUser(objProduct.PortalId, objProduct.UserId)
                     where p.Active == true
                     && p.IsPublic == true
                      && (string.IsNullOrEmpty(p.Types) || p.Types.Split(',').Contains(objProduct.TypeId.ToString()))
                      && p.StartDate < DateTime.Now
                      && (Null.IsNull(p.EndDate)
                     || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                     || p.EndDate > DateTime.Now)
                     select p).ToList();

                if (vendorCouponList.Count > 0)
                {
                    return true;
                }

                return false;
            }
        }
        /// <summary>
        /// if there is any coupons (public and private) which belong to current product
        /// </summary>
        public bool HasDiscounts_Coupon_All
        {
            get
            {
                if ((from p in CP_Discount.Business.CouponController.GetByProduct(ProductId)
                     where p.Active == true
                     && (p.StartDate < DateTime.Now && (Null.IsNull(p.EndDate)
                     || p.EndDate > DateTime.Now))
                     select p).ToList().Count > 0)
                {
                    return true;
                }

                //check global coupon
                List<CP_Discount.Business.GlobalCouponInfo> globalCouponList =
                    (from p in CP_Discount.Business.GlobalCouponController.GetByPortalAndUser(objProduct.PortalId, -1)
                     where p.Active == true
                     && (string.IsNullOrEmpty(p.Types) || p.Types.Split(',').Contains(objProduct.TypeId.ToString()))
                     && p.StartDate < DateTime.Now
                     && (Null.IsNull(p.EndDate)
                     || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                     || p.EndDate > DateTime.Now)
                     select p).ToList();
                if (globalCouponList.Count > 0)
                {
                    return true;
                }

                //check vendor common coupon
                List<CP_Discount.Business.GlobalCouponInfo> vendorCouponList =
                    (from p in CP_Discount.Business.GlobalCouponController.GetByPortalAndUser(objProduct.PortalId, objProduct.UserId)
                     where p.Active == true
                      && (string.IsNullOrEmpty(p.Types) || p.Types.Split(',').Contains(objProduct.TypeId.ToString()))
                      && p.StartDate < DateTime.Now
                      && (Null.IsNull(p.EndDate)
                     || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                     || p.EndDate > DateTime.Now)
                     select p).ToList();

                if (vendorCouponList.Count > 0)
                {
                    return true;
                }

                return false;
            }
        }

        /// <summary>
        /// if there is any Dates (public and private) which belong to current product
        /// </summary>
        public bool HasDiscounts_Date
        {
            get
            {
                //date discount, 首先计算product specific date discount
                List<CP_Discount.Business.DateInfo> dateDiscountList = (from p in CP_Discount.Business.DateController.GetByProduct(ProductId)
                                                                        where p.Active == true
                                                                        && p.StartDate < DateTime.Now
                                                                        && (Null.IsNull(p.EndDate)
                                                                        || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                                                                        || p.EndDate > DateTime.Now)
                                                                        select p).ToList();
                if (dateDiscountList.Count > 0)
                {
                    return true;
                }

                //check global Date
                List<CP_Discount.Business.GlobalDateInfo> globalDateList =
                    (from p in CP_Discount.Business.GlobalDateController.GetByPortalAndUser(objProduct.PortalId, -1)
                     where p.Active == true
                     && (string.IsNullOrEmpty(p.Types) || p.Types.Split(',').Contains(objProduct.TypeId.ToString()))
                     && p.StartDate < DateTime.Now
                     && (Null.IsNull(p.EndDate)
                     || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                     || p.EndDate > DateTime.Now)
                     select p).ToList();
                if (globalDateList.Count > 0)
                {
                    return true;
                }

                //check vendor common Date
                List<CP_Discount.Business.GlobalDateInfo> vendorDateList =
                    (from p in CP_Discount.Business.GlobalDateController.GetByPortalAndUser(objProduct.PortalId, objProduct.UserId)
                     where p.Active == true
                      && (string.IsNullOrEmpty(p.Types) || p.Types.Split(',').Contains(objProduct.TypeId.ToString()))
                      && p.StartDate < DateTime.Now
                      && (Null.IsNull(p.EndDate)
                     || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                     || p.EndDate > DateTime.Now)
                     select p).ToList();

                if (vendorDateList.Count > 0)
                {
                    return true;
                }

                return false;
            }
        }
        #region variant
        public List<VariantGroupInfo> VariantGroupList
        {
            get
            {
                List<VariantGroupInfo> list = VariantGroupController.GetByType(objType.Id).ToList();
                foreach (var item in list)
                {
                    LocalizeObject_VariantGroup(item);
                }
                return list;
            }
        }
        public string VariantGroupName_1
        {
            get
            {
                if (VariantGroupList.Count > 0)
                {
                    return VariantGroupList[0].Name;
                }
                return "";
            }
        }
        public string VariantGroupName_2
        {
            get
            {
                if (VariantGroupList.Count > 1)
                {
                    return VariantGroupList[1].Name;
                }
                return "";
            }
        }
        public string VariantGroupName_3
        {
            get
            {
                if (VariantGroupList.Count > 2)
                {
                    return VariantGroupList[2].Name;
                }
                return "";
            }
        }
        public string VariantGroupName_4
        {
            get
            {
                if (VariantGroupList.Count > 3)
                {
                    return VariantGroupList[3].Name;
                }
                return "";
            }
        }
        public string VariantGroupName_5
        {
            get
            {
                if (VariantGroupList.Count > 4)
                {
                    return VariantGroupList[4].Name;
                }
                return "";
            }
        }
        public bool HasVariant_1
        {
            get
            {
                if (Settings_Detail.Order.ShowVariantList && VariantGroupList.Count > 0)
                {
                    List<VariantInfo> list = (from p in VariantController.GetByGroupAndProduct(VariantGroupList[0].Id, ProductId)
                                              where p.Active==true select p).ToList();
                    if (list.Count > 0)
                    {
                        return true;
                    }
                }
                return false;
            }
        }
        public bool HasVariant_2
        {
            get
            {
                if (Settings_Detail.Order.ShowVariantList && VariantGroupList.Count > 1)
                {
                    List<VariantInfo> list = (from p in VariantController.GetByGroupAndProduct(VariantGroupList[1].Id, ProductId)
                                              where p.Active == true
                                              select p).ToList();
                    if (list.Count > 0)
                    {
                        return true;
                    }
                }
                return false;
            }
        }
        public bool HasVariant_3
        {
            get
            {
                if (Settings_Detail.Order.ShowVariantList && VariantGroupList.Count > 2)
                {
                    List<VariantInfo> list = (from p in VariantController.GetByGroupAndProduct(VariantGroupList[2].Id, ProductId)
                                              where p.Active == true
                                              select p).ToList();
                    if (list.Count > 0)
                    {
                        return true;
                    }
                }
                return false;
            }
        }
        public bool HasVariant_4
        {
            get
            {
                if (Settings_Detail.Order.ShowVariantList && VariantGroupList.Count > 3)
                {
                    List<VariantInfo> list = (from p in VariantController.GetByGroupAndProduct(VariantGroupList[3].Id, ProductId)
                                              where p.Active == true
                                              select p).ToList();
                    if (list.Count > 0)
                    {
                        return true;
                    }
                }
                return false;
            }
        }
        public bool HasVariant_5
        {
            get
            {
                if (Settings_Detail.Order.ShowVariantList && VariantGroupList.Count > 4)
                {
                    List<VariantInfo> list = (from p in VariantController.GetByGroupAndProduct(VariantGroupList[4].Id, ProductId)
                                              where p.Active == true
                                              select p).ToList();
                    if (list.Count > 0)
                    {
                        return true;
                    }
                }
                return false;
            }
        }
        private void BindVariantList()
        {
            if (Settings_Detail.Order.ShowVariantList == false)
            {
                return;
            }
            List<VariantInfo> list = new List<VariantInfo>();
            //rblVariant_1
            if (VariantGroupList.Count > 0)
            {
                list = (from p in VariantController.GetByGroupAndProduct(VariantGroupList[0].Id, ProductId)
                        where p.Active == true
                        select p).ToList();

                if (list.Count>0)
                {
                    foreach (var item in GetVariantListItems(list))
                    {
                        rblVariant_1.Items.Add(item);
                    }
                    rblVariant_1.DataBind();
                }
               
            }
            // rblVariant_2
            if (VariantGroupList.Count > 1)
            {
                list = (from p in VariantController.GetByGroupAndProduct(VariantGroupList[1].Id, ProductId)
                        where p.Active == true
                        select p).ToList();
                if (list.Count > 0)
                {
                    foreach (var item in GetVariantListItems(list))
                    {
                        rblVariant_2.Items.Add(item);
                    }
                    rblVariant_2.DataBind();
                }
            }
            // rblVariant_3
            if (VariantGroupList.Count > 2)
            {
                list = (from p in VariantController.GetByGroupAndProduct(VariantGroupList[2].Id, ProductId)
                        where p.Active == true
                        select p).ToList();

                if (list.Count > 0)
                {
                    foreach (var item in GetVariantListItems(list))
                    {
                        rblVariant_3.Items.Add(item);
                    }
                    rblVariant_3.DataBind();
                }
            }
            // rblVariant_4
            if (VariantGroupList.Count > 3)
            {
                list = (from p in VariantController.GetByGroupAndProduct(VariantGroupList[3].Id, ProductId)
                        where p.Active == true
                        select p).ToList();
                if (list.Count > 0)
                {
                    foreach (var item in GetVariantListItems(list))
                    {
                        rblVariant_4.Items.Add(item);
                    }
                    rblVariant_4.DataBind();
                }
            }
            // rblVariant_5
            if (VariantGroupList.Count > 4)
            {
                list = (from p in VariantController.GetByGroupAndProduct(VariantGroupList[4].Id, ProductId)
                        where p.Active == true
                        select p).ToList();

                if (list.Count > 0)
                {
                    foreach (var item in GetVariantListItems(list))
                    {
                        rblVariant_5.Items.Add(item);
                    }
                    rblVariant_5.DataBind();
                }
            }
        }

        private List<ListItem> GetVariantListItems(List<VariantInfo> list)
        {
            List<ListItem> items = new List<ListItem>();
            foreach (var item in list)
            {
                LocalizeObject_Variant(item);
            }
            //do we have a default variant value specified?
            bool hasDefault = false;
            if ((from p in list where p.IsDefault == true select p).ToList().Count > 0)
            {
                hasDefault = true;
            }
            for (int i = 0; i < list.Count; i++)
            {
                string name = list[i].Name;
                if (list[i].BonusPrice>0 && list[i].BonusPrice.ToString().StartsWith("+")==false)
                {
                    name += " (+" + list[i].BonusPrice.ToString() + ")";
                }
                if (list[i].BonusPrice < 0)
                {
                    name += " (" + list[i].BonusPrice.ToString() + ")";
                }
                ListItem li = new ListItem(name, list[i].Id.ToString());
                if (hasDefault)
                {
                    if (list[i].IsDefault == true)
                    {
                        li.Selected = true;
                    }
                }
                else
                {
                    if (i == 0)//if no default value, we will take the first one
                    {
                        li.Selected = true;
                    }
                }
                items.Add(li);
            }
            return items;
        }

        #endregion
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
        public string PriceCss
        {
            get
            {
                if (objProduct.PromoPriceAvailable)
                {
                    return "Line-through";
                }
                return "NormalRed";
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
                        Settings_Portal.Order.CurrencySymbol,objProduct.FixedShippingFee.ToString());
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
                  //  && !string.IsNullOrEmpty(Settings_Portal.GoogleMap.GoogleMapAccessKey)
                    && !string.IsNullOrEmpty(objProduct.Longitude)
                    && !string.IsNullOrEmpty(objProduct.Latitude))
                {
                    return true;
                }
                return false;
            }
        }

        public bool ShowOptionList
        {
            get
            {
                if (Settings_Detail.Order.ShowOptionList)
                {
                    if (OptionController.GetByProduct(ProductId, true).Count > 0)
                    {
                        return true;
                    }
                }
                return false;
            }
        }
        public bool Sellable
        {
            get
            {
                return true;
            }
        }

        public bool ShowTransactionHistory
        {
            get
            {
                int totalItem = 0;
                if (Sellable && Settings_Detail.TransactionHistory.ShowTransactionHistory)
                {
                    //不显示空交易记录或者已经有交易记录
                    if (!Settings_Detail.TransactionHistory.HideEmptyTransactionHistory ||
                        OrderDetailController.GetByProduct(ProductId, Convert.ToInt32(OrderStatus.Paid), 10, 0, ref totalItem).Count() > 0)
                    {
                        return true;
                    }
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

        public string GetShortDate(DateTime dateTime)
        {
            if (Null.IsNull(dateTime))
            {
                return "";
            }
            return dateTime.ToShortDateString();
        }
        #region Event handler
        protected void Page_Load(object sender, EventArgs e)
        {

            if (ProductId == -1 || objProduct == null)
            {
                return;
            }

            RegisterScriptAndCss();
            ctlRating.ResourceFile = LocalUtils.ResourcesFile_Shared;
            ctlComment.ResourceFile = LocalUtils.ResourcesFile_Shared;
            ctlTransactionHistory.ResourceFile = LocalUtils.ResourcesFile_Shared;
            this.LocalResourceFile = Localization.GetResourceFile(this, "ProductDetail.ascx");
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
                BindOptionList();
                BindVariantList();
                BindTransactionHistory();
                if (UserInfo.UserID != -1)
                {
                    txtName.Text = UserInfo.DisplayName;
                    txtEmail.Text = UserInfo.Email;
                }
                //传入quantity 参数
                if (Quantity != -1 && Quantity > objProduct.MinSellQuantity)
                {
                    txtOrderCount.Text = Quantity.ToString();
                }
                else
                {
                    if (objProduct.MinSellQuantity > 0)
                    {
                        txtOrderCount.Text = objProduct.MinSellQuantity.ToString();
                    }
                }
                if (objProduct.StockQuantity == 0)
                {
                    lblOutOfStock.Visible = true;
                }
                DataBind();
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
            LocalizeObject_UDField(objUDField);
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
            StringBuilder sb = new StringBuilder();
         
            //Jquery ui
            //sb.AppendFormat("<script type=\"text/javascript\" src=\"{0}/js/jquery-ui.min.1.8.16.js\"></script>{1}",
            //        FullDomainName + "/DesktopModules/CrossClassified", "\r\n");

            //Jquery ui
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


        private void BindOptionList()
        {
            if (ShowOptionList)
            {
                rblOption.Items.Clear();
                List<OptionInfo> list = OptionController.GetByProduct(ProductId, true);
                foreach (var item in list)
                {
                    LocalizeObject_Option(item);
                }
                decimal price = objProduct.CurrentPrice;
                foreach (OptionInfo item in list)
                {
                   
                    ListItem li = new
                        ListItem(Settings_Portal.Order.CurrencySymbol + (price + item.BonusPrice).ToString() + "   " + item.Name + 
                        (item.StockQuantity>0?" (" + Localization.GetString("lblStockQuantity",LocalResourceFile) +" "+ item.StockQuantity.ToString() +" )":"")
                        + " : " + item.Description, item.Id.ToString());
                    if (item.IsDefault)
                    {
                        li.Selected = true;
                    }
                    rblOption.Items.Add(li);
                }
                rblOption.DataBind();
                // when there is a optionid pass, we should auto select it
                if (OptionId != -1 && rblOption.Items.FindByValue(OptionId.ToString()) != null)
                {
                    rblOption.SelectedIndex = -1;
                    rblOption.SelectedValue = OptionId.ToString();
                }
            }
        }
        private void BindTransactionHistory()
        {
            if (ShowTransactionHistory)
            {
                int totalItem = 0;
                grTransactionHistory.DataSource = OrderDetailController.GetByProduct(ProductId, Convert.ToInt32(OrderStatus.Paid),
                    Settings_Detail.TransactionHistory.TransactionPerPage, ctlTransactionHistory.CurrentPage, ref totalItem);
                grTransactionHistory.DataBind();

                ctlTransactionHistory.RecordCount = totalItem;
                ctlTransactionHistory.PageSize = Settings_Detail.TransactionHistory.TransactionPerPage;
                ctlTransactionHistory.Span = 3;
            }
        }
        protected void grTransactionHistory_DataBinding(object sender, EventArgs e)
        {
            if (grTransactionHistory.Columns[3] != null)//price
            {
                grTransactionHistory.Columns[3].Visible = Settings_Detail.TransactionHistory.ShowPriceInTransaction;
            }
            if (grTransactionHistory.Columns[4] != null)//date
            {
                grTransactionHistory.Columns[4].Visible = Settings_Detail.TransactionHistory.ShowDateInTransaction;
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
                tab=GetSubModulePageId_List(objType.Id);
            }
           
            else
            {
                tab = GetSubModulePageId_VendorProfile(objType.Id);
            }
            return Globals.NavigateURL(tab, "", "ProductUserId=" + userId, "ProductTypeId=" + objType.Id);
        }

        private void BindRating()
        {
            //当前属于可以销售产品或者产品设置允许rating
            if (Settings_Portal.Rating.AllowRating && Settings_Detail.Rating.ShowRating && (Sellable || objProduct.AllowRating))
            {
                int totalRecords = 0;
                dlRating.DataSource = RatingController.GetByProduct(ProductId, Settings_Detail.Rating.RatingRowCount, ctlRating.CurrentPage, ref totalRecords);
                dlRating.DataBind();

                ctlRating.PageSize = Settings_Detail.Rating.RatingRowCount;
                ctlRating.RecordCount = totalRecords;
                ctlRating.Span = 3;

                //Load rating
                lblVotes.Text = objProduct.RatingVotes.ToString();
                string imgRating = Settings_Detail.Rating.RatingImage;
                imgAverage.ImageUrl = LocalUtils.ModuleRootPath + "images/ratings/" + imgRating + "/" + imgRating + objProduct.RatingAverage.ToString() + ".gif";

                rblRating.SelectedValue = "10";
                if (UserId != -1)//当前已登录
                {
                    List<RatingInfo> list = RatingController.GetByClient(UserId, ProductId);
                    if (list.Count > 0)//首先检查当前用户是否已经rating过
                    {
                        rblRating.SelectedValue = Convert.ToString(list[0].Rating);
                        txtRatingInfo.Text = list[0].Info;
                    }
                }
                //Detemine whether the use has rights to rating

                lblBuyBeforeRating.Visible = false;
                lblRatingNeedLoggedIn.Visible = false;
                if (Sellable)
                {
                    lblBuyBeforeRating.Visible = true;
                    lblRatingNeedLoggedIn.Visible = false;
                }
                else
                {
                    if (PortalSecurity.IsInRoles(PortalSettings.AdministratorRoleName) || Cross.DNN.Common.Utility.Utils.HasRolePermission(objProduct.RatingRoles))
                    {
                        lblRatingNeedLoggedIn.Visible = false;
                    }
                    else
                    {
                        lblRatingNeedLoggedIn.Visible = true;
                    }
                }
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

      

        protected void btnPost_Click(object sender, System.EventArgs e)
        {
          // hidLastTab.Value = "#divRating";
            if (Sellable)//当前支持购买,则仅有购买过该产品的人能rating
            {
                if (OrderDetailController.GetByProductAndClient(ProductId, UserId).Count < 1)
                {
                    return;
                }
            }
            //无权rating
            if (!(PortalSecurity.IsInRoles(PortalSettings.AdministratorRoleName) || Cross.DNN.Common.Utility.Utils.HasRolePermission(objProduct.RatingRoles)))
            {
                return;
            }

            if (rblRating.SelectedIndex != -1)
            {
                RatingInfo objRating = new RatingInfo();
                if (UserId != -1)//当前已登录
                {
                    List<RatingInfo> list = RatingController.GetByClient(UserId, ProductId);
                    if (list.Count > 0)//首先检查当前用户是否已经rating过
                    {
                        objRating = list[0];
                        objRating.Rating = Convert.ToInt32(rblRating.SelectedValue.ToString());
                        objRating.UpdatedDate = DateTime.Now;
                        objRating.Info = txtRatingInfo.Text;
                        RatingController.Update(objRating);
                    }
                    else
                    {
                        objRating.ProductId = ProductId;
                        objRating.ProductName = objProduct.Name;
                        objRating.ClientId = UserId;
                        objRating.ClientName = UserInfo.Username;
                        objRating.VendorId = objProduct.UserId;
                        objRating.VendorName = objProduct.UserName;
                        objRating.UpdatedDate = DateTime.Now;
                        objRating.Info = txtRatingInfo.Text;
                        objRating.Rating = Convert.ToInt32(rblRating.SelectedValue.ToString());
                        RatingController.Add(objRating);
                    }
                }
                else
                {
                    objRating.ProductId = ProductId;
                    objRating.ProductName = objProduct.Name;
                    objRating.VendorId = objProduct.UserId;
                    objRating.VendorName = objProduct.UserName;
                    objRating.ClientId = -1;
                    objRating.ClientName = Localization.GetString("Anonymous", LocalResourceFile);
                    objRating.UpdatedDate = DateTime.Now;
                    objRating.Info = txtRatingInfo.Text;
                    objRating.Rating = Convert.ToInt32(rblRating.SelectedValue.ToString());
                    RatingController.Add(objRating);
                }
                BindRating();
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
        protected void ctlTransactionHistory_PageChanged(object sender, EventArgs e)
        {
          //  hidLastTab.Value = "#divTransactionHistory";
            BindTransactionHistory();
        }

        protected void ctlComment_PageChanged(object sender, EventArgs e)
        {
          //  hidLastTab.Value = "#divComment";
            BindComment();
        }
        protected void ctlRating_PageChanged(object sender, EventArgs e)
        {
         //   hidLastTab.Value = "#divRating";
            BindRating();
        }
        #endregion

        protected string GetRatingImage(string productId)
        {
            ProductInfo objProduct = ProductController.Get(Convert.ToInt32(productId));
            string imgRating = Settings_Detail.Rating.RatingImage;
            return LocalUtils.ModuleRootPath + "images/ratings/" + imgRating + "/" + imgRating + objProduct.RatingAverage.ToString() + ".gif";
        }

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
            AddToCart(true);

        }
        private void AddToCart(bool redirect)
        {
            lblAddSuccess.Visible = false;
            LoginFirst();
            if (!QuantityValid())
            {
                return;
            }
            if (!CouponValid())
            {
                return;
            }
            if (!RoleValid())
            {
                return;
            }
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
            objCart.OrderMemo = txtOrderMemo.Text;
            objCart.Coupon = txtCoupon.Text.Trim();
            if (Settings_Detail.Order.ShowOrderCount)
            {
                objCart.Quantity = Convert.ToInt32(txtOrderCount.Text);
            }
            else
            {
                objCart.Quantity = 1;
            }
            objCart.UnitPrice = objProduct.CurrentPrice;
            if (ShowOptionList && rblOption.SelectedItem != null)
            {
                objCart.OptionId = Convert.ToInt32(rblOption.SelectedValue);
                OptionInfo objOption = OptionController.Get(objCart.OptionId);
                objCart.OptionName = objOption.Name;
                objCart.UnitPrice = objProduct.CurrentPrice + objOption.BonusPrice;
            }
            else
            {
                objCart.OptionId = -1;
                objCart.OptionName = "";
            }

            //处理variant and variant price

            int variantId_1 = -1;
            int variantId_2 = -1;
            int variantId_3 = -1;
            int variantId_4 = -1;
            int variantId_5 = -1;

            string variantId = string.Empty;
            string variantValue = string.Empty;

            VariantInfo objVariant = new VariantInfo();
            if (HasVariant_1)
            {
                if (rblVariant_1.Items.Count > 0 && rblVariant_1.SelectedItem != null)
                {
                    variantId_1 = Convert.ToInt32(rblVariant_1.SelectedItem.Value);
                    objVariant = VariantController.Get(variantId_1);
                    if (objVariant != null)
                    {
                        objCart.UnitPrice += objVariant.BonusPrice;
                        if (string.IsNullOrEmpty(variantId))
                        {
                            variantId += variantId_1.ToString();
                            variantValue += VariantGroupName_1 + " : " + rblVariant_1.SelectedItem.Text;
                        }
                        else
                        {
                            variantId += "," + variantId_1.ToString();
                            variantValue += "  " + VariantGroupName_1 + " : " + rblVariant_1.SelectedItem.Text;
                        }
                    }
                }
            }
            if (HasVariant_2)
            {
                if (rblVariant_2.Items.Count > 0 && rblVariant_2.SelectedItem != null)
                {
                    variantId_2 = Convert.ToInt32(rblVariant_2.SelectedItem.Value);
                    objVariant = VariantController.Get(variantId_2);
                    if (objVariant != null)
                    {
                        objCart.UnitPrice += objVariant.BonusPrice;
                        if (string.IsNullOrEmpty(variantId))
                        {
                            variantId += variantId_2.ToString();
                            variantValue += VariantGroupName_2 + " : " + rblVariant_2.SelectedItem.Text;
                        }
                        else
                        {
                            variantId += "," + variantId_2.ToString();
                            variantValue += "  " + VariantGroupName_2 + " : " + rblVariant_2.SelectedItem.Text;
                        }
                    }
                }
            }
            if (HasVariant_3)
            {
                if (rblVariant_3.Items.Count > 0 && rblVariant_3.SelectedItem != null)
                {
                    variantId_3 = Convert.ToInt32(rblVariant_3.SelectedItem.Value);
                    objVariant = VariantController.Get(variantId_3);
                    if (objVariant != null)
                    {
                        objCart.UnitPrice += objVariant.BonusPrice;
                        if (string.IsNullOrEmpty(variantId))
                        {
                            variantId += variantId_3.ToString();
                            variantValue += VariantGroupName_3 + " : " + rblVariant_3.SelectedItem.Text;
                        }
                        else
                        {
                            variantId += "," + variantId_3.ToString();
                            variantValue += "  " + VariantGroupName_3 + " : " + rblVariant_3.SelectedItem.Text;
                        }
                    }
                }
            }
            if (HasVariant_4)
            {
                if (rblVariant_4.Items.Count > 0 && rblVariant_4.SelectedItem != null)
                {
                    variantId_4 = Convert.ToInt32(rblVariant_4.SelectedItem.Value);
                    objVariant = VariantController.Get(variantId_4);
                    if (objVariant != null)
                    {
                        objCart.UnitPrice += objVariant.BonusPrice;
                        if (string.IsNullOrEmpty(variantId))
                        {
                            variantId += variantId_4.ToString();
                            variantValue += VariantGroupName_4 + " : " + rblVariant_4.SelectedItem.Text;
                        }
                        else
                        {
                            variantId += "," + variantId_4.ToString();
                            variantValue += "  " + VariantGroupName_4 + " : " + rblVariant_4.SelectedItem.Text;
                        }
                    }
                }
            }
            if (HasVariant_5)
            {
                if (rblVariant_5.Items.Count > 0 && rblVariant_5.SelectedItem != null)
                {
                    variantId_5 = Convert.ToInt32(rblVariant_5.SelectedItem.Value);
                    objVariant = VariantController.Get(variantId_5);
                    if (objVariant != null)
                    {
                        objCart.UnitPrice += objVariant.BonusPrice;
                        if (string.IsNullOrEmpty(variantId))
                        {
                            variantId += variantId_5.ToString();
                            variantValue += VariantGroupName_5 + " : " + rblVariant_5.SelectedItem.Text;
                        }
                        else
                        {
                            variantId += "," + variantId_5.ToString();
                            variantValue += "  " + VariantGroupName_5 + " : " + rblVariant_5.SelectedItem.Text;
                        }
                    }
                }
            }
            //variant price 已经加到 cart.unitprice 里面
            if (!string.IsNullOrEmpty(variantId)) // 这个判断语句是否太小心了，其实没必要
            {
                objCart.VariantId = Utils.RemoveSeperator(variantId, ",");
                objCart.VariantValue = variantValue;
            }
            else
            {
                objCart.VariantId = string.Empty;
                objCart.VariantValue = string.Empty;
            }
           

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
                objCart.TaxFee = objCart.UnitPrice * objCart.Quantity * objProduct.FixedTaxRate / 100;
            }


            objCart.ItemSum = (objCart.UnitPrice * objCart.Quantity) + objCart.ShipFee + objCart.TaxFee;

            int cartId = CartController.Add(objCart);

            if (redirect)
            {
                Response.Redirect(Globals.NavigateURL(GetSubModulePageId_Buyer(), "", "mid=" + GetSubModuleId_Buyer(),
                    "ctl=UserBuyer_Cart"), true);
            }
            else
            {
                lblAddSuccess.Visible = true;
            }
        }
        private bool QuantityValid()
        {
            lblInvalidQuantity.Visible = false;
            if (Settings_Detail.Order.ShowOrderCount)
            {
                if (!Utils.IsNumber(txtOrderCount.Text))
                {
                    lblInvalidQuantity.Visible = true;
                    return false;
                }
                //first we check the minimum sell quanity
                if (objProduct.MinSellQuantity > 0 && Convert.ToInt32(txtOrderCount.Text) < objProduct.MinSellQuantity)
                {
                    lblInvalidQuantity.Visible = true;
                    return false;
                }
                //check option
                if (ShowOptionList && rblOption.SelectedItem != null)
                {
                    int optionId = Convert.ToInt32(rblOption.SelectedValue);
                    OptionInfo objOption = OptionController.Get(optionId);
                    if (objOption.StockQuantity != -1 && Convert.ToInt32(txtOrderCount.Text) > objOption.StockQuantity)
                    {
                        lblInvalidQuantity.Visible = true;
                        return false;
                    }
                }
                //check product
                if ((objProduct.StockQuantity != -1) && Convert.ToInt32(txtOrderCount.Text) > objProduct.StockQuantity)
                {
                    lblInvalidQuantity.Visible = true;
                    return false;
                }
            }
            return true;
        }
        private bool CouponValid()
        {
            lblInvalidCoupon.Visible = false;
            string coupon = txtCoupon.Text.Trim().ToUpper();
            if (string.IsNullOrEmpty(coupon))
            {
                return true;
            }
            if (HasDiscounts_Coupon_All && Sellable && !string.IsNullOrEmpty(coupon))
            {
                int optionId = -1;
                if (ShowOptionList && rblOption.SelectedItem != null)
                {
                    optionId = Convert.ToInt32(rblOption.SelectedValue);
                }

                List<CP_Discount.Business.CouponInfo> productCouponList
                    = (from p in CP_Discount.Business.CouponController.GetByProduct(ProductId)
                       where p.Active == true
                       && p.OptionId == optionId
                        && p.Coupon.Trim().ToUpper() == coupon
                       && (p.StartDate < DateTime.Now && (Null.IsNull(p.EndDate)
                       || p.EndDate > DateTime.Now))
                       select p).ToList();

                //coupon doesn't exist in records, note we need check option id too
                if (productCouponList.Count > 0)
                {
                    return true;
                }

                //check global coupon
                List<CP_Discount.Business.GlobalCouponInfo> globalCouponList =
                    (from p in CP_Discount.Business.GlobalCouponController.GetByPortalAndUser(objProduct.PortalId, -1)
                     where p.Active == true
                     && p.Coupon.ToUpper() == coupon // coupon is case insenstive
                     && (string.IsNullOrEmpty(p.Types) || p.Types.Split(',').Contains(objProduct.TypeId.ToString()))
                     && p.StartDate < DateTime.Now
                     && (Null.IsNull(p.EndDate)
                     || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                     || p.EndDate > DateTime.Now)
                     select p).ToList();
                if (productCouponList.Count > 0)
                {
                    return true;
                }

                //check vendor common coupon
                List<CP_Discount.Business.GlobalCouponInfo> vendorCouponList =
                    (from p in CP_Discount.Business.GlobalCouponController.GetByPortalAndUser(objProduct.PortalId, objProduct.UserId)
                     where p.Active == true
                     && p.Coupon.ToUpper() == coupon // coupon is case insenstive
                      && (string.IsNullOrEmpty(p.Types) || p.Types.Split(',').Contains(objProduct.TypeId.ToString()))
                      && p.StartDate < DateTime.Now
                      && (Null.IsNull(p.EndDate)
                     || p.EndDate.Year == LocalUtils.GetMinDateTime().Year
                     || p.EndDate > DateTime.Now)
                     select p).ToList();

                if (vendorCouponList.Count > 0)
                {
                    return true;
                }
                lblInvalidCoupon.Visible = true;
                return false;
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
        /// <summary>
        /// check if user already in this role and its expire date is empty.
        /// </summary>
        /// <returns></returns>
        private bool RoleValid()
        {
            lblAlreadyInRole.Visible = false;
            lblSiteAdministrator.Visible = false;
            if (objType.SellType == Convert.ToInt32(SellType.Role))
            {
                int roleId = objProduct.RoleAfterOrder;
                if (rblOption.SelectedItem != null)
                {
                    OptionInfo objOption = OptionController.Get(Convert.ToInt32(rblOption.SelectedItem.Value));
                    if (objOption != null)
                    {
                        roleId = objOption.RoleAfterOrder;
                    }
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
        protected void btnAddCart_Click(object sender, CommandEventArgs e)
        {
            AddToCart(false);
        }
        protected void btnAddWatch_Click(object sender, CommandEventArgs e)
        {
            lblInvalidQuantity.Visible = false;
            lblAddSuccess.Visible = false;
            lblInvalidCoupon.Visible = false;
            LoginFirst();
            //add before
            if ((from p in WatchController.GetByUser(UserId) where p.ProductId == ProductId select p.Id).Count() > 0)
            {
                lblAddSuccess.Visible = true;
                return;
            }
            WatchInfo objWatch = new WatchInfo();
            objWatch.ProductId = ProductId;
            objWatch.PortalId = PortalId;
            objWatch.UserId = UserId;
            objWatch.ProductName = objProduct.Name;
            WatchController.Add(objWatch);
            lblAddSuccess.Visible = true;
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