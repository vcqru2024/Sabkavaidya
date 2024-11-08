<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.P_Settings_Search, App_Web_p_settings_search.ascx.87459c53" %>
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
<table cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem" runat="server" id="tblGeneral">
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
            <asp:Label ID="Label2" runat="server" resourcekey="Tip_ListPage" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
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
     <tr>
        <td colspan="2">
            <asp:Label ID="Label4" runat="server" resourcekey="Tip_Mode" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plMode" runat="server" ControlName="rblMode"></dnn:label>
        </td>
        <td>
            <asp:RadioButtonList ID="rblMode" runat="server" RepeatColumns="2">
                <asp:ListItem Value="Basic" resourcekey="li_Mode_Basic" />
                <asp:ListItem Value="Advanced" resourcekey="li_Mode_Advanced" />
            </asp:RadioButtonList>
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
 
</table>
<dnn:sectionhead ID="secCategory" runat="server" Section="tblCategory" ResourceKey="secCategory"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblCategory" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server"
    class="dnnFormItem">
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
</table>
<dnn:sectionhead ID="secBasic" runat="server" Section="tblBasic" ResourceKey="secBasic"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblBasic" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server"
    class="dnnFormItem">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plInputWidth" runat="server" ControlName="txtInputWidth"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtInputWidth" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator6" resourcekey="MustBeInteger"
                ForeColor="Red" runat="server" ValidationExpression="\d*" ControlToValidate="txtInputWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowCategory" runat="server" ControlName="chkShowCategory"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCategory" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plCategoryWidth" runat="server" ControlName="txtCategoryWidth"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtCategoryWidth" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" resourcekey="MustBeInteger"
                ForeColor="Red" runat="server" ValidationExpression="\d*" ControlToValidate="txtCategoryWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBreakOnCategory" runat="server" ControlName="chkBreakOnCategory">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBreakOnCategory" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowAuthorList" runat="server" ControlName="chkShowAuthorList">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAuthorList" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plAuthorListWidth" runat="server" ControlName="txtAuthorListWidth">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtAuthorListWidth" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="MustBeInteger"
                ForeColor="Red" runat="server" ValidationExpression="\d*" ControlToValidate="txtAuthorListWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBreakOnAuthorList" runat="server" ControlName="chkBreakOnAuthorList">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBreakOnAuthorList" runat="server" />
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secAdvanced" runat="server" Section="tblAdvanced" ResourceKey="secAdvanced"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblAdvanced" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server"
    class="dnnFormItem">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label6" runat="server" resourcekey="Tip_Advanced_Input" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plWidth_Label" runat="server" ControlName="txtWidth_Label"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtWidth_Label" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" resourcekey="MustBeInteger"
                ForeColor="Red" runat="server" ValidationExpression="\d*" ControlToValidate="txtWidth_Label"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plWidth_Input" runat="server" ControlName="txtWidth_Input"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtWidth_Input" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="MustBeInteger"
                ForeColor="Red" runat="server" ValidationExpression="\d*" ControlToValidate="txtWidth_Input"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plWidth_Operator" runat="server" ControlName="txtWidth_Operator">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtWidth_Operator" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator5" resourcekey="MustBeInteger"
                ForeColor="Red" runat="server" ValidationExpression="\d*" ControlToValidate="txtWidth_Operator"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label9" runat="server" resourcekey="Tip_RepeatColumns" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
  
    <tr>
        <td>
            <dnn:label ID="plRepeatColumns" runat="server" ControlName="txtRepeatColumns">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRepeatColumns" runat="server" Columns="4"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label7" runat="server" resourcekey="Tip_Advanced_BuiltInField" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBuiltInField_Title" runat="server" ControlName="chkBuiltInField_Title">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBuiltInField_Title" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBuiltInField_Sku" runat="server" ControlName="chkBuiltInField_Sku">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBuiltInField_Sku" runat="server" />
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plBuiltInField_Price" runat="server" ControlName="chkBuiltInField_Price">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBuiltInField_Price" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBuiltInField_Category" runat="server" ControlName="chkBuiltInField_Category">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBuiltInField_Category" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBuiltInField_Author" runat="server" ControlName="chkBuiltInField_Author">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBuiltInField_Author" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBuiltInField_CreatedDate" runat="server" ControlName="chkBuiltInField_CreatedDate">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBuiltInField_CreatedDate" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBuiltInField_PublishDate" runat="server" ControlName="chkBuiltInField_PublishDate">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBuiltInField_PublishDate" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBuiltInField_ExpireDate" runat="server" ControlName="chkBuiltInField_ExpireDate">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBuiltInField_ExpireDate" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBuiltInField_Views" runat="server" ControlName="chkBuiltInField_Views">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBuiltInField_Views" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBuiltInField_RatingAverage" runat="server" ControlName="chkBuiltInField_RatingAverage">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBuiltInField_RatingAverage" runat="server" />
        </td>
    </tr>
      <tr>
        <td colspan="2">
            <asp:Label ID="Label8" runat="server" resourcekey="Tip_Advanced_Location" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBuiltInField_Country" runat="server" ControlName="chkBuiltInField_Country">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBuiltInField_Country" runat="server" />
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plBuiltInField_State" runat="server" ControlName="chkBuiltInField_State">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBuiltInField_State" runat="server" />
        </td>
    </tr>
      <tr>
        <td>
            <dnn:label ID="plBuiltInField_City" runat="server" ControlName="chkBuiltInField_City">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBuiltInField_City" runat="server" />
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plBuiltInField_Town" runat="server" ControlName="chkBuiltInField_Town">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBuiltInField_Town" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label5" runat="server" resourcekey="Tip_Advanced_UDT" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_1" runat="server" ControlName="ddlUDT_1"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_1" runat="server"  DataTextField="Text" DataValueField="Value"/>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_2" runat="server" ControlName="ddlUDT_2"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_2" runat="server" DataTextField="Text" DataValueField="Value"/>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_3" runat="server" ControlName="ddlUDT_3"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_3" runat="server" DataTextField="Text" DataValueField="Value"/>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_4" runat="server" ControlName="ddlUDT_4"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_4" runat="server" DataTextField="Text" DataValueField="Value"/>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_5" runat="server" ControlName="ddlUDT_5"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_5" runat="server" DataTextField="Text" DataValueField="Value"/>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_6" runat="server" ControlName="ddlUDT_6"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_6" runat="server" DataTextField="Text" DataValueField="Value"/>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_7" runat="server" ControlName="ddlUDT_7"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_7" runat="server" DataTextField="Text" DataValueField="Value"/>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_8" runat="server" ControlName="ddlUDT_8"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_8" runat="server" DataTextField="Text" DataValueField="Value"/>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_9" runat="server" ControlName="ddlUDT_9"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_9" runat="server" DataTextField="Text" DataValueField="Value"/>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_10" runat="server" ControlName="ddlUDT_10"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_10" runat="server" DataTextField="Text" DataValueField="Value"/>
        </td>
    </tr>
</table>

<p align="center">
    <asp:LinkButton CssClass="dnnPrimaryAction" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="True"></asp:LinkButton>&nbsp;&nbsp;
     <asp:HyperLink runat="server" CssClass="dnnSecondaryAction" ID="hlCancel" ResourceKey="cmdCancel"
        NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
</p>
