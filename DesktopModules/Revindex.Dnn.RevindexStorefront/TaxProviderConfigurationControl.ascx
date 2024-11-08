<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TaxProviderConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.TaxProviderConfigurationControl" %>
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
<h2><%= LocalizeString("TaxProviderHeader") %></h2>
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
	<fieldset>
		<asp:MultiView ID="DetailsMultiView" runat="server">
			<asp:View ID="AvaTaxView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="TaxProviderAvalaraTaxAccountNumberLabelControl" runat="server" />
					<asp:TextBox ID="TaxProvidersAvalaraTaxAccountNumberTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="TaxProviderAvalaraTaxLicenseKeyLabelControl" runat="server" />
					<asp:TextBox ID="TaxProvidersAvalaraTaxLicenseKeyTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="TaxProviderAvalaraTaxCompanyCodeLabelControl" runat="server" />
					<asp:TextBox ID="TaxProvidersAvalaraTaxCompanyCodeTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="TaxProviderAvalaraTaxProviderUrlLabelControl" runat="server" />
					<asp:TextBox ID="TaxProvidersAvalaraTaxProviderUrlTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="TaxProviderAvalaraTaxTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="TaxProvidersAvalaraTaxTestModeCheckBox" runat="server"></asp:CheckBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="AvalaraTaxTestConnectionLabelControl" runat="server" Text="" />
					<asp:LinkButton ID="AvalaraTaxTestConnectionLinkButton" resourcekey="TestConnectionLinkButton" runat="server" CssClass="btn btn-default btn-light" OnClick="TestConnectionLinkButton_Click" CommandArgument="AvaTax"></asp:LinkButton>
				</div>
			</asp:View>
            <asp:View ID="TaxJarView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="TaxProviderTaxJarTokenLabelControl" runat="server" />
					<asp:TextBox ID="TaxProvidersTaxJarTokenTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="TaxProviderTaxJarTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="TaxProvidersTaxJarTestModeCheckBox" runat="server"></asp:CheckBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="TaxJarTestConnectionLabelControl" runat="server" Text="" />
					<asp:LinkButton ID="TaxJarTestConnectionLinkButton" resourcekey="TestConnectionLinkButton" runat="server" CssClass="btn btn-default btn-light" OnClick="TestConnectionLinkButton_Click" CommandArgument="TaxJar"></asp:LinkButton>
				</div>
			</asp:View>
			<asp:View ID="Zip2TaxView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="TaxProviderZip2TaxUsernameLabelControl" runat="server" />
					<asp:TextBox ID="TaxProvidersZip2TaxUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="TaxProviderZip2TaxPasswordLabelControl" runat="server" />
					<asp:TextBox ID="TaxProvidersZip2TaxPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="Zip2TaxTestConnectionLabelControl" runat="server" Text="" />
					<asp:LinkButton ID="Zip2TaxTestConnectionLinkButton" resourcekey="TestConnectionLinkButton" runat="server" CssClass="btn btn-default btn-light" OnClick="TestConnectionLinkButton_Click" CommandArgument="Zip2Tax"></asp:LinkButton>
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
