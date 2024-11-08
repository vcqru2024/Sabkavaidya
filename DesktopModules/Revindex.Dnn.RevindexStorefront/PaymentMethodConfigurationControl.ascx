<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PaymentMethodConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.PaymentMethodConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="PaymentMethodAvailabilityRuleControl.ascx" TagName="PaymentMethodAvailabilityRuleControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="PlaceHolder1" runat="server">

    <script type="text/javascript">
    	jQuery(document).ready(function ()
    	{
    		$('#<%= DetailsViewPanel.ClientID %>').dnnPanels();
    	});
    	Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function ()
    	{
    		$('#<%= DetailsViewPanel.ClientID %>').dnnPanels();
    	});
    </script>

</asp:PlaceHolder>
<div> 
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
            <asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
			<h2><%= LocalizeString("PaymentMethodsHeader") %></h2>
			<asp:Panel ID="DetailsViewPanel" runat="server">
				<h2 id="NoneFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.None).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<p><%= LocalizeString("NonePaymentMethodDescriptionLabel") %></p>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsNoneActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsNoneActiveCheckBox" runat="server" />
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsNoneAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
                <h2 id="ACHFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.ACH).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsACHActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsACHActiveCheckBox" runat="server" />
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsACHPaymentGatewayLabelControl" runat="server" />
						<asp:DropDownList ID="PaymentMethodsACHPaymentGatewayDropDownList" runat="server" OnSelectedIndexChanged="PaymentMethodsACHPaymentGatewayDropDownList_SelectedIndexChanged" AutoPostBack="True">
							<asp:ListItem Text="Manual" Value="" />
							<asp:ListItem Text="FTNI" Value="FTNIACH" />
						</asp:DropDownList>
						<asp:HyperLink ID="PaymentMethodsACHPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsACHAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="AuthorizeNetCIMFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.AuthorizeNetCIM).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsAuthorizeNetCIMActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsAuthorizeNetCIMActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsAuthorizeNetCIMPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsAuthorizeNetCIMTransactionTypeLabelControl" runat="server" />
						<asp:RadioButtonList ID="PaymentMethodsAuthorizeNetCIMTransactionTypeRadioButtonList" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Text="Authorize" Value="1" />
							<asp:ListItem Text="Purchase" Value="2" />
						</asp:RadioButtonList>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsAuthorizeNetCIMAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="AuthorizeNetSIMFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.AuthorizeNetSIM).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsAuthorizeNetSIMActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsAuthorizeNetSIMActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsAuthorizeNetSIMPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsAuthorizeNetSIMAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="CardlinkRedirectFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.CardlinkRedirect).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsCardlinkRedirectActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsCardlinkRedirectActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsCardlinkRedirectPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsCardlinkRedirectAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="CashFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.Cash).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsCashActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsCashActiveCheckBox" runat="server" />
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsCashAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="CheckFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.Check).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsCheckActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsCheckActiveCheckBox" runat="server" />
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsCheckAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
                <h2 id="ClearFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.Clear).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsClearActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsClearActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsClearPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsClearAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="CreditCardFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.CreditCard).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsCreditCardActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsCreditCardActiveCheckBox" runat="server" />
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsCreditCardPaymentGatewayLabelControl" runat="server" />
						<asp:DropDownList ID="PaymentMethodsCreditCardPaymentGatewayDropDownList" runat="server" OnSelectedIndexChanged="PaymentMethodsCreditCardPaymentGatewayDropDownList_SelectedIndexChanged" AutoPostBack="True">
							<asp:ListItem Text="Manual" Value="" />
                            <asp:ListItem Text="Authorize.Net Accept" Value="AuthorizeNetAccept" />
							<asp:ListItem Text="Authorize.Net AIM" Value="AuthorizeNetAIM" />
                            <asp:ListItem Text="Barclaycard" Value="Barclaycard" />
							<asp:ListItem Text="BluePay" Value="BluePay" />
							<asp:ListItem Text="Braintree" Value="Braintree" />
                            <asp:ListItem Text="Cardstream Direct" Value="CardstreamDirect" />
							<asp:ListItem Text="CashFlows Remote API" Value="CashFlowsRemoteAPI" />
							<asp:ListItem Text="Chase Paymentech Orbital Gateway" Value="ChasePaymentechOG" />
                            <asp:ListItem Text="Corduro" Value="Corduro" />
							<asp:ListItem Text="CyberSource" Value="CyberSourceSoap" />
							<asp:ListItem Text="Elavon Virtual Merchant" Value="ElavonVirtualMerchant" />
							<asp:ListItem Text="eProcessing Network" Value="eProcessingNetwork" />
							<asp:ListItem Text="eWay Direct Payment" Value="eWayDirectPayment" />
							<asp:ListItem Text="FirstData Global Gateway" Value="FirstDataGGWS" />
                            <asp:ListItem Text="FTNI" Value="FTNI" />
							<asp:ListItem Text="Intuit QuickBooks Merchant Service" Value="IntuitQBMS" />
							<asp:ListItem Text="Intuit QuickBooks Payments" Value="IntuitQBPayments" />
							<asp:ListItem Text="Merchant e-Solutions" Value="MerchanteSolutions" />
							<asp:ListItem Text="Moneris eSelectPlus Canada" Value="MonerisESPCA" />
							<asp:ListItem Text="NMI" Value="NMI" />
                            <asp:ListItem Text="Payment Express PXPost" Value="PaymentExpressPXPost" />
							<asp:ListItem Text="PayPal Payments Pro (Payflow)" Value="PayPalPP" />
							<asp:ListItem Text="PayPal Website Payments Pro" Value="PayPalWPP" />
							<asp:ListItem Text="Pay Trace" Value="PayTrace" />
							<asp:ListItem Text="PayU Enterprise" Value="PayUEnterprise" />
							<asp:ListItem Text="Peach Payments" Value="PeachXmlIntegrator" />
							<asp:ListItem Text="Pineapple Payments Transax" Value="PineappleTransax" />
							<asp:ListItem Text="Princeton CardConnect" Value="PrincetonCardConnect" />
							<asp:ListItem Text="PSiGate Xml Messenger" Value="PSiGateXmlMessenger" />
                            <asp:ListItem Text="Sage Payments Direct" Value="SageDirect" />
							<asp:ListItem Text="Sage Pay Direct" Value="SagePayDirect" />
                            <asp:ListItem Text="Square" Value="Square" />
							<asp:ListItem Text="Stripe" Value="Stripe" />
                            <asp:ListItem Text="Total Apps" Value="TotalAppsDirectPost" />
							<asp:ListItem Text="USA ePay" Value="USAePay" />
							<asp:ListItem Text="WorldPay Corporate XML Direct" Value="WorldPayCorporateXmlDirect" />
						</asp:DropDownList>
						<asp:HyperLink ID="PaymentMethodsCreditCardPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsCreditCardTransactionTypeLabelControl" runat="server" />
						<asp:RadioButtonList ID="PaymentMethodsCreditCardTransactionTypeRadioButtonList" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Text="Authorize" Value="1" />
							<asp:ListItem Text="Purchase" Value="2" />
						</asp:RadioButtonList>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsCreditCardAuthenticateIdentityLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsCreditCardAuthenticateIdentityCheckBox" runat="server" />
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsCreditCardTokenActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsCreditCardTokenActiveCheckBox" runat="server" />
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsCreditCardAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
                <h2 id="CustomHostedFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.CustomHosted).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsCustomHostedActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsCustomHostedActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsCustomHostedPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsCustomHostedAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="DotpayFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.Dotpay).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsDotpayActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsDotpayActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsDotpayPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsDotpayAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="FlutterwaveStandardFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.FlutterwaveStandard).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsFlutterwaveStandardActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsFlutterwaveStandardActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsFlutterwaveStandardPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsFlutterwaveStandardAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="FundFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.Fund).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsFundActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsFundActiveCheckBox" runat="server" />
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsFundAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="VoucherFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.Voucher).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<p><%= LocalizeString("VoucherPaymentMethodDescriptionLabel") %></p>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsVoucherActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsVoucherActiveCheckBox" runat="server" />
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsVoucherAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="IPayAfricaWebFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.IPayAfricaWeb).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsIPayAfricaWebActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsIPayAfricaWebActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsIPayAfricaWebPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsIPayAfricaWebAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="KlarnaPaymentsFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.KlarnaPayments).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsKlarnaPaymentsActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsKlarnaPaymentsActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsKlarnaPaymentsPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsKlarnaPaymentsAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="MasterCardIGSHostedFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.MasterCardIGSHosted).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsMasterCardIGSHostedActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsMasterCardIGSHostedActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsMasterCardIGSHostedPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsMasterCardIGSHostedAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="MollieFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.Mollie).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsMollieActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsMollieActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsMolliePaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsMollieAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="MoneyOrderFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.MoneyOrder).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsMoneyOrderActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsMoneyOrderActiveCheckBox" runat="server" />
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsMoneyOrderAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="PaymentExpressFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.PaymentExpress).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsPaymentExpressActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsPaymentExpressActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsPaymentExpressPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsPaymentExpressAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="PayFastFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.PayFast).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsPayFastActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsPayFastActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsPayFastPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsPayFastAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="PayPalFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.PayPal).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsPayPalActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsPayPalActiveCheckBox" runat="server" />
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsPayPalPaymentGatewayLabelControl" runat="server" />
						<asp:DropDownList ID="PaymentMethodsPayPalPaymentGatewayDropDownList" runat="server" OnSelectedIndexChanged="PaymentMethodsPayPalPaymentGatewayDropDownList_SelectedIndexChanged" AutoPostBack="True">
							<asp:ListItem Text="PayPal Checkout" Value="PayPalCheckout" />
							<asp:ListItem Text="PayPal Express Checkout" Value="PayPalEC" />
							<asp:ListItem Text="PayPal Standard" Value="PayPalWPS" />
						</asp:DropDownList>
						<asp:HyperLink ID="PaymentMethodsPayPalPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsPayPalAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="Paystation3PartyFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.Paystation3Party).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsPaystation3PartyActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsPaystation3PartyActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsPaystation3PartyPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsPaystation3PartyAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="PayUBusinessFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.PayUBusiness).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsPayUBusinessActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsPayUBusinessActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsPayUBusinessPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsPayUBusinessAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="PayULatamWebCheckoutFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.PayULatamWebCheckout).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsPayULatamWebCheckoutActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsPayULatamWebCheckoutActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsPayULatamWebCheckoutPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsPayULatamWebCheckoutAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="RewardsPointFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.RewardsPoint).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsRewardsPointActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsRewardsPointActiveCheckBox" runat="server" />
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsRewardsPointAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="SagePayFormFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.SagePayForm).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsSagePayFormActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsSagePayFormActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsSagePayFormPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsSagePayFormAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="VenmoFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.Venmo).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsVenmoActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsVenmoActiveCheckBox" runat="server" />
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsVenmoPaymentGatewayLabelControl" runat="server" />
						<asp:DropDownList ID="PaymentMethodsVenmoPaymentGatewayDropDownList" runat="server" OnSelectedIndexChanged="PaymentMethodsVenmoPaymentGatewayDropDownList_SelectedIndexChanged" AutoPostBack="True">
							<asp:ListItem Text="Braintree" Value="Braintree" />
						</asp:DropDownList>
						<asp:HyperLink ID="PaymentMethodsVenmoPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsVenmoAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="VirtualCardServicesPayFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.VirtualCardServicesPay).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsVirtualCardServicesPayActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsVirtualCardServicesPayActiveCheckBox" runat="server" />
						<asp:HyperLink ID="PaymentMethodsVirtualCardServicesPaymentGatewayHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsVirtualCardServicesPayAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<h2 id="WireTransferFormSectionHead" class="dnnFormSectionHead">
					<a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentMethodType.WireTransfer).ToString(), Global.FilePaths.LocalPaymentMethodTypeResourceFile) %></a></h2>
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="PaymentMethodsWireTransferActiveLabelControl" runat="server" />
						<asp:CheckBox ID="PaymentMethodsWireTransferActiveCheckBox" runat="server" />
					</div>
					<uc1:PaymentMethodAvailabilityRuleControl ID="PaymentMethodsWireTransferAvailabilityRuleControl" runat="server" Width="100%" />
				</fieldset>
				<div class="row rvdsf-footerbar-container">
					<div class="col-sm-6">
                                
					</div>
					<div class="col-sm-6 text-sm-right">
						<asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />     
					</div>
				</div>
			</asp:Panel>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
