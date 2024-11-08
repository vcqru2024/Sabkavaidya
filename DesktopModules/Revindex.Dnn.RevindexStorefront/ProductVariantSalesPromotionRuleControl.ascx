<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductVariantSalesPromotionRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductVariantSalesPromotionRuleControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/FormulaEditorControl.ascx" TagName="FormulaEditorControl" TagPrefix="uc1" %>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="RuleTypeLabelControl" runat="server" />
	<asp:DropDownList ID="RuleTypeDropDownList" runat="server" OnSelectedIndexChanged="RuleTypeDropDownList_SelectedIndexChanged" AutoPostBack="True">
		<asp:ListItem resourcekey="NoneLabel" Value=""></asp:ListItem>
		<asp:ListItem resourcekey="FlatPriceLabel" Value="FlatPriceView"></asp:ListItem>
		<asp:ListItem resourcekey="FlatDiscountLabel" Value="FlatDiscountView"></asp:ListItem>
		<asp:ListItem resourcekey="TierDiscountLabel" Value="TierDiscountView"></asp:ListItem>
		<asp:ListItem resourcekey="CustomRuleLabel" Value="CustomRuleView"></asp:ListItem>
	</asp:DropDownList>
</div>
<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="FlatPriceView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="PromotionPriceFlatPriceLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="PromotionPriceFlatPriceRequiredFieldValidator" runat="server" ControlToValidate="PromotionPriceFlatPriceTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="PromotionPriceFlatPriceRangeValidator" runat="server" ControlToValidate="PromotionPriceFlatPriceTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="PromotionPriceFlatPriceCompareValidator" runat="server" ControlToValidate="PromotionPriceFlatPriceTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="PromotionPriceFlatPriceTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="FlatDiscountView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="DiscountAmountFlatDiscountLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="DiscountAmountFlatDiscountRequiredFieldValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="DiscountAmountFlatDiscountRangeValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="DiscountAmountFlatDiscountCompareValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="DiscountAmountFlatDiscountTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
			<asp:DropDownList ID="DiscountAmountUnitFlatDiscountDropDownList" runat="server" CssClass="rvdUnitInput">
				<asp:ListItem resourcekey="ByAmountLabel" Value="amount" />
				<asp:ListItem resourcekey="ByPercentageLabel" Value="rate" />
			</asp:DropDownList>
		</div>
	</asp:View>
	<asp:View ID="TierDiscountView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MinPromotionPriceTierDiscountLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="MinPromotionPriceTierDiscountRequiredFieldValidator" runat="server" ControlToValidate="MinPromotionPriceTierDiscountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="MinPromotionPriceTierDiscountRangeValidator" runat="server" ControlToValidate="MinPromotionPriceTierDiscountTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MinPromotionPriceTierDiscountCompareValidator" runat="server" ControlToValidate="MinPromotionPriceTierDiscountTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MinPromotionPriceTierDiscountTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RangeTierDiscounteLabelControl" runat="server" />
			<div class="rvdFormSubContainer">
				<asp:PlaceHolder ID="RangeTierDiscountMessagePlaceHolder" runat="server" />
				<asp:GridView ID="RangeTierDiscountGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDeleting="RangeTierDiscountGridView_RowDeleting" OnSelectedIndexChanged="RangeTierDiscountGridView_SelectedIndexChanged" OnRowDataBound="RangeTierDiscountGridView_RowDataBound">
					<PagerStyle CssClass="dnnGridPager" />
					<Columns>
						<asp:TemplateField HeaderText="QtyBegin">
							<ItemTemplate>
								<asp:LinkButton ID="SelectLinkButton" runat="server" Text='<%# Eval("QuantityBegin") %>' CommandName="Select" OnClientClick="event.stopPropagation()" ></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="QuantityEnd" HeaderText="QtyEnd" />
						<asp:BoundField DataField="Roles" HeaderText="Roles" />
						<asp:BoundField DataField="Discount" HeaderText="Discount" />
						<asp:TemplateField HeaderStyle-Width="5%">
							<ItemTemplate>
								<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
					</Columns>
				</asp:GridView>
				<div class="rvdActions">
					<asp:LinkButton ID="AddRangeTierDiscountLinkButton" runat="server" resourcekey="AddRangeTierDiscountLinkButton" OnClick="AddRangeTierDiscountLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdAddNewAction" />
				</div>
				<asp:Panel ID="RangeTierDiscountDetailsViewPanel" runat="server">
					<fieldset>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="QuantityBeginRangeTierDiscountDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
							<asp:RequiredFieldValidator ID="QuantityBeginRangeTierDiscountDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="QuantityBeginRangeTierDiscountDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierDiscountDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
							<asp:RangeValidator ID="QuantityBeginRangeTierDiscountDetailsViewRangeValidator" runat="server" ControlToValidate="QuantityBeginRangeTierDiscountDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="RangeTierDiscountDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
							<asp:CompareValidator ID="QuantityBeginRangeTierDiscountDetailsViewCompareValidator" runat="server" ControlToValidate="QuantityBeginRangeTierDiscountDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="RangeTierDiscountDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
							<asp:TextBox ID="QuantityBeginRangeTierDiscountDetailsViewTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="QuantityEndRangeTierDiscountDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
							<asp:RequiredFieldValidator ID="QuantityEndRangeTierDiscountDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="QuantityEndRangeTierDiscountDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierDiscountDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
							<asp:RangeValidator ID="QuantityEndRangeTierDiscountDetailsViewRangeValidator" runat="server" ControlToValidate="QuantityEndRangeTierDiscountDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="RangeTierDiscountDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
							<asp:CompareValidator ID="QuantityEndRangeTierDiscountDetailsViewCompareValidator" runat="server" ControlToValidate="QuantityEndRangeTierDiscountDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="RangeTierDiscountDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
							<asp:TextBox ID="QuantityEndRangeTierDiscountDetailsViewTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="RoleBehaviorRangeTierDiscountDetailsLabelControl" runat="server" />
							<asp:RadioButtonList ID="RoleBehaviorRangeTierDiscountDetailsRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
								<asp:ListItem resourcekey="AllowAllExceptSelectedBelowLabel" Value="exclusion" Selected="True" />
								<asp:ListItem resourcekey="AllowOnlyThoseSelectedBelowLabel" Value="inclusion" />
							</asp:RadioButtonList>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="RoleRangeTierDiscountDetailsLabelControl" runat="server" />
							<div class="rvd-form-checkboxes">
								<asp:CheckBoxList ID="RoleRangeTierDiscountDetailsCheckBoxList" runat="server" CssClass="rvdFormCheckBoxes" >
								</asp:CheckBoxList>
							</div>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="DiscountTierDiscountDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
							<asp:RequiredFieldValidator ID="DiscountTierDiscountDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="DiscountTierDiscountDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierDiscountDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
							<asp:CompareValidator ID="DiscountTierDiscountDetailsViewCompareValidator" runat="server" ControlToValidate="DiscountTierDiscountDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="RangeTierDiscountDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
							<asp:TextBox ID="DiscountTierDiscountDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
							<asp:DropDownList ID="DiscountUnitTierDiscountDetailsViewDropDownList" runat="server" CssClass="rvdUnitInput">
								<asp:ListItem resourcekey="ByAmountLabel" Value="amount" />
								<asp:ListItem resourcekey="ByPercentageLabel" Value="rate" />
							</asp:DropDownList>
						</div>
					</fieldset>
					<div class="rvdActions">
						<asp:LinkButton ID="SaveRangeTierDiscountLinkButton" runat="server" resourcekey="SaveRangeTierDiscountLinkButton" OnClick="SaveRangeTierDiscountLinkButton_Click" ValidationGroup="RangeTierDiscountDetailsViewControl" CssClass="btn btn-primary rvdOKAction" />
					</div>
				</asp:Panel>
			</div>
		</div>
	</asp:View>
	<asp:View ID="CustomRuleView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RateRuleLabelControl" runat="server" />
			<uc1:FormulaEditorControl ID="RateRuleFormulaEditor" runat="server" Width="100%" ModuleControl="ProductVariantSalesPromotion" />
		</div>
	</asp:View>
</asp:MultiView>
