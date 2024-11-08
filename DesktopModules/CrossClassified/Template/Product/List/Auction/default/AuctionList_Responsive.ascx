<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AuctionList.ascx.cs" Inherits="Cross.Modules.CP_Product.View.AuctionList" %>
<%@ Register TagPrefix="Cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web.Deprecated" %>
<style type="text/css">
.CrossGrid th{
  text-align:center;
}
</style>
<style type="text/css">
    /* Portrait tablet to landscape and smaller */
    @media (max-width: 979px)
    {
        .prddtl h3 a
        {
            color: #999;
        }
    
        .prdblock .prdtbl
        {
            border: none;
            padding: 5px;
        }
    
        .prdblock .prdtbl:hover
        {
            background-color: #EEEEEE;
        }
    
        .prdimg, .prddtl .CommandButton
        {
            line-height: 50px;
            padding: 5px 0;
        }
    
        .prdblock .prditem td
        {
            display: inline-block;
            width: 215px;
            text-align: left;
        }
    
        .prdblock .prditem td tr td
        {
            display: block !important;
        }
    
        .prdtbl td, .prdblock .prditem tr
        {
            display: inline !important;
        }
    
        .prdblock .prdtbl img
        {
            float: none;
            border-color: #ddd;
            border-radius: 5px;
            margin: 5px;
        }
    }
</style>

    <!-- Basic Search table -->
<table width="100%" cellpadding="0" cellspacing="0" id="tblBasicSearch" runat="server"
    class="dnnFormItem prdtbl" visible="false">
    <tr>
        <td>
          &nbsp; &nbsp;
            <asp:Label ID="lblSearchPrefix" runat="server" resourcekey="lblSearchPrefix" />
            <asp:TextBox ID="txtSearch" runat="server"  Width='<%#Convert.ToInt32(Settings_List.Search_Basic.TitleInputWidth)%>'
                />&nbsp;
             <asp:Label ID="lblSortBy" runat="server" resourcekey="lblSortBy" visible='<%# Settings_List.Search_Basic.ShowSortInSearch %>'/>
            <asp:DropDownList ID="ddlSortField" runat="server" Width="200px" visible='<%# Settings_List.Search_Basic.ShowSortInSearch %>'>
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
<asp:Table ID="tblAdvancedSearchCondition" runat="server" Width="100%" class="dnnFormItem prdtbl"
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
     runat="server" class="dnnFormItem prdtbl" visible="false">
    <tr>
        <td>
            <asp:Label ID="lblBuiltInField_Sort" runat="server" resourcekey="lblBuiltInField_Sort"
                Visible='<%# Settings_List.Search_Advanced.BuiltInField_Sort %>'></asp:Label>
            <asp:DropDownList ID="ddlBuiltInField_Sort" runat="server" Width="200px" Visible='<%# Settings_List.Search_Advanced.BuiltInField_Sort %>'>
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
<table width="100%" cellpadding="0" cellspacing="0" class="Normal maintbl prdblock">
    <tr valign="top">
        <td valign="top" align="left" height="<%=GetHeight()%>">
            <% =GetMarqueeBegin()%>
            <asp:DataList ID="dlProduct" runat="server" CssClass="Normal prditem" RepeatColumns="<%#Settings_List.Paging.ColCount %>"
                RepeatDirection="Horizontal" RepeatLayout="table" Width="100%" Visible="false"
                OnItemDataBound="dlProduct_ItemDataBound" OnItemCommand="dlProduct_ItemCommand">
                <ItemTemplate>
                 <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false"/>
                    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="prdtbl">
                        <tr align="left">
                            <td  align="left" class="prdimg">
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
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="prddtl">
                                 <%if (Settings_List.Content.ShowName)
                                      { %>
                                    <tr>
                                        <td>
                                       
                                            <asp:HyperLink ID="hlName" runat="server"
                                                Text='<%# Server.HtmlDecode(Convert.ToString(Eval("Name"))) %>' 
                                                NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name"))) %>'
                                                 Target="<%#Settings_List.General.LinkTarget%>" />
                                        </td>
                                    </tr>
                                      <%} %>

                                    <%if (Settings_List.Content.ShowUserName)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblUserName" runat="server" resourcekey="lblUserName" />&nbsp;
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

                                     <%if (Settings_List.Content.ShowRating)
                                      { %>
                                    <tr>
                                        <td>
                                        <asp:Label ID="lblVendorRating" runat="server" resourcekey="lblVendorRating" />&nbsp;
                                            <asp:Image ID="imgRating" runat="server"
                                                ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>' />
                                        </td>
                                    </tr>
                                     <%} %>

                                       <%if (Settings_List.Content.ShowViews)
                                      { %>
                                   <tr>
                                        <td>
                                            <asp:Label ID="lblViews" runat="server" resourcekey="lblViews" />&nbsp;
                                            <asp:Label ID="lblViewsData" runat="server" Text='<%# Eval("Views") %>'/>
                                        </td>
                                    </tr>
                                      <%} %>

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
                                            <asp:Label ID="lblSku" runat="server" resourcekey="lblSku" />&nbsp;
                                            <asp:Label ID="lblSkuData" runat="server" Text='<%#Eval("Sku") %>' />
                                                
                                        </td>
                                    </tr>
                                       <%} %>

                                    <%if (Settings_List.Content.ShowWeight && CurrentType.FieldEnable_Weight)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblWeight" runat="server" resourcekey="lblWeight" />&nbsp;
                                            <asp:Label ID="lblWeightData" runat="server" Text='<%#Eval("Weight") %>' />
                                        </td>
                                    </tr>
                                    <%} %>
                                       <%if (Settings_List.Content.ShowStartPrice)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblStartPrice" runat="server" resourcekey="lblStartPrice" />&nbsp;
                                            <asp:Label ID="lblStartPriceData" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("StartPrice")) %>' />
                                        </td>
                                    </tr>
                                    <%} %>

                                        <%if (Settings_List.Content.ShowBuyNowPrice && !IsSecondItemAuction)
                                             
                                      { %>
                                   <tr>
                                        <td>
                                            <asp:Label ID="lblBuyNowPrice" runat="server" resourcekey="lblBuyNowPrice" />&nbsp;
                                            <asp:Label ID="lblBuyNowPriceData" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("BuyNowPrice")) %>'
                                                 />
                                        </td>
                                    </tr>
                                     <%} %>


                                       <%if (Settings_List.Content.ShowCurrentBid && IsEnglishAuction)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCurrentBid" runat="server" resourcekey="lblCurrentBid" />&nbsp;
                                            <asp:Label ID="lblCurrentBidData" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol + GetCurrentBid(Convert.ToString(Eval("Id"))) %>'
                                                 />
                                        </td>
                                    </tr>
                                      <%} %>

                                     <%if (Settings_List.Content.ShowCurrentBidder && IsEnglishAuction)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCurrentBidder" runat="server" resourcekey="lblCurrentBidder" />&nbsp;
                                            <asp:Label ID="lblCurrentBidderData" runat="server" Text='<%#GetCurrentBidder(Convert.ToString(Eval("Id")))%>' />
                                        </td>
                                    </tr>
                                    <%} %>

                                        <%if (Settings_List.Content.ShowBidCount)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblBidCount" runat="server" resourcekey="lblBidCount" />&nbsp;
                                            <asp:Label ID="lblBidCountData" runat="server" Text='<%#GetBidCount(Convert.ToString(Eval("Id"))) %>' />
                                        </td>
                                    </tr>
                                    <%} %>

                                     <%if (Settings_List.Content.ShowPublishDate)
                                      { %>
                                       <tr>
                                        <td>
                                            <asp:Label ID="lblPublishDate" runat="server" resourcekey="lblPublishDate"/>&nbsp;
                                            <asp:Label ID="lblPublishDateData" runat="server" Text='<%#Eval("PublishDate")%>'/>
                                        </td>
                                    </tr>
                                     <%} %>

                                         <%if (Settings_List.Content.ShowExpireDate)
                                      { %>
                                       <tr>
                                        <td>
                                            <asp:Label ID="lblExpireDate" runat="server" resourcekey="lblExpireDate"/>&nbsp;
                                            <asp:Label ID="lblExpireDateData" runat="server" Text='<%#Eval("ExpireDate")%>'/>
                                        </td>
                                    </tr>
                                     <%} %>

                                    <%if (Settings_List.Content.ShowRemainTime)
                                      { %>
                                       <tr>
                                        <td>
                                            <asp:Label ID="lblRemainTime" runat="server" resourcekey="lblRemainTime"/>&nbsp;
                                            <asp:Label ID="lblRemainTimeData" runat="server" Text='<%# GetRemainTime(Convert.ToString(Eval("Id"))) %>'/>
                                        </td>
                                    </tr>
                                     <%} %>
                                  
                                   <%if (Settings_List.Content.ShowFeaturedField)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblFeatured" runat="server" resourcekey="lblFeatured"/>&nbsp;
                                            <asp:CheckBox ID="chkFeatured" runat="server" Checked='<%# Convert.ToBoolean(Eval("Featured")) %>'
                                                />
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
                                    <%if (Settings_List.Content.ShowBidButton)
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
                            <asp:Label ID="lblName" resourcekey="lblProductNameHead" runat="server" />
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
                            <asp:Label ID="lblRating" resourcekey="lblVendorRatingHead" runat="server" Visible="<%#Settings_List.Content.ShowRating %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Image ID="imgRating" runat="server" Visible="<%#Settings_List.Content.ShowRating %>"
                                ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblViews" resourcekey="lblViewsHead" runat="server" Visible="<%#Settings_List.Content.ShowViews %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ViewsLabel" runat="server" Text='<%# Eval("Views") %>' Visible="<%#Settings_List.Content.ShowViews %>" />
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
                            <asp:Label ID="lblSku" resourcekey="lblSkuHead" runat="server" Visible="<%#Settings_List.Content.ShowSku %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="SkuLabel" runat="server" Text='<%# Eval("Sku") %>' Visible="<%#Settings_List.Content.ShowSku %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblWeight" resourcekey="lblWeightHead" runat="server" Visible="<%#Settings_List.Content.ShowWeight %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="WeightLabel" runat="server" Text='<%# Eval("Weight") %>' Visible="<%#Settings_List.Content.ShowWeight %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblStartPrice" resourcekey="lblStartPriceHead" runat="server" Visible="<%#Settings_List.Content.ShowStartPrice %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblStartPriceData" runat="server" Text='<%# Eval("StartPrice") %>' Visible="<%#Settings_List.Content.ShowStartPrice %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblBuyNowPrice" resourcekey="lblBuyNowPriceHead" runat="server" Visible="<%#Settings_List.Content.ShowBuyNowPrice %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBuyNowPriceData" runat="server" Text='<%# Eval("BuyNowPrice") %>' Visible="<%#Settings_List.Content.ShowBuyNowPrice %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblCurrentBid" resourcekey="lblCurrentBidHead" runat="server" Visible="<%#Settings_List.Content.ShowCurrentBid %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCurrentBidData" runat="server" Text='<%# GetCurrentBid(Convert.ToString(Eval("Id"))) %>' Visible="<%#Settings_List.Content.ShowCurrentBid %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblCurrentBidder" resourcekey="lblCurrentBidderHead" runat="server" Visible="<%#Settings_List.Content.ShowCurrentBidder %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCurrentBidderData" runat="server" Text='<%# GetCurrentBidder(Convert.ToString(Eval("Id"))) %>' Visible="<%#Settings_List.Content.ShowCurrentBidder %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblBidCount" resourcekey="lblBidCountHead" runat="server" Visible="<%#Settings_List.Content.ShowBidCount %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBidCountData" runat="server" Text='<%#GetBidCount(Convert.ToString(Eval("Id"))) %>' Visible="<%#Settings_List.Content.ShowBidCount %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblPublishDate" resourcekey="lblPublishDateHead" runat="server" Visible="<%#Settings_List.Content.ShowPublishDate %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPublishDateData" runat="server" Text='<%# Eval("PublishDate") %>' Visible="<%#Settings_List.Content.ShowPublishDate %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblExpireDate" resourcekey="lblExpireDateHead" runat="server" Visible="<%#Settings_List.Content.ShowExpireDate %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblExpireDateData" runat="server" Text='<%# Eval("ExpireDate") %>' Visible="<%#Settings_List.Content.ShowExpireDate %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField  ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblRemainTime" resourcekey="lblRemainTimeHead" runat="server" Visible="<%#Settings_List.Content.ShowRemainTime %>" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRemainTimeData" runat="server" Text='<%# GetRemainTime(Convert.ToString(Eval("Id"))) %>' Visible="<%#Settings_List.Content.ShowRemainTime %>" />
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
            <%=GetMarqueeEnd()%>
        </td>
    </tr>
    <tr>
        <td align="right" colspan="2">
            <asp:HyperLink ID="hlRss" Visible="<%#Settings_List.Rss.DisplayRss %>" runat="server"
                ImageUrl="~/DesktopModules/CrossClassified/Images/feed-icon-12x12.gif" CssClass="NormalBold"
                Target="_blank"></asp:HyperLink>
            <asp:HyperLink ID="hlMoreProducts" Visible="<%#Settings_List.MoreProduct.ShowMoreProducts %>"
                runat="server" resourcekey="MoreProducts" Text="More Products..." CssClass="NormalBold"></asp:HyperLink>
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
