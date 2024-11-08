<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductPartModifierRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductPartModifierRuleControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/FormulaEditorControl.ascx" TagName="FormulaEditorControl" TagPrefix="uc1" %>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="RuleTypeLabelControl" runat="server" />
	<asp:DropDownList ID="RuleTypeDropDownList" runat="server" OnSelectedIndexChanged="RuleTypeDropDownList_SelectedIndexChanged" AutoPostBack="True">
		<asp:ListItem resourcekey="NoneLabel" Value=""></asp:ListItem>
		<asp:ListItem resourcekey="FixedPriceLabel" Value="FlatPriceView"></asp:ListItem>
		<asp:ListItem resourcekey="AdjustPriceLabel" Value="AdjustPriceView"></asp:ListItem>
	</asp:DropDownList>
</div>
<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="FlatPriceView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="PriceFlatPriceLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="PriceFlatPriceRequiredFieldValidator" runat="server" ControlToValidate="PriceFlatPriceTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="PriceFlatPriceRangeValidator" runat="server" ControlToValidate="PriceFlatPriceTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="PriceFlatPriceCompareValidator" runat="server" ControlToValidate="PriceFlatPriceTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="PriceFlatPriceTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="AdjustPriceView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="PriceAdjustPriceDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="PriceAdjustPriceDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="PriceAdjustPriceDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:CompareValidator ID="PriceAdjustPriceDetailsViewCompareValidator" runat="server" ControlToValidate="PriceAdjustPriceDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="PriceAdjustPriceDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
			<asp:DropDownList ID="PriceAdjustPriceDetailsViewDropDownList" runat="server" CssClass="rvdUnitInput">
				<asp:ListItem resourcekey="ByAmountLabel" Value="amount" />
				<asp:ListItem resourcekey="ByPercentageLabel" Value="rate" />
			</asp:DropDownList>
		</div>
	</asp:View>
</asp:MultiView>
