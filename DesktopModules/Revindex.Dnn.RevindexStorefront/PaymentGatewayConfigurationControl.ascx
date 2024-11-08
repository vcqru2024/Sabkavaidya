<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PaymentGatewayConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.PaymentGatewayConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
<h2><%= LocalizeString("PaymentGatewayHeader") %></h2>
<asp:Panel ID="DetailsViewPanel" runat="server" >
	<hr />
	<fieldset>
		<asp:MultiView ID="DetailsMultiView" runat="server">
            <asp:View ID="AuthorizeNetAcceptView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetAcceptLoginLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysAuthorizeNetAcceptLoginTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetAcceptTranKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysAuthorizeNetAcceptTranKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
                <div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetAcceptPublicKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysAuthorizeNetAcceptPublicKeyTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetAcceptTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysAuthorizeNetAcceptTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="AuthorizeNetAIMView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetAIMGatewayUrlLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysAuthorizeNetAIMGatewayUrlTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetAIMLoginLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysAuthorizeNetAIMLoginTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetAIMTranKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysAuthorizeNetAIMTranKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetAIMDuplicateWindowLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysAuthorizeNetAIMDuplicateWindowTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetAIMTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysAuthorizeNetAIMTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="AuthorizeNetCIMView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetCIMLoginLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysAuthorizeNetCIMLoginTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetCIMTranKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysAuthorizeNetCIMTranKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetCIMDuplicateWindowLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysAuthorizeNetCIMDuplicateWindowTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetCIMTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysAuthorizeNetCIMTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="AuthorizeNetSIMView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetSIMGatewayUrlLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysAuthorizeNetSIMGatewayUrlTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetSIMLoginLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysAuthorizeNetSIMLoginTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetSIMTranKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysAuthorizeNetSIMTranKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetSIMSignatureKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysAuthorizeNetSIMSignatureKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetSIMDuplicateWindowLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysAuthorizeNetSIMDuplicateWindowTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysAuthorizeNetSIMTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysAuthorizeNetSIMTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
            <asp:View ID="BarclaycardView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysBarclaycardPSPIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysBarclaycardPSPIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysBarclaycardUserIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysBarclaycardUserIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysBarclaycardPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysBarclaycardPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysBarclaycardShaInLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysBarclaycardShaInTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysBarclaycardTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysBarclaycardTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="BluePayView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysBluePayAccountIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysBluePayAccountIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysBluePaySecretKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysBluePaySecretKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysBluePayTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysBluePayTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="BraintreeView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysBraintreePublicKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysBraintreePublicKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysBraintreePrivateKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysBraintreePrivateKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysBraintreeTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysBraintreeTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="CardlinkRedirectView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCardlinkRedirectMerchantIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCardlinkRedirectMerchantIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCardlinkRedirectSharedSecretLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCardlinkRedirectSharedSecretTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCardlinkRedirectGatewayUrlLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCardlinkRedirectGatewayUrlTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCardlinkRedirectCssUrlLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCardlinkRedirectCssUrlTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
			</asp:View>
            <asp:View ID="CardstreamDirectView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCardstreamDirectMerchantIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCardstreamDirectMerchantIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCardstreamDirectSharedKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCardstreamDirectSharedKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
			</asp:View>
			<asp:View ID="CashFlowsRemoteAPIView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCashFlowsRemoteAPIProfileIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCashFlowsRemoteAPIProfileIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCashFlowsRemoteAPIPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCashFlowsRemoteAPIPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCashFlowsRemoteAPITestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysCashFlowsRemoteAPITestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="ChasePaymentechOGView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysChasePaymentechOGUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysChasePaymentechOGUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysChasePaymentechOGPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysChasePaymentechOGPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysChasePaymentechOGMerchantIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysChasePaymentechOGMerchantIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysChasePaymentechOGTerminalIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysChasePaymentechOGTerminalIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysChasePaymentechOGBinLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysChasePaymentechOGBinTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysChasePaymentechOGTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysChasePaymentechOGTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
            <asp:View ID="ClearView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysClearMerchantIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysClearMerchantIDTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysClearPublicKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysClearPublicKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysClearPrivateKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysClearPrivateKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
                <div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysClearTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysClearTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
            <asp:View ID="CorduroView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCorduroClientNumberLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCorduroClientNumberTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCorduroUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCorduroUsernameTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCorduroPasswordKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCorduroPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCorduroProcessAccountNumberLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCorduroProcessAccountNumberTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCorduroCertificateLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCorduroCertificateTextBox" runat="server" MaxLength="8000" Rows="6" TextMode="MultiLine" Wrap="False"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCorduroTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysCorduroTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
            <asp:View ID="CustomHostedView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCustomHostedGatewayUrlLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCustomHostedGatewayUrlTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCustomHostedUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCustomHostedUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCustomHostedPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCustomHostedPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
                <div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCustomHostedPassphraseLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCustomHostedPassphraseTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCustomHostedRequestMethodLabelControl" runat="server" />
					<asp:RadioButtonList ID="PaymentGatewaysCustomHostedRequestMethodRadioButtonList" runat="server">
                        <asp:ListItem Value="GET">GET</asp:ListItem>
                        <asp:ListItem Value="POST">POST</asp:ListItem>
					</asp:RadioButtonList>
				</div>
			</asp:View>
			<asp:View ID="CyberSourceSoapView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCyberSourceSoapMerchantIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCyberSourceSoapMerchantIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCyberSourceSoapTransactionKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysCyberSourceSoapTransactionKeyTextBox" runat="server" MaxLength="500"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysCyberSourceSoapTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysCyberSourceSoapTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="DotpayView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysDotpayAccountIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysDotpayAccountIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysDotpayPinLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysDotpayPinTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysDotpayTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysDotpayTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="ElavonVirtualMerchantView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysElavonVirtualMerchantAccountIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysElavonVirtualMerchantAccountIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysElavonVirtualMerchantUserIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysElavonVirtualMerchantUserIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysElavonVirtualMerchantPinLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysElavonVirtualMerchantPinTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysElavonVirtualMerchantTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysElavonVirtualMerchantTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="eProcessingNetworkView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewayseProcessingNetworkAccountNumberLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewayseProcessingNetworkAccountNumberTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewayseProcessingNetworkRestrictKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewayseProcessingNetworkRestrictKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewayseProcessingNetworkTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewayseProcessingNetworkTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="eWayDirectPaymentView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewayseWayDirectPaymentCustomerIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewayseWayDirectPaymentCustomerIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewayseWayDirectPaymentRefundPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewayseWayDirectPaymentRefundPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewayseWayDirectPaymentTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewayseWayDirectPaymentTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="FirstDataGGWSView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysFirstDataGGWSUserLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysFirstDataGGWSUserTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysFirstDataGGWSPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysFirstDataGGWSPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysFirstDataGGWSCertificateLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysFirstDataGGWSCertificateTextBox" runat="server" MaxLength="8000" Rows="6" TextMode="MultiLine" Wrap="False"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysFirstDataGGWSTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysFirstDataGGWSTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="FlutterwaveStandardView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysFlutterwaveStandardSecretKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysFlutterwaveStandardSecretKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
			</asp:View>
            <asp:View ID="FTNIView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysFTNIUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysFTNIUsernameTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysFTNIPasswordKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysFTNIPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
                <div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysFTNISettlementKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysFTNISettlementTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysFTNITestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysFTNITestModeCheckBox" runat="server" />
				</div>
			</asp:View>
            <asp:View ID="FTNIACHView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysFTNIACHUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysFTNIACHUsernameTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysFTNIACHPasswordKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysFTNIACHPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
                <div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysFTNIACHSettlementKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysFTNIACHSettlementTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysFTNIACHTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysFTNIACHTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="IntuitQBMSView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysIntuitQBMSAppIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysIntuitQBMSAppIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysIntuitQBMSAppLoginLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysIntuitQBMSAppLoginTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysIntuitQBMSConnectionTicketLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysIntuitQBMSConnectionTicketTextBox" runat="server"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysIntuitQBMSTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysIntuitQBMSTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="IntuitQBPaymentsView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysIntuitQBPaymentsClientIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysIntuitQBPaymentsClientIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysIntuitQBPaymentsClientSecretLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysIntuitQBPaymentsClientSecretTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysIntuitQBPaymentsTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysIntuitQBPaymentsTestModeCheckBox" runat="server" />
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysIntuitQBPaymentsAuthenticatedLabelControl" runat="server" Text="" />
					<asp:Label ID="PaymentGatewaysIntuitQBPaymentsAuthenticatedLabel" runat="server" resourcekey="PaymentGatewaysIntuitQBPaymentsAuthenticatedLabel" CssClass="badge"></asp:Label>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysIntuitQBPaymentsAuthenticateLabelControl" runat="server" Text="" />
					<asp:LinkButton ID="PaymentGatewaysIntuitQBPaymentsAuthenticateLinkButton" resourcekey="AuthenticateLinkButton" runat="server" CssClass="btn btn-primary" OnClick="PaymentGatewaysIntuitQBPaymentsAuthenticateLinkButton_Click" ></asp:LinkButton>
				</div>
			</asp:View>
			<asp:View ID="IPayAfricaWebView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysIPayAfricaWebVendorIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysIPayAfricaWebVendorIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysIPayAfricaWebSecretKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysIPayAfricaWebSecretKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysIPayAfricaWebTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysIPayAfricaWebTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="KlarnaPaymentsView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysKlarnaPaymentsUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysKlarnaPaymentsUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysKlarnaPaymentsPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysKlarnaPaymentsPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysKlarnaPaymentsGatewayUrlLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysKlarnaPaymentsGatewayUrlTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
			</asp:View>
			<asp:View ID="MasterCardIGSHostedView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysMasterCardIGSHostedMerchantIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysMasterCardIGSHostedMerchantIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysMasterCardIGSHostedAccessCodeLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysMasterCardIGSHostedAccessCodeTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysMasterCardIGSHostedSecureHashSecretLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysMasterCardIGSHostedSecureHashSecretTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysMasterCardIGSHostedTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysMasterCardIGSHostedTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="MerchanteSolutionsView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysMerchanteSolutionsProfileIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysMerchanteSolutionsProfileIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysMerchanteSolutionsProfileKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysMerchanteSolutionsProfileKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysMerchanteSolutionsTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysMerchanteSolutionsTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="MollieView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysMolliePartnerIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysMollieAPIKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
			</asp:View>
			<asp:View ID="MonerisESPCAView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysMonerisESPCAStoreIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysMonerisESPCAStoreIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysMonerisESPCAAPITokenLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysMonerisESPCAAPITokenTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysMonerisESPCATestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysMonerisESPCATestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="NMIView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysNMIKeyIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysNMIKeyIDTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysNMIKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysNMIKeyTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysNMIUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysNMIUsernameTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysNMIPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysNMIPasswordTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysNMIGatewayUrlLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysNMIGatewayUrlTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
			</asp:View>
			<asp:View ID="PaymentExpressView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPaymentExpressPXPayUserIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPaymentExpressPXPayUserIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPaymentExpressPXPayKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPaymentExpressPXPayKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPaymentExpressPXPayTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPaymentExpressPXPayTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
            <asp:View ID="PaymentExpressPXPostView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPaymentExpressPXPostUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPaymentExpressPXPostUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPaymentExpressPXPostPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPaymentExpressPXPostPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPaymentExpressPXPostTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPaymentExpressPXPostTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="PayFastWPView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayFastWPMerchantIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayFastWPMerchantIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayFastWPMerchantKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayFastWPMerchantKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayFastWPPDTKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayFastWPPDTKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayFastWPTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPayFastWPTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="PayPalCheckoutView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalCheckoutClientIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayPalCheckoutClientIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalCheckoutSecretLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayPalCheckoutSecretTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalCheckoutTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPayPalCheckoutTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="PayPalECView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalECUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayPalECUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalECPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayPalECPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalECSignatureLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayPalECSignatureTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalECShippingFormActiveLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPayPalECShippingFormActiveCheckBox" runat="server" />
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalECTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPayPalECTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="PayPalPPView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalPPUserLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayPalPPUserTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalPPVendorLabelControl2" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayPalPPVendorTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalPPPartnerLabelControl3" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayPalPPPartnerTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalPPPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayPalPPPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalPPTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPayPalPPTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="PayPalWPPView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalWPPUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayPalWPPUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalWPPPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayPalWPPPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalWPPSignatureLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayPalWPPSignatureTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalWPPTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPayPalWPPTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="PayPalWPSView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalWPSEmailLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayPalWPSEmailTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalWPSUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayPalWPSUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalWPSPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayPalWPSPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalWPSSignatureLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayPalWPSSignatureTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalWPSShippingFormActiveLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPayPalWPSShippingFormActiveCheckBox" runat="server" />
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayPalWPSTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPayPalWPSTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="Paystation3PartyView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPaystation3PartyGatewayIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPaystation3PartyGatewayIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPaystation3PartyPaystationIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPaystation3PartyPaystationIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPaystation3PartyTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPaystation3PartyTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="PayTraceView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayTraceUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayTraceUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayTracePasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayTracePasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayTraceTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPayTraceTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="PayUBusinessView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayUBusinessUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayUBusinessUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayUBusinessPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayUBusinessPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayUBusinessSafekeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayUBusinessSafekeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayUBusinessPaymentMethodsLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayUBusinessPaymentMethodsTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayUBusinessTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPayUBusinessTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="PayUEnterpriseView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayUEnterpriseUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayUEnterpriseUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayUEnterprisePasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayUEnterprisePasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayUEnterpriseSafekeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayUEnterpriseSafekeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayUEnterpriseTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPayUEnterpriseTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="PayULatamWebCheckoutView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayULatamWebCheckoutMerchantIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayULatamWebCheckoutMerchantIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayULatamWebCheckoutAccountIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayULatamWebCheckoutAccountIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayULatamWebCheckoutApiKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPayULatamWebCheckoutApiKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPayULatamWebCheckoutTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPayULatamWebCheckoutTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="PeachXmlIntegratorView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPeachXmlIntegratorSenderLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPeachXmlIntegratorSenderTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPeachXmlIntegratorLoginLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPeachXmlIntegratorLoginTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPeachXmlIntegratorPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPeachXmlIntegratorPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPeachXmlIntegratorRegistrationChannelLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPeachXmlIntegratorRegistrationChannelTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPeachXmlIntegratorPaymentChannelLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPeachXmlIntegratorPaymentChannelTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPeachXmlIntegratorTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPeachXmlIntegratorTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="PineappleTransaxView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPineappleTransaxUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPineappleTransaxUsernameTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPineappleTransaxPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPineappleTransaxPasswordTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
			</asp:View>
			<asp:View ID="PrincetonCardConnectView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPrincetonCardConnectMerchantIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPrincetonCardConnectMerchantIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPrincetonCardConnectUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPrincetonCardConnectUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPrincetonCardConnectPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPrincetonCardConnectPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPrincetonCardConnectGatewayUrlLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPrincetonCardConnectGatewayUrlTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPrincetonCardConnectTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPrincetonCardConnectTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="PSiGateXMLMessengerView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPSiGateXmlMessengerStoreIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPSiGateXmlMessengerStoreIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPSiGateXmlMessengerPassphraseLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysPSiGateXmlMessengerPassphraseTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysPSiGateXmlMessengerTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysPSiGateXmlMessengerTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
            <asp:View ID="SageDirectView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysSageDirectMerchantIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysSageDirectMerchantIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysSageDirectMerchantKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysSageDirectMerchantKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
			</asp:View>
			<asp:View ID="SagePayDirectView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysSagePayDirectVendorNameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysSagePayDirectVendorNameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysSagePayDirectTestModeLabelControl3" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysSagePayDirectTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="SagePayFormView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysSagePayFormVendorNameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysSagePayFormVendorNameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysSagePayFormEncryptionPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysSagePayFormEncryptionPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysSagePayFormTestModeLabelControl3" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysSagePayFormTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
            <asp:View ID="SquareView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysSquareAccessTokenLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysSquareAccessTokenTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysSquareApplicationIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysSquareApplicationIDTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
                <div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysSquareLocationIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysSquareLocationIDTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysSquareTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysSquareTestModeCheckBox" runat="server" ></asp:CheckBox>
				</div>
			</asp:View>
			<asp:View ID="StripeView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysStripeSecretKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysStripeSecretKeyTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysStripePublishableKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysStripePublishableKeyTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysStripeSigningSecretLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysStripeSigningSecretTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
			</asp:View>
            <asp:View ID="TotalAppsDirectPostView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysTotalAppsDirectPostUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysTotalAppsDirectPostUsernameTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysTotalAppsDirectPostPasswordKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysTotalAppsDirectPostPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
			</asp:View>
			<asp:View ID="USAePayView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysUSAePaySourceKeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysUSAePaySourceKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysUSAePayTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysUSAePayTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="VirtualCardServicesPayView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysVirtualCardServicesPayTerminalIDLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysVirtualCardServicesPayTerminalIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysVirtualCardServicesPayMD5KeyLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysVirtualCardServicesPayMD5KeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysVirtualCardServicesPayUsernameLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysVirtualCardServicesPayUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysVirtualCardServicesPayPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysVirtualCardServicesPayPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
			</asp:View>
			<asp:View ID="WorldPayCorporateXMLDirectView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysWorldPayCorporateXmlDirectMerchantCodeLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysWorldPayCorporateXmlDirectMerchantCodeTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysWorldPayCorporateXmlDirectXmlPasswordLabelControl" runat="server" />
					<asp:TextBox ID="PaymentGatewaysWorldPayCorporateXmlDirectXmlPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="PaymentGatewaysWorldPayCorporateXmlDirectTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="PaymentGatewaysWorldPayCorporateXmlDirectTestModeCheckBox" runat="server" />
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
