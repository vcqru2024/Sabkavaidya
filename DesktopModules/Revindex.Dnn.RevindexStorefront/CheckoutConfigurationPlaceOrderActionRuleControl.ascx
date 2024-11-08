<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CheckoutConfigurationPlaceOrderActionRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.CheckoutConfigurationPlaceOrderActionRuleControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/FormulaEditorControl.ascx" TagName="FormulaEditorControl" TagPrefix="uc1" %>
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
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="ActionTypeBasicActionLabelControl" runat="server" />
						<asp:RadioButtonList ID="ActionTypeBasicActionRadioButtonList" runat="server" OnSelectedIndexChanged="ActionTypeBasicActionRadioButtonList_SelectedIndexChanged" AutoPostBack="True" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
							<asp:ListItem resourcekey="GrantRoleLabel" Value="GrantRoleActionTypeBasicActionView" Selected="True" />
							<asp:ListItem resourcekey="RevokeRoleLabel" Value="RevokeRoleActionTypeBasicActionView" />
							<asp:ListItem resourcekey="SetDataLabel" Value="SetDataActionTypeBasicActionView" />
							<asp:ListItem resourcekey="WebRequestLabel" Value="WebRequestActionTypeBasicActionView" />
						</asp:RadioButtonList>
					</div>
					<asp:MultiView ID="ActionTypeBasicActionDetailsViewMultiView" runat="server" ActiveViewIndex="0">
						<asp:View ID="GrantRoleActionTypeBasicActionView" runat="server">
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="RoleIDGrantRoleActionTypeBasicActionLabelControl" runat="server" CssClass="dnnFormRequired"/>
								<asp:RequiredFieldValidator ID="RoleIDGrantRoleActionTypeBasicActionRequiredFieldValidator" runat="server" ValidationGroup="ActionBasicActionDetailsViewControl" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ControlToValidate="RoleIDGrantRoleActionTypeBasicActionDropDownList" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
								<asp:DropDownList ID="RoleIDGrantRoleActionTypeBasicActionDropDownList" runat="server" CssClass="dnnFormRequired">
								</asp:DropDownList>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="RoleExpireIntervalGrantRoleActionTypeBasicActionLabelControl" runat="server" />
								<div class="rvdFormSubContainer">
									<asp:RangeValidator ID="RoleExpireIntervalGrantRoleActionTypeBasicActionRangeValidator" runat="server" ControlToValidate="RoleExpireIntervalGrantRoleActionTypeBasicActionTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="ActionBasicActionDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:TextBox ID="RoleExpireIntervalGrantRoleActionTypeBasicActionTextBox" runat="server" value="" CssClass="rvdQuantityInput" TextMode="Number"></asp:TextBox>
									<asp:DropDownList ID="RoleExpireIntervalTypeGrantRoleActionTypeBasicActionDropDownList" runat="server" CssClass="rvdUnitInput">
										<asp:ListItem resourcekey="DayLabel" Value="1" />
										<asp:ListItem resourcekey="WeekLabel" Value="2" />
										<asp:ListItem resourcekey="MonthLabel" Value="3" />
										<asp:ListItem resourcekey="YearLabel" Value="4" />
									</asp:DropDownList>
								</div>
							</div>
						</asp:View>
						<asp:View ID="RevokeRoleActionTypeBasicActionView" runat="server">
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="RoleIDRevokeRoleActionTypeBasicActionLabelControl" runat="server" CssClass="dnnFormRequired"/>
								<asp:RequiredFieldValidator ID="RoleIDRevokeRoleActionTypeBasicActionRequiredFieldValidator" runat="server" ValidationGroup="ActionBasicActionDetailsViewControl" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ControlToValidate="RoleIDRevokeRoleActionTypeBasicActionDropDownList" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
								<asp:DropDownList ID="RoleIDRevokeRoleActionTypeBasicActionDropDownList" runat="server" CssClass="dnnFormRequired">
								</asp:DropDownList>
							</div>
						</asp:View>
						<asp:View ID="SetDataActionTypeBasicActionView" runat="server">
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="OrderStatusSetDataActionTypeBasicActionLabelControl" runat="server" />
								<asp:DropDownList ID="OrderStatusSetDataActionTypeBasicActionDropDownList" runat="server"></asp:DropDownList>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="OrderPaymentStatusSetDataActionTypeBasicActionLabelControl" runat="server" />
								<asp:DropDownList ID="OrderPaymentStatusSetDataActionTypeBasicActionDropDownList" runat="server"></asp:DropDownList>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="OrderShippingStatusSetDataActionTypeBasicActionLabelControl" runat="server" />
								<asp:DropDownList ID="OrderShippingStatusSetDataActionTypeBasicActionDropDownList" runat="server"></asp:DropDownList>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="OrderDetailStatusSetDataActionTypeBasicActionLabelControl" runat="server" />
								<asp:DropDownList ID="OrderDetailStatusSetDataActionTypeBasicActionDropDownList" runat="server"></asp:DropDownList>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="OrderDetailShippingStatusSetDataActionTypeBasicActionLabelControl" runat="server" />
								<asp:DropDownList ID="OrderDetailShippingStatusSetDataActionTypeBasicActionDropDownList" runat="server"></asp:DropDownList>
							</div>
						</asp:View>
						<asp:View ID="WebRequestActionTypeBasicActionView" runat="server">
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="UrlWebRequestActionTypeBasicActionLabelControl" runat="server" CssClass="dnnFormRequired"/>
								<asp:RequiredFieldValidator ID="UrlWebRequestActionTypeBasicActionRequiredFieldValidator" runat="server" ValidationGroup="ActionBasicActionDetailsViewControl" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ControlToValidate="UrlWebRequestActionTypeBasicActionTextBox" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="UrlWebRequestActionTypeBasicActionRegularExpressionValidator" runat="server" ValidationGroup="ActionBasicActionDetailsViewControl" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ControlToValidate="UrlWebRequestActionTypeBasicActionTextBox" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
								<asp:TextBox ID="UrlWebRequestActionTypeBasicActionTextBox" runat="server" CssClass="dnnFormRequired"></asp:TextBox>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="MethodWebRequestActionTypeBasicActionLabelControl" runat="server" />
								<asp:RadioButtonList ID="MethodWebRequestActionTypeBasicActionRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
									<asp:ListItem Text="POST" Value="POST" />
									<asp:ListItem Text="GET" Value="GET" />
								</asp:RadioButtonList>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="TimeoutWebRequestActionTypeBasicActionLabelControl" runat="server" CssClass="dnnFormRequired"/>
								<asp:RequiredFieldValidator ID="TimeoutWebRequestActionTypeBasicActionRequiredFieldValidator1" runat="server" ValidationGroup="ActionBasicActionDetailsViewControl" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ControlToValidate="TimeoutWebRequestActionTypeBasicActionTextBox" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
								<asp:RangeValidator ID="TimeoutWebRequestActionTypeBasicActionRangeValidator" runat="server" ControlToValidate="TimeoutWebRequestActionTypeBasicActionTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="ActionBasicActionDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
								<asp:TextBox ID="TimeoutWebRequestActionTypeBasicActionTextBox" runat="server" value="30000" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
							</div>
						</asp:View>
					</asp:MultiView>
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
			<uc1:FormulaEditorControl ID="ActionRuleFormulaEditor" runat="server" Width="100%" ModuleControl="CheckoutPlaceOrderAction" />
		</div>
	</asp:View>
</asp:MultiView>
