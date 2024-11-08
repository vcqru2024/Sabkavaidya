<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDynamicFormCodeControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductDynamicFormCodeControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/BasicDynamicFormDetailsViewControl.ascx" TagName="BasicDynamicFormDetailsViewControl" TagPrefix="uc1" %>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="CodeTypeLabelControl" runat="server" />
	<asp:DropDownList ID="CodeTypeDropDownList" runat="server" OnSelectedIndexChanged="CodeTypeDropDownList_SelectedIndexChanged" AutoPostBack="True">
		<asp:ListItem resourcekey="NoneLabel" Value=""></asp:ListItem>
		<asp:ListItem resourcekey="BasicLabel" Value="BasicDynamicFormView"></asp:ListItem>
	</asp:DropDownList>
</div>
<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="BasicDynamicFormView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="FieldBasicDynamicFormLabelControl" runat="server" />
			<div class="rvdFormSubContainer">
				<asp:PlaceHolder ID="FieldBasicDynamicFormMessagePlaceHolder" runat="server" />
				<asp:GridView ID="FieldBasicDynamicFormGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDeleting="FieldBasicDynamicFormGridView_RowDeleting" OnSelectedIndexChanged="FieldBasicDynamicFormGridView_SelectedIndexChanged" OnRowCommand="FieldBasicDynamicFormGridView_RowCommand" OnRowCreated="FieldBasicDynamicFormGridView_RowCreated" OnRowDataBound="FieldBasicDynamicFormGridView_RowDataBound">
					<PagerStyle CssClass="dnnGridPager" />
					<Columns>
						<asp:TemplateField HeaderText="ID">
							<ItemTemplate>
								<asp:LinkButton ID="SelectLinkButton" runat="server" Text='<%# Eval("ID") %>' CommandName="Select" OnClientClick="event.stopPropagation()" ></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="Type" HeaderText="Type" />
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
					<asp:LinkButton ID="AddFieldBasicDynamicFormLinkButton" runat="server" resourcekey="AddFieldBasicDynamicFormLinkButton" OnClick="AddFieldBasicDynamicFormLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdAddNewAction" />
				</div>
				<asp:Panel ID="FieldBasicDynamicFormDetailsViewPanel" runat="server">
					<fieldset>
						<uc1:BasicDynamicFormDetailsViewControl id="FieldBasicDynamicFormDetailsViewControl" runat="server" ValidationGroup="FieldBasicDynamicFormDetailsViewControl" />
					</fieldset>
					<div class="rvdActions">
						<asp:LinkButton ID="SaveFieldBasicDynamicFormLinkButton" runat="server" resourcekey="SaveFieldBasicDynamicFormLinkButton" OnClick="SaveFieldBasicDynamicFormLinkButton_Click" ValidationGroup="FieldBasicDynamicFormDetailsViewControl" CssClass="btn btn-primary rvdOKAction" />
					</div>
				</asp:Panel>
			</div>
		</div>
	</asp:View>
</asp:MultiView>
