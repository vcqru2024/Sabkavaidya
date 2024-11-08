<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StorefrontView.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.StorefrontView" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>

<script type="text/javascript">	
    var servicesFramework = $.ServicesFramework(<%= this.ModuleContext.ModuleId %>);

	// Localization strings
    Revindex.LocalizedStrings.Message_ConfirmAction = '<%= HttpUtility.JavaScriptStringEncode(Localization.GetString(Global.LocalizedStrings.Message_ConfirmAction, Global.FilePaths.LocalSharedResourceFile)) %>'
	Revindex.LocalizedStrings.Message_ConfirmDelete = '<%= HttpUtility.JavaScriptStringEncode(Localization.GetString(Global.LocalizedStrings.Message_ConfirmDelete, Global.FilePaths.LocalSharedResourceFile)) %>'
	Revindex.LocalizedStrings.Message_SaveChangesWarning = '<%= HttpUtility.JavaScriptStringEncode(Localization.GetString(Global.LocalizedStrings.Message_SaveChangesWarning, Global.FilePaths.LocalSharedResourceFile)) %>'

    Revindex.Portal.CultureCode = '<%= PortalSettings.CultureCode %>'
</script>
<a id="RvdsfContentAnchor" name="RvdsfContentAnchor" class="rvdModuleStartAnchor"></a>
<asp:UpdateProgress ID="UpdateProgress" runat="server">
	<ProgressTemplate>
		<div class="rvdUpdateProgressContainer">
			<asp:Image ID="UpdateProgressImage" runat="server" ImageUrl="~/Images/Loading.gif" CssClass="rvdUpdateProgress" />
		</div>
	</ProgressTemplate>
</asp:UpdateProgress>
<div class="dnnForm rvd-module-container rvdsf rvdsf-module-container rvdsf-administration-container">
    <nav class="rvdsf-navbar navbar navbar-inverse navbar-expand-lg navbar-dark" >
	    <div class="container">
		    <div class="navbar-header">
			    <button type="button" class="navbar-toggle navbar-toggler float-right collapsed" data-toggle="collapse" data-target="#rvdsfMainMenuNavbarCollapse">
				    <span class="glyphicon glyphicon-menu-hamburger navbar-toggler-icon"></span>
			    </button>
		    </div>
		    <div class="collapse navbar-collapse" id="rvdsfMainMenuNavbarCollapse">
			    <ul class="nav navbar-nav text-nowrap">
                    <% foreach (var menuItem in this.MainMenuItems) { %>
                        <% if (menuItem.Items.Count == 0) { %>
                            <% if (menuItem.IsSeparator) { %>
                                <li class="divider dropdown-divider"></li>
                               <% } else { %>
                            <li class="nav-item"><a class="nav-link" target="<%= menuItem.Target %>" href="<%= menuItem.NavigateUrl %>"><em class="<%= menuItem.IconClass %>" style="margin-right: 10px"></em><%= menuItem.Text %></a></li>
                               <% } %>
                        <% } else { %>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"><em class="<%= menuItem.IconClass %>" style="margin-right: 10px"></em><%= menuItem.Text %> <span class="caret"></span></a>
                            <ul class="nav-item dropdown-menu columns <%= "columns-" + (int)System.Math.Ceiling((double) menuItem.Items.Count / 16) %>">
                            <% foreach (var childMenuItem in menuItem.Items) { %>
                                <% if (childMenuItem.IsSeparator) { %>
                                    <li class="nav-item divider dropdown-divider"></li>
                                <% } else { %>
                                <li class="nav-item"><a class="nav-link" target="<%= childMenuItem.Target %>" href="<%= childMenuItem.NavigateUrl %>"><%= childMenuItem.Text %></a></li>
                                <% } %>
                            <% } %>
                            </ul>
                        </li>
                        <% } %>
                    <% } %>
			    </ul>
		    </div>
	    </div>
    </nav>
    <div class="rvdsfContentContainer rvdsf-content-container">
	    <asp:Panel ID="WelcomePanel" runat="server" Visible="false" style="text-align:center; border-bottom: 1px solid #828282; margin-top: -40px; margin-bottom: 10px; padding-top: 40px; background-color: #eee ">
		    <div style="margin:10px 10px; font-weight:bold">Your store is almost ready. Follow the setup wizard below to start quickly.</div>
		    <ul class="rvdsfWelcomeSteps">
			    <li><asp:HyperLink ID="GeneralWelcomeHyperLink" runat="server" EnableViewState="False">1. Features</asp:HyperLink></li>
			    <li><asp:HyperLink ID="TaxesWelcomeHyperLink" runat="server" EnableViewState="False">2. Taxes</asp:HyperLink></li>
			    <li><asp:HyperLink ID="PaymentWelcomeHyperLink" runat="server" EnableViewState="False">3. Payment</asp:HyperLink></li>
			    <li><asp:HyperLink ID="ProductsWelcomeHyperLink" runat="server" EnableViewState="False">4. Products</asp:HyperLink></li>
			    <li><asp:LinkButton ID="DoneWelcomeLinkButton" runat="server" Text="" OnClick="DoneWelcomeLinkButton_Click"><span class="glyphicon glyphicon-remove fa fas fa-trash" aria-hidden="true"></span> Close</asp:LinkButton></li>
		    </ul>
	    </asp:Panel>
		<asp:PlaceHolder ID="ContentPlaceHolder" runat="server"></asp:PlaceHolder>
    </div>
</div>