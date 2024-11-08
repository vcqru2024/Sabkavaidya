<%@ Control Language="VB" AutoEventWireup="false" CodeFile="AccountLink.ascx.vb"
    Inherits="Cross.Modules.CP_Product.SkinObject.AccountLink" %>
<%  If (ShowCartLink AndAlso (Settings_Portal.Feature.EnableAuction Or Settings_Portal.Feature.EnableFixedPrice)) Then%>
<asp:HyperLink ID="hlCart" runat="server">
    <asp:Image ID="imgCart" runat="server" ImageUrl="~/desktopmodules/CrossClassified/Images/mycart.gif" />
    <asp:Label ID="lblCart" runat="server" />
</asp:HyperLink>
&nbsp;|&nbsp;
<%  End If%>

<%  If (ShowOrderLink AndAlso (Settings_Portal.Feature.EnableAuction Or Settings_Portal.Feature.EnableFixedPrice)) Then%>
<asp:HyperLink ID="hlOrder" runat="server">
    <asp:Label ID="lblOrder" runat="server" />
</asp:HyperLink>
&nbsp;|&nbsp;
<%  End If%>

<%  If (ShowProductLink AndAlso (Settings_Portal.Feature.EnableAuction Or Settings_Portal.Feature.EnableFixedPrice)) Then%>
<asp:HyperLink ID="hlProduct" runat="server">
    <asp:Label ID="lblProduct" runat="server" />
</asp:HyperLink>
&nbsp;|&nbsp;
<%  End If%>

<%  If (ShowAuctionLink AndAlso (Settings_Portal.Feature.EnableAuction)) Then%>
<asp:HyperLink ID="hlAuction" runat="server">
    <asp:Label ID="lblAuction" runat="server" />
</asp:HyperLink>
&nbsp;|&nbsp;
<%  End If%>


<%  If ShowAccountLink Then%>
<asp:HyperLink ID="hlAccount" runat="server">
    <asp:Label ID="lblAccount" runat="server" />
</asp:HyperLink>
&nbsp;|&nbsp;
<%  End If%>

<%  If (ShowHelpLink AndAlso (Settings_Portal.General.ModulePage_Help <> -1)) Then%>
<asp:HyperLink ID="hlHelp" runat="server">
    <asp:Image ID="imgHelp" runat="server" ImageUrl="~/Images/action_help.gif" />
    <asp:Label ID="lblHelp" runat="server" />
</asp:HyperLink>
<%  End If%>