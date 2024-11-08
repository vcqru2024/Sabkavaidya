<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDetailConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductDetailConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/urlcontrol.ascx" TagName="UrlControl" TagPrefix="dnn1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("ProductDetailHeader") %></h2>
<div>
	<hr />
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailDisplayTemplateLabelControl" runat="server"  />
			<uc1:DisplayTemplateDropDownListControl ID="ProductDetailDisplayTemplateDropDownListControl" runat="server" />
			<asp:LinkButton ID="ProductDetailDisplayTemplateLinkButton" runat="server" OnClick="ProductDetailDisplayTemplateLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailInventoryShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductDetailInventoryShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailSKUShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductDetailSKUShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailPriceShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductDetailPriceShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailQuantityShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductDetailQuantityShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailMSRPShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductDetailMSRPShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailSavingsShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductDetailSavingsShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailRewardPointsShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductDetailRewardPointsShowCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailAddToCartShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductDetailAddToCartShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailBuyNowShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductDetailBuyNowShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailAddToFavoriteShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductDetailAddToFavoriteShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailAddToWishListShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductDetailAddToWishListShowCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailUpdateShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductDetailUpdateShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailViewCartShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductDetailViewCartShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailContinueShoppingShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductDetailContinueShoppingShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailContinueShoppingNavigateUrlLabelControl" runat="server" />
			<asp:DropDownList ID="ProductDetailContinueShoppingNavigateUrlDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ProductDetailContinueShoppingNavigateUrlDropDownList_SelectedIndexChanged">
				<asp:ListItem resourcekey="DefaultProductListPageLabel" Value="" />
				<asp:ListItem resourcekey="LastViewedProductListPageLabel" Value="LastViewedProductListPage" />
				<asp:ListItem resourcekey="CustomPageLabel" Value="CustomPage" />
			</asp:DropDownList>
		</div>
		<asp:Panel CssClass="dnnFormItem" ID="ProductDetailContinueShoppingNavigateUrlPanel" runat="server" Visible="false">
			<dnn1:LabelControl ID="SelectPageLabelControl" runat="server" />
			<dnn1:UrlControl ID="ProductDetailContinueShoppingNavigateUrlUrlControl" runat="server" ShowDatabase="false" ShowFiles="false" ShowImages="False" ShowLog="false" ShowNewWindow="False" ShowNone="false" ShowSecure="true" ShowTabs="True" ShowTrack="false" ShowUpLoad="false" ShowUrls="false" ShowUsers="false" ></dnn1:UrlControl>
		</asp:Panel>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductDetailSocialShareShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductDetailSocialShareShowCheckBox" runat="server" />
		</div>
	</fieldset>
	<div class="row rvdsf-footerbar-container">
        <div class="col-sm-6">
                                
        </div>
        <div class="col-sm-6 text-sm-right">
			<asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />                     
        </div>
    </div>
</div>
