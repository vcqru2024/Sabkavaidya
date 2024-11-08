<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CategoryList.ascx.cs"
    Inherits="Cross.Modules.CP_Product.View.CategoryList" %>
<asp:TreeView ID="tvCategory" runat="server" NodeIndent="10" PathSeparator="/" ExpandDepth="0"
    OnSelectedNodeChanged="tvCategory_SelectedNodeChanged">
    <ParentNodeStyle Font-Bold="False" />
    <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
    <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
        VerticalPadding="0px" />
    <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="2px"
        NodeSpacing="0px" VerticalPadding="2px" />
</asp:TreeView>
<asp:DataList ID="dlCategory" runat="server" Visible="true"  RepeatColumns="<%#Settings_Category.General.ColCount %>" 
    RepeatDirection="Horizontal" RepeatLayout="Table">
    <ItemTemplate>
        <table width="100%" border="0" cellpadding="0" cellspacing="1">
            <tr align="left">
                <td>
                    <asp:HyperLink ID="hlImage" runat="server" Visible='<%# Settings_Category.General.ShowImage %>'
                        NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>' Target="<%# Settings_Category.General.Target%>">
                        <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_Category.General.ImageWidth)%>'
                            Visible='<%#Settings_Category.General.ShowImage%>' BorderStyle="Solid"
                            BorderWidth="1" BorderColor="DarkGray" ID='imgCategory' ImageAlign="Left" /></asp:HyperLink>
                </td>
            </tr>
            <tr align="left">
                <td align="left" valign="top">
                    <%if (Settings_Category.General.ShowProductCounts){ %>
                      
                    <asp:HyperLink  ID="lnkName" runat="server" Text='<%# Convert.ToString(Eval("Name")) +"(" +Convert.ToString(Eval("ProductCounts"))+")" %>'
                        Target="<%# Settings_Category.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>'  />
                    <%}
                      else
                      { %>
                    <asp:HyperLink  ID="HyperLink1" runat="server" Text='<%# Convert.ToString(Eval("Name")) %>'
                        Target="<%# Settings_Category.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>' />
                    <%} %>
                    <asp:HyperLink  ID="lnkRss" ImageUrl="~/desktopmodules/CrossClassified/Images/feed-icon-12x12.gif"
                        runat="server" Visible="<%#Settings_Category.General.DisplayRss %>" Target="_blank"
                        NavigateUrl='<%#GetRssUrl(Convert.ToString(Eval("Id"))) %>' />
                </td>
            </tr>
            <%if (Settings_Category.General.ShowDescription)
              { %>
            <tr align="left">
                <td align="left" valign="top">
                    <asp:Label  runat="server" Text='<%#Convert.ToString(Eval("Description"))%>' />
                </td>
            </tr>
            <%}%>
        </table>
    </ItemTemplate>
</asp:DataList>
