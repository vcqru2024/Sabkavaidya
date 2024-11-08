<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesPromotionPromotionRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.SalesPromotionPromotionRuleControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="DotNetNuke.Web.Client" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" TagPrefix="dnn3" %>
<%@ Register Src="WebUserControls/FormulaEditorControl.ascx" TagName="FormulaEditorControl" TagPrefix="uc1" %>
<%@ Register Src="CategoryCheckBoxListControl.ascx" TagName="CategoryCheckBoxListControl" TagPrefix="uc1" %>
<dnn3:DnnCssInclude runat="server" FilePath="../_default/WebControlSkin/Default/ComboBox.Default.css" PathNameAlias="SkinPath" />

<script type="text/javascript">	
    // Bind Kendo UI
    Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))
    })
</script>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="PromotionTypeLabelControl" runat="server" />
	<asp:DropDownList ID="PromotionTypeDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="PromotionTypeDropDownList_SelectedIndexChanged">
		<asp:ListItem Value="1" resourcekey="ProductPromotionTypeLabel" ></asp:ListItem>
		<asp:ListItem Value="2" resourcekey="SalesOrderDetailPromotionTypeLabel" ></asp:ListItem>
		<asp:ListItem Value="3" resourcekey="ShippingPromotionTypeLabel" ></asp:ListItem>
		<asp:ListItem Value="4" resourcekey="HandlingPromotionTypeLabel" ></asp:ListItem>
		<asp:ListItem Value="5" resourcekey="TaxPromotionTypeLabel" ></asp:ListItem>
	</asp:DropDownList>
</div>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="RuleTypeLabelControl" runat="server" />
	<asp:DropDownList ID="RuleTypeDropDownList" runat="server" OnSelectedIndexChanged="RuleTypeDropDownList_SelectedIndexChanged" AutoPostBack="True" >
	</asp:DropDownList>
</div>
<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="FlatPriceProductView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="PromotionPriceFlatPriceProductLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="PromotionPriceFlatPriceProductRequiredFieldValidator" runat="server" ControlToValidate="PromotionPriceFlatPriceProductTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="PromotionPriceFlatPriceProductRangeValidator" runat="server" ControlToValidate="PromotionPriceFlatPriceProductTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="PromotionPriceFlatPriceProductCompareValidator" runat="server" ControlToValidate="PromotionPriceFlatPriceProductTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="PromotionPriceFlatPriceProductTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="FlatDiscountProductView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="DiscountAmountFlatDiscountProductLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="DiscountAmountFlatDiscountProductRequiredFieldValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountProductTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="DiscountAmountFlatDiscountProductRangeValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountProductTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="DiscountAmountFlatDiscountProductCompareValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountProductTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="DiscountAmountFlatDiscountProductTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
			<asp:DropDownList ID="DiscountAmountUnitFlatDiscountProductDropDownList" runat="server" CssClass="rvdUnitInput">
				<asp:ListItem resourcekey="ByAmountLabel" Value="amount" />
				<asp:ListItem resourcekey="ByPercentageLabel" Value="rate" />
			</asp:DropDownList>
		</div>
	</asp:View>
	<asp:View ID="TierDiscountProductView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MinPromotionPriceTierDiscountProductLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="MinPromotionPriceTierDiscountProductRequiredFieldValidator" runat="server" ControlToValidate="MinPromotionPriceTierDiscountProductTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="MinPromotionPriceTierDiscountProductRangeValidator" runat="server" ControlToValidate="MinPromotionPriceTierDiscountProductTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MinPromotionPriceTierDiscountProductCompareValidator" runat="server" ControlToValidate="MinPromotionPriceTierDiscountProductTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MinPromotionPriceTierDiscountProductTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RangeTierDiscountProductLabelControl" runat="server" />
			<div class="rvdFormSubContainer">
				<asp:PlaceHolder ID="RangeTierDiscountProductMessagePlaceHolder" runat="server" />
				<asp:GridView ID="RangeTierDiscountProductGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDeleting="RangeTierDiscountProductGridView_RowDeleting" OnSelectedIndexChanged="RangeTierDiscountProductGridView_SelectedIndexChanged" OnRowDataBound="RangeTierDiscountProductGridView_RowDataBound">
					<PagerStyle CssClass="dnnGridPager" />
					<Columns>
						<asp:TemplateField HeaderText="QtyBegin">
							<ItemTemplate>
								<asp:LinkButton ID="SelectLinkButton" runat="server" Text='<%# Eval("QuantityBegin") %>' CommandName="Select" OnClientClick="event.stopPropagation()" ></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="QuantityEnd" HeaderText="QtyEnd" />
						<asp:BoundField DataField="Categories" HeaderText="Categories" />
						<asp:BoundField DataField="Roles" HeaderText="Roles" />
						<asp:BoundField DataField="Discount" HeaderText="Discount" />
						<asp:TemplateField HeaderStyle-Width="10%">
							<ItemTemplate>
								<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
					</Columns>
				</asp:GridView>
				<div class="rvdActions">
					<asp:LinkButton ID="AddRangeTierDiscountProductLinkButton" runat="server" resourcekey="AddRangeTierDiscountProductLinkButton" OnClick="AddRangeTierDiscountProductLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdAddNewAction" />
				</div>
				<asp:Panel ID="RangeTierDiscountProductDetailsViewPanel" runat="server">
					<fieldset>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="QuantityBeginRangeTierDiscountProductDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
							<asp:RequiredFieldValidator ID="QuantityBeginRangeTierDiscountProductDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="QuantityBeginRangeTierDiscountProductDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierPriceDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
							<asp:RangeValidator ID="QuantityBeginRangeTierDiscountProductDetailsViewRangeValidator" runat="server" ControlToValidate="QuantityBeginRangeTierDiscountProductDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="RangeTierPriceDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
							<asp:CompareValidator ID="QuantityBeginRangeTierDiscountProductDetailsViewCompareValidator" runat="server" ControlToValidate="QuantityBeginRangeTierDiscountProductDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="RangeTierPriceDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
							<asp:TextBox ID="QuantityBeginRangeTierDiscountProductDetailsViewTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="QuantityEndRangeTierDiscountProductDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
							<asp:RequiredFieldValidator ID="QuantityEndRangeTierDiscountProductDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="QuantityEndRangeTierDiscountProductDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierDiscountProductDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
							<asp:RangeValidator ID="QuantityEndRangeTierDiscountProductDetailsViewRangeValidator" runat="server" ControlToValidate="QuantityEndRangeTierDiscountProductDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="RangeTierDiscountProductDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
							<asp:CompareValidator ID="QuantityEndRangeTierDiscountProductDetailsViewCompareValidator" runat="server" ControlToValidate="QuantityEndRangeTierDiscountProductDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="RangeTierDiscountProductDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
							<asp:TextBox ID="QuantityEndRangeTierDiscountProductDetailsViewTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="CategoryBehaviorRangeTierDiscountProductDetailsLabelControl" runat="server" />
							<asp:RadioButtonList ID="CategoryBehaviorRangeTierDiscountProductDetailsRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
								<asp:ListItem resourcekey="AllowAllExceptSelectedBelowLabel" Value="exclusion" Selected="True" />
								<asp:ListItem resourcekey="AllowOnlyThoseSelectedBelowLabel" Value="inclusion" />
							</asp:RadioButtonList>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="CategoryRangeTierDiscountProductDetailsLabelControl" runat="server" />
							<uc1:CategoryCheckBoxListControl ID="CategoryRangeTierDiscountProductDetailsCategoryCheckBoxListControl" runat="server" />
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="RoleBehaviorRangeTierDiscountProductDetailsLabelControl" runat="server" />
							<asp:RadioButtonList ID="RoleBehaviorRangeTierDiscountProductDetailsRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
								<asp:ListItem resourcekey="AllowAllExceptSelectedBelowLabel" Value="exclusion" Selected="True" />
								<asp:ListItem resourcekey="AllowOnlyThoseSelectedBelowLabel" Value="inclusion" />
							</asp:RadioButtonList>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="RoleRangeTierDiscountProductDetailsLabelControl" runat="server" />
							<div class="rvd-form-checkboxes">
								<asp:CheckBoxList ID="RoleRangeTierDiscountProductDetailsCheckBoxList" runat="server" CssClass="rvdFormCheckBoxes" >
								</asp:CheckBoxList>
							</div>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="DiscountTierDiscountProductDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
							<asp:RequiredFieldValidator ID="DiscountTierDiscountProductDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="DiscountTierDiscountProductDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierDiscountProductDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
							<asp:CompareValidator ID="DiscountTierDiscountProductDetailsViewCompareValidator" runat="server" ControlToValidate="DiscountTierDiscountProductDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
							<asp:TextBox ID="DiscountTierDiscountProductDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
							<asp:DropDownList ID="DiscountUnitTierDiscountProductDetailsViewDropDownList" runat="server" CssClass="rvdUnitInput">
								<asp:ListItem resourcekey="ByAmountLabel" Value="amount" />
								<asp:ListItem resourcekey="ByPercentageLabel" Value="rate" />
							</asp:DropDownList>
						</div>
					</fieldset>
					<div class="rvdActions">
						<asp:LinkButton ID="SaveRangeTierDiscountProductLinkButton" runat="server" resourcekey="SaveRangeTierDiscountProductLinkButton" OnClick="SaveRangeTierDiscountProductLinkButton_Click"  ValidationGroup="RangeTierDiscountProductDetailsViewControl" CssClass="btn btn-primary rvdOKAction" />
					</div>
				</asp:Panel>
			</div>
		</div>
	</asp:View>
	<asp:View ID="FlatDiscountSalesOrderDetailView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="DiscountAmountFlatDiscountSalesOrderDetailLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="DiscountAmountFlatDiscountSalesOrderDetailRequiredFieldValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountSalesOrderDetailTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="DiscountAmountFlatDiscountSalesOrderDetailRangeValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountSalesOrderDetailTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="DiscountAmountFlatDiscountSalesOrderDetailCompareValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountSalesOrderDetailTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="DiscountAmountFlatDiscountSalesOrderDetailTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
			<asp:DropDownList ID="DiscountAmountUnitFlatDiscountSalesOrderDetailDropDownList" runat="server" CssClass="rvdUnitInput">
				<asp:ListItem resourcekey="ByAmountLabel" Value="amount" />
				<asp:ListItem resourcekey="ByPercentageLabel" Value="rate" />
			</asp:DropDownList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CouponFlatDiscountSalesOrderDetailLabelControl" runat="server" />
			<asp:DropDownList ID="CouponFlatDiscountSalesOrderDetailDropDownList" runat="server">
			</asp:DropDownList>
			<asp:LinkButton ID="CouponFlatDiscountSalesOrderDetailLinkButton" runat="server" OnClick="CouponFlatDiscountSalesOrderDetailLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
			<asp:LinkButton ID="GenerateCouponFlatDiscountSalesOrderDetailLinkButton" runat="server" OnClick="GenerateCouponFlatDiscountSalesOrderDetailLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-plus fa fas fa-plus"></em> <%= LocalizeString("NewLink") %></asp:LinkButton>

		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductVariantBehaviorFlatDiscountSalesOrderDetailLabelControl" runat="server" />
			<asp:RadioButtonList ID="ProductVariantBehaviorFlatDiscountSalesOrderDetailRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem resourcekey="AllowAllExceptListedSelectedBelowLabel" Value="exclusion" Selected="True" />
				<asp:ListItem resourcekey="AllowOnlyThoseListedSelectedBelowLabel" Value="inclusion" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductVariantInclusionFlatDiscountSalesOrderDetailLabelControl" runat="server"/>
			<div class="rvdFormSubContainer">
				<asp:TextBox ID="ProductVariantInclusionFlatDiscountSalesOrderDetailTextBox" runat="server" style="width:100%" data-role="combobox" data-clear-button="true" data-text-field="TextField" data-value-field="ProductVariantID" 
                    data-source="{
						serverFiltering: true,
						serverPaging: true,
						pageSize: 50,
						transport: {
							read: {
								type: 'POST',
								url: function () { return servicesFramework.getServiceRoot('Revindex.Dnn.RevindexStorefront') + 'ProductVariant/Lookup' },
								beforeSend: servicesFramework.setModuleHeaders,
								dataType: 'json',
								contentType: 'application/json; charset=UTF-8'
							},
							parameterMap: function (data, type) {
								return kendo.stringify({
									Query: data.filter.filters.length &gt; 0 ? data.filter.filters[0].value : '',
									ItemIndex: 0,
									MaxItems: data.pageSize
								})
							}
						},
						schema: {
							data: function (response) {

								// We need to decycle any circular references because Kendo UI can only support flat structure
								var res = JSON.decycle(response)
								res = res.map(function (v) { v.TextField = v.Product.Name + (v.Name ? ' - ' + v.Name : '') + ' ' + (v.SKU ? v.SKU : ''); return v; })
								return res
							}
						},
						sort: [{ field: 'TextField', dir: 'asc' }]
					}" 
                    data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="ProductVariantInclusionFlatDiscountSalesOrderDetailTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
				<asp:CheckBoxList ID="ProductVariantInclusionFlatDiscountSalesOrderDetailCheckBoxList" runat="server" CssClass="rvd-form-checklist" OnSelectedIndexChanged="ProductVariantInclusionFlatDiscountSalesOrderDetailCheckBoxList_SelectedIndexChanged" AutoPostBack="true"></asp:CheckBoxList>
			</div>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CategoryInclusionFlatDiscountSalesOrderDetailLabelControl" runat="server" />
			<uc1:CategoryCheckBoxListControl ID="CategoryInclusionFlatDiscountSalesOrderDetailCategoryCheckBoxListControl" runat="server" />
		</div>
	</asp:View>
	<asp:View ID="BuyXGetYDiscountSalesOrderDetailView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CouponBuyXGetYDiscountSalesOrderDetailLabelControl" runat="server" />
			<asp:DropDownList ID="CouponBuyXGetYDiscountSalesOrderDetailDropDownList" runat="server">
			</asp:DropDownList>
			<asp:LinkButton ID="CouponBuyXGetYDiscountSalesOrderDetailLinkButton" runat="server" OnClick="CouponBuyXGetYDiscountSalesOrderDetailLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
			<asp:LinkButton ID="GenerateCouponBuyXGetYDiscountSalesOrderDetailLinkButton" runat="server" OnClick="GenerateCouponBuyXGetYDiscountSalesOrderDetailLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-plus fa fas fa-plus"></em> <%= LocalizeString("NewLink") %></asp:LinkButton>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RoleBehaviorBuyXGetYDiscountSalesOrderDetailLabelControl" runat="server" />
			<asp:RadioButtonList ID="RoleBehaviorBuyXGetYDiscountSalesOrderDetailRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem resourcekey="AllowAllExceptSelectedBelowLabel" Value="exclusion" Selected="True" />
				<asp:ListItem resourcekey="AllowOnlyThoseSelectedBelowLabel" Value="inclusion" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RoleBuyXGetYDiscountSalesOrderDetailLabelControl" runat="server" />
			<div class="rvd-form-checkboxes">
				<asp:CheckBoxList ID="RoleBuyXGetYDiscountSalesOrderDetailCheckBoxList" runat="server" CssClass="rvdFormCheckBoxes" >
				</asp:CheckBoxList>
			</div>
		</div>
		<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("BuyHeader") %></a></h2>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="BuyQuantityBuyXGetYDiscountSalesOrderDetailLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="BuyQuantityBuyXGetYDiscountSalesOrderDetailRequiredFieldValidator" runat="server" ControlToValidate="BuyQuantityBuyXGetYDiscountSalesOrderDetailTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="BuyQuantityBuyXGetYDiscountSalesOrderDetailRangeValidator" runat="server" ControlToValidate="BuyQuantityBuyXGetYDiscountSalesOrderDetailTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="BuyQuantityBuyXGetYDiscountSalesOrderDetailCompareValidator" runat="server" ControlToValidate="BuyQuantityBuyXGetYDiscountSalesOrderDetailTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="BuyQuantityBuyXGetYDiscountSalesOrderDetailTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="BuyProductVariantBehaviorBuyXGetYDiscountSalesOrderDetailLabelControl" runat="server" />
			<asp:RadioButtonList ID="BuyProductVariantBehaviorBuyXGetYDiscountSalesOrderDetailRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem resourcekey="AllowAllExceptListedSelectedBelowLabel" Value="exclusion" Selected="True" />
				<asp:ListItem resourcekey="AllowOnlyThoseListedSelectedBelowLabel" Value="inclusion" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="BuyProductVariantInclusionBuyXGetYDiscountSalesOrderDetailLabelControl" runat="server"/>
			<div class="rvdFormSubContainer">
				<asp:TextBox ID="BuyProductVariantInclusionBuyXGetYDiscountSalesOrderDetailTextBox" runat="server" style="width:100%" data-role="combobox" data-clear-button="true" data-text-field="TextField" data-value-field="ProductVariantID" 
                    data-source="{
						serverFiltering: true,
						serverPaging: true,
						pageSize: 50,
						transport: {
							read: {
								type: 'POST',
								url: function () { return servicesFramework.getServiceRoot('Revindex.Dnn.RevindexStorefront') + 'ProductVariant/Lookup' },
								beforeSend: servicesFramework.setModuleHeaders,
								dataType: 'json',
								contentType: 'application/json; charset=UTF-8'
							},
							parameterMap: function (data, type) {
								return kendo.stringify({
									Query: data.filter.filters.length &gt; 0 ? data.filter.filters[0].value : '',
									ItemIndex: 0,
									MaxItems: data.pageSize
								})
							}
						},
						schema: {
							data: function (response) {

								// We need to decycle any circular references because Kendo UI can only support flat structure
								var res = JSON.decycle(response)
								res = res.map(function (v) { v.TextField = v.Product.Name + (v.Name ? ' - ' + v.Name : '') + ' ' + (v.SKU ? v.SKU : ''); return v; })
								return res
							}
						},
						sort: [{ field: 'TextField', dir: 'asc' }]
					}" 
                    data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="BuyProductVariantInclusionBuyXGetYDiscountSalesOrderDetailTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
				<asp:CheckBoxList ID="BuyProductVariantInclusionBuyXGetYDiscountSalesOrderDetailCheckBoxList" runat="server" CssClass="rvd-form-checklist" OnSelectedIndexChanged="BuyProductVariantInclusionBuyXGetYDiscountSalesOrderDetailCheckBoxList_SelectedIndexChanged" AutoPostBack="True"></asp:CheckBoxList>
			</div>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="BuyCategoryBuyXGetYDiscountSalesOrderDetailLabelControl" runat="server" />
			<uc1:CategoryCheckBoxListControl ID="BuyCategoryBuyXGetYDiscountSalesOrderDetailCategoryCheckBoxListControl" runat="server" />
		</div>
		<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("GetHeader") %></a></h2>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GetQuantityBuyXGetYDiscountSalesOrderDetailLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="GetQuantityBuyXGetYDiscountSalesOrderDetailRequiredFieldValidator" runat="server" ControlToValidate="GetQuantityBuyXGetYDiscountSalesOrderDetailTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="GetQuantityBuyXGetYDiscountSalesOrderDetailRangeValidator" runat="server" ControlToValidate="GetQuantityBuyXGetYDiscountSalesOrderDetailTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="GetQuantityBuyXGetYDiscountSalesOrderDetailCompareValidator" runat="server" ControlToValidate="GetQuantityBuyXGetYDiscountSalesOrderDetailTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="GetQuantityBuyXGetYDiscountSalesOrderDetailTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GetProductVariantBehaviorBuyXGetYDiscountSalesOrderDetailLabelControl" runat="server" />
			<asp:RadioButtonList ID="GetProductVariantBehaviorBuyXGetYDiscountSalesOrderDetailRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem resourcekey="AllowAllExceptListedSelectedBelowLabel" Value="exclusion" Selected="True" />
				<asp:ListItem resourcekey="AllowOnlyThoseListedSelectedBelowLabel" Value="inclusion" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GetProductVariantInclusionBuyXGetYDiscountSalesOrderDetailLabelControl" runat="server"/>
			<div class="rvdFormSubContainer">
				<asp:TextBox ID="GetProductVariantInclusionBuyXGetYDiscountSalesOrderDetailTextBox" runat="server" style="width:100%" data-role="combobox" data-clear-button="true" data-text-field="TextField" data-value-field="ProductVariantID" 
                    data-source="{
						serverFiltering: true,
						serverPaging: true,
						pageSize: 50,
						transport: {
							read: {
								type: 'POST',
								url: function () { return servicesFramework.getServiceRoot('Revindex.Dnn.RevindexStorefront') + 'ProductVariant/Lookup' },
								beforeSend: servicesFramework.setModuleHeaders,
								dataType: 'json',
								contentType: 'application/json; charset=UTF-8'
							},
							parameterMap: function (data, type) {
								return kendo.stringify({
									Query: data.filter.filters.length &gt; 0 ? data.filter.filters[0].value : '',
									ItemIndex: 0,
									MaxItems: data.pageSize
								})
							}
						},
						schema: {
							data: function (response) {

								// We need to decycle any circular references because Kendo UI can only support flat structure
								var res = JSON.decycle(response)
								res = res.map(function (v) { v.TextField = v.Product.Name + (v.Name ? ' - ' + v.Name : '') + ' ' + (v.SKU ? v.SKU : ''); return v; })
								return res
							}
						},
						sort: [{ field: 'TextField', dir: 'asc' }]
					}" 
                    data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="GetProductVariantInclusionBuyXGetYDiscountSalesOrderDetailTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
				<asp:CheckBoxList ID="GetProductVariantInclusionBuyXGetYDiscountSalesOrderDetailCheckBoxList" runat="server" CssClass="rvd-form-checklist" OnSelectedIndexChanged="GetProductVariantInclusionBuyXGetYDiscountSalesOrderDetailCheckBoxList_SelectedIndexChanged" AutoPostBack="True"></asp:CheckBoxList>
			</div>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GetCategoryBuyXGetYDiscountSalesOrderDetailLabelControl" runat="server" />
			<uc1:CategoryCheckBoxListControl ID="GetCategoryBuyXGetYDiscountSalesOrderDetailCategoryCheckBoxListControl" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="DiscountAmountBuyXGetYDiscountSalesOrderDetailLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="DiscountAmountBuyXGetYDiscountSalesOrderDetailRequiredFieldValidator" runat="server" ControlToValidate="DiscountAmountBuyXGetYDiscountSalesOrderDetailTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="DiscountAmountBuyXGetYDiscountSalesOrderDetailRangeValidator" runat="server" ControlToValidate="DiscountAmountBuyXGetYDiscountSalesOrderDetailTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="DiscountAmountBuyXGetYDiscountSalesOrderDetailCompareValidator" runat="server" ControlToValidate="DiscountAmountBuyXGetYDiscountSalesOrderDetailTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="DiscountAmountBuyXGetYDiscountSalesOrderDetailTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
			<asp:DropDownList ID="DiscountAmountUnitBuyXGetYDiscountSalesOrderDetailDropDownList" runat="server" CssClass="rvdUnitInput">
				<asp:ListItem resourcekey="ByAmountLabel" Value="amount" />
				<asp:ListItem resourcekey="ByPercentageLabel" Value="rate" />
			</asp:DropDownList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RepeatBuyXGetYDiscountSalesOrderDetailLabelControl" runat="server" />
			<asp:RangeValidator ID="RepeatBuyXGetYDiscountSalesOrderDetailRangeValidator" runat="server" ControlToValidate="RepeatBuyXGetYDiscountSalesOrderDetailTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="RepeatBuyXGetYDiscountSalesOrderDetailCompareValidator" runat="server" ControlToValidate="RepeatBuyXGetYDiscountSalesOrderDetailTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="RepeatBuyXGetYDiscountSalesOrderDetailTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="FlatDiscountShippingView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="DiscountAmountFlatDiscountShippingLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="DiscountAmountFlatDiscountShippingRequiredFieldValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountShippingTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="DiscountAmountFlatDiscountShippingRangeValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountShippingTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="DiscountAmountFlatDiscountShippingCompareValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountShippingTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="DiscountAmountFlatDiscountShippingTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
			<asp:DropDownList ID="DiscountAmountUnitFlatDiscountShippingDropDownList" runat="server" CssClass="rvdUnitInput">
				<asp:ListItem resourcekey="ByAmountLabel" Value="amount" />
				<asp:ListItem resourcekey="ByPercentageLabel" Value="rate" />
			</asp:DropDownList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CouponFlatDiscountShippingLabelControl" runat="server" />
			<asp:DropDownList ID="CouponFlatDiscountShippingDropDownList" runat="server">
			</asp:DropDownList>
			<asp:LinkButton ID="CouponFlatDiscountShippingLinkButton" runat="server" OnClick="CouponFlatDiscountShippingLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
			<asp:LinkButton ID="GenerateCouponFlatDiscountShippingLinkButton" runat="server" OnClick="GenerateCouponFlatDiscountShippingLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-plus fa fas fa-plus"></em> <%= LocalizeString("NewLink") %></asp:LinkButton>
		</div>
	</asp:View>
	<asp:View ID="FlatDiscountHandlingView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="DiscountAmountFlatDiscountHandlingLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="DiscountAmountFlatDiscountHandlingRequiredFieldValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountHandlingTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="DiscountAmountFlatDiscountHandlingRangeValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountHandlingTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="DiscountAmountFlatDiscountHandlingCompareValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountHandlingTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="DiscountAmountFlatDiscountHandlingTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
			<asp:DropDownList ID="DiscountAmountUnitFlatDiscountHandlingDropDownList" runat="server" CssClass="rvdUnitInput">
				<asp:ListItem resourcekey="ByAmountLabel" Value="amount" />
				<asp:ListItem resourcekey="ByPercentageLabel" Value="rate" />
			</asp:DropDownList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CouponFlatDiscountHandlingLabelControl" runat="server" />
			<asp:DropDownList ID="CouponFlatDiscountHandlingDropDownList" runat="server">
			</asp:DropDownList>
			<asp:LinkButton ID="CouponFlatDiscountHandlingLinkButton" runat="server" OnClick="CouponFlatDiscountHandlingLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
			<asp:LinkButton ID="GenerateCouponFlatDiscountHandlingLinkButton" runat="server" OnClick="GenerateCouponFlatDiscountHandlingLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-plus fa fas fa-plus"></em> <%= LocalizeString("NewLink") %></asp:LinkButton>
		</div>
	</asp:View>
	<asp:View ID="FlatDiscountTaxView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="DiscountAmountFlatDiscountTaxLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="DiscountAmountFlatDiscountTaxRequiredFieldValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountTaxTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="DiscountAmountFlatDiscountTaxRangeValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountTaxTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="DiscountAmountFlatDiscountTaxCompareValidator" runat="server" ControlToValidate="DiscountAmountFlatDiscountTaxTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="DiscountAmountFlatDiscountTaxTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
			<asp:DropDownList ID="DiscountAmountUnitFlatDiscountTaxDropDownList" runat="server" CssClass="rvdUnitInput">
				<asp:ListItem resourcekey="ByAmountLabel" Value="amount" />
				<asp:ListItem resourcekey="ByPercentageLabel" Value="rate" />
			</asp:DropDownList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CouponFlatDiscountTaxLabelControl" runat="server" />
			<asp:DropDownList ID="CouponFlatDiscountTaxDropDownList" runat="server">
			</asp:DropDownList>
			<asp:LinkButton ID="CouponFlatDiscountTaxLinkButton" runat="server" OnClick="CouponFlatDiscountTaxLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
			<asp:LinkButton ID="GenerateCouponFlatDiscountTaxLinkButton" runat="server" OnClick="GenerateCouponFlatDiscountTaxLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-plus fa fas fa-plus"></em> <%= LocalizeString("NewLink") %></asp:LinkButton>
		</div>
	</asp:View>
	<asp:View ID="CustomRuleView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="PromotionRuleLabelControl" runat="server" />
			<uc1:FormulaEditorControl ID="PromotionRuleFormulaEditor" runat="server" Width="100%" />
		</div>
	</asp:View>
</asp:MultiView>
