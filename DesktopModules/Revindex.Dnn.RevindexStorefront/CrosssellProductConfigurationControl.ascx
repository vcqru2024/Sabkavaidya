<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CrosssellProductConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.CrosssellProductConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="CrosssellProductControl.ascx" TagName="CrosssellProductControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2>Cross-sell product</h2>

<asp:PlaceHolder ID="PlaceHolder1" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function ()
        {
            jQuery('#CrosssellProductDetailsViewTabPanel').dnnTabs();
        });
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function ()
        {
            jQuery('#CrosssellProductDetailsViewTabPanel').dnnTabs();
        });
    </script>
</asp:PlaceHolder>
<div id="CrosssellProductDetailsViewTabPanel">
    <ul class="dnnAdminTabNav dnnClear">
        <li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
            <asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
        <li><a href="#<%= OfferDetailsViewPanel.ClientID %>">
            <asp:Label ID="AvailabilityDetailsViewTabLabel" runat="server" resourcekey="AvailabilityDetailsViewTabLabel" /></a></li>
    </ul>
    <asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
	    <fieldset>
		    <div class="dnnFormItem">
			    <dnn1:LabelControl ID="CrosssellProductMaxItemsLabelControl" runat="server"/>
			    <asp:RegularExpressionValidator ID="CrosssellProductMaxItemsRegularExpressionValidator" runat="server" ControlToValidate="CrosssellProductMaxItemsTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\d\|]+(px|%){0,1}$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
			    <asp:TextBox ID="CrosssellProductMaxItemsTextBox" runat="server"></asp:TextBox>
		    </div>
            <div class="dnnFormItem">
			    <dnn1:LabelControl ID="CrosssellProductPriceShowLabelControl" runat="server" />
			    <asp:CheckBox ID="CrosssellProductPriceShowCheckBox" runat="server" />
		    </div>
		    <div class="dnnFormItem">
			    <dnn1:LabelControl ID="CrosssellProductQuantityShowLabelControl" runat="server" />
			    <asp:CheckBox ID="CrosssellProductQuantityShowCheckBox" runat="server" />
		    </div>
		    <div class="dnnFormItem">
			    <dnn1:LabelControl ID="CrosssellProductAddToCartShowLabelControl" runat="server" />
			    <asp:CheckBox ID="CrosssellProductAddToCartShowCheckBox" runat="server" />
		    </div>
		    <div class="dnnFormItem">
			    <dnn1:LabelControl ID="CrosssellProductBuyNowShowLabelControl" runat="server" />
			    <asp:CheckBox ID="CrosssellProductBuyNowShowCheckBox" runat="server" />
		    </div>
            <div class="dnnFormItem">
			    <dnn1:LabelControl ID="CrosssellProductSeeDetailsShowLabelControl" runat="server" />
			    <asp:CheckBox ID="CrosssellProductSeeDetailsShowCheckBox" runat="server" />
		    </div>
	    </fieldset>
    </asp:Panel>
    <asp:Panel ID="OfferDetailsViewPanel" runat="server" CssClass="dnnClear">
        <fieldset>
            <div class="dnnFormItem">
                <uc1:CrosssellProductControl ID="CrosssellProductControl1" runat="server"></uc1:CrosssellProductControl>
            </div>
        </fieldset>
    </asp:Panel>
</div>
<div class="row rvdsf-footerbar-container">
    <div class="col-sm-6">
                                
    </div>
    <div class="col-sm-6 text-sm-right">
        <asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />  
    </div>
</div>

