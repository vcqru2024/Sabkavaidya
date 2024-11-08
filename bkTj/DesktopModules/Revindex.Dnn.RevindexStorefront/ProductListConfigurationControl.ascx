<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductListConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductListConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("ProductListHeader") %></h2>
<div>
	<hr />
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductListDisplayTemplateLabelControl" runat="server"  />
			<uc1:DisplayTemplateDropDownListControl ID="ProductListDisplayTemplateDropDownListControl" runat="server" />
			<asp:LinkButton ID="ProductListDisplayTemplateLinkButton" runat="server" OnClick="ProductListDisplayTemplateLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductListSortNaturalActiveLabelControl" runat="server" />
			<asp:CheckBox ID="ProductListSortNaturalActiveCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductListResultsMaxLabelControl" runat="server"/>
			<asp:RequiredFieldValidator ID="ProductListResultsMaxRequiredFieldValidator" runat="server" ControlToValidate="ProductListResultsMaxTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="ProductListResultsMaxRangeValidator" runat="server" ControlToValidate="ProductListResultsMaxTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="ProductListResultsMaxCompareValidator" runat="server" ControlToValidate="ProductListResultsMaxTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="ProductListResultsMaxTextBox" runat="server" value="100" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductListAddToFavoriteShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductListAddToFavoriteShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductListFilterShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductListFilterShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductListSearchShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductListSearchShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductListSubCategoryShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductListSubCategoryShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductListMSRPShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductListMSRPShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductListPriceShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductListPriceShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductListQuantityShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductListQuantityShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductListSavingsShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductListSavingsShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductListAddToCartShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductListAddToCartShowCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductListBuyNowShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductListBuyNowShowCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductListSeeDetailsShowLabelControl" runat="server" />
			<asp:CheckBox ID="ProductListSeeDetailsShowCheckBox" runat="server" />
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
