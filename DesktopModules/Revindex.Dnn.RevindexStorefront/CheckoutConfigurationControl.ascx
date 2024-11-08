<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CheckoutConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.CheckoutConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="CheckoutConfigurationAvailabilityRuleControl.ascx" TagName="CheckoutConfigurationAvailabilityRuleControl" TagPrefix="uc1" %>
<%@ Register Src="CheckoutConfigurationPlaceOrderActionRuleControl.ascx" TagName="CheckoutConfigurationPlaceOrderActionRuleControl" TagPrefix="uc1" %>
<%@ Register Src="CheckoutConfigurationDynamicFormCodeControl.ascx" TagName="CheckoutConfigurationDynamicFormCodeControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("CheckoutHeader") %></h2>

<script type="text/javascript">
    jQuery(document).ready(function()
    {
        jQuery('#CheckoutDetailsViewTabPanel').dnnTabs();
	});
</script>

<div id="CheckoutDetailsViewTabPanel">
    <ul class="dnnAdminTabNav dnnClear">
        <li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
            <asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
        <li><a href="#<%= AvailabilityDetailsViewPanel.ClientID %>">
            <asp:Label ID="AvailabilityDetailsViewTabLabel" runat="server" resourcekey="AvailabilityDetailsViewTabLabel" /></a></li>
        <li><a href="#<%= CustomFieldDetailsViewPanel.ClientID %>">
            <asp:Label ID="CustomFieldDetailsViewTabLabel" runat="server" resourcekey="CustomFieldDetailsViewTabLabel" /></a></li>
        <li><a href="#<%= ActionDetailsViewPanel.ClientID %>">
            <asp:Label ID="ActionDetailsViewTabLabel" runat="server" resourcekey="ActionDetailsViewTabLabel" /></a></li>
    </ul>
    <asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
        <fieldset>
            <div class="dnnFormItem">
                <dnn1:LabelControl ID="CheckoutAnonymousAccountActiveLabelControl" runat="server" />
                <asp:CheckBox ID="CheckoutAnonymousAccountActiveCheckBox" runat="server" />
            </div>
            <div class="dnnFormItem">
                <dnn1:LabelControl ID="CheckoutAnonymousAccountReuseLabelControl" runat="server" />
                <asp:CheckBox ID="CheckoutAnonymousAccountReuseCheckBox" runat="server" />
            </div>
            <div class="dnnFormItem">
                <dnn1:LabelControl ID="CheckoutUserProfileUpdateLabelControl" runat="server" />
                <asp:CheckBox ID="CheckoutUserProfileUpdateCheckBox" runat="server" />
            </div>
            <div class="dnnFormItem">
                <dnn1:LabelControl ID="CheckoutDisplayTemplateLabelControl" runat="server" />
                <uc1:DisplayTemplateDropDownListControl ID="CheckoutDisplayTemplateDropDownListControl" runat="server" />
				<asp:LinkButton ID="CheckoutDisplayTemplateLinkButton" runat="server" OnClick="CheckoutDisplayTemplateLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
            </div>
            <div class="dnnFormItem">
                <dnn1:LabelControl ID="CheckoutUserPaymentSaveLabelControl" runat="server" />
                <asp:CheckBox ID="CheckoutUserPaymentSaveCheckBox" runat="server" />
            </div>
            <div class="dnnFormItem">
                <dnn1:LabelControl ID="CheckoutShowBusinessTaxNumberLabelControl" runat="server" />
                <asp:CheckBox ID="CheckoutShowBusinessTaxNumberCheckBox" runat="server" />
            </div>
            <div class="dnnFormItem">
                <dnn1:LabelControl ID="CheckoutShowPurchaseOrderNumberLabelControl" runat="server" />
                <asp:CheckBox ID="CheckoutShowPurchaseOrderNumberCheckBox" runat="server" />
            </div>
        </fieldset>
    </asp:Panel>
    <asp:Panel ID="AvailabilityDetailsViewPanel" runat="server" CssClass="dnnClear">
        <fieldset>
            <uc1:CheckoutConfigurationAvailabilityRuleControl ID="CheckoutConfigurationAvailabilityRuleControl" runat="server" Width="100%" />
        </fieldset>
    </asp:Panel>
    <asp:Panel ID="CustomFieldDetailsViewPanel" runat="server" CssClass="dnnClear">
        <fieldset>
            <uc1:CheckoutConfigurationDynamicFormCodeControl ID="CheckoutConfigurationDynamicFormCodeControl" runat="server" Width="100%" />
        </fieldset>
    </asp:Panel>
    <asp:Panel ID="ActionDetailsViewPanel" runat="server" CssClass="dnnClear">
        <fieldset>
            <div class="dnnFormItem">
                <dnn1:LabelControl ID="CheckoutRunPlaceOrderActionRuleLabelControl" runat="server" />
                <asp:CheckBox ID="CheckoutRunPlaceOrderActionRuleCheckBox" runat="server" />
            </div>
            <uc1:CheckoutConfigurationPlaceOrderActionRuleControl ID="CheckoutConfigurationPlaceOrderActionRuleControl" runat="server" Width="100%" />
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
