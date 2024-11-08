<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.ascx.cs" Inherits="Cross.Modules.CP_Product.View.Search" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web.Deprecated" %>
<asp:Panel ID="pnlBasic" runat="server" Visible="false" CssClass="dnnFormItem">
    <asp:DropDownList ID="ddlCategory" runat="server" Width='<%#Convert.ToInt32(Settings_Search.Basic.CategoryWidth)%>'
        Visible='<%#Settings_Search.Basic.ShowCategory%>' DataTextField="Name" DataValueField="Id">
    </asp:DropDownList>
    <%#GetCategoryBreakString() %>
    <asp:DropDownList ID="ddlAuthorList" runat="server" Width='<%#Convert.ToInt32(Settings_Search.Basic.AuthorListWidth)%>'
        Visible='<%#Settings_Search.Basic.ShowAuthorList%>' DataTextField="UserName"
        DataValueField="UserId">
    </asp:DropDownList>
    <%#GetAuthorListBreakString() %>
    <asp:TextBox ID="txtSearch" runat="server" Width="<%#Convert.ToInt32(Settings_Search.Basic.InputWidth)%>"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" CssClass="dnnPrimaryAction" Width="60px"
        CausesValidation="false" ResourceKey="Search" OnClick="btnSearch_Click"></asp:Button>
</asp:Panel>

<asp:Table ID="tblUserSearch" runat="server" Width="100%" CssClass="dnnFormItem"
    HorizontalAlign="Left" Visible="false">
    <asp:TableRow ID="trBuiltInField_Title" runat="server" Visible='<%#Settings_Search.Advanced.BuiltInField_Title %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_Search.Advanced.Width_Label) + Convert.ToInt32(Settings_Search.Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Title" runat="server" resourcekey="lblBuiltInField_Title"></asp:Label>
            <asp:DropDownList ID="ddlOper_Title" runat="server" Width='<%#Convert.ToInt32(Settings_Search.Advanced.Width_Operator)%>'>
                <asp:ListItem Value="like" resourcekey="li_Oper_like" />
                <asp:ListItem Value="unlike" resourcekey="li_Oper_unlike" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtBuiltInField_Title" runat="server" Width="<%#Convert.ToInt32(Settings_Search.Advanced.Width_Input)%>"></asp:TextBox>
        </asp:TableCell>
    </asp:TableRow>
      <asp:TableRow ID="trBuiltInField_Sku" runat="server" Visible='<%#Settings_Search.Advanced.BuiltInField_Sku %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_Search.Advanced.Width_Label) + Convert.ToInt32(Settings_Search.Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Sku" runat="server" resourcekey="lblBuiltInField_Sku"></asp:Label>
            <asp:DropDownList ID="ddlOper_Sku" runat="server" Width='<%#Convert.ToInt32(Settings_Search.Advanced.Width_Operator)%>'>
                <asp:ListItem Value="like" resourcekey="li_Oper_like" />
                <asp:ListItem Value="unlike" resourcekey="li_Oper_unlike" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtBuiltInField_Sku" runat="server" Width="<%#Convert.ToInt32(Settings_Search.Advanced.Width_Input)%>"></asp:TextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_Price" runat="server" Visible='<%#Settings_Search.Advanced.BuiltInField_Price %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_Search.Advanced.Width_Label) + Convert.ToInt32(Settings_Search.Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Price" runat="server" resourcekey="lblBuiltInField_Price"></asp:Label>
            <asp:DropDownList ID="ddlOper_Price" runat="server" Width='<%#Convert.ToInt32(Settings_Search.Advanced.Width_Operator)%>' 
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
    <asp:TableRow ID="trBuiltInField_Category" runat="server" Visible='<%#Settings_Search.Advanced.BuiltInField_Category %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_Search.Advanced.Width_Label) + Convert.ToInt32(Settings_Search.Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Category" runat="server" resourcekey="lblBuiltInField_Category"></asp:Label>
            <asp:DropDownList ID="ddlOper_Category" runat="server" Width='<%#Convert.ToInt32(Settings_Search.Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_Category" runat="server" DataTextField="Name"
                DataValueField="Id" Width="<%#Convert.ToInt32(Settings_Search.Advanced.Width_Input)%>">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_Author" runat="server" Visible='<%#Settings_Search.Advanced.BuiltInField_Author %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_Search.Advanced.Width_Label) + Convert.ToInt32(Settings_Search.Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Author" runat="server" resourcekey="lblBuiltInField_Author"></asp:Label>
            <asp:DropDownList ID="ddlOper_Author" runat="server" Width='<%#Convert.ToInt32(Settings_Search.Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_Author" runat="server" DataTextField="UserName"
                DataValueField="UserId" Width="<%#Convert.ToInt32(Settings_Search.Advanced.Width_Input)%>">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_CreatedDate" runat="server" Visible='<%#Settings_Search.Advanced.BuiltInField_CreatedDate %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_Search.Advanced.Width_Label) + Convert.ToInt32(Settings_Search.Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_CreatedDate" runat="server" resourcekey="lblBuiltInField_CreatedDate"></asp:Label>
            <asp:DropDownList ID="ddlOper_CreatedDate" runat="server" Width='<%#Convert.ToInt32(Settings_Search.Advanced.Width_Operator)%>'>
                <asp:ListItem Value="lessthan" resourcekey="li_Oper_lessthan" />
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="greaterthan" resourcekey="li_Oper_greaterthan" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <dnn:DnnDatePicker ID="ddpCreatedDate" runat="server" Width="<%#Convert.ToInt32(Settings_Search.Advanced.Width_Input)%>" />
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_PublishDate" runat="server" Visible='<%#Settings_Search.Advanced.BuiltInField_PublishDate %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_Search.Advanced.Width_Label) + Convert.ToInt32(Settings_Search.Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_PublishDate" runat="server" resourcekey="lblBuiltInField_PublishDate"></asp:Label>
            <asp:DropDownList ID="ddlOper_PublishDate" runat="server" Width='<%#Convert.ToInt32(Settings_Search.Advanced.Width_Operator)%>'>
                <asp:ListItem Value="lessthan" resourcekey="li_Oper_lessthan" />
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="greaterthan" resourcekey="li_Oper_greaterthan" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <dnn:DnnDatePicker ID="ddpPublishDate" runat="server" Width="<%#Convert.ToInt32(Settings_Search.Advanced.Width_Input)%>" />
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_ExpireDate" runat="server" Visible='<%#Settings_Search.Advanced.BuiltInField_ExpireDate %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_Search.Advanced.Width_Label) + Convert.ToInt32(Settings_Search.Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_ExpireDate" runat="server" resourcekey="lblBuiltInField_ExpireDate"></asp:Label>
            <asp:DropDownList ID="ddlOper_ExpireDate" runat="server" Width='<%#Convert.ToInt32(Settings_Search.Advanced.Width_Operator)%>'>
                <asp:ListItem Value="lessthan" resourcekey="li_Oper_lessthan" />
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="greaterthan" resourcekey="li_Oper_greaterthan" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <dnn:DnnDatePicker ID="ddpExpireDate" runat="server" Width="<%#Convert.ToInt32(Settings_Search.Advanced.Width_Input)%>" />
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_Views" runat="server" Visible='<%#Settings_Search.Advanced.BuiltInField_Views %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_Search.Advanced.Width_Label) + Convert.ToInt32(Settings_Search.Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Views" runat="server" resourcekey="lblBuiltInField_Views"></asp:Label>
            <asp:DropDownList ID="ddlOper_Views" runat="server" Width='<%#Convert.ToInt32(Settings_Search.Advanced.Width_Operator)%>'>
                <asp:ListItem Value="greaterthan" resourcekey="li_Oper_greaterthan" />
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="lessthan" resourcekey="li_Oper_lessthan" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtBuiltInField_Views" runat="server" Width="<%#Convert.ToInt32(Settings_Search.Advanced.Width_Input)%>"
                Text="0"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator7" resourcekey="MustBeInteger"
                ForeColor="Red" runat="server" ValidationExpression="\d*" ControlToValidate="txtBuiltInField_Views"></asp:RegularExpressionValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_RatingAverage" runat="server" Visible='<%#Settings_Search.Advanced.BuiltInField_RatingAverage %>'>
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_Search.Advanced.Width_Label) + Convert.ToInt32(Settings_Search.Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_RatingAverage" runat="server" resourcekey="lblBuiltInField_RatingAverage"></asp:Label>
            <asp:DropDownList ID="ddlOper_RatingAverage" runat="server" Width='<%#Convert.ToInt32(Settings_Search.Advanced.Width_Operator)%>'>
                <asp:ListItem Value="greaterthan" resourcekey="li_Oper_greaterthan" />
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="lessthan" resourcekey="li_Oper_lessthan" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_RatingAverage" runat="server" Width="<%#Convert.ToInt32(Settings_Search.Advanced.Width_Input)%>">
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
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_Search.Advanced.Width_Label) + Convert.ToInt32(Settings_Search.Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Country" runat="server" resourcekey="lblBuiltInField_Country"></asp:Label>
            <asp:DropDownList ID="ddlOper_Country" runat="server" Width='<%#Convert.ToInt32(Settings_Search.Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_Country" runat="server" DataTextField="Name" AutoPostBack="True" OnSelectedIndexChanged="ddlBuiltInField_Country_SelectedIndexChanged"
                DataValueField="Id" Width="<%#Convert.ToInt32(Settings_Search.Advanced.Width_Input)%>">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_State" runat="server" Visible="false">
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_Search.Advanced.Width_Label) + Convert.ToInt32(Settings_Search.Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_State" runat="server" resourcekey="lblBuiltInField_State"></asp:Label>
            <asp:DropDownList ID="ddlOper_State" runat="server" Width='<%#Convert.ToInt32(Settings_Search.Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_State" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="ddlBuiltInField_State_SelectedIndexChanged"
                 Width="<%#Convert.ToInt32(Settings_Search.Advanced.Width_Input)%>">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_City" runat="server" Visible="false">
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_Search.Advanced.Width_Label) + Convert.ToInt32(Settings_Search.Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_City" runat="server" resourcekey="lblBuiltInField_City"></asp:Label>
            <asp:DropDownList ID="ddlOper_City" runat="server" Width='<%#Convert.ToInt32(Settings_Search.Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_City" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBuiltInField_City_SelectedIndexChanged"
                 Width="<%#Convert.ToInt32(Settings_Search.Advanced.Width_Input)%>">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="trBuiltInField_Town" runat="server" Visible="false">
        <asp:TableCell HorizontalAlign="Right" Width='<%# Convert.ToInt32(Settings_Search.Advanced.Width_Label) + Convert.ToInt32(Settings_Search.Advanced.Width_Operator) %>'>
            <asp:Label ID="lblBuiltInField_Town" runat="server" resourcekey="lblBuiltInField_Town"></asp:Label>
            <asp:DropDownList ID="ddlOper_Town" runat="server" Width='<%#Convert.ToInt32(Settings_Search.Advanced.Width_Operator)%>'>
                <asp:ListItem Value="equal" resourcekey="li_Oper_equal" />
                <asp:ListItem Value="unequal" resourcekey="li_Oper_unequal" />
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell>
            <asp:DropDownList ID="ddlBuiltInField_Town" runat="server" 
                 Width="<%#Convert.ToInt32(Settings_Search.Advanced.Width_Input)%>">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<p runat="server" id="pSearch" align="center" visible="false">
    <asp:Button ID="btnAdvancedSearch" runat="server" CssClass="dnnPrimaryAction" Width="60px"
        CausesValidation="false" ResourceKey="Search" OnClick="btnAdvancedSearch_Click">
    </asp:Button>
</p>

  