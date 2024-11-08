<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListItemControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.WebUserControls.ListItemControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>

<div class="rvdFormListBox">
	<asp:Panel ID="SelectionPanel" runat="server">
		<table style="width: 100%">
			<tr>
				<td style="padding-right: 10px">
					<asp:HiddenField ID="ScrollPositionHiddenField" runat="server" />
					<asp:Panel ID="SelectionInnerPanel" runat="server" style="height: 160px; overflow: auto; border: solid 1px #ccc" onscroll="$(this).prev().val($(this).scrollTop())">
					<table style="width: 100%">
					<asp:Repeater ID="SelectionRepeater" runat="server">
						<ItemTemplate>
							<tr style='background-color: <%# ActiveIndex == Container.ItemIndex ? "#ddd" : "inherit"  %>' onmouseover="this.style.backgroundColor = '#eee'" onmouseout="this.style.backgroundColor = '<%# ActiveIndex == Container.ItemIndex ? "#ddd" : "inherit"  %>'">
							<td style="width: 20px;"><asp:CheckBox ID="ItemCheckBox" runat="server" Checked='<%# DataBinder.Eval(Container.DataItem, "Selected") %>' TabIndex='<%# Container.ItemIndex %>' OnCheckedChanged="ItemCheckBox_CheckedChanged" AutoPostBack="True" /></td><td><asp:LinkButton ID="ItemLinkButton" runat="server" style="text-decoration:none; color: black; display: inline-block; width: 100%" Text='<%# DataBinder.Eval(Container.DataItem, "Text") %>' OnCommand="ItemLinkButton_Command" CommandArgument='<%# Container.ItemIndex%>'></asp:LinkButton></td>
							</tr>
						</ItemTemplate>
					</asp:Repeater>
					</table>
					</asp:Panel>
				</td>
				<td style="width: 20px; vertical-align:top">
					<asp:LinkButton ID="MoveUpSelectionLinkButton" runat="server" CausesValidation="False" OnClick="MoveUpSelectionLinkButton_Click" style="display: block; margin-bottom: 5px;"><em class="glyphicon glyphicon-triangle-top fa fas fa-caret-up"></em></asp:LinkButton>
					<asp:LinkButton ID="MoveDownSelectionLinkButton" runat="server" CausesValidation="False" OnClick="MoveDownSelectionLinkButton_Click" style="display: block; margin-bottom: 5px;"><em class="glyphicon glyphicon-triangle-bottom fa fas fa-caret-down"></em></asp:LinkButton>
					<asp:LinkButton ID="DeleteSelectionLinkButton" runat="server" CausesValidation="False" OnClick="DeleteSelectionLinkButton_Click" style="display: block; margin-bottom: 5px;"><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
					<asp:LinkButton ID="AddSelectionLinkButton" runat="server" CausesValidation="False" OnClick="AddSelectionLinkButton_Click" style="display: block; margin-bottom: 5px;"><em class="glyphicon glyphicon-plus fa fas fa-plus"></em></asp:LinkButton>
				</td>
			</tr>
		</table>
	</asp:Panel>
	<asp:Panel ID="EditSelectionPanel" runat="server" style="margin-top: 20px">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="NameLabelControl" runat="server" />
			<asp:TextBox ID="SelectionNameTextBox" runat="server"></asp:TextBox>
		</div>
		<asp:Panel runat="server" ID="SelectionValuePanel" CssClass="dnnFormItem">
			<dnn1:LabelControl ID="SelectionValueLabelControl" runat="server" />
			<asp:TextBox ID="SelectionValueTextBox" runat="server"></asp:TextBox>
		</asp:Panel>
		<div class="rvdActions">
			<asp:LinkButton ID="SaveSelectionLinkButton" runat="server" resourcekey="SaveSelectionLinkButton" OnClick="SaveSelectionLinkButton_Click" CssClass="btn btn-primary rvdOKAction" />
		</div>
	</asp:Panel>
</div>
