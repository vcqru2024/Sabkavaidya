<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.P_Settings_AccountLink, App_Web_p_settings_accountlink.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>

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
<table cellspacing="0" cellpadding="2" width="100%" border="0"  class="dnnFormItem" runat="server" id="tblGeneral">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label1" runat="server" resourcekey="Tip_Template" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:label ID="plTemplate" runat="server" ControlName="ddlTemplate"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTemplate" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plLinkTarget" ControlName="ddlLinkTarget" runat="server"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlLinkTarget" runat="server" >
                <asp:ListItem Value="_self" resourcekey="li_LinkTarget_Self">_Self</asp:ListItem>
                <asp:ListItem Value="_blank" resourcekey="li_LinkTarget_Blank">_Blank</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plShowCart" runat="server" ControlName="chkShowCart"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCart" runat="server" />
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plShowOrder" runat="server" ControlName="chkShowOrder"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowOrder" runat="server" />
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plShowAuction" runat="server" ControlName="chkShowAuction"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAuction" runat="server" />
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plShowProduct" runat="server" ControlName="chkShowProduct"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowProduct" runat="server" />
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plShowAccount" runat="server" ControlName="chkShowAccount"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAccount" runat="server" />
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plShowHelp" runat="server" ControlName="chkShowHelp"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowHelp" runat="server" />
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="dnnPrimaryAction" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="True"></asp:LinkButton>&nbsp;&nbsp;
    <asp:HyperLink runat="server" ID="hlCancel" ResourceKey="cmdCancel" CssClass="dnnSecondaryAction" />
</p>
