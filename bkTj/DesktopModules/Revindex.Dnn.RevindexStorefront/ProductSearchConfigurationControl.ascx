<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductSearchConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductSearchConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("ProductSearchHeader") %></h2>
<div class="row rvdsf-actionbar-container">
    <div class="col-sm-6">
		<asp:LinkButton ID="ReindexLinkButton" runat="server" OnClick="ReindexLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-link" CausesValidation="False" ><em class="glyphicon glyphicon-refresh fa fas fa-sync"></em> <%= LocalizeString("ReindexProductsLink") %></asp:LinkButton>			
    </div>
    <div class="col-sm-6 text-sm-right">

    </div>
</div>
<div>
	<hr />
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductSearchDisplayTemplateLabelControl" runat="server"/>
			<uc1:DisplayTemplateDropDownListControl ID="ProductSearchDisplayTemplateDropDownListControl" runat="server" />
			<asp:LinkButton ID="ProductSearchDisplayTemplateLinkButton" runat="server" OnClick="ProductSearchDisplayTemplateLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductSearchResultsMaxLabelControl" runat="server"/>
			<asp:RequiredFieldValidator ID="ProductSearchResultsMaxRequiredFieldValidator" runat="server" ControlToValidate="ProductSearchResultsMaxTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="ProductSearchResultsMaxRangeValidator" runat="server" ControlToValidate="ProductSearchResultsMaxTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="ProductSearchResultsMaxCompareValidator" runat="server" ControlToValidate="ProductSearchResultsMaxTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="ProductSearchResultsMaxTextBox" runat="server" value="100" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductSearchNameSearchableLabelControl" runat="server" />
			<asp:CheckBox ID="ProductSearchNameSearchableCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductSearchOverviewSearchableLabelControl" runat="server" />
			<asp:CheckBox ID="ProductSearchOverviewSearchableCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductSearchSummarySearchableLabelControl" runat="server" />
			<asp:CheckBox ID="ProductSearchSummarySearchableCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductSearchSpecificationsSearchableLabelControl" runat="server" />
			<asp:CheckBox ID="ProductSearchSpecificationsSearchableCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductSearchTermsSearchableLabelControl" runat="server" />
			<asp:CheckBox ID="ProductSearchTermsSearchableCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductSearchFAQSearchableLabelControl" runat="server" />
			<asp:CheckBox ID="ProductSearchFAQSearchableCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductSearchBuyingGuideSearchableLabelControl" runat="server" />
			<asp:CheckBox ID="ProductSearchBuyingGuideSearchableCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductSearchSKUSearchableLabelControl" runat="server" />
			<asp:CheckBox ID="ProductSearchSKUSearchableCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductSearchUniversalProductCodeSearchableLabelControl" runat="server" />
			<asp:CheckBox ID="ProductSearchUniversalProductCodeSearchableCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
            <dnn1:LabelControl ID="ProductSearchPhraseOperatorLabelControl" runat="server" />
            <asp:RadioButtonList ID="ProductSearchPhraseOperatorRadioButtonList" runat="server" RepeatDirection="Horizontal" CssClass="dnnFormRadioButtons">
                <asp:ListItem resourcekey="ANDLabel" Value="AND" ></asp:ListItem>
                <asp:ListItem resourcekey="ORLabel" Value="OR" Selected="True"></asp:ListItem>
            </asp:RadioButtonList>
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
