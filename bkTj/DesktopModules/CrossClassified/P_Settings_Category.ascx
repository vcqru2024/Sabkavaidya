<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.P_Settings_Category, App_Web_p_settings_category.ascx.87459c53" %>
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
 <table id="tblGeneral" cellspacing="0" cellpadding="2" border="0" runat="server" width="100%"
    class="dnnFormItem">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plType" runat="server" ControlName="ddlType"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlType" runat="server" DataTextField="Name" DataValueField="Id"
                AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label1" runat="server" resourcekey="Tip_Template" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plTemplate" runat="server" ControlName="ddlTemplate"></dnn:label>
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
        <td style="width: 200px">
            <dnn:label ID="plProductListPage" runat="server" ControlName="ddlProductListPage">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlProductListPage" DataValueField="TabId" DataTextField="IndentedTabName"
                runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
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
        <td style="width: 200px">
            <dnn:label ID="plDisplayStyle" runat="server" ControlName="rblDisplayStyle"></dnn:label>
        </td>
        <td>
            <asp:radiobuttonlist ID="rblDisplayStyle" runat="server" RepeatColumns="2">
                <asp:ListItem Value="List" Selected="True" Text="List" resourcekey="li_DisplayStyle_List" />
                <asp:ListItem Value="Tree" Text="Tree" resourcekey="li_DisplayStyle_Tree" />
            </asp:radiobuttonlist>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowProductCounts" runat="server" ControlName="chkShowProductCounts">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowProductCounts" runat="server" />
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
</table>
<dnn:sectionhead ID="secTree" runat="server" Section="tblTree" ResourceKey="secTree"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblTree" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem"
    width="100%">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plTreeViewImageSet" runat="server" ControlName="ddlTreeViewImageSet">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTreeViewImageSet" runat="server">
                <asp:ListItem Value="Arrows" Text="Arrows" />
                <asp:ListItem Value="BulletedList" Text="BulletedList" />
                <asp:ListItem Value="BulletedList2" Text="BulletedList2" />
                <asp:ListItem Value="BulletedList3" Text="BulletedList3" />
                <asp:ListItem Value="BulletedList4" Text="BulletedList4" />
                <asp:ListItem Value="Contacts" Text="Contacts" />
                <asp:ListItem Value="Events" Text="Events" />
                <asp:ListItem Value="Faq" Text="Faq" />
                <asp:ListItem Value="Inbox" Text="Inbox" />
                <asp:ListItem Value="Msdn" Text="Msdn" />
                <asp:ListItem Value="News" Text="News" />
                <asp:ListItem Value="Simple" Text="Simple" />
                <asp:ListItem Value="Simple2" Text="Simple2" />
                <asp:ListItem Value="WindowsHelp" Text="WindowsHelp" />
                <asp:ListItem Value="XPFileExplorer" Text="XPFileExplorer" />
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plTreeExpandDepth" runat="server" ControlName="ddlTreeExpandDepth">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTreeExpandDepth" runat="server">
                <asp:ListItem Value="-1" Text="All" resourcekey="li_TreeExpandDepth_All" />
                <asp:ListItem Value="0" Text="0" />
                <asp:ListItem Value="1" Text="1" />
                <asp:ListItem Value="2" Text="2" />
                <asp:ListItem Value="3" Text="3" />
                <asp:ListItem Value="4" Text="4" />
                <asp:ListItem Value="5" Text="5" />
                <asp:ListItem Value="6" Text="6" />
                <asp:ListItem Value="7" Text="7" />
                <asp:ListItem Value="8" Text="8" />
                <asp:ListItem Value="9" Text="9" />
                <asp:ListItem Value="10" Text="10" />
            </asp:DropDownList>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secList" runat="server" Section="tblList" ResourceKey="secList"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblList" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem"
    width="100%">
    <tr>
        <td colspan="2">
         <asp:Label ID="Label3" runat="server" resourcekey="Tip_Category" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plCategory" runat="server" ControlName="tvCategory"></dnn:label>
        </td>
        <td>
            <asp:TreeView ID="tvCategory" runat="server" ImageSet="XPFileExplorer" NodeIndent="10" 
                PathSeparator="/" ShowCheckBoxes="All" ExpandDepth="-1">
                <ParentNodeStyle Font-Bold="False" />
                <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                    VerticalPadding="0px" />
                <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                    NodeSpacing="0px" VerticalPadding="2px" />
            </asp:TreeView>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowImage" runat="server" ControlName="chkShowImage"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowImage" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowDescription" runat="server" ControlName="chkShowDescription">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowDescription" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plImageWidth" runat="server" ControlName="txtImageWidth"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtImageWidth" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtImageWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plColCount" runat="server" ControlName="txtColCount"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtColCount" runat="server" Columns="4"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtColCount"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="dnnPrimaryAction" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="True"></asp:LinkButton>&nbsp;
    <asp:HyperLink runat="server" ID="hlCancel" ResourceKey="cmdCancel" CssClass="dnnSecondaryAction" />
</p>
