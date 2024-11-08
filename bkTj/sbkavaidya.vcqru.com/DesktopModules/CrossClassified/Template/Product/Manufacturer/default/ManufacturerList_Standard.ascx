<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManufacturerList.ascx.cs"
    Inherits="Cross.Modules.CP_Product.View.ManufacturerList" %>

<asp:DataList ID="dlManufacturer" runat="server"   RepeatColumns="<%#Settings_Manufacturer.General.ColCount %>" 
    RepeatDirection="Horizontal" RepeatLayout="table">
    <ItemTemplate>
        <table width="100%" border="0" cellpadding="0" cellspacing="1">
            <%if (Settings_Manufacturer.General.ShowImage)
              { %>
            <tr align="left">
                <td align="left">
                    <asp:HyperLink ID="hlImage" runat="server" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>'
                        Target="<%# Settings_Manufacturer.General.Target%>">
                        <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_Manufacturer.General.ImageWidth)%>'
                            BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='imgManufacturer'
                            ImageAlign="Left" />
                    </asp:HyperLink>
                </td>
            </tr>
            <%} %>

             <%if (Settings_Manufacturer.General.ShowName)
              { %>
            <tr align="left">
                <td align="left" valign="top">
                    <%if (Settings_Manufacturer.General.ShowProductCounts){ %>
                      
                    <asp:HyperLink  ID="lnkName" runat="server" Text='<%# Convert.ToString(Eval("Name")) +"(" +Convert.ToString(Eval("ProductCounts"))+")" %>'
                        Target="<%# Settings_Manufacturer.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>'  />
                    <%}
                      else
                      { %>
                    <asp:HyperLink  ID="HyperLink1" runat="server" Text='<%# Convert.ToString(Eval("Name")) %>'
                        Target="<%# Settings_Manufacturer.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>' />
                    <%} %>
                    <asp:HyperLink  ID="lnkRss" ImageUrl="~/desktopmodules/CrossClassified/Images/feed-icon-12x12.gif"
                        runat="server" Visible="<%#Settings_Manufacturer.General.DisplayRss %>" Target="_blank"
                        NavigateUrl='<%#GetRssUrl(Convert.ToString(Eval("Id"))) %>' />
                </td>
            </tr>
             <%} %>

            <%if (Settings_Manufacturer.General.ShowDescription)
              { %>
            <tr align="left">
                <td align="left" valign="top">
                    <asp:Label  runat="server" Text='<%#Server.HtmlDecode(Convert.ToString(Eval("Description")))%>' />
                </td>
            </tr>
            <%}%>

        </table>
    </ItemTemplate>
</asp:DataList>
