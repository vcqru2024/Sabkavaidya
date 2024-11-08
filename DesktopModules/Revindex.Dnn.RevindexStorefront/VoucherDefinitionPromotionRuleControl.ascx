<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VoucherDefinitionPromotionRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.VoucherDefinitionPromotionRuleControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/FormulaEditorControl.ascx" TagName="FormulaEditorControl" TagPrefix="uc1" %>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="RuleTypeLabelControl" runat="server" />
	<asp:DropDownList ID="RuleTypeDropDownList" runat="server" OnSelectedIndexChanged="RuleTypeDropDownList_SelectedIndexChanged" AutoPostBack="True">
		<asp:ListItem resourcekey="NoneLabel" Value=""></asp:ListItem>
		<asp:ListItem resourcekey="FlatIncreaseLabel" Value="FlatIncreaseView"></asp:ListItem>
		<asp:ListItem resourcekey="CustomRuleLabel" Value="CustomRuleView"></asp:ListItem>
	</asp:DropDownList>
</div>
<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="FlatIncreaseView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="IncreaseAmountFlatIncreaseLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="IncreaseAmountFlatIncreaseRequiredFieldValidator" runat="server" ControlToValidate="IncreaseAmountFlatIncreaseTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="IncreaseAmountFlatIncreaseRangeValidator" runat="server" ControlToValidate="IncreaseAmountFlatIncreaseTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="IncreaseAmountFlatIncreaseCompareValidator" runat="server" ControlToValidate="IncreaseAmountFlatIncreaseTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="IncreaseAmountFlatIncreaseTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
			<asp:DropDownList ID="IncreaseAmountUnitFlatIncreaseDropDownList" runat="server" CssClass="rvdUnitInput">
				<asp:ListItem resourcekey="ByAmountLabel" Value="amount" />
				<asp:ListItem resourcekey="ByPercentageLabel" Value="rate" />
			</asp:DropDownList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MaxRedemptionFlatIncreaseLabelControl" runat="server" />
			<asp:RangeValidator ID="MaxRedemptionFlatIncreaseRangeValidator" runat="server" ControlToValidate="MaxRedemptionFlatIncreaseTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MaxRedemptionFlatIncreaseCompareValidator" runat="server" ControlToValidate="MaxRedemptionFlatIncreaseTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MaxRedemptionFlatIncreaseTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="CustomRuleView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="PromotionRuleLabelControl" runat="server" />
			<uc1:FormulaEditorControl ID="PromotionRuleFormulaEditor" runat="server" Width="100%" ModuleControl="VoucherDefinitionPromotion" />
		</div>
	</asp:View>
</asp:MultiView>
