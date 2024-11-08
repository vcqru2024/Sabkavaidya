<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CategoryConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.CategoryConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/urlcontrol.ascx" TagName="UrlControl" TagPrefix="dnn1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("CategoryHeader") %></h2>
<script type="text/javascript">
	jQuery(function ($)
	{
		$('#<%= DetailsViewPanel.ClientID %>').dnnPanels();
	});
</script>
<asp:Panel ID="DetailsViewPanel" runat="server">
	<h2 id="GeneralFormSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("GeneralHeader") %></a></h2>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CategoryDisplayTemplateLabelControl" runat="server" />
			<uc1:DisplayTemplateDropDownListControl ID="CategoryDisplayTemplateDropDownListControl" runat="server" />
			<asp:LinkButton ID="CategoryDisplayTemplateLinkButton" runat="server" OnClick="CategoryDisplayTemplateLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="CategorySyncTabsActiveLabelControl" runat="server"/>
			<asp:CheckBox ID="CategorySyncTabsActiveCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="CategorySyncTabsRootLabelControl" runat="server"/>
			<dnn1:UrlControl ID="CategorySyncTabsRootControl" runat="server" ShowDatabase="false" ShowFiles="false" ShowImages="False" ShowLog="false" ShowNewWindow="False" ShowNone="true" ShowSecure="true" ShowTabs="True" ShowTrack="false" ShowUpLoad="false" ShowUrls="false" ShowUsers="false"></dnn1:UrlControl>
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
				<dnn1:LabelControl ID="CategoryAvailabilityActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="CategoryAvailabilityActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="CategoryExtensionActiveLabelControl" runat="server"/>
				<asp:CheckBox ID="CategoryExtensionActiveCheckBox" runat="server" />
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
