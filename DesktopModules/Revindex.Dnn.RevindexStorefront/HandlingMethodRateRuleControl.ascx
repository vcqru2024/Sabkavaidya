<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HandlingMethodRateRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.HandlingMethodRateRuleControl" %>
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
		<asp:ListItem resourcekey="ProductRateLabel" Value="ProductRateView"></asp:ListItem>
		<asp:ListItem resourcekey="TierRateLabel" Value="TierRateView"></asp:ListItem>
		<asp:ListItem resourcekey="CustomRuleLabel" Value="CustomRuleView"></asp:ListItem>
	</asp:DropDownList>
</div>
<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="FlatAmountView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="HandlingAmountFlatAmountLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="HandlingAmountFlatAmountRequiredFieldValidator" runat="server" ControlToValidate="HandlingAmountFlatAmountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="HandlingAmountFlatAmountRangeValidator" runat="server" ControlToValidate="HandlingAmountFlatAmountTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="HandlingAmountFlatAmountCompareValidator" runat="server" ControlToValidate="HandlingAmountFlatAmountTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="HandlingAmountFlatAmountTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="FlatRateView" runat="server">
		<div class="alert alert-info">
		<p><%= LocalizeString("FlatRateDescriptionLabel") %></p>
		<br/>
		<p><strong><%= LocalizeString("FlatRateFormulaLabel") %></strong></p>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="MinHandlingAmountFlatRateLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="MinHandlingAmountFlatRateRequiredFieldValidator" runat="server" ControlToValidate="MinHandlingAmountFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="MinHandlingAmountFlatRateRangeValidator" runat="server" ControlToValidate="MinHandlingAmountFlatRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MinHandlingAmountFlatRateCompareValidator" runat="server" ControlToValidate="MinHandlingAmountFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MinHandlingAmountFlatRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="BaseHandlingAmountFlatRateLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="BaseHandlingAmountFlatRateRequiredFieldValidator" runat="server" ControlToValidate="BaseHandlingAmountFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="BaseHandlingAmountFlatRateRangeValidator" runat="server" ControlToValidate="BaseHandlingAmountFlatRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="BaseHandlingAmountFlatRateCompareValidator" runat="server" ControlToValidate="BaseHandlingAmountFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="BaseHandlingAmountFlatRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="HandlingRateFlatRateLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="HandlingRateFlatRateRequiredFieldValidator" runat="server" ControlToValidate="HandlingRateFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="HandlingRateFlatRateRangeValidator" runat="server" ControlToValidate="HandlingRateFlatRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="HandlingRateFlatRateCompareValidator" runat="server" ControlToValidate="HandlingRateFlatRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="HandlingRateFlatRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
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
			<dnn1:LabelControl ID="BaseHandlingAmountProductRateLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="BaseHandlingAmountProductRateRequiredFieldValidator" runat="server" ControlToValidate="BaseHandlingAmountProductRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="BaseHandlingAmountProductRateRangeValidator" runat="server" ControlToValidate="BaseHandlingAmountProductRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="BaseHandlingAmountProductRateCompareValidator" runat="server" ControlToValidate="BaseHandlingAmountProductRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="BaseHandlingAmountProductRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MinHandlingAmountProductRateLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="MinHandlingAmountProductRateRequiredFieldValidator" runat="server" ControlToValidate="MinHandlingAmountProductRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="MinHandlingAmountProductRateRangeValidator" runat="server" ControlToValidate="MinHandlingAmountProductRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MinHandlingAmountProductRateCompareValidator" runat="server" ControlToValidate="MinHandlingAmountProductRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MinHandlingAmountProductRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="TierRateView" runat="server">
		<div class="alert alert-info">
		<p><%= LocalizeString("TierRateDescriptionLabel") %></p>
		<br/>
		<p><strong><%= LocalizeString("TierRateFormulaLabel") %></strong></p>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="MinHandlingAmountTierRateLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="MinHandlingAmountTierRateRequiredFieldValidator" runat="server" ControlToValidate="MinHandlingAmountTierRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="MinHandlingAmountTierRateRangeValidator" runat="server" ControlToValidate="MinHandlingAmountTierRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MinHandlingAmountTierRateCompareValidator" runat="server" ControlToValidate="MinHandlingAmountTierRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MinHandlingAmountTierRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="BaseHandlingAmountTierRateLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="BaseHandlingAmountTierRateRequiredFieldValidator" runat="server" ControlToValidate="BaseHandlingAmountTierRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="BaseHandlingAmountTierRateRangeValidator" runat="server" ControlToValidate="BaseHandlingAmountTierRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="BaseHandlingAmountTierRateCompareValidator" runat="server" ControlToValidate="BaseHandlingAmountTierRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="BaseHandlingAmountTierRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MeasurementTypeTierRateLabelControl" runat="server" />
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
                        <asp:BoundField DataField="HandlingAmount" HeaderText="Amount" />
						<asp:BoundField DataField="HandlingRate" HeaderText="Rate" />
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
						<dnn1:LabelControl ID="HandlingAmountTierRateDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
						<asp:RequiredFieldValidator ID="HandlingAmountTierRateDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="HandlingAmountTierRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
						<asp:RangeValidator ID="HandlingAmountTierRateDetailsViewRangeValidator" runat="server" ControlToValidate="HandlingAmountTierRateDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:CompareValidator ID="HandlingAmountTierRateDetailsViewCompareValidator" runat="server" ControlToValidate="HandlingAmountTierRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
						<asp:TextBox ID="HandlingAmountTierRateDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="HandlingRateTierRateDetailsViewLabelControl" runat="server" CssClass="dnnFormRequired"/>
						<asp:RequiredFieldValidator ID="HandlingRateTierRateDetailsViewRequiredFieldValidator" runat="server" ControlToValidate="HandlingRateTierRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
						<asp:RangeValidator ID="HandlingRateTierRateDetailsViewRangeValidator" runat="server" ControlToValidate="HandlingRateTierRateDetailsViewTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:CompareValidator ID="HandlingRateTierRateDetailsViewCompareValidator" runat="server" ControlToValidate="HandlingRateTierRateDetailsViewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="RangeTierRateDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
						<asp:TextBox ID="HandlingRateTierRateDetailsViewTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
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
			<uc1:FormulaEditorControl ID="RateRuleFormulaEditor" runat="server" Width="100%" ModuleControl="HandlingMethodRate" />
		</div>
	</asp:View>
</asp:MultiView>
