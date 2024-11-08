<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AuctionVendorProfile.ascx.cs" Inherits="Cross.Modules.CP_Product.View.AuctionVendorProfile" %>
<%@ Register TagPrefix="Cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web.Deprecated" %>
<style type="text/css">
.CrossGrid th{
  text-align:center;
}
</style>
<table width="100%" cellpadding="0" cellspacing="0" id="tblVendorProfile" runat="server"
    class="dnnFormItem">
    <tr>
        <td colspan="2">
            <asp:Label ID="lblVendorProfile" runat="server" resourcekey="lblVendorProfile" CssClass="SubHead" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <!-- Creator -->
    <tr>
     
        <td colspan="2">
            <!-- user avatar-->

            <asp:Image ID="imgAuthorAvatar" runat="server" Width="48px"
                ImageUrl='<%#GetAuthorAvatar(objAuthor.UserId.ToString(),objAuthor.AvatarEmail) %>'
                ImageAlign="AbsMiddle"></asp:Image>
         
            <!-- user name-->
            <asp:HyperLink ID="hlUserName" runat="server" Text="<%#objAuthor.Username%>"
                Target="_blank" />
        </td>
    </tr>
    <!--    Company -->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowCompany && !string.IsNullOrEmpty(objAuthor.Company)%>">
        <td style="width: 150px">
            <asp:Label ID="Label5" runat="server" resourcekey="lblCompany"></asp:Label>
        </td>
        <td>
            <%#objAuthor.Company%>
        </td>
    </tr>
    <!--    country-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowCountry && !string.IsNullOrEmpty(objAuthor.Country)%>">
        <td style="width: 150px">
            <asp:Label ID="Label1" runat="server" resourcekey="lblLocationCountry"></asp:Label>
        </td>
        <td>
            <%#objAuthor.Country%>
        </td>
    </tr>
    <!--    State-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowState && !string.IsNullOrEmpty(objAuthor.State)%>">
        <td style="width: 150px">
            <asp:Label ID="Label2" runat="server" resourcekey="lblLocationState"></asp:Label>
        </td>
        <td>
            <%#objAuthor.State%>
        </td>
    </tr>
    <!--    City-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowCity && !string.IsNullOrEmpty(objAuthor.City)%>">
        <td style="width: 150px">
            <asp:Label ID="Label6" runat="server" resourcekey="lblLocationCity"></asp:Label>
        </td>
        <td>
            <%#objAuthor.City%>
        </td>
    </tr>

    <!--    Town-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowTown && !string.IsNullOrEmpty(objAuthor.Town)%>">
        <td style="width: 150px">
            <asp:Label ID="Label3" runat="server" resourcekey="lblLocationTown"></asp:Label>
        </td>
        <td>
            <%#objAuthor.Town%>
        </td>
    </tr>

    <!--    Tel-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowTel && !string.IsNullOrEmpty(objAuthor.Tel)%>">
        <td style="width: 150px">
            <asp:Label ID="Label4" runat="server" resourcekey="lblTel"></asp:Label>
        </td>
        <td>
            <%#objAuthor.Tel%>
        </td>
    </tr>

    <!--    Fax-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowFax && !string.IsNullOrEmpty(objAuthor.Fax)%>">
        <td style="width: 150px">
            <asp:Label ID="Label7" runat="server" resourcekey="lblFax"></asp:Label>
        </td>
        <td>
            <%#objAuthor.Fax%>
        </td>
    </tr>

    <!--    Zipcode-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowZipcode && !string.IsNullOrEmpty(objAuthor.Zipcode)%>">
        <td style="width: 150px">
            <asp:Label ID="Label8" runat="server" resourcekey="lblZipcode"></asp:Label>
        </td>
        <td>
            <%#objAuthor.Zipcode%>
        </td>
    </tr>
    <!--    IM-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowIM && !string.IsNullOrEmpty(objAuthor.IM)%>">
        <td style="width: 150px">
            <asp:Label ID="Label9" runat="server" resourcekey="lblIM"></asp:Label>
        </td>
        <td>
            <%#objAuthor.IM%>
        </td>
    </tr>
    <!--    Linkman-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowLinkman && !string.IsNullOrEmpty(objAuthor.Linkman)%>">
        <td style="width: 150px">
            <asp:Label ID="Label10" runat="server" resourcekey="lblLinkman"></asp:Label>
        </td>
        <td>
            <%#objAuthor.Linkman%>
        </td>
    </tr>
    <!--    Address-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowAddress && !string.IsNullOrEmpty(objAuthor.Address)%>">
        <td style="width: 150px">
            <asp:Label ID="Label11" runat="server" resourcekey="lblAddress"></asp:Label>
        </td>
        <td>
            <%#objAuthor.Address%>
        </td>
    </tr>
    <!--    BusinessScope-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowBusinessScope && !string.IsNullOrEmpty(objAuthor.BusinessScope)%>">
        <td style="width: 150px">
            <asp:Label ID="Label12" runat="server" resourcekey="lblBusinessScope"></asp:Label>
        </td>
        <td>
            <%#objAuthor.BusinessScope%>
        </td>
    </tr>
    <!--    SiteUrl-->
    <tr runat="server" visible='<%#Settings_VendorProfile.Profile.ShowSiteUrl 
            && !string.IsNullOrEmpty(objAuthor.SiteUrl) && objAuthor.SiteUrl.StartsWith("http")%>'>
        <td style="width: 150px">
            <asp:Label ID="Label13" runat="server" resourcekey="lblSiteUrl"></asp:Label>
        </td>
        <td>
            <asp:HyperLink ID="hlAuthorSiteUrl" runat="server" Text="<%#objAuthor.SiteUrl%>"
                NavigateUrl='<%#objAuthor.SiteUrl %>' Target="_blank" />
        </td>
    </tr>
    <!--    LogoUrl-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowLogoUrl && !string.IsNullOrEmpty(objAuthor.LogoUrl)%>">
        <td style="width: 150px">
            <asp:Label ID="Label14" runat="server" resourcekey="lblLogoUrl"></asp:Label>
        </td>
        <td>
            <asp:Image runat="server" ImageUrl='<%#objAuthor.LogoUrl%>'
                Height='40px' BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" />

        </td>
    </tr>
    <!--    Slogan-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowSlogan && !string.IsNullOrEmpty(objAuthor.Slogan)%>">
        <td style="width: 150px">
            <asp:Label ID="Label15" runat="server" resourcekey="lblSlogan"></asp:Label>
        </td>
        <td>
            <%#objAuthor.Slogan%>
        </td>
    </tr>
    <!--    extra vendor profile field1-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowField1 
                 && !string.IsNullOrEmpty(objAuthor.Field1) && Settings_Portal.VendorProfile.Field1Enable%>">
        <td style="width: 150px">
            <%#Settings_Portal.VendorProfile.Field1Title%>
        </td>
        <td>
            <%#objAuthor.Field1%>
        </td>
    </tr>
    <!--    extra vendor profile Field2-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowField2 
                 && !string.IsNullOrEmpty(objAuthor.Field2) && Settings_Portal.VendorProfile.Field2Enable%>">
        <td style="width: 150px">
            <%#Settings_Portal.VendorProfile.Field2Title%>
        </td>
        <td>
            <%#objAuthor.Field2%>
        </td>
    </tr>
    <!--    extra vendor profile Field3-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowField3 
                 && !string.IsNullOrEmpty(objAuthor.Field3) && Settings_Portal.VendorProfile.Field3Enable%>">
        <td style="width: 150px">
            <%#Settings_Portal.VendorProfile.Field3Title%>
        </td>
        <td>
            <%#objAuthor.Field3%>
        </td>
    </tr>
    <!--    extra vendor profile Field4-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowField4 
                 && !string.IsNullOrEmpty(objAuthor.Field4) && Settings_Portal.VendorProfile.Field4Enable%>">
        <td style="width: 150px">
            <%#Settings_Portal.VendorProfile.Field4Title%>
        </td>
        <td>
            <%#objAuthor.Field4%>
        </td>
    </tr>
    <!--    extra vendor profile Field5-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowField5 
                 && !string.IsNullOrEmpty(objAuthor.Field5) && Settings_Portal.VendorProfile.Field5Enable%>">
        <td style="width: 150px">
            <%#Settings_Portal.VendorProfile.Field5Title%>
        </td>
        <td>
            <%#objAuthor.Field5%>
        </td>
    </tr>
    <!--    extra vendor profile Field6-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowField6 
                 && !string.IsNullOrEmpty(objAuthor.Field6) && Settings_Portal.VendorProfile.Field6Enable%>">
        <td style="width: 150px">
            <%#Settings_Portal.VendorProfile.Field6Title%>
        </td>
        <td>
            <%#objAuthor.Field6%>
        </td>
    </tr>
    <!--    extra vendor profile Field7-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowField7 
                 && !string.IsNullOrEmpty(objAuthor.Field7) && Settings_Portal.VendorProfile.Field7Enable%>">
        <td style="width: 150px">
            <%#Settings_Portal.VendorProfile.Field7Title%>
        </td>
        <td>
            <%#objAuthor.Field7%>
        </td>
    </tr>
    <!--    extra vendor profile Field8-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowField8 
                 && !string.IsNullOrEmpty(objAuthor.Field8) && Settings_Portal.VendorProfile.Field8Enable%>">
        <td style="width: 150px">
            <%#Settings_Portal.VendorProfile.Field8Title%>
        </td>
        <td>
            <%#objAuthor.Field8%>
        </td>
    </tr>
    <!--    extra vendor profile Field9-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowField9 
                 && !string.IsNullOrEmpty(objAuthor.Field9) && Settings_Portal.VendorProfile.Field9Enable%>">
        <td style="width: 150px">
            <%#Settings_Portal.VendorProfile.Field9Title%>
        </td>
        <td>
            <%#objAuthor.Field9%>
        </td>
    </tr>
    <!--    extra vendor profile Field10-->
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowField10 
                 && !string.IsNullOrEmpty(objAuthor.Field10) && Settings_Portal.VendorProfile.Field10Enable%>">
        <td style="width: 150px">
            <%#Settings_Portal.VendorProfile.Field10Title%>
        </td>
        <td>
            <%#objAuthor.Field10%>
        </td>
    </tr>
    <tr runat="server" visible="<%#Settings_VendorProfile.Profile.ShowBiography  && !string.IsNullOrEmpty(objAuthor.Biography)%>">
        <td colspan="2">
            <br />
            <%#Server.HtmlDecode(objAuthor.Biography)%>
        </td>
    </tr>
</table>
<table width="100%" cellpadding="0" cellspacing="0" id="tblVendorProductTip"
    class="dnnFormItem">
    <tr>
        <td>
            <asp:Label ID="lblVendorProduct" runat="server" resourcekey="lblVendorProduct" CssClass="SubHead" />
        </td>
    </tr>
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
</table>
    <!-- Basic Search table -->
<table width="100%" cellpadding="0" cellspacing="0" id="tblBasicSearch" runat="server"
    class="dnnFormItem" visible="false">
    <tr>
        <td>
          &nbsp; &nbsp;
            <asp:Label ID="lblSearchPrefix" runat="server" resourcekey="lblSearchPrefix" />
            <asp:TextBox ID="txtSearch" runat="server"   Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Basic.TitleInputWidth)%>'
                />&nbsp;
             <asp:Label ID="lblSortBy" runat="server" resourcekey="lblSortBy" visible='<%# Settings_VendorProfile.Product_Search_Basic.ShowSortInSearch %>'/>
            <asp:DropDownList ID="ddlSortField" runat="server" Width="200px" visible='<%# Settings_VendorProfile.Product_Search_Basic.ShowSortInSearch %>'>
                <asp:ListItem Value="NameDesc" resourcekey="li_SortField_NameDesc" />
                <asp:ListItem Value="NameAsc" resourcekey="li_SortField_NameAsc" />
              
                <asp:ListItem Value="StartPriceDesc" resourcekey="li_SortField_StartPriceDesc" />
                <asp:ListItem Value="StartPriceAsc" resourcekey="li_SortField_StartPriceAsc" />
                <asp:ListItem Value="CreationDateDesc" Selected="True" resourcekey="li_SortField_CreationDateDesc" />
                <asp:ListItem Value="CreationDateAsc" resourcekey="li_SortField_CreationDateAsc" />
                <asp:ListItem Value="PublishDateDesc" resourcekey="li_SortField_PublishDateDesc" />
                <asp:ListItem Value="PublishDateAsc" resourcekey="li_SortField_PublishDateAsc" />
                <asp:ListItem Value="LastModifiedDateDesc" resourcekey="li_SortField_LastModifiedDateDesc" />
                <asp:ListItem Value="LastModifiedDateAsc" resourcekey="li_SortField_LastModifiedDateAsc" />
                <asp:ListItem Value="ViewsDesc" resourcekey="li_SortField_ViewsDesc" />
                <asp:ListItem Value="ViewsAsc" resourcekey="li_SortField_ViewsAsc" />
                
                
            </asp:DropDownList>
             <asp:Label ID="lblPage" runat="server" resourcekey="lblPage" visible='<%# Settings_VendorProfile.Product_Search_Basic.ShowPageInSearch %>'/>
            <asp:DropDownList ID="ddlPage" runat="server" Width="60px" visible='<%# Settings_VendorProfile.Product_Search_Basic.ShowPageInSearch %>'/>

            <asp:Button ID="btnSearch" runat="server" resourcekey="btnSearch" CssClass="CommandButton"
                OnClick="btnSearch_Click" />&nbsp; &nbsp;
            <asp:Button ID="btnClear" runat="server" resourcekey="btnClear" CssClass="CommandButton"
                CausesValidation="False" OnClick="btnClear_Click" />
             </td>
    </tr>
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
</table>
<!-- Advanced search condition -->
<asp:Table ID="tblAdvancedSearchCondition" runat="server" Width="100%" CssClass="dnnFormItem"
     Visible="false">
    <asp:TableRow ID="trBuiltInField_Title" runat="server" Visible='<%#Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Title %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Label) + Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Title" runat="server" resourcekey="lblBuiltInField_Title"></asp:Label>
            <asp:DropDownList ID="ddlOper_Title" runat="server" Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="like" resourcekey="li_Oper_like" />
                <asp:ListItem Value="unlike" resourcekey="li_Oper_unlike" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtBuiltInField_Title" runat="server" Width="<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Input)%>"></asp:TextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_Sku" runat="server" Visible='<%#Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Sku %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Label) + Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Sku" runat="server" resourcekey="lblBuiltInField_Sku"></asp:Label>
            <asp:DropDownList ID="ddlOper_Sku" runat="server" Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="like" resourcekey="li_Oper_like" />
                <asp:ListItem Value="unlike" resourcekey="li_Oper_unlike" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtBuiltInField_Sku" runat="server" Width="<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Input)%>"></asp:TextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_Price" runat="server" Visible='<%#Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Price %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Label) + Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Price" runat="server" resourcekey="lblBuiltInField_Price"></asp:Label>
            <asp:DropDownList ID="ddlOper_Price" runat="server" Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator)%>' 
            AutoPostBack="True" OnSelectedIndexChanged="ddlOper_Price_SelectedIndexChanged">
                <asp:ListItem Value="between" resourcekey="li_Oper_between" />
                <asp:ListItem Value="lessthan" resourcekey="li_Oper_lessthan" />
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="greaterthan" resourcekey="li_Oper_greaterthan" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtBuiltInField_Price" runat="server" Width="100px" Visible="false"></asp:TextBox>
            <asp:TextBox ID="txtBuiltInField_Price_From" runat="server" Width="80px" Visible="false"></asp:TextBox>
            <asp:Label ID="lblBuiltInField_And" runat="server" resourcekey="lblBuiltInField_And" Visible="false"></asp:Label>
            <asp:TextBox ID="txtBuiltInField_Price_To" runat="server" Width="80px" Visible="false"></asp:TextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_Category" runat="server" Visible='<%#Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Category %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Label) + Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Category" runat="server" resourcekey="lblBuiltInField_Category"></asp:Label>
            <asp:DropDownList ID="ddlOper_Category" runat="server" Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_Category" runat="server" DataTextField="Name"
                DataValueField="Id" Width="<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Input)%>">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
    
    <asp:TableRow ID="trBuiltInField_CreatedDate" runat="server" Visible='<%#Settings_VendorProfile.Product_Search_Advanced.BuiltInField_CreatedDate %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Label) + Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_CreatedDate" runat="server" resourcekey="lblBuiltInField_CreatedDate"></asp:Label>
            <asp:DropDownList ID="ddlOper_CreatedDate" runat="server" Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="lessthan" resourcekey="li_Oper_lessthan" />
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="greaterthan" resourcekey="li_Oper_greaterthan" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <dnn:DnnDatePicker ID="ddpCreatedDate" runat="server" Width="<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Input)%>" />
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_PublishDate" runat="server" Visible='<%#Settings_VendorProfile.Product_Search_Advanced.BuiltInField_PublishDate %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Label) + Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_PublishDate" runat="server" resourcekey="lblBuiltInField_PublishDate"></asp:Label>
            <asp:DropDownList ID="ddlOper_PublishDate" runat="server" Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="lessthan" resourcekey="li_Oper_lessthan" />
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="greaterthan" resourcekey="li_Oper_greaterthan" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <dnn:DnnDatePicker ID="ddpPublishDate" runat="server" Width="<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Input)%>" />
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_ExpireDate" runat="server" Visible='<%#Settings_VendorProfile.Product_Search_Advanced.BuiltInField_ExpireDate %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Label) + Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_ExpireDate" runat="server" resourcekey="lblBuiltInField_ExpireDate"></asp:Label>
            <asp:DropDownList ID="ddlOper_ExpireDate" runat="server" Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="lessthan" resourcekey="li_Oper_lessthan" />
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="greaterthan" resourcekey="li_Oper_greaterthan" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <dnn:DnnDatePicker ID="ddpExpireDate" runat="server" Width="<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Input)%>" />
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_Views" runat="server" Visible='<%#Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Views %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Label) + Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Views" runat="server" resourcekey="lblBuiltInField_Views"></asp:Label>
            <asp:DropDownList ID="ddlOper_Views" runat="server" Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="greaterthan" resourcekey="li_Oper_greaterthan" />
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="lessthan" resourcekey="li_Oper_lessthan" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtBuiltInField_Views" runat="server" Width="<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Input)%>"
                Text="0"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator7" resourcekey="MustBeInteger"
                ForeColor="Red" runat="server" ValidationExpression="\d*" ControlToValidate="txtBuiltInField_Views"></asp:RegularExpressionValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_RatingAverage" runat="server" Visible='<%#Settings_VendorProfile.Product_Search_Advanced.BuiltInField_RatingAverage %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Label) + Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_RatingAverage" runat="server" resourcekey="lblBuiltInField_RatingAverage"></asp:Label>
            <asp:DropDownList ID="ddlOper_RatingAverage" runat="server" Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="greaterthan" resourcekey="li_Oper_greaterthan" />
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="lessthan" resourcekey="li_Oper_lessthan" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_RatingAverage" runat="server" Width="<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Input)%>">
                <asp:ListItem Value="-1" resourcekey="None_Specified" />
                <asp:ListItem Value="1" />
                <asp:ListItem Value="2" />
                <asp:ListItem Value="3" />
                <asp:ListItem Value="4" />
                <asp:ListItem Value="5" />
                <asp:ListItem Value="6" />
                <asp:ListItem Value="7" />
                <asp:ListItem Value="8" />
                <asp:ListItem Value="9" />
                <asp:ListItem Value="10" />
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
      <asp:TableRow ID="trBuiltInField_Country" runat="server"  Visible="false">
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Label) + Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Country" runat="server" resourcekey="lblCountry"></asp:Label>
            <asp:DropDownList ID="ddlOper_Country" runat="server" Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_Country" runat="server" DataTextField="Name" AutoPostBack="True" OnSelectedIndexChanged="ddlBuiltInField_Country_SelectedIndexChanged"
                DataValueField="Id" Width="<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Input)%>">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_State" runat="server" Visible="false">
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Label) + Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_State" runat="server" resourcekey="lblState"></asp:Label>
            <asp:DropDownList ID="ddlOper_State" runat="server" Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_State" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="ddlBuiltInField_State_SelectedIndexChanged"
                 Width="<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Input)%>">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_City" runat="server" Visible="false">
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Label) + Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_City" runat="server" resourcekey="lblCity"></asp:Label>
            <asp:DropDownList ID="ddlOper_City" runat="server" Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_City" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBuiltInField_City_SelectedIndexChanged"
                 Width="<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Input)%>">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_Town" runat="server" Visible="false">
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Label) + Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Town" runat="server" resourcekey="lblTown"></asp:Label>
            <asp:DropDownList ID="ddlOper_Town" runat="server" Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_Town" runat="server" 
                 Width="<%#Convert.ToInt32(Settings_VendorProfile.Product_Search_Advanced.Width_Input)%>">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<!-- Advanced search button -->
<table width="100%" cellpadding="0" cellspacing="0" id="tblAdvancedSearchButton"
     runat="server" class="dnnFormItem" visible="false">
    <tr>
        <td>
            <asp:Label ID="lblBuiltInField_Sort" runat="server" resourcekey="lblBuiltInField_Sort"
                Visible='<%# Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Sort %>'></asp:Label>
            <asp:DropDownList ID="ddlBuiltInField_Sort" runat="server" Width="200px" Visible='<%# Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Sort %>'>
                 <asp:ListItem Value="NameDesc" resourcekey="li_SortField_NameDesc" />
                <asp:ListItem Value="NameAsc" resourcekey="li_SortField_NameAsc" />
             
                <asp:ListItem Value="StartPriceDesc" resourcekey="li_SortField_StartPriceDesc" />
                <asp:ListItem Value="StartPriceAsc" resourcekey="li_SortField_StartPriceAsc" />
                <asp:ListItem Value="CreationDateDesc" Selected="True" resourcekey="li_SortField_CreationDateDesc" />
                <asp:ListItem Value="CreationDateAsc" resourcekey="li_SortField_CreationDateAsc" />
                <asp:ListItem Value="PublishDateDesc" resourcekey="li_SortField_PublishDateDesc" />
                <asp:ListItem Value="PublishDateAsc" resourcekey="li_SortField_PublishDateAsc" />
                <asp:ListItem Value="LastModifiedDateDesc" resourcekey="li_SortField_LastModifiedDateDesc" />
                <asp:ListItem Value="LastModifiedDateAsc" resourcekey="li_SortField_LastModifiedDateAsc" />
                <asp:ListItem Value="ViewsDesc" resourcekey="li_SortField_ViewsDesc" />
                <asp:ListItem Value="ViewsAsc" resourcekey="li_SortField_ViewsAsc" />
            </asp:DropDownList>
            <asp:Label ID="lblBuiltInField_Paging" runat="server" resourcekey="lblBuiltInField_Paging"
                Visible='<%#Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Paging %>'></asp:Label>
            <asp:DropDownList ID="ddlBuiltInField_Paging" runat="server" Width="80px" Visible='<%#Settings_VendorProfile.Product_Search_Advanced.BuiltInField_Paging %>' />
            <asp:Button ID="btnAdvancedSearch" runat="server" CssClass="dnnPrimaryAction" Width="60px"
                CausesValidation="false" ResourceKey="btnSearch" OnClick="btnAdvancedSearch_Click" />
            &nbsp; &nbsp;
            <asp:Button ID="btnAdvancedClear" runat="server" resourcekey="btnClear" CssClass="dnnSecondaryAction"
                CausesValidation="False" OnClick="btnAdvancedClear_Click" />
        </td>
    </tr>
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
</table>

<!-- data list and data grid -->
<table width="100%" cellpadding="0" cellspacing="0" class="Normal">
    <tr valign="top">
        <td valign="top" align="left" >
         
            <asp:DataList ID="dlProduct" runat="server" CssClass="Normal" RepeatColumns="<%#Settings_VendorProfile.Product_Paging.ColCount %>"
                RepeatDirection="Horizontal" RepeatLayout="table" Width="100%" Visible="false"
                OnItemDataBound="dlProduct_ItemDataBound" OnItemCommand="dlProduct_ItemCommand">
                <ItemTemplate>
                 <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false"/>
                    <table width="100%" border="0" cellpadding="0" cellspacing="1">
                        <tr align="left">
                            <td align="left">
                              <%if (Settings_VendorProfile.Product_Image.ShowImage)
                                      { %>
                                <asp:HyperLink ID="hlImage" runat="server" 
                                    NavigateUrl='<%# GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name")))%>'
                                    Target="<%#Settings_VendorProfile.General.LinkTarget%>"  Title='<%#Convert.ToString(Eval("Name"))%>'>
                                    <%if (Settings_VendorProfile.Product_Image.ForceImageWidth && Settings_VendorProfile.Product_Image.ForceImageHeight)
                                      { %>
                                    <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Image.ImageWidth)%>'
                                        Height='<%#Convert.ToInt32(Settings_VendorProfile.Product_Image.ImageHeight)%>' 
                                        BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='imgProduct' ImageAlign="Left" />
                                    <%}
                                      else if (Settings_VendorProfile.Product_Image.ForceImageWidth)
                                      {%>
                                    <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Image.ImageWidth)%>'
                                        BorderStyle="Solid" BorderWidth="1"
                                        BorderColor="DarkGray" ID='Image1' ImageAlign="Left" />
                                    <%}
                                      else if (Settings_VendorProfile.Product_Image.ForceImageHeight)
                                      {%>
                                    <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Height='<%#Convert.ToInt32(Settings_VendorProfile.Product_Image.ImageHeight)%>'
                                        BorderStyle="Solid" BorderWidth="1"
                                        BorderColor="DarkGray" ID='Image2' ImageAlign="Left" />
                                    <% }
                                      else
                                      {%>
                                    <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' 
                                        BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image3' ImageAlign="Left" />
                                    <%} %>
                                </asp:HyperLink>
                                 <%} %>
                               
                            </td>
                            </tr>
                            <tr>
                         <td align="left" valign="top">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
                                 <%if (Settings_VendorProfile.Product_Content.ShowName)
                                      { %>
                                    <tr>
                                        <td>
                                       
                                            <asp:HyperLink ID="hlName" runat="server"
                                                Text='<%# Server.HtmlDecode(Convert.ToString(Eval("Name"))) %>' 
                                                NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name"))) %>'
                                                 Target="<%#Settings_VendorProfile.General.LinkTarget%>" />
                                        </td>
                                    </tr>
                                      <%} %>

                                   

                                     <%if (Settings_VendorProfile.Product_Content.ShowRating)
                                      { %>
                                    <tr>
                                        <td>
                                        <asp:Label ID="lblVendorRating" runat="server" resourcekey="lblVendorRating" />&nbsp;
                                            <asp:Image ID="imgRating" runat="server"
                                                ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>' />
                                        </td>
                                    </tr>
                                     <%} %>

                                       <%if (Settings_VendorProfile.Product_Content.ShowViews)
                                      { %>
                                   <tr>
                                        <td>
                                            <asp:Label ID="lblViews" runat="server" resourcekey="lblViews" />&nbsp;
                                            <asp:Label ID="lblViewsData" runat="server" Text='<%# Eval("Views") %>'/>
                                        </td>
                                    </tr>
                                      <%} %>

                                              <%if (Settings_VendorProfile.Product_Content.ShowLocation_Country && CurrentType.AllowLocation)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCountry" runat="server" resourcekey="lblCountry" />
                                            <asp:Label ID="lblCountryData" runat="server" Text='<%#Eval("Country") %>' />
                                        </td>
                                    </tr>
                                       <%} %>

                                      <%if (Settings_VendorProfile.Product_Content.ShowLocation_State && CurrentType.AllowLocation)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblState" runat="server" resourcekey="lblState" />
                                            <asp:Label ID="lblStateData" runat="server" Text='<%#Eval("State") %>' />
                                        </td>
                                    </tr>
                                       <%} %>

                                             <%if (Settings_VendorProfile.Product_Content.ShowLocation_City && CurrentType.AllowLocation)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCity" runat="server" resourcekey="lblCity" />
                                            <asp:Label ID="lblCityData" runat="server" Text='<%#Eval("City") %>' />
                                        </td>
                                    </tr>
                                       <%} %>

                                           <%if (Settings_VendorProfile.Product_Content.ShowLocation_Town && CurrentType.AllowLocation)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblTown" runat="server" resourcekey="lblTown" />
                                            <asp:Label ID="lblTownData" runat="server" Text='<%#Eval("Town") %>' />   
                                        </td>
                                    </tr>
                                       <%} %>


                                         <%if (Settings_VendorProfile.Product_Content.ShowSku && CurrentType.FieldEnable_Sku)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblSku" runat="server" resourcekey="lblSku" />&nbsp;
                                            <asp:Label ID="lblSkuData" runat="server" Text='<%#Eval("Sku") %>' />
                                                
                                        </td>
                                    </tr>
                                       <%} %>

                                    <%if (Settings_VendorProfile.Product_Content.ShowWeight && CurrentType.FieldEnable_Weight)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblWeight" runat="server" resourcekey="lblWeight" />&nbsp;
                                            <asp:Label ID="lblWeightData" runat="server" Text='<%#Eval("Weight") %>' />
                                        </td>
                                    </tr>
                                    <%} %>
                                       <%if (Settings_VendorProfile.Product_Content.ShowStartPrice)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblStartPrice" runat="server" resourcekey="lblStartPrice" />&nbsp;
                                            <asp:Label ID="lblStartPriceData" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("StartPrice")) %>' />
                                        </td>
                                    </tr>
                                    <%} %>

                                        <%if (Settings_VendorProfile.Product_Content.ShowBuyNowPrice && !IsSecondItemAuction)
                                             
                                      { %>
                                   <tr>
                                        <td>
                                            <asp:Label ID="lblBuyNowPrice" runat="server" resourcekey="lblBuyNowPrice" />&nbsp;
                                            <asp:Label ID="lblBuyNowPriceData" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("BuyNowPrice")) %>'
                                                 />
                                        </td>
                                    </tr>
                                     <%} %>


                                       <%if (Settings_VendorProfile.Product_Content.ShowCurrentBid && IsEnglishAuction)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCurrentBid" runat="server" resourcekey="lblCurrentBid" />&nbsp;
                                            <asp:Label ID="lblCurrentBidData" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol + GetCurrentBid(Convert.ToString(Eval("Id"))) %>'
                                                 />
                                        </td>
                                    </tr>
                                      <%} %>

                                     <%if (Settings_VendorProfile.Product_Content.ShowCurrentBidder && IsEnglishAuction)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCurrentBidder" runat="server" resourcekey="lblCurrentBidder" />&nbsp;
                                            <asp:Label ID="lblCurrentBidderData" runat="server" Text='<%#GetCurrentBidder(Convert.ToString(Eval("Id")))%>' />
                                        </td>
                                    </tr>
                                    <%} %>

                                        <%if (Settings_VendorProfile.Product_Content.ShowBidCount)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblBidCount" runat="server" resourcekey="lblBidCount" />&nbsp;
                                            <asp:Label ID="lblBidCountData" runat="server" Text='<%#GetBidCount(Convert.ToString(Eval("Id"))) %>' />
                                        </td>
                                    </tr>
                                    <%} %>

                                     <%if (Settings_VendorProfile.Product_Content.ShowPublishDate)
                                      { %>
                                       <tr>
                                        <td>
                                            <asp:Label ID="lblPublishDate" runat="server" resourcekey="lblPublishDate"/>&nbsp;
                                            <asp:Label ID="lblPublishDateData" runat="server" Text='<%#Eval("PublishDate")%>'/>
                                        </td>
                                    </tr>
                                     <%} %>

                                         <%if (Settings_VendorProfile.Product_Content.ShowExpireDate)
                                      { %>
                                       <tr>
                                        <td>
                                            <asp:Label ID="lblExpireDate" runat="server" resourcekey="lblExpireDate"/>&nbsp;
                                            <asp:Label ID="lblExpireDateData" runat="server" Text='<%#Eval("ExpireDate")%>'/>
                                        </td>
                                    </tr>
                                     <%} %>

                                    <%if (Settings_VendorProfile.Product_Content.ShowRemainTime)
                                      { %>
                                       <tr>
                                        <td>
                                            <asp:Label ID="lblRemainTime" runat="server" resourcekey="lblRemainTime"/>&nbsp;
                                            <asp:Label ID="lblRemainTimeData" runat="server" Text='<%# GetRemainTime(Convert.ToString(Eval("Id"))) %>'/>
                                        </td>
                                    </tr>
                                     <%} %>
                                  
                                   <%if (Settings_VendorProfile.Product_Content.ShowFeaturedField)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblFeatured" runat="server" resourcekey="lblFeatured"/>&nbsp;
                                            <asp:CheckBox ID="chkFeatured" runat="server" Checked='<%# Convert.ToBoolean(Eval("Featured")) %>'
                                                />
                                        </td>
                                    </tr>
                                     <%} %>

                                    <%if (Settings_VendorProfile.Product_Content.ShowSummary && CurrentType.FieldEnable_Summary)
                                      { %>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<asp:Label ID="SummaryLabel" runat="server" Text='<%# GetShortenSummary(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Summary"))) %>' />
                                        </td>
                                    </tr>
                                    <%} %>
                                    
                                    <tr>
                                        <td>
                                            <table runat="server" id="tblUserDefinedField" width="100%" border="0" cellspacing="0"
                                                cellpadding="0" class="Normal" align="left">
                                            </table>
                                        </td>
                                    </tr>
                                    <%if (Settings_VendorProfile.Product_Content.ShowBidButton)
                                      { %>
                                      <tr>
                                        <td>
                                            <dnn:CommandButton ID="btnBidNow" runat="server" ImageUrl="~/desktopmodules/crossclassified/images/Auction16.png"
                                                CommandName="BidNow" CommandArgument='<%# Eval("Id")%>' CausesValidation="false"
                                                Text='<%#Localization.GetString("btnBidNow", LocalResourceFile)%>' />
                                        </td>
                                    </tr>
                                     <%} %>
                              </table>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:GridView ID="grProduct" runat="server" AutoGenerateColumns="False" Visible="False" Width="100%"
                CssClass="Normal" CellPadding="1"  CellSpacing="1"  GridLines="Both" BackColor="Gray" AllowSorting="True" ForeColor="#333333" 
                DataKeyNames="Id" OnDataBinding="grProduct_DataBinding" OnRowCommand="grProduct_RowCommand">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlImage" runat="server" 
                                NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name"))) %>'
                                Target="<%#Settings_VendorProfile.General.LinkTarget%>"  Title='<%#Convert.ToString(Eval("Name")) %>'>
                                <%if (Settings_VendorProfile.Product_Image.ForceImageWidth && Settings_VendorProfile.Product_Image.ForceImageHeight)
                                  { %>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Image.ImageWidth)%>'
                                    Height='<%#Convert.ToInt32(Settings_VendorProfile.Product_Image.ImageHeight)%>' 
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='imgProduct' ImageAlign="AbsMiddle" />
                                <%}
                                  else if (Settings_VendorProfile.Product_Image.ForceImageWidth)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_VendorProfile.Product_Image.ImageWidth)%>'
                                     BorderStyle="Solid" BorderWidth="1"
                                    BorderColor="DarkGray" ID='Image1' ImageAlign="AbsMiddle" />
                                <%}
                                  else if (Settings_VendorProfile.Product_Image.ForceImageHeight)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Height='<%#Convert.ToInt32(Settings_VendorProfile.Product_Image.ImageHeight)%>'
                                     BorderStyle="Solid" BorderWidth="1"
                                    BorderColor="DarkGray" ID='Image2' ImageAlign="AbsMiddle" />
                                <% }
                                  else
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' 
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image3' ImageAlign="AbsMiddle" />
                                <%} %>
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  >
                        <HeaderTemplate>
                            <asp:Label ID="lblName" resourcekey="lblProductNameHead" runat="server" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlName" runat="server" Text='<%# Server.HtmlDecode(Convert.ToString(Eval("Name"))) %>'
                                NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name"))) %>'
                                Target="<%#Settings_VendorProfile.General.LinkTarget%>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                 
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblRating" resourcekey="lblVendorRatingHead" runat="server" Visible="<%#Settings_VendorProfile.Product_Content.ShowRating %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Image ID="imgRating" runat="server" Visible="<%#Settings_VendorProfile.Product_Content.ShowRating %>"
                                ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblViews" resourcekey="lblViewsHead" runat="server" Visible="<%#Settings_VendorProfile.Product_Content.ShowViews %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ViewsLabel" runat="server" Text='<%# Eval("Views") %>' Visible="<%#Settings_VendorProfile.Product_Content.ShowViews %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblCountry" resourcekey="lblCountryHead" runat="server" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CountryData" runat="server" Text='<%# Eval("Country") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblState" resourcekey="lblStateHead" runat="server" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="StateData" runat="server" Text='<%# Eval("State") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblCity" resourcekey="lblCityHead" runat="server" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CityData" runat="server" Text='<%# Eval("City") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblTown" resourcekey="lblTownHead" runat="server" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="TownData" runat="server" Text='<%# Eval("Town") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblSku" resourcekey="lblSkuHead" runat="server" Visible="<%#Settings_VendorProfile.Product_Content.ShowSku %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="SkuLabel" runat="server" Text='<%# Eval("Sku") %>' Visible="<%#Settings_VendorProfile.Product_Content.ShowSku %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblWeight" resourcekey="lblWeightHead" runat="server" Visible="<%#Settings_VendorProfile.Product_Content.ShowWeight %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="WeightLabel" runat="server" Text='<%# Eval("Weight") %>' Visible="<%#Settings_VendorProfile.Product_Content.ShowWeight %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblStartPrice" resourcekey="lblStartPriceHead" runat="server" Visible="<%#Settings_VendorProfile.Product_Content.ShowStartPrice %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblStartPriceData" runat="server" Text='<%# Eval("StartPrice") %>' Visible="<%#Settings_VendorProfile.Product_Content.ShowStartPrice %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblBuyNowPrice" resourcekey="lblBuyNowPriceHead" runat="server" Visible="<%#Settings_VendorProfile.Product_Content.ShowBuyNowPrice %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBuyNowPriceData" runat="server" Text='<%# Eval("BuyNowPrice") %>' Visible="<%#Settings_VendorProfile.Product_Content.ShowBuyNowPrice %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblCurrentBid" resourcekey="lblCurrentBidHead" runat="server" Visible="<%#Settings_VendorProfile.Product_Content.ShowCurrentBid %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCurrentBidData" runat="server" Text='<%# GetCurrentBid(Convert.ToString(Eval("Id"))) %>' Visible="<%#Settings_VendorProfile.Product_Content.ShowCurrentBid %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblCurrentBidder" resourcekey="lblCurrentBidderHead" runat="server" Visible="<%#Settings_VendorProfile.Product_Content.ShowCurrentBidder %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCurrentBidderData" runat="server" Text='<%# GetCurrentBidder(Convert.ToString(Eval("Id"))) %>' Visible="<%#Settings_VendorProfile.Product_Content.ShowCurrentBidder %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblBidCount" resourcekey="lblBidCountHead" runat="server" Visible="<%#Settings_VendorProfile.Product_Content.ShowBidCount %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBidCountData" runat="server" Text='<%#GetBidCount(Convert.ToString(Eval("Id"))) %>' Visible="<%#Settings_VendorProfile.Product_Content.ShowBidCount %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblPublishDate" resourcekey="lblPublishDateHead" runat="server" Visible="<%#Settings_VendorProfile.Product_Content.ShowPublishDate %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPublishDateData" runat="server" Text='<%# Eval("PublishDate") %>' Visible="<%#Settings_VendorProfile.Product_Content.ShowPublishDate %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblExpireDate" resourcekey="lblExpireDateHead" runat="server" Visible="<%#Settings_VendorProfile.Product_Content.ShowExpireDate %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblExpireDateData" runat="server" Text='<%# Eval("ExpireDate") %>' Visible="<%#Settings_VendorProfile.Product_Content.ShowExpireDate %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblRemainTime" resourcekey="lblRemainTimeHead" runat="server" Visible="<%#Settings_VendorProfile.Product_Content.ShowRemainTime %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRemainTimeData" runat="server" Text='<%# GetRemainTime(Convert.ToString(Eval("Id"))) %>' Visible="<%#Settings_VendorProfile.Product_Content.ShowRemainTime %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblFeatured" resourcekey="lblFeatured1" runat="server" Visible="<%#Settings_VendorProfile.Product_Content.ShowFeaturedField %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkFeatured" runat="server" Checked='<%#Convert.ToBoolean(Eval("Featured")) %>'
                                Visible="<%#Settings_VendorProfile.Product_Content.ShowFeaturedField %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField >
                        <HeaderTemplate>
                            <asp:Label ID="lblSummaryHead" resourcekey="lblSummaryHead" runat="server" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            &nbsp;&nbsp;<asp:Label ID="SummaryLabel" runat="server" Text='<%# GetShortenSummary(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Summary")))%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" resourcekey="lblAction" runat="server" />
                        </HeaderTemplate>
                        <ItemTemplate>
                             <dnn:CommandButton ID="btnBidNow" runat="server" ImageUrl="~/desktopmodules/crossclassified/images/Auction16.png"
                                                CommandName="BidNow" CommandArgument='<%# Eval("Id")%>' CausesValidation="false"
                                                Text='<%#Localization.GetString("btnBidNow", LocalResourceFile)%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" HorizontalAlign="Left"/>
                <EditRowStyle BackColor="#999999" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="CrossGrid"/>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
         
        </td>
    </tr>
    <tr>
        <td align="right" colspan="2">
            <asp:HyperLink ID="hlRss" Visible="<%#Settings_VendorProfile.Product_Rss.DisplayRss %>" runat="server"
                ImageUrl="~/DesktopModules/CrossClassified/Images/feed-icon-12x12.gif" CssClass="NormalBold"
                Target="_blank"></asp:HyperLink>
        </td>
    </tr>
</table>
<table width="100%" cellpadding="1" cellspacing="1" runat="server" id="tblPaging"
    visible="false">
    <tr valign="top">
        <td width="100%">
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr valign="top">
        <td>
            <Cross:PagingControl ID="ctlPagingControl" runat="server" OnPageChanged="ctlPagingControl_PageChanged"
                Mode="PostBack"></Cross:PagingControl>
        </td>
    </tr>
</table>
