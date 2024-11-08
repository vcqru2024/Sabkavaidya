<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FulfillmentProviderConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.FulfillmentProviderConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>

<script type="text/javascript">
    Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))
    })
</script>

<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
<h2><%= LocalizeString("FulfillmentProviderHeader") %></h2>
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
			<asp:View ID="ShipWorksView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="FulfillmentProvidersShipWorksUsernameLabelControl" runat="server" />
					<asp:TextBox ID="FulfillmentProvidersShipWorksUsernameTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="FulfillmentProvidersShipWorksPasswordLabelControl" runat="server" />
					<asp:TextBox ID="FulfillmentProvidersShipWorksPasswordTextBox" runat="server" MaxLength="256"></asp:TextBox>
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
