<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccountLink.ascx.cs" Inherits="Cross.Modules.CP_Product.View.AccountLink" %>

<%if (Settings_AccountLink.General.ShowCart && (Settings_Portal.Feature.EnableAuction || Settings_Portal.Feature.EnableFixedPrice))
  { %>
<asp:HyperLink  ID="hlCart" runat="server" >
    <asp:Image ID="imgCart" runat="server" ImageUrl="~/desktopmodules/CrossClassified/Images/mycart.gif"
       />
    <asp:Label ID="lblCart" runat="server"  />
</asp:HyperLink>
&nbsp;|&nbsp;
<%}%>

<%if (Settings_AccountLink.General.ShowOrder && (Settings_Portal.Feature.EnableAuction || Settings_Portal.Feature.EnableFixedPrice))
  { %>
<asp:HyperLink ID="hlOrder" runat="server" >
    <asp:Label ID="lblOrder" runat="server"  resourcekey="lblOrder"/>
</asp:HyperLink>
&nbsp;|&nbsp;
<%}%>

<%if (Settings_AccountLink.General.ShowProduct && (Settings_Portal.Feature.EnableAuction || Settings_Portal.Feature.EnableFixedPrice))
  { %>
<asp:HyperLink ID="hlProduct" runat="server" >
    <asp:Label ID="lblProduct" runat="server"   resourcekey="lblProduct"/>
</asp:HyperLink>
&nbsp;|&nbsp;
<%}%>

<%if (ShowAuction)
  { %>
<asp:HyperLink ID="hlAuction" runat="server" >
    <asp:Label ID="lblAuction" runat="server"   resourcekey="lblAuction"/>
</asp:HyperLink>
&nbsp;|&nbsp;
<%}%>


<%if (Settings_AccountLink.General.ShowAccount)
  { %>
<asp:HyperLink ID="hlAccount" runat="server">
    <asp:Label ID="lblAccount" runat="server"  resourcekey="lblAccount"/>
</asp:HyperLink>
&nbsp;|&nbsp;
<%}%>

<%if (Settings_AccountLink.General.ShowHelp && (Settings_Portal.General.ModulePage_Help != -1))
  { %>
<asp:HyperLink ID="hlHelp" runat="server" Target="<%# Settings_AccountLink.General.Target%>">
    <asp:Image ID="imgHelp" runat="server" ImageUrl="~/Images/action_help.gif"  />
    <asp:Label ID="lblHelp" runat="server"  resourcekey="lblHelp"/>
</asp:HyperLink>
<%}%>
