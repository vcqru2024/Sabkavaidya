<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GalleryConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.GalleryConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("GalleryHeader") %></h2>
<div class="row rvdsf-actionbar-container">
    <div class="col-sm-6">
		<asp:LinkButton ID="ResizeAllLinkButton" runat="server" CssClass="btn btn-link" OnClick="ResizeAllLinkButton_Click" OnClientClick="return confirm('The following action will resize all the images using the largest available image to create optimally sized images. Are you sure you want to proceed?')" CausesValidation="False"><em class="glyphicon glyphicon-resize-small fa fas fa-arrows-alt"></em> Resize all images</asp:LinkButton>			
    </div>
    <div class="col-sm-6 text-sm-right">

    </div>
</div>
<div>
	<hr />
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GalleryProductsDetailedWidthLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="GalleryProductsDetailedWidthRequiredFieldValidator" runat="server" ControlToValidate="GalleryProductsDetailedWidthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="GalleryProductsDetailedWidthRangeValidator" runat="server" ControlToValidate="GalleryProductsDetailedWidthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="2000" MinimumValue="0" Type="Integer" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:TextBox ID="GalleryProductsDetailedWidthTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GalleryProductsDisplayWidthLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="GalleryProductsDisplayWidthRequiredFieldValidator" runat="server" ControlToValidate="GalleryProductsDisplayWidthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="GalleryProductsDisplayWidthRangeValidator" runat="server" ControlToValidate="GalleryProductsDisplayWidthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="2000" MinimumValue="0" Type="Integer" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:TextBox ID="GalleryProductsDisplayWidthTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GalleryProductsTileWidthLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="GalleryProductsTileWidthRequiredFieldValidator" runat="server" ControlToValidate="GalleryProductsTileWidthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="GalleryProductsTileWidthRangeValidator" runat="server" ControlToValidate="GalleryProductsTileWidthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="2000" MinimumValue="0" Type="Integer" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:TextBox ID="GalleryProductsTileWidthTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="GalleryProductsThumbnailWidthLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="GalleryProductsThumbnailWidthLabelControlRequiredFieldValidator" runat="server" ControlToValidate="GalleryProductsThumbnailWidthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="GalleryProductsThumbnailWidthLabelControlRangeValidator" runat="server" ControlToValidate="GalleryProductsThumbnailWidthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="2000" MinimumValue="0" Type="Integer" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:TextBox ID="GalleryProductsThumbnailWidthTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
		</div>
	</fieldset>
	<div class="row rvdsf-footerbar-container">
        <div class="col-sm-6">
                                
        </div>
        <div class="col-sm-6 text-sm-right">
            <asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />                    
        </div>
    </div>
</div>
