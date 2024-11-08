<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SellerConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.SellerConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/urlcontrol.ascx" TagName="UrlControl" TagPrefix="dnn1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("SellerHeader") %></h2>
<script type="text/javascript">
	jQuery(function ($)
	{
		$('#<%= DetailsViewPanel.ClientID %>').dnnPanels();
	});
</script>
<asp:Panel ID="DetailsViewPanel" runat="server">
	<h2 id="GeneralFormSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("GeneralHeader") %></a></h2>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="SellerDisplayTemplateLabelControl" runat="server"  />
			<uc1:DisplayTemplateDropDownListControl ID="SellerDisplayTemplateDropDownListControl" runat="server" />
			<asp:LinkButton ID="SellerDisplayTemplateLinkButton" runat="server" OnClick="SellerDisplayTemplateLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="SellerSyncTabsActiveLabelControl" runat="server"/>
			<asp:CheckBox ID="SellerSyncTabsActiveCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="SellerSyncTabsRootLabelControl" runat="server"/>
			<dnn1:UrlControl ID="SellerSyncTabsRootControl" runat="server" ShowDatabase="false" ShowFiles="false" ShowImages="False" ShowLog="false" ShowNewWindow="False" ShowNone="true" ShowSecure="true" ShowTabs="True" ShowTrack="false" ShowUpLoad="false" ShowUrls="false" ShowUsers="false"></dnn1:UrlControl>
		</div>
	</fieldset>
    <h2 id="CommissionFormSectionHead" class="dnnFormSectionHead">
        <a href="#" class="dnnSectionExpanded"><%= LocalizeString("CommissionHeader") %></a>
    </h2>
    <fieldset>
        <div class="alert alert-info">
        <p><%= LocalizeString("CommissionDescriptionLabel") %></p>
        <br/>
        <p><strong><%= LocalizeString("CommissionFormulaLabel") %></strong></p>    
        </div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="SellerCommissionMinFeeLabelControl" runat="server"/>
            <asp:RequiredFieldValidator ID="SellerCommissionMinFeeRequiredFieldValidator" runat="server" ControlToValidate="SellerCommissionMinFeeTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:CompareValidator ID="SellerCommissionMinFeeCompareValidator" runat="server" ControlToValidate="SellerCommissionMinFeeTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="SellerCommissionMinFeeTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="SellerCommissionBaseFeeLabelControl" runat="server"/>
            <asp:RequiredFieldValidator ID="SellerCommissionBaseFeeRequiredFieldValidator" runat="server" ControlToValidate="SellerCommissionBaseFeeTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="SellerCommissionBaseFeeRangeValidator" runat="server" ControlToValidate="SellerCommissionBaseFeeTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="SellerCommissionBaseFeeCompareValidator" runat="server" ControlToValidate="SellerCommissionBaseFeeTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="SellerCommissionBaseFeeTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="SellerCommissionOrderAmountRateLabelControl" runat="server"/>
            <asp:RequiredFieldValidator ID="SellerCommissionOrderAmountRateRequiredFieldValidator" runat="server" ControlToValidate="SellerCommissionOrderAmountRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="SellerCommissionOrderAmountRateRangeValidator" runat="server" ControlToValidate="SellerCommissionOrderAmountRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="SellerCommissionOrderAmountRateCompareValidator" runat="server" ControlToValidate="SellerCommissionOrderAmountRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="SellerCommissionOrderAmountRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="SellerCommissionOrderCountRateLabelControl" runat="server"/>
            <asp:RequiredFieldValidator ID="SellerCommissionOrderCountRateRequiredFieldValidator" runat="server" ControlToValidate="SellerCommissionOrderCountRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="SellerCommissionOrderCountRateRangeValidator" runat="server" ControlToValidate="SellerCommissionOrderCountRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="SellerCommissionOrderCountRateCompareValidator" runat="server" ControlToValidate="SellerCommissionOrderCountRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="SellerCommissionOrderCountRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="SellerCommissionOrderQuantityRateLabelControl" runat="server"/>
            <asp:RequiredFieldValidator ID="SellerCommissionOrderQuantityRateRequiredFieldValidator" runat="server" ControlToValidate="SellerCommissionOrderQuantityRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="SellerCommissionOrderQuantityRateRangeValidator" runat="server" ControlToValidate="SellerCommissionOrderQuantityRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="SellerCommissionOrderQuantityRateCompareValidator" runat="server" ControlToValidate="SellerCommissionOrderQuantityRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="SellerCommissionOrderQuantityRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="SellerCommissionProductListingRateLabelControl" runat="server"/>
            <asp:RequiredFieldValidator ID="SellerCommissionProductListingRateRequiredFieldValidator" runat="server" ControlToValidate="SellerCommissionProductListingRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="SellerCommissionProductListingRateRangeValidator" runat="server" ControlToValidate="SellerCommissionProductListingRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="SellerCommissionProductListingRateCompareValidator" runat="server" ControlToValidate="SellerCommissionProductListingRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="SellerCommissionProductListingRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
    </fieldset>
	<script type="text/javascript">
		$(document).ready(function ()
		{
			// Expand features section by default
			if (document.cookie.indexOf("FeaturesFormSectionHead") < 0)
				$("#FeaturesFormSectionHead > a").click();
		});
	</script>
	<h2 id="FeaturesFormSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("FeaturesHeader") %></a></h2>
	<fieldset>
		<p>
			<%= LocalizeString("FeaturesDescriptionLabel") %>
		</p>
		<div class="dnnFormItem">
			<dnn1:LabelControl runat="server" Text="" />
			<asp:HyperLink ID="AddFeaturesHyperLink" runat="server" CssClass="btn btn-link" ><em class="glyphicon glyphicon-plus fa fas fa-plus"></em> <%= LocalizeString("EnableOtherFeaturesLink") %></asp:HyperLink>
		</div>
		<div class="rvdsfFeaturesContainer">
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="SellerExtensionActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="SellerExtensionActiveCheckBox" runat="server" />
			</div>
		</div>
	</fieldset>
	<div class="row rvdsf-footerbar-container">
        <div class="col-sm-6">
                                
        </div>
        <div class="col-sm-6 text-sm-right">
			<uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
			<asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />
			<asp:LinkButton ID="SaveAndBackLinkButton" runat="server" resourcekey="SaveAndBackLinkButton" OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
        </div>
    </div>
</asp:Panel>
