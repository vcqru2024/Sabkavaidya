<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductAttributeDefinitionSelectionControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductAttributeDefinitionSelectionControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<div class="rvdFormListBox">
	<asp:Panel ID="SelectionPanel" runat="server">
		<table style="width: 100%">
			<tr>
				<td style="padding-right: 10px">
					<asp:ListBox ID="SelectionListBox" runat="server" style="width: 100%; max-width: 100%" AutoPostBack="True" OnSelectedIndexChanged="SelectionListBox_SelectedIndexChanged" Rows="8"></asp:ListBox>
				</td>
				<td style="width: 20px; vertical-align:top">
					<asp:LinkButton ID="MoveUpSelectionLinkButton" runat="server" CausesValidation="False" OnClick="MoveUpSelectionLinkButton_Click" style="display: block; margin-bottom: 5px;"><em class="glyphicon glyphicon-triangle-top fa fas fa-caret-up"></em></asp:LinkButton>
						<asp:LinkButton ID="MoveDownSelectionLinkButton" runat="server" CausesValidation="False" OnClick="MoveDownSelectionLinkButton_Click" style="display: block; margin-bottom: 5px;"><em class="glyphicon glyphicon-triangle-bottom fa fas fa-caret-down"></em></asp:LinkButton>
						<asp:LinkButton ID="DeleteSelectionLinkButton" runat="server" CausesValidation="False" OnClick="DeleteSelectionLinkButton_Click" style="display: block; margin-bottom: 5px;"><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
						<asp:LinkButton  ID="AddSelectionLinkButton" runat="server" CausesValidation="False"  OnClick="AddSelectionLinkButton_Click" style="display: block; margin-bottom: 5px;"><em class="glyphicon glyphicon-plus fa fas fa-plus"></em></asp:LinkButton>
				</td>
			</tr>
		</table>
	</asp:Panel>
	<asp:Panel ID="EditSelectionPanel" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ItemLabelControl" runat="server" />
			<asp:TextBox ID="AddSelectionTextBox" runat="server" ></asp:TextBox>
		</div>
		<div class="rvdActions">
			<asp:LinkButton  ID="SaveSelectionLinkButton" resourcekey="SaveSelectionLinkButton" runat="server"  OnClick="SaveSelectionLinkButton_Click" CssClass="btn btn-primary rvdOKAction" />
		</div>
	</asp:Panel>
</div>
