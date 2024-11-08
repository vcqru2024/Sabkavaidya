<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.P_Settings_Author, App_Web_p_settings_author.ascx.87459c53" %>
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
<table cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem"
    runat="server" id="tblGeneral">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plType" runat="server" ControlName="ddlType"></dnn:label>
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
            <dnn:label ID="plTemplate" runat="server" ControlName="ddlTemplate"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTemplate" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
     <tr>
        <td colspan="2">
            <asp:Label ID="lblVendorLinkTarget" runat="server" resourcekey="Tip_VendorLinkTarget" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plVendorLinkTarget" ControlName="ddlVendorLinkTarget" runat="server"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlVendorLinkTarget" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="ddlVendorLinkTarget_SelectedIndexChanged">
                <asp:ListItem Value="Cp_Product_List" resourcekey="li_VendorLinkTarget_List">Cp_Product_List</asp:ListItem>
                <asp:ListItem Value="Cp_Product_VendorProfile" resourcekey="li_VendorLinkTarget_VendorProfile">Cp_Product_VendorProfile</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>

    <tr runat="server" id="tr_TipListPage">
        <td colspan="2">
            <asp:Label ID="Label2" runat="server" resourcekey="Tip_ListPage" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr runat="server" id="tr_ListPage">
        <td>
            <dnn:label ID="plProductListPage" runat="server" ControlName="ddlProductListPage">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlProductListPage" DataValueField="TabId" DataTextField="IndentedTabName"
                runat="server">
            </asp:DropDownList>
        </td>
    </tr>
     <tr runat="server" id="tr_TipVendorProfilePage">
        <td colspan="2">
            <asp:Label ID="lblVendorProfilePage" runat="server" resourcekey="Tip_VendorProfilePage" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr  runat="server" id="tr_VendorProfilePage">
        <td>
            <dnn:label ID="plVendorProfilePage" runat="server" ControlName="ddlVendorProfilePage">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlVendorProfilePage" DataValueField="TabId" DataTextField="IndentedTabName"
                runat="server">
            </asp:DropDownList>
        </td>
    </tr>

    <tr>
        <td>
            <dnn:label ID="plLinkTarget" ControlName="ddlLinkTarget" runat="server"></dnn:label>
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
            <dnn:label ID="plColCount" runat="server" ControlName="txtColCount"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtColCount" runat="server" Columns="4"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtColCount"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plDisplayAvatar" runat="server" ControlName="chkDisplayAvatar"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayAvatar" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plDisplayRss" runat="server" ControlName="chkDisplayRss"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayRss" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label3" runat="server" resourcekey="Tip_VendorInfor" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowVendorCompany" runat="server" ControlName="chkShowVendorCompany">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowVendorCompany" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowLocation_Country" runat="server" ControlName="chkShowLocation_Country">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowLocation_Country" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowLocation_State" runat="server" ControlName="chkShowLocation_State">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowLocation_State" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowLocation_City" runat="server" ControlName="chkShowLocation_City">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowLocation_City" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowLocation_Town" runat="server" ControlName="chkShowLocation_Town">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowLocation_Town" runat="server" />
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="dnnPrimaryAction" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="True"></asp:LinkButton>&nbsp;&nbsp;
    <asp:HyperLink runat="server" ID="hlCancel" ResourceKey="cmdCancel" CssClass="dnnSecondaryAction" />
</p>
