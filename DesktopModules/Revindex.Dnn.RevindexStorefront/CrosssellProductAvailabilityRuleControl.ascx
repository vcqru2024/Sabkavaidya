<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CrosssellProductAvailabilityRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.CrosssellProductAvailabilityRuleControl" %>
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
            <dnn1:LabelControl ID="MinSubtotalAmountBasicAvailabilityLabelControl" runat="server" />
			<asp:RangeValidator ID="MinSubtotalAmountBasicAvailabilityRangeValidator" runat="server" ControlToValidate="MinSubtotalAmountBasicAvailabilityTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MinSubtotalAmountBasicAvailabilityCompareValidator" runat="server" ControlToValidate="MinSubtotalAmountBasicAvailabilityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MinSubtotalAmountBasicAvailabilityTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
        </div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="MaxSubtotalAmountBasicAvailabilityLabelControl" runat="server" />
			<asp:RangeValidator ID="MaxSubtotalAmountBasicAvailabilityRangeValidator" runat="server" ControlToValidate="MaxSubtotalAmountBasicAvailabilityTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MaxSubtotalAmountBasicAvailabilityCompareValidator" runat="server" ControlToValidate="MaxSubtotalAmountBasicAvailabilityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MaxSubtotalAmountBasicAvailabilityTextBox" runat="server" value="" CssClass="rvd-form-number"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RoleBehaviorBasicAvailabilityLabelControl" runat="server" />
			<asp:RadioButtonList ID="RoleBehaviorBasicAvailabilityRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem resourcekey="AllowAllExceptSelectedBelowLabel" Value="exclusion" Selected="True" />
				<asp:ListItem resourcekey="AllowOnlyThoseSelectedBelowLabel" Value="inclusion" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RoleBasicAvailabilityLabelControl" runat="server" />
			<div class="rvd-form-checkboxes">
				<asp:CheckBoxList ID="RoleBasicAvailabilityCheckBoxList" runat="server" CssClass="rvdFormCheckBoxes" >
				</asp:CheckBoxList>
			</div>
		</div>
	</asp:View>
	<asp:View ID="CustomRuleView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="AvailabilityRuleLabelControl" runat="server" />
			<uc1:FormulaEditorControl ID="AvailabilityRuleFormulaEditor" runat="server" Width="100%" ModuleControl="CrosssellProductAvailability" />
		</div>
	</asp:View>
</asp:MultiView>
