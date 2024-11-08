<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShippingMethodRateRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ShippingMethodRateRuleControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/FormulaEditorControl.ascx" TagName="FormulaEditorControl" TagPrefix="uc1" %>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="RuleTypeLabelControl" runat="server" />
	<asp:DropDownList ID="RuleTypeDropDownList" runat="server" OnSelectedIndexChanged="RuleTypeDropDownList_SelectedIndexChanged" AutoPostBack="True" >
		<asp:ListItem resourcekey="NoneLabel" Value=""></asp:ListItem>
		<asp:ListItem resourcekey="FlatAmountLabel" Value="FlatAmountView"></asp:ListItem>
		<asp:ListItem resourcekey="FlatRateLabel" Value="FlatRateView"></asp:ListItem>
		<asp:ListItem resourcekey="ProductRateLabel" Value="ProductRateView"></asp:ListItem>
		<asp:ListItem resourcekey="TierRateLabel" Value="TierRateView"></asp:ListItem>
		<asp:ListItem resourcekey="CustomRuleLabel" Value="CustomRuleView"></asp:ListItem>
	</asp:DropDownList>
</div>
<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="FlatAmountView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ShippingAmountFlatAmountLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="ShippingAmountFlatAmountRequiredFieldValidator" runat="server" ControlToValidate="ShippingAmountFlatAmountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="ShippingAmountFlatAmountRangeValidator" runat="server" ControlToValidate="ShippingAmountFlatAmountTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="ShippingAmountFlatAmountCompareValidator" runat="server" ControlToValidate="ShippingAmountFlatAmountTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="ShippingAmountFlatAmountTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="FlatRateView" runat="server">
		<div class="alert alert-info">
		<p><%= LocalizeString("FlatRateDescriptionLabel") %></p>
		<br/>
		<p><strong><%= LocalizeString("FlatRateFormulaLabel") %></strong></p>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="MinShippingAmountFlatRateLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="MinShippingAmountFlatRateRequiredFieldValidator" runat="server" ControlToValidate="MinShippingAmountFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="MinShippingAmountFlatRateRangeValidator" runat="server" ControlToValidate="MinShippingAmountFlatRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MinShippingAmountFlatRateCompareValidator" runat="server" ControlToValidate="MinShippingAmountFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MinShippingAmountFlatRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="BaseShippingAmountFlatRateLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="BaseShippingAmountFlatRateRequiredFieldValidator" runat="server" ControlToValidate="BaseShippingAmountFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="BaseShippingAmountFlatRateRangeValidator" runat="server" ControlToValidate="BaseShippingAmountFlatRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="BaseShippingAmountFlatRateCompareValidator" runat="server" ControlToValidate="BaseShippingAmountFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="BaseShippingAmountFlatRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ShippingRateFlatRateLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="ShippingRateFlatRateRequiredFieldValidator" runat="server" ControlToValidate="ShippingRateFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="ShippingRateFlatRateRangeValidator" runat="server" ControlToValidate="ShippingRateFlatRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="ShippingRateFlatRateCompareValidator" runat="server" ControlToValidate="ShippingRateFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="ShippingRateFlatRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MeasurementTypeFlatRateLabelControl" runat="server" />
			<asp:DropDownList ID="MeasurementTypeFlatRateDropDownList" runat="server">
				<asp:ListItem resourcekey="TotalAmountLabel" Value="amount" />
				<asp:ListItem resourcekey="TotalQuantityLabel" Value="quantity" />
				<asp:ListItem resourcekey="TotalWeightLabel" Value="weight" />
			</asp:DropDownList>
		</div>
	</asp:View>
	<asp:View ID="ProductRateView" runat="server">
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="MinShippingAmountProductRateLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="MinShippingAmountProductRateRequiredFieldValidator" runat="server" ControlToValidate="MinShippingAmountProductRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="MinShippingAmountProductRateRangeValidator" runat="server" ControlToValidate="MinShippingAmountProductRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MinShippingAmountProductRateCompareValidator" runat="server" ControlToValidate="MinShippingAmountProductRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MinShippingAmountProductRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="BaseShippingAmountProductRateLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="BaseShippingAmountProductRateRequiredFieldValidator" runat="server" ControlToValidate="BaseShippingAmountProductRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="BaseShippingAmountProductRateRangeValidator" runat="server" ControlToValidate="BaseShippingAmountProductRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="BaseShippingAmountProductRateCompareValidator" runat="server" ControlToValidate="BaseShippingAmountProductRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="BaseShippingAmountProductRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="TierRateView" runat="server">
		<div class="alert alert-info">
		<p><%= LocalizeString("TierRateDescriptionLabel") %></p>
		<br/>
		<p><strong><%= LocalizeString("TierRateFormulaLabel") %></strong></p>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="MinShippingAmountTierRateLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="MinShippingAmountTierRateRequiredFieldValidator" runat="server" ControlToValidate="MinShippingAmountTierRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="MinShippingAmountTierRateRangeValidator" runat="server" ControlToValidate="MinShippingAmountTierRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MinShippingAmountTierRateCompareValidator" runat="server" ControlToValidate="MinShippingAmountTierRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MinShippingAmountTierRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="BaseShippingAmountTierRateLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="BaseShippingAmountTierRateRequiredFieldValidator" runat="server" ControlToValidate="BaseShippingAmountTierRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="BaseShippingAmountTierRateRangeValidator" runat="server" ControlToValidate="BaseShippingAmountTierRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="BaseShippingAmountTierRateCompareValidator" runat="server" ControlToValidate="BaseShippingAmountTierRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="BaseShippingAmountTierRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MeasurementTypeTierRateLabelControl" runat="server"/>
			<asp:DropDownList ID="MeasurementTypeTierRateDropDownList" runat="server">
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
                        <asp:BoundField DataField="ShippingAmount" HeaderText="Amount" />
						<asp:BoundField DataField="ShippingRate" HeaderText="Rate" />
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
						<dnn1:LabelControl ID="ShippingAmountTierRateDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="ShippingAmountTierRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
						<asp:RangeValidator ID="ShippingAmountTierRateDetailsViewRangeValidator" runat="server" ControlToValidate="ShippingAmountTierRateDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:CompareValidator ID="ShippingAmountTierRateDetailsViewCompareValidator" runat="server" ControlToValidate="ShippingAmountTierRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
						<asp:TextBox ID="ShippingAmountTierRateDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="ShippingRateTierRateDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
						<asp:RequiredFieldValidator ID="ShippingRateTierRateDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="ShippingRateTierRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
						<asp:RangeValidator ID="ShippingRateTierRateDetailsViewRangeValidator" runat="server" ControlToValidate="ShippingRateTierRateDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:CompareValidator ID="ShippingRateTierRateDetailsViewCompareValidator" runat="server" ControlToValidate="ShippingRateTierRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
						<asp:TextBox ID="ShippingRateTierRateDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
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
			<dnn1:LabelControl ID="RateRuleLabelControl" runat="server" />
			<uc1:FormulaEditorControl ID="RateRuleFormulaEditor" runat="server" Width="100%" ModuleControl="ShippingMethodRate" />
		</div>
	</asp:View>
</asp:MultiView>
