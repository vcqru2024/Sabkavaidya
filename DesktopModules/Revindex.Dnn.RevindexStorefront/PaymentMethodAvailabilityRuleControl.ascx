<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PaymentMethodAvailabilityRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.PaymentMethodAvailabilityRuleControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/FormulaEditorControl.ascx" TagName="FormulaEditorControl" TagPrefix="uc1" %>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="RuleTypeLabelControl" runat="server" />
	<asp:DropDownList ID="RuleTypeDropDownList" runat="server" OnSelectedIndexChanged="RuleTypeDropDownList_SelectedIndexChanged" AutoPostBack="True">
		<asp:ListItem resourcekey="NoneLabel" Value=""></asp:ListItem>
		<asp:ListItem resourcekey="BasicLabel" Value="BasicAvailabilityView"></asp:ListItem>
		<asp:ListItem resourcekey="CustomRuleLabel" Value="CustomRuleView"></asp:ListItem>
	</asp:DropDownList>
</div>
<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="BasicAvailabilityView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MinOrderAmountBasicAvailabilityLabelControl" runat="server" />
			<asp:RangeValidator ID="MinOrderAmountBasicAvailabilityRangeValidator" runat="server" ControlToValidate="MinOrderAmountBasicAvailabilityTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MinOrderAmountBasicAvailabilityCompareValidator" runat="server" ControlToValidate="MinOrderAmountBasicAvailabilityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MinOrderAmountBasicAvailabilityTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MaxOrderAmountBasicAvailabilityLabelControl" runat="server" />
			<asp:RangeValidator ID="MaxOrderAmountBasicAvailabilityRangeValidator" runat="server" ControlToValidate="MaxOrderAmountBasicAvailabilityTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MaxOrderAmountBasicAvailabilityCompareValidator" runat="server" ControlToValidate="MaxOrderAmountBasicAvailabilityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MaxOrderAmountBasicAvailabilityTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MinPaymentBalanceAmountBasicAvailabilityLabelControl" runat="server" />
			<asp:RangeValidator ID="MinPaymentBalanceAmountBasicAvailabilityRangeValidator" runat="server" ControlToValidate="MinPaymentBalanceAmountBasicAvailabilityTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MinPaymentBalanceAmountBasicAvailabilityCompareValidator" runat="server" ControlToValidate="MinPaymentBalanceAmountBasicAvailabilityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MinPaymentBalanceAmountBasicAvailabilityTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MaxPaymentBalanceAmountBasicAvailabilityLabelControl" runat="server" />
			<asp:RangeValidator ID="MaxPaymentBalanceAmountBasicAvailabilityRangeValidator" runat="server" ControlToValidate="MaxPaymentBalanceAmountBasicAvailabilityTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MaxPaymentBalanceAmountBasicAvailabilityCompareValidator" runat="server" ControlToValidate="MaxPaymentBalanceAmountBasicAvailabilityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MaxPaymentBalanceAmountBasicAvailabilityTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="CustomRuleView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="AvailabilityRuleLabelControl" runat="server" />
			<uc1:FormulaEditorControl ID="AvailabilityRuleFormulaEditor" runat="server" Width="100%" ModuleControl="PaymentMethodAvailability" />
		</div>
	</asp:View>
</asp:MultiView>
