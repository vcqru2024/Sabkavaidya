<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FulfillmentMethodConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.FulfillmentMethodConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("FulfillmentMethodsHeader") %></h2>
<script type="text/javascript">
    Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))

        $('#<%= DetailsViewPanel.ClientID %>').dnnPanels();
    })
</script>

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
<asp:Panel ID="DetailsViewPanel" runat="server" >
	<h2 id="ShipWorksFormSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded">ShipWorks</a></h2>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="FulfillmentMethodsShipWorksActiveLabelControl" runat="server" />
			<asp:CheckBox ID="FulfillmentMethodsShipWorksActiveCheckBox" runat="server" />
			<asp:HyperLink ID="FulfillmentProviderHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
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
