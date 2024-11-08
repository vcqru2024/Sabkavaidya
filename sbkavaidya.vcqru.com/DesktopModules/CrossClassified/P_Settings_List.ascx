<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.P_Settings_List, App_Web_p_settings_list.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="portal" TagName="url" Src="~/controls/URLControl.ascx" %>


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
    <tr runat="server" id="tr_Template_FixedPrice">
        <td>
            <dnn:label ID="plTemplate_FixedPrice" runat="server" ControlName="ddlTemplate_FixedPrice">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTemplate_FixedPrice" runat="server" Width="600px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr runat="server" id="tr_Template_Ad">
        <td>
            <dnn:label ID="plTemplate_Ad" runat="server" ControlName="ddlTemplate_Ad"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTemplate_Ad" runat="server" Width="600px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr runat="server" id="tr_Template_Auction">
        <td>
            <dnn:label ID="plTemplate_Auction" runat="server" ControlName="ddlTemplate_Auction">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTemplate_Auction" runat="server" Width="600px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label2" runat="server" resourcekey="Tip_DetailTab" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plDetailTab" runat="server" ControlName="ddlDetailTab"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlDetailTab" DataValueField="TabId" DataTextField="IndentedTabName"
                Width="600px" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plListStyle" ControlName="rblListStyle" runat="server" Text="List Style">
            </dnn:label>
        </td>
        <td>
            <asp:RadioButtonList ID="rblListStyle" runat="server" RepeatColumns="2">
                <asp:ListItem Value="List" resourcekey="li_ListStyle_List">List</asp:ListItem>
                <asp:ListItem Value="Grid" resourcekey="li_ListStyle_Grid">Grid</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label3" runat="server" resourcekey="Tip_AcceptSearchParm" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plAcceptSearchParm" runat="server" ControlName="chkAcceptSearchParm">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkAcceptSearchParm" runat="server"></asp:CheckBox>
        </td>
    </tr>
      <tr>
        <td colspan="2">
            <asp:Label ID="lblUserIdMapping" runat="server" resourcekey="Tip_UserIdMapping" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUserIdMapping" runat="server" ControlName="txtUserIdMapping"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtUserIdMapping" runat="server"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td colspan="2">
            <asp:Label ID="lblGroupIdMapping" runat="server" resourcekey="Tip_GroupIdMapping" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plGroupIdMapping" runat="server" ControlName="txtGroupIdMapping" />
        </td>
        <td>
            <asp:TextBox ID="txtGroupIdMapping" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowFeaturedOnly" runat="server" ControlName="chkShowFeaturedOnly">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowFeaturedOnly" runat="server"></asp:CheckBox>
        </td>
    </tr>
  
    <tr>
        <td>
            <dnn:label ID="plSortField" runat="server" Text="Sort By" ControlName="ddlSortField">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlSortField" runat="server" Width="450px">
                <asp:ListItem Value="CreationDateDesc" Selected="True" resourcekey="li_SortField_CreationDateDesc" />
                <asp:ListItem Value="CreationDateAsc" resourcekey="li_SortField_CreationDateAsc" />
                <asp:ListItem Value="PublishDateDesc" resourcekey="li_SortField_PublishDateDesc" />
                <asp:ListItem Value="PublishDateAsc" resourcekey="li_SortField_PublishDateAsc" />
                <asp:ListItem Value="LastModifiedDateDesc" resourcekey="li_SortField_LastModifiedDateDesc" />
                <asp:ListItem Value="LastModifiedDateAsc" resourcekey="li_SortField_LastModifiedDateAsc" />
                <asp:ListItem Value="ViewsDesc" resourcekey="li_SortField_ViewsDesc" />
                <asp:ListItem Value="ViewsAsc" resourcekey="li_SortField_ViewsAsc" />
                <asp:ListItem Value="NameDesc" resourcekey="li_SortField_NameDesc" />
                <asp:ListItem Value="NameAsc" resourcekey="li_SortField_NameAsc" />
                <asp:ListItem Value="PurchasePriceDesc" resourcekey="li_SortField_PurchasePriceDesc" />
                <asp:ListItem Value="PurchasePriceAsc" resourcekey="li_SortField_PurchasePriceAsc" />
                <asp:ListItem Value="StartPriceDesc" resourcekey="li_SortField_StartPriceDesc" />
                <asp:ListItem Value="StartPriceAsc" resourcekey="li_SortField_StartPriceAsc" />
            </asp:DropDownList>
        </td>
    </tr>
     <tr>
        <td colspan="2">
            <asp:Label ID="Label14" runat="server" resourcekey="Tip_LinkTarget" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plLinkTarget" ControlName="ddlLinkTarget" runat="server"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlLinkTarget" runat="server" Width="300px">
                <asp:ListItem Value="_self" resourcekey="li_LinkTarget_Self">_Self</asp:ListItem>
                <asp:ListItem Value="_blank" resourcekey="li_LinkTarget_Blank">_Blank</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label15" runat="server" resourcekey="Tip_SearchMode" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plSearchMode" ControlName="rblSearchMode" runat="server" />
        </td>
        <td>
            <asp:RadioButtonList ID="rblSearchMode" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="None" resourcekey="li_SearchMode_None">None</asp:ListItem>
                <asp:ListItem Value="Basic" resourcekey="li_SearchMode_Basic">Basic</asp:ListItem>
                <asp:ListItem Value="Advanced" resourcekey="li_SearchMode_Advanced">Advanced</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secSearch_Basic" runat="server" Section="tblSearch_Basic" ResourceKey="secSearch_Basic"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblSearch_Basic" cellspacing="0" cellpadding="2" width="100%" border="0"
    runat="server" class="dnnFormItem">
    <tr>
        <td>
            <dnn:label ID="plBasic_TitleInputWidth" runat="server" ControlName="txtBasic_TitleInputWidth">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtBasic_TitleInputWidth" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator10" resourcekey="MustBeInteger"
                ForeColor="Red" runat="server" ValidationExpression="\d*" ControlToValidate="txtBasic_TitleInputWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plBasic_ShowSortInSearch" runat="server" ControlName="chkBasic_ShowSortInSearch">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBasic_ShowSortInSearch" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBasic_ShowPageInSearch" runat="server" ControlName="chkBasic_ShowPageInSearch">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBasic_ShowPageInSearch" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secSearch_Advanced" runat="server" Section="tblSearch_Advanced"
    ResourceKey="secSearch_Advanced" IncludeRule="True" IsExpanded="false" CssClass="SubHead">
</dnn:sectionhead>
<table id="tblSearch_Advanced" cellspacing="0" cellpadding="2" width="100%" border="0"
    runat="server" class="dnnFormItem">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label16" runat="server" resourcekey="Tip_Advanced_Input" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plWidth_Label" runat="server" ControlName="txtWidth_Label"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtWidth_Label" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator11" resourcekey="MustBeInteger"
                ForeColor="Red" runat="server" ValidationExpression="\d*" ControlToValidate="txtWidth_Label"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plWidth_Input" runat="server" ControlName="txtWidth_Input"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtWidth_Input" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator12" resourcekey="MustBeInteger"
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
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator14" resourcekey="MustBeInteger"
                ForeColor="Red" runat="server" ValidationExpression="\d*" ControlToValidate="txtWidth_Operator"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label17" runat="server" resourcekey="Tip_RepeatColumns" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plRepeatColumns" runat="server" ControlName="txtRepeatColumns"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRepeatColumns" runat="server" Columns="4"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label18" runat="server" resourcekey="Tip_Advanced_BuiltInField" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
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
            <dnn:label ID="plBuiltInField_Sort" runat="server" ControlName="chkBuiltInField_Sort">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBuiltInField_Sort" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBuiltInField_Paging" runat="server" ControlName="chkBuiltInField_Paging">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBuiltInField_Paging" runat="server" />
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
            <asp:Label ID="Label20" runat="server" resourcekey="Tip_Advanced_Location" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
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
            <asp:Label ID="Label19" runat="server" resourcekey="Tip_Advanced_UDT" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_1" runat="server" ControlName="ddlUDT_1"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_1" runat="server" DataTextField="Text" DataValueField="Value" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_2" runat="server" ControlName="ddlUDT_2"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_2" runat="server" DataTextField="Text" DataValueField="Value" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_3" runat="server" ControlName="ddlUDT_3"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_3" runat="server" DataTextField="Text" DataValueField="Value" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_4" runat="server" ControlName="ddlUDT_4"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_4" runat="server" DataTextField="Text" DataValueField="Value" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_5" runat="server" ControlName="ddlUDT_5"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_5" runat="server" DataTextField="Text" DataValueField="Value" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_6" runat="server" ControlName="ddlUDT_6"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_6" runat="server" DataTextField="Text" DataValueField="Value" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_7" runat="server" ControlName="ddlUDT_7"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_7" runat="server" DataTextField="Text" DataValueField="Value" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_8" runat="server" ControlName="ddlUDT_8"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_8" runat="server" DataTextField="Text" DataValueField="Value" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_9" runat="server" ControlName="ddlUDT_9"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_9" runat="server" DataTextField="Text" DataValueField="Value" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDT_10" runat="server" ControlName="ddlUDT_10"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDT_10" runat="server" DataTextField="Text" DataValueField="Value" />
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secCategory" runat="server" Section="tblCategory" ResourceKey="secCategory"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblCategory" cellspacing="0" cellpadding="2" border="0" runat="server" width="100%"
    class="dnnFormItem">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label4" runat="server" resourcekey="Tip_Category" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
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
<dnn:sectionhead ID="secVendor" runat="server" Section="tblVendor" ResourceKey="secVendor"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblVendor" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem" width="100%">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label5" runat="server" resourcekey="Tip_Author" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plVendor" runat="server" ControlName="cblType"></dnn:label>
        </td>
        <td>
            <asp:CheckBoxList ID="cblVendor" runat="server" RepeatColumns="4">
            </asp:CheckBoxList>
        </td>
    </tr>
</table>

<dnn:sectionhead ID="secImage" runat="server" Section="tblImage" ResourceKey="secImage"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblImage" cellspacing="0" cellpadding="2" border="0" runat="server" width="100%"
    class="dnnFormItem">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowImage" runat="server" ControlName="chkShowImage"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowImage" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowImageOnly" runat="server" ControlName="chkShowImageOnly"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowImageOnly" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label12" runat="server" resourcekey="Tip_UseLightBoxEffect" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUseLightBoxEffect" runat="server" ControlName="chkUseLightBoxEffect">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkUseLightBoxEffect" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label6" runat="server" resourcekey="Tip_Image" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plImageWidth" runat="server" ControlName="txtImageWidth"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtImageWidth" runat="server" Columns="4"></asp:TextBox>
            <asp:CheckBox ID="chkForceImageWidth" runat="server" Text="Force Image Width" resourcekey="chkForceImageWidth">
            </asp:CheckBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtImageWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plImageHeight" runat="server" ControlName="txtImageHeight"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtImageHeight" runat="server" Columns="4"></asp:TextBox>
            <asp:CheckBox ID="chkForceImageHeight" runat="server" Text="Force Image Height" resourcekey="chkForceImageHeight">
            </asp:CheckBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator13" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtImageHeight"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>


<dnn:sectionhead ID="secContent" runat="server" Section="tblContent" ResourceKey="secContent"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblContent" cellspacing="0" cellpadding="2" border="0" runat="server" width="100%"
    class="dnnFormItem">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label8" runat="server" resourcekey="Tip_DisplayContent" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
  
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowName" runat="server" ControlName="chkShowName"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowName" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowUserName" runat="server" ControlName="chkShowUserName"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowUserName" runat="server"></asp:CheckBox>
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
            <asp:DropDownList ID="ddlVendorLinkTarget" runat="server">
                <asp:ListItem Value="Cp_Product_List" resourcekey="li_VendorLinkTarget_List">Cp_Product_List</asp:ListItem>
                <asp:ListItem Value="Cp_Product_VendorProfile" resourcekey="li_VendorLinkTarget_VendorProfile">Cp_Product_VendorProfile</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowVendorCompany" runat="server" ControlName="chkShowVendorCompany"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowVendorCompany" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td colspan="2">
            <asp:Label ID="Label21" runat="server" resourcekey="Tip_ShowLocation" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowLocation_Country" runat="server" ControlName="chkShowLocation_Country"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowLocation_Country" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowLocation_State" runat="server" ControlName="chkShowLocation_State"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowLocation_State" runat="server"></asp:CheckBox>
        </td>
    </tr>
      <tr>
        <td>
            <dnn:label ID="plShowLocation_City" runat="server" ControlName="chkShowLocation_City"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowLocation_City" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowLocation_Town" runat="server" ControlName="chkShowLocation_Town"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowLocation_Town" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowCreatedDate" runat="server" ControlName="chkShowCreatedDate">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCreatedDate" runat="server"></asp:CheckBox>
        </td>
    </tr>
    
    <tr id="Tr4" runat="server" visible="<%#CurrentType.FieldEnable_Sku %>">
        <td>
            <dnn:label ID="plShowSku" runat="server" ControlName="chkShowSku"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowSku" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr id="Tr5" runat="server" visible="<%#CurrentType.FieldEnable_Weight %>">
        <td>
            <dnn:label ID="plShowWeight" runat="server" ControlName="chkShowWeight"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowWeight" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr id="Tr7" runat="server" visible="<%#CurrentType.FieldEnable_Summary %>">
        <td>
            <dnn:label ID="plShowSummary" runat="server" ControlName="chkShowSummary"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowSummary" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr id="Tr8" runat="server" visible="<%#CurrentType.FieldEnable_Summary %>">
        <td>
            <dnn:label ID="plSummaryLength" runat="server" ControlName="txtSummaryLength"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtSummaryLength" runat="server" Columns="4"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator7" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtSummaryLength"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowFeaturedField" runat="server" ControlName="chkShowFeaturedField"
                Text="Show Featured Field"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowFeaturedField" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowViews" runat="server" ControlName="chkShowViews" Text="Show Number Of Views">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowViews" runat="server"></asp:CheckBox>
        </td>
    </tr>
  <tr>
        <td colspan="2">
            <asp:Label ID="Label13" runat="server" resourcekey="Tip_Rating" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowRating" runat="server" ControlName="chkShowRating"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowRating" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plRatingImage" runat="server" ControlName="ddlRatingImage"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlRatingImage" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secFixedPrice" runat="server" Section="tblFixedPrice" ResourceKey="secFixedPrice"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblFixedPrice" cellspacing="0" cellpadding="2" border="0" runat="server" width="100%"
    class="dnnFormItem">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label11" runat="server" resourcekey="Tip_FixedPriceContent" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr id="Tr1" runat="server" visible="<%#CurrentType.FieldEnable_Price %>">
        <td>
            <dnn:label ID="plShowPrice" runat="server" ControlName="chkShowPrice"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowPrice" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr id="Tr2" runat="server" visible="<%#CurrentType.FieldEnable_Price %>">
        <td>
            <dnn:label ID="plShowPromoStart" runat="server" ControlName="chkShowPromoStart">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowPromoStart" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr id="Tr3" runat="server" visible="<%#CurrentType.FieldEnable_Price %>">
        <td>
            <dnn:label ID="plShowPromoEnd" runat="server" ControlName="chkShowPromoEnd"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowPromoEnd" runat="server"></asp:CheckBox>
        </td>
    </tr>
      <tr>
        <td>
            <dnn:label ID="plShowPromoOnly" runat="server" ControlName="chkShowPromoOnly"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowPromoOnly" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowOrderNow" runat="server" ControlName="chkShowOrderNow"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowOrderNow" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowAddCart" runat="server" ControlName="chkShowAddCart"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAddCart" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblRefreshAfterAddCart" runat="server" resourcekey="Tip_RefreshAfterAddCart" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plRefreshAfterAddCart" runat="server" ControlName="chkRefreshAfterAddCart"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkRefreshAfterAddCart" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr id="Tr6" runat="server" visible="<%#CurrentType.FieldEnable_PackageFee %>">
        <td>
            <dnn:label ID="plShowPackageFee" runat="server" ControlName="chkShowPackageFee">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowPackageFee" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secAuction" runat="server" Section="tblAuction" ResourceKey="secAuction"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblAuction" cellspacing="0" cellpadding="2" border="0" runat="server" width="100%"
    class="dnnFormItem">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label10" runat="server" resourcekey="Tip_AuctionContent" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowStartPrice" runat="server" ControlName="chkShowStartPrice">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowStartPrice" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowBuyNowPrice" runat="server" ControlName="chkShowBuyNowPrice">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowBuyNowPrice" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowCurrentBid" runat="server" ControlName="chkShowCurrentBid">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCurrentBid" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowCurrentBidder" runat="server" ControlName="chkShowCurrentBidder">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCurrentBidder" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowRemainTime" runat="server" ControlName="chkShowRemainTime">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowRemainTime" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowBidCount" runat="server" ControlName="chkShowBidCount"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowBidCount" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowBidButton" runat="server" ControlName="chkShowBidButton"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowBidButton" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowPublishDate" runat="server" ControlName="chkShowPublishDate">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowPublishDate" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowExpireDate" runat="server" ControlName="chkShowExpireDate">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowExpireDate" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>

<dnn:sectionhead ID="secUDField" runat="server" Section="tblUDField" ResourceKey="secUDField"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead" Visible="false"></dnn:sectionhead>
<table id="tblUDField" cellspacing="0" cellpadding="2" border="0" runat="server" width="100%"
    class="dnnFormItem" visible="false">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label9" runat="server" resourcekey="Tip_UdField" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plUseBuiltInTemplate" runat="server" ControlName="chkUseBuiltInTemplate">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkUseBuiltInTemplate" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDFieldList" runat="server" ControlName="cblUDFieldList"></dnn:label>
        </td>
        <td>
            <asp:CheckBoxList ID="cblUDFieldList" runat="server" RepeatColumns="2" RepeatDirection="Horizontal"
                DataTextField="FieldName" DataValueField="Id">
            </asp:CheckBoxList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDField_ImageWidth" runat="server" ControlName="txtUDField_ImageWidth">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtUDField_ImageWidth" runat="server" Columns="4"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDField_ImageHeight" runat="server" ControlName="txtUDField_ImageHeight">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtUDField_ImageHeight" runat="server" Columns="4"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDField_CheckBoxList_Enabled" runat="server" ControlName="chkUDField_CheckBoxList_Enabled">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkUDField_CheckBoxList_Enabled" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDField_CheckBoxList_RepeatColumns" runat="server" ControlName="txtUDField_CheckBoxList_RepeatColumns">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtUDField_CheckBoxList_RepeatColumns" runat="server" Columns="4"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator8" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtUDField_CheckBoxList_RepeatColumns"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secPaging" runat="server" Section="tblPaging" ResourceKey="secPaging"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblPaging" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem" width="100%">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plPaging" runat="server" ControlName="chkShowPage"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowPage" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plRowCount" runat="server" ControlName="txtRowCount"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRowCount" runat="server" Columns="4"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRowCount"></asp:RegularExpressionValidator>
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
            <dnn:label ID="plPageSpan" runat="server" ControlName="txtPageSpan"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtPageSpan" runat="server" Columns="4"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtPageSpan"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowPageInfo" runat="server" ControlName="chkShowPageInfo"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowPageInfo" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secRoll" runat="server" Text="Roll" Section="tblRoll" ResourceKey="secRoll"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblRoll" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem" width="100%">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plRoll" runat="server" Text="Roll" ControlName="chkRoll"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkRoll" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plDirection" runat="server" ControlName="ddlDirection"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlDirection" runat="server" Width="300px">
                <asp:ListItem Value="UP" resourcekey="li_Direction_Up">UP</asp:ListItem>
                <asp:ListItem Value="DOWN" resourcekey="li_Direction_Down">DOWN</asp:ListItem>
                <asp:ListItem Value="LEFT" resourcekey="li_Direction_Left">LEFT</asp:ListItem>
                <asp:ListItem Value="RIGHT" resourcekey="li_Direction_Right">RIGHT</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plMarHeight" runat="server" ControlName="txtMarHeight"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtMarHeight" runat="server" Columns="4"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator5" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtMarHeight"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plScrollAmount" runat="server" ControlName="txtScrollAmount"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtScrollAmount" runat="server" Columns="4"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator6" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtScrollAmount"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secMoreProducts" runat="server" Section="tblMoreProducts" ResourceKey="secMoreProducts"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblMoreProducts" cellspacing="0" cellpadding="2" border="0" runat="server" width="100%"
    class="dnnFormItem">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label7" runat="server" resourcekey="Tip_MoreProduct" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plMoreProducts" runat="server" ControlName="chkMoreProducts"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkMoreProducts" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plMoreProductsText" runat="server" ControlName="txtMoreProductsText">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtMoreProductsText" runat="server" Columns="40"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plMoreProductsLink" runat="server" ControlName="ddlMoreProductsLink">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlMoreProductsLink" DataValueField="TabId" DataTextField="IndentedTabName" Width="600px"
                runat="server">
            </asp:DropDownList>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secRss" runat="server" Section="tblRss" ResourceKey="secRss"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblRss" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem" width="100%">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plDisplayRss" runat="server" ControlName="chkDisplayRss"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayRss" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="dnnPrimaryAction" ID="lbtnUpdate" OnClick="lbtnUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="true"></asp:LinkButton>&nbsp;
     <asp:HyperLink runat="server" ID="hlCancel" ResourceKey="cmdCancel" CssClass="dnnSecondaryAction"
        NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
</p>
