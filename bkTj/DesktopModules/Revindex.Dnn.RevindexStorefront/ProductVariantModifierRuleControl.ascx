<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductVariantModifierRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductVariantModifierRuleControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/FormulaEditorControl.ascx" TagName="FormulaEditorControl" TagPrefix="uc1" %>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="RuleTypeLabelControl" runat="server" />
	<asp:DropDownList ID="RuleTypeDropDownList" runat="server" OnSelectedIndexChanged="RuleTypeDropDownList_SelectedIndexChanged" AutoPostBack="True">
		<asp:ListItem resourcekey="NoneRuleTypeLabel" Value=""></asp:ListItem>
		<asp:ListItem resourcekey="OverridePriceRuleTypeLabel" Value="OverridePriceView"></asp:ListItem>
		<asp:ListItem resourcekey="ConfigurablePriceRuleTypeLabel" Value="ConfigurablePriceView"></asp:ListItem>
		<asp:ListItem resourcekey="TierPriceRuleTypeLabel" Value="TierPriceView"></asp:ListItem>
		<asp:ListItem resourcekey="CustomRuleRuleTypeLabel" Value="CustomRuleView"></asp:ListItem>
	</asp:DropDownList>
</div>
<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="OverridePriceView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="FieldIDOverridePriceLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="FieldIDOverridePriceRequiredFieldValidator" runat="server" ControlToValidate="FieldIDOverridePriceTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RegularExpressionValidator ID="FieldIDOverridePriceRegularExpressionValidator" runat="server" ControlToValidate="FieldIDOverridePriceTextBox" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ValidationGroup="FieldBasicDynamicFormDetailsViewControl" ValidationExpression="^[a-zA-Z][a-zA-Z0-9_]+$"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
			<asp:TextBox ID="FieldIDOverridePriceTextBox" runat="server" CssClass="dnnFormRequired"></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="ConfigurablePriceView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MinPriceFieldConfigurablePriceLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="MinPriceFieldConfigurablePriceRequiredFieldValidator" runat="server" ControlToValidate="MinPriceFieldConfigurablePriceTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="MinPriceFieldConfigurablePriceRangeValidator" runat="server" ControlToValidate="MinPriceFieldConfigurablePriceTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MinPriceFieldConfigurablePriceCompareValidator" runat="server" ControlToValidate="MinPriceFieldConfigurablePriceTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MinPriceFieldConfigurablePriceTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="FieldConfigurablePriceLabelControl" runat="server" />
			<div class="rvdFormSubContainer">
				<asp:PlaceHolder ID="FieldConfigurablePriceMessagePlaceHolder" runat="server" />
				<asp:GridView ID="FieldConfigurablePriceGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID,Operator,Operand" OnRowDeleting="FieldConfigurablePriceGridView_RowDeleting" OnSelectedIndexChanged="FieldConfigurablePriceGridView_SelectedIndexChanged" OnRowDataBound="FieldConfigurablePriceGridView_RowDataBound">
					<PagerStyle CssClass="dnnGridPager" />
					<Columns>
						<asp:TemplateField HeaderText="FieldID">
							<ItemTemplate>
								<asp:LinkButton ID="SelectLinkButton" runat="server" Text='<%# Eval("ID") %>' CommandName="Select" OnClientClick="event.stopPropagation()" ></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="Operator" HeaderText="Operator" />
						<asp:BoundField DataField="Operand" HeaderText="Operand" />
						<asp:BoundField DataField="PriceAdjustment" HeaderText="PriceAdjustment" />
						<asp:TemplateField HeaderStyle-Width="5%">
							<ItemTemplate>
								<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" CssClass="rvdDeleteGridAction"><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
					</Columns>
				</asp:GridView>
				<div class="rvdActions">
					<asp:LinkButton ID="AddFieldConfigurablePriceLinkButton" runat="server" resourcekey="AddFieldConfigurablePriceLinkButton" OnClick="AddFieldConfigurablePriceLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdAddNewAction" />
				</div>
				<asp:Panel ID="FieldConfigurablePriceDetailsViewPanel" runat="server">
					<fieldset>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="IDFieldConfigurablePriceDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
							<asp:RequiredFieldValidator ID="IDFieldConfigurablePriceDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="IDFieldConfigurablePriceDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="FieldConfigurablePriceDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
							<asp:TextBox ID="IDFieldConfigurablePriceDetailsViewTextBox" runat="server" CssClass="dnnFormRequired"></asp:TextBox>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="OperatorFieldConfigurablePriceDetailsViewLabelControl" runat="server" />
							<asp:DropDownList ID="OperatorFieldConfigurablePriceDetailsViewDropDownList" runat="server">
								<asp:ListItem resourcekey="EqualOperatorLabel" Value="equal" />
								<asp:ListItem resourcekey="GreaterThanOperatorLabel" Value="greaterthan" />
								<asp:ListItem resourcekey="GreaterThanOrEqualOperatorLabel" Value="greaterthanorequal" />
								<asp:ListItem resourcekey="IsEmptyOperatorLabel" Value="isempty" />
								<asp:ListItem resourcekey="IsNotEmptyOperatorLabel" Value="isnotempty" />
								<asp:ListItem resourcekey="MatchOperatorLabel" Value="match" />
								<asp:ListItem resourcekey="LessThanOperatorLabel" Value="lessthan" />
								<asp:ListItem resourcekey="LessThanOrEqualOperatorLabel" Value="lessthanorequal" />
								<asp:ListItem resourcekey="NotEqualOperatorLabel" Value="notequal" />
								<asp:ListItem resourcekey="NotMatchOperatorLabel" Value="notmatch" />
							</asp:DropDownList>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="OperandFieldConfigurablePriceDetailsViewLabelControl" runat="server" />
							<asp:TextBox ID="OperandFieldConfigurablePriceDetailsViewTextBox" runat="server" TextMode="MultiLine" Height="100px"></asp:TextBox>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="PriceAdjustmentFieldConfigurablePriceLabelControl" runat="server" CssClass="dnnFormRequired"/>
							<asp:RequiredFieldValidator ID="PriceAdjustmentFieldConfigurablePriceRequiredFieldValidator" runat="server" ControlToValidate="PriceAdjustmentFieldConfigurablePriceTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="FieldConfigurablePriceDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
							<asp:CompareValidator ID="PriceAdjustmentFieldConfigurablePriceCompareValidator" runat="server" ControlToValidate="PriceAdjustmentFieldConfigurablePriceTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="FieldConfigurablePriceDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
							<asp:TextBox ID="PriceAdjustmentFieldConfigurablePriceTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
							<asp:DropDownList ID="PriceAdjustmentUnitFieldConfigurablePriceDropDownList" runat="server" CssClass="rvdUnitInput">
								<asp:ListItem resourcekey="ByAmountLabel" Value="amount" />
								<asp:ListItem resourcekey="ByPercentageLabel" Value="rate" />
							</asp:DropDownList>
						</div>
					</fieldset>
					<div class="rvdActions">
						<asp:LinkButton ID="SaveFieldConfigurablePriceLinkButton" runat="server" resourcekey="SaveFieldConfigurablePriceLinkButton" OnClick="SaveFieldConfigurablePriceLinkButton_Click" ValidationGroup="FieldConfigurablePriceDetailsViewControl" CssClass="btn btn-primary rvdOKAction" />
					</div>
				</asp:Panel>
			</div>
		</div>
	</asp:View>
	<asp:View ID="TierPriceView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MinPriceTierPriceLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="MinPriceTierPriceRequiredFieldValidator" runat="server" ControlToValidate="MinPriceTierPriceTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="MinPriceTierPriceRangeValidator" runat="server" ControlToValidate="MinPriceTierPriceTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MinPriceTierPriceCompareValidator" runat="server" ControlToValidate="MinPriceTierPriceTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MinPriceTierPriceTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RangeTierPriceLabelControl" runat="server" />
			<div class="rvdFormSubContainer">
				<asp:PlaceHolder ID="RangeTierPriceMessagePlaceHolder" runat="server" />
				<asp:GridView ID="RangeTierPriceGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDeleting="RangeTierPriceGridView_RowDeleting" OnSelectedIndexChanged="RangeTierPriceGridView_SelectedIndexChanged" OnRowDataBound="RangeTierPriceGridView_RowDataBound">
					<PagerStyle CssClass="dnnGridPager" />
					<Columns>
						<asp:TemplateField HeaderText="QtyBegin">
							<ItemTemplate>
								<asp:LinkButton ID="SelectLinkButton" runat="server" Text='<%# Eval("QuantityBegin") %>' CommandName="Select" OnClientClick="event.stopPropagation()" ></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="QuantityEnd" HeaderText="QtyEnd" />
						<asp:BoundField DataField="Roles" HeaderText="Roles" />
						<asp:BoundField DataField="PriceAdjustment" HeaderText="PriceAdjustment" />
						<asp:TemplateField HeaderStyle-Width="5%">
							<ItemTemplate>
								<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
					</Columns>
				</asp:GridView>
				<div class="rvdActions">
					<asp:LinkButton ID="AddRangeTierPriceLinkButton" runat="server" resourcekey="AddRangeTierPriceLinkButton" OnClick="AddRangeTierPriceLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdAddNewAction" />
				</div>
				<asp:Panel ID="RangeTierPriceDetailsViewPanel" runat="server">
					<fieldset>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="QuantityBeginRangeTierPriceDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
							<asp:RequiredFieldValidator ID="QuantityBeginRangeTierPriceDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="QuantityBeginRangeTierPriceDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierPriceDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
							<asp:RangeValidator ID="QuantityBeginRangeTierPriceDetailsViewRangeValidator" runat="server" ControlToValidate="QuantityBeginRangeTierPriceDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="RangeTierPriceDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
							<asp:CompareValidator ID="QuantityBeginRangeTierPriceDetailsViewCompareValidator" runat="server" ControlToValidate="QuantityBeginRangeTierPriceDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="RangeTierPriceDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
							<asp:TextBox ID="QuantityBeginRangeTierPriceDetailsViewTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="QuantityEndRangeTierPriceDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
							<asp:RequiredFieldValidator ID="QuantityEndRangeTierPriceDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="QuantityEndRangeTierPriceDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierPriceDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
							<asp:RangeValidator ID="QuantityEndRangeTierPriceDetailsViewRangeValidator" runat="server" ControlToValidate="QuantityEndRangeTierPriceDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="RangeTierPriceDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
							<asp:CompareValidator ID="QuantityEndRangeTierPriceDetailsViewCompareValidator" runat="server" ControlToValidate="QuantityEndRangeTierPriceDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="RangeTierPriceDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
							<asp:TextBox ID="QuantityEndRangeTierPriceDetailsViewTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="RoleBehaviorRangeTierPriceDetailsLabelControl" runat="server" />
							<asp:RadioButtonList ID="RoleBehaviorRangeTierPriceDetailsRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
								<asp:ListItem resourcekey="AllowAllExceptSelectedBelowLabel" Value="exclusion" Selected="True" />
								<asp:ListItem resourcekey="AllowOnlyThoseSelectedBelowLabel" Value="inclusion" />
							</asp:RadioButtonList>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="RoleRangeTierPriceDetailsLabelControl" runat="server" />
							<div class="rvd-form-checkboxes">
								<asp:CheckBoxList ID="RoleRangeTierPriceDetailsCheckBoxList" runat="server" CssClass="rvdFormCheckBoxes" >
								</asp:CheckBoxList>
							</div>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="PriceAdjustmentTierPriceDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
							<asp:RequiredFieldValidator ID="PriceAdjustmentTierPriceDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="PriceAdjustmentTierPriceDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierPriceDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
							<asp:CompareValidator ID="PriceAdjustmentTierPriceDetailsViewCompareValidator" runat="server" ControlToValidate="PriceAdjustmentTierPriceDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
							<asp:TextBox ID="PriceAdjustmentTierPriceDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
							<asp:DropDownList ID="PriceAdjustmentUnitTierPriceDetailsViewDropDownList" runat="server" CssClass="rvdUnitInput">
								<asp:ListItem resourcekey="ByAmountLabel" Value="amount" />
								<asp:ListItem resourcekey="ByPercentageLabel" Value="rate" />
							</asp:DropDownList>
						</div>
					</fieldset>
					<div class="rvdActions">
						<asp:LinkButton ID="SaveRangeTierPriceLinkButton" runat="server" resourcekey="SaveRangeTierPriceLinkButton" OnClick="SaveRangeTierPriceLinkButton_Click" ValidationGroup="RangeTierPriceDetailsViewControl" CssClass="btn btn-primary rvdOKAction" />
					</div>
				</asp:Panel>
			</div>
		</div>
	</asp:View>
	<asp:View ID="CustomRuleView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ModifierRuleLabelControl" runat="server" />
			<uc1:FormulaEditorControl ID="ModifierRuleFormulaEditor" runat="server" Width="100%" ModuleControl="ProductVariantModifier" />
		</div>
	</asp:View>
</asp:MultiView>
