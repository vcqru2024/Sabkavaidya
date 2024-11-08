<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TaxClassRateRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.TaxClassRateRuleControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/FormulaEditorControl.ascx" TagName="FormulaEditorControl" TagPrefix="uc1" %>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="RuleTypeLabelControl" runat="server" />
	<asp:DropDownList ID="RuleTypeDropDownList" runat="server" OnSelectedIndexChanged="RuleTypeDropDownList_SelectedIndexChanged" AutoPostBack="True">
		<asp:ListItem resourcekey="NoneLabel" Value=""></asp:ListItem>
		<asp:ListItem resourcekey="EuropeVATLabel" Value="EuropeVATView"></asp:ListItem>
        <asp:ListItem resourcekey="EuropeVATMOSSLabel" Value="EuropeVATMOSSView"></asp:ListItem>
		<asp:ListItem resourcekey="FlatRateLabel" Value="FlatRateView"></asp:ListItem>
		<asp:ListItem resourcekey="RegionalRateLabel" Value="RegionalRateView"></asp:ListItem>
		<asp:ListItem resourcekey="CustomRuleLabel" Value="CustomRuleView"></asp:ListItem>
	</asp:DropDownList>
</div>
<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="EuropeVATView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="TaxRate1EuropeVATLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="TaxRate1EuropeVATRequiredFieldValidator" runat="server" ControlToValidate="TaxRate1EuropeVATTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="TaxRate1EuropeVATRangeValidator" runat="server" ControlToValidate="TaxRate1EuropeVATTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="TaxRate1EuropeVATCompareValidator" runat="server" ControlToValidate="TaxRate1EuropeVATTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="TaxRate1EuropeVATTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
	</asp:View>
    <asp:View ID="EuropeVATMOSSView" runat="server">
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ATTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="ATTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="ATTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="ATTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="ATTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="ATTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="ATTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="ATTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="BETaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="BETaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="BETaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="BETaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="BETaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="BETaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="BETaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="BETaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="BGTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="BGTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="BGTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="BGTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="BGTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="BGTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="BGTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="BGTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="CZTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="CZTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="CZTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="CZTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="CZTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="CZTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="CZTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="CZTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="HRTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="HRTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="HRTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="HRTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="HRTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="HRTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="HRTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="HRTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="CYTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="CYTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="CYTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="CYTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="CYTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="CYTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="CYTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="CYTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="DKTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="DKTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="DKTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="DKTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="DKTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="DKTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="DKTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="DKTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="EETaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="EETaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="EETaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="EETaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="EETaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="EETaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="EETaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="EETaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="FITaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="FITaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="FITaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="FITaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="FITaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="FITaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="FITaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="FITaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="FRTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="FRTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="FRTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="FRTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="FRTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="FRTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="FRTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="FRTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="DETaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="DETaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="DETaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="DETaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="DETaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="DETaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="DETaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="DETaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="GRTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="GRTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="GRTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="GRTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="GRTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="GRTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="GRTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="GRTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="HUTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="HUTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="HUTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="HUTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="HUTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="HUTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="HUTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="HUTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="IETaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="IETaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="IETaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="IETaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="IETaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="IETaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="IETaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="IETaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ITTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="ITTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="ITTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="ITTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="ITTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="ITTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="ITTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="ITTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="LVTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="LVTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="LVTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="LVTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="LVTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="LVTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="LVTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="LVTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="LTTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="LTTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="LTTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="LTTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="LTTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="LTTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="LTTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="LTTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="LUTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="LUTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="LUTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="LUTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="LUTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="LUTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="LUTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="LUTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="MTTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="MTTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="MTTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="MTTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="MTTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MTTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="MTTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MTTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="NLTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="NLTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="NLTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="NLTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="NLTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="NLTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="NLTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="NLTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="PLTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="PLTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="PLTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="PLTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="PLTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="PLTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="PLTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="PLTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="PTTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="PTTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="PTTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="PTTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="PTTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="PTTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="PTTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="PTTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ROTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="ROTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="ROTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="ROTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="ROTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="ROTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="ROTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="ROTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="SKTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="SKTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="SKTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="SKTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="SKTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="SKTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="SKTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="SKTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="SITaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="SITaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="SITaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="SITaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="SITaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="SITaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="SITaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="SITaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ESTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="ESTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="ESTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="ESTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="ESTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="ESTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="ESTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="ESTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="SETaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="SETaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="SETaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="SETaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="SETaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="SETaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="SETaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="SETaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="GBTaxRate1EuropeVATMOSSLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="GBTaxRate1EuropeVATMOSSRequiredFieldValidator" runat="server" ControlToValidate="GBTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="GBTaxRate1EuropeVATMOSSRangeValidator" runat="server" ControlToValidate="GBTaxRate1EuropeVATMOSSTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="GBTaxRate1EuropeVATMOSSCompareValidator" runat="server" ControlToValidate="GBTaxRate1EuropeVATMOSSTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="GBTaxRate1EuropeVATMOSSTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="FlatRateView" runat="server">
		<p><%= LocalizeString("TaxRateLevelsDescriptionLabel") %></p>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="TaxRate1FlatRateLabelControl" runat="server" />
			<asp:RangeValidator ID="TaxRate1FlatRateRangeValidator" runat="server" ControlToValidate="TaxRate1FlatRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="TaxRate1FlatRateCompareValidator" runat="server" ControlToValidate="TaxRate1FlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="TaxRate1FlatRateTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="TaxRate2FlatRateLabelControl" runat="server" />
			<asp:RangeValidator ID="TaxRate2FlatRateRangeValidator" runat="server" ControlToValidate="TaxRate2FlatRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="TaxRate2FlatRateCompareValidator" runat="server" ControlToValidate="TaxRate2FlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="TaxRate2FlatRateTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="TaxRate3FlatRateLabelControl" runat="server" />
			<asp:RangeValidator ID="TaxRate3FlatRateRangeValidator" runat="server" ControlToValidate="TaxRate3FlatRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="TaxRate3FlatRateCompareValidator" runat="server" ControlToValidate="TaxRate3FlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="TaxRate3FlatRateTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="TaxRate4FlatRateLabelControl" runat="server" />
			<asp:RangeValidator ID="TaxRate4FlatRateRangeValidator" runat="server" ControlToValidate="TaxRate4FlatRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="TaxRate4FlatRateCompareValidator" runat="server" ControlToValidate="TaxRate4FlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="TaxRate4FlatRateTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="TaxRate5FlatRateLabelControl" runat="server" />
			<asp:RangeValidator ID="TaxRate5FlatRateRangeValidator" runat="server" ControlToValidate="TaxRate5FlatRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="TaxRate5FlatRateCompareValidator" runat="server" ControlToValidate="TaxRate5FlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="TaxRate5FlatRateTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="RegionalRateView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="AddressTypeRegionalRateLabelControl" runat="server" />
			<asp:RadioButtonList ID="AddressTypeRegionalRateRadioButtonList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem resourcekey="BillingLabel" Value="billing" Selected="True" />
				<asp:ListItem resourcekey="ShippingLabel" Value="shipping" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RegionRegionalRateLabelControl" runat="server" />
			<div class="rvdFormSubContainer">
				<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
				<asp:GridView ID="RegionRegionalRateGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AutoGenerateColumns="False" DataKeyNames="CountryCode,SubdivisionCode,PostalCode" OnRowDeleting="RegionRegionalRateGridView_RowDeleting" OnSelectedIndexChanged="RegionRegionalRateGridView_SelectedIndexChanged" OnRowDataBound="RegionRegionalRateGridView_RowDataBound">
					<PagerStyle CssClass="dnnGridPager" />
					<Columns>
						<asp:TemplateField HeaderText="Country">
							<ItemTemplate>
								<asp:LinkButton ID="SelectLinkButton" runat="server" Text='<%# Eval("Country") %>' CommandName="Select" OnClientClick="event.stopPropagation()" ></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="Subdivision" HeaderText="Region" />
						<asp:BoundField DataField="PostalCode" HeaderText="PostalCode" />
						<asp:BoundField DataField="TaxRate1" HeaderText="TaxRate1" />
						<asp:BoundField DataField="TaxRate2" HeaderText="TaxRate2" />
						<asp:BoundField DataField="TaxRate3" HeaderText="TaxRate3" />
						<asp:BoundField DataField="TaxRate4" HeaderText="TaxRate4" />
						<asp:BoundField DataField="TaxRate5" HeaderText="TaxRate5" />
						<asp:TemplateField HeaderStyle-Width="10%">
							<ItemTemplate>
								<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
					</Columns>
				</asp:GridView>
				<div class="rvdActions">
					<asp:LinkButton  ID="AddRegionRegionalRateLinkButton" resourcekey="AddRegionRegionalRateLinkButton" runat="server"  OnClick="AddRegionRegionalRateLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdAddNewAction" />
				</div>
				<asp:Panel ID="RegionRegionalRateDetailsViewPanel" runat="server">
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CountryCodeRegionalRateDetailsViewLabelControl" runat="server" />
						<asp:DropDownList ID="CountryCodeRegionalRateDetailsViewDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CountryCodeRegionalRateDetailsViewDropDownList_SelectedIndexChanged"></asp:DropDownList>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="SubdivisionCodeRegionalRateDetailsViewLabelControl" runat="server" />
						<asp:DropDownList ID="SubdivisionCodeRegionalRateDetailsViewDropDownList" runat="server">
						</asp:DropDownList>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PostalCodeRegionalRateDetailsViewLabelControl" runat="server" />
						<asp:TextBox ID="PostalCodeRegionalRateDetailsViewTextBox" runat="server"></asp:TextBox>
					</div>
					<p><%= LocalizeString("TaxRateLevelsDescriptionLabel") %></p>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="TaxRate1RegionalRateDetailsViewLabelControl" runat="server" />
						<asp:RangeValidator ID="TaxRate1RegionalRateDetailsViewRangeValidator" runat="server" ControlToValidate="TaxRate1RegionalRateDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="RegionRegionalRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:CompareValidator ID="TaxRate1RegionalRateDetailsViewCompareValidator" runat="server" ControlToValidate="TaxRate1RegionalRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="RegionRegionalRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
						<asp:TextBox ID="TaxRate1RegionalRateDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="TaxRate2RegionalRateDetailsViewLabelControl" runat="server" />
						<asp:RangeValidator ID="TaxRate2RegionalRateDetailsViewRangeValidator" runat="server" ControlToValidate="TaxRate2RegionalRateDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="RegionRegionalRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:CompareValidator ID="TaxRate2RegionalRateDetailsViewCompareValidator" runat="server" ControlToValidate="TaxRate2RegionalRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="RegionRegionalRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
						<asp:TextBox ID="TaxRate2RegionalRateDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="TaxRate3RegionalRateDetailsViewLabelControl" runat="server" />
						<asp:RangeValidator ID="TaxRate3RegionalRateDetailsViewRangeValidator" runat="server" ControlToValidate="TaxRate3RegionalRateDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="RegionRegionalRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:CompareValidator ID="TaxRate3RegionalRateDetailsViewCompareValidator" runat="server" ControlToValidate="TaxRate3RegionalRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="RegionRegionalRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
						<asp:TextBox ID="TaxRate3RegionalRateDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="TaxRate4RegionalRateDetailsViewLabelControl" runat="server" />
						<asp:RangeValidator ID="TaxRate4RegionalRateDetailsViewRangeValidator" runat="server" ControlToValidate="TaxRate4RegionalRateDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="RegionRegionalRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:CompareValidator ID="TaxRate4RegionalRateDetailsViewCompareValidator" runat="server" ControlToValidate="TaxRate4RegionalRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="RegionRegionalRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
						<asp:TextBox ID="TaxRate4RegionalRateDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="TaxRate5RegionalRateDetailsViewLabelControl" runat="server" />
						<asp:RangeValidator ID="TaxRate5RegionalRateDetailsViewRangeValidator" runat="server" ControlToValidate="TaxRate5RegionalRateDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="RegionRegionalRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:CompareValidator ID="TaxRate5RegionalRateDetailsViewCompareValidator" runat="server" ControlToValidate="TaxRate5RegionalRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="RegionRegionalRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
						<asp:TextBox ID="TaxRate5RegionalRateDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
					</div>
					<div class="rvdActions">
						<asp:LinkButton  ID="SaveRegionRegionalRateLinkButton" resourcekey="SaveRegionRegionalRateLinkButton" runat="server"  OnClick="SaveRegionRegionalRateLinkButton_Click" ValidationGroup="RegionRegionalRateDetailsViewControl" CssClass="btn btn-primary rvdOKAction" />
					</div>
				</asp:Panel>
			</div>
		</div>
	</asp:View>
	<asp:View ID="CustomRuleView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RateRuleLabelControl" runat="server" />
			<uc1:FormulaEditorControl ID="RateRuleFormulaEditor" runat="server" Width="100%" ModuleControl="TaxClassRate" />
		</div>
	</asp:View>
</asp:MultiView>
