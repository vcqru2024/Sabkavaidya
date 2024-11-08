<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductCategoryControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductCategoryControl" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>

<script type="text/javascript">
	Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))
    })
</script>
<div>
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
            <div>
                <div class="row rvdsf-actionbar-container">
                        <div class="col-sm-6">
							<asp:HyperLink ID="ExportViewHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportViewLink") %></asp:HyperLink>
                            <asp:HyperLink ID="ExportAllHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportAllLink") %></asp:HyperLink>
                            <asp:HyperLink ID="ImportHyperLink" runat="server" CssClass="btn btn-link rvdImportAction" ><em class="glyphicon glyphicon-import fa fas fa-download"></em> <%= LocalizeString("ImportLink") %></asp:HyperLink>
                        </div>
                        <div class="col-sm-6 text-sm-right">

                        </div>
                    </div>
                <fieldset>
                    <div class="dnnFormItem">
                        <dnn1:LabelControl ID="ProductLabelControl" runat="server" />
                        <div class="rvdFormSubContainer">
                            <asp:TextBox ID="ProductTextBox" runat="server" style="width:100%" data-role="combobox" data-clear-button="true" data-text-field="Name" data-value-field="ProductID" 
								data-source="{
									serverFiltering: true,
									serverPaging: true,
									pageSize: 50,
									transport: {
										read: {
											type: 'POST',
											url: function () { return servicesFramework.getServiceRoot('Revindex.Dnn.RevindexStorefront') + 'Product/Lookup' },
											beforeSend: servicesFramework.setModuleHeaders,
											dataType: 'json',
											contentType: 'application/json; charset=UTF-8'
										},
										parameterMap: function (data, type) {
											return kendo.stringify({
												SellerID: -1,
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
									sort: [{ field: 'Name', dir: 'asc' }]
								}" 
								data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="ProductTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
                            <asp:CheckBoxList ID="ProductCheckBoxList" runat="server" CssClass="rvd-form-checklist" OnSelectedIndexChanged="ProductCheckBoxList_SelectedIndexChanged" AutoPostBack="True"></asp:CheckBoxList>
                        </div>
                    </div>
                </fieldset>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
