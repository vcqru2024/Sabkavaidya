<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RecurringSalesOrderConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.RecurringSalesOrderConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("RecurringSalesOrderHeader") %></h2>
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
			<dnn1:LabelControl ID="RecurringSalesOrderCustomerSetStatusCancelActiveLabelControl" runat="server" />
			<asp:CheckBox ID="RecurringSalesOrderCustomerSetStatusCancelActiveCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RecurringSalesOrderCustomerSetStatusHoldActiveLabelControl" runat="server" />
			<asp:CheckBox ID="RecurringSalesOrderCustomerSetStatusHoldActiveCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RecurringSalesOrderCustomerSetStatusActiveActiveLabelControl" runat="server" />
			<asp:CheckBox ID="RecurringSalesOrderCustomerSetStatusActiveActiveCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RecurringSalesOrderGroupOrdersActiveLabelControl" runat="server" />
			<asp:CheckBox ID="RecurringSalesOrderGroupOrdersActiveCheckBox" runat="server" />
		</div>
	</fieldset>
	<h2 id="RetryFormSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("RetryIncompletePaymentHeader") %></a></h2>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RecurringSalesOrderPaymentIncompleteRetryActiveLabelControl" runat="server" />
			<asp:CheckBox ID="RecurringSalesOrderPaymentIncompleteRetryActiveCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RecurringSalesOrderPaymentIncompleteRetryIntervalLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="RecurringSalesOrderPaymentIncompleteRetryIntervalRequiredFieldValidator" runat="server" ControlToValidate="RecurringSalesOrderPaymentIncompleteRetryIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="RecurringSalesOrderPaymentIncompleteRetryIntervalRangeValidator" runat="server" ControlToValidate="RecurringSalesOrderPaymentIncompleteRetryIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="365" MinimumValue="0" Type="Double" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="RecurringSalesOrderPaymentIncompleteRetryIntervalCompareValidator" runat="server" ControlToValidate="RecurringSalesOrderPaymentIncompleteRetryIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="RecurringSalesOrderPaymentIncompleteRetryIntervalTextBox" runat="server" CssClass="dnnFormRequired" TextMode="Number">0</asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RecurringSalesOrderPaymentIncompleteRetryMaxRepeatLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="RecurringSalesOrderPaymentIncompleteRetryMaxRepeatRequiredFieldValidator" runat="server" ControlToValidate="RecurringSalesOrderPaymentIncompleteRetryMaxRepeatTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="RecurringSalesOrderPaymentIncompleteRetryMaxRepeatRangeValidator" runat="server" ControlToValidate="RecurringSalesOrderPaymentIncompleteRetryMaxRepeatTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="RecurringSalesOrderPaymentIncompleteRetryMaxRepeatCompareValidator" runat="server" ControlToValidate="RecurringSalesOrderPaymentIncompleteRetryMaxRepeatTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="RecurringSalesOrderPaymentIncompleteRetryMaxRepeatTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
		</div>
	</fieldset>
	<div class="row rvdsf-footerbar-container">
        <div class="col-sm-6">
                                
        </div>
        <div class="col-sm-6 text-sm-right">
              <asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />                  
        </div>
    </div>
</asp:Panel>
