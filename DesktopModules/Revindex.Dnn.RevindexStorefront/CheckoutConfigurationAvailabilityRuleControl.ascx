<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CheckoutConfigurationAvailabilityRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.CheckoutConfigurationAvailabilityRuleControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/FormulaEditorControl.ascx" TagName="FormulaEditorControl" TagPrefix="uc1" %>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="RuleTypeLabelControl" runat="server" />
	<asp:DropDownList ID="RuleTypeDropDownList" runat="server" OnSelectedIndexChanged="RuleTypeDropDownList_SelectedIndexChanged" AutoPostBack="True">
		<asp:ListItem resourcekey="NoneAlwaysAllowLabel" Value=""></asp:ListItem>
		<asp:ListItem resourcekey="BasicLabel" Value="BasicAvailabilityView"></asp:ListItem>
		<asp:ListItem resourcekey="CustomRuleLabel" Value="CustomRuleView"></asp:ListItem>
	</asp:DropDownList>
</div>
<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="BasicAvailabilityView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MinOrderAmountBasicAvailabilityLabelControl" runat="server" />
			<asp:RangeValidator ID="MinOrderAmountBasicAvailabilityRangeValidator" runat="server" ControlToValidate="MinOrderAmountBasicAvailabilityTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl" Type="Double"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MinOrderAmountBasicAvailabilityCompareValidator" runat="server" ControlToValidate="MinOrderAmountBasicAvailabilityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MinOrderAmountBasicAvailabilityTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MaxOrderAmountBasicAvailabilityLabelControl" runat="server" />
			<asp:RangeValidator ID="MaxOrderAmountBasicAvailabilityRangeValidator" runat="server" ControlToValidate="MaxOrderAmountBasicAvailabilityTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl" Type="Double"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MaxOrderAmountBasicAvailabilityCompareValidator" runat="server" ControlToValidate="MaxOrderAmountBasicAvailabilityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MaxOrderAmountBasicAvailabilityTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MinOrderQuantityBasicAvailabilityLabelControl" runat="server" />
			<asp:RangeValidator ID="MinOrderQuantityBasicAvailabilityRangeValidator" runat="server" ControlToValidate="MinOrderQuantityBasicAvailabilityTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:TextBox ID="MinOrderQuantityBasicAvailabilityTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MaxOrderQuantityBasicAvailabilityLabelControl" runat="server" />
			<asp:RangeValidator ID="MaxOrderQuantityBasicAvailabilityRangeValidator" runat="server" ControlToValidate="MaxOrderQuantityBasicAvailabilityTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:TextBox ID="MaxOrderQuantityBasicAvailabilityTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MinOrderWeightBasicAvailabilityLabelControl" runat="server" />
			<div class="rvdFormSubContainer">
				<asp:RangeValidator ID="MinOrderWeightBasicAvailabilityRangeValidator" runat="server" ControlToValidate="MinOrderWeightBasicAvailabilityTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
				<asp:CompareValidator ID="MinOrderWeightBasicAvailabilityCompareValidator" runat="server" ControlToValidate="MinOrderWeightBasicAvailabilityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
				<asp:TextBox ID="MinOrderWeightBasicAvailabilityTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
				<span><%= Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsMass).Symbols[0] %></span>
			</div>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MaxOrderWeightBasicAvailabilityLabelControl" runat="server" />
			<div class="rvdFormSubContainer">
				<asp:RangeValidator ID="MaxOrderWeightBasicAvailabilityRangeValidator" runat="server" ControlToValidate="MaxOrderWeightBasicAvailabilityTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
				<asp:CompareValidator ID="MaxOrderWeightBasicAvailabilityCompareValidator" runat="server" ControlToValidate="MaxOrderWeightBasicAvailabilityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
				<asp:TextBox ID="MaxOrderWeightBasicAvailabilityTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
				<span><%= Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsMass).Symbols[0] %></span>
			</div>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RegionBehaviorBasicAvailabilityLabelControl" runat="server" />
			<asp:RadioButtonList ID="RegionBehaviorBasicAvailabilityRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem resourcekey="AllowAllExceptListedBelowLabel" Value="exclusion" Selected="True" />
				<asp:ListItem resourcekey="AllowOnlyThoseListedBelowLabel" Value="inclusion" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RegionBasicAvailabilityLabelControl" runat="server" />
			<div class="rvdFormSubContainer">
				<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
				<asp:GridView ID="RegionBasicAvailabilityGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AutoGenerateColumns="False" DataKeyNames="CountryCode,SubdivisionCode,PostalCode" OnRowDeleting="RegionBasicAvailabilityGridView_RowDeleting" OnSelectedIndexChanged="RegionBasicAvailabilityGridView_SelectedIndexChanged" OnRowDataBound="RegionBasicAvailabilityGridView_RowDataBound">
					<PagerStyle CssClass="dnnGridPager" />
					<Columns>
						<asp:TemplateField HeaderText="Country">
							<ItemTemplate>
								<asp:LinkButton ID="SelectLinkButton" runat="server" Text='<%# Eval("Country") %>' CommandName="Select" OnClientClick="event.stopPropagation()" ></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="Subdivision" HeaderText="Region" />
						<asp:BoundField DataField="PostalCode" HeaderText="PostalCode" />
						<asp:TemplateField HeaderStyle-Width="10%">
							<ItemTemplate>
								<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
					</Columns>
				</asp:GridView>
				<div class="rvdActions">
					<asp:LinkButton ID="AddRegionBasicAvailabilityLinkButton" resourcekey="AddRegionBasicAvailabilityLinkButton" runat="server" OnClick="AddRegionBasicAvailabilityLinkButton_Click" CssClass="btn btn-primary rvdAddNewAction" CausesValidation="false" />
				</div>
				<asp:Panel ID="RegionBasicAvailabilityDetailsViewPanel" runat="server">
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CountryCodeBasicAvailabilityDetailsViewLabelControl" runat="server" />
						<asp:DropDownList ID="CountryCodeBasicAvailabilityDetailsViewDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CountryCodeBasicAvailabilityDetailsViewDropDownList_SelectedIndexChanged"></asp:DropDownList>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="SubdivisionCodeBasicAvailabilityDetailsViewLabelControl" runat="server" />
						<asp:DropDownList ID="SubdivisionCodeBasicAvailabilityDetailsViewDropDownList" runat="server">
						</asp:DropDownList>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PostalCodeBasicAvailabilityDetailsViewLabelControl" runat="server" />
						<asp:TextBox ID="PostalCodeBasicAvailabilityDetailsViewTextBox" runat="server" ></asp:TextBox>
					</div>
					<div class="rvdActions">
						<asp:LinkButton ID="SaveRegionBasicAvailabilityLinkButton" runat="server" resourcekey="SaveRegionBasicAvailabilityLinkButton" OnClick="SaveRegionBasicAvailabilityLinkButton_Click" ValidationGroup="RegionBasicAvailabilityDetailsViewControl" CssClass="btn btn-primary rvdOKAction" />
					</div>
				</asp:Panel>
			</div>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="MessageBasicAvailabilityLabelControl" runat="server" />
			<asp:TextBox ID="MessageBasicAvailabilityTextBox" runat="server" TextMode="MultiLine" />
		</div>
	</asp:View>
	<asp:View ID="CustomRuleView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="AvailabilityRuleLabelControl" runat="server" />
			<uc1:FormulaEditorControl ID="AvailabilityRuleFormulaEditor" runat="server" Width="100%" ModuleControl="CheckoutAvailability" />
		</div>
	</asp:View>
</asp:MultiView>
