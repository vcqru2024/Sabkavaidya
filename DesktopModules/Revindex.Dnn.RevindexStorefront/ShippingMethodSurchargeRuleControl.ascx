<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShippingMethodSurchargeRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ShippingMethodSurchargeRuleControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/FormulaEditorControl.ascx" TagName="FormulaEditorControl" TagPrefix="uc1" %>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="RuleTypeLabelControl" runat="server" />
	<asp:DropDownList ID="RuleTypeDropDownList" runat="server" OnSelectedIndexChanged="RuleTypeDropDownList_SelectedIndexChanged" AutoPostBack="True">
		<asp:ListItem resourcekey="NoneLabel" Value=""></asp:ListItem>
		<asp:ListItem resourcekey="FlatAmountLabel" Value="FlatAmountView"></asp:ListItem>
		<asp:ListItem resourcekey="FlatRateLabel" Value="FlatRateView"></asp:ListItem>
		<asp:ListItem resourcekey="TierRateLabel" Value="TierRateView"></asp:ListItem>
		<asp:ListItem resourcekey="CustomRuleLabel" Value="CustomRuleView"></asp:ListItem>
	</asp:DropDownList>
</div>
<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="FlatAmountView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ShippingSurchargeAmountFlatAmountLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="ShippingSurchargeAmountFlatAmountRequiredFieldValidator" runat="server" ControlToValidate="ShippingSurchargeAmountFlatAmountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="ShippingSurchargeAmountFlatAmountRangeValidator" runat="server" ControlToValidate="ShippingSurchargeAmountFlatAmountTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="ShippingSurchargeAmountFlatAmountCompareValidator" runat="server" ControlToValidate="ShippingSurchargeAmountFlatAmountTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="ShippingSurchargeAmountFlatAmountTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="FlatRateView" runat="server">
		<div class="alert alert-info">
		<p><%= LocalizeString("FlatRateDescriptionLabel") %></p>
		<br/>
		<p><strong><%= LocalizeString("FlatRateFormulaLabel") %></strong></p>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="MinShippingSurchargeAmountFlatRateLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="MinShippingSurchargeAmountFlatRateRequiredFieldValidator" runat="server" ControlToValidate="MinShippingSurchargeAmountFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="MinShippingSurchargeAmountFlatRateRangeValidator" runat="server" ControlToValidate="MinShippingSurchargeAmountFlatRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MinShippingSurchargeAmountFlatRateCompareValidator" runat="server" ControlToValidate="MinShippingSurchargeAmountFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MinShippingSurchargeAmountFlatRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="BaseShippingSurchargeAmountFlatRateLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="BaseShippingSurchargeAmountFlatRateRequiredFieldValidator" runat="server" ControlToValidate="BaseShippingSurchargeAmountFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="BaseShippingSurchargeAmountFlatRateRangeValidator" runat="server" ControlToValidate="BaseShippingSurchargeAmountFlatRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="BaseShippingSurchargeAmountFlatRateCompareValidator" runat="server" ControlToValidate="BaseShippingSurchargeAmountFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="BaseShippingSurchargeAmountFlatRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ShippingSurchargeRateFlatRateLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="ShippingSurchargeRateFlatRateRequiredFieldValidator" runat="server" ControlToValidate="ShippingSurchargeRateFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="ShippingSurchargeRateFlatRateRangeValidator" runat="server" ControlToValidate="ShippingSurchargeRateFlatRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="ShippingSurchargeRateFlatRateCompareValidator" runat="server" ControlToValidate="ShippingSurchargeRateFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="ShippingSurchargeRateFlatRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MeasurementTypeFlatRateLabelControl" runat="server" />
			<asp:DropDownList ID="MeasurementTypeFlatRateDropDownList" runat="server">
				<asp:ListItem resourcekey="ShippingAmountLabel" Value="shippingAmount" />
				<asp:ListItem resourcekey="TotalAmountLabel" Value="amount" />
				<asp:ListItem resourcekey="TotalQuantityLabel" Value="quantity" />
				<asp:ListItem resourcekey="TotalWeightLabel" Value="weight" />
			</asp:DropDownList>
		</div>
	</asp:View>
	<asp:View ID="TierRateView" runat="server">
		<div class="alert alert-info">
		<p><%= LocalizeString("TierRateDescriptionLabel") %></p>
		<br/>
		<p><strong><%= LocalizeString("TierRateFormulaLabel") %></strong></p>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="MinShippingSurchargeAmountTierRateLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="MinShippingSurchargeAmountTierRateRequiredFieldValidator" runat="server" ControlToValidate="MinShippingSurchargeAmountTierRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="MinShippingSurchargeAmountTierRateRangeValidator" runat="server" ControlToValidate="MinShippingSurchargeAmountTierRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MinShippingSurchargeAmountTierRateCompareValidator" runat="server" ControlToValidate="MinShippingSurchargeAmountTierRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MinShippingSurchargeAmountTierRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="BaseShippingSurchargeAmountTierRateLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="BaseShippingSurchargeAmountTierRateRequiredFieldValidator" runat="server" ControlToValidate="BaseShippingSurchargeAmountTierRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="BaseShippingSurchargeAmountTierRateRangeValidator" runat="server" ControlToValidate="BaseShippingSurchargeAmountTierRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="BaseShippingSurchargeAmountTierRateCompareValidator" runat="server" ControlToValidate="BaseShippingSurchargeAmountTierRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="BaseShippingSurchargeAmountTierRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MeasurementTypeTierRateLabelControl" runat="server" />
			<asp:DropDownList ID="MeasurementTypeTierRateDropDownList" runat="server">
				<asp:ListItem resourcekey="ShippingAmountLabel" Value="shippingAmount" />
				<asp:ListItem resourcekey="TotalAmountLabel" Value="amount" />
				<asp:ListItem resourcekey="TotalQuantityLabel" Value="quantity" />
				<asp:ListItem resourcekey="TotalWeightLabel" Value="weight" />
			</asp:DropDownList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RangeTierRateLabelControl" runat="server" />
			<div class="rvdFormSubContainer">
				<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
				<asp:GridView ID="RangeTierRateGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AutoGenerateColumns="False" DataKeyNames="Begin,End" OnRowDeleting="RangeTierRateGridView_RowDeleting" OnSelectedIndexChanged="RangeTierRateGridView_SelectedIndexChanged" OnRowDataBound="RangeTierRateGridView_RowDataBound">
					<PagerStyle CssClass="dnnGridPager" />
					<Columns>
						<asp:TemplateField HeaderText="Begin">
							<ItemTemplate>
								<asp:LinkButton ID="SelectLinkButton" runat="server" Text='<%# Eval("Begin") %>' CommandName="Select" OnClientClick="event.stopPropagation()" ></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="End" HeaderText="End" />
                        <asp:BoundField DataField="ShippingSurchargeAmount" HeaderText="Amount" />
						<asp:BoundField DataField="ShippingSurchargeRate" HeaderText="Rate" />
						<asp:TemplateField HeaderStyle-Width="10%">
							<ItemTemplate>
								<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
					</Columns>
				</asp:GridView>
				<div class="rvdActions">
					<asp:LinkButton ID="AddRangeTierRateLinkButton" runat="server" resourcekey="AddRangeTierRateLinkButton" OnClick="AddRangeTierRateLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdAddNewAction" />
				</div>
				<asp:Panel ID="RangeTierRateDetailsViewPanel" runat="server">
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="BeginRangeTierRateDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
						<asp:RequiredFieldValidator ID="BeginRangeTierRateDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="BeginRangeTierRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
						<asp:RangeValidator ID="BeginRangeTierRateDetailsViewRangeValidator" runat="server" ControlToValidate="BeginRangeTierRateDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:CompareValidator ID="BeginRangeTierRateDetailsViewCompareValidator" runat="server" ControlToValidate="BeginRangeTierRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
						<asp:TextBox ID="BeginRangeTierRateDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="EndRangeTierRateDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
						<asp:RequiredFieldValidator ID="EndRangeTierRateDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="EndRangeTierRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
						<asp:RangeValidator ID="EndRangeTierRateDetailsViewRangeValidator" runat="server" ControlToValidate="EndRangeTierRateDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:CompareValidator ID="EndRangeTierRateDetailsViewCompareValidator" runat="server" ControlToValidate="EndRangeTierRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
						<asp:TextBox ID="EndRangeTierRateDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
					</div>
                    <div class="dnnFormItem">
						<dnn1:LabelControl ID="ShippingSurchargeAmountTierRateDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
						<asp:RequiredFieldValidator ID="ShippingSurchargeAmountTierRateDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="ShippingSurchargeAmountTierRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
						<asp:RangeValidator ID="ShippingSurchargeAmountTierRateDetailsViewRangeValidator" runat="server" ControlToValidate="ShippingSurchargeAmountTierRateDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:CompareValidator ID="ShippingSurchargeAmountTierRateDetailsViewCompareValidator" runat="server" ControlToValidate="ShippingSurchargeAmountTierRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
						<asp:TextBox ID="ShippingSurchargeAmountTierRateDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="ShippingSurchargeRateTierRateDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
						<asp:RequiredFieldValidator ID="ShippingSurchargeRateTierRateDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="ShippingSurchargeRateTierRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
						<asp:RangeValidator ID="ShippingSurchargeRateTierRateDetailsViewRangeValidator" runat="server" ControlToValidate="ShippingSurchargeRateTierRateDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:CompareValidator ID="ShippingSurchargeRateTierRateDetailsViewCompareValidator" runat="server" ControlToValidate="ShippingSurchargeRateTierRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
						<asp:TextBox ID="ShippingSurchargeRateTierRateDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
					</div>
					<div class="rvdActions">
						<asp:LinkButton ID="SaveRangeTierRateLinkButton" runat="server" resourcekey="SaveRangeTierRateLinkButton" OnClick="SaveRangeTierRateLinkButton_Click" ValidationGroup="RangeTierRateDetailsViewControl" CssClass="btn btn-primary rvdOKAction" />
					</div>
				</asp:Panel>
			</div>
		</div>
	</asp:View>
	<asp:View ID="CustomRuleView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="SurchargeRuleLabelControl" runat="server" />
			<uc1:FormulaEditorControl ID="SurchargeRuleFormulaEditor" runat="server" Width="100%" ModuleControl="ShippingMethodSurcharge" />
		</div>
	</asp:View>
</asp:MultiView>
