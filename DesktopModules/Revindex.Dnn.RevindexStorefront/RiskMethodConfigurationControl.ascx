<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RiskMethodConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.RiskMethodConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("RiskMethodsHeader") %></h2>

<script type="text/javascript">
	jQuery(function($)
	{
		$('#<%= DetailsViewPanel.ClientID %>').dnnPanels();
	});
</script>

<asp:Panel ID="DetailsViewPanel" runat="server">
	<h2 id="FraudFormSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("FraudHeader") %></a></h2>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RiskMethodsFraudActiveLabelControl" runat="server" />
			<asp:CheckBox ID="RiskMethodsFraudActiveCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="RiskMethodsFraudRiskProviderLabelControl" runat="server" />
			<asp:DropDownList ID="RiskMethodsFraudRiskProviderDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RiskMethodsFraudRiskProviderDropDownList_SelectedIndexChanged">
				<asp:ListItem Text="Manual" Value="" />
                <asp:ListItem Text="FraudLabs Pro" Value="FraudLabsPro" />
				<asp:ListItem Text="Sift Science" Value="SiftScience" />
			</asp:DropDownList>
			<asp:HyperLink ID="RiskMethodsFraudRiskProviderHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
		</div>
	</fieldset>
	<h2 id="SpamFormSectionHead" class="dnnFormSectionHead"><a href="#"><%= LocalizeString("SpamHeader") %></a></h2>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RiskMethodsSpamActiveLabelControl" runat="server" />
			<asp:CheckBox ID="RiskMethodsSpamActiveCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="RiskMethodsSpamRiskProviderLabelControl" runat="server" />
			<asp:DropDownList ID="RiskMethodsSpamRiskProviderDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RiskMethodsSpamRiskProviderDropDownList_SelectedIndexChanged">
                <asp:ListItem Text="Google Recaptcha" Value="GoogleRecaptcha" />
			</asp:DropDownList>
			<asp:HyperLink ID="RiskMethodsSpamRiskProviderHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RiskMethodsSpamApprovalScoreLabelControl" runat="server" />
			<asp:RequiredFieldValidator ID="RiskMethodsSpamApprovalScoreRequiredFieldValidator" runat="server" ControlToValidate="RiskMethodsSpamApprovalScoreTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="RiskMethodsSpamApprovalScoreRangeValidator" runat="server" ControlToValidate="RiskMethodsSpamApprovalScoreTextBox" MinimumValue="0" MaximumValue="100" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:TextBox ID="RiskMethodsSpamApprovalScoreTextBox" runat="server" TextMode="Number" CssClass="dnnFormRequired"></asp:TextBox>
		</div>
	</fieldset>
	<div class="row rvdsf-footerbar-container">
        <div class="col-sm-6">
                                
        </div>
        <div class="col-sm-6 text-sm-right">
            <asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />                    
        </div>
    </div>
</asp:Panel>
