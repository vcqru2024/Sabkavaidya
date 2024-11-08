<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.P_Settings_TagDashboard, App_Web_p_settings_tagdashboard.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>

<dnn:sectionhead ID="secAbout" runat="server" Section="tblAbout" ResourceKey="secAbout"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblAbout" cellspacing="0" cellpadding="2" border="0" runat="server" width="100%"
    class="dnnFormItem">
     <tr>
        <td colspan="2">
            <asp:Label ID="Label23" runat="server" resourcekey="Tip_About" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
 </table>
<dnn:sectionhead ID="secGeneral" runat="server" Section="tblGeneral" ResourceKey="secGeneral"
    IncludeRule="True" IsExpanded="true" CssClass="SubHead"></dnn:sectionhead>
<table cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem"
    runat="server" id="tblGeneral">
    <tr>
        <td style="width: 200px">
            <dnn:Label ID="plType" runat="server" ControlName="ddlType"></dnn:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlType" runat="server" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label1" runat="server" resourcekey="Tip_Template" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plTemplate" runat="server" ControlName="ddlTemplate"></dnn:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTemplate" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label2" runat="server" resourcekey="Tip_ListPage" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plListTab" runat="server" ControlName="ddlListTab"></dnn:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlListTab" DataValueField="TabId" DataTextField="IndentedTabName"
                runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plLinkTarget" ControlName="ddlLinkTarget" runat="server"></dnn:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlLinkTarget" runat="server">
                <asp:ListItem Value="_self" resourcekey="li_LinkTarget_Self">_Self</asp:ListItem>
                <asp:ListItem Value="_blank" resourcekey="li_LinkTarget_Blank">_Blank</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plAlign" runat="server" ControlName="ddlAlign" />
        </td>
        <td>
            <asp:DropDownList ID="ddlAlign" runat="server">
                <asp:ListItem Value="left" ResourceKey="liAlign_left" />
                <asp:ListItem Value="center" ResourceKey="liAlign_center" />
                <asp:ListItem Value="right" ResourceKey="liAlign_right" />
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plRows" runat="server" ControlName="txtRows"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtRows" runat="server" Width="100px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRows"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plFlashWidth" runat="server" Text="Flash Width" ResourceKey="plFlashWidth"
                ControlName="txtFlashWidth"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtFlashWidth" runat="server" Width="100px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regWidth" resourcekey="MustBeInteger" runat="server"
                ValidationExpression="\d*" ControlToValidate="txtFlashWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plFlashHeight" runat="server" ResourceKey="plFlashHeight" ControlName="txtFlashHeight"
                Text="Flash Height"></dnn:Label>
        </td>
        <td align="left">
            <asp:TextBox ID="txtFlashHeight" runat="server" Width="100px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regHeight" resourcekey="MustBeInteger" runat="server"
                ValidationExpression="\d*" ControlToValidate="txtFlashHeight"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plFlashBgColor" runat="server" ControlName="txtFlashBgColor" Text="Background Color">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtFlashBgColor" runat="server" Columns="16"></asp:TextBox>
            <a id="pickFlashBgColor" name="pickFlashBgColor" href="javascript:void(PickFlashBgColor())"
                target="_self">
                <asp:Image ID="Image13" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossClassified/Images/ColorPick.jpg" /></a>&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtFlashBgColor"
                CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator28" runat="server"
                ControlToValidate="txtFlashBgColor" CssClass="NormalRed" ResourceKey="InvalidHex"
                SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plFlashWmode" runat="server" ControlName="ddlFlashWmode" Text="Flash Wmode Option">
            </dnn:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlFlashWmode" runat="server">
                <asp:ListItem Value="window" resourcekey="liFlashWmode_window" />
                <asp:ListItem Value="opaque" resourcekey="liFlashWmode_opaque" />
                <asp:ListItem Value="transparent" resourcekey="liFlashWmode_transparent" />
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plDistr" runat="server" ControlName="chkDistr" />
        </td>
        <td>
            <asp:CheckBox ID="chkDistr" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plTcolor" runat="server" ControlName="txtTcolor"></dnn:Label>
        </td>
        <td align="left">
            <asp:TextBox ID="txtTcolor" runat="server" Columns="16"></asp:TextBox>
            <a id="pickTcolor" name="pickTcolor" href="javascript:void(PickTcolor())" target="_self">
                <asp:Image ID="Image1" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossClassified/Images/ColorPick.jpg" /></a>&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTcolor"
                CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTcolor"
                CssClass="NormalRed" ResourceKey="InvalidHex" SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plTcolor2" runat="server" ControlName="txtTcolor2"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtTcolor2" runat="server" Columns="16"></asp:TextBox>
            <a id="pickTcolor2" name="pickTcolor2" href="javascript:void(PickTcolor2())" target="_self">
                <asp:Image ID="Image2" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossClassified/Images/ColorPick.jpg" /></a>&nbsp;
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plHicolor" runat="server" ControlName="txtHicolor"></dnn:Label>
        </td>
        <td align="left">
            <asp:TextBox ID="txtHicolor" runat="server" Columns="16"></asp:TextBox>
            <a id="pickHicolor" name="pickHicolor" href="javascript:void(PickHicolor())" target="_self">
                <asp:Image ID="Image3" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossClassified/Images/ColorPick.jpg" /></a>&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtHicolor"
                CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtHicolor"
                CssClass="NormalRed" ResourceKey="InvalidHex" SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plTspeed" runat="server" ControlName="txtTspeed"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtTspeed" runat="server" Width="100px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtTspeed"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="dnnPrimaryAction" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="True"></asp:LinkButton>&nbsp;
    <asp:HyperLink runat="server" ID="hlCancel" ResourceKey="cmdCancel" CssClass="dnnSecondaryAction" />
</p>
