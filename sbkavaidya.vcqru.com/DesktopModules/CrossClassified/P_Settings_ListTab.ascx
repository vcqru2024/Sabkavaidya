<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.P_Settings_ListTab, App_Web_p_settings_listtab.ascx.87459c53" %>

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
            <asp:DropDownList ID="ddlTemplate_FixedPrice" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr runat="server" id="tr_Template_Ad">
        <td>
            <dnn:label ID="plTemplate_Ad" runat="server" ControlName="ddlTemplate_Ad"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTemplate_Ad" runat="server" >
            </asp:DropDownList>
        </td>
    </tr>
    <tr runat="server" id="tr_Template_Auction">
        <td>
            <dnn:label ID="plTemplate_Auction" runat="server" ControlName="ddlTemplate_Auction">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTemplate_Auction" runat="server" >
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
                runat="server">
            </asp:DropDownList>
        </td>
    </tr>
     <tr>
        <td colspan="2">
            <asp:Label ID="Label3" runat="server" resourcekey="Tip_RowAndColumn" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
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
            <asp:DropDownList ID="ddlSortField" runat="server" >
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
            <asp:DropDownList ID="ddlLinkTarget" runat="server">
                <asp:ListItem Value="_self" resourcekey="li_LinkTarget_Self">_Self</asp:ListItem>
                <asp:ListItem Value="_blank" resourcekey="li_LinkTarget_Blank">_Blank</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secJqueryTab" runat="server" Section="tblJqueryTab" ResourceKey="secJqueryTab"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblJqueryTab" cellspacing="0" cellpadding="2" width="100%" border="0"
    runat="server" class="dnnFormItem">
     <tr>
        <td colspan="2">
            <asp:Label ID="Label4" runat="server" resourcekey="Tip_JQueryUI" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plCssStyle" runat="server" ControlName="ddlCssStyle">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlCssStyle" runat="server" >
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plHeightStyle" runat="server" ControlName="ddlHeightStyle">
            </dnn:label>
        </td>
        <td>
             <asp:DropDownList ID="ddlHeightStyle" runat="server">
                <asp:ListItem Value="auto" resourcekey="li_HeightStyle_auto"></asp:ListItem>
                <asp:ListItem Value="fill" resourcekey="li_HeightStyle_fill"></asp:ListItem>
                <asp:ListItem Value="content" resourcekey="li_HeightStyle_content"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plActiveMode" runat="server" ControlName="rblActiveMode">
            </dnn:label>
        </td>
        <td>
             <asp:RadioButtonList ID="rblActiveMode" runat="server" RepeatColumns="3">
                <asp:ListItem Value="click" resourcekey="li_ActiveMode_click"></asp:ListItem>
                <asp:ListItem Value="hover" resourcekey="li_ActiveMode_hover"></asp:ListItem>
                <asp:ListItem Value="autorotate" resourcekey="li_ActiveMode_autorotate"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plRotateInterval" runat="server" ControlName="txtRotateInterval">
            </dnn:label>
        </td>
        <td>
             <asp:TextBox ID="txtRotateInterval" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator9" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRotateInterval"></asp:RegularExpressionValidator>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plStartTab" runat="server" ControlName="ddlStartTab">
            </dnn:label>
        </td>
        <td>
             <asp:DropDownList ID="ddlStartTab" runat="server">
              <asp:ListItem Value="0"  Text="0" ></asp:ListItem>
                <asp:ListItem Value="1"  Text="1" ></asp:ListItem>
              <asp:ListItem Value="2"  Text="2" ></asp:ListItem>
                <asp:ListItem Value="3"  Text="3" ></asp:ListItem>
                 <asp:ListItem Value="4"  Text="4" ></asp:ListItem>
                <asp:ListItem Value="5"  Text="5" ></asp:ListItem>
                 <asp:ListItem Value="6"  Text="6" ></asp:ListItem>
                <asp:ListItem Value="7"  Text="7" ></asp:ListItem>
               
            </asp:DropDownList>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secCategory" runat="server" Section="tblCategory"
    ResourceKey="secCategory" IncludeRule="True" IsExpanded="false" CssClass="SubHead">
</dnn:sectionhead>
<table id="tblCategory" cellspacing="0" cellpadding="2" width="100%" border="0"
    runat="server" class="dnnFormItem">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label16" runat="server" resourcekey="Tip_Category" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plTabCategory1" runat="server" ControlName="ddlTabCategory1"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTabCategory1" runat="server" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plTabCategory1Title" runat="server" ControlName="txtTabCategory1Title"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtTabCategory1Title" runat="server"></asp:TextBox>
         
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plTabCategory2" runat="server" ControlName="ddlTabCategory2"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTabCategory2" runat="server" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plTabCategory2Title" runat="server" ControlName="txtTabCategory2Title"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtTabCategory2Title" runat="server"></asp:TextBox>
         
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plTabCategory3" runat="server" ControlName="ddlTabCategory3"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTabCategory3" runat="server" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plTabCategory3Title" runat="server" ControlName="txtTabCategory3Title"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtTabCategory3Title" runat="server"></asp:TextBox>
         
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plTabCategory4" runat="server" ControlName="ddlTabCategory4"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTabCategory4" runat="server" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plTabCategory4Title" runat="server" ControlName="txtTabCategory4Title"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtTabCategory4Title" runat="server"></asp:TextBox>
         
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plTabCategory5" runat="server" ControlName="ddlTabCategory5"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTabCategory5" runat="server" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plTabCategory5Title" runat="server" ControlName="txtTabCategory5Title"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtTabCategory5Title" runat="server"></asp:TextBox>
         
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plTabCategory6" runat="server" ControlName="ddlTabCategory6"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTabCategory6" runat="server" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plTabCategory6Title" runat="server" ControlName="txtTabCategory6Title"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtTabCategory6Title" runat="server"></asp:TextBox>
         
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plTabCategory7" runat="server" ControlName="ddlTabCategory7"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTabCategory7" runat="server" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plTabCategory7Title" runat="server" ControlName="txtTabCategory7Title"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtTabCategory7Title" runat="server"></asp:TextBox>
         
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plTabCategory8" runat="server" ControlName="ddlTabCategory8"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTabCategory8" runat="server" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plTabCategory8Title" runat="server" ControlName="txtTabCategory8Title"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtTabCategory8Title" runat="server"></asp:TextBox>
         
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
    <tr >
        <td style="width: 200px">
            <dnn:label ID="plShowPrice" runat="server" ControlName="chkShowPrice"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowPrice" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowPromoStart" runat="server" ControlName="chkShowPromoStart">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowPromoStart" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
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

<p align="center">
    <asp:LinkButton CssClass="dnnPrimaryAction" ID="lbtnUpdate" OnClick="lbtnUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="true"></asp:LinkButton>&nbsp;
     <asp:HyperLink runat="server" ID="hlCancel" ResourceKey="cmdCancel" CssClass="dnnSecondaryAction"
        NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
</p>
