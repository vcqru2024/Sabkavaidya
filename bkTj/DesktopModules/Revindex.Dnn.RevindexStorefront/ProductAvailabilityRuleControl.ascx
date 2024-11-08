<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductAvailabilityRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductAvailabilityRuleControl" %>
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
					<asp:LinkButton  ID="AddRegionBasicAvailabilityLinkButton" resourcekey="AddRegionBasicAvailabilityLinkButton" runat="server"  OnClick="AddRegionBasicAvailabilityLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdAddNewAction" />
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
						<asp:TextBox ID="PostalCodeBasicAvailabilityDetailsViewTextBox" runat="server"></asp:TextBox>
					</div>
					<div class="rvdActions">
						<asp:LinkButton  ID="SaveRegionBasicAvailabilityLinkButton" resourcekey="SaveRegionBasicAvailabilityLinkButton" runat="server"  OnClick="SaveRegionBasicAvailabilityLinkButton_Click" ValidationGroup="RegionBasicAvailabilityDetailsViewControl" CssClass="btn btn-primary rvdOKAction"  />
					</div>
				</asp:Panel>
			</div>
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
			<uc1:FormulaEditorControl ID="AvailabilityRuleFormulaEditor" runat="server" Width="100%" ModuleControl="ProductAvailability" />
		</div>
	</asp:View>
</asp:MultiView>
