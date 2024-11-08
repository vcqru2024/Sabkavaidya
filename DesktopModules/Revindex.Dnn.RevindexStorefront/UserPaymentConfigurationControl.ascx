<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserPaymentConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.UserPaymentConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("UserPaymentHeader") %></h2>
<div>
	<hr />
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="UserPaymentVerificationActiveLabelControl" runat="server" />
			<asp:CheckBox ID="UserPaymentVerificationActiveCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="UserPaymentVerificationAmountLabelControl" runat="server" />
			<asp:RequiredFieldValidator ID="UserPaymentVerificationAmountRequiredFieldValidator" runat="server" ControlToValidate="UserPaymentVerificationAmountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="UserPaymentVerificationAmountRangeValidator" runat="server" ControlToValidate="UserPaymentVerificationAmountTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="UserPaymentVerificationAmountCompareValidator" runat="server" ControlToValidate="UserPaymentVerificationAmountTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="UserPaymentVerificationAmountTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
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
