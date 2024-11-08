<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.P_Settings_Detail, App_Web_p_settings_detail.ascx.87459c53" %>
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
    IncludeRule="True" IsExpanded="True" CssClass="SubHead"></dnn:sectionhead>
<table cellspacing="0" cellpadding="2" border="0" runat="server" id="tblGeneral" width="100%"
    class="dnnFormItem">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plType" runat="server" ControlName="ddlType"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlType" runat="server" DataTextField="Name" DataValueField="Id"
                AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged" />
        </td>
    </tr>
    <tr>
        <td colspan="2" >
         <asp:Label ID="Label1" runat="server" resourcekey="Tip_Template"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
          
        </td>
    </tr>
      <tr runat="server" id="tr_Template_FixedPrice">
        <td>
            <dnn:label ID="plTemplate_FixedPrice" runat="server" ControlName="ddlTemplate_FixedPrice">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTemplate_FixedPrice" runat="server" >
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
        <td colspan="2" >
         <asp:Label ID="Label2" runat="server" resourcekey="Tip_TabStyle"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
          
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plTabStyle" runat="server" ControlName="ddlTabStyle"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTabStyle" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plCheckXhtmlDocType" runat="server" ControlName="chkCheckXhtmlDocType">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkCheckXhtmlDocType" runat="server"></asp:CheckBox>
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
    <tr runat="server" visible="<%#CurrentType.FieldEnable_Sku %>">
        <td >
            <dnn:label ID="plShowSku" runat="server" ControlSku="chkShowSku"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowSku" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.FieldEnable_Weight %>">
        <td >
            <dnn:label ID="plShowWeight" runat="server" ControlName="chkShowWeight"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowWeight" runat="server"></asp:CheckBox>
        </td>
    </tr>
   
    <tr>
        <td >
            <dnn:label ID="plShowAuthor" runat="server" ControlName="chkShowAuthor"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAuthor" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plShowAuthorAvatar" runat="server" ControlName="chkShowAuthorAvatar">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAuthorAvatar" runat="server"></asp:CheckBox>
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
    <tr runat="server" visible="<%#CurrentType.FieldEnable_Support %>">
        <td >
            <dnn:label ID="plShowSupport" runat="server" ControlName="chkShowSupport"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowSupport" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.FieldEnable_License %>">
        <td >
            <dnn:label ID="plShowLicense" runat="server" ControlName="chkShowLicense"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowLicense" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.FieldEnable_Delivery %>">
        <td >
            <dnn:label ID="plShowDelivery" runat="server" ControlName="chkShowDelivery"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowDelivery" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.FieldEnable_SpecialOffer %>">
        <td >
            <dnn:label ID="plShowSpecialOffer" runat="server" ControlName="chkShowSpecialOffer">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowSpecialOffer" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.FieldEnable_Summary %>">
        <td >
            <dnn:label ID="plShowSummary" runat="server" ControlName="chkShowSummary"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowSummary" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.FieldEnable_Description %>">
        <td >
            <dnn:label ID="plShowDescription" runat="server" ControlName="chkShowDescription">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowDescription" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.EnableField1 %>">
        <td >
            <dnn:label ID="plShowField1" runat="server" ControlName="chkShowField1" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowField1" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.EnableField2 %>">
        <td >
            <dnn:label ID="plShowField2" runat="server" ControlName="chkShowField2" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowField2" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.EnableField3 %>">
        <td >
            <dnn:label ID="plShowField3" runat="server" ControlName="chkShowField3" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowField3" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.EnableField4 %>">
        <td >
            <dnn:label ID="plShowField4" runat="server" ControlName="chkShowField4" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowField4" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.EnableField5 %>">
        <td >
            <dnn:label ID="plShowField5" runat="server" ControlName="chkShowField5" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowField5" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plShowViews" runat="server" ControlName="chkShowViews"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowViews" runat="server"></asp:CheckBox>
        </td>
    </tr>
   <tr>
        <td >
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
    <tr>
        <td>
            <dnn:label ID="plShowLastModifiedDate" runat="server" ControlName="chkShowLastModifiedDate">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowLastModifiedDate" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plShowAttachment" runat="server" ControlName="chkShowAttachment">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAttachment" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plShowSocialBookmarks" runat="server" ControlName="chkShowSocialBookmarks">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowSocialBookmarks" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plShowReturn" runat="server" ControlName="chkShowReturn"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowReturn" runat="server"></asp:CheckBox>
        </td>
    </tr>
   <%-- <tr>
        <td >
            <dnn:label ID="plShowAddFavorite" runat="server" ControlName="chkShowAddFavorite">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAddFavorite" runat="server"></asp:CheckBox>
        </td>
    </tr>--%>
    <tr>
        <td >
            <dnn:label ID="plShowPrint" runat="server" ControlName="chkShowPrint"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowPrint" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td >
            <dnn:label ID="plShowAddWatch" runat="server" ControlName="chkShowAddWatch"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAddWatch" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plShowAddTicket" runat="server" ControlName="chkShowAddTicket"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAddTicket" runat="server"></asp:CheckBox>
        </td>
    </tr>
       <tr runat="server" visible="<%# CurrentType.AllowLocation %>">
        <td>
            <dnn:label ID="plShowLocation_Country" runat="server" ControlName="chkShowLocation_Country"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowLocation_Country" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr runat="server" visible="<%# CurrentType.AllowLocation %>">
        <td>
            <dnn:label ID="plShowLocation_State" runat="server" ControlName="chkShowLocation_State"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowLocation_State" runat="server"></asp:CheckBox>
        </td>
    </tr>
      <tr runat="server" visible="<%# CurrentType.AllowLocation %>">
        <td>
            <dnn:label ID="plShowLocation_City" runat="server" ControlName="chkShowLocation_City"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowLocation_City" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" visible="<%# CurrentType.AllowLocation %>">
        <td>
            <dnn:label ID="plShowLocation_Town" runat="server" ControlName="chkShowLocation_Town"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowLocation_Town" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secVendorProfile" runat="server" Section="tblVendorProfile" ResourceKey="secVendorProfile"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblVendorProfile" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem" width="100%">
 
     <tr>
        <td colspan="2">
            <asp:Label ID="Label14" runat="server" resourcekey="Tip_VendorProfile" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowVendorProfile" runat="server" ControlName="chkShowVendorProfile">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowVendorProfile" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowBiography" runat="server" ControlName="chkShowBiography"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowBiography" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowSiteUrl" runat="server" ControlName="chkShowSiteUrl"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowSiteUrl" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowLogoUrl" runat="server" ControlName="chkShowLogoUrl"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowLogoUrl" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowSlogan" runat="server" ControlName="chkShowSlogan"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowSlogan" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowCompany" runat="server" ControlName="chkShowCompany"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCompany" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
           <td>
            <dnn:label ID="plShowTel" runat="server" ControlName="chkShowTel"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowTel" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowFax" runat="server" ControlName="chkShowFax"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowFax" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowIM" runat="server" ControlName="chkShowIM"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowIM" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowLinkman" runat="server" ControlName="chkShowLinkman"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowLinkman" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowCountry" runat="server" ControlName="chkShowCountry"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCountry" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowState" runat="server" ControlName="chkShowState"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowState" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowCity" runat="server" ControlName="chkShowCity"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCity" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowTown" runat="server" ControlName="chkShowTown"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowTown" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowAddress" runat="server" ControlName="chkShowAddress"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAddress" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowBusinessScope" runat="server" ControlName="chkShowBusinessScope"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowBusinessScope" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowZipcode" runat="server" ControlName="chkShowZipcode"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowZipcode" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr runat="server" id="trVendorField1">
        <td>
            <dnn:label ID="plShowVendorField1" runat="server" ControlName="chkShowVendorField1"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowVendorField1" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr runat="server" id="trVendorField2">
        <td>
            <dnn:label ID="plShowVendorField2" runat="server" ControlName="chkShowVendorField2"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowVendorField2" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr runat="server" id="trVendorField3">
        <td>
            <dnn:label ID="plShowVendorField3" runat="server" ControlName="chkShowVendorField3"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowVendorField3" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr runat="server" id="trVendorField4">
        <td>
            <dnn:label ID="plShowVendorField4" runat="server" ControlName="chkShowVendorField4"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowVendorField4" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr runat="server" id="trVendorField5">
        <td>
            <dnn:label ID="plShowVendorField5" runat="server" ControlName="chkShowVendorField5"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowVendorField5" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr runat="server" id="trVendorField6">
        <td>
            <dnn:label ID="plShowVendorField6" runat="server" ControlName="chkShowVendorField6"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowVendorField6" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr runat="server" id="trVendorField7">
        <td>
            <dnn:label ID="plShowVendorField7" runat="server" ControlName="chkShowVendorField7"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowVendorField7" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr runat="server" id="trVendorField8">
        <td>
            <dnn:label ID="plShowVendorField8" runat="server" ControlName="chkShowVendorField8"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowVendorField8" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr runat="server" id="trVendorField9">
        <td>
            <dnn:label ID="plShowVendorField9" runat="server" ControlName="chkShowVendorField9"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowVendorField9" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr runat="server" id="trVendorField10">
        <td>
            <dnn:label ID="plShowVendorField10" runat="server" ControlName="chkShowVendorField10"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowVendorField10" runat="server"></asp:CheckBox>
        </td>

 </tr> 
</table>

<%--<dnn:sectionhead ID="secJQZoom" runat="server" Section="tblJQZoom" ResourceKey="secJQZoom"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblJQZoom" cellspacing="0" cellpadding="2" border="0" class="dnnFormItem" runat="server" width="100%" >
    <tr>
        <td colspan="2" >
        <asp:Label ID="Label3" runat="server" resourcekey="Tip_JQZoom"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
       <br />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/help/JQZoomDemo.jpg"
                ToolTip="JQuery zoom demo" AlternateText="JQuery zoom demo" CssClass="dnnFormMessage dnnFormInfo"/>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plRegisterJQZoomScript" runat="server" ControlName="chkRegisterJQZoomScript">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkRegisterJQZoomScript" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>--%>
<dnn:sectionhead ID="secMainImage" runat="server" Section="tblMainImage" ResourceKey="secMainImage"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblMainImage" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem" width="100%">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowMainImage" runat="server" ControlName="chkShowMainImage"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowMainImage" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td colspan="2" >
         <asp:Label ID="Label4" runat="server" resourcekey="Tip_MainImage"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
         
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plMainImageWidth" runat="server" ControlName="txtMainImageWidth">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtMainImageWidth" runat="server" Columns="4"></asp:TextBox>
            <asp:CheckBox ID="chkForceImageWidth" runat="server" Text="Force Image Width" resourcekey="chkForceImageWidth">
            </asp:CheckBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator17" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtMainImageWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plMainImageHeight" runat="server" ControlName="txtMainImageHeight">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtMainImageHeight" runat="server" Columns="4"></asp:TextBox>
            <asp:CheckBox ID="chkForceImageHeight" runat="server" Text="Force Image Height" resourcekey="chkForceImageHeight">
            </asp:CheckBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator18" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtMainImageHeight"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secTag" runat="server" Section="tblTag" ResourceKey="secTag"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblTag" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem" width="100%">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowTags" runat="server" ControlName="chkShowTags"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowTags" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plTagsPerRow" runat="server" ControlName="txtTagsPerRow"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtTagsPerRow" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtTagsPerRow"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secComment" runat="server" Section="tblComment" ResourceKey="secComment"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblComment" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem" width="100%">
    <tr  >
        <td style="width: 200px">
            <dnn:label ID="plShowCaptchaInComment" runat="server" ControlName="chkShowCaptchaInComment">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCaptchaInComment" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowComment" runat="server" ControlName="chkShowComment"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowComment" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plCommentRowCount" runat="server" ControlName="txtCommentRowCount">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtCommentRowCount" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtCommentRowCount"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secRating" runat="server" Section="tblRating" ResourceKey="secRating"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblRating" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem" width="100%">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowRating" runat="server" ControlName="chkShowRating"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowRating" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plRatingRowCount" runat="server" ControlName="txtRatingRowCount">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRatingRowCount" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator13" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRatingRowCount"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plRatingImage" runat="server" ControlName="ddlRatingImage"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlRatingImage" runat="server" >
            </asp:DropDownList>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secOrder" runat="server" Section="tblOrder" ResourceKey="secOrder"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblOrder" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem"
    width="100%">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label11" runat="server" resourcekey="Tip_FixedPriceContent" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
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
            <dnn:label ID="plShowStockQuantity" runat="server" ControlName="chkShowStockQuantity">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowStockQuantity" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowOrderCount" runat="server" ControlName="chkShowOrderCount">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowOrderCount" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowOrderMemo" runat="server" ControlName="chkShowOrderMemo"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowOrderMemo" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowOptionList" runat="server" ControlName="chkShowOptionList">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowOptionList" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowVariantList" runat="server" ControlName="chkShowVariantList">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowVariantList" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.FieldEnable_PackageFee %>">
        <td>
            <dnn:label ID="plShowPackageFee" runat="server" ControlName="chkShowPackageFee">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowPackageFee" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowShippingProperty" runat="server" ControlName="chkShowShippingProperty">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowShippingProperty" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowOrderShippingOption" runat="server" ControlName="chkShowOrderShippingOption">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowOrderShippingOption" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secDiscount" runat="server" Section="tblDiscount" ResourceKey="secDiscount"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblDiscount" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem" width="100%">
     <tr>
        <td colspan="2">
            <asp:Label ID="Label9" runat="server" resourcekey="Tip_DiscountContent" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowDiscountTab" runat="server" ControlName="chkShowDiscountTab"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowDiscountTab" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowProductDiscount" runat="server" ControlName="chkShowProductDiscount"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowProductDiscount" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowQuantityDiscount" runat="server" ControlName="chkShowQuantityDiscount"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowQuantityDiscount" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr >
        <td>
            <dnn:label ID="plShowCustomerDiscount" runat="server" ControlName="chkShowCustomerDiscount"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCustomerDiscount" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowCouponDiscount" runat="server" ControlName="chkShowCouponDiscount">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCouponDiscount" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowCouponInput" runat="server" ControlName="chkShowCouponInput"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCouponInput" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowRoleDiscount" runat="server" ControlName="chkShowRoleDiscount"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowRoleDiscount" runat="server"></asp:CheckBox>
        </td>
    </tr>
   <tr>
        <td>
            <dnn:label ID="plShowDateDiscount" runat="server" ControlName="chkShowDateDiscount"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowDateDiscount" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowFirstBuyerDiscount" runat="server" ControlName="chkShowFirstBuyerDiscount"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowFirstBuyerDiscount" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>

<dnn:sectionhead ID="secTransactionHistory" runat="server" Section="tblTransactionHistory"
    ResourceKey="secTransactionHistory" IncludeRule="True" IsExpanded="false" CssClass="SubHead">
</dnn:sectionhead>
<table id="tblTransactionHistory" cellspacing="0" cellpadding="2" border="0" class="dnnFormItem"  width="100%"
    runat="server">
     <tr>
        <td colspan="2">
            <asp:Label ID="Label10" runat="server" resourcekey="Tip_FixedPriceContent" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowTransactionHistory" runat="server" ControlName="chkShowTransactionHistory">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowTransactionHistory" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plShowPriceInTransaction" runat="server" ControlName="chkShowPriceInTransaction">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowPriceInTransaction" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td >
            <dnn:label ID="plShowDateInTransaction" runat="server" ControlName="chkShowDateInTransaction">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowDateInTransaction" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plHideEmptyTransactionHistory" runat="server" ControlName="chkHideEmptyTransactionHistory">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkHideEmptyTransactionHistory" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plTransactionPerPage" runat="server" ControlName="txtTransactionPerPage">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtTransactionPerPage" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator14" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtTransactionPerPage"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secAuction" runat="server" Section="tblAuction" ResourceKey="secAuction"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblAuction" cellspacing="0" cellpadding="2" border="0" runat="server" width="100%"
    class="dnnFormItem">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label12" runat="server" resourcekey="Tip_AuctionContent" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
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
            <dnn:label ID="plShowIncrement" runat="server" ControlName="chkShowIncrement">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowIncrement" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowReservePriceTip" runat="server" ControlName="chkShowReservePriceTip">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowReservePriceTip" runat="server"></asp:CheckBox>
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
            <dnn:label ID="plShowBidCount" runat="server" ControlName="chkShowBidCount"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowBidCount" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowBidHistory" runat="server" ControlName="chkShowBidHistory"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowBidHistory" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plBidHistoryPerPage" runat="server" ControlName="txtBidHistoryPerPage">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtBidHistoryPerPage" runat="server" Columns="4"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtBidHistoryPerPage"></asp:RegularExpressionValidator>
        </td>
    </tr>
   
    <tr>
        <td >
            <dnn:label ID="plShowAuctionStart" runat="server" ControlName="chkShowAuctionStart">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAuctionStart" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowAuctionEnd" runat="server" ControlName="chkShowAuctionEnd">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAuctionEnd" runat="server"></asp:CheckBox>
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
        <td colspan="2">
            <asp:Label ID="Label13" runat="server" resourcekey="Tip_ShowAuctionExplaination" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:label ID="plShowAuctionExplaination" runat="server" ControlName="chkShowAuctionExplaination">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAuctionExplaination" runat="server"></asp:CheckBox>
        </td>
    </tr>
   
     <tr>
        <td>
            <dnn:label ID="plShowAuctionShippingOption" runat="server" ControlName="chkShowAuctionShippingOption">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAuctionShippingOption" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>

<dnn:sectionhead ID="secGoogleMap" runat="server" Section="tblGoogleMap" ResourceKey="secGoogleMap"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblGoogleMap" cellspacing="0" cellpadding="2" border="0" class="dnnFormItem"  width="100%"
    runat="server">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowGoogleMap" runat="server" ControlName="chkShowGoogleMap"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowGoogleMap" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td colspan="2" >
         <asp:Label ID="Label5" runat="server" resourcekey="Tip_GoogleMapZoom"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
          
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plGoogleMapZoom" runat="server" ControlName="txtGoogleMapZoom"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtGoogleMapZoom" runat="server" Columns="6"></asp:TextBox>0 -
            18
            <asp:RangeValidator ID="rang1" runat="server" ControlToValidate="txtGoogleMapZoom"
                resourcekey="MustBetween0To18" MinimumValue="0" MaximumValue="18" Type="Integer"></asp:RangeValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2" >
         <asp:Label ID="Label6" runat="server" resourcekey="Tip_GoogleMapStyle"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
         
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plGoogleMapStyle" runat="server" ControlName="txtGoogleMapStyle">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtGoogleMapStyle" runat="server" Columns="60"></asp:TextBox>
            <asp:Image ID="Image15" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtGoogleMapStyle"
                resourcekey="Required" ID="RequiredFieldValidator3" />
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secUDField" runat="server" Section="tblUDField" ResourceKey="secUDField"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead" Visible="false"></dnn:sectionhead>
<table id="tblUDField" cellspacing="0" cellpadding="2" border="0" runat="server" width="100%"
    class="dnnFormItem"  visible="false">
    <tr>
        <td colspan="2" >
         <asp:Label ID="Label7" runat="server" resourcekey="Tip_UdField"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
           
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
        <td >
            <dnn:label ID="plUDFieldList" runat="server" ControlName="cblUDFieldList"></dnn:label>
        </td>
        <td>
            <asp:CheckBoxList ID="cblUDFieldList" runat="server" RepeatColumns="2" RepeatDirection="Horizontal"
                DataTextField="FieldName" DataValueField="Id">
            </asp:CheckBoxList>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plUDField_ImageWidth" runat="server" ControlName="txtUDField_ImageWidth">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtUDField_ImageWidth" runat="server" Columns="6"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plUDField_ImageHeight" runat="server" ControlName="txtUDField_ImageHeight">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtUDField_ImageHeight" runat="server" Columns="6"></asp:TextBox>
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
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator15" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtUDField_CheckBoxList_RepeatColumns"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secRelatedProduct" runat="server" Section="tblRelatedProduct"
    ResourceKey="secRelatedProduct" IncludeRule="True" IsExpanded="false" CssClass="SubHead">
</dnn:sectionhead>
<table id="tblRelatedProduct" cellspacing="0" cellpadding="2" border="0" class="dnnFormItem"  width="100%"
    runat="server">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowRelatedProduct" runat="server" ControlName="chkShowRelatedProduct">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowRelatedProduct" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plRelatedProductRows" runat="server" ControlName="txtRelatedProductRows">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRelatedProductRows" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRelatedProductRows"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plRelatedProductImageWidth" runat="server" ControlName="txtRelatedProductImageWidth">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRelatedProductImageWidth" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator12" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRelatedProductImageWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secRelatedVideo" runat="server" Section="tblRelatedVideo" ResourceKey="secRelatedVideo"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblRelatedVideo" cellspacing="0" cellpadding="2" border="0" class="dnnFormItem"  width="100%"
    runat="server">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowRelatedVideo" runat="server" ControlName="chkShowRelatedVideo">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowRelatedVideo" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plRelatedVideoPerRow" runat="server" ControlName="txtRelatedVideoPerRow">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRelatedVideoPerRow" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator5" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRelatedVideoPerRow"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plVideoImageWidth" runat="server" ControlName="txtVideoImageWidth">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtVideoImageWidth" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator8" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtVideoImageWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plVideoPlayerWidth" runat="server" ControlName="txtVideoPlayerWidth">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtVideoPlayerWidth" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator9" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtVideoPlayerWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plVideoPlayerHeight" runat="server" ControlName="txtVideoPlayerHeight">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtVideoPlayerHeight" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator10" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtVideoPlayerHeight"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secRelatedAudio" runat="server" Section="tblRelatedAudio" ResourceKey="secRelatedAudio"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblRelatedAudio" cellspacing="0" cellpadding="2" border="0" class="dnnFormItem" width="100%"
    runat="server">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowRelatedAudio" runat="server" ControlName="chkShowRelatedAudio">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowRelatedAudio" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plRelatedAudioPerRow" runat="server" ControlName="txtRelatedAudioPerRow">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRelatedAudioPerRow" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator6" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRelatedAudioPerRow"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secRelatedImage" runat="server" Section="tblRelatedImage" ResourceKey="secRelatedImage"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblRelatedImage" cellspacing="0" cellpadding="2" border="0" class="dnnFormItem" width="100%"
    runat="server">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowRelatedImage" runat="server" ControlName="chkShowRelatedImage">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowRelatedImage" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plRelatedImagePerRow" runat="server" ControlName="txtRelatedImagePerRow">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRelatedImagePerRow" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator7" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRelatedImagePerRow"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plRelatedImageWidth" runat="server" ControlName="txtRelatedImageWidth">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRelatedImageWidth" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator11" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRelatedImageWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plRelatedImageHeight" runat="server" ControlName="txtRelatedImageHeight">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRelatedImageHeight" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator16" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRelatedImageHeight"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="dnnPrimaryAction" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update"></asp:LinkButton>&nbsp;
    <asp:HyperLink runat="server" ID="hlCancel" ResourceKey="cmdCancel" CssClass="dnnSecondaryAction"
        NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
</p>
