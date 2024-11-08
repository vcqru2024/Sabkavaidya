<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CatalogImportControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.CatalogImportControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/urlcontrol.ascx" TagName="UrlControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="PlaceHolder1" runat="server">

	<script type="text/javascript">
		jQuery(document).ready(function ()
		{
            jQuery('#CatalogDetailsViewTabPanel').dnnTabs();
		});
		Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function ()
		{
            jQuery('#CatalogDetailsViewTabPanel').dnnTabs();
		});
	</script>

</asp:PlaceHolder>
<div>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<Triggers>
			<asp:PostBackTrigger ControlID="ImportLinkButton" />
		</Triggers>
		<ContentTemplate>
			<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
			<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
			<h2><%= LocalizeString("ImportCatalogHeader") %></h2>
			<div class="alert alert-warning"><%= LocalizeString("BackupMessageLabel") %></div>
			<div id="CatalogDetailsViewTabPanel">
				<ul class="dnnAdminTabNav dnnClear">
					<li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
						<asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
                    <li><a href="#<%= MapDetailsViewPanel.ClientID %>">
						<asp:Label ID="MapDetailsViewTabLabel" runat="server" resourcekey="MapDetailsViewTabLabel" /></a></li>
				</ul>
				<asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
					<fieldset>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="EntityTypeLabelControl" runat="server" />
							<asp:DropDownList ID="EntityTypeDropDownList" runat="server" OnSelectedIndexChanged="EntityTypeDropDownList_SelectedIndexChanged" AutoPostBack="True">
								<asp:ListItem Text="Category" Value="Category" />
								<asp:ListItem Text="Distributor" Value="Distributor" />
								<asp:ListItem Text="Gallery" Value="Gallery" />
								<asp:ListItem Text="Manufacturer" Value="Manufacturer" />
								<asp:ListItem Text="Product" Value="Product" />
								<asp:ListItem Text="Product attribute" Value="ProductAttribute" />
								<asp:ListItem Text="Product attribute definition" Value="ProductAttributeDefinition" />
								<asp:ListItem Text="Product attribute definition selection" Value="ProductAttributeDefinitionSelection" />
								<asp:ListItem Text="Product attribute group" Value="ProductAttributeGroup" />
								<asp:ListItem Text="Product category" Value="ProductCategory" />
								<asp:ListItem Text="Product component" Value="ProductComponent" />
								<asp:ListItem Text="Product part" Value="ProductPart" />
								<asp:ListItem Text="Product review" Value="ProductReview" />
								<asp:ListItem Text="Product variant" Value="ProductVariant" />
								<asp:ListItem Text="Product variant group" Value="ProductVariantGroup" />
								<asp:ListItem Text="Product variant group option" Value="ProductVariantGroupOption" />
								<asp:ListItem Text="Product variant option" Value="ProductVariantOption" />
								<asp:ListItem Text="Related product" Value="RelatedProduct" />
								<asp:ListItem Text="Required product" Value="RequiredProduct" />
                                <asp:ListItem Text="Similar product" Value="SimilarProduct" />
								<asp:ListItem Text="Warehouse" Value="Warehouse" />
							</asp:DropDownList>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="InputLabelControl" runat="server" CssClass="dnnFormRequired" />
							<asp:RadioButtonList ID="InputRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons" AutoPostBack="True" OnSelectedIndexChanged="InputRadioButtonList_SelectedIndexChanged">
								<asp:ListItem resourcekey="UploadLabel" Value="upload" Selected="True" />
								<asp:ListItem resourcekey="ServerLabel" Value="server" />
							</asp:RadioButtonList>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="FileLabelControl" runat="server" CssClass="dnnFormRequired" />
							<asp:MultiView ID="FileMultiView" runat="server" ActiveViewIndex="0">
								<asp:View ID="UploadFileView" runat="server">
									<asp:RequiredFieldValidator ID="FileRequiredFieldValidator" runat="server" ControlToValidate="FileUpload" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="FileRegularExpressionValidator" runat="server" ControlToValidate="FileUpload" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression=".+\.(csv|txt)$" ValidationGroup="DetailsViewControl" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
									<asp:FileUpload ID="FileUpload" runat="server" CssClass="dnnFormRequired"/>
								</asp:View>
								<asp:View ID="ServerFileView" runat="server">
									<dnn1:UrlControl ID="FileUrlControl" runat="server" ShowDatabase="false" ShowFiles="true" ShowImages="False" ShowLog="false" ShowNewWindow="False" ShowNone="false" ShowSecure="true" ShowTabs="false" ShowTrack="false" ShowUpLoad="True" ShowUrls="false" ShowUsers="false" FileFilter="csv,txt" Required="True"></dnn1:UrlControl>
								</asp:View>
							</asp:MultiView>
						</div>
					</fieldset>
				</asp:Panel>
                <asp:Panel ID="MapDetailsViewPanel" runat="server">
                    <fieldset>
                        <p><%= LocalizeString("MapDescriptionLabel") %></p>
                        <div class="dnnFormItem" >
                            <dnn1:LabelControl ID="ColumnMapLabelControl" runat="server" CssClass="dnnFormRequired" />
                            <asp:TextBox ID="ColumnMapTextBox" runat="server" TextMode="MultiLine" Wrap="False" style="height:300px"></asp:TextBox>
                        </div>
                        <div class="dnnFormItem">
                            <dnn1:LabelControl runat="server"></dnn1:LabelControl>
                            <asp:LinkButton ID="SaveColumnMapLinkButton" runat="server" resourcekey="SaveColumnMapLinkButton" CssClass="btn btn-primary" CausesValidation="False" OnClick="SaveColumnMapLinkButton_Click"></asp:LinkButton>
                            <asp:LinkButton ID="ResetColumnMapLinkButton" runat="server" resourcekey="ResetColumnMapLinkButton" CssClass="btn btn-default btn-light" CausesValidation="False" OnClick="ResetColumnMapLinkButton_Click"></asp:LinkButton>
                        </div>
                    </fieldset>
                </asp:Panel>
			</div>
			<div class="row rvdsf-footerbar-container">
                <div class="col-sm-6">
                                
                </div>
                <div class="col-sm-6 text-sm-right">
                        <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
					<asp:LinkButton ID="ImportLinkButton" runat="server" resourcekey="ImportLinkButton" OnClick="ImportLinkButton_Click" CssClass="btn btn-primary rvdImportAction" ValidationGroup="DetailsViewControl" />
                </div>
            </div>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
