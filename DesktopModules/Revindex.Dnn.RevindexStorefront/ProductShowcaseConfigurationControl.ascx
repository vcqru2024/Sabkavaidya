<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductShowcaseConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductShowcaseConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("ProductShowcaseHeader") %></h2>
<div>
	<hr />
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductShowcaseDisplayTemplateLabelControl" runat="server"  />
			<uc1:DisplayTemplateDropDownListControl ID="ProductShowcaseDisplayTemplateDropDownListControl" runat="server" />
			<asp:LinkButton ID="ProductShowcaseDisplayTemplateLinkButton" runat="server" OnClick="ProductShowcaseDisplayTemplateLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ShowcaseModeLabelControl" runat="server" />
			<asp:DropDownList ID="ShowcaseModeDropDownList" runat="server" OnSelectedIndexChanged="ShowcaseModeDropDownList_SelectedIndexChanged" AutoPostBack="true">
				<asp:ListItem Value="9" resourcekey="BoughtProductsLabel" ></asp:ListItem>
				<asp:ListItem Value="1" resourcekey="FeaturedProductsLabel" ></asp:ListItem>
				<asp:ListItem Value="2" resourcekey="NewestProductsLabel" ></asp:ListItem>
				<asp:ListItem Value="3" resourcekey="OldestProductsLabel" ></asp:ListItem>
				<asp:ListItem Value="4" resourcekey="RandomProductsLabel" ></asp:ListItem>
                <asp:ListItem Value="7" resourcekey="RelatedProductsLabel" ></asp:ListItem>
				<asp:ListItem Value="10" resourcekey="SameCategoryProductsLabel"></asp:ListItem>
                <asp:ListItem Value="8" resourcekey="SimilarProductsLabel" ></asp:ListItem>
                <asp:ListItem Value="6" resourcekey="CustomCategoriesLabel" ></asp:ListItem>
				<asp:ListItem Value="5" resourcekey="CustomProductsLabel" ></asp:ListItem>
			</asp:DropDownList>
		</div>
		<asp:Panel ID="CustomProductPanel" runat="server" CssClass="dnnFormItem">
			<dnn1:LabelControl ID="CustomProductIDListLabelControl" runat="server" />
			<asp:RegularExpressionValidator ID="CustomProductIDListRegularExpressionValidator4" runat="server" ControlToValidate="CustomProductIDListTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\d\|]+$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
			<asp:TextBox ID="CustomProductIDListTextBox" runat="server"></asp:TextBox>
		</asp:Panel>
		<asp:Panel ID="CustomCategoryPanel" runat="server" CssClass="dnnFormItem">
			<dnn1:LabelControl ID="CustomCategoryIDListLabelControl" runat="server" />
			<asp:RegularExpressionValidator ID="CustomCategoryIDListRegularExpressionValidator4" runat="server" ControlToValidate="CustomCategoryIDListTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\d\|]+$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
			<asp:TextBox ID="CustomCategoryIDListTextBox" runat="server"></asp:TextBox>
		</asp:Panel>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MaxItemsLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="MaxItemsRequiredFieldValidator" runat="server" ControlToValidate="MaxItemsTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="MaxItemsRangeValidator" runat="server" ControlToValidate="MaxItemsTextBox" CssClass="dnnFormMessage dnnFormError" MaximumValue="100000" MinimumValue="1" Type="Integer" ValidationGroup="DetailsViewControl" Display="Dynamic"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:TextBox ID="MaxItemsTextBox" runat="server" CssClass="dnnFormRequired"></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="VisibleMaxItemsLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="VisibleMaxItemsRequiredFieldValidator" runat="server" ControlToValidate="VisibleMaxItemsTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="VisibleMaxItemsRangeValidator" runat="server" ControlToValidate="VisibleMaxItemsTextBox" CssClass="dnnFormMessage dnnFormError" MaximumValue="100000" MinimumValue="1" Type="Integer" ValidationGroup="DetailsViewControl" Display="Dynamic"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:TextBox ID="VisibleMaxItemsTextBox" runat="server" CssClass="dnnFormRequired"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="DisplayEffectLabelControl" runat="server" />
			<asp:DropDownList ID="DisplayEffectDropDownList" runat="server" >
				<asp:ListItem Value="1" resourcekey="AutomaticAdvanceLabel" ></asp:ListItem>
				<asp:ListItem Value="2" resourcekey="ButtonMouseOverLabel" ></asp:ListItem>
				<asp:ListItem Value="3" resourcekey="ButtonClickLabel" ></asp:ListItem>
			</asp:DropDownList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="FrameDurationLabelControl" runat="server" />
			<asp:RangeValidator ID="FrameDurationRangeValidator" runat="server" ControlToValidate="FrameDurationTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="1000000" MinimumValue="0" Type="Integer" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:TextBox ID="FrameDurationTextBox" runat="server"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="WrapFramesLabelControl" runat="server" />
			<asp:CheckBox ID="WrapFramesCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="HeightLabelControl" runat="server"/>
			<asp:RegularExpressionValidator ID="HeightRegularExpressionValidator" runat="server" ControlToValidate="HeightTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\d\|]+(px|%){0,1}$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
			<asp:TextBox ID="HeightTextBox" runat="server"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="WidthLabelControl" runat="server" />
			<asp:RegularExpressionValidator ID="WidthRegularExpressionValidator" runat="server" ControlToValidate="WidthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\d\|]+(px|%){0,1}$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
			<asp:TextBox ID="WidthTextBox" runat="server"></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductShowcasePriceShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductShowcasePriceShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductShowcaseQuantityShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductShowcaseQuantityShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductShowcaseAddToCartShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductShowcaseAddToCartShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductShowcaseBuyNowShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductShowcaseBuyNowShowCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductShowcaseSeeDetailsShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductShowcaseSeeDetailsShowCheckBox" runat="server" />
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
