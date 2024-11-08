<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TaxClassExemptionRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.TaxClassExemptionRuleControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/FormulaEditorControl.ascx" TagName="FormulaEditorControl" TagPrefix="uc1" %>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="RuleTypeLabelControl" runat="server" />
	<asp:DropDownList ID="RuleTypeDropDownList" runat="server" OnSelectedIndexChanged="RuleTypeDropDownList_SelectedIndexChanged" AutoPostBack="True">
		<asp:ListItem resourcekey="NoneAlwaysTaxLabel" Value=""></asp:ListItem>
		<asp:ListItem resourcekey="BasicLabel" Value="BasicExemptionView"></asp:ListItem>
		<asp:ListItem resourcekey="CustomRuleLabel" Value="CustomRuleView"></asp:ListItem>
	</asp:DropDownList>
</div>
<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="BasicExemptionView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="AllowTaxExemptionNumberBasicExemptionLabelControl" runat="server" />
			<asp:CheckBox ID="AllowTaxExemptionNumberBasicExemptionCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RegionBehaviorBasicExemptionLabelControl" runat="server" />
			<asp:RadioButtonList ID="RegionBehaviorBasicExemptionRadioButtonList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem resourcekey="TaxAllExceptListedBelowLabel" Value="exclusion" Selected="True" />
				<asp:ListItem resourcekey="TaxOnlyThoseListedBelowLabel" Value="inclusion" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RegionBasicExemptionLabelControl" runat="server" />
			<div class="rvdFormSubContainer">
				<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
				<asp:GridView ID="RegionBasicExemptionGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AutoGenerateColumns="False" DataKeyNames="CountryCode,SubdivisionCode,PostalCode" OnRowDeleting="RegionBasicExemptionGridView_RowDeleting" OnSelectedIndexChanged="RegionBasicExemptionGridView_SelectedIndexChanged" OnRowDataBound="RegionBasicExemptionGridView_RowDataBound">
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
					<asp:LinkButton  ID="AddRegionBasicExemptionLinkButton" resourcekey="AddRegionBasicExemptionLinkButton" runat="server"  OnClick="AddRegionBasicExemptionLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdAddNewAction" />
				</div>
				<asp:Panel ID="RegionBasicExemptionDetailsViewPanel" runat="server">
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CountryCodeBasicExemptionDetailsViewLabelControl" runat="server" />
						<asp:DropDownList ID="CountryCodeBasicExemptionDetailsViewDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CountryCodeBasicExemptionDetailsViewDropDownList_SelectedIndexChanged"></asp:DropDownList>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="SubdivisionCodeBasicExemptionDetailsViewLabelControl" runat="server" />
						<asp:DropDownList ID="SubdivisionCodeBasicExemptionDetailsViewDropDownList" runat="server">
						</asp:DropDownList>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PostalCodeBasicExemptionDetailsViewLabelControl" runat="server" />
						<asp:TextBox ID="PostalCodeBasicExemptionDetailsViewTextBox" runat="server"></asp:TextBox>
					</div>
					<div class="rvdActions">
						<asp:LinkButton  ID="SaveRegionBasicExemptionLinkButton" resourcekey="SaveRegionBasicExemptionLinkButton" runat="server"  OnClick="SaveRegionBasicExemptionLinkButton_Click" ValidationGroup="RegionBasicExemptionDetailsViewControl" CssClass="btn btn-primary rvdOKAction" />
					</div>
				</asp:Panel>
			</div>
		</div>
	</asp:View>
	<asp:View ID="CustomRuleView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ExemptionRuleLabelControl" runat="server" />
			<uc1:FormulaEditorControl ID="ExemptionRuleFormulaEditor" runat="server" Width="100%" ModuleControl="TaxClassExemption" />
		</div>
	</asp:View>
</asp:MultiView>
