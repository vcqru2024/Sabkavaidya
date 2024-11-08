<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdListTab.ascx.cs" Inherits="Cross.Modules.CP_Product.View.AdListTab" %>
<asp:Literal runat="server" ID="litTabCss"></asp:Literal>
<script type="text/javascript">
    $(function () {
        var tabsCounts = '<%=Tabs.Count%>';

        //only display jquery tabs when currently have more than 1 tabs to show
        if (parseInt(tabsCounts) > 0) {

            var divTabs = '#' + '<%=divTabs.ClientID%>';
            var heightStyle = '<%=Settings_ListTab.JqueryTab.HeightStyle%>';
            var activeMode = '<%=Settings_ListTab.JqueryTab.ActiveMode%>';
            var rotateInterval = '<%=Settings_ListTab.JqueryTab.RotateInterval%>';
            var startTab = '<%=Settings_ListTab.JqueryTab.StartTab%>';

            if (activeMode.toLowerCase() == "click") {
                $(divTabs).tabs({ event: 'click' });
                if (parseInt(startTab) < tabsCounts) {
                    $(divTabs).tabs("option", "active", startTab);
                }
            }

            if (activeMode.toLowerCase() == "hover") {
                $(divTabs).tabs({ event: 'mouseover' });
                if (parseInt(startTab) < tabsCounts) {
                    $(divTabs).tabs("option", "active", startTab);
                }
            }

            if (activeMode.toLowerCase() == "autorotate") {
                $(divTabs).tabs({ event: 'click' });

                if (parseInt(tabsCounts) > 1) {
                    i = 0; // current tab
                    //auto-rotate every n seconds
                    setInterval(function () {
                        i = (++i < parseInt(tabsCounts) ? i : 0);
                        $(divTabs).tabs("option", "active", i);
                    }, parseInt(rotateInterval) * 1000);
                }
            }
        }
    });
</script>
<div id="divTabs" runat="server" style="width: 100%; overflow: hidden">
    <ul>
        <%if (Tabs.Count > 0)
          {%>
        <li><a href="<%# '#'+ divTab1.ClientID %>"><span>
            <%# Tabs.Count > 0?Tabs[0].Text:"Tab 1"%></span></a> </li>
        <%} %>
        <%if (Tabs.Count > 1)
          {%>
        <li><a href="<%# '#'+ divTab2.ClientID %>"><span>
            <%# Tabs.Count > 1?Tabs[1].Text:"Tab 2"%></span></a> </li>
        <%} %>
        <%if (Tabs.Count > 2)
          {%>
        <li><a href="<%# '#'+ divTab3.ClientID %>"><span>
            <%# Tabs.Count > 2?Tabs[2].Text:"Tab 3"%></span></a> </li>
        <%} %>
        <%if (Tabs.Count > 3)
          {%>
        <li><a href="<%# '#'+ divTab4.ClientID %>"><span>
            <%# Tabs.Count > 3?Tabs[3].Text:"Tab 4"%></span></a> </li>
        <%} %>
        <%if (Tabs.Count > 4)
          {%>
        <li><a href="<%# '#'+ divTab5.ClientID %>"><span>
            <%# Tabs.Count > 4?Tabs[4].Text:"Tab 5"%></span></a> </li>
        <%} %>
        <%if (Tabs.Count > 5)
          {%>
        <li><a href="<%# '#'+ divTab6.ClientID %>"><span>
            <%# Tabs.Count > 5?Tabs[5].Text:"Tab 6"%></span></a> </li>
        <%} %>
        <%if (Tabs.Count > 6)
          {%>
        <li><a href="<%# '#'+ divTab7.ClientID %>"><span>
            <%# Tabs.Count > 6?Tabs[6].Text:"Tab7"%></span></a> </li>
        <%} %>
        <%if (Tabs.Count > 7)
          {%>
        <li><a href="<%# '#'+ divTab8.ClientID %>"><span>
            <%# Tabs.Count > 7?Tabs[7].Text:"Tab 8"%></span></a> </li>
        <%} %>
    </ul>
    <%if (Tabs.Count > 0)
      {%>
    <div id="divTab1" runat="server" style="height: 100%">
        <asp:DataList ID="dlProduct1" runat="server" RepeatColumns="<%#Settings_ListTab.General.ColCount %>"
            RepeatDirection="Horizontal" RepeatLayout="table" Width="100%" OnItemDataBound="dlProduct1_ItemDataBound">
            <ItemTemplate>
                <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                <table width="100%" border="0" cellpadding="0" cellspacing="1">
                    <tr align="left">
                        <td>
                            <%if (Settings_ListTab.Image.ShowImage)
                              { %>
                            <asp:HyperLink ID="hlImage" runat="server" NavigateUrl='<%# GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name")))%>'
                                Target="<%#Settings_ListTab.General.LinkTarget%>" Title='<%#Convert.ToString(Eval("Name"))%>'>
                                <%if (Settings_ListTab.Image.ForceImageWidth && Settings_ListTab.Image.ForceImageHeight)
                                  { %>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_ListTab.Image.ImageWidth)%>'
                                    Height='<%#Convert.ToInt32(Settings_ListTab.Image.ImageHeight)%>' BorderStyle="Solid"
                                    BorderWidth="1" BorderColor="DarkGray" ID='imgProduct' ImageAlign="Left" />
                                <%}
                                  else if (Settings_ListTab.Image.ForceImageWidth)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_ListTab.Image.ImageWidth)%>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image1' ImageAlign="Left" />
                                <%}
                                  else if (Settings_ListTab.Image.ForceImageHeight)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Height='<%#Convert.ToInt32(Settings_ListTab.Image.ImageHeight)%>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image2' ImageAlign="Left" />
                                <% }
                                  else
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' BorderStyle="Solid" BorderWidth="1"
                                    BorderColor="DarkGray" ID='Image3' ImageAlign="Left" />
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
                                        <asp:HyperLink ID="hlName" runat="server" Visible="<%#Settings_ListTab.Content.ShowName %>"
                                            Text='<%# Server.HtmlDecode(Convert.ToString(Eval("Name"))) %>' NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name"))) %>'
                                            Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowUserName)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUserName" runat="server" resourcekey="lblUserName" />
                                        <asp:HyperLink ID="hlUserName" runat="server" Text='<%# Eval("UserName") %>' NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>'
                                            Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowVendorCompany)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblVendorCompany" runat="server" resourcekey="lblVendorCompany" />
                                        <asp:HyperLink ID="hlVendorCompany" runat="server" Text='<%# GetVendorCompany(Convert.ToString(Eval("UserId"))) %>'
                                            NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>' Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgRating" runat="server" Visible="<%#Settings_ListTab.Content.ShowRating %>"
                                            ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblViews" runat="server" resourcekey="lblViews" Visible="<%#Settings_ListTab.Content.ShowViews %>" />
                                        <asp:Label ID="ViewsLabel" runat="server" Text='<%# Eval("Views") %>' Visible="<%#Settings_ListTab.Content.ShowViews %>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowLocation_Country && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCountry" runat="server" resourcekey="lblCountry" />
                                        <asp:Label ID="lblCountryData" runat="server" Text='<%#Eval("Country") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_State && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblState" runat="server" resourcekey="lblState" />
                                        <asp:Label ID="lblStateData" runat="server" Text='<%#Eval("State") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_City && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCity" runat="server" resourcekey="lblCity" />
                                        <asp:Label ID="lblCityData" runat="server" Text='<%#Eval("City") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_Town && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTown" runat="server" resourcekey="lblTown" />
                                        <asp:Label ID="lblTownData" runat="server" Text='<%#Eval("Town") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowSku && CurrentType.FieldEnable_Sku)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSku" runat="server" resourcekey="lblSku" />
                                        <asp:Label ID="SkuLabel" runat="server" Text='<%#Eval("Sku") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowWeight && CurrentType.FieldEnable_Weight)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblWeight" runat="server" resourcekey="lblWeight" />
                                        <asp:Label ID="WeightLabel" runat="server" Text='<%#Eval("Weight") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowPrice && CurrentType.FieldEnable_Price)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPurchasePrice" runat="server" resourcekey="lblPurchasePrice" />
                                        <asp:Label ID="PurchasePriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PurchasePrice")) %>'
                                            CssClass='<%# GetPriceCss(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoPrice" runat="server" resourcekey="lblPromoPrice" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                        <asp:Label ID="PromoPriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PromoPrice")) %>'
                                            CssClass='NormalRed' Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoStart" runat="server" resourcekey="lblPromoStart" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoStart %>' />
                                        <asp:Label ID="PromoStartLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("PromoStart"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoStart")).ToShortDateString() %>'
                                            Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoStart %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoEnd" runat="server" resourcekey="lblPromoEnd" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoEnd %>' />
                                        <asp:Label ID="PromoEndLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("PromoEnd"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoEnd")).ToShortDateString() %>'
                                            Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoEnd %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate" Visible="<%#Settings_ListTab.Content.ShowCreatedDate%>" />
                                        <asp:Label ID="CreatedDateLabel" runat="server" Text='<%# Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString() %>'
                                            Visible="<%#Settings_ListTab.Content.ShowCreatedDate %>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFeatured" runat="server" resourcekey="lblFeatured" Visible="<%#Settings_ListTab.Content.ShowFeaturedField %>" />
                                        <asp:CheckBox ID="chkFeatured" runat="server" Checked='<%# Convert.ToBoolean(Eval("Featured")) %>'
                                            Visible="<%#Settings_ListTab.Content.ShowFeaturedField %>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowSummary && CurrentType.FieldEnable_Summary)
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
                                            cellpadding="0">
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <%} %>
    <%if (Tabs.Count > 1)
      {%>
    <div id="divTab2" runat="server" style="height: 100%">
        <asp:DataList ID="dlProduct2" runat="server" RepeatColumns="<%#Settings_ListTab.General.ColCount %>"
            RepeatDirection="Horizontal" RepeatLayout="table" Width="100%" OnItemDataBound="dlProduct2_ItemDataBound">
            <ItemTemplate>
                <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                <table width="100%" border="0" cellpadding="0" cellspacing="1">
                    <tr align="left">
                        <td>
                            <%if (Settings_ListTab.Image.ShowImage)
                              { %>
                            <asp:HyperLink ID="hlImage" runat="server" NavigateUrl='<%# GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name")))%>'
                                Target="<%#Settings_ListTab.General.LinkTarget%>" Title='<%#Convert.ToString(Eval("Name"))%>'>
                                <%if (Settings_ListTab.Image.ForceImageWidth && Settings_ListTab.Image.ForceImageHeight)
                                  { %>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_ListTab.Image.ImageWidth)%>'
                                    Height='<%#Convert.ToInt32(Settings_ListTab.Image.ImageHeight)%>' BorderStyle="Solid"
                                    BorderWidth="1" BorderColor="DarkGray" ID='imgProduct' ImageAlign="Left" />
                                <%}
                                  else if (Settings_ListTab.Image.ForceImageWidth)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_ListTab.Image.ImageWidth)%>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image1' ImageAlign="Left" />
                                <%}
                                  else if (Settings_ListTab.Image.ForceImageHeight)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Height='<%#Convert.ToInt32(Settings_ListTab.Image.ImageHeight)%>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image2' ImageAlign="Left" />
                                <% }
                                  else
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' BorderStyle="Solid" BorderWidth="1"
                                    BorderColor="DarkGray" ID='Image3' ImageAlign="Left" />
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
                                        <asp:HyperLink ID="hlName" runat="server" Visible="<%#Settings_ListTab.Content.ShowName %>"
                                            Text='<%# Server.HtmlDecode(Convert.ToString(Eval("Name"))) %>' NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name"))) %>'
                                            Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowUserName)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUserName" runat="server" resourcekey="lblUserName" />
                                        <asp:HyperLink ID="hlUserName" runat="server" Text='<%# Eval("UserName") %>' NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>'
                                            Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowVendorCompany)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblVendorCompany" runat="server" resourcekey="lblVendorCompany" />
                                        <asp:HyperLink ID="hlVendorCompany" runat="server" Text='<%# GetVendorCompany(Convert.ToString(Eval("UserId"))) %>'
                                            NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>' Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgRating" runat="server" Visible="<%#Settings_ListTab.Content.ShowRating %>"
                                            ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblViews" runat="server" resourcekey="lblViews" Visible="<%#Settings_ListTab.Content.ShowViews %>" />
                                        <asp:Label ID="ViewsLabel" runat="server" Text='<%# Eval("Views") %>' Visible="<%#Settings_ListTab.Content.ShowViews %>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowLocation_Country && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCountry" runat="server" resourcekey="lblCountry" />
                                        <asp:Label ID="lblCountryData" runat="server" Text='<%#Eval("Country") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_State && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblState" runat="server" resourcekey="lblState" />
                                        <asp:Label ID="lblStateData" runat="server" Text='<%#Eval("State") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_City && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCity" runat="server" resourcekey="lblCity" />
                                        <asp:Label ID="lblCityData" runat="server" Text='<%#Eval("City") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_Town && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTown" runat="server" resourcekey="lblTown" />
                                        <asp:Label ID="lblTownData" runat="server" Text='<%#Eval("Town") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowSku && CurrentType.FieldEnable_Sku)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSku" runat="server" resourcekey="lblSku" />
                                        <asp:Label ID="SkuLabel" runat="server" Text='<%#Eval("Sku") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowWeight && CurrentType.FieldEnable_Weight)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblWeight" runat="server" resourcekey="lblWeight" />
                                        <asp:Label ID="WeightLabel" runat="server" Text='<%#Eval("Weight") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowPrice && CurrentType.FieldEnable_Price)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPurchasePrice" runat="server" resourcekey="lblPurchasePrice" />
                                        <asp:Label ID="PurchasePriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PurchasePrice")) %>'
                                            CssClass='<%# GetPriceCss(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoPrice" runat="server" resourcekey="lblPromoPrice" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                        <asp:Label ID="PromoPriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PromoPrice")) %>'
                                            CssClass='NormalRed' Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoStart" runat="server" resourcekey="lblPromoStart" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoStart %>' />
                                        <asp:Label ID="PromoStartLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("PromoStart"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoStart")).ToShortDateString() %>'
                                            Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoStart %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoEnd" runat="server" resourcekey="lblPromoEnd" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoEnd %>' />
                                        <asp:Label ID="PromoEndLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("PromoEnd"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoEnd")).ToShortDateString() %>'
                                            Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoEnd %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate" Visible="<%#Settings_ListTab.Content.ShowCreatedDate%>" />
                                        <asp:Label ID="CreatedDateLabel" runat="server" Text='<%# Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString() %>'
                                            Visible="<%#Settings_ListTab.Content.ShowCreatedDate %>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFeatured" runat="server" resourcekey="lblFeatured" Visible="<%#Settings_ListTab.Content.ShowFeaturedField %>" />
                                        <asp:CheckBox ID="chkFeatured" runat="server" Checked='<%# Convert.ToBoolean(Eval("Featured")) %>'
                                            Visible="<%#Settings_ListTab.Content.ShowFeaturedField %>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowSummary && CurrentType.FieldEnable_Summary)
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
                                            cellpadding="0">
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <%} %>
    <%if (Tabs.Count > 2)
      {%>
    <div id="divTab3" runat="server" style="height: 100%">
        <asp:DataList ID="dlProduct3" runat="server" RepeatColumns="<%#Settings_ListTab.General.ColCount %>"
            RepeatDirection="Horizontal" RepeatLayout="table" Width="100%" OnItemDataBound="dlProduct3_ItemDataBound">
            <ItemTemplate>
                <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                <table width="100%" border="0" cellpadding="0" cellspacing="1">
                    <tr align="left">
                        <td>
                            <%if (Settings_ListTab.Image.ShowImage)
                              { %>
                            <asp:HyperLink ID="hlImage" runat="server" NavigateUrl='<%# GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name")))%>'
                                Target="<%#Settings_ListTab.General.LinkTarget%>" Title='<%#Convert.ToString(Eval("Name"))%>'>
                                <%if (Settings_ListTab.Image.ForceImageWidth && Settings_ListTab.Image.ForceImageHeight)
                                  { %>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_ListTab.Image.ImageWidth)%>'
                                    Height='<%#Convert.ToInt32(Settings_ListTab.Image.ImageHeight)%>' BorderStyle="Solid"
                                    BorderWidth="1" BorderColor="DarkGray" ID='imgProduct' ImageAlign="Left" />
                                <%}
                                  else if (Settings_ListTab.Image.ForceImageWidth)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_ListTab.Image.ImageWidth)%>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image1' ImageAlign="Left" />
                                <%}
                                  else if (Settings_ListTab.Image.ForceImageHeight)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Height='<%#Convert.ToInt32(Settings_ListTab.Image.ImageHeight)%>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image2' ImageAlign="Left" />
                                <% }
                                  else
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' BorderStyle="Solid" BorderWidth="1"
                                    BorderColor="DarkGray" ID='Image3' ImageAlign="Left" />
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
                                        <asp:HyperLink ID="hlName" runat="server" Visible="<%#Settings_ListTab.Content.ShowName %>"
                                            Text='<%# Server.HtmlDecode(Convert.ToString(Eval("Name"))) %>' NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name"))) %>'
                                            Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowUserName)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUserName" runat="server" resourcekey="lblUserName" />
                                        <asp:HyperLink ID="hlUserName" runat="server" Text='<%# Eval("UserName") %>' NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>'
                                            Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowVendorCompany)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblVendorCompany" runat="server" resourcekey="lblVendorCompany" />
                                        <asp:HyperLink ID="hlVendorCompany" runat="server" Text='<%# GetVendorCompany(Convert.ToString(Eval("UserId"))) %>'
                                            NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>' Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgRating" runat="server" Visible="<%#Settings_ListTab.Content.ShowRating %>"
                                            ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblViews" runat="server" resourcekey="lblViews" Visible="<%#Settings_ListTab.Content.ShowViews %>" />
                                        <asp:Label ID="ViewsLabel" runat="server" Text='<%# Eval("Views") %>' Visible="<%#Settings_ListTab.Content.ShowViews %>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowLocation_Country && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCountry" runat="server" resourcekey="lblCountry" />
                                        <asp:Label ID="lblCountryData" runat="server" Text='<%#Eval("Country") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_State && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblState" runat="server" resourcekey="lblState" />
                                        <asp:Label ID="lblStateData" runat="server" Text='<%#Eval("State") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_City && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCity" runat="server" resourcekey="lblCity" />
                                        <asp:Label ID="lblCityData" runat="server" Text='<%#Eval("City") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_Town && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTown" runat="server" resourcekey="lblTown" />
                                        <asp:Label ID="lblTownData" runat="server" Text='<%#Eval("Town") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowSku && CurrentType.FieldEnable_Sku)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSku" runat="server" resourcekey="lblSku" />
                                        <asp:Label ID="SkuLabel" runat="server" Text='<%#Eval("Sku") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowWeight && CurrentType.FieldEnable_Weight)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblWeight" runat="server" resourcekey="lblWeight" />
                                        <asp:Label ID="WeightLabel" runat="server" Text='<%#Eval("Weight") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowPrice && CurrentType.FieldEnable_Price)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPurchasePrice" runat="server" resourcekey="lblPurchasePrice" />
                                        <asp:Label ID="PurchasePriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PurchasePrice")) %>'
                                            CssClass='<%# GetPriceCss(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoPrice" runat="server" resourcekey="lblPromoPrice" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                        <asp:Label ID="PromoPriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PromoPrice")) %>'
                                            CssClass='NormalRed' Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoStart" runat="server" resourcekey="lblPromoStart" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoStart %>' />
                                        <asp:Label ID="PromoStartLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("PromoStart"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoStart")).ToShortDateString() %>'
                                            Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoStart %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoEnd" runat="server" resourcekey="lblPromoEnd" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoEnd %>' />
                                        <asp:Label ID="PromoEndLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("PromoEnd"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoEnd")).ToShortDateString() %>'
                                            Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoEnd %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate" Visible="<%#Settings_ListTab.Content.ShowCreatedDate%>" />
                                        <asp:Label ID="CreatedDateLabel" runat="server" Text='<%# Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString() %>'
                                            Visible="<%#Settings_ListTab.Content.ShowCreatedDate %>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFeatured" runat="server" resourcekey="lblFeatured" Visible="<%#Settings_ListTab.Content.ShowFeaturedField %>" />
                                        <asp:CheckBox ID="chkFeatured" runat="server" Checked='<%# Convert.ToBoolean(Eval("Featured")) %>'
                                            Visible="<%#Settings_ListTab.Content.ShowFeaturedField %>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowSummary && CurrentType.FieldEnable_Summary)
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
                                            cellpadding="0">
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <%} %>
    <%if (Tabs.Count > 3)
      {%>
    <div id="divTab4" runat="server" style="height: 100%">
        <asp:DataList ID="dlProduct4" runat="server" RepeatColumns="<%#Settings_ListTab.General.ColCount %>"
            RepeatDirection="Horizontal" RepeatLayout="table" Width="100%" OnItemDataBound="dlProduct4_ItemDataBound">
            <ItemTemplate>
                <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                <table width="100%" border="0" cellpadding="0" cellspacing="1">
                    <tr align="left">
                        <td>
                            <%if (Settings_ListTab.Image.ShowImage)
                              { %>
                            <asp:HyperLink ID="hlImage" runat="server" NavigateUrl='<%# GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name")))%>'
                                Target="<%#Settings_ListTab.General.LinkTarget%>" Title='<%#Convert.ToString(Eval("Name"))%>'>
                                <%if (Settings_ListTab.Image.ForceImageWidth && Settings_ListTab.Image.ForceImageHeight)
                                  { %>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_ListTab.Image.ImageWidth)%>'
                                    Height='<%#Convert.ToInt32(Settings_ListTab.Image.ImageHeight)%>' BorderStyle="Solid"
                                    BorderWidth="1" BorderColor="DarkGray" ID='imgProduct' ImageAlign="Left" />
                                <%}
                                  else if (Settings_ListTab.Image.ForceImageWidth)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_ListTab.Image.ImageWidth)%>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image1' ImageAlign="Left" />
                                <%}
                                  else if (Settings_ListTab.Image.ForceImageHeight)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Height='<%#Convert.ToInt32(Settings_ListTab.Image.ImageHeight)%>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image2' ImageAlign="Left" />
                                <% }
                                  else
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' BorderStyle="Solid" BorderWidth="1"
                                    BorderColor="DarkGray" ID='Image3' ImageAlign="Left" />
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
                                        <asp:HyperLink ID="hlName" runat="server" Visible="<%#Settings_ListTab.Content.ShowName %>"
                                            Text='<%# Server.HtmlDecode(Convert.ToString(Eval("Name"))) %>' NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name"))) %>'
                                            Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowUserName)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUserName" runat="server" resourcekey="lblUserName" />
                                        <asp:HyperLink ID="hlUserName" runat="server" Text='<%# Eval("UserName") %>' NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>'
                                            Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowVendorCompany)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblVendorCompany" runat="server" resourcekey="lblVendorCompany" />
                                        <asp:HyperLink ID="hlVendorCompany" runat="server" Text='<%# GetVendorCompany(Convert.ToString(Eval("UserId"))) %>'
                                            NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>' Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgRating" runat="server" Visible="<%#Settings_ListTab.Content.ShowRating %>"
                                            ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblViews" runat="server" resourcekey="lblViews" Visible="<%#Settings_ListTab.Content.ShowViews %>" />
                                        <asp:Label ID="ViewsLabel" runat="server" Text='<%# Eval("Views") %>' Visible="<%#Settings_ListTab.Content.ShowViews %>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowLocation_Country && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCountry" runat="server" resourcekey="lblCountry" />
                                        <asp:Label ID="lblCountryData" runat="server" Text='<%#Eval("Country") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_State && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblState" runat="server" resourcekey="lblState" />
                                        <asp:Label ID="lblStateData" runat="server" Text='<%#Eval("State") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_City && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCity" runat="server" resourcekey="lblCity" />
                                        <asp:Label ID="lblCityData" runat="server" Text='<%#Eval("City") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_Town && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTown" runat="server" resourcekey="lblTown" />
                                        <asp:Label ID="lblTownData" runat="server" Text='<%#Eval("Town") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowSku && CurrentType.FieldEnable_Sku)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSku" runat="server" resourcekey="lblSku" />
                                        <asp:Label ID="SkuLabel" runat="server" Text='<%#Eval("Sku") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowWeight && CurrentType.FieldEnable_Weight)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblWeight" runat="server" resourcekey="lblWeight" />
                                        <asp:Label ID="WeightLabel" runat="server" Text='<%#Eval("Weight") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowPrice && CurrentType.FieldEnable_Price)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPurchasePrice" runat="server" resourcekey="lblPurchasePrice" />
                                        <asp:Label ID="PurchasePriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PurchasePrice")) %>'
                                            CssClass='<%# GetPriceCss(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoPrice" runat="server" resourcekey="lblPromoPrice" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                        <asp:Label ID="PromoPriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PromoPrice")) %>'
                                            CssClass='NormalRed' Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoStart" runat="server" resourcekey="lblPromoStart" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoStart %>' />
                                        <asp:Label ID="PromoStartLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("PromoStart"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoStart")).ToShortDateString() %>'
                                            Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoStart %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoEnd" runat="server" resourcekey="lblPromoEnd" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoEnd %>' />
                                        <asp:Label ID="PromoEndLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("PromoEnd"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoEnd")).ToShortDateString() %>'
                                            Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoEnd %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate" Visible="<%#Settings_ListTab.Content.ShowCreatedDate%>" />
                                        <asp:Label ID="CreatedDateLabel" runat="server" Text='<%# Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString() %>'
                                            Visible="<%#Settings_ListTab.Content.ShowCreatedDate %>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFeatured" runat="server" resourcekey="lblFeatured" Visible="<%#Settings_ListTab.Content.ShowFeaturedField %>" />
                                        <asp:CheckBox ID="chkFeatured" runat="server" Checked='<%# Convert.ToBoolean(Eval("Featured")) %>'
                                            Visible="<%#Settings_ListTab.Content.ShowFeaturedField %>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowSummary && CurrentType.FieldEnable_Summary)
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
                                            cellpadding="0">
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <%} %>
    <%if (Tabs.Count > 4)
      {%>
    <div id="divTab5" runat="server" style="height: 100%">
        <asp:DataList ID="dlProduct5" runat="server" RepeatColumns="<%#Settings_ListTab.General.ColCount %>"
            RepeatDirection="Horizontal" RepeatLayout="table" Width="100%" OnItemDataBound="dlProduct5_ItemDataBound">
            <ItemTemplate>
                <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                <table width="100%" border="0" cellpadding="0" cellspacing="1">
                    <tr align="left">
                        <td>
                            <%if (Settings_ListTab.Image.ShowImage)
                              { %>
                            <asp:HyperLink ID="hlImage" runat="server" NavigateUrl='<%# GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name")))%>'
                                Target="<%#Settings_ListTab.General.LinkTarget%>" Title='<%#Convert.ToString(Eval("Name"))%>'>
                                <%if (Settings_ListTab.Image.ForceImageWidth && Settings_ListTab.Image.ForceImageHeight)
                                  { %>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_ListTab.Image.ImageWidth)%>'
                                    Height='<%#Convert.ToInt32(Settings_ListTab.Image.ImageHeight)%>' BorderStyle="Solid"
                                    BorderWidth="1" BorderColor="DarkGray" ID='imgProduct' ImageAlign="Left" />
                                <%}
                                  else if (Settings_ListTab.Image.ForceImageWidth)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_ListTab.Image.ImageWidth)%>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image1' ImageAlign="Left" />
                                <%}
                                  else if (Settings_ListTab.Image.ForceImageHeight)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Height='<%#Convert.ToInt32(Settings_ListTab.Image.ImageHeight)%>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image2' ImageAlign="Left" />
                                <% }
                                  else
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' BorderStyle="Solid" BorderWidth="1"
                                    BorderColor="DarkGray" ID='Image3' ImageAlign="Left" />
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
                                        <asp:HyperLink ID="hlName" runat="server" Visible="<%#Settings_ListTab.Content.ShowName %>"
                                            Text='<%# Server.HtmlDecode(Convert.ToString(Eval("Name"))) %>' NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name"))) %>'
                                            Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowUserName)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUserName" runat="server" resourcekey="lblUserName" />
                                        <asp:HyperLink ID="hlUserName" runat="server" Text='<%# Eval("UserName") %>' NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>'
                                            Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowVendorCompany)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblVendorCompany" runat="server" resourcekey="lblVendorCompany" />
                                        <asp:HyperLink ID="hlVendorCompany" runat="server" Text='<%# GetVendorCompany(Convert.ToString(Eval("UserId"))) %>'
                                            NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>' Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgRating" runat="server" Visible="<%#Settings_ListTab.Content.ShowRating %>"
                                            ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblViews" runat="server" resourcekey="lblViews" Visible="<%#Settings_ListTab.Content.ShowViews %>" />
                                        <asp:Label ID="ViewsLabel" runat="server" Text='<%# Eval("Views") %>' Visible="<%#Settings_ListTab.Content.ShowViews %>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowLocation_Country && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCountry" runat="server" resourcekey="lblCountry" />
                                        <asp:Label ID="lblCountryData" runat="server" Text='<%#Eval("Country") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_State && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblState" runat="server" resourcekey="lblState" />
                                        <asp:Label ID="lblStateData" runat="server" Text='<%#Eval("State") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_City && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCity" runat="server" resourcekey="lblCity" />
                                        <asp:Label ID="lblCityData" runat="server" Text='<%#Eval("City") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_Town && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTown" runat="server" resourcekey="lblTown" />
                                        <asp:Label ID="lblTownData" runat="server" Text='<%#Eval("Town") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowSku && CurrentType.FieldEnable_Sku)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSku" runat="server" resourcekey="lblSku" />
                                        <asp:Label ID="SkuLabel" runat="server" Text='<%#Eval("Sku") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowWeight && CurrentType.FieldEnable_Weight)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblWeight" runat="server" resourcekey="lblWeight" />
                                        <asp:Label ID="WeightLabel" runat="server" Text='<%#Eval("Weight") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowPrice && CurrentType.FieldEnable_Price)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPurchasePrice" runat="server" resourcekey="lblPurchasePrice" />
                                        <asp:Label ID="PurchasePriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PurchasePrice")) %>'
                                            CssClass='<%# GetPriceCss(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoPrice" runat="server" resourcekey="lblPromoPrice" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                        <asp:Label ID="PromoPriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PromoPrice")) %>'
                                            CssClass='NormalRed' Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoStart" runat="server" resourcekey="lblPromoStart" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoStart %>' />
                                        <asp:Label ID="PromoStartLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("PromoStart"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoStart")).ToShortDateString() %>'
                                            Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoStart %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoEnd" runat="server" resourcekey="lblPromoEnd" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoEnd %>' />
                                        <asp:Label ID="PromoEndLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("PromoEnd"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoEnd")).ToShortDateString() %>'
                                            Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoEnd %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate" Visible="<%#Settings_ListTab.Content.ShowCreatedDate%>" />
                                        <asp:Label ID="CreatedDateLabel" runat="server" Text='<%# Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString() %>'
                                            Visible="<%#Settings_ListTab.Content.ShowCreatedDate %>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFeatured" runat="server" resourcekey="lblFeatured" Visible="<%#Settings_ListTab.Content.ShowFeaturedField %>" />
                                        <asp:CheckBox ID="chkFeatured" runat="server" Checked='<%# Convert.ToBoolean(Eval("Featured")) %>'
                                            Visible="<%#Settings_ListTab.Content.ShowFeaturedField %>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowSummary && CurrentType.FieldEnable_Summary)
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
                                            cellpadding="0">
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <%} %>
    <%if (Tabs.Count > 5)
      {%>
    <div id="divTab6" runat="server" style="height: 100%">
        <asp:DataList ID="dlProduct6" runat="server" RepeatColumns="<%#Settings_ListTab.General.ColCount %>"
            RepeatDirection="Horizontal" RepeatLayout="table" Width="100%" OnItemDataBound="dlProduct6_ItemDataBound">
            <ItemTemplate>
                <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                <table width="100%" border="0" cellpadding="0" cellspacing="1">
                    <tr align="left">
                        <td>
                            <%if (Settings_ListTab.Image.ShowImage)
                              { %>
                            <asp:HyperLink ID="hlImage" runat="server" NavigateUrl='<%# GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name")))%>'
                                Target="<%#Settings_ListTab.General.LinkTarget%>" Title='<%#Convert.ToString(Eval("Name"))%>'>
                                <%if (Settings_ListTab.Image.ForceImageWidth && Settings_ListTab.Image.ForceImageHeight)
                                  { %>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_ListTab.Image.ImageWidth)%>'
                                    Height='<%#Convert.ToInt32(Settings_ListTab.Image.ImageHeight)%>' BorderStyle="Solid"
                                    BorderWidth="1" BorderColor="DarkGray" ID='imgProduct' ImageAlign="Left" />
                                <%}
                                  else if (Settings_ListTab.Image.ForceImageWidth)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_ListTab.Image.ImageWidth)%>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image1' ImageAlign="Left" />
                                <%}
                                  else if (Settings_ListTab.Image.ForceImageHeight)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Height='<%#Convert.ToInt32(Settings_ListTab.Image.ImageHeight)%>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image2' ImageAlign="Left" />
                                <% }
                                  else
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' BorderStyle="Solid" BorderWidth="1"
                                    BorderColor="DarkGray" ID='Image3' ImageAlign="Left" />
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
                                        <asp:HyperLink ID="hlName" runat="server" Visible="<%#Settings_ListTab.Content.ShowName %>"
                                            Text='<%# Server.HtmlDecode(Convert.ToString(Eval("Name"))) %>' NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name"))) %>'
                                            Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowUserName)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUserName" runat="server" resourcekey="lblUserName" />
                                        <asp:HyperLink ID="hlUserName" runat="server" Text='<%# Eval("UserName") %>' NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>'
                                            Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowVendorCompany)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblVendorCompany" runat="server" resourcekey="lblVendorCompany" />
                                        <asp:HyperLink ID="hlVendorCompany" runat="server" Text='<%# GetVendorCompany(Convert.ToString(Eval("UserId"))) %>'
                                            NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>' Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgRating" runat="server" Visible="<%#Settings_ListTab.Content.ShowRating %>"
                                            ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblViews" runat="server" resourcekey="lblViews" Visible="<%#Settings_ListTab.Content.ShowViews %>" />
                                        <asp:Label ID="ViewsLabel" runat="server" Text='<%# Eval("Views") %>' Visible="<%#Settings_ListTab.Content.ShowViews %>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowLocation_Country && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCountry" runat="server" resourcekey="lblCountry" />
                                        <asp:Label ID="lblCountryData" runat="server" Text='<%#Eval("Country") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_State && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblState" runat="server" resourcekey="lblState" />
                                        <asp:Label ID="lblStateData" runat="server" Text='<%#Eval("State") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_City && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCity" runat="server" resourcekey="lblCity" />
                                        <asp:Label ID="lblCityData" runat="server" Text='<%#Eval("City") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_Town && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTown" runat="server" resourcekey="lblTown" />
                                        <asp:Label ID="lblTownData" runat="server" Text='<%#Eval("Town") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowSku && CurrentType.FieldEnable_Sku)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSku" runat="server" resourcekey="lblSku" />
                                        <asp:Label ID="SkuLabel" runat="server" Text='<%#Eval("Sku") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowWeight && CurrentType.FieldEnable_Weight)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblWeight" runat="server" resourcekey="lblWeight" />
                                        <asp:Label ID="WeightLabel" runat="server" Text='<%#Eval("Weight") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowPrice && CurrentType.FieldEnable_Price)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPurchasePrice" runat="server" resourcekey="lblPurchasePrice" />
                                        <asp:Label ID="PurchasePriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PurchasePrice")) %>'
                                            CssClass='<%# GetPriceCss(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoPrice" runat="server" resourcekey="lblPromoPrice" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                        <asp:Label ID="PromoPriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PromoPrice")) %>'
                                            CssClass='NormalRed' Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoStart" runat="server" resourcekey="lblPromoStart" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoStart %>' />
                                        <asp:Label ID="PromoStartLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("PromoStart"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoStart")).ToShortDateString() %>'
                                            Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoStart %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoEnd" runat="server" resourcekey="lblPromoEnd" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoEnd %>' />
                                        <asp:Label ID="PromoEndLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("PromoEnd"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoEnd")).ToShortDateString() %>'
                                            Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoEnd %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate" Visible="<%#Settings_ListTab.Content.ShowCreatedDate%>" />
                                        <asp:Label ID="CreatedDateLabel" runat="server" Text='<%# Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString() %>'
                                            Visible="<%#Settings_ListTab.Content.ShowCreatedDate %>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFeatured" runat="server" resourcekey="lblFeatured" Visible="<%#Settings_ListTab.Content.ShowFeaturedField %>" />
                                        <asp:CheckBox ID="chkFeatured" runat="server" Checked='<%# Convert.ToBoolean(Eval("Featured")) %>'
                                            Visible="<%#Settings_ListTab.Content.ShowFeaturedField %>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowSummary && CurrentType.FieldEnable_Summary)
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
                                            cellpadding="0">
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <%} %>
    <%if (Tabs.Count > 6)
      {%>
    <div id="divTab7" runat="server" style="height: 100%">
        <asp:DataList ID="dlProduct7" runat="server" RepeatColumns="<%#Settings_ListTab.General.ColCount %>"
            RepeatDirection="Horizontal" RepeatLayout="table" Width="100%" OnItemDataBound="dlProduct7_ItemDataBound">
            <ItemTemplate>
                <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                <table width="100%" border="0" cellpadding="0" cellspacing="1">
                    <tr align="left">
                        <td>
                            <%if (Settings_ListTab.Image.ShowImage)
                              { %>
                            <asp:HyperLink ID="hlImage" runat="server" NavigateUrl='<%# GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name")))%>'
                                Target="<%#Settings_ListTab.General.LinkTarget%>" Title='<%#Convert.ToString(Eval("Name"))%>'>
                                <%if (Settings_ListTab.Image.ForceImageWidth && Settings_ListTab.Image.ForceImageHeight)
                                  { %>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_ListTab.Image.ImageWidth)%>'
                                    Height='<%#Convert.ToInt32(Settings_ListTab.Image.ImageHeight)%>' BorderStyle="Solid"
                                    BorderWidth="1" BorderColor="DarkGray" ID='imgProduct' ImageAlign="Left" />
                                <%}
                                  else if (Settings_ListTab.Image.ForceImageWidth)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_ListTab.Image.ImageWidth)%>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image1' ImageAlign="Left" />
                                <%}
                                  else if (Settings_ListTab.Image.ForceImageHeight)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Height='<%#Convert.ToInt32(Settings_ListTab.Image.ImageHeight)%>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image2' ImageAlign="Left" />
                                <% }
                                  else
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' BorderStyle="Solid" BorderWidth="1"
                                    BorderColor="DarkGray" ID='Image3' ImageAlign="Left" />
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
                                        <asp:HyperLink ID="hlName" runat="server" Visible="<%#Settings_ListTab.Content.ShowName %>"
                                            Text='<%# Server.HtmlDecode(Convert.ToString(Eval("Name"))) %>' NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name"))) %>'
                                            Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowUserName)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUserName" runat="server" resourcekey="lblUserName" />
                                        <asp:HyperLink ID="hlUserName" runat="server" Text='<%# Eval("UserName") %>' NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>'
                                            Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowVendorCompany)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblVendorCompany" runat="server" resourcekey="lblVendorCompany" />
                                        <asp:HyperLink ID="hlVendorCompany" runat="server" Text='<%# GetVendorCompany(Convert.ToString(Eval("UserId"))) %>'
                                            NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>' Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgRating" runat="server" Visible="<%#Settings_ListTab.Content.ShowRating %>"
                                            ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblViews" runat="server" resourcekey="lblViews" Visible="<%#Settings_ListTab.Content.ShowViews %>" />
                                        <asp:Label ID="ViewsLabel" runat="server" Text='<%# Eval("Views") %>' Visible="<%#Settings_ListTab.Content.ShowViews %>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowLocation_Country && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCountry" runat="server" resourcekey="lblCountry" />
                                        <asp:Label ID="lblCountryData" runat="server" Text='<%#Eval("Country") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_State && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblState" runat="server" resourcekey="lblState" />
                                        <asp:Label ID="lblStateData" runat="server" Text='<%#Eval("State") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_City && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCity" runat="server" resourcekey="lblCity" />
                                        <asp:Label ID="lblCityData" runat="server" Text='<%#Eval("City") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_Town && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTown" runat="server" resourcekey="lblTown" />
                                        <asp:Label ID="lblTownData" runat="server" Text='<%#Eval("Town") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowSku && CurrentType.FieldEnable_Sku)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSku" runat="server" resourcekey="lblSku" />
                                        <asp:Label ID="SkuLabel" runat="server" Text='<%#Eval("Sku") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowWeight && CurrentType.FieldEnable_Weight)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblWeight" runat="server" resourcekey="lblWeight" />
                                        <asp:Label ID="WeightLabel" runat="server" Text='<%#Eval("Weight") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowPrice && CurrentType.FieldEnable_Price)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPurchasePrice" runat="server" resourcekey="lblPurchasePrice" />
                                        <asp:Label ID="PurchasePriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PurchasePrice")) %>'
                                            CssClass='<%# GetPriceCss(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoPrice" runat="server" resourcekey="lblPromoPrice" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                        <asp:Label ID="PromoPriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PromoPrice")) %>'
                                            CssClass='NormalRed' Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoStart" runat="server" resourcekey="lblPromoStart" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoStart %>' />
                                        <asp:Label ID="PromoStartLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("PromoStart"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoStart")).ToShortDateString() %>'
                                            Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoStart %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoEnd" runat="server" resourcekey="lblPromoEnd" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoEnd %>' />
                                        <asp:Label ID="PromoEndLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("PromoEnd"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoEnd")).ToShortDateString() %>'
                                            Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoEnd %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate" Visible="<%#Settings_ListTab.Content.ShowCreatedDate%>" />
                                        <asp:Label ID="CreatedDateLabel" runat="server" Text='<%# Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString() %>'
                                            Visible="<%#Settings_ListTab.Content.ShowCreatedDate %>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFeatured" runat="server" resourcekey="lblFeatured" Visible="<%#Settings_ListTab.Content.ShowFeaturedField %>" />
                                        <asp:CheckBox ID="chkFeatured" runat="server" Checked='<%# Convert.ToBoolean(Eval("Featured")) %>'
                                            Visible="<%#Settings_ListTab.Content.ShowFeaturedField %>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowSummary && CurrentType.FieldEnable_Summary)
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
                                            cellpadding="0">
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <%} %>
    <%if (Tabs.Count > 7)
      {%>
    <div id="divTab8" runat="server" style="height: 100%">
        <asp:DataList ID="dlProduct8" runat="server" RepeatColumns="<%#Settings_ListTab.General.ColCount %>"
            RepeatDirection="Horizontal" RepeatLayout="table" Width="100%" OnItemDataBound="dlProduct8_ItemDataBound">
            <ItemTemplate>
                <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                <table width="100%" border="0" cellpadding="0" cellspacing="1">
                    <tr align="left">
                        <td>
                            <%if (Settings_ListTab.Image.ShowImage)
                              { %>
                            <asp:HyperLink ID="hlImage" runat="server" NavigateUrl='<%# GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name")))%>'
                                Target="<%#Settings_ListTab.General.LinkTarget%>" Title='<%#Convert.ToString(Eval("Name"))%>'>
                                <%if (Settings_ListTab.Image.ForceImageWidth && Settings_ListTab.Image.ForceImageHeight)
                                  { %>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_ListTab.Image.ImageWidth)%>'
                                    Height='<%#Convert.ToInt32(Settings_ListTab.Image.ImageHeight)%>' BorderStyle="Solid"
                                    BorderWidth="1" BorderColor="DarkGray" ID='imgProduct' ImageAlign="Left" />
                                <%}
                                  else if (Settings_ListTab.Image.ForceImageWidth)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_ListTab.Image.ImageWidth)%>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image1' ImageAlign="Left" />
                                <%}
                                  else if (Settings_ListTab.Image.ForceImageHeight)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Height='<%#Convert.ToInt32(Settings_ListTab.Image.ImageHeight)%>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image2' ImageAlign="Left" />
                                <% }
                                  else
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' BorderStyle="Solid" BorderWidth="1"
                                    BorderColor="DarkGray" ID='Image3' ImageAlign="Left" />
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
                                        <asp:HyperLink ID="hlName" runat="server" Visible="<%#Settings_ListTab.Content.ShowName %>"
                                            Text='<%# Server.HtmlDecode(Convert.ToString(Eval("Name"))) %>' NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")), Convert.ToString(Eval("Name"))) %>'
                                            Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowUserName)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUserName" runat="server" resourcekey="lblUserName" />
                                        <asp:HyperLink ID="hlUserName" runat="server" Text='<%# Eval("UserName") %>' NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>'
                                            Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowVendorCompany)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblVendorCompany" runat="server" resourcekey="lblVendorCompany" />
                                        <asp:HyperLink ID="hlVendorCompany" runat="server" Text='<%# GetVendorCompany(Convert.ToString(Eval("UserId"))) %>'
                                            NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>' Target="<%#Settings_ListTab.General.LinkTarget%>" />
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgRating" runat="server" Visible="<%#Settings_ListTab.Content.ShowRating %>"
                                            ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblViews" runat="server" resourcekey="lblViews" Visible="<%#Settings_ListTab.Content.ShowViews %>" />
                                        <asp:Label ID="ViewsLabel" runat="server" Text='<%# Eval("Views") %>' Visible="<%#Settings_ListTab.Content.ShowViews %>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowLocation_Country && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCountry" runat="server" resourcekey="lblCountry" />
                                        <asp:Label ID="lblCountryData" runat="server" Text='<%#Eval("Country") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_State && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblState" runat="server" resourcekey="lblState" />
                                        <asp:Label ID="lblStateData" runat="server" Text='<%#Eval("State") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_City && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCity" runat="server" resourcekey="lblCity" />
                                        <asp:Label ID="lblCityData" runat="server" Text='<%#Eval("City") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowLocation_Town && CurrentType.AllowLocation)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTown" runat="server" resourcekey="lblTown" />
                                        <asp:Label ID="lblTownData" runat="server" Text='<%#Eval("Town") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowSku && CurrentType.FieldEnable_Sku)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSku" runat="server" resourcekey="lblSku" />
                                        <asp:Label ID="SkuLabel" runat="server" Text='<%#Eval("Sku") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowWeight && CurrentType.FieldEnable_Weight)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblWeight" runat="server" resourcekey="lblWeight" />
                                        <asp:Label ID="WeightLabel" runat="server" Text='<%#Eval("Weight") %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <%if (Settings_ListTab.Content.ShowPrice && CurrentType.FieldEnable_Price)
                                  { %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPurchasePrice" runat="server" resourcekey="lblPurchasePrice" />
                                        <asp:Label ID="PurchasePriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PurchasePrice")) %>'
                                            CssClass='<%# GetPriceCss(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoPrice" runat="server" resourcekey="lblPromoPrice" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                        <asp:Label ID="PromoPriceLabel" runat="server" Text='<%#Settings_Portal.Order.CurrencySymbol+Convert.ToString(Eval("PromoPrice")) %>'
                                            CssClass='NormalRed' Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoStart" runat="server" resourcekey="lblPromoStart" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoStart %>' />
                                        <asp:Label ID="PromoStartLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("PromoStart"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoStart")).ToShortDateString() %>'
                                            Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoStart %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPromoEnd" runat="server" resourcekey="lblPromoEnd" Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoEnd %>' />
                                        <asp:Label ID="PromoEndLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("PromoEnd"))==DotNetNuke.Common.Utilities.Null.NullDate?"":Convert.ToDateTime(Eval("PromoEnd")).ToShortDateString() %>'
                                            Visible='<%#PromoPriceAvailable(Convert.ToString(Eval("Id")))&&Settings_ListTab.Content.ShowPromoEnd %>' />
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate" Visible="<%#Settings_ListTab.Content.ShowCreatedDate%>" />
                                        <asp:Label ID="CreatedDateLabel" runat="server" Text='<%# Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString() %>'
                                            Visible="<%#Settings_ListTab.Content.ShowCreatedDate %>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFeatured" runat="server" resourcekey="lblFeatured" Visible="<%#Settings_ListTab.Content.ShowFeaturedField %>" />
                                        <asp:CheckBox ID="chkFeatured" runat="server" Checked='<%# Convert.ToBoolean(Eval("Featured")) %>'
                                            Visible="<%#Settings_ListTab.Content.ShowFeaturedField %>" />
                                    </td>
                                </tr>
                                <%if (Settings_ListTab.Content.ShowSummary && CurrentType.FieldEnable_Summary)
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
                                            cellpadding="0">
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <%} %>
</div>
