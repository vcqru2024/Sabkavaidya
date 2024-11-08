<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdDetail.ascx.cs"
    Inherits="Cross.Modules.CP_Product.View.AdDetail" %>
<%@ Register TagPrefix="Cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<style type="text/css">
.CrossGrid th{
  text-align:center;
}
</style>
<script type="text/javascript">
 
    function initializeMap() {
        var showGoogleMap = '<%=ShowGoogleMap%>';
        if (showGoogleMap.toLowerCase() != "true") {
            return;
        }
        // initlize google map options
        var latlng = new google.maps.LatLng(parseFloat('<%=objProduct.Latitude%>'), parseFloat('<%=objProduct.Longitude%>'));

        var myOptions = {
            zoom: parseInt('<%=Settings_Detail.GoogleMap.GoogleMapZoom%>'),
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map($('#divGoogleMap')[0], myOptions);

        var marker = new google.maps.Marker({
            position: latlng,
            map: map,
            title: "<%=MapTitle%>"
        });
        return map;
    }

    $(function () {
        initializeMap();
        var tabsCounts = '<%=TabCounts%>';
        //Switch google map display
        var map = null;
        var showGoogleMap = '<%=ShowGoogleMap%>';

        //only display jquery tabs when currently have more than 1 tabs to show
        if (parseInt(tabsCounts) > 1) {
            $("#tabs").tabs();
            $("#tabs").tabs({
                activate: function (event, ui) {
                    //Get or set the active option, after initialization:
                    var currentActive = $("#tabs").tabs("option", "active");
                    //set it to a hidden field
                    $("#<%= hidLastTab.ClientID %>").attr("value", currentActive.toString());

                    if (ui.newPanel.attr('id') == 'divGoogleMap' && !map && showGoogleMap.toLowerCase() == "true") {
                        map = initializeMap();
                        google.maps.event.trigger(map, 'resize');
                    }
                }
            });

            var currTab = $("#<%= hidLastTab.ClientID %>").val();
            if (!isNaN(parseInt(currTab)))//if current value is number, then parse it as integer
            {
                currTab = parseInt(currTab);
            }

            // $("#tabs").tabs({ selected: currTab });
            $("#tabs").tabs({ active: currTab });
        }

        var showRelatedImages = '<%=ShowRelatedImage%>';
        //using fancy box plug-in to display related images as gallery when ShowRelatedImage==true
        if (showRelatedImages.toLowerCase() == "true") {
            $('.fancybox-buttons').fancybox({
                openEffect: 'none',
                closeEffect: 'none',

                prevEffect: 'none',
                nextEffect: 'none',

                closeBtn: false,

                helpers: {
                    title: {
                        type: 'inside'
                    },
                    buttons: {}
                },

                afterLoad: function () {
                    this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
                }
            });
        }
   
    });
</script>


<asp:HiddenField runat="server" ID="hidLastTab" Value="0" />

 <table id="tblPassword" cellspacing="2" cellpadding="2" visible="false" width="100%" align="center" class="dnnFormItem"
    runat="server">
    <tr>
        <td>
            <asp:Label ID="lblPassword" runat="server" resourcekey="lblPassword"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" Width="200px"></asp:TextBox>
             <asp:Button ID="btnConfirmPassword" runat="server" resourcekey="btnConfirmPassword" CssClass="dnnPrimaryAction"
                CausesValidation="False" OnClick="btnConfirmPassword_Click"></asp:Button>&nbsp; &nbsp;
            <asp:Label ID="lblInvalidPassword" runat="server" resourcekey="lblInvalidPassword" Visible="false" ForeColor="Red"></asp:Label>
        </td>
    </tr>
</table>
<div runat="server" id="divContent" style="width: 100%; overflow:hidden">
<!--    Product information  table -->
<table cellspacing="2" cellpadding="2" width="100%" class="Normal">
    <tr>
        <td align="left" colspan="2">
            <asp:Label ID="lblProductName" CssClass="Head" runat="server" Text="<%#objProduct.Name%>"
                Visible='<%#Settings_Detail.General.ShowName%>' />
                &nbsp;&nbsp;&nbsp;&nbsp;
               <asp:hyperlink ID="hlNewVersion" runat="server"  Target="_blank" resourcekey="hlNewVersion" Visible="false"
               />
                &nbsp;&nbsp;&nbsp;&nbsp;
      
            <%if (Settings_Detail.General.ShowPrint)
              { %>
            &nbsp;&nbsp;&nbsp;&nbsp; <a href="#" onclick="javascript:window.print();return false;"
                style="cursor: hand">
                <asp:Image ID="imgPrint" runat="server" ImageUrl="~/images/print.gif" />
                <asp:Label ID="lblPrint" runat="server" resourcekey="lblPrint" />
            </a>
            <%} %>
           
            <%if (Settings_Detail.General.ShowReturn)
              { %>

            <script type="text/javascript">
                if (document.referrer) {
                    var localeReturn = '<%=DotNetNuke.UI.Utilities.ClientAPI.GetSafeJSString(Localization.GetString("Return", LocalResourceFile))%>';
                    var str = document.referrer;
                    str = '&nbsp;&nbsp;&nbsp;&nbsp;<a href="' + str + '">' + localeReturn + '</a>';
                    document.write(str);
                }
            </script>

            <%} %>

             <%if (Settings_Detail.General.ShowAddWatch)
              { %>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <dnn:CommandButton ID="btnAddWatch" runat="server" ResourceKey="btnAddWatch" ImageUrl="~/desktopmodules/crossclassified/images/watch.png"
                OnCommand="btnAddWatch_Click" CausesValidation="false" />&nbsp;
              <asp:Label ID="lblWatchAddSuccess" runat="server" resourcekey="Tip_WatchAddSuccess" ForeColor="Green"
                            Visible="false"></asp:Label>
            <%} %>
            <%if (Settings_Detail.General.ShowAddTicket)
              { %>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <dnn:CommandButton ID="btnAddTicket" runat="server" ResourceKey="btnAddTicket" ImageUrl="~/images/action_help.gif"
                OnCommand="btnAddTicket_Click" CausesValidation="false" />
            <%} %>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr>
          <!--    product image -->
        <td  runat="server" id="tdImage" valign="top" 
            visible="<%#Settings_Detail.MainImage.ShowMainImage && !string.IsNullOrEmpty(objProduct.Image.Trim())%>"
            >
            <table>
                <tr>
                    <td>
                        <a href="<%=GetRelativeUrlByFileId(objProduct.Image) %>" target="_blank"
                            title="<%#objProduct.Name%>">
                            <%if (Settings_Detail.MainImage.ForceImageWidth && Settings_Detail.MainImage.ForceImageHeight)
                                      { %>
                            <asp:Image runat="server" ImageUrl='<%#GetRelativeUrlByFileId(objProduct.Image)%>'
                                Width='<%#Convert.ToInt32(Settings_Detail.MainImage.MainImageWidth)%>' Height='<%#Convert.ToInt32(Settings_Detail.MainImage.MainImageHeight)%>'
                                BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='imgProduct' ToolTip="Click to view full image" />
                            <%}
                                      else if (Settings_Detail.MainImage.ForceImageWidth)
                                      {%>
                            <asp:Image runat="server" ImageUrl='<%#GetRelativeUrlByFileId(objProduct.Image)%>'
                                Width='<%#Convert.ToInt32(Settings_Detail.MainImage.MainImageWidth)%>' BorderStyle="Solid"
                                BorderWidth="1" BorderColor="DarkGray" ID='Image4' ToolTip="Click to view full image" />
                            <%}
                                      else if (Settings_Detail.MainImage.ForceImageHeight)
                                      {%>
                            <asp:Image runat="server" ImageUrl='<%#GetRelativeUrlByFileId(objProduct.Image)%>'
                                Height='<%#Convert.ToInt32(Settings_Detail.MainImage.MainImageHeight)%>' BorderStyle="Solid"
                                BorderWidth="1" BorderColor="DarkGray" ID='Image5' ToolTip="Click to view full image" />
                            <% }
                                      else
                                      {%>
                            <asp:Image runat="server" ImageUrl='<%#GetRelativeUrlByFileId(objProduct.Image)%>'
                                BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image3' ToolTip="Click to view full image" />
                            <%} %>
                        </a>
                    </td>
                </tr>
                  <tr>
                      <td>
                          <!--  related Image  -->
                          <%if (ShowRelatedImage)
                            {%>
                          <asp:DataList ID="dlRelatedImage" runat="server" ItemStyle-HorizontalAlign="Left"
                              RepeatColumns='<%#Settings_Detail.RelatedImage.RelatedImagePerRow%>'>
                              <ItemTemplate>
                               
                                  <asp:HyperLink ID="hlImage" runat="server" NavigateUrl='<%#Eval("ImagePath")%>' Target="_blank"
                                      Title='<%#Convert.ToString(Eval("Title")) %>' CssClass="fancybox-buttons" data-fancybox-group="button">
                                      <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' BorderStyle="Solid" BorderWidth="1"
                                          Width='<%#Settings_Detail.RelatedImage.RelatedImageWidth%>'
                                          Height='<%#Settings_Detail.RelatedImage.RelatedImageHeight%>' BorderColor="DarkGray"
                                          ID='Image3' ImageAlign="Left" />
                                  </asp:HyperLink>
                              </ItemTemplate>
                          </asp:DataList>
                          <%} %>
                      </td>
                  </tr>
              </table>
        </td>
          <!--    end product image -->
        <td valign="top" align="left">
            <table id="Table1" cellspacing="2" cellpadding="2" width="100%"  align="left" runat="server">
                  <!-- Creator -->
                <tr id="Tr1" runat="server" visible="<%#Settings_Detail.General.ShowAuthor %>">
                    <td  style="width:120px">
                        <asp:Label ID="lblCreator" ResourceKey="lblCreator" runat="server"  />
                    </td>
                    <td>
                        <!-- user avatar-->
                          <%if (Settings_Detail.General.ShowAuthorAvatar && Settings_Detail.General.ShowAuthor)
                            {%>
                            <asp:Image ID="imgAuthorAvatar" runat="server" Width="48px"
                            ImageUrl='<%#GetAuthorAvatar(objAuthor.UserId.ToString(),objAuthor.AvatarEmail) %>'
                            ImageAlign="AbsMiddle"></asp:Image>
                        <%} %>
                        <!-- user name-->
                        <asp:HyperLink ID="hlUserName" runat="server" Text="<%#objProduct.UserName%>" NavigateUrl='<%#GetUserNavigate(objProduct.UserId.ToString()) %>'
                            Target="_blank" />
                    </td>
                </tr>
                  <!--    country-->
                 <tr id="Tr15"   runat="server" visible="<%#Settings_Detail.General.ShowLocation_Country 
                 && objType.AllowLocation && !string.IsNullOrEmpty(objProduct.Country)%>">
                    <td>
                        <asp:Label ID="lblLocationCountry" runat="server" resourcekey="lblLocationCountry"></asp:Label>
                    </td>
                    <td>
                        <%#objProduct.Country %>
                    </td>
                </tr>
                    <!--    State-->
                 <tr id="Tr16"  runat="server" visible="<%#Settings_Detail.General.ShowLocation_State 
                 && objType.AllowLocation && !string.IsNullOrEmpty(objProduct.State)%>">
                    <td>
                        <asp:Label ID="lblLocationState" runat="server" resourcekey="lblLocationState"></asp:Label>
                    </td>
                    <td>
                        <%#objProduct.State %>
                    </td>
                </tr>
                   <!--    City-->
                 <tr id="Tr17"    runat="server" visible="<%#Settings_Detail.General.ShowLocation_City 
                 && objType.AllowLocation && !string.IsNullOrEmpty(objProduct.City)%>">
                    <td>
                        <asp:Label ID="lblLocationCity" runat="server" resourcekey="lblLocationCity"></asp:Label>
                    </td>
                    <td>
                        <%#objProduct.City %>
                    </td>
                </tr>
                   <!--    Town-->
                 <tr id="Tr18"    runat="server" visible="<%#Settings_Detail.General.ShowLocation_Town 
                 && objType.AllowLocation && !string.IsNullOrEmpty(objProduct.Town)%>">
                    <td>
                        <asp:Label ID="lblLocationTown" runat="server" resourcekey="lblLocationTown"></asp:Label>
                    </td>
                    <td>
                        <%#objProduct.Town %>
                    </td>
                </tr>
               
                  <!--    sku -->
                 <tr id="Tr2"  runat="server" visible="<%#Settings_Detail.General.ShowSku && objType.FieldEnable_Sku%>">
                    <td>
                        <asp:Label ID="lblSku" runat="server" resourcekey="lblSku"></asp:Label>
                    </td>
                    <td>
                        <%#objProduct.Sku %>
                    </td>
                </tr>
                  <!--    Weight -->
                  <tr id="Tr3"  runat="server" visible="<%#Settings_Detail.General.ShowWeight && objType.FieldEnable_Weight%>">
                    <td>
                        <asp:Label ID="lblWeight" runat="server" resourcekey="lblWeight"></asp:Label>
                    </td>
                    <td>
                        <%#objProduct.Weight.ToString() + Settings_Portal.Order.WeightSymbol %>
                    </td>
                </tr>
              
                  <!--    views -->
                <tr id="Tr4" runat="server" visible="<%#Settings_Detail.General.ShowViews%>">
                    <td>
                        <asp:Label ID="lblViews" runat="server" resourcekey="lblViews"></asp:Label>
                    </td>
                    <td>
                        <%#objProduct.Views %>
                    </td>
                </tr>
                  <!--    rating -->
                 <tr id="Tr5" align="left" runat="server" 
                 visible="<%# Settings_Portal.Rating.AllowRating && Settings_Detail.Rating.ShowRating && ( Sellable ||  objProduct.AllowRating )%>">
                     <td>
                         <asp:Label ID="lblRatingVotes" resourcekey="lblRatingVotes" runat="server"></asp:Label>
                         <asp:Label ID="lblVotes" runat="server"></asp:Label>&nbsp;&nbsp;
                     </td>
                     <td>
                         <asp:Label ID="lblAverage" resourcekey="lblAverage" runat="server"></asp:Label>&nbsp;&nbsp;
                         <asp:Image ID="imgAverage" runat="server"></asp:Image>&nbsp;&nbsp;
                     </td>
                 </tr>

               <!--    PublishDate, normally don't need in fixed price product -->
                 <tr id="Tr6" runat="server" visible="<%#Settings_Detail.General.ShowPublishDate%>">
                    <td>
                        <asp:Label ID="lblPublishDate" runat="server" resourcekey="lblPublishDate"></asp:Label>
                    </td>
                    <td>
                        <%#objProduct.PublishDate.ToShortDateString() %>
                    </td>
                </tr>
                 <tr id="Tr7"  runat="server" visible="<%#Settings_Detail.General.ShowExpireDate%>">
                    <td>
                        <asp:Label ID="lblExpireDate" runat="server" resourcekey="lblExpireDate"></asp:Label>
                    </td>
                    <td>
                        <%#GetShortDate(objProduct.ExpireDate)%>
                    </td>
                </tr>
                 <!--    Last Modified Date -->
                 <tr id="Tr8"  runat="server" visible="<%#Settings_Detail.General.ShowLastModifiedDate%>">
                    <td>
                        <asp:Label ID="lblLastModifiedDate" runat="server" resourcekey="lblLastModifiedDate"></asp:Label>
                    </td>
                    <td>
                        <%#objProduct.LastModifiedDate.ToShortDateString() %>
                    </td>
                </tr>
                 <!--   customize attributes-->
                 <tr>
                    <td colspan="2">
                        <table runat="server" id="tblUserDefinedField"  border="0" cellspacing="0"
                            cellpadding="0" class="Normal" align="left">
                        </table>
                    </td>
                </tr>
                <!--   summary -->
                    <tr id="Tr9" valign="top" runat="server" visible="<%#Settings_Detail.General.ShowSummary && objType.FieldEnable_Summary%>">
                    <td colspan="2">
                        &nbsp;&nbsp;<%#Server.HtmlDecode(objProduct.Summary) %>
                    </td>
                </tr>
                  <!--  tags  -->
                <tr id="Tr10" runat="server" visible="<%#Settings_Detail.Tag.ShowTags %>">
                    <td>
                        <asp:Label ID="lblTags" runat="server" resourcekey="lblTags"></asp:Label>
                    </td>
                    <td>
                        <asp:DataList ID="dlTags" runat="server" RepeatColumns="<%#Settings_Detail.Tag.TagsPerRow%>"
                            Width="100%">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlTag" runat="server" NavigateUrl='<%#GetTagNavigate(Convert.ToString(Eval("TagId")))%>'
                                    Target="_blank" Text='<%#Convert.ToString(Eval("Tag")) %>'>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                </tr>
            
                  <!--  purchase price  -->
                <tr id="Tr11" runat="server" visible="<%#Settings_Detail.Order.ShowPrice && objType.FieldEnable_Price%>">
                    <td>
                        <asp:Label ID="lblPurchasePrice" runat="server" resourcekey="lblPurchasePrice" />
                    </td>
                    <td >
                     <asp:Label ID="lblPurchasePriceField" runat="server"  cssclass='<%#PriceCss%>' 
                     Text='<%#Settings_Portal.Order.CurrencySymbol+objProduct.PurchasePrice.ToString() %>'/>
                    </td>
                </tr>
                  <!--  promo price  -->
                <tr id="Tr12" runat="server" visible='<%#objProduct.PromoPriceAvailable && Settings_Detail.Order.ShowPrice && objType.FieldEnable_Price %>'>
                    <td>
                        <asp:Label ID="lblPromoPrice" runat="server" resourcekey="lblPromoPrice" />
                    </td>
                    <td class="NormalRed">
                        <%#Settings_Portal.Order.CurrencySymbol + objProduct.PromoPrice.ToString() %>
                    </td>
                </tr>
                <!--  promo start  -->
                <tr id="Tr13" runat="server" visible='<%#objProduct.PromoPriceAvailable && Settings_Detail.Order.ShowPrice && Settings_Detail.Order.ShowPromoStart && objType.FieldEnable_Price %>'>
                    <td>
                        <asp:Label ID="lblPromoStart" runat="server" resourcekey="lblPromoStart" />
                    </td>
                    <td>
                        <%# GetShortDate(objProduct.PromoStart) %>
                    </td>
                </tr>
                 <!--  promo end  -->
                <tr id="Tr14" runat="server" visible='<%#objProduct.PromoPriceAvailable && Settings_Detail.Order.ShowPrice && Settings_Detail.Order.ShowPromoEnd&&objType.FieldEnable_Price %>'>
                    <td>
                        <asp:Label ID="lblPromoEnd" runat="server" resourcekey="lblPromoEnd" />
                    </td>
                    <td>
                        <%# GetShortDate(objProduct.PromoEnd) %>
                    </td>
                </tr>
              
                <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                
   
                <!--   social bookmarks -->
                <tr>
                    <td colspan="2">
                        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
                            <tr>
                                <td id="ShareBadgePRO_Toolbar">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>


<div id="tabs"  style="width: 100%; overflow:hidden">
    <ul >
        <li id="Li1" runat="server" Visible='<%#objType.FieldEnable_Description && Settings_Detail.General.ShowDescription && !string.IsNullOrEmpty(objProduct.Description.Trim()) && TabCounts>1 %>'>
        <a href="#divDescription"><span><%#Localization.GetString("tabDescription",LocalResourceFile)%></span></a>
        </li>
        
        <li id="Li2"  runat="server" visible='<%#Settings_Detail.General.ShowField1 && objType.EnableField1 && !string.IsNullOrEmpty(objProduct.Field1.Trim()) %>'>
        <a href="#divField1"><span><%#objType.Field1Title%></span></a> 
         </li>
           <li id="Li3"  runat="server" visible='<%#Settings_Detail.General.ShowField2 && objType.EnableField2 && !string.IsNullOrEmpty(objProduct.Field2.Trim()) %>'>
        <a href="#divField2"><span><%#objType.Field2Title%></span></a> 
         </li>
          <li id="Li4"  runat="server" visible='<%#Settings_Detail.General.ShowField3 && objType.EnableField3 && !string.IsNullOrEmpty(objProduct.Field3.Trim()) %>'>
        <a href="#divField3"><span><%#objType.Field3Title%></span></a> 
         </li>
          <li id="Li5"  runat="server" visible='<%#Settings_Detail.General.ShowField4 && objType.EnableField4 && !string.IsNullOrEmpty(objProduct.Field4.Trim()) %>'>
        <a href="#divField4"><span><%#objType.Field4Title%></span></a> 
         </li>
           <li id="Li6" runat="server" visible='<%#Settings_Detail.General.ShowField5 && objType.EnableField5 && !string.IsNullOrEmpty(objProduct.Field5.Trim()) %>'>
        <a href="#divField5"><span><%#objType.Field5Title%></span></a> 
         </li>
      <li id="Li7"  runat="server"  Visible='<%#objType.FieldEnable_SpecialOffer && Settings_Detail.General.ShowSpecialOffer && !string.IsNullOrEmpty(objProduct.SpecialOffer.Trim()) %>'>
        <a href="#divSpecialOffer"><span><%#Localization.GetString("tabSpecialOffer",LocalResourceFile)%></span></a>
        </li>
     <li id="Li8"  runat="server"  Visible='<%#objType.FieldEnable_License && Settings_Detail.General.ShowLicense && !string.IsNullOrEmpty(objProduct.License.Trim()) %>'>
        <a href="#divLicense"><span><%#Localization.GetString("tabLicense",LocalResourceFile)%></span></a>
        </li>
           <li id="Li9"  runat="server"  Visible='<%#objType.FieldEnable_Delivery && Settings_Detail.General.ShowDelivery && !string.IsNullOrEmpty(objProduct.Delivery.Trim()) %>'>
        <a href="#divDelivery"><span><%#Localization.GetString("tabDelivery",LocalResourceFile)%></span></a>
        </li>
           <li id="Li10"  runat="server"  Visible='<%#objType.FieldEnable_Support && Settings_Detail.General.ShowSupport && !string.IsNullOrEmpty(objProduct.Support.Trim()) %>'>
        <a href="#divSupport"><span><%#Localization.GetString("tabSupport",LocalResourceFile)%></span></a>
        </li>
        
       <li id="Li11"   runat="server"  Visible='<%#ShowGoogleMap %>'>
        <a href="#divGoogleMap"><span><%#Localization.GetString("tabGoogleMap",LocalResourceFile)%></span></a>
        </li>
         
           <li id="Li12"   runat="server"  Visible='<%#ShowAttachment %>'>
        <a href="#divAttachment"><span><%#Localization.GetString("tabAttachment",LocalResourceFile)%></span></a>
        </li>
           <li id="Li13" runat="server"  Visible='<%#ShowRelatedVideo %>'>
        <a href="#divRelatedVideo"><span><%#Localization.GetString("tabRelatedVideo",LocalResourceFile)%></span></a>
        </li>
          <li id="Li14"   runat="server"  Visible='<%#ShowRelatedAudio %>'>
        <a href="#divRelatedAudio"><span><%#Localization.GetString("tabRelatedAudio",LocalResourceFile)%></span></a>
        </li>
       
       
        
           <li id="Li16"    runat="server"  Visible='<%#Settings_Detail.VendorProfile.ShowVendorProfile%>'>
        <a href="#divAboutAuthor"><span><%#Localization.GetString("tabAboutAuthor",LocalResourceFile)%></span></a>
        </li>
        
       <li id="Li17" runat="server" visible='<%#Settings_Portal.Rating.AllowRating && Settings_Detail.Rating.ShowRating && objProduct.AllowRating %>'>
            <a href="#divRating"><span>
                <%#Localization.GetString("tabRating",LocalResourceFile)%></span></a> 
         </li>
                
        <li id="Li18" runat="server" visible='<%#Settings_Portal.Comment.AllowComment && objProduct.AllowComment && Settings_Detail.Comment.ShowComment %>'>
            <a href="#divComment"><span>
                <%#Localization.GetString("tabComment",LocalResourceFile)%></span></a> 
        </li>
                
        <li id="Li19" runat="server" visible='<%#ShowRelatedProduct %>'><a  href='#divRelatedProduct'>
            <span>
                <%#Localization.GetString("tabRelatedProduct", LocalResourceFile)%></span></a>
        </li>
    </ul>
    <!--  Description  -->
    <%if (objType.FieldEnable_Description && Settings_Detail.General.ShowDescription && !string.IsNullOrEmpty(objProduct.Description.Trim()))
  {%>
    <div id="divDescription" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
            <tr align="left">
                <td>
             <%#Server.HtmlDecode(objProduct.Description)%>
                </td>
            </tr>
        </table>
    </div>
   <%} %>
     <!--  Field1  -->
    <%if (Settings_Detail.General.ShowField1 && objType.EnableField1 && !string.IsNullOrEmpty(objProduct.Field1.Trim()))
  {%>
    <div id="divField1" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
            <tr align="left">
                <td>
             <%#Server.HtmlDecode(objProduct.Field1)%>
                </td>
            </tr>
        </table>
    </div>
   <%} %>
   
         <!--  Field2  -->
    <%if (Settings_Detail.General.ShowField2 && objType.EnableField2 && !string.IsNullOrEmpty(objProduct.Field2.Trim()))
  {%>
    <div id="divField2" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
            <tr align="left">
                <td>
             <%#Server.HtmlDecode(objProduct.Field2)%>
                </td>
            </tr>
        </table>
    </div>
   <%} %>
   
         <!--  Field3  -->
    <%if (Settings_Detail.General.ShowField3 && objType.EnableField3 && !string.IsNullOrEmpty(objProduct.Field3.Trim()))
  {%>
    <div id="divField3" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
            <tr align="left">
                <td>
             <%#Server.HtmlDecode(objProduct.Field3)%>
                </td>
            </tr>
        </table>
    </div>
   <%} %>
         <!--  Field4  -->
    <%if (Settings_Detail.General.ShowField4 && objType.EnableField4 && !string.IsNullOrEmpty(objProduct.Field4.Trim()))
  {%>
    <div id="divField4" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
            <tr align="left">
                <td>
             <%#Server.HtmlDecode(objProduct.Field4)%>
                </td>
            </tr>
        </table>
    </div>
   <%} %>
         <!--  Field5  -->
    <%if (Settings_Detail.General.ShowField5 && objType.EnableField5 && !string.IsNullOrEmpty(objProduct.Field5.Trim()))
  {%>
    <div id="divField5" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
            <tr align="left">
                <td>
             <%#Server.HtmlDecode(objProduct.Field5)%>
                </td>
            </tr>
        </table>
    </div>
   <%} %>
    <!--  Special Offer  -->
    <%if (objType.FieldEnable_SpecialOffer && Settings_Detail.General.ShowSpecialOffer && !string.IsNullOrEmpty(objProduct.SpecialOffer.Trim()))
  {%>
    <div id="divSpecialOffer" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
            <tr align="left">
                <td>
              <%#Server.HtmlDecode(objProduct.SpecialOffer)%>
                </td>
            </tr>
        </table>
    </div>
   <%} %>
    <!--  License  -->
    <%if (objType.FieldEnable_License && Settings_Detail.General.ShowLicense && !string.IsNullOrEmpty(objProduct.License.Trim()))
  {%>
    <div id="divLicense" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
            <tr align="left">
                <td>
                    <%#Server.HtmlDecode(objProduct.License)%>
                </td>
            </tr>
        </table>
    </div>
    <%} %>
    <!--  Delivery  -->
    <%if (objType.FieldEnable_Delivery && Settings_Detail.General.ShowDelivery && !string.IsNullOrEmpty(objProduct.Delivery.Trim()))
  {%>
    <div id="divDelivery" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
            <tr align="left">
                <td>
                    <%#Server.HtmlDecode(objProduct.Delivery)%>
                </td>
            </tr>
        </table>
    </div>
    <%} %>
    <!--  Support  -->
    <%if (objType.FieldEnable_Support && Settings_Detail.General.ShowSupport && !string.IsNullOrEmpty(objProduct.Support.Trim()))
  {%>
    <div id="divSupport" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
            <tr align="left">
                <td>
                    <%#Server.HtmlDecode(objProduct.Support)%>
                </td>
            </tr>
        </table>
    </div>
    <%} %>
    
      <!--  Google map  -->
    <%if (ShowGoogleMap)
  {%>
    <div id="divGoogleMap" style="<%#Settings_Detail.GoogleMap.GoogleMapStyle%>">
    </div>
    <%} %>
    
  
    
    <!--  attachment  -->
    <%if (ShowAttachment)
  {%>
    <div id="divAttachment" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
            <tr align="left">
                <td>
                    <asp:Label ID="lblAttacmentNeedLoggedIn" resourcekey="lblAttacmentNeedLoggedIn" ForeColor="red"
                        runat="server"></asp:Label>
                    <asp:DataList ID="dlAttachment" runat="server" Width="100%" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlAttachment" runat="server" NavigateUrl='<%#Convert.ToString(Eval("FilePath"))%>'
                                Target="_blank" >
                               <asp:Label ID="lblAttachment"  Text='<%#Convert.ToString(Eval("FilePath")) %>'
                        runat="server"/>
                            <asp:Image ID="imgDownloadAttachment" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Download.gif" />
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
    </div>
    <%} %>
    <!--  related video  -->
    <%if (ShowRelatedVideo)
  {%>
    <div id="divRelatedVideo" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
            <tr align="left">
                <td>
                    <asp:DataList ID="dlRelatedVideo" runat="server" Width="100%" ItemStyle-HorizontalAlign="Left"
                        RepeatColumns='<%#Settings_Detail.RelatedVideo.RelatedVideoPerRow%>' OnItemDataBound="dlRelatedVideo_ItemDataBound">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td valign="top" align="left">
                                        <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                                        <asp:HyperLink ID="hlImage" runat="server" Title='<%#Convert.ToString(Eval("Title")) %>'>
                                            <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' BorderStyle="Solid" BorderWidth="1"
                                                Width='<%#Settings_Detail.RelatedVideo.VideoImageWidth%>' BorderColor="DarkGray"
                                                ID='Image3' ImageAlign="Left" />
                                        </asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" align="center">
                                        <asp:HyperLink ID="hlTitle" runat="server" Text='<%# Convert.ToString(Eval("Title")) %>' Title='<%# Convert.ToString(Eval("Title")) %>' /><br />
                                        <asp:Label ID="lblDuration" runat="server" Text='<%#Eval("Duration")%>' />
                                        <asp:Label ID="lblEmbedCode" runat="server" Style="display: none" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
    </div>
    <%} %>
    <!--  related Audio  -->
    <%if (ShowRelatedAudio)
  {%>
    <div id="divRelatedAudio" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
            <tr align="left">
                <td>
                    <asp:DataList ID="dlRelatedAudio" runat="server" Width="100%" ItemStyle-HorizontalAlign="Left"
                        RepeatColumns='<%#Settings_Detail.RelatedAudio.RelatedAudioPerRow%>'>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td valign="top" align="left">
                                        <asp:HyperLink ID="hlAudio" runat="server" NavigateUrl='<%#Eval("AudioPath")%>' Text='<%#Convert.ToString(Eval("Title")) %>' rel="vidbox">
                                        </asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
    </div>
    <%} %>
 
    
  
    <!--   about author -->
    <%if (Settings_Detail.VendorProfile.ShowVendorProfile)
  {%>
    <div id="divAboutAuthor" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
            <!--    Company -->
            <tr id="Tr19" runat="server" visible="<%#Settings_Detail.VendorProfile.ShowCompany && !string.IsNullOrEmpty(objAuthor.Company)%>">
                <td style="width:150px">
                    <asp:Label ID="Label5" runat="server" resourcekey="lblCompany"></asp:Label>
                </td>
                <td>
                    <%#objAuthor.Company%>
                </td>
            </tr>
              <!--    country-->
                 <tr id="Tr20"   runat="server" visible="<%#Settings_Detail.VendorProfile.ShowCountry && !string.IsNullOrEmpty(objAuthor.Country)%>">
                    <td style="width:150px">
                        <asp:Label ID="Label1" runat="server" resourcekey="lblLocationCountry"></asp:Label>
                    </td>
                    <td>
                        <%#objAuthor.Country%>
                    </td>
                </tr>
                  <!--    State-->
                 <tr id="Tr21"   runat="server" visible="<%#Settings_Detail.VendorProfile.ShowState && !string.IsNullOrEmpty(objAuthor.State)%>">
                    <td style="width:150px">
                        <asp:Label ID="Label2" runat="server" resourcekey="lblLocationState"></asp:Label>
                    </td>
                    <td>
                        <%#objAuthor.State%>
                    </td>
                </tr>
                  <!--    City-->
                 <tr id="Tr22"   runat="server" visible="<%#Settings_Detail.VendorProfile.ShowCity && !string.IsNullOrEmpty(objAuthor.City)%>">
                    <td style="width:150px">
                        <asp:Label ID="Label6" runat="server" resourcekey="lblLocationCity"></asp:Label>
                    </td>
                    <td>
                        <%#objAuthor.City%>
                    </td>
                </tr>
                
               <!--    Town-->
                 <tr id="Tr23" runat="server" visible="<%#Settings_Detail.VendorProfile.ShowTown && !string.IsNullOrEmpty(objAuthor.Town)%>">
                    <td style="width:150px">
                        <asp:Label ID="Label3" runat="server" resourcekey="lblLocationTown"></asp:Label>
                    </td>
                    <td>
                        <%#objAuthor.Town%>
                    </td>
                </tr>

                  <!--    Tel-->
                 <tr id="Tr24"  runat="server" visible="<%#Settings_Detail.VendorProfile.ShowTel && !string.IsNullOrEmpty(objAuthor.Tel)%>">
                    <td style="width:150px">
                        <asp:Label ID="Label4" runat="server" resourcekey="lblTel"></asp:Label>
                    </td>
                    <td>
                        <%#objAuthor.Tel%>
                    </td>
                </tr>

                  <!--    Fax-->
                 <tr id="Tr25"  runat="server" visible="<%#Settings_Detail.VendorProfile.ShowFax && !string.IsNullOrEmpty(objAuthor.Fax)%>">
                    <td style="width:150px">
                        <asp:Label ID="Label7" runat="server" resourcekey="lblFax"></asp:Label>
                    </td>
                    <td>
                        <%#objAuthor.Fax%>
                    </td>
                </tr>
                
           <!--    Zipcode-->
                 <tr id="Tr26"   runat="server" visible="<%#Settings_Detail.VendorProfile.ShowZipcode && !string.IsNullOrEmpty(objAuthor.Zipcode)%>">
                    <td style="width:150px">
                        <asp:Label ID="Label8" runat="server" resourcekey="lblZipcode"></asp:Label>
                    </td>
                    <td>
                        <%#objAuthor.Zipcode%>
                    </td>
                </tr>
                 <!--    IM-->
                 <tr id="Tr27"  runat="server" visible="<%#Settings_Detail.VendorProfile.ShowIM && !string.IsNullOrEmpty(objAuthor.IM)%>">
                    <td style="width:150px">
                        <asp:Label ID="Label9" runat="server" resourcekey="lblIM"></asp:Label>
                    </td>
                    <td>
                        <%#objAuthor.IM%>
                    </td>
                </tr>
                <!--    Linkman-->
                 <tr id="Tr28" runat="server" visible="<%#Settings_Detail.VendorProfile.ShowLinkman && !string.IsNullOrEmpty(objAuthor.Linkman)%>">
                    <td style="width:150px">
                        <asp:Label ID="Label10" runat="server" resourcekey="lblLinkman"></asp:Label>
                    </td>
                    <td>
                        <%#objAuthor.Linkman%>
                    </td>
                </tr>
                <!--    Address-->
                 <tr id="Tr29"  runat="server" visible="<%#Settings_Detail.VendorProfile.ShowAddress && !string.IsNullOrEmpty(objAuthor.Address)%>">
                    <td style="width:150px">
                        <asp:Label ID="Label11" runat="server" resourcekey="lblAddress"></asp:Label>
                    </td>
                    <td>
                        <%#objAuthor.Address%>
                    </td>
                </tr>
                 <!--    BusinessScope-->
                 <tr id="Tr30" runat="server" visible="<%#Settings_Detail.VendorProfile.ShowBusinessScope && !string.IsNullOrEmpty(objAuthor.BusinessScope)%>">
                    <td style="width:150px">
                        <asp:Label ID="Label12" runat="server" resourcekey="lblBusinessScope"></asp:Label>
                    </td>
                    <td>
                        <%#objAuthor.BusinessScope%>
                    </td>
                </tr>
                 <!--    SiteUrl-->
            <tr id="Tr31" runat="server" visible='<%#Settings_Detail.VendorProfile.ShowSiteUrl 
            && !string.IsNullOrEmpty(objAuthor.SiteUrl) && objAuthor.SiteUrl.StartsWith("http")%>'>
                <td style="width:150px">
                    <asp:Label ID="Label13" runat="server" resourcekey="lblSiteUrl"></asp:Label>
                </td>
                <td>
                    <asp:HyperLink ID="hlAuthorSiteUrl" runat="server" Text="<%#objAuthor.SiteUrl%>"
                        NavigateUrl='<%#objAuthor.SiteUrl %>' Target="_blank" />
                </td>
            </tr>
                <!--    LogoUrl-->
                 <tr id="Tr32"  runat="server" visible="<%#Settings_Detail.VendorProfile.ShowLogoUrl && !string.IsNullOrEmpty(objAuthor.LogoUrl)%>">
                    <td style="width:150px">
                        <asp:Label ID="Label14" runat="server" resourcekey="lblLogoUrl"></asp:Label>
                    </td>
                    <td>
                      <asp:Image ID="Image6" runat="server" ImageUrl='<%#objAuthor.LogoUrl%>'
                    Height='40px' BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray"  />
                   
                    </td>
                </tr>
                  <!--    Slogan-->
                 <tr id="Tr33" runat="server" visible="<%#Settings_Detail.VendorProfile.ShowSlogan && !string.IsNullOrEmpty(objAuthor.Slogan)%>">
                    <td style="width:150px">
                        <asp:Label ID="Label15" runat="server" resourcekey="lblSlogan"></asp:Label>
                    </td>
                    <td>
                        <%#objAuthor.Slogan%>
                    </td>
                </tr>
                  <!--    extra vendor profile field1-->
                 <tr id="Tr34"  runat="server" visible="<%#Settings_Detail.VendorProfile.ShowField1 
                 && !string.IsNullOrEmpty(objAuthor.Field1) && Settings_Portal.VendorProfile.Field1Enable%>">
                    <td style="width:150px">
                        <%#Settings_Portal.VendorProfile.Field1Title%>
                    </td>
                    <td>
                        <%#objAuthor.Field1%>
                    </td>
                </tr>
                 <!--    extra vendor profile Field2-->
                 <tr id="Tr35"  runat="server" visible="<%#Settings_Detail.VendorProfile.ShowField2 
                 && !string.IsNullOrEmpty(objAuthor.Field2) && Settings_Portal.VendorProfile.Field2Enable%>">
                    <td style="width:150px">
                       <%#Settings_Portal.VendorProfile.Field2Title%>
                    </td>
                    <td>
                        <%#objAuthor.Field2%>
                    </td>
                </tr>
                  <!--    extra vendor profile Field3-->
                 <tr id="Tr36" runat="server" visible="<%#Settings_Detail.VendorProfile.ShowField3 
                 && !string.IsNullOrEmpty(objAuthor.Field3) && Settings_Portal.VendorProfile.Field3Enable%>">
                    <td style="width:150px">
                        <%#Settings_Portal.VendorProfile.Field3Title%>
                    </td>
                    <td>
                        <%#objAuthor.Field3%>
                    </td>
                </tr>
                  <!--    extra vendor profile Field4-->
                 <tr id="Tr37"  runat="server" visible="<%#Settings_Detail.VendorProfile.ShowField4 
                 && !string.IsNullOrEmpty(objAuthor.Field4) && Settings_Portal.VendorProfile.Field4Enable%>">
                    <td style="width:150px">
                        <%#Settings_Portal.VendorProfile.Field4Title%>
                    </td>
                    <td>
                        <%#objAuthor.Field4%>
                    </td>
                </tr>
                  <!--    extra vendor profile Field5-->
                 <tr id="Tr38" runat="server" visible="<%#Settings_Detail.VendorProfile.ShowField5 
                 && !string.IsNullOrEmpty(objAuthor.Field5) && Settings_Portal.VendorProfile.Field5Enable%>">
                    <td style="width:150px">
                        <%#Settings_Portal.VendorProfile.Field5Title%>
                    </td>
                    <td>
                        <%#objAuthor.Field5%>
                    </td>
                </tr>
                 <!--    extra vendor profile Field6-->
                 <tr id="Tr39" runat="server" visible="<%#Settings_Detail.VendorProfile.ShowField6 
                 && !string.IsNullOrEmpty(objAuthor.Field6) && Settings_Portal.VendorProfile.Field6Enable%>">
                    <td style="width:150px">
                        <%#Settings_Portal.VendorProfile.Field6Title%>
                    </td>
                    <td>
                        <%#objAuthor.Field6%>
                    </td>
                </tr>
                 <!--    extra vendor profile Field7-->
                 <tr id="Tr40" runat="server" visible="<%#Settings_Detail.VendorProfile.ShowField7 
                 && !string.IsNullOrEmpty(objAuthor.Field7) && Settings_Portal.VendorProfile.Field7Enable%>">
                    <td style="width:150px">
                       <%#Settings_Portal.VendorProfile.Field7Title%>
                    </td>
                    <td>
                        <%#objAuthor.Field7%>
                    </td>
                </tr>
                  <!--    extra vendor profile Field8-->
                 <tr id="Tr41"  runat="server" visible="<%#Settings_Detail.VendorProfile.ShowField8 
                 && !string.IsNullOrEmpty(objAuthor.Field8) && Settings_Portal.VendorProfile.Field8Enable%>">
                    <td style="width:150px">
                       <%#Settings_Portal.VendorProfile.Field8Title%>
                    </td>
                    <td>
                        <%#objAuthor.Field8%>
                    </td>
                </tr>
                 <!--    extra vendor profile Field9-->
                 <tr id="Tr42" runat="server" visible="<%#Settings_Detail.VendorProfile.ShowField9 
                 && !string.IsNullOrEmpty(objAuthor.Field9) && Settings_Portal.VendorProfile.Field9Enable%>">
                   <td style="width:150px">
                        <%#Settings_Portal.VendorProfile.Field9Title%>
                    </td>
                    <td>
                        <%#objAuthor.Field9%>
                    </td>
                </tr>
                 <!--    extra vendor profile Field10-->
                 <tr id="Tr43" runat="server" visible="<%#Settings_Detail.VendorProfile.ShowField10 
                 && !string.IsNullOrEmpty(objAuthor.Field10) && Settings_Portal.VendorProfile.Field10Enable%>">
                   <td style="width:150px">
                        <%#Settings_Portal.VendorProfile.Field10Title%>
                    </td>
                    <td>
                        <%#objAuthor.Field10%>
                    </td>
                </tr>
               <tr id="Tr44" runat="server" visible="<%#Settings_Detail.VendorProfile.ShowBiography  && !string.IsNullOrEmpty(objAuthor.Biography)%>">
                <td colspan="2">
                   <br />
                    <%#Server.HtmlDecode(objAuthor.Biography)%>
                </td>
            </tr>
        </table>
    </div>
    <%} %>
    <!--    about author  end -->
    <!--   rating information  table -->
   <%if (Settings_Portal.Rating.AllowRating && Settings_Detail.Rating.ShowRating && (Sellable || objProduct.AllowRating))
  {%>
    <div id="divRating" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="dnnFormItem">
          
            <tr align="left">
                <td>
                    <asp:Label ID="lblYourRating" resourcekey="lblYourRating" runat="server" />
                </td>
                <td>
                    <asp:RadioButtonList ID="rblRating" EnableViewState="True" RepeatDirection="Horizontal"
                        runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblRatingInfo" resourcekey="lblRatingInfo" runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="txtRatingInfo" runat="server" Columns="80" TextMode="Multiline"
                        Rows="5" />
                </td>
            </tr>
              <tr>
                <td>
                    <dnn:CaptchaControl ID="ctlRatingCaptcha" runat="server" CaptchaLength="4" ErrorStyle-CssClass="NormalRed"
                        CaptchaWidth="130" CaptchaHeight="40"></dnn:CaptchaControl>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnPost" runat="server" Text="Rating" resourcekey="bthPost" OnClick="btnPost_Click"
                        CssClass="CommandButton" CausesValidation="false"></asp:Button>
                </td>
                <td>
                    <asp:Label ID="lblRatingNeedLoggedIn" resourcekey="lblRatingNeedLoggedIn" Text="You have no rights to rating:"  
                        runat="server"></asp:Label>
                    <asp:Label ID="lblBuyBeforeRating" resourcekey="lblBuyBeforeRating"  
                        runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:DataList ID="dlRating" runat="Server" Width="100%" BackColor="White" BorderColor="#E7E7FF"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="lblClientName" runat="server" Text='<%#Eval("ClientName")%>' />
                                    </td>
                                    <td align="right">
                                        <asp:Image runat="server" ImageUrl='<%#GetSingleRatingImage(Convert.ToString(Eval("Rating")))%>'
                                            BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image3' ImageAlign="Left" />&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblUpdatedDate" runat="server" Text='<%#Convert.ToDateTime(Eval("UpdatedDate")).ToShortDateString()%>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" align="left" colspan="2">
                                     
                                         &nbsp;&nbsp; &nbsp;&nbsp;<%# Eval("Info").ToString().Replace(Microsoft.VisualBasic.Constants.vbCrLf, "<br/>")%>
                                    </td>
                                </tr>
                                <blockquote>
                                    <tr>
                                        <td valign="top" align="left" colspan="2">
                                        <br />
                                             <asp:Label ID="lblVendorReply" runat="server" resourcekey="lblVendorReply" />
                                             <br />
                               
                                             &nbsp;&nbsp; &nbsp;&nbsp; <%# Eval("Reply").ToString().Replace(Microsoft.VisualBasic.Constants.vbCrLf, "<br/>")%>
                                        </td>
                                    </tr>
                                </blockquote>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemStyle BackColor="#F7F7F7" Wrap="true"/>
                        <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C"  Wrap="true"/>
                        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7"  Wrap="true"/>
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <hr style="border: 1px dotted #999999; size: 1" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <Cross:PagingControl ID="ctlRating" runat="server" OnPageChanged="ctlRating_PageChanged"
                        Mode="PostBack"></Cross:PagingControl>
                </td>
            </tr>
        </table>
    </div>
   <% } %>
    <!--   rating information  end -->
 
    <!--   comment information table  -->
    <%if (Settings_Portal.Comment.AllowComment && objProduct.AllowComment && Settings_Detail.Comment.ShowComment)
  {%>
    <div id="divComment" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="dnnFormItem">
            <tr>
                <td>
                    <asp:Label ID="lblCommentHead" resourcekey="lblCommentHead" runat="server" CssClass="SubHead" />
                </td>
            </tr>
            <tr>
                <td>
                    <hr style="border: 1px dotted #999999; size: 1" />
                </td>
            </tr>
            <tr align="left">
                <td>
                    <asp:DataList ID="dlComments" runat="Server" Width="100%" BackColor="White" BorderColor="#E7E7FF"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <blockquote>
                                             <asp:Image runat="server" Width="48px" ID="imgUserGravatar" 
                                    ImageUrl='<%#GetAuthorAvatar(Eval("UserId").ToString(),Eval("Mail").ToString()) %>'
                                    ImageAlign="AbsMiddle"></asp:Image>
                                        </blockquote>
                                    </td>
                                    <td>
                                    <%# Eval("Comment").ToString().Replace(Microsoft.VisualBasic.Constants.vbCrLf, "<br/>")%>
                                     
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <%# "By  " + Convert.ToString(DataBinder.Eval(Container.DataItem, "UserName"))%>
                                        <%# "    on  "+Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"CreatedDate")).ToShortDateString()  %>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemStyle BackColor="#F7F7F7" Wrap="true" />
                        <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Wrap="true" />
                        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" Wrap="true" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td>
                    <hr style="border: 1px dotted #999999; size: 1" />
                </td>
            </tr>
            <tr>
                <td>
                    <Cross:PagingControl ID="ctlComment" runat="server" OnPageChanged="ctlComment_PageChanged"
                        Mode="PostBack"></Cross:PagingControl>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCommentNeedLoggedIn" Text="You must be logged in to submit a comment."
                        resourcekey="lblCommentNeedLoggedIn" runat="server" ForeColor="red" />
                    <asp:Label ID="lblCommentNeedAuth" Text="Your comment must be authorized before display."
                        resourcekey="lblCommentNeedAuth" runat="server" ForeColor="red" />
                    <br />
                    <hr style="border: 1px dotted #999999; size: 1" />
                </td>
            </tr>
            <tr id="trComment" runat="server">
                <td>
                    <table cellspacing="2" cellpadding="2" width="100%" class="dnnFormItem">
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblEnter" runat="server" resourcekey="lblEnter" Text="Leave a Comment"
                                    CssClass="SubHead"></asp:Label><br />
                                <hr style="border: 1px dotted #999999; size: 1" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width:150px">
                                <asp:Label ID="lblName" runat="server" resourcekey="lblName"></asp:Label>
                              
                            </td>
                            <td>
                                  <asp:TextBox ID="txtName" runat="server" ></asp:TextBox><asp:Image ID="Image1"
                                    runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                                    AlternateText="Required" />
                                <asp:RequiredFieldValidator ID="varName" runat="server" CssClass="NormalRed" ErrorMessage="You Must Enter a name"
                                    resourcekey="Name.ErrorMessage" Display="Dynamic" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblEmailExplanation" runat="server" ResourceKey="lblEmailExplanation"  CssClass="dnnFormMessage dnnFormInfo"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEmail" runat="server" resourcekey="lblEmail"></asp:Label>

                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblUrl" runat="server" resourcekey="lblUrl"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtUrl" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <dnn:CaptchaControl ID="ctlCaptcha" TabIndex="6" runat="server" 
                                    Visible='<%#Settings_Detail.Comment.ShowCaptchaInComment%>' CaptchaLength="4"
                                    ErrorStyle-CssClass="NormalRed" CaptchaWidth="130" CaptchaHeight="40"></dnn:CaptchaControl>
                            </td>
                        </tr>
                        <tr>
                            <td  colspan="2">
                                <asp:Label ID="lblComment" runat="server" resourcekey="lblComment" Text="Comment:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox
                                    ID="chkPrivate" runat="server" Text="Private" resourcekey="chkPrivate"></asp:CheckBox>&nbsp;&nbsp;&nbsp;
                                &nbsp;
                                <asp:Button ID="btnAddComment" runat="server" resourcekey="btnAddComment" Text="Submit Comment"
                                    OnClick="btnAddComment_Click" CssClass="CommandButton"></asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td  colspan="2">
                                <asp:TextBox ID="txtComment" runat="server"  TextMode="Multiline" Rows="7"  Columns="100"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="varComment" runat="server" CssClass="NormalRed" ErrorMessage="You Must Enter comment info"
                                    resourcekey="Comment.ErrorMessage" Display="Dynamic" ControlToValidate="txtComment">* Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <hr style="border: 1px dotted #999999; size: 1" />
                </td>
            </tr>
        </table>
    </div>
    <% } %>
    <!--   comment information end  -->
       <!--    related Product table -->
    <%if (ShowRelatedProduct)
              { %>
    <div id="divRelatedProduct" style="height: 100%">
        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
            <tr>
                <td>
                    <asp:DataList ID="dlRelatedProduct" runat="server" Visible="true" RepeatColumns="3"
                        Width="100%">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td valign="top" align="left">
                                        <asp:HyperLink ID="hlImage" runat="server" NavigateUrl='<%#GetProductNavigate(Convert.ToString(Eval("Id")),Convert.ToString(Eval("Name")))%>'
                                            Target="_self" Title='<%#Convert.ToString(Eval("Name")) %>'>
                                            <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' BorderStyle="Solid" BorderWidth="1"
                                                Width="90" BorderColor="DarkGray" ID='Image3' ImageAlign="Left" />
                                        </asp:HyperLink>
                                    </td>
                                      </tr>
                                    <tr>
                                    <td valign="top" align="left">
                                        <asp:HyperLink ID="lnkName" runat="server" Text='<%# Convert.ToString(Eval("Name")) %>'
                                            Target="_self" NavigateUrl='<%#GetProductNavigate(Convert.ToString(Eval("Id")),Convert.ToString(Eval("Name"))) %>' /><br />
                                        <asp:Image ID="imgRating" runat="server" ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>'
                                            ImageAlign="Left" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
    </div>
    <%} %>
    <!--    related Product end-->
</div>
</div>