<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserFileSelect.ascx.cs"
    Inherits="Cross.Modules.CP_Product.View.UserFileSelect" %>
<asp:DropDownList ID="ddlFolderList" runat="server" Visible="false" CssClass="NormalTextBox"
    Width="300" />
<table cellspacing="0" cellpadding="0" border="0" class="Normal" runat="server" id="tblControlBar"
    visible="false">
    <tr>
        <td style="width: 120px">
            <asp:Label ID="lblSource" runat="server" EnableViewState="False" resourcekey="lblSource"
                CssClass="NormalBold" />
        </td>
        <td>
            <asp:RadioButtonList runat="server" ID="rblControlBar" RepeatColumns="3" AutoPostBack="true"
                RepeatDirection="Horizontal" OnSelectedIndexChanged="rblControlBar_SelectedIndexChanged">
            </asp:RadioButtonList>
        </td>
    </tr>
</table>
<table cellspacing="0" cellpadding="0" border="0" class="Normal" id="tblFile" runat="server"
    visible="false">
    <tr>
        <td style="width: 120px">
            <asp:Label ID="lblFolder" runat="server" EnableViewState="False" resourcekey="lblFolder"
                CssClass="NormalBold" />
        </td>
        <td>
            <asp:DropDownList ID="ddlFolder" runat="server" AutoPostBack="True" CssClass="NormalTextBox"
                Width="300px" OnSelectedIndexChanged="ddlFolder_SelectedIndexChanged" />
        </td>
    </tr>
    <tr>
        <td style="width: 120px">
            <asp:Label ID="lblFile" runat="server" EnableViewState="False" resourcekey="lblFile"
                CssClass="NormalBold" />
        </td>
        <td>
            <asp:DropDownList ID="ddlFile" runat="server" DataTextField="Text" DataValueField="Value"
                CssClass="NormalTextBox" Width="300px" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:HyperLink ID="hlUpload" resourcekey="cmdUpload" CssClass="CommandButton" runat="server"
                Target="_blank" />&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="btnRefresh" resourcekey="btnRefresh" CssClass="CommandButton"
                runat="server" CausesValidation="False" OnCommand="btnRefresh_Command" />
        </td>
    </tr>
</table>
<table cellspacing="0" cellpadding="0" border="0" class="Normal" id="tblUrl" runat="server"
    visible="false">
    <tr>
        <td style="width: 120px">
            <asp:Label ID="lblUrl" runat="server" EnableViewState="False" resourcekey="lblUrl"
                CssClass="NormalBold" />
        </td>
        <td>
            <asp:TextBox ID="txtUrl" runat="server" Width="300px" />
        </td>
    </tr>
</table>
<table cellspacing="0" cellpadding="0" border="0" class="Normal" id="tblEmbed" runat="server"
    visible="false">
    <tr valign="top">
        <td valign="middle" style="width: 120px">
            <asp:Label ID="lblEmbed" runat="server" EnableViewState="False" resourcekey="lblEmbed"
                CssClass="NormalBold" />
        </td>
        <td valign="top">
            <asp:TextBox ID="txtEmbed" runat="server" Width="300px" TextMode="MultiLine" Height="150px" />
        </td>
    </tr>
</table>
