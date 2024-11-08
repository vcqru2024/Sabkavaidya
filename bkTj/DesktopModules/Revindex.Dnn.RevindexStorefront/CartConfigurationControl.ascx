<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.CartConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/urlcontrol.ascx" TagName="UrlControl" TagPrefix="dnn1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("CartHeader") %></h2>
<div>
	<hr />
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CartAbandonTimeoutLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="CartAbandonTimeoutRequiredFieldValidator" runat="server" ControlToValidate="CartAbandonTimeoutTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="CartAbandonTimeoutRangeValidator" runat="server" ControlToValidate="CartAbandonTimeoutTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl" Type="Integer"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:TextBox ID="CartAbandonTimeoutTextBox" runat="server" value="1200" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CartDisplayTemplateLabelControl" runat="server" />
			<uc1:DisplayTemplateDropDownListControl ID="CartDisplayTemplateDropDownListControl" runat="server" />
			<asp:LinkButton ID="CartDisplayTemplateLinkButton" runat="server" OnClick="CartDisplayTemplateLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CartContinueShoppingNavigateUrlLabelControl" runat="server" />
			<asp:DropDownList ID="CartContinueShoppingNavigateUrlDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CartContinueShoppingNavigateUrlDropDownList_SelectedIndexChanged">
				<asp:ListItem resourcekey="DefaultProductListPageLabel" Value="" />
				<asp:ListItem resourcekey="LastViewedProductDetailPageLabel" Value="LastViewedProductDetailPage" />
				<asp:ListItem resourcekey="LastViewedProductListPageLabel" Value="LastViewedProductListPage" />
				<asp:ListItem resourcekey="CustomPageLabel" Value="CustomPage" />
			</asp:DropDownList>
		</div>
		<asp:Panel CssClass="dnnFormItem" ID="CartContinueShoppingNavigateUrlPanel" runat="server" Visible="false">
			<dnn1:LabelControl ID="SelectPageLabelControl" runat="server" />
			<dnn1:UrlControl ID="CartContinueShoppingNavigateUrlUrlControl" runat="server" ShowDatabase="false" ShowFiles="false" ShowImages="False" ShowLog="false" ShowNewWindow="False" ShowNone="false" ShowSecure="true" ShowTabs="True" ShowTrack="false" ShowUpLoad="false" ShowUrls="false" ShowUsers="false" ></dnn1:UrlControl>
		</asp:Panel>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CartSessionTimeoutLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="CartSessionTimeoutRequiredFieldValidator" runat="server" ControlToValidate="CartSessionTimeoutTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="CartSessionTimeoutRangeValidator" runat="server" ControlToValidate="CartSessionTimeoutTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl" Type="Integer"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:TextBox ID="CartSessionTimeoutTextBox" runat="server" value="1200" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CartSessionLogoutLabelControl" runat="server" />
			<asp:CheckBox ID="CartSessionLogoutCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="CartCouponShowLabelControl" runat="server" />
            <asp:CheckBox ID="CartCouponShowCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="CartEstimateShippingTaxShowLabelControl" runat="server" />
            <asp:CheckBox ID="CartEstimateShippingTaxShowCheckBox" runat="server" />
		</div>
	</fieldset>
	<div class="row rvdsf-footerbar-container">
        <div class="col-sm-6">
                                
        </div>
        <div class="col-sm-6 text-sm-right">
            <asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />                    
        </div>
    </div>
</div>
