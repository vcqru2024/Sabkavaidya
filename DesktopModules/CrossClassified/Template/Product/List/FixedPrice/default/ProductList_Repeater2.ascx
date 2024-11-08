<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductList_Repeater.ascx.cs" Inherits="Cross.Modules.CP_Product.View.ProductList_Repeater" %>
<%@ Register TagPrefix="Cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web.Deprecated" %>
<style type="text/css">
.CrossGrid th{
  text-align:center;
}
</style>
<asp:Label ID="lblAddSuccess" runat="server" resourcekey="lblAddSuccess" ForeColor="Green"
    Visible="false"></asp:Label>
<asp:Label ID="lblAlreadyInRole" runat="server" resourcekey="lblAlreadyInRole" CssClass="NormalRed"
    Visible="false"></asp:Label>
<asp:Label ID="lblSiteAdministrator" runat="server" resourcekey="lblSiteAdministrator"
    CssClass="NormalRed" Visible="false"></asp:Label>
<asp:Label ID="lblHaveSubscriber" runat="server" resourcekey="lblHaveSubscriber"
    CssClass="NormalRed" Visible="false"></asp:Label>
<asp:Label ID="lblHaveItem" runat="server" resourcekey="lblHaveItem" CssClass="NormalRed"
    Visible="false"></asp:Label>
<asp:Label ID="lblInvalidQuantity" runat="server" resourcekey="lblInvalidQuantity"
    CssClass="NormalRed" Visible="false"></asp:Label>
    <!-- Basic Search table -->
<table width="100%" cellpadding="0" cellspacing="0" id="tblBasicSearch" runat="server"
    class="dnnFormItem" visible="false">
    <tr>
        <td>
          &nbsp; &nbsp;
            <asp:Label ID="lblSearchPrefix" runat="server" resourcekey="lblSearchPrefix" />
            <asp:TextBox ID="txtSearch" runat="server" Width='<%#Convert.ToInt32(Settings_List.Search_Basic.TitleInputWidth)%>'
                 />&nbsp;
             <asp:Label ID="lblSortBy" runat="server" resourcekey="lblSortBy" visible='<%# Settings_List.Search_Basic.ShowSortInSearch %>'/>
            <asp:DropDownList ID="ddlSortField" runat="server" Width="200px" visible='<%# Settings_List.Search_Basic.ShowSortInSearch %>'>
                <asp:ListItem Value="NameDesc" resourcekey="li_SortField_NameDesc" />
                <asp:ListItem Value="NameAsc" resourcekey="li_SortField_NameAsc" />
                <asp:ListItem Value="PurchasePriceDesc" resourcekey="li_SortField_PurchasePriceDesc" />
                <asp:ListItem Value="PurchasePriceAsc" resourcekey="li_SortField_PurchasePriceAsc" />
                <asp:ListItem Value="CreationDateDesc" resourcekey="li_SortField_CreationDateDesc" />
                <asp:ListItem Value="CreationDateAsc" resourcekey="li_SortField_CreationDateAsc" />
                <asp:ListItem Value="PublishDateDesc" resourcekey="li_SortField_PublishDateDesc" />
                <asp:ListItem Value="PublishDateAsc" resourcekey="li_SortField_PublishDateAsc" />
                <asp:ListItem Value="LastModifiedDateDesc" resourcekey="li_SortField_LastModifiedDateDesc" />
                <asp:ListItem Value="LastModifiedDateAsc" resourcekey="li_SortField_LastModifiedDateAsc" />
                <asp:ListItem Value="ViewsDesc" resourcekey="li_SortField_ViewsDesc" />
                <asp:ListItem Value="ViewsAsc" resourcekey="li_SortField_ViewsAsc" />
                
            </asp:DropDownList>
             <asp:Label ID="lblPage" runat="server" resourcekey="lblPage" visible='<%# Settings_List.Search_Basic.ShowPageInSearch %>'/>
            <asp:DropDownList ID="ddlPage" runat="server" Width="60px" visible='<%# Settings_List.Search_Basic.ShowPageInSearch %>'/>

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
    <asp:TableRow ID="trBuiltInField_Title" runat="server" Visible='<%#Settings_List.Search_Advanced.BuiltInField_Title %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_List.Search_Advanced.Width_Label) + Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Title" runat="server" resourcekey="lblBuiltInField_Title"></asp:Label>
            <asp:DropDownList ID="ddlOper_Title" runat="server" Width='<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="like" resourcekey="li_Oper_like" />
                <asp:ListItem Value="unlike" resourcekey="li_Oper_unlike" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtBuiltInField_Title" runat="server" Width="<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Input)%>"></asp:TextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_Sku" runat="server" Visible='<%#Settings_List.Search_Advanced.BuiltInField_Sku %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_List.Search_Advanced.Width_Label) + Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Sku" runat="server" resourcekey="lblBuiltInField_Sku"></asp:Label>
            <asp:DropDownList ID="ddlOper_Sku" runat="server" Width='<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="like" resourcekey="li_Oper_like" />
                <asp:ListItem Value="unlike" resourcekey="li_Oper_unlike" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtBuiltInField_Sku" runat="server" Width="<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Input)%>"></asp:TextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_Price" runat="server" Visible='<%#Settings_List.Search_Advanced.BuiltInField_Price %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_List.Search_Advanced.Width_Label) + Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Price" runat="server" resourcekey="lblBuiltInField_Price"></asp:Label>
            <asp:DropDownList ID="ddlOper_Price" runat="server" Width='<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator)%>' 
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
    <asp:TableRow ID="trBuiltInField_Category" runat="server" Visible='<%#Settings_List.Search_Advanced.BuiltInField_Category %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_List.Search_Advanced.Width_Label) + Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Category" runat="server" resourcekey="lblBuiltInField_Category"></asp:Label>
            <asp:DropDownList ID="ddlOper_Category" runat="server" Width='<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_Category" runat="server" DataTextField="Name"
                DataValueField="Id" Width="<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Input)%>">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_Author" runat="server" Visible='<%#Settings_List.Search_Advanced.BuiltInField_Author %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_List.Search_Advanced.Width_Label) + Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Author" runat="server" resourcekey="lblBuiltInField_Author"></asp:Label>
            <asp:DropDownList ID="ddlOper_Author" runat="server" Width='<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_Author" runat="server" DataTextField="UserName"
                DataValueField="UserId" Width="<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Input)%>">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_CreatedDate" runat="server" Visible='<%#Settings_List.Search_Advanced.BuiltInField_CreatedDate %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_List.Search_Advanced.Width_Label) + Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_CreatedDate" runat="server" resourcekey="lblBuiltInField_CreatedDate"></asp:Label>
            <asp:DropDownList ID="ddlOper_CreatedDate" runat="server" Width='<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="lessthan" resourcekey="li_Oper_lessthan" />
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="greaterthan" resourcekey="li_Oper_greaterthan" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <dnn:DnnDatePicker ID="ddpCreatedDate" runat="server" Width="<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Input)%>" />
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_PublishDate" runat="server" Visible='<%#Settings_List.Search_Advanced.BuiltInField_PublishDate %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_List.Search_Advanced.Width_Label) + Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_PublishDate" runat="server" resourcekey="lblBuiltInField_PublishDate"></asp:Label>
            <asp:DropDownList ID="ddlOper_PublishDate" runat="server" Width='<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="lessthan" resourcekey="li_Oper_lessthan" />
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="greaterthan" resourcekey="li_Oper_greaterthan" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <dnn:DnnDatePicker ID="ddpPublishDate" runat="server" Width="<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Input)%>" />
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_ExpireDate" runat="server" Visible='<%#Settings_List.Search_Advanced.BuiltInField_ExpireDate %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_List.Search_Advanced.Width_Label) + Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_ExpireDate" runat="server" resourcekey="lblBuiltInField_ExpireDate"></asp:Label>
            <asp:DropDownList ID="ddlOper_ExpireDate" runat="server" Width='<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="lessthan" resourcekey="li_Oper_lessthan" />
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="greaterthan" resourcekey="li_Oper_greaterthan" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <dnn:DnnDatePicker ID="ddpExpireDate" runat="server" Width="<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Input)%>" />
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_Views" runat="server" Visible='<%#Settings_List.Search_Advanced.BuiltInField_Views %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_List.Search_Advanced.Width_Label) + Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Views" runat="server" resourcekey="lblBuiltInField_Views"></asp:Label>
            <asp:DropDownList ID="ddlOper_Views" runat="server" Width='<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="greaterthan" resourcekey="li_Oper_greaterthan" />
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="lessthan" resourcekey="li_Oper_lessthan" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtBuiltInField_Views" runat="server" Width="<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Input)%>"
                Text="0"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator7" resourcekey="MustBeInteger"
                ForeColor="Red" runat="server" ValidationExpression="\d*" ControlToValidate="txtBuiltInField_Views"></asp:RegularExpressionValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_RatingAverage" runat="server" Visible='<%#Settings_List.Search_Advanced.BuiltInField_RatingAverage %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_List.Search_Advanced.Width_Label) + Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_RatingAverage" runat="server" resourcekey="lblBuiltInField_RatingAverage"></asp:Label>
            <asp:DropDownList ID="ddlOper_RatingAverage" runat="server" Width='<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="greaterthan" resourcekey="li_Oper_greaterthan" />
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="lessthan" resourcekey="li_Oper_lessthan" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_RatingAverage" runat="server" Width="<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Input)%>">
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
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_List.Search_Advanced.Width_Label) + Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Country" runat="server" resourcekey="lblCountry"></asp:Label>
            <asp:DropDownList ID="ddlOper_Country" runat="server" Width='<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_Country" runat="server" DataTextField="Name" AutoPostBack="True" OnSelectedIndexChanged="ddlBuiltInField_Country_SelectedIndexChanged"
                DataValueField="Id" Width="<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Input)%>">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_State" runat="server" Visible="false">
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_List.Search_Advanced.Width_Label) + Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_State" runat="server" resourcekey="lblState"></asp:Label>
            <asp:DropDownList ID="ddlOper_State" runat="server" Width='<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_State" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="ddlBuiltInField_State_SelectedIndexChanged"
                 Width="<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Input)%>">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_City" runat="server" Visible="false">
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_List.Search_Advanced.Width_Label) + Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_City" runat="server" resourcekey="lblCity"></asp:Label>
            <asp:DropDownList ID="ddlOper_City" runat="server" Width='<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_City" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBuiltInField_City_SelectedIndexChanged"
                 Width="<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Input)%>">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_Town" runat="server" Visible="false">
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_List.Search_Advanced.Width_Label) + Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Town" runat="server" resourcekey="lblTown"></asp:Label>
            <asp:DropDownList ID="ddlOper_Town" runat="server" Width='<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_Town" runat="server" 
                 Width="<%#Convert.ToInt32(Settings_List.Search_Advanced.Width_Input)%>">
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
                Visible='<%# Settings_List.Search_Advanced.BuiltInField_Sort %>'></asp:Label>
            <asp:DropDownList ID="ddlBuiltInField_Sort" runat="server" Width="200px" Visible='<%# Settings_List.Search_Advanced.BuiltInField_Sort %>'>
                <asp:ListItem Value="NameDesc" resourcekey="li_SortField_NameDesc" />
                <asp:ListItem Value="NameAsc" resourcekey="li_SortField_NameAsc" />
                <asp:ListItem Value="PurchasePriceDesc" resourcekey="li_SortField_PurchasePriceDesc" />
                <asp:ListItem Value="PurchasePriceAsc" resourcekey="li_SortField_PurchasePriceAsc" />
               <asp:ListItem Value="CreationDateDesc" resourcekey="li_SortField_CreationDateDesc" />
                <asp:ListItem Value="CreationDateAsc" resourcekey="li_SortField_CreationDateAsc" />
                <asp:ListItem Value="PublishDateDesc" resourcekey="li_SortField_PublishDateDesc" />
                <asp:ListItem Value="PublishDateAsc" resourcekey="li_SortField_PublishDateAsc" />
                <asp:ListItem Value="LastModifiedDateDesc" resourcekey="li_SortField_LastModifiedDateDesc" />
                <asp:ListItem Value="LastModifiedDateAsc" resourcekey="li_SortField_LastModifiedDateAsc" />
                <asp:ListItem Value="ViewsDesc" resourcekey="li_SortField_ViewsDesc" />
                <asp:ListItem Value="ViewsAsc" resourcekey="li_SortField_ViewsAsc" />
                
            </asp:DropDownList>
            <asp:Label ID="lblBuiltInField_Paging" runat="server" resourcekey="lblBuiltInField_Paging"
                Visible='<%#Settings_List.Search_Advanced.BuiltInField_Paging %>'></asp:Label>
            <asp:DropDownList ID="ddlBuiltInField_Paging" runat="server" Width="80px" Visible='<%#Settings_List.Search_Advanced.BuiltInField_Paging %>' />
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

<asp:Repeater ID="dlProduct" runat="server">
    <ItemTemplate>
        <div class="div">
            <ul class="ul">
                <li class="li">
                    <asp:HyperLink ID="hlName" runat="server" Visible="<%#Settings_List.Content.ShowName %>"
                        Text='<%# Server.HtmlDecode(Convert.ToString(Eval("Name"))) %>' NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name"))) %>'
                        Target="<%#Settings_List.General.LinkTarget%>" />

                </li>
            </ul>
        </div>
    </ItemTemplate>
</asp:Repeater>

           <%-- <asp:DataList ID="dlProduct" runat="server" CssClass="Normal" RepeatColumns="<%#Settings_List.Paging.ColCount %>"
                RepeatDirection="Horizontal" RepeatLayout="table" Width="100%" Visible="false"
                OnItemDataBound="dlProduct_ItemDataBound" OnItemCommand="dlProduct_ItemCommand">
                <ItemTemplate>
                 <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false"/>
                    <table width="100%" border="0" cellpadding="0" cellspacing="1">
                        <tr align="left">
                            <td>
                              <%if (Settings_List.Image.ShowImage)
                                      { %>
                                <asp:HyperLink ID="hlImage" runat="server" 
                                    NavigateUrl='<%# GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name")))%>'
                                    Target="<%#Settings_List.General.LinkTarget%>"  Title='<%#Convert.ToString(Eval("Name"))%>'>
                                    <%if (Settings_List.Image.ForceImageWidth && Settings_List.Image.ForceImageHeight)
                                      { %>
                                    <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_List.Image.ImageWidth)%>'
                                        Height='<%#Convert.ToInt32(Settings_List.Image.ImageHeight)%>' 
                                        BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='imgProduct' ImageAlign="Left" />
                                    <%}
                                      else if (Settings_List.Image.ForceImageWidth)
                                      {%>
                                    <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_List.Image.ImageWidth)%>'
                                        BorderStyle="Solid" BorderWidth="1"
                                        BorderColor="DarkGray" ID='Image1' ImageAlign="Left" />
                                    <%}
                                      else if (Settings_List.Image.ForceImageHeight)
                                      {%>
                                    <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Height='<%#Convert.ToInt32(Settings_List.Image.ImageHeight)%>'
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
                                    <tr>
                                        <td>
                                       
                                            <asp:HyperLink ID="hlName" runat="server" Visible="<%#Settings_List.Content.ShowName %>" 
                                                Text='<%# Server.HtmlDecode(Convert.ToString(Eval("Name"))) %>' NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name"))) %>'
                                                 Target="<%#Settings_List.General.LinkTarget%>" />
                                        
                                        </td>
                                    </tr>
                               <%if (Settings_List.Content.ShowUserName)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblUserName" runat="server" resourcekey="lblUserName" />
                                            <asp:HyperLink ID="hlUserName" runat="server" Text='<%# Eval("UserName") %>' NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>'
                                                Target="<%#Settings_List.General.LinkTarget%>" />
                                        </td>
                                    </tr>
                                    <%} %>

                                   <%if (Settings_List.Content.ShowVendorCompany)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblVendorCompany" runat="server" resourcekey="lblVendorCompany" />
                                            <asp:HyperLink ID="hlVendorCompany" runat="server" Text='<%# GetVendorCompany(Convert.ToString(Eval("UserId"))) %>' NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>'
                                                Target="<%#Settings_List.General.LinkTarget%>" />
                                        </td>
                                    </tr>
                                    <%} %>

                                    <tr>
                                        <td>
                                            <asp:Image ID="imgRating" runat="server" Visible="<%#Settings_List.Content.ShowRating %>"
                                                ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>' />
                                        </td>
                                    </tr>
                                   <tr>
                                        <td>
                                            <asp:Label ID="lblViews" runat="server" resourcekey="lblViews" Visible="<%#Settings_List.Content.ShowViews %>" />
                                            <asp:Label ID="ViewsLabel" runat="server" Text='<%# Eval("Views") %>' Visible="<%#Settings_List.Content.ShowViews %>" />
                                        </td>
                                    </tr>
                                          <%if (Settings_List.Content.ShowLocation_Country && CurrentType.AllowLocation)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCountry" runat="server" resourcekey="lblCountry" />
                                            <asp:Label ID="lblCountryData" runat="server" Text='<%#Eval("Country") %>' />
                                        </td>
                                    </tr>
                                       <%} %>

                                      <%if (Settings_List.Content.ShowLocation_State && CurrentType.AllowLocation)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblState" runat="server" resourcekey="lblState" />
                                            <asp:Label ID="lblStateData" runat="server" Text='<%#Eval("State") %>' />
                                        </td>
                                    </tr>
                                       <%} %>

                                             <%if (Settings_List.Content.ShowLocation_City && CurrentType.AllowLocation)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCity" runat="server" resourcekey="lblCity" />
                                            <asp:Label ID="lblCityData" runat="server" Text='<%#Eval("City") %>' />
                                        </td>
                                    </tr>
                                       <%} %>

                                           <%if (Settings_List.Content.ShowLocation_Town && CurrentType.AllowLocation)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblTown" runat="server" resourcekey="lblTown" />
                                            <asp:Label ID="lblTownData" runat="server" Text='<%#Eval("Town") %>' />   
                                        </td>
                                    </tr>
                                       <%} %>

                                         <%if (Settings_List.Content.ShowSku && CurrentType.FieldEnable_Sku)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblSku" runat="server" resourcekey="lblSku" />
                                            <asp:Label ID="SkuLabel" runat="server" Text='<%#Eval("Sku") %>' />
                                                
                                        </td>
                                    </tr>
                                       <%} %>
                                       
                                          <%if (Settings_List.Content.ShowWeight && CurrentType.FieldEnable_Weight)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblWeight" runat="server" resourcekey="lblWeight" />
                                            <asp:Label ID="WeightLabel" runat="server" Text='<%#Eval("Weight") %>' />
                                                
                                        </td>
                                    </tr>
                                       <%} %>
                                       
                                        <%if (Settings_List.Content.ShowPackageFee && CurrentType.FieldEnable_PackageFee)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPackageFee" runat="server" resourcekey="lblPackageFee" />
                                            <asp:Label ID="PackageFeeLabel" runat="server" Text='<%#Eval("PackageFee") %>' />
                                                
                                        </td>
                                    </tr>
                                     <%} %>
                                     
                                      <%if (Settings_List.Content.ShowPrice && CurrentType.FieldEnable_Price)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPurchasePrice" runat="server" resourcekey="lblPurchasePrice" />
                                            <asp:Label ID="PurchasePriceLabel" runat="server"  
                                            Text='<%#Settings_Portal.Order.CurrencySymbol+ Convert.ToString(Eval("PurchasePrice")) %>'
                                                CssClass='<%# GetPriceCss(Convert.ToString(Eval("Id"))) %>' />
                                       
                                        </td>
                                    </tr>
                                     <%} %>

                                  
                                   <tr>
                                        <td>
                                            <asp:Label ID="lblPromoPrice" runat="server" resourcekey="lblPromoPrice"  Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                            <asp:Label ID="PromoPriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PromoPrice")) %>'
                                                CssClass='NormalRed' Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                        </td>
                                    </tr>
                                   

                                 
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPromoStart" runat="server" resourcekey="lblPromoStart" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) && Settings_List.Content.ShowPromoStart %>' />
                                            <asp:Label ID="PromoStartLabel" runat="server"
                                                Text='<%# Convert.ToDateTime(Eval("PromoStart"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoStart")).ToShortDateString() %>'
                                                Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) && Settings_List.Content.ShowPromoStart %>' />
                                        </td>
                                    </tr>
                                 

                                  
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPromoEnd" runat="server" resourcekey="lblPromoEnd" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) && Settings_List.Content.ShowPromoEnd %>' />
                                            <asp:Label ID="PromoEndLabel" runat="server" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) && Settings_List.Content.ShowPromoEnd %>'
                                                Text='<%# Convert.ToDateTime(Eval("PromoEnd"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoEnd")).ToShortDateString() %>' />
                                        </td>
                                    </tr>
                                  

                                    <%if (Settings_List.Content.ShowCreatedDate)
                                        { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate" />
                                            <asp:Label ID="CreatedDateLabel" runat="server" Text='<%# Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString() %>' />
                                        </td>
                                    </tr>
                                    <%} %>

                                    <%if (Settings_List.Content.ShowFeaturedField)
                                        { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblFeatured" runat="server" resourcekey="lblFeatured" />
                                            <asp:CheckBox ID="chkFeatured" runat="server" Checked='<%# Convert.ToBoolean(Eval("Featured")) %>' />
                                        </td>
                                    </tr>
                                    <%} %>

                                    <%if (Settings_List.Content.ShowSummary && CurrentType.FieldEnable_Summary)
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

                                   <%if (Settings_List.Content.ShowOrderNow || Settings_List.Content.ShowAddCart)
                                        { %>
                                    <tr>
                                        <td>
                                            <dnn:CommandButton ID="btnOrderNow" runat="server" ImageUrl="~/desktopmodules/crossclassified/images/order.png"
                                                CommandName="OrderNow" CommandArgument='<%# Eval("Id")%>' CausesValidation="false" Visible='<%#Settings_List.Content.ShowOrderNow %>'
                                                Text='<%#Localization.GetString("btnOrderNow", LocalResourceFile)%>' />
                                            &nbsp;
                                            <dnn:CommandButton ID="btnAddCart" runat="server" ImageUrl="~/desktopmodules/crossclassified/images/MyCart.gif"
                                                CommandName="AddCart" CommandArgument='<%# Eval("Id")%>' CausesValidation="false" Visible='<%#Settings_List.Content.ShowAddCart %>'
                                                Text='<%#Localization.GetString("btnAddCart", LocalResourceFile)%>' />
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <% }%>
                              </table>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>--%>
            <asp:GridView ID="grProduct" runat="server" AutoGenerateColumns="False" Visible="False" Width="100%"
                CssClass="Normal" CellPadding="1"  CellSpacing="1"  GridLines="Both" BackColor="Gray" AllowSorting="True" ForeColor="#333333" 
                DataKeyNames="Id" OnDataBinding="grProduct_DataBinding" OnRowCommand="grProduct_RowCommand">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlImage" runat="server" 
                                NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name"))) %>'
                                Target="<%#Settings_List.General.LinkTarget%>"  Title='<%#Convert.ToString(Eval("Name")) %>'>
                                <%if (Settings_List.Image.ForceImageWidth && Settings_List.Image.ForceImageHeight)
                                  { %>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_List.Image.ImageWidth)%>'
                                    Height='<%#Convert.ToInt32(Settings_List.Image.ImageHeight)%>' 
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='imgProduct' ImageAlign="AbsMiddle" />
                                <%}
                                  else if (Settings_List.Image.ForceImageWidth)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_List.Image.ImageWidth)%>'
                                     BorderStyle="Solid" BorderWidth="1"
                                    BorderColor="DarkGray" ID='Image1' ImageAlign="AbsMiddle" />
                                <%}
                                  else if (Settings_List.Image.ForceImageHeight)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Height='<%#Convert.ToInt32(Settings_List.Image.ImageHeight)%>'
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
                            <asp:Label ID="lblName" resourcekey="lblProductName1" runat="server" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlName" runat="server" Text='<%# Server.HtmlDecode(Convert.ToString(Eval("Name"))) %>'
                                NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name"))) %>'
                                 Target="<%#Settings_List.General.LinkTarget%>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  >
                        <HeaderTemplate>
                            <asp:Label ID="lblUserNameHead" resourcekey="lblUserNameHead" runat="server" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlUserName" runat="server" Text='<%#Eval("UserName")%>' 
                            NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>'
                                Target="<%#Settings_List.General.LinkTarget%>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblVendorCompanyHead" resourcekey="lblVendorCompanyHead" runat="server" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlVendorCompany" runat="server" Text='<%# GetVendorCompany(Convert.ToString(Eval("UserId"))) %>'
                                NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>' Target="<%#Settings_List.General.LinkTarget%>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblRating" resourcekey="lblRating1" runat="server" Visible="<%#Settings_List.Content.ShowRating %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Image ID="imgRating" runat="server" Visible="<%#Settings_List.Content.ShowRating %>"
                                ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblViews" resourcekey="lblViews1" runat="server" Visible="<%#Settings_List.Content.ShowViews %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ViewsLabel" runat="server" Text='<%# Eval("Views") %>' Visible="<%#Settings_List.Content.ShowViews %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField  >
                        <HeaderTemplate>
                            <asp:Label ID="lblCountry" resourcekey="lblCountryHead" runat="server"  />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CountryData" runat="server" Text='<%# Eval("Country") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField  >
                        <HeaderTemplate>
                            <asp:Label ID="lblState" resourcekey="lblStateHead" runat="server"  />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="StateData" runat="server" Text='<%# Eval("State") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField  >
                        <HeaderTemplate>
                            <asp:Label ID="lblCity" resourcekey="lblCityHead" runat="server"  />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CityData" runat="server" Text='<%# Eval("City") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField  >
                        <HeaderTemplate>
                            <asp:Label ID="lblTown" resourcekey="lblTownHead" runat="server"  />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="TownData" runat="server" Text='<%# Eval("Town") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField  >
                        <HeaderTemplate>
                            <asp:Label ID="lblSku" resourcekey="lblSku1" runat="server" Visible="<%#Settings_List.Content.ShowSku %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="SkuLabel" runat="server" Text='<%# Eval("Sku") %>' Visible="<%#Settings_List.Content.ShowSku %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblWeight" resourcekey="lblWeight1" runat="server" Visible="<%#Settings_List.Content.ShowWeight %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="WeightLabel" runat="server" Text='<%# Eval("Weight") %>' Visible="<%#Settings_List.Content.ShowWeight %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblPackageFee" resourcekey="lblPackageFee1" runat="server" Visible="<%#Settings_List.Content.ShowPackageFee %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="PackageFeeLabel" runat="server" Text='<%# Eval("PackageFee") %>' Visible="<%#Settings_List.Content.ShowPackageFee %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField   ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblSellPrice" resourcekey="lblPurchasePrice1" runat="server" Visible="<%#Settings_List.Content.ShowPrice %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="PurchasePriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PurchasePrice")) %>'
                                CssClass='<%# GetPriceCss(Convert.ToString(Eval("Id"))) %>' />&nbsp;&nbsp;
                            <asp:Label ID="PromoPriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PromoPrice")) %>'
                                CssClass='NormalRed' Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblPromoStart" resourcekey="lblPromoStart1" runat="server" Visible="<%#Settings_List.Content.ShowPromoStart %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="PromoStartLabel" runat="server" 
                            Text='<%# Convert.ToDateTime(Eval("PromoStart"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoStart")).ToShortDateString() %>'
                          
                                Visible='<%#Settings_List.Content.ShowPromoStart %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblPromoEnd" resourcekey="lblPromoEnd1" runat="server" Visible="<%#Settings_List.Content.ShowPromoEnd %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="PromoEndLabel" runat="server" 
                              Text='<%# Convert.ToDateTime(Eval("PromoEnd"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoEnd")).ToShortDateString() %>'
                          
                          
                                Visible="<%#Settings_List.Content.ShowPromoEnd %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblCreatedDate" resourcekey="lblCreatedDate1" runat="server" Visible="<%#Settings_List.Content.ShowCreatedDate %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CreatedDateLabel" runat="server" Text='<%# Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString() %>'
                                Visible="<%#Settings_List.Content.ShowCreatedDate %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblFeatured" resourcekey="lblFeatured1" runat="server" Visible="<%#Settings_List.Content.ShowFeaturedField %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkFeatured" runat="server" Checked='<%#Convert.ToBoolean(Eval("Featured")) %>'
                                Visible="<%#Settings_List.Content.ShowFeaturedField %>" />
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
                            <dnn:CommandButton ID="btnOrderNow" runat="server" ImageUrl="~/desktopmodules/crossclassified/images/order.png"
                                CommandName="OrderNow" CommandArgument='<%# Eval("Id")%>' CausesValidation="false" Visible='<%#Settings_List.Content.ShowOrderNow %>'
                                Text='<%#Localization.GetString("btnOrderNow", LocalResourceFile)%>' />
                            &nbsp;
                            <dnn:CommandButton ID="btnAddCart" runat="server" ImageUrl="~/desktopmodules/crossclassified/images/MyCart.gif"
                                CommandName="AddCart" CommandArgument='<%# Eval("Id")%>' CausesValidation="false" Visible='<%#Settings_List.Content.ShowAddCart %>'
                                Text='<%#Localization.GetString("btnAddCart", LocalResourceFile)%>' />
                            &nbsp;
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
     
            <asp:HyperLink ID="hlRss" Visible="<%#Settings_List.Rss.DisplayRss %>" runat="server"
                ImageUrl="~/DesktopModules/CrossClassified/Images/feed-icon-12x12.gif" CssClass="NormalBold"
                Target="_blank"></asp:HyperLink>
            <asp:HyperLink ID="hlMoreProducts" Visible="<%#Settings_List.MoreProduct.ShowMoreProducts %>"
                runat="server" resourcekey="MoreProducts" Text="More Products..." CssClass="NormalBold"></asp:HyperLink>

<table width="100%" cellpadding="1" cellspacing="1" runat="server" id="tblPaging" align="left"
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
