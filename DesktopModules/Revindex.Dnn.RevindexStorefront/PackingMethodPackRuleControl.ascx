<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PackingMethodPackRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.PackingMethodPackRuleControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/FormulaEditorControl.ascx" TagName="FormulaEditorControl" TagPrefix="uc1" %>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="RuleTypeLabelControl" runat="server" />
	<asp:DropDownList ID="RuleTypeDropDownList" runat="server" OnSelectedIndexChanged="RuleTypeDropDownList_SelectedIndexChanged" AutoPostBack="True" >
		<asp:ListItem resourcekey="NoneLabel" Value=""></asp:ListItem>
		<asp:ListItem resourcekey="SinglePackageLabel" Value="SinglePackageView"></asp:ListItem>
		<asp:ListItem resourcekey="SingleProductLabel" Value="SingleProductView"></asp:ListItem>
		<asp:ListItem resourcekey="VolumeFitLabel" Value="VolumeFitView"></asp:ListItem>
		<asp:ListItem resourcekey="CustomRuleLabel" Value="CustomRuleView"></asp:ListItem>
	</asp:DropDownList>
</div>
<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="SinglePackageView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="PackageIDSinglePackageLabelControl" runat="server" HelpText="" />
			<asp:DropDownList ID="PackageIDSinglePackageDropDownList" runat="server" >
			</asp:DropDownList>
		</div>
	</asp:View>
	<asp:View ID="SingleProductView" runat="server">
	</asp:View>
	<asp:View ID="VolumeFitView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="FillFactorVolumeFitLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="FillFactorVolumeFitRequiredFieldValidator" runat="server" ControlToValidate="FillFactorVolumeFitTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="FillFactorVolumeFitRangeValidator" runat="server" ControlToValidate="FillFactorVolumeFitTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="FillFactorVolumeFitCompareValidator" runat="server" ControlToValidate="FillFactorVolumeFitTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="FillFactorVolumeFitTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="CustomRuleView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="PackRuleLabelControl" runat="server" />
			<uc1:FormulaEditorControl ID="PackRuleFormulaEditor" runat="server" Width="100%" ModuleControl="PackingMethodPack" />
		</div>
	</asp:View>
</asp:MultiView>
