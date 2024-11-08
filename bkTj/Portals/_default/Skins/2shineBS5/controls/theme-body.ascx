<%--
  This is the main part of our Themes
  It's in a separate file so it can be shared

  Note that it's included using the include-syntax, not as a web-control. 
  This is important, because otherwise Dnn won't detect the panes in here
--%>

<%@ Control Language="C#" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<!--#include file="register.ascx"-->
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<a class="visually-hidden-focusable" rel="nofollow" href="#to-shine-page-main"><%= LocalizeString("SkipLink.MainContent") %></a>
<div class="saatvik-navbar">
    <nav id="to-shine-page-navigation" class="navbar navbar-expand-lg">
        <div class="container-fluid">
                    <dnn:LOGO runat="server" ID="LOGO2" class="navbar-brand"
                        />
             <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="offcanvas offcanvas-start" id="offcanvasNavbar" tabindex="-1">
                    <div class="offcanvas-header">      
                     <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
                    </div>
                    <div class="offcanvas-body">
             
                        <div class="d-none d-lg-block w-100">
                            <dnn:MENU MenuStyle="nav/main" NodeSelector="<%# NavNodeSelector %>" runat="server" />
                        </div>
                        <div class="d-block d-lg-none w-100">
                            <dnn:MENU MenuStyle="nav/main-mobile" NodeSelector="*,0,6" runat="server" />
                        </div>
                    </div>
                </div>
   
                    <%
                        if (LocaleController.Instance.GetLocales(0).Count() > 1)
                        { 
                    %>
                    <tosic:languagenavigation runat="server" languages="de-DE:DE,en-US:EN,fr-FR:FR,it-IT:IT" />
                    <%
                        }
                    %>
                    <%
                        if (Request.IsAuthenticated)
                        {
                    %>
                    <a href="?ctl=logoff" title="Logoff" class="to-shine-login" target="_self">
                        <svg version="1.1" id="Ebene_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            viewBox="0 0 12.2 14.5" style="enable-background: new 0 0 12.2 14.5;" xml:space="preserve">
                            <g>
                                <path d="M12.2,8.8v4.4c0,0.7-0.6,1.3-1.3,1.3H1.3c-0.7,0-1.3-0.6-1.3-1.3V8.8c0-0.7,0.6-1.3,1.3-1.3H2V4.7c0-2.3,1.8-4.2,4.1-4.2
                                s4.2,1.9,4.2,4.2v0.4c0,0.4-0.3,0.7-0.7,0.7H8.8c-0.4,0-0.7-0.3-0.7-0.7V4.7c0-1.1-0.9-2-2-2c-1.1,0-1.9,0.9-1.9,2v2.8h6.8
                                C11.7,7.5,12.2,8.1,12.2,8.8z" />
                            </g>
                        </svg>
                    </a>
                    <%
                        }
                        else
                        {
                    %>
                    <a href="?ctl=login" title="Login" class="to-shine-login" target="_self">
                        <svg version="1.1" id="Lock" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            viewBox="0 0 12.2 14" style="enable-background: new 0 0 12.2 14;" xml:space="preserve">
                            <g>
                                <path d="M12.2,7.4v5.2c0,0.7-0.6,1.3-1.3,1.3H1.3C0.6,14,0,13.4,0,12.7V7.4c0-0.7,0.6-1.3,1.3-1.3H2v-2C2,1.9,3.8,0,6.1,0
                                  s4.2,1.9,4.2,4.2v2h0.7C11.7,6.1,12.2,6.7,12.2,7.4z M8.1,4.2c0-1.1-0.9-2-2-2s-2,0.9-2,2v2h3.9V4.2z" />
                            </g>
                        </svg>
                    </a>
                    <%
                        }
                    %>
                </div>
            </nav>
        </div>
    </div>
</div>
 </div>
    </div>
<main id="to-shine-page-main">
    <%
        if (ShowBreadcrumb)
        {
    %> 
    <div class="app-breadcrumb to-shine-page-breadcrumb to-shine-page-breadcrumb-shortened">
        <div class="container">
            <a class="to-shine-page-breadcrumb-link to-shine-page-breadcrumb-home" aria-current="page" href="<%= DotNetNuke.Common.Globals.NavigateURL(PortalSettings.HomeTabId) %>"><%= LocalizeString("Home.Text") %></a>
            <span>&nbsp;&rsaquo;&nbsp;</span><span class="to-shine-page-breadcrumb-trigger display-inline display-md-none"><a aria-current="page"></a></span>
            <dnn:BREADCRUMB runat="server" aria-current="page" Separator="<span>&nbsp;&rsaquo;&nbsp;</span>" CssClass="to-shine-page-breadcrumb-link" RootLevel="0" />
        </div>
    </div>
    <%
        }
    %>
    <div id="to-shine-page-header-pane" class="<%= (HeaderPane.Attributes["class"] ?? "").Contains("DNNEmptyPane") ? "to-shine-header-pane-empty" : "" %>">
        <div id="HeaderPane" runat="server" containertype="G" containername="2shineBS5" containersrc="fullwidthWithoutPadding.ascx"></div>
    </div>
    <%--<div id="to-shine-page-header-pane" class="container-xxl px-0 <%= (HeaderPane.Attributes["class"] ?? "").Contains("DNNEmptyPane") ? "to-shine-header-pane-empty" : "" %>">
        <div id="Div1" runat="server" containertype="G" containername="2shineBS5" containersrc="fullwidthWithoutPadding.ascx"></div>
    </div>--%>
    <% 
        if (ShowSidebarNavigation)
        {
    %>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-lg-12 order-lg-2 ly-col-contentpane">
                <%
                    }
                %>
                <div id="ContentPane" runat="server" containertype="G" containername="2shineBS5" containersrc="fullwidthWithoutPadding.ascx"></div>
                <div id="carasoul" runat="server" containertype="G" containername="2shineBS5" containersrc="default.ascx"></div>
                <div id="Div2" runat="server" containertype="G" containername="2shineBS5" containersrc="default.ascx" class="owl-carousel"></div>
                <div id="progressbar" runat="server" containertype="G" containername="2shineBS5" containersrc="fullwidthWithoutPadding.ascx"></div>
                <div id="FAQ" runat="server" containertype="G" containername="2shineBS5" containersrc="default.ascx" class="saatvik-faq"></div>
                <div id="Footer" runat="server" containertype="G" containername="2shineBS5" containersrc="fullwidthWithoutPadding.ascx"></div>
                <% 
                    if (ShowSidebarNavigation)
                    {
                %>
            </div>
            <div class="col-xs-12 col-lg-3 order-lg-1 ly-col-leftpane">
                <div id="to-shine-nav-sub" class="d-none d-sm-block">
                    <dnn:MENU MenuStyle="nav/sub" NodeSelector="+0,0,2" runat="server" />
                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>
    <a id="to-shine-to-top" href="#" title="Nach oben" rel="nofollow">
        <svg xmlns="http://www.w3.org/2000/svg" width="19.032" height="20.034" viewBox="0 0 19.032 20.034">
            <g id="Group_2" data-name="Group 2" transform="translate(-1055.984 -551.276)">
                <path id="Path_2" data-name="Path 2" d="M8.1,16.2,0,8.1,8.1,0" transform="translate(1073.602 552.69) rotate(90)" fill="none" stroke="#fff" stroke-linecap="round" stroke-width="2" />
                <line id="Line_1" data-name="Line 1" y2="17.599" transform="translate(1065.481 552.711)" fill="none" stroke="#fff" stroke-linecap="round" stroke-width="2" />
            </g>
        </svg>
    </a>
</main>
<%--<footer id="to-shine-page-footer">
    <div class="container py-4 d-flex justify-content-md-between flex-column flex-md-row text-white">
        <ul class="to-shine-footer-address" itemscope itemtype="http://schema.org/LocalBusiness">
            <li>
                <strong itemprop="name">Satvik Health </strong>
            </li>
            <li>
                <span itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
                    <span itemprop="streetAddress">Shine Road 77</span>,
          <span itemprop="postalCode">50355</span>
                    <span itemprop="addressLocality">Shine City</span>,
          <span itemprop="addressCountry">Shine Country</span>
                </span>
            </li>
            <li><a href="tel:+41817506777">+41 81 750 67 77</a></li>
            <li>
                <span data-madr1="shine" data-madr2="example" data-madr3="com" data-linktext=""></span>
            </li>
        </ul>
        <div class="to-shine-footer-imprint">
            <dnn:login id="DnnLogin" cssclass="to-shine-page-login d-none d-lg-inline-flex" rel="nofollow" runat="server" />
            <a href="<%= DotNetNuke.Common.Globals.NavigateURL(PortalController.GetCurrentPortalSettings().PrivacyTabId) %>" title="<%= LocalizeString("Imprint.Text") %>"><%= LocalizeString("Imprint.Text") %></a> | 
        <a href="<%= DotNetNuke.Common.Globals.NavigateURL(PortalController.GetCurrentPortalSettings().TermsTabId) %>" title="<%= LocalizeString("Privacy.Text") %>"><%= LocalizeString("Privacy.Text") %></a>
        </div>
    </div>
</footer>--%>

<!-- include files -->

<dnn:DnnCssInclude runat="server" FilePath="../../../../../assets/css/style.css" Priority="100" PathNameAlias="SkinPath" HtmlAttributesAsString="rel:'stylesheet preload', as:'style'" />
<dnn:DnnCssInclude runat="server" FilePath="dist/dnn-default.min.css" Priority="99" PathNameAlias="SkinPath" HtmlAttributesAsString="rel:'stylesheet preload', as:'style'" />
<dnn:DnnCssInclude runat="server" FilePath="dist/theme.min.css" Priority="100" PathNameAlias="SkinPath" HtmlAttributesAsString="rel:'stylesheet preload', as:'style'" />
<dnn:DnnJsInclude runat="server" FilePath="dist/lib/bootstrap.bundle.min.js" ForceProvider="DnnFormBottomProvider" Priority="100" PathNameAlias="SkinPath" HtmlAttributesAsString="defer, async" />
<dnn:DnnJsInclude runat="server" FilePath="dist/theme.min.js" ForceProvider="DnnFormBottomProvider" Priority="130" PathNameAlias="SkinPath" HtmlAttributesAsString="defer, async" />
<dnn:DnnJsInclude runat="server" FilePath="dist/slider.js" ForceProvider="DnnFormBottomProvider" Priority="130" PathNameAlias="SkinPath" HtmlAttributesAsString="defer, async" />
<dnn:DnnJsInclude runat="server" FilePath="https://code.jquery.com/jquery-3.6.0.min.js" ForceProvider="DnnFormBottomProvider" Priority="130" PathNameAlias="SkinPath" HtmlAttributesAsString="defer, async" />
<dnn:DnnCssInclude runat="server" FilePath="dist/SaatvikCSS.css" Priority="100" PathNameAlias="SkinPath" HtmlAttributesAsString="rel:'stylesheet preload', as:'style'" />
<%--<dnn:DnnCssInclude runat="server" FilePath="../../../../../assets/css/css.css" Priority="100" PathNameAlias="SkinPath" HtmlAttributesAsString="rel:'stylesheet preload', as:'style'" />--%>
<dnn:DnnCssInclude runat="server" FilePath="../../../../../assets/css/responsive.css" Priority="100" PathNameAlias="SkinPath" HtmlAttributesAsString="rel:'stylesheet preload', as:'style'" />
<dnn:DnnCssInclude runat="server" FilePath="dist/lib/swiper.css" Priority="100" PathNameAlias="SkinPath" HtmlAttributesAsString="rel:'stylesheet preload', as:'style'" />
<dnn:DnnCssInclude runat="server" FilePath="dist/lib/swiper.js" Priority="100" PathNameAlias="SkinPath" HtmlAttributesAsString="rel:'stylesheet preload', as:'style'" />
<dnn:DnnCssInclude runat="server" FilePath="dist/lib/all.min.css" Priority="100" PathNameAlias="SkinPath" HtmlAttributesAsString="rel:'stylesheet preload', as:'style'" />
<dnn:DnnCssInclude runat="server" FilePath="dist/lib/custom.js" Priority="100" PathNameAlias="SkinPath" HtmlAttributesAsString="rel:'stylesheet preload', as:'style'" />



<script runat="server">

    protected bool IsHome = false;

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

       AttachCustomHeader("<meta charset='UTF-8'>");
AttachCustomHeader("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
AttachCustomHeader("<link rel='preconnect' href='https://fonts.googleapis.com'>");
AttachCustomHeader("<link rel='preconnect' href='https://fonts.gstatic.com' crossorigin>");
AttachCustomHeader("<link href='https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap' rel='stylesheet'>");
AttachCustomHeader("<link href='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css' rel='stylesheet'>");
AttachCustomHeader("<link href='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css' rel='stylesheet'>");
        AttachCustomHeader("<link href='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js' rel='stylesheet'>");
AttachCustomHeader("<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css' rel='stylesheet'>");
        AttachCustomHeader("<link href='https://code.jquery.com/jquery-3.6.0.min.js' rel='stylesheet'>");
         AttachCustomHeader("<link href='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js' rel='stylesheet'>");
        AttachCustomHeader("<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>");
      AttachCustomHeader("<link href='https://unpkg.com/bs-brain@2.0.4/components/heroes/hero-3/assets/css/hero-3.css' rel='stylesheet'>");


        
        

        var portal = DotNetNuke.Entities.Portals.PortalSettings.Current;
        IsHome = portal.HomeTabId == portal.ActiveTab.TabID;

        // Set various FavIcon and Icon headers according to best practices
        // The next line is disabled by default, because it requires RazorBlade to be installed.
        // How to install RazorBlade 3: https://azing.org/dnn-community/r/zbh8JC5T
        // How to create best-practice FavIcons: https://azing.org/dnn-community/r/UhgWJbxh
        // ToSic.Razor.Blade.HtmlPage.AddIconSet(SkinPath + "favicon.png");
    }
    protected void AttachExternalCSS(string CSSPath) { AttachCustomHeader("<link type='text/css' rel='stylesheet' href='" + CSSPath + "' />"); }
    protected void AttachExternalJS(string JSPath) { AttachCustomHeader("<script type='text/javascript' src='" + JSPath + "'></scr" + "ipt>"); }
    protected void AttachCustomHeader(string CustomHeader) { HtmlHead HtmlHead = (HtmlHead)Page.FindControl("Head"); if ((HtmlHead != null)) { HtmlHead.Controls.Add(new LiteralControl(CustomHeader)); } }

    protected string LocalizeString(string key)
    {
        return Localization.GetString(key, ResourceFilePath);
    }

    protected string ResourceFilePath
    {
        get
        {
            return _resPath ?? (_resPath = Localization.GetResourceFile(this, System.IO.Path.GetFileName(AppRelativeTemplateSourceDirectory + "2shine.resx")));
        }
    }
    private string _resPath;
</script>
 <script>
     $(document).ready(function () {
         $('.owl-carousel').owlCarousel({
             loop: true,
             margin: 10,
             nav: true,
             autoplay: true, // Enable autoplay
             autoplayTimeout: 2000, // Autoplay interval in milliseconds
             autoplayHoverPause: true, // Pause autoplay when hovering over carousel
             responsive: {
                 0: {
                     items: 1
                 },
                 600: {
                     items: 2
                 },
                 1000: {
                     items: 3
                 }
             }
         });
     });
 </script>