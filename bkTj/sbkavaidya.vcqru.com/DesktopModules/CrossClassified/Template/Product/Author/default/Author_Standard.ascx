<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Author.ascx.cs" Inherits="Cross.Modules.CP_Product.View.Author" %>
<asp:DataList ID="dlAuthor" runat="server" RepeatColumns="<%#Settings_Author.General.ColCount %>">
    <ItemTemplate>
        <table width="100%" border="0" cellpadding="0" cellspacing="1">
            <tr >
                <td  style="white-space: nowrap">
                    <%if (Settings_Author.General.DisplayAvatar)
                      { %>
                    <asp:Image ID="imgAvatar" runat="server" ImageUrl='<%#GetAuthorAvatar(Eval("UserId").ToString(),Eval("AvatarEmail").ToString()) %>' Width="32px"
                        ImageAlign="AbsMiddle"></asp:Image>
                    <%}%>
                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Convert.ToString(Eval("DisplayName")) %>'
                        Target="<%# Settings_Author.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("UserId"))) %>' />
                    <asp:HyperLink ID="lnkRss" ImageUrl="~/desktopmodules/CrossClassified/Images/feed-icon-12x12.gif"
                        runat="server" Visible="<%#Settings_Author.General.DisplayRss %>" Target="_blank"
                        NavigateUrl='<%#GetRssUrl(Convert.ToString(Eval("UserId"))) %>' />
                </td>
            </tr>
            <%if (Settings_Author.General.ShowVendorCompany)
              { %>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="lblVendorCompany" runat="server" resourcekey="lblVendorCompany" />
                    <asp:Label ID="lblVendorCompanyData" runat="server" Text='<%# Convert.ToString(Eval("Company")) %>' />
                </td>
            </tr>
            <%}%>
            <%if (Settings_Author.General.ShowLocation_Country)
              { %>
            <tr>
                <td>
                    <asp:Label ID="lblCountry" runat="server" resourcekey="lblCountry" />
                    <asp:Label ID="lblCountryData" runat="server" Text='<%#Eval("Country") %>' />
                </td>
            </tr>
            <%} %>
            <%if (Settings_Author.General.ShowLocation_State)
              { %>
            <tr>
                <td>
                    <asp:Label ID="lblState" runat="server" resourcekey="lblState" />
                    <asp:Label ID="lblStateData" runat="server" Text='<%#Eval("State") %>' />
                </td>
            </tr>
            <%} %>
            <%if (Settings_Author.General.ShowLocation_City)
              { %>
            <tr>
                <td>
                    <asp:Label ID="lblCity" runat="server" resourcekey="lblCity" />
                    <asp:Label ID="lblCityData" runat="server" Text='<%#Eval("City") %>' />
                </td>
            </tr>
            <%} %>
            <%if (Settings_Author.General.ShowLocation_Town)
              { %>
            <tr>
                <td>
                    <asp:Label ID="lblTown" runat="server" resourcekey="lblTown" />
                    <asp:Label ID="lblTownData" runat="server" Text='<%#Eval("Town") %>' />
                </td>
            </tr>
            <%} %>
        </table>
    </ItemTemplate>
</asp:DataList>