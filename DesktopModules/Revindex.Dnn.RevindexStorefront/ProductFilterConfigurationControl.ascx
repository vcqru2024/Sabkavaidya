<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductFilterConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductFilterConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("ProductFilterHeader") %></h2>
<div>
	<hr />
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductFilterDisplayTemplateLabelControl" runat="server"/>
			<uc1:DisplayTemplateDropDownListControl ID="ProductFilterDisplayTemplateDropDownListControl" runat="server" />
			<asp:LinkButton ID="ProductFilterDisplayTemplateLinkButton" runat="server" OnClick="ProductFilterDisplayTemplateLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductFilterBookingDateFilterableLabelControl" runat="server" />
			<asp:CheckBox ID="ProductFilterBookingDateFilterableCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductFilterDistributorFilterableLabelControl" runat="server" />
			<asp:CheckBox ID="ProductFilterDistributorFilterableCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductFilterManufacturerFilterableLabelControl" runat="server" />
			<asp:CheckBox ID="ProductFilterManufacturerFilterableCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductFilterSellerFilterableLabelControl" runat="server" />
			<asp:CheckBox ID="ProductFilterSellerFilterableCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductFilterPriceFilterableLabelControl" runat="server" />
			<asp:CheckBox ID="ProductFilterPriceFilterableCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductFilterPriceStepSizeLabelControl" runat="server" />
			<asp:RequiredFieldValidator ID="ProductFilterPriceStepSizeRequiredFieldValidator" runat="server" ControlToValidate="ProductFilterPriceStepSizeTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="ProductFilterPriceStepSizeRangeValidator" runat="server" ControlToValidate="ProductFilterPriceStepSizeTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="ProductFilterPriceStepSizeCompareValidator" runat="server" ControlToValidate="ProductFilterPriceStepSizeTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="ProductFilterPriceStepSizeTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
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
