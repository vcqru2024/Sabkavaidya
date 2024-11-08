<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShippingProviderConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ShippingProviderConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>


<script type="text/javascript">	
    // Bind Kendo UI
    Sys.Application.add_load(function () {
		kendo.culture(Revindex.Portal.CultureCode)
		kendo.bind($(".rvdsf-content-container"))
    })
</script>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
<h2><%= LocalizeString("ShippingProviderHeader") %></h2>
<hr />
<asp:Panel ID="SearchPanel" runat="server" CssClass="rvdsfSearchContainer">
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl runat="server" ID="SellerSearchLabelControl"></dnn1:LabelControl>
			<asp:TextBox ID="SellerSearchTextBox" runat="server" data-role="combobox" data-clear-button="true" data-text-field="Name" data-value-field="SellerID" 
					data-source="{
						serverFiltering: true,
						serverPaging: true,
						pageSize: 50,
						transport: {
							read: {
								type: 'POST',
								url: function() { return servicesFramework.getServiceRoot('Revindex.Dnn.RevindexStorefront') + 'Seller/Lookup' },
									beforeSend: servicesFramework.setModuleHeaders,
								dataType: 'json',
								contentType: 'application/json; charset=UTF-8'
							},
							parameterMap: function (data, type) {
								return kendo.stringify({
									Query: data.filter.filters.length &gt; 0 ? data.filter.filters[0].value : '',
									ItemIndex: 0,
									MaxItems: data.pageSize
								})
							}
						},
						schema: {
							data: function (response) {

								// We need to decycle any circular references because Kendo UI can only support flat structure
								return JSON.decycle(response)
							}
						},
						sort: { field: 'Name', dir: 'asc' }
					}" 
					data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="SellerSearchTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
		</div>
	</fieldset>
</asp:Panel>
<asp:Panel ID="DetailsViewPanel" runat="server">
	<h2></h2>
	<fieldset>
		<asp:MultiView ID="DetailsMultiView" runat="server">
			<asp:View ID="ABFView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersABFSecureIDLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersABFSecureIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
			</asp:View>
			<asp:View ID="AustraliaPostView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersAustraliaPostAPIKeyLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersAustraliaPostAPIKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersAustraliaPostTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="ShippingProvidersAustraliaPostTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="CanadaPostView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersCanadaPostCustomerNumberLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersCanadaPostCustomerNumberTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersCanadaPostUserIDLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersCanadaPostUserIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersCanadaPostPasswordLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersCanadaPostPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersCanadaPostContractIDLabelControl0" runat="server" />
					<asp:TextBox ID="ShippingProvidersCanadaPostContractIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersCanadaPostTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="ShippingProvidersCanadaPostTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
            <asp:View ID="CouriersPleaseView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersCouriersPleaseAccountNumberLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersCouriersPleaseAccountNumberTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersCouriersPleaseAPIKeyLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersCouriersPleaseAPIKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersCouriersPleaseTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="ShippingProvidersCouriersPleaseTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
            <asp:View ID="DHLExpressView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersDHLExpressSiteIDLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersDHLExpressSiteIDTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersDHLExpressPasswordLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersDHLExpressPasswordTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersDHLExpressPaymentAccountNumberLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersDHLExpressPaymentAccountNumberTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersDHLExpressTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="ShippingProvidersDHLExpressTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="FedExView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersFedExKeyLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersFedExKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersFedExPasswordLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersFedExPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersFedExAccountNumberLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersFedExAccountNumberTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersFedExMeterNumberLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersFedExMeterNumberTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersFedExFreightAccountNumberLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersFedExFreightAccountNumberTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersFedExTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="ShippingProvidersFedExTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="PargoView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersPargoUsernameLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersPargoUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersPargoPasswordLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersPargoPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersPargoTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="ShippingProvidersPargoTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
            <asp:View ID="PurolatorView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersPurolatorKeyLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersPurolatorKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersPurolatorPasswordLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersPurolatorPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersPurolatorAccountNumberLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersPurolatorAccountNumberTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersPurolatorActivationKeyLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersPurolatorActivationKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersPurolatorTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="ShippingProvidersPurolatorTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="ShipwireView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersShipwireUsernameLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersShipwireUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersShipwirePasswordLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersShipwirePasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersShipwireTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="ShippingProvidersShipwireTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="SkyNetView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersSkyNetUsernameLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersSkyNetUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersSkyNetPasswordLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersSkyNetPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersSkyNetSystemIDLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersSkyNetSystemIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersSkyNetAccountNumberLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersSkyNetAccountNumberTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersSkyNetCustomerReferenceFormatLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersSkyNetCustomerReferenceFormatTextBox" runat="server" MaxLength="50"></asp:TextBox>
				</div>
			</asp:View>
			<asp:View ID="SoutheasternView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersSoutheasternUsernameLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersSoutheasternUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersSoutheasternPasswordLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersSoutheasternPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersSoutheasternCustomerAccountLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersSoutheasternCustomerAccountTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
			</asp:View>
			<asp:View ID="UnishippersView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersUnishippersUsernameLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersUnishippersUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersUnishippersPasswordLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersUnishippersPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersUnishippersCustomerNumberLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersUnishippersCustomerNumberTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersUnishippersUPSAccountNumberLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersUnishippersUPSAccountNumberTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
			</asp:View>
			<asp:View ID="UPSView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersUPSAccessKeyLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersUPSAccessKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersUPSUsernameLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersUPSUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersUPSPasswordLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersUPSPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersUPSShipperNumberLabelControl0" runat="server" />
					<asp:TextBox ID="ShippingProvidersUPSShipperNumberTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersUPSTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="ShippingProvidersUPSTestModeCheckBox" runat="server" />
				</div>
			</asp:View>
			<asp:View ID="USPSView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersUSPSUserIDLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersUSPSUserIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersUSPSPasswordLabelControl" runat="server" />
					<asp:TextBox ID="ShippingProvidersUSPSPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ShippingProvidersUSPSTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="ShippingProvidersUSPSTestModeCheckBox" runat="server" />
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
