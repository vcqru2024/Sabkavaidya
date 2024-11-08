<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddressValidationProviderConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.AddressValidationProviderConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
<h2><%= LocalizeString("AddressValidationProviderHeader") %></h2>
<asp:Panel ID="DetailsViewPanel" runat="server">
	<hr />
	<fieldset>
		<asp:MultiView ID="DetailsMultiView" runat="server">
			<asp:View ID="AvaTaxView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="AddressValidationProvidersAvalaraTaxAccountNumberLabelControl" runat="server" />
					<asp:TextBox ID="AddressValidationProvidersAvalaraTaxAccountNumberTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="AddressValidationProvidersAvalaraTaxLicenseKeyLabelControl" runat="server" />
					<asp:TextBox ID="AddressValidationProvidersAvalaraTaxLicenseKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="AddressValidationProvidersAvalaraTaxProviderUrlLabelControl" runat="server" />
					<asp:TextBox ID="AddressValidationProvidersAvalaraTaxProviderUrlTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="AddressValidationProvidersAvalaraTaxTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="AddressValidationProvidersAvalaraTaxTestModeCheckBox" runat="server"></asp:CheckBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="AvalaraAddressValidationTestConnectionLabelControl" runat="server" Text="" />
					<asp:LinkButton ID="AvalaraAddressValidationTestConnectionLinkButton" resourcekey="AvalaraAddressValidationTestConnectionLinkButton" runat="server" CssClass="btn btn-default btn-light" OnClick="TestConnectionLinkButton_Click" CommandArgument="AvaTax"></asp:LinkButton>
				</div>
			</asp:View>
			<asp:View ID="USPSView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="AddressValidationProvidersUSPSUserIDLabelControl" runat="server" />
					<asp:TextBox ID="AddressValidationProvidersUSPSUserIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
			</asp:View>
		</asp:MultiView>
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
