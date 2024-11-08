<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductVariantPlaceOrderActionRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductVariantPlaceOrderActionRuleControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/FormulaEditorControl.ascx" TagName="FormulaEditorControl" TagPrefix="uc1" %>
<asp:Panel ID="MainPanel" runat="server">
	<div class="dnnFormItem">
		<dnn1:LabelControl ID="RuleTypeLabelControl" runat="server" />
		<asp:DropDownList ID="RuleTypeDropDownList" runat="server" OnSelectedIndexChanged="RuleTypeDropDownList_SelectedIndexChanged" AutoPostBack="True">
			<asp:ListItem resourcekey="NoneLabel" Value=""></asp:ListItem>
			<asp:ListItem resourcekey="BasicLabel" Value="BasicActionView"></asp:ListItem>
			<asp:ListItem resourcekey="CustomRuleLabel" Value="CustomRuleView"></asp:ListItem>
		</asp:DropDownList>
	</div>
	<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
		<asp:View ID="BasicActionView" runat="server">
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ActionBasicActionLabelControl" runat="server" />
				<div class="rvdFormSubContainer">
					<asp:PlaceHolder ID="ActionBasicActionMessagePlaceHolder" runat="server" />
					<asp:GridView ID="ActionBasicActionGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDeleting="ActionBasicActionGridView_RowDeleting" OnSelectedIndexChanged="ActionBasicActionGridView_SelectedIndexChanged" OnRowCommand="ActionBasicActionGridView_RowCommand" OnRowCreated="ActionBasicActionGridView_RowCreated" OnRowDataBound="ActionBasicActionGridView_RowDataBound">
						<PagerStyle CssClass="dnnGridPager" />
						<Columns>
							<asp:TemplateField HeaderText="Type">
								<ItemTemplate>
									<asp:LinkButton ID="SelectLinkButton" runat="server" Text='<%# Eval("Type") %>' CommandName="Select" OnClientClick="event.stopPropagation()" ></asp:LinkButton>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:BoundField DataField="Description" HeaderText="Description" />
							<asp:TemplateField HeaderStyle-Width="15%">
							<ItemTemplate>
								<asp:LinkButton ID="MoveUpLinkButton" runat="server" CausesValidation="false" CommandName="MoveUp" OnClientClick="event.stopPropagation()"><em class="glyphicon glyphicon-arrow-up"></em></asp:LinkButton>
								<asp:LinkButton ID="MoveDownLinkButton" runat="server" CausesValidation="false" CommandName="MoveDown" OnClientClick="event.stopPropagation()"><em class="glyphicon glyphicon-arrow-down"></em></asp:LinkButton>
							</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderStyle-Width="10%">
								<ItemTemplate>
									<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
								</ItemTemplate>
							</asp:TemplateField>
						</Columns>
					</asp:GridView>
					<div class="rvdActions">
						<asp:LinkButton ID="AddActionBasicActionLinkButton" runat="server" resourcekey="AddActionBasicActionLinkButton" OnClick="AddActionBasicActionLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdAddNewAction" />
					</div>
					<asp:Panel ID="ActionBasicActionDetailsViewPanel" runat="server">
						<fieldset>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="ActionTypeLabelControl" runat="server" />
								<asp:RadioButtonList ID="ActionTypeRadioButtonList" runat="server" OnSelectedIndexChanged="ActionTypeRadioButtonList_SelectedIndexChanged" AutoPostBack="True" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
									<asp:ListItem resourcekey="GrantRoleLabel" Value="GrantRoleActionTypeView" Selected="True" />
									<asp:ListItem resourcekey="RevokeRoleLabel" Value="RevokeRoleActionTypeView" />
									<asp:ListItem resourcekey="SetDataLabel" Value="SetDataActionTypeView" />
									<asp:ListItem resourcekey="WebRequestLabel" Value="WebRequestActionTypeView" />
								</asp:RadioButtonList>
							</div>
							<asp:MultiView ID="ActionTypeDetailsViewMultiView" runat="server" ActiveViewIndex="0">
								<asp:View ID="GrantRoleActionTypeView" runat="server">
									<div class="dnnFormItem">
										<dnn1:LabelControl ID="RoleIDGrantRoleActionTypeLabelControl" runat="server" />
										<asp:RequiredFieldValidator ID="RoleIDGrantRoleActionTypeRequiredFieldValidator" runat="server" ValidationGroup="ActionBasicActionDetailsViewControl" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ControlToValidate="RoleIDGrantRoleActionTypeDropDownList" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
										<asp:DropDownList ID="RoleIDGrantRoleActionTypeDropDownList" runat="server">
										</asp:DropDownList>
									</div>
									<div class="dnnFormItem">
										<dnn1:LabelControl ID="RoleExpireIntervalGrantRoleActionTypeLabelControl" runat="server" />
										<div class="rvdFormSubContainer">
											<asp:RangeValidator ID="RoleExpireIntervalGrantRoleActionTypeRangeValidator" runat="server" ControlToValidate="RoleExpireIntervalGrantRoleActionTypeTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="ActionBasicActionDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
											<asp:CompareValidator ID="RoleExpireIntervalGrantRoleActionTypeCompareValidator" runat="server" ControlToValidate="RoleExpireIntervalGrantRoleActionTypeTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="ActionBasicActionDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
											<asp:TextBox ID="RoleExpireIntervalGrantRoleActionTypeTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
											<asp:DropDownList ID="RoleExpireIntervalTypeGrantRoleActionTypeDropDownList" runat="server" CssClass="rvdUnitInput">
												<asp:ListItem resourcekey="DayLabel" Value="1" />
												<asp:ListItem resourcekey="WeekLabel" Value="2" />
												<asp:ListItem resourcekey="MonthLabel" Value="3" />
												<asp:ListItem resourcekey="YearLabel" Value="4" />
											</asp:DropDownList>
										</div>
									</div>
								</asp:View>
								<asp:View ID="RevokeRoleActionTypeView" runat="server">
									<div class="dnnFormItem">
										<dnn1:LabelControl ID="RoleIDRevokeRoleActionTypeLabelControl" runat="server" />
										<asp:RequiredFieldValidator ID="RoleIDRevokeRoleActionTypeRequiredFieldValidator" runat="server" ValidationGroup="ActionBasicActionDetailsViewControl" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ControlToValidate="RoleIDRevokeRoleActionTypeDropDownList" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
										<asp:DropDownList ID="RoleIDRevokeRoleActionTypeDropDownList" runat="server">
										</asp:DropDownList>
									</div>
								</asp:View>
								<asp:View ID="SetDataActionTypeView" runat="server">
									<div class="dnnFormItem">
										<dnn1:LabelControl ID="OrderStatusSetDataActionTypeLabelControl" runat="server" />
										<asp:DropDownList ID="OrderStatusSetDataActionTypeDropDownList" runat="server"></asp:DropDownList>
									</div>
									<div class="dnnFormItem">
										<dnn1:LabelControl ID="OrderPaymentStatusSetDataActionTypeLabelControl" runat="server" />
										<asp:DropDownList ID="OrderPaymentStatusSetDataActionTypeDropDownList" runat="server"></asp:DropDownList>
									</div>
									<div class="dnnFormItem">
										<dnn1:LabelControl ID="OrderShippingStatusSetDataActionTypeLabelControl" runat="server" />
										<asp:DropDownList ID="OrderShippingStatusSetDataActionTypeDropDownList" runat="server"></asp:DropDownList>
									</div>
									<div class="dnnFormItem">
										<dnn1:LabelControl ID="OrderDetailStatusSetDataActionTypeLabelControl" runat="server" />
										<asp:DropDownList ID="OrderDetailStatusSetDataActionTypeDropDownList" runat="server"></asp:DropDownList>
									</div>
									<div class="dnnFormItem">
										<dnn1:LabelControl ID="OrderDetailShippingStatusSetDataActionTypeLabelControl" runat="server" />
										<asp:DropDownList ID="OrderDetailShippingStatusSetDataActionTypeDropDownList" runat="server"></asp:DropDownList>
									</div>
								</asp:View>
								<asp:View ID="WebRequestActionTypeView" runat="server">
									<div class="dnnFormItem">
										<dnn1:LabelControl ID="UrlWebRequestActionTypeLabelControl" runat="server" CssClass="dnnFormRequired" />
										<asp:RequiredFieldValidator ID="UrlWebRequestActionTypeRequiredFieldValidator" runat="server" ValidationGroup="ActionBasicActionDetailsViewControl" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ControlToValidate="UrlWebRequestActionTypeTextBox" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
										<asp:RegularExpressionValidator ID="UrlWebRequestActionTypeRegularExpressionValidator" runat="server" ValidationGroup="ActionBasicActionDetailsViewControl" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ControlToValidate="UrlWebRequestActionTypeTextBox" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
										<asp:TextBox ID="UrlWebRequestActionTypeTextBox" runat="server" CssClass="dnnFormRequired"></asp:TextBox>
									</div>
									<div class="dnnFormItem">
										<dnn1:LabelControl ID="MethodWebRequestActionTypeLabelControl" runat="server" />
										<asp:RadioButtonList ID="MethodWebRequestActionTypeRadioButtonList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
											<asp:ListItem Text="POST" Value="POST" />
											<asp:ListItem Text="GET" Value="GET" />
										</asp:RadioButtonList>
									</div>
									<div class="dnnFormItem">
										<dnn1:LabelControl ID="TimeoutWebRequestActionTypeLabelControl" runat="server" CssClass="dnnFormRequired" />
										<asp:RequiredFieldValidator ID="TimeoutWebRequestActionTypeRequiredFieldValidator1" runat="server" ValidationGroup="ActionBasicActionDetailsViewControl" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ControlToValidate="TimeoutWebRequestActionTypeTextBox" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
										<asp:RangeValidator ID="TimeoutWebRequestActionTypeRangeValidator" runat="server" ControlToValidate="TimeoutWebRequestActionTypeTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="ActionBasicActionDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
										<asp:CompareValidator ID="TimeoutWebRequestActionTypeCompareValidator" runat="server" ControlToValidate="TimeoutWebRequestActionTypeTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="ActionBasicActionDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
										<asp:TextBox ID="TimeoutWebRequestActionTypeTextBox" runat="server" value="30000" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
									</div>
								</asp:View>
							</asp:MultiView>
						</fieldset>
						<div class="rvdActions">
							<asp:LinkButton ID="SaveActionBasicActionLinkButton" runat="server" resourcekey="SaveActionBasicActionLinkButton" OnClick="SaveActionBasicActionLinkButton_Click" ValidationGroup="ActionBasicActionDetailsViewControl" CssClass="btn btn-primary rvdOKAction" />
						</div>
					</asp:Panel>
				</div>
			</div>
		</asp:View>
		<asp:View ID="CustomRuleView" runat="server">
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ActionRuleLabelControl" runat="server" />
				<uc1:FormulaEditorControl ID="ActionRuleFormulaEditor" runat="server" Width="100%" ModuleControl="ProductVariantPlaceOrderAction" />
			</div>
		</asp:View>
	</asp:MultiView>
</asp:Panel>
