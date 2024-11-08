<%@ Control Language="C#" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.DDRMenu.TemplateEngine" Assembly="DotNetNuke.Web.DDRMenu" %>
<%@ Register TagPrefix="dnn" TagName="Breadcrumb" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Copyright" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="CurrentDate" Src="~/Admin/Skins/CurrentDate.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Help" Src="~/Admin/Skins/Help.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Language" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Links" Src="~/Admin/Skins/Links.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Login" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Logo" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Menu" Src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Meta" Src="~/Admin/Skins/Meta.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Nav" Src="~/Admin/Skins/Nav.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Privacy" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Search" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Terms" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="User" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Text" Src="~/Admin/Skins/Text.ascx" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript">
    // Remove all portal custom styles that could cause a conflict
    $('head link[href*="/portal.css"]').remove()
</script>
<dnn:Meta runat="server" Name="viewport" Content="width=device-width,initial-scale=1" />

<div id="siteWrapper" class="rvd-standard-admin dnn<%= DotNetNuke.Common.Globals.DataBaseVersion.Major %> <%= Request.IsAuthenticated ? "authenticated" : "" %>">
    <div id="topHeader">
        <div class="container">
	        <div class="row">
		        <div class="col-sm-2 col-xs-12">
			        <dnn:Logo runat="server" CssClass="logo"/>
		        </div>
                <div class="col-sm-10">
                    <div class="row">
                        <div class="col-sm-3 col-xs-12 text-center language">
                            <dnn:Language runat="server" ID="LanguageControl" ShowMenu="False" ShowLinks="True" />
		                </div>
                        <div class="col-sm-6 col-xs-12">
                            <div id="login" >
                                <dnn:Login ID="dnnLogin" CssClass="LoginLink" runat="server" LegacyMode="false" />
                                <dnn:User ID="dnnUser" runat="server" LegacyMode="false" />
                            </div>
                        </div>
                        <div class="col-sm-3 col-xs-12">
                            <div class="search-container text-center">
				                <dnn:Search runat="server" Submit=" " ShowWeb="False" ShowSite="False" CssClass="SearchButton"/>
                                <a href="#" id="search-action"></a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <nav class="navbar navbar-inverse">
                                <div class="container-fluid">
                                    <div class="navbar-header">
			                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#rvdMainMenuNavbarCollapse">
				                            <span class="icon-bar"></span>
				                            <span class="icon-bar"></span>
				                            <span class="icon-bar"></span>
			                            </button>
		                            </div>
                                    <div class="collapse navbar-collapse" id="rvdMainMenuNavbarCollapse">
			                            <dnn:Menu MenuStyle="Menus/MainMenu" runat="server" />
                                    </div>
                                </div>
                            </nav>
		                </div>
                    </div>
                </div>
	        </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
		    <div id="ContentPane" runat="server" class="content-pane col-sm-12" />
	    </div>
    </div>
    <div class="container">
        <div class="row">
		    <div id="FooterPane" runat="server" class="footer-pane col-sm-12" />
	    </div>
	    <div class="row">
		    <div id="BotPane" runat="server" class="bot-pane col-sm-12" />
	    </div>
    </div>
</div>
