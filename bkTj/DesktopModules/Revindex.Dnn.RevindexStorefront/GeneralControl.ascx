<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GeneralControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.GeneralControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/urlcontrol.ascx" TagName="UrlControl" TagPrefix="dnn1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("GeneralHeader") %></h2>
<div class="row rvdsf-actionbar-container">
    <div class="col-sm-6">
		<asp:LinkButton ID="ClearCacheLinkButton" runat="server" CssClass="btn btn-link" OnClick="ClearCacheLinkButton_Click" CausesValidation="False"><em class="glyphicon glyphicon-refresh fa fas fa-sync"></em> <%= LocalizeString("ClearCacheLink") %></asp:LinkButton>			
    </div>
    <div class="col-sm-6 text-sm-right">

    </div>
</div>
<script type="text/javascript">
	jQuery(function ($)
	{
		$('#<%= DetailsViewPanel.ClientID %>').dnnPanels();
	});
</script>
<asp:Panel ID="DetailsViewPanel" runat="server" CssClass="">
	<h2 id="AddressFormSectionHead" class="dnnFormSectionHead">
		<a href="#" class="dnnSectionExpanded"><%= LocalizeString("StoreAddressHeader") %></a></h2>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralStoreNameLabelControl" runat="server" />
			<asp:TextBox ID="GeneralStoreNameTextBox" runat="server" MaxLength="100"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralStoreCountryCodeLabelControl" runat="server" />
			<asp:DropDownList ID="GeneralStoreCountryDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="GeneralStoreCountryDropDownList_SelectedIndexChanged"></asp:DropDownList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralStoreStreetLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="GeneralStoreStreetRequiredFieldValidator" runat="server" ControlToValidate="GeneralStoreStreetTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" resourcekey="StreetRequiredFieldValidator" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:TextBox ID="GeneralStoreStreetTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralStoreUnitLabelControl" runat="server" />
			<asp:TextBox ID="GeneralStoreUnitTextBox" runat="server" MaxLength="100" ></asp:TextBox>
		</div>
		<asp:Panel ID="GeneralStoreDistrictPanel" runat="server" CssClass="dnnFormItem">
			<dnn1:LabelControl ID="GeneralStoreDistrictLabelControl" runat="server" />
			<asp:TextBox ID="GeneralStoreDistrictTextBox" runat="server" MaxLength="50" ></asp:TextBox>
		</asp:Panel>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralStoreCityLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="GeneralStoreCityRequiredFieldValidator" runat="server" ControlToValidate="GeneralStoreCityTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" resourcekey="PostalCodeRequiredFieldValidator" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:TextBox ID="GeneralStoreCityTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralStoreSubdivisionCodeLabelControl" runat="server" />
			<asp:DropDownList ID="GeneralStoreSubdivisionDropDownList" runat="server" >
			</asp:DropDownList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralStorePostalCodeLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="GeneralStorePostalCodeRequiredFieldValidator" runat="server" ControlToValidate="GeneralStorePostalCodeTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" resourcekey="PostalCodeRequiredFieldValidator" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:TextBox ID="GeneralStorePostalCodeTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralStorePhoneLabelControl" runat="server" />
			<asp:TextBox ID="GeneralStorePhoneTextBox" runat="server" MaxLength="50" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralEmailRecipientLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="GeneralEmailRecipientTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="GeneralEmailRecipientTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^(\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*|(&quot;*[\w ]*&quot;*\s*)&lt;\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*&gt;)$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
			<asp:TextBox ID="GeneralEmailRecipientTextBox" runat="server" MaxLength="256" CssClass="dnnFormRequired"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralEmailSenderLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="GeneralEmailSenderTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="GeneralEmailSenderTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^(\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*|(&quot;*[\w ]*&quot;*\s*)&lt;\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*&gt;)$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
			<asp:TextBox ID="GeneralEmailSenderTextBox" runat="server" MaxLength="256" CssClass="dnnFormRequired"></asp:TextBox>
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
	<h2 id="FeaturesFormSectionHead" class="dnnFormSectionHead">
		<a href="#" class="dnnSectionExpanded" name="FeaturesAnchor"><%= LocalizeString("FeaturesHeader") %></a></h2>
	<fieldset>
		<p>
			<%= LocalizeString("FeaturesDescriptionLabel") %>
		</p>
		<div class="dnnFormItem">
			<dnn1:LabelControl runat="server" Text=""/>
			<a class="btn btn-link" href="#" onclick="$('.rvdsfFeaturesContainer').find('input').prop('checked', true); return false;" ><em class="glyphicon glyphicon-check fa fas fa-check-square"></em> <%= LocalizeString("SelectAllLink") %></a>
			<a class="btn btn-link" href="#" onclick="$('.rvdsfFeaturesContainer').find('input').prop('checked', false); return false;" ><em class="glyphicon glyphicon-unchecked fa fas fa-square"></em> <%= LocalizeString("DeselectAllLink") %></a>
		</div>
		<div class="rvdsfFeaturesContainer">
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="AddressValidationActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="AddressValidationActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="AnalyticsActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="AnalyticsActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ApiActiveLabelControl" runat="server" />
				<asp:CheckBox ID="ApiActiveCheckBox" runat="server"/>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="CartActiveLabelControl" runat="server" />
				<asp:CheckBox ID="CartActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="CartSummaryActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="CartSummaryActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ChannelActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="ChannelActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="CheckoutActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="CheckoutActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ConfirmationActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="ConfirmationActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="CrosssellProductActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="CrosssellProductActiveCheckBox" runat="server" />
			</div>
			<asp:Panel ID="DisplayTemplatePanel" runat="server" CssClass="dnnFormItem">
				<dnn1:LabelControl ID="DisplayTemplateActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="DisplayTemplateActiveCheckBox" runat="server" />
			</asp:Panel>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="DistributorActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="DistributorActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="FulfillmentActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="FulfillmentActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="HandlingActiveLabelControl" runat="server" />
				<asp:CheckBox ID="HandlingActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="MachineActiveLabelControl" runat="server" />
				<asp:CheckBox ID="MachineActiveCheckBox" runat="server"/>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ManageFavoriteActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="ManageFavoriteActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ManageFundActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="ManageFundActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ManageOrderActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="ManageOrderActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ManageRegisterActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="ManageRegisterActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ManufacturerActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="ManufacturerActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="SellerMarketplaceActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="SellerMarketplaceActiveCheckBox" runat="server"/>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="PackingActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="PackingActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ProductComparisonActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="ProductComparisonActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ProductDetailActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="ProductDetailActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ProductFilterActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="ProductFilterActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ProductListActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="ProductListActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ProductSearchActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="ProductSearchActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ProductShowcaseActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="ProductShowcaseActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="QuickOrderActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="QuickOrderActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="RecurringSalesOrderActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="RecurringSalesOrderActiveCheckBox" runat="server" />
			</div>
            <div class="dnnFormItem">
				<dnn1:LabelControl ID="SalesReturnActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="SalesReturnActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="RewardsPointActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="RewardsPointActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="RightActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="RightActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="RiskActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="RiskActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="SalesOrderActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="SalesOrderActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ShippingActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="ShippingActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="UserPaymentActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="UserPaymentActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="VoucherActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="VoucherActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="WarehouseActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="WarehouseActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="WishListActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="WishListActiveCheckBox" runat="server" />
			</div>
            <div class="dnnFormItem">
				<dnn1:LabelControl ID="GeneralStringTokenizerActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="GeneralStringTokenizerActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="GeneralObjectKeyShowLabelControl" runat="server"/>
				<asp:CheckBox ID="GeneralObjectKeyShowCheckBox" runat="server" />
			</div>
		</div>
	</fieldset>
	<h2 id="StandardsFormSectionHead" class="dnnFormSectionHead">
		<a href="#" class="dnnSectionExpanded"><%= LocalizeString("StandardsHeader") %></a></h2>
	<fieldset>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralPriceDisplayModeLabelControl" runat="server" />
			<asp:DropDownList ID="GeneralPriceDisplayModeDropDownList" runat="server">
				<asp:ListItem resourcekey="ShowPriceLabel" Value="1" />
				<asp:ListItem resourcekey="ShowPriceTaxInclusiveLabel" Value="2" />
			</asp:DropDownList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralUnitsLengthLabelControl" runat="server" />
			<asp:DropDownList ID="GeneralUnitsLengthDropDownList" runat="server">
				<asp:ListItem resourcekey="CentimeterLabel" Value="Centimeter"></asp:ListItem>
				<asp:ListItem resourcekey="FeetLabel" Value="Feet"></asp:ListItem>
				<asp:ListItem resourcekey="InchLabel" Value="Inch"></asp:ListItem>
				<asp:ListItem resourcekey="MeterLabel" Value="Meter"></asp:ListItem>
				<asp:ListItem resourcekey="MillimeterLabel" Value="Millimeter"></asp:ListItem>
				<asp:ListItem resourcekey="YardLabel" Value="Yard"></asp:ListItem>
			</asp:DropDownList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralUnitsMassLabelControl" runat="server" />
			<asp:DropDownList ID="GeneralUnitsMassDropDownList" runat="server">
				<asp:ListItem resourcekey="GramLabel" Value="Gram"></asp:ListItem>
				<asp:ListItem resourcekey="KilogramLabel" Value="Kilogram"></asp:ListItem>
				<asp:ListItem resourcekey="MilligramLabel" Value="Milligram"></asp:ListItem>
				<asp:ListItem resourcekey="PoundLabel" Value="Pound"></asp:ListItem>
				<asp:ListItem resourcekey="OunceLabel" Value="Ounce"></asp:ListItem>
			</asp:DropDownList>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralProfileSubdivisionRequiredLabelControl" runat="server" />
			<asp:CheckBox ID="GeneralProfileSubdivisionRequiredCheckBox" runat="server" />
		</div>
	</fieldset>
	<h2 id="LocationFormSectionHead" class="dnnFormSectionHead">
		<a href="#" class="dnnSectionExpanded"><%= LocalizeString("LocationHeader") %></a></h2>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralCountryAllowedLabelControl" runat="server"/>
			<div class="rvdFormSubContainer">
			    <a class="btn btn-link" href="#" onclick="$('.rvdsfCountryAllowedList').find('input').prop('checked', true); return false;" ><em class="glyphicon glyphicon-check fa fas fa-check-square"></em> <%= LocalizeString("SelectAllLink") %></a>
			    <a class="btn btn-link" href="#" onclick="$('.rvdsfCountryAllowedList').find('input').prop('checked', false); return false;" ><em class="glyphicon glyphicon-unchecked fa fas fa-square"></em> <%= LocalizeString("DeselectAllLink") %></a>
				<div style="height: 300px; overflow: auto; margin: 20px" class="rvdsfCountryAllowedList">
				<asp:CheckBoxList ID="GeneralCountryAllowedCheckBoxList" runat="server"></asp:CheckBoxList>
			</div>
		    </div>
			
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralCountryDefaultLabelControl" runat="server" />
			<asp:DropDownList ID="GeneralCountryDefaultDropDownList" runat="server" OnSelectedIndexChanged="GeneralCountryDefaultDropDownList_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralSubdivisionDefaultLabelControl" runat="server" />
			<asp:DropDownList ID="GeneralSubdivisionDefaultDropDownList" runat="server"></asp:DropDownList>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralGeoIPActiveLabelControl" runat="server" />
			<asp:CheckBox ID="GeneralGeoIPActiveCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="UpdateGeoIPFileLabelControl" runat="server" Text="" />
			<asp:LinkButton  ID="UpdateGeoIPFileLinkButton" resourcekey="UpdateGeoIPFileLinkButton" runat="server" onclick="UpdateGeoIPFileLinkButton_Click"  CssClass="btn btn-primary"/>
		</div>
	</fieldset>
	<h2 id="MembershipFormSectionHead" class="dnnFormSectionHead">
		<a href="#" class="dnnSectionExpanded"><%= LocalizeString("MembershipHeader") %></a></h2>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralNavigationLoginUrlLabelControl" runat="server" />
			<dnn1:UrlControl ID="GeneralNavigationLoginUrlUrlControl" runat="server" ShowDatabase="false" ShowFiles="false" ShowImages="False" ShowLog="false" ShowNewWindow="False" ShowNone="true" ShowSecure="true" ShowTabs="True" ShowTrack="false" ShowUpLoad="false" ShowUrls="false" ShowUsers="false"></dnn1:UrlControl>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralNavigationRegistrationUrlLabelControl" runat="server" />
			<dnn1:UrlControl ID="GeneralNavigationRegistrationUrlUrlControl" runat="server" ShowDatabase="false" ShowFiles="false" ShowImages="False" ShowLog="false" ShowNewWindow="False" ShowNone="true" ShowSecure="true" ShowTabs="True" ShowTrack="false" ShowUpLoad="false" ShowUrls="false" ShowUsers="false"></dnn1:UrlControl>
		</div>
	</fieldset>
	<h2 id="DiagnosticsFormSectionHead" class="dnnFormSectionHead">
		<a href="#" class="dnnSectionExpanded"><%= LocalizeString("DiagnosticsHeader") %></a></h2>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GeneralLogLevelLabelControl" runat="server" />
			<asp:DropDownList ID="GeneralLogLevelDropDownList" runat="server">
				<asp:ListItem resourcekey="ErrorLabel" Value="1"></asp:ListItem>
				<asp:ListItem resourcekey="DebugLabel" Value="8"></asp:ListItem>
			</asp:DropDownList>
		</div>
	</fieldset>
	<div class="row rvdsf-footerbar-container">
			<div class="col-sm-6">
                                
			</div>
			<div class="col-sm-6 text-sm-right">
				<asp:LinkButton  ID="SaveLinkButton" resourcekey="SaveLinkButton" runat="server"  OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />
			</div>
	</div>
</asp:Panel>
