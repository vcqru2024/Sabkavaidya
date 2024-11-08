using Cross.Modules.CP_Product.Business;
using DotNetNuke.Common;
using DotNetNuke.Services.Localization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
namespace Cross.Modules.CP_Product.View
{
    public partial class MiniCart : CPModuleBase
    {
        public Setting_MiniCart Settings_MiniCart;

        override protected void OnInit(EventArgs e)
        {
            Settings_MiniCart = new Setting_MiniCart(ModuleId, TabId, ModuleConfiguration.ModuleSettings);
            base.OnInit(e);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            this.LocalResourceFile = Localization.GetResourceFile(this, "MiniCart.ascx");

            if (!IsPostBack)
            {
                if (UserId == -1)
                {
                    lblLoginFirst.Visible = true;
                    tblMiniCart.Visible = false;
                    return;
                }
                else
                {
                    lblLoginFirst.Visible = false;
                    tblMiniCart.Visible = true;
                    hlCheckOut.NavigateUrl = Globals.NavigateURL(GetSubModulePageId_Buyer(), "", "mid=" + GetSubModuleId_Buyer(),
               "ctl=UserBuyer_Cart");
                    BindCartList();
                }
                DataBind();
            }
        }
        private void BindCartList()
        {
            List<CartInfo> list = CartController.GetByClient(UserId, -1,PortalId);
          
            gvList.DataSource = list;
            gvList.DataBind();
            lblSummaryField.Text = (from p in list select p.UnitPrice * p.Quantity).Sum().ToString();
        }
        protected string GetThumbnail(string productId)
        {
            if (ProductController.Get(Convert.ToInt32(productId)) != null)
            {
                return ProductController.Get(Convert.ToInt32(productId)).Thumbnail;
            }
            return LocalUtils.DefaultPicture;
        }

        protected void gvList_DataBinding(object sender, EventArgs e)
        {
            if (gvList.Columns[0] != null)//image
            {
                gvList.Columns[0].Visible = Settings_MiniCart.General.ShowThumbnail;
            }
        }

        protected void gvList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int cartId = Convert.ToInt32(e.CommandArgument);
            CartInfo objCart = CartController.Get(cartId);
            switch (e.CommandName)
            {
                case "Add":
                    objCart.Quantity += 1;
                    CartController.Update(objCart, true);
                    BindCartList();
                    break;

                case "Minus":
                    if (objCart.Quantity == 1)//当前已经只剩一个
                    {
                        CartController.RestorePrice(UserId, CartController.Get(cartId).VendorId);
                        CartController.Delete(cartId);
                    }
                    else
                    {
                        objCart.Quantity -= 1;
                        CartController.Update(objCart, true);
                    }
                    BindCartList();
                    break;

                case "Del":
                    CartController.RestorePrice(UserId, CartController.Get(cartId).VendorId);
                    CartController.Delete(cartId);
                    BindCartList();
                    break;

                default:
                    break;
            }
        }
    }

}

