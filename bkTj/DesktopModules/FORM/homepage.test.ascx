<%@ Control Language="C#" AutoEventWireup="true" CodeFile="homepage.test.ascx.cs" Inherits="DesktopModules_FORM_homepage_test" %>
<table>
    <tr>
        <td>Product Name:</td>
        <td><asp:TextBox ID="txtProductName" runat="server" /></td>
    </tr>
    <tr>
        <td>Description:</td>
        <td><asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" /></td>
    </tr>
    <tr>
        <td>Price:</td>
        <td><asp:TextBox ID="txtPrice" runat="server" /></td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        </td>
    </tr>
</table>



<script src="homepage.js" type="text/javascript"></script>
