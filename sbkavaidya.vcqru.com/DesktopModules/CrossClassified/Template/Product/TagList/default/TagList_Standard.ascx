<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TagList.ascx.cs" Inherits="Cross.Modules.CP_Product.View.TagList" %>
<style type="text/css">
    a.Tag1
    {
        font-size: 0.7em;
        font-weight: 100;
        color: #2F5FC2;
    }
    
    a.Tag2
    {
        font-size: 0.8em;
        font-weight: 200;
        color: #AC1BF2;
    }
    
    a.Tag3
    {
        font-size: 0.9em;
        font-weight: 300;
        color: #9E6FC5;
    }
    
    a.Tag4
    {
        font-size: 1.0em;
        font-weight: 400;
        color: #FBA426;
    }
    
    a.Tag5
    {
        font-size: 1.2em;
        font-weight: 500;
        color: #2739CF;
    }
    
    a.Tag6
    {
        font-size: 1.4em;
        font-weight: 600;
        color: #C8A453;
    }
    
    a.Tag7
    {
        font-size: 1.6em;
        font-weight: 700;
        color: #AB2846;
    }
    
    a.Tag8
    {
        font-size: 1.8em;
        font-weight: 800;
        color: #666666;
    }
    
    a.Tag9
    {
        font-size: 2.0em;
        font-weight: 900;
        color: #333333;
    }
    
    a.Tag10
    {
        font-size: 2.2em;
        font-weight: 900;
        color: #3A6EA5;
    }
</style>
<asp:DataList ID="dlTag" runat="server" RepeatColumns="<%#Settings_TagList.General.ColCount %>">
    <ItemTemplate>
        <table width="100%" border="0" cellpadding="0" cellspacing="1">
            <tr align="left">
                <td align="left" valign="top">
                    <%if (Settings_TagList.General.DisplayProductCounts)
                      { %>
                    <asp:HyperLink CssClass='<%#Convert.ToString(Eval("CloudCssLevel")) %>' ID="lnkName"
                        runat="server" Text='<%# Convert.ToString(Eval("Tag")) +"(" +Convert.ToString(Eval("ProductCounts"))+")" %>'
                        Target="<%# Settings_TagList.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>' />
                    <%}
                      else
                      { %>
                    <asp:HyperLink CssClass='<%#Convert.ToString(Eval("CloudCssLevel")) %>' ID="HyperLink1"
                        runat="server" Text='<%# Convert.ToString(Eval("Tag")) %>' Target="<%# Settings_TagList.General.Target%>"
                        NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>' />
                    <%} %>
                    <asp:HyperLink ID="lnkRss" ImageUrl="~/desktopmodules/CrossClassified/Images/feed-icon-12x12.gif"
                        runat="server" Visible="<%#Settings_TagList.General.DisplayRss %>" Target="_blank"
                        NavigateUrl='<%#GetRssUrl(Convert.ToString(Eval("Id"))) %>' />
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>