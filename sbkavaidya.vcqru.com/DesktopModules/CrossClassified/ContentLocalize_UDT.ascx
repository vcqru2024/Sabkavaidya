<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.ContentLocalize_UDT, App_Web_contentlocalize_udt.ascx.87459c53" %>
<%@ Register TagPrefix="Portal" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<table width="100%" class="dnnFormItem" runat="server" id="tblButton">
    <tr>
        <td align="center">
            <asp:Label ID="lblSelectTargetLanguage" runat="server" resourcekey="lblSelectTargetLanguage" />
            <asp:DropDownList ID="ddlTargetLanguage" runat="server" Width="300px" AutoPostBack="True"
                OnSelectedIndexChanged="ddlTargetLanguage_SelectedIndexChanged" />
            <asp:Image ID="imgTargetLanguage" runat="server" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <dnn:CommandButton ID="btnUpdate" runat="server" ResourceKey="cmdUpdate" ImageUrl="~/images/save.gif"
                OnCommand="btnUpdate_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a onclick="window.opener=null" href="javascript:window.close()">
                <img alt="" id="Img10" runat="server" src="~/DesktopModules/CrossClassified/images/delete.gif" />
                <asp:Label ID="lblClosePage" runat="server" ResourceKey="lblClosePage" />
            </a>
        </td>
    </tr>
</table>
<table width="100%" cellspacing="2" cellpadding="2" border="0" class="dnnFormItem">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label1" runat="server" resourcekey="Tip_AttributeLocalization" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <asp:Label ID="lblName" runat="server" resourcekey="lblName"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server" Width="400px" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblTitle" runat="server" resourcekey="lblTitle"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtTitle" runat="server" Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblType" runat="server" resourcekey="lblType"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlType" runat="server" Width="400px" Enabled="false">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblRequired" runat="server" resourcekey="lblRequired"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="chkRequired" runat="server" Enabled="false"></asp:CheckBox>
        </td>
    </tr>
    <tr id="trInputSettings" runat="server">
        <td>
            <asp:Label ID="lblInputSettings" runat="server"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtInputSettings" runat="server" Width="400px" MaxLength="2000"></asp:TextBox>
            <asp:DropDownList ID="ddlInputSettings" runat="server" Width="400px" Visible="False"
                Enabled="false" DataTextField="Key" DataValueField="Value">
            </asp:DropDownList>
            <asp:RadioButtonList ID="rblListType" runat="server" RepeatDirection="Vertical" Enabled="false">
                <asp:ListItem Selected="True" Value="DropDown" resourcekey="li_DropDown"></asp:ListItem>
                <asp:ListItem Value="RadioButtonsVertical" resourcekey="li_RadioButtonsVertical"></asp:ListItem>
                <asp:ListItem Value="RadioButtonsHorizontal" resourcekey="li_RadioButtonsHorizontal"></asp:ListItem>
                <asp:ListItem Value="CheckBoxsVertical" resourcekey="li_CheckBoxsVertical"></asp:ListItem>
                <asp:ListItem Value="CheckBoxsHorizontal" resourcekey="li_CheckBoxsHorizontal"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr id="trOutputSettings" runat="server">
        <td>
            <asp:Label ID="lblOutputSettings" runat="server"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOutputSettings" runat="server" Width="400px" MaxLength="2000"></asp:TextBox>
        </td>
    </tr>
    <tr id="trNormalizeFlag" runat="server">
        <td>
            <asp:Label ID="lblNormalizeFlag" runat="server"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="chkNormalizeFlag" runat="server" Width="100%" Enabled="false">
            </asp:CheckBox>
        </td>
    </tr>
    <tr id="trDefault" runat="server">
        <td>
            <asp:Label ID="lblDefault" runat="server" resourcekey="lblDefault"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtDefault" runat="server" Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr id="trValidationRule" runat="server">
        <td>
            <asp:Label ID="lblValidationRule" runat="server" resourcekey="lblValidationRule"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtValidationRule" runat="server" Width="400px" MaxLength="512"></asp:TextBox>
        </td>
    </tr>
    <tr id="trValidationMessage" runat="server">
        <td>
            <asp:Label ID="lblValidationMessage" runat="server" resourcekey="lblValidationMessage"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtValidationMessage" runat="server" Width="400px" MaxLength="512"></asp:TextBox>
        </td>
    </tr>
    <tr id="trEditStyle" runat="server">
        <td>
            <asp:Label ID="lblEditStyle" runat="server" resourcekey="lblEditStyle"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtEditStyle" runat="server" Width="400px" MaxLength="512" Enabled="false"></asp:TextBox>
        </td>
    </tr>
    <tr id="trHelpText" runat="server">
        <td>
            <asp:Label ID="lblHelpText" runat="server" resourcekey="lblHelpText"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtHelpText" runat="server" Width="400px" TextMode="MultiLine" MaxLength="512"
                Height="100px"></asp:TextBox>
        </td>
    </tr>
</table>
