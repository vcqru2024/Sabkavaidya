<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("ProductHeader") %></h2>
<div class="row rvdsf-actionbar-container">
    <div class="col-sm-6">
		<asp:LinkButton ID="DeleteArchivedProductsLinkButton" runat="server" CssClass="btn btn-link" OnClick="DeleteArchivedProductsLinkButton_Click" OnClientClick="return confirm('Are you sure you want to hard delete all unused archived products? Please make sure you have taken a full backup before proceeding.')"><em class="glyphicon glyphicon-remove fa fas fa-trash"></em> <%= LocalizeString("DeleteArchivedProductsLink") %></asp:LinkButton>
    </div>
    <div class="col-sm-6 text-sm-right">

    </div>
</div>
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
			<dnn1:LabelControl ID="ProductReviewsAnonymousAccountActiveLabelControl" runat="server" />
			<asp:CheckBox ID="ProductReviewsAnonymousAccountActiveCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductReviewsModerationActiveLabelControl" runat="server" />
			<asp:CheckBox ID="ProductReviewsModerationActiveCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductReviewsUserMaxReviewLabelControl" runat="server" />
			<asp:RequiredFieldValidator ID="ProductReviewsUserMaxReviewRequiredFieldValidator" runat="server" ControlToValidate="ProductReviewsUserMaxReviewTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="ProductReviewsUserMaxReviewRangeValidator" runat="server" ControlToValidate="ProductReviewsUserMaxReviewTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="ProductReviewsUserMaxReviewCompareValidator" runat="server" ControlToValidate="ProductReviewsUserMaxReviewTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="ProductReviewsUserMaxReviewTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductWarehouseProximityMatchActiveLabelControl" runat="server" />
			<asp:CheckBox ID="ProductWarehouseProximityMatchActiveCheckBox" runat="server" />
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
			<dnn1:LabelControl ID="LabelControl1" runat="server" Text="" />
			<a class="btn btn-link" href="#" onclick="$('.rvdsfFeaturesContainer').find('input').prop('checked', true); return false;"><em class="glyphicon glyphicon-check fa fas fa-check-square"></em> <%= LocalizeString("SelectAllLink") %></a>
			<a class="btn btn-link" href="#" onclick="$('.rvdsfFeaturesContainer').find('input').prop('checked', false); return false;"><em class="glyphicon glyphicon-unchecked fa fas fa-square"></em> <%= LocalizeString("DeselectAllLink") %></a>
			<asp:HyperLink ID="AddFeaturesHyperLink" runat="server" CssClass="btn btn-link" ><em class="glyphicon glyphicon-plus fa fas fa-plus"></em> <%= LocalizeString("EnableOtherFeaturesLink") %></asp:HyperLink>
		</div>
		<div class="rvdsfFeaturesContainer">
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ProductAttributeActiveLabelControl" runat="server" />
				<asp:CheckBox ID="ProductAttributeActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ProductAvailabilityActiveLabelControl" runat="server" />
				<asp:CheckBox ID="ProductAvailabilityActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ProductBookingActiveLabelControl" runat="server" />
				<asp:CheckBox ID="ProductBookingActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ProductComponentActiveLabelControl" runat="server" />
				<asp:CheckBox ID="ProductComponentActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="RelatedProductActiveLabelControl" runat="server" />
				<asp:CheckBox ID="RelatedProductActiveCheckBox" runat="server" />
			</div>
            <div class="dnnFormItem">
				<dnn1:LabelControl ID="SimilarProductActiveLabelControl" runat="server" />
				<asp:CheckBox ID="SimilarProductActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="RequiredProductActiveLabelControl" runat="server" />
				<asp:CheckBox ID="RequiredProductActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ProductDynamicFormActiveLabelControl" runat="server" />
				<asp:CheckBox ID="ProductDynamicFormActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ProductExtensionActiveLabelControl" runat="server" />
				<asp:CheckBox ID="ProductExtensionActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ProductActionActiveLabelControl" runat="server" />
				<asp:CheckBox ID="ProductActionActiveCheckBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ProductReviewsActiveLabelControl" runat="server" />
				<asp:CheckBox ID="ProductReviewsActiveCheckBox" runat="server" />
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
