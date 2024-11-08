<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManufacturerConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ManufacturerConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/urlcontrol.ascx" TagName="UrlControl" TagPrefix="dnn1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("ManufacturerHeader") %></h2>
<script type="text/javascript">
	jQuery(function ($)
	{
		$('#<%= DetailsViewPanel.ClientID %>').dnnPanels();
	});
</script>
<asp:Panel ID="DetailsViewPanel" runat="server" >
	<h2 id="GeneralFormSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("GeneralHeader") %></a></h2>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ManufacturerDisplayTemplateLabelControl" runat="server"  />
			<uc1:DisplayTemplateDropDownListControl ID="ManufacturerDisplayTemplateDropDownListControl" runat="server" />
			<asp:LinkButton ID="ManufacturerDisplayTemplateLinkButton" runat="server" OnClick="ManufacturerDisplayTemplateLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ManufacturerSyncTabsActiveLabelControl" runat="server"/>
			<asp:CheckBox ID="ManufacturerSyncTabsActiveCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ManufacturerSyncTabsRootLabelControl" runat="server"/>
			<dnn1:UrlControl ID="ManufacturerSyncTabsRootControl" runat="server" ShowDatabase="false" ShowFiles="false" ShowImages="False" ShowLog="false" ShowNewWindow="False" ShowNone="true" ShowSecure="true" ShowTabs="True" ShowTrack="false" ShowUpLoad="false" ShowUrls="false" ShowUsers="false"></dnn1:UrlControl>
		</div>
	</fieldset>
	<script type="text/javascript">
		$(document).ready(function ()
		{
			// Expand features section by default
			if (document.cookie.indexOf("FeaturesFormSectionHead") < 0)
				$("#FeaturesFormSectionHead > a").click();
		});
	</script>
	<h2 id="FeaturesFormSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("FeaturesHeader") %></a></h2>
	<fieldset>
		<p>
			<%= LocalizeString("FeaturesDescriptionLabel") %>
		</p>
		<div class="dnnFormItem">
			<dnn1:LabelControl runat="server" Text="" />
			<asp:HyperLink ID="AddFeaturesHyperLink" runat="server" CssClass="btn btn-link" ><em class="glyphicon glyphicon-plus fa fas fa-plus"></em> <%= LocalizeString("EnableOtherFeaturesLink") %></asp:HyperLink>
		</div>
		<div class="rvdsfFeaturesContainer">
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ManufacturerExtensionActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="ManufacturerExtensionActiveCheckBox" runat="server" />
			</div>
		</div>
	</fieldset>
	<div class="row rvdsf-footerbar-container">
        <div class="col-sm-6">
                                
        </div>
        <div class="col-sm-6 text-sm-right">
			<uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
			<asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />
			<asp:LinkButton ID="SaveAndBackLinkButton" runat="server" resourcekey="SaveAndBackLinkButton" OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
        </div>
    </div>
</asp:Panel>
