<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesOrderControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.SalesOrderControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/texteditor.ascx" TagName="TextEditor" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="ShippingPackageControl.ascx" TagName="ShippingPackageControl" TagPrefix="uc1" %>
<%@ Register Src="SalesOrderDetailControl.ascx" TagName="SalesOrderDetailControl" TagPrefix="uc1" %>
<%@ Register Src="SalesPaymentControl.ascx" TagName="SalesPaymentControl" TagPrefix="uc1" %>
<%@ Register Src="UserPaymentDropDownListControl.ascx" TagName="UserPaymentDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="UserAddressDropDownListControl.ascx" TagName="UserAddressDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/DynamicFormResultEditorControl.ascx" TagName="DynamicFormResultEditorControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
    
<script type="text/javascript">
	Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))

		$('#SalesOrderDetailsViewTabPanel').dnnTabs()
        $("#NotesSalesOrderDetailsViewPanel").dnnPanels()
    })
</script>

<div>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
			<asp:MultiView ID="ContentMultiView" runat="server">
				<asp:View ID="ListView" runat="server">
					<h2><%= LocalizeString("SalesOrdersHeader") %></h2>
					<div class="row rvdsf-actionbar-container">
						<div class="col-sm-6">
							<asp:HyperLink ID="ExportViewHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportViewLink") %></asp:HyperLink>
							<asp:HyperLink ID="ExportAllHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportAllLink") %></asp:HyperLink>
						</div>
						<div class="col-sm-6 text-sm-right">
							<asp:LinkButton ID="EditSelectedLinkButton" runat="server" resourcekey="EditSelectedLinkButton" CssClass="btn btn-default btn-light rvdBulkAction" OnClick="EditSelectedLinkButton_Click" OnClientClick="if (!$('.rvdsfSalesOrderSalesOrderGrid :checkbox').is(':checked')) { alert('You must select at least one item first.'); return false; }" />
							<asp:HyperLink ID="AddHyperLink" resourcekey="AddHyperLink" runat="server" CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-SalesOrderDetailsViewTabPanel', '/')" />
						</div>
					</div>
					<asp:Panel ID="SearchPanel" runat="server" DefaultButton="SearchLinkButton" CssClass="rvdsfSearchContainer">
						<fieldset>
							<div class="input-group">
								<asp:TextBox ID="SalesOrderSearchQueryTextBox" runat="server" CssClass="form-control" type="search"></asp:TextBox>
								<div class="input-group-btn input-group-append" >
									<button class="btn btn-default btn-outline-secondary" type="button" data-toggle="collapse" href="#rvdsfSalesOrderSearchPanel"><em class="glyphicon glyphicon-filter fa fas fa-filter"></em> <%= LocalizeString("FilterLink") %></button>
									<asp:LinkButton ID="ResetLinkButton" runat="server" resourcekey="ResetLinkButton" OnClick="ResetLinkButton_Click" CausesValidation="false" CssClass="btn btn-default btn-outline-secondary rvdResetAction" />
									<asp:LinkButton ID="SearchLinkButton" runat="server" resourcekey="SearchLinkButton" OnClick="SearchLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdSearchAction" />
								</div>
							</div>
						</fieldset>
						<div id="rvdsfSalesOrderSearchPanel" class="collapse persist">
							<fieldset class="rvdSplit2">
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="SalesOrderSearchOrderStartDateLabelControl" runat="server" />
									<asp:TextBox ID="SalesOrderSearchStartDateTextBox" runat="server" placeholder="YYYY-MM-DD" CssClass="rvd-form-datetime" data-role="datepicker" data-format="yyyy-MM-dd"/>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="SalesOrderSearchOrderStopDateLabelControl" runat="server" />
									<asp:TextBox ID="SalesOrderSearchStopDateTextBox" runat="server" placeholder="YYYY-MM-DD" CssClass="rvd-form-datetime" data-role="datepicker" data-format="yyyy-MM-dd"/>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="SalesOrderSearchStatusLabelControl" runat="server" />
									<asp:DropDownList ID="SalesOrderSearchStatusDropDownList" runat="server"></asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="SalesOrderSearchSalesPaymentStatusLabelControl" runat="server" />
									<asp:DropDownList ID="SalesOrderSearchSalesPaymentStatusDropDownList" runat="server"></asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="SalesOrderSearchShippingStatusLabelControl" runat="server" />
									<asp:DropDownList ID="SalesOrderSearchShippingStatusDropDownList" runat="server"></asp:DropDownList>
								</div>
								<asp:Panel ID="SalesOrderSearchSellerPanel" runat="server" CssClass="dnnFormItem">
									<dnn1:LabelControl ID="SalesOrderSearchSellerLabelControl" runat="server" />
									<asp:TextBox ID="SalesOrderSearchSellerTextBox" runat="server" data-role="combobox" data-clear-button="true" data-text-field="Name" data-value-field="SellerID" 
										data-source="sellerSearchDataSource" 
										data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="SalesOrderSearchSeller_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
										<script type="text/javascript">
                                            var sellerSearchDataSource = new kendo.data.DataSource(
                                                {
                                                    serverFiltering: true,
                                                    serverPaging: true,
                                                    pageSize: 50,
                                                    transport: {
                                                        read: {
                                                            type: 'POST',
                                                            url: function () { return servicesFramework.getServiceRoot('Revindex.Dnn.RevindexStorefront') + 'Seller/Lookup' },
                                                            beforeSend: servicesFramework.setModuleHeaders,
                                                            dataType: 'json',
                                                            contentType: 'application/json; charset=UTF-8'
                                                        },
                                                        parameterMap: function (data, type) {
                                                            return kendo.stringify({
                                                                Query: data.filter.filters.length > 0 ? data.filter.filters[0].value : '',
                                                                ItemIndex: 0,
                                                                MaxItems: data.pageSize
                                                            })
                                                        }
                                                    },
                                                    schema: {
                                                        data: function (response) {

                                                            // We need to decycle any circular references because Kendo UI can only support flat structure
                                                            var res = JSON.decycle(response)

                                                            // Add standard choices
                                                            res.push({ Name: '<%= LocalizeString("AnyLabel") %>', SellerID: -1 })
                                                            return res
                                                        }
                                                    },
                                                    sort: { field: 'Name', dir: 'asc' }
                                                }
                                            )
                                        </script>
								</asp:Panel>
								<div class="row rvdsf-actionbar-container">
									<div class="col-sm-6">
                                
									</div>
									<div class="col-sm-6 text-sm-right">
									
									</div>
								</div>
							</fieldset>
						</div>
					</asp:Panel>
					<div class="rvdsfListContainer">
						<asp:GridView ID="SalesOrderGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-striped table-hover rvdsfSalesOrderSalesOrderGrid" GridLines="None" AllowPaging="True" DataKeyNames="SalesOrderID" OnRowDataBound="SalesOrderGridView_RowDataBound" OnDataBound="SalesOrderGridView_DataBound">
							<PagerStyle CssClass="dnnGridPager" />
							<Columns>
								<asp:TemplateField>
									<HeaderTemplate>
										<input onclick="if ($(this).is(':checked')) { $('.rvdsfSalesOrderSalesOrderGrid :checkbox').each(function () { this.checked = true; }) } else { $('.rvdsfSalesOrderSalesOrderGrid :checkbox').each(function () { this.checked = false; }) }" runat="server" type="checkbox" />
									</HeaderTemplate>
									<ItemTemplate>
										<asp:CheckBox ID="SelectCheckBox" runat="server" onclick="event.stopPropagation()" />
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Order" SortExpression="SalesOrderNumber">
									<ItemTemplate>
										<asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" Text='<%# Eval("SalesOrderNumber") %>'/>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField DataField="OrderDate" HeaderText="Date" SortExpression="OrderDate"  />
								<asp:BoundField DataField="Origin" HeaderText="Origin" SortExpression="Origin" />
								<asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
								<asp:BoundField DataField="SalesPaymentStatus" HeaderText="Payment" SortExpression="SalesPaymentStatus" />
								<asp:BoundField DataField="ShippingStatus" HeaderText="Shipping" SortExpression="ShippingStatus" />
								<asp:BoundField DataField="FraudScore" HeaderText="Fraud" SortExpression="FraudScore" />
								<asp:BoundField DataField="TotalAmount" HeaderText="Total" SortExpression="TotalAmount" />
							</Columns>
							<PagerTemplate>
								<table style="width: 100%">
									<tr>
										<td>
											<table>
												<tr>
													<td>
														<asp:LinkButton ID="PagePreviousLinkButton" runat="server" CommandName="Page" CommandArgument="Prev" Text="..." /></td>
													<td>
														<asp:LinkButton ID="Page1LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="1" /></td>
													<td>
														<asp:LinkButton ID="Page2LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="2" /></td>
													<td>
														<asp:LinkButton ID="Page3LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="3" /></td>
													<td>
														<asp:LinkButton ID="Page4LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="4" /></td>
													<td>
														<asp:LinkButton ID="Page5LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="5" /></td>
													<td>
														<asp:LinkButton ID="Page6LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="6" /></td>
													<td>
														<asp:LinkButton ID="Page7LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="7" /></td>
													<td>
														<asp:LinkButton ID="Page8LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="8" /></td>
													<td>
														<asp:LinkButton ID="Page9LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="9" /></td>
													<td>
														<asp:LinkButton ID="Page10LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="10" /></td>
													<td>
														<asp:LinkButton ID="PageNextLinkButton" runat="server" CommandName="Page" CommandArgument="Next" Text="..." /></td>
												</tr>
											</table>
										</td>
										<td style="text-align: right" class="form-inline"><%= LocalizeString("PageItemsLabel") %>
											<asp:DropDownList ID="PageViewSizeDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="PageViewSizeDropDownList_SelectedIndexChanged" CssClass="form-control input-sm">
												<asp:ListItem Value="10">10</asp:ListItem>
												<asp:ListItem Value="20">20</asp:ListItem>
												<asp:ListItem Value="50">50</asp:ListItem>
												<asp:ListItem Value="100">100</asp:ListItem>
											</asp:DropDownList>
										</td>
									</tr>
								</table>
							</PagerTemplate>
						</asp:GridView>
						<asp:ObjectDataSource ID="SalesOrderObjectDataSource" runat="server" SelectMethod="GetAll" TypeName="Revindex.Dnn.RevindexStorefront.SalesOrderControl" EnablePaging="True" SelectCountMethod="GetCount" SortParameterName="sortExpression">
							<SelectParameters>
								<asp:Parameter Name="sortExpression" Type="String" />
								<asp:Parameter Name="maximumRows" Type="Int32" />
								<asp:Parameter Name="startRowIndex" Type="Int32" />
								<rvd1:UserControlParameter Name="portalID" PropertyName="PortalId" Type="Int32" />
								<asp:ControlParameter ControlID="SalesOrderSearchStartDateTextBox" Name="startDate" PropertyName="Text" Type="DateTime" />
								<asp:ControlParameter ControlID="SalesOrderSearchStopDateTextBox" Name="stopDate" PropertyName="Text" Type="DateTime" />
								<asp:ControlParameter ControlID="SalesOrderSearchQueryTextBox" Name="query" PropertyName="Text" Type="String" />
								<asp:ControlParameter ControlID="SalesOrderSearchStatusDropDownList" Name="status" PropertyName="SelectedValue" />
								<asp:ControlParameter ControlID="SalesOrderSearchShippingStatusDropDownList" Name="shippingStatus" PropertyName="SelectedValue" />
								<asp:ControlParameter ControlID="SalesOrderSearchSalesPaymentStatusDropDownList" Name="salesPaymentStatus" PropertyName="SelectedValue" />
								<asp:ControlParameter ControlID="SalesOrderSearchSellerTextBox" Name="sellerID" PropertyName="Text" Type="Int32" />
							</SelectParameters>
						</asp:ObjectDataSource>
					</div>
				</asp:View>
				<asp:View ID="DetailsView" runat="server">
					<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
					<h2><%= LocalizeString("OrderHeader") %> #<uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="SalesOrderIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label><span style="margin-left: 20px; color: #999"><%= LocalizeString("TotalHeader") %>:</span> <asp:Label ID="HeaderTotalAmountLabel" runat="server" style="color: #999"/><span style="margin-left: 20px; color: #999"><%= LocalizeString("BalanceHeader") %>:</span> <asp:Label ID="HeaderBalanceDueLabel" runat="server" style="color: #999"/>
					</h2>
					<div class="row rvdsf-actionbar-container">
                        <div class="col-sm-6">
							<div class="btn-group">
							  <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><em class="glyphicon glyphicon-envelope fa fas fa-envelope"></em> <%= LocalizeString("EmailLink") %> <span class="caret"></span></button>
							  <ul class="dropdown-menu">
								<li class="dropdown-item"><asp:LinkButton ID="EmailCartAbandonLinkButton" runat="server" resourcekey="EmailCartAbandonLinkButton" OnClick="EmailCartAbandonLinkButton_Click" CausesValidation="false" CssClass="rvdEmailAction" /></li>
								<li class="dropdown-item"><asp:LinkButton ID="EmailSalesOrderInvoiceLinkButton" runat="server" resourcekey="EmailSalesOrderInvoiceLinkButton" OnClick="EmailSalesOrderInvoiceLinkButton_Click" CausesValidation="false" CssClass="rvdEmailAction" /></li>
								<li class="dropdown-item"><asp:LinkButton ID="EmailSalesOrderReceiptLinkButton" runat="server" resourcekey="EmailSalesOrderReceiptLinkButton" OnClick="EmailSalesOrderReceiptLinkButton_Click" CausesValidation="false" CssClass="rvdEmailAction" /></li>
							  </ul>
							</div>
							<div class="btn-group">
							  <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><em class="glyphicon glyphicon-print fa fas fa-print"></em> <%= LocalizeString("PrintLink") %> <span class="caret"></span></button>
							  <ul class="dropdown-menu">
								<li class="dropdown-item"><asp:HyperLink ID="PrintSalesOrderInvoiceHyperLink" resourcekey="PrintSalesOrderInvoiceHyperLink" runat="server" Target="_blank" CssClass="rvdPrintAction"></asp:HyperLink></li>
								<li class="dropdown-item"><asp:HyperLink ID="PrintSalesOrderReceiptHyperLink" resourcekey="PrintSalesOrderReceiptHyperLink" runat="server" Target="_blank" CssClass="rvdPrintAction"></asp:HyperLink></li>
								<li class="dropdown-item"><asp:HyperLink ID="PrintPackingSlipHyperLink" resourcekey="PrintPackingSlipHyperLink" runat="server" Target="_blank" CssClass="rvdPrintAction"></asp:HyperLink></li>
								<li class="dropdown-item"><asp:HyperLink ID="PrintShippingLabelHyperLink" resourcekey="PrintShippingLabelHyperLink" runat="server" Target="_blank" CssClass="rvdPrintAction"></asp:HyperLink></li>
							  </ul>
							</div>
							<div class="btn-group">
							  <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><em class="glyphicon glyphicon-refresh fa fas fa-sync"></em> <%= LocalizeString("RecalculateLink") %> <span class="caret"></span></button>
							  <ul class="dropdown-menu">
								<li class="dropdown-item"><asp:LinkButton ID="RecalculateAllLinkButton" runat="server" resourcekey="RecalculateAllLinkButton" OnClick="RecalculateAllLinkButton_Click" CausesValidation="false" OnClientClick="if (rvdsfConfirmRecalculateAll()) { document.getElementById('RvdsfContentAnchor').scrollIntoView(); return true; } else return false; " /></li>
								<li class="dropdown-item"><asp:LinkButton ID="RecalculateOrderLinkButton" runat="server" resourcekey="RecalculateOrderLinkButton" OnClick="RecalculateOrderLinkButton_Click" CausesValidation="false" OnClientClick="if (rvdsfConfirmRecalculateOrder()) { document.getElementById('RvdsfContentAnchor').scrollIntoView(); return true; } else return false;" /></li>
							  </ul>
								<script>
									function rvdsfConfirmRecalculateAll() {
										return confirm('<%= LocalizeString("RecalculateAllMessage") %>')
									}

									function rvdsfConfirmRecalculateOrder() {
										return confirm('<%= LocalizeString("RecalculateOrderMessage") %>')
									}
                                </script>
							</div>
							<div class="btn-group">
							  <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><em class="glyphicon glyphicon-plus fa fas fa-plus"></em> <%= LocalizeString("MoreActionsLink") %> <span class="caret"></span></button>
							  <ul class="dropdown-menu">
								<li class="dropdown-item"><asp:LinkButton ID="RewardPointsLinkButton" resourcekey="RewardPointsLinkButton" runat="server" OnClick="RewardPointsLinkButton_Click" CausesValidation="false" ></asp:LinkButton></li>
								<li role="separator" class="divider dropdown-divider"></li>
								<li class="dropdown-item"><asp:LinkButton ID="DecrementInventoryLinkButton" resourcekey="DecrementInventoryLinkButton" runat="server" OnClick="DecrementInventoryLinkButton_Click" CausesValidation="false" ></asp:LinkButton></li>
								<li class="dropdown-item"><asp:LinkButton ID="IncrementInventoryLinkButton" resourcekey="IncrementInventoryLinkButton" runat="server" OnClick="IncrementInventoryLinkButton_Click" CausesValidation="false" ></asp:LinkButton></li>
								<li role="separator" class="divider dropdown-divider"></li>
								<li class="dropdown-item"><asp:LinkButton ID="CreateShipmentLinkButton" resourcekey="CreateShipmentLinkButton" runat="server" OnClick="CreateShipmentLinkButton_Click" CausesValidation="false" ></asp:LinkButton></li>
								<li role="separator" class="divider dropdown-divider"></li>
								<li class="dropdown-item"><asp:LinkButton ID="RunPlaceOrderActionLinkButton" resourcekey="RunPlaceOrderActionLinkButton" runat="server" OnClick="RunPlaceOrderActionLinkButton_Click" CausesValidation="false" ></asp:LinkButton></li>
							  </ul>
							</div>
                        </div>
                        <div class="col-sm-6 text-sm-right">

                        </div>
                    </div>
					<div id="SalesOrderDetailsViewTabPanel" class="rvdsfSalesOrderContainer">
						<ul class="dnnAdminTabNav dnnClear">
							<li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
								<asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
							<li><a href="#<%= CustomFieldDetailsViewPanel.ClientID %>">
								<asp:Label ID="CustomFieldDetailsViewTabLabel" runat="server" resourcekey="CustomFieldDetailsViewTabLabel" /></a></li>
							<li id="PackingDetailsViewListItem" runat="server"><a href="#<%= PackingDetailsViewPanel.ClientID %>">
								<asp:Label ID="PackingDetailsViewTabLabel" runat="server" resourcekey="PackingDetailsViewTabLabel" /></a></li>
							<li id="ShippingDetailsViewListItem" runat="server"><a href="#<%= ShippingDetailsViewPanel.ClientID %>">
								<asp:Label ID="ShippingDetailsViewTabLabel" runat="server" resourcekey="ShippingDetailsViewTabLabel" /></a></li>
							<li id="HandlingDetailsViewListItem" runat="server"><a href="#<%= HandlingDetailsViewPanel.ClientID %>">
								<asp:Label ID="HandlingDetailsViewTabLabel" runat="server" resourcekey="HandlingDetailsViewTabLabel" /></a></li>
							<li><a href="#<%= TaxDetailsViewPanel.ClientID %>">
								<asp:Label ID="TaxDetailsViewTabLabel" runat="server" resourcekey="TaxDetailsViewTabLabel" /></a></li>
							<li><a href="#<%= BillingDetailsViewPanel.ClientID %>">
								<asp:Label ID="BillingDetailsViewTabLabel" runat="server" resourcekey="BillingDetailsViewTabLabel" /></a></li>
							<li><a href="#<%= PaymentDetailsViewPanel.ClientID %>">
								<asp:Label ID="PaymentDetailsViewTabLabel" runat="server" resourcekey="PaymentDetailsViewTabLabel" /></a></li>
							<li id="RewardsPointDetailsViewListItem" runat="server"><a href="#<%= RewardsPointDetailsViewPanel.ClientID %>">
								<asp:Label ID="RewardsPointDetailsViewTabLabel" runat="server" resourcekey="RewardsPointDetailsViewTabLabel" /></a></li>
							<li><a href="#<%= NotesDetailsViewPanel.ClientID %>">
								<asp:Label ID="NotesDetailsViewTabLabel" runat="server" resourcekey="NotesDetailsViewTabLabel" /></a></li>
							<li><a href="#<%= OtherDetailsViewPanel.ClientID %>">
								<asp:Label ID="OtherDetailsViewTabLabel" runat="server" resourcekey="OtherDetailsViewTabLabel" /></a></li>
						</ul>
						<asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset class="rvdSplit2">
								<div class="dnnFormGroup">
									<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("OrderHeader") %></a></h2>
									<fieldset>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="OrderDateLabelControl" runat="server" CssClass="dnnFormRequired" />
											<asp:RequiredFieldValidator ID="OrderDateRequiredFieldValidator" runat="server" ControlToValidate="OrderDateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
											<asp:TextBox ID="OrderDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm"/>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="StatusLabelControl" runat="server" />
											<asp:DropDownList ID="StatusDropDownList" runat="server" onchange="$(this).removeClass(); $(this).css('background-color', $(':selected',this).css('background-color'))"></asp:DropDownList>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="SalesPaymentStatusLabelControl" runat="server" />
											<asp:DropDownList ID="SalesPaymentStatusDropDownList" runat="server" onchange="$(this).removeClass(); $(this).css('background-color', $(':selected',this).css('background-color'))"></asp:DropDownList>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="ShippingStatusLabelControl" runat="server" />
											<asp:DropDownList ID="ShippingStatusDropDownList" runat="server" onchange="$(this).removeClass(); $(this).css('background-color', $(':selected',this).css('background-color'))"></asp:DropDownList>
										</div>
										<asp:Panel ID="SellerPanel" runat="server" CssClass="dnnFormItem">
											<dnn1:LabelControl ID="SellerLabelControl" runat="server" />
											<asp:TextBox ID="SellerTextBox" runat="server" data-role="combobox" data-clear-button="true" data-text-field="Name" data-value-field="SellerID" 
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
												data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="SellerTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
										</asp:Panel>
										<asp:Panel ID="WarehousePanel" runat="server" CssClass="dnnFormItem">
											<dnn1:LabelControl ID="WarehouseLabelControl" runat="server" />
											<asp:DropDownList ID="WarehouseDropDownList" runat="server">
											</asp:DropDownList>
										</asp:Panel>
										<asp:Panel ID="RelatedDetailsViewPanel" runat="server">
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="RelatedSalesOrderLabelControl" runat="server" />
												<asp:GridView ID="RelatedSalesOrderGridView" runat="server" style="width: 47%" ItemType="Revindex.Business.Revindex.Revindex.Storefront.SalesOrder" AutoGenerateColumns="False" DataKeyNames="SalesOrderID" CssClass="table table-striped table-hover" GridLines="None" OnRowDataBound="RelatedSalesOrderGridView_RowDataBound" ShowHeader="False">
													<PagerStyle CssClass="dnnGridPager" />
													<Columns>
														<asp:TemplateField HeaderText="Order">
															<ItemTemplate>
																<asp:HyperLink ID="SelectHyperLink" Text='<%# Item.SalesOrderNumber %>' runat="server" onclick="event.stopPropagation()"/>
																<asp:Label runat="server" Visible="<%# !Item.ParentSalesOrderID.HasValue %>" style="font-weight:bold; color: red">*</asp:Label>
															</ItemTemplate>
														</asp:TemplateField>
														<asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
														<asp:BoundField DataField="TotalAmount" HeaderText="Total" SortExpression="TotalAmount" />
													</Columns>
												</asp:GridView>
											</div>
										</asp:Panel>
									</fieldset>
								</div>
								<div class="dnnFormGroup">
									<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("CustomerHeader") %></a></h2>
									<fieldset>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="UsernameLabelControl" runat="server" />
											<asp:TextBox ID="UsernameTextBox" runat="server" data-role="combobox" data-clear-button="true" data-text-field="TextField" data-value-field="UserID" 
												data-source="{
													serverFiltering: true,
													serverPaging: true,
													pageSize: 50,
													transport: {
														read: {
															type: 'POST',
															url: function () { return servicesFramework.getServiceRoot('Revindex.Dnn.RevindexStorefront') + 'User/Lookup' },
															beforeSend: servicesFramework.setModuleHeaders,
															dataType: 'json',
															contentType: 'application/json; charset=UTF-8'
														},
														parameterMap: function (data, type) {

															$('input[id$=UsernameHiddenField]').val(data.filter.filters.length &gt; 0 ? data.filter.filters[0].value : '')

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
															var res = JSON.decycle(response)
															res = res.map(function (v) { v.TextField = v.DisplayName + ' | ' + v.Username + ' | ' + v.Email; return v; })
															return res
														}
													},
													sort: [{ field: 'TextField', dir: 'asc' }]
												}" 
												data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="UsernameTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
											<asp:HyperLink ID="UsernameHyperLink" runat="server" style="display: inline-block"><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
											<asp:HiddenField ID="UsernameHiddenField" runat="server" />
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="UserDisplayNameLabelControl" runat="server" />
											<asp:Label ID="UserDisplayNameLabel" runat="server"></asp:Label>
											<asp:RequiredFieldValidator ID="UserDisplayNameRequiredFieldValidator" runat="server" ControlToValidate="UserDisplayNameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
											<asp:TextBox ID="UserDisplayNameTextBox" runat="server" placeholder="e.g. John Doe"></asp:TextBox>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="UserPhoneLabelControl" runat="server" />
											<asp:Label ID="UserPhoneLabel" runat="server" />
											<asp:TextBox ID="UserPhoneTextBox" runat="server" ></asp:TextBox>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="UserEmailLabelControl" runat="server" />
											<asp:HyperLink ID="UserEmailHyperLink" runat="server" />
											<asp:RequiredFieldValidator ID="UserEmailRequiredFieldValidator" runat="server" ControlToValidate="UserEmailTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
											<asp:TextBox ID="UserEmailTextBox" runat="server" TextMode="Email"></asp:TextBox>
										</div>
										<asp:Panel ID="FraudScorePanel" runat="server" CssClass="dnnFormItem">
											<dnn1:LabelControl ID="FraudScoreLabelControl" runat="server" />
											<asp:Label ID="FraudScoreLabel" runat="server" />
										</asp:Panel>
									</fieldset>
								</div>
							</fieldset>
							<div class="dnnFormGroup">
								<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("OrderDetailHeader") %></a></h2>
								<fieldset>
									<div ID="SalesOrderDetailUnavailableLabel" runat="server" class="alert alert-info" ><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
									<uc1:SalesOrderDetailControl ID="SalesOrderDetailControl1" runat="server"></uc1:SalesOrderDetailControl>
								</fieldset>
								<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="CouponCodesLabelControl" runat="server" />
									<div class="rvdFormSubContainer">
										<asp:TextBox ID="CouponCodeTextBox" runat="server" MaxLength="100"></asp:TextBox>
										<asp:LinkButton ID="AddCouponLinkButton" runat="server" OnClick="AddCouponLinkButton_Click" CausesValidation="False" CssClass="btn btn-primary" resourcekey="AddCouponLinkButton" />
										<asp:DataList ID="CouponDataList" CssClass="rvdsfCheckoutCouponList" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" RepeatLayout="Flow">
											<ItemTemplate>
												<asp:LinkButton ID="DeleteCouponLinkButton" runat="server" CommandArgument='<%# Eval("Code") %>' OnClick="DeleteCouponLinkButton_Click" CausesValidation="False" resourcekey="DeleteCouponLinkButton" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
												<asp:Label ID="CouponLabel" runat="server" Text='<%# Eval("Code") %>' />
											</ItemTemplate>
										</asp:DataList>
									</div>
								</div>
							</fieldset>
							</div>
							<fieldset class="rvdSplit2">
								<div class="dnnFormGroup">
									<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("BillingHeader") %></a></h2>
									<fieldset>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="BillToLabelControl" runat="server" />
											<asp:Label ID="BillToLabel" runat="server" />
											
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl runat="server" Text="" />
											<asp:HyperLink ID="BillToMapHyperLink" runat="server" CssClass="btn btn-link" Target="_blank"><em class="glyphicon glyphicon-map-marker fa fas fa-map-marker-alt"></em> <%= LocalizeString("ViewMapLink") %></asp:HyperLink>
										</div>
									</fieldset>
								</div>
								<asp:Panel ID="ShippingPanel" runat="server" CssClass="dnnFormGroup">
									<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("ShippingHeader") %></a></h2>
									<fieldset>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="ShipToLabelControl" runat="server" />
											<asp:Label ID="ShipToLabel" runat="server" />
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl runat="server" Text="" />
											<asp:HyperLink ID="ShipToMapHyperLink" runat="server" CssClass="btn btn-link" Target="_blank"><em class="glyphicon glyphicon-map-marker fa fas fa-map-marker-alt"></em> <%= LocalizeString("ViewMapLink") %></asp:HyperLink>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="ShippingMethodNameLabelControl" runat="server" />
											<asp:Label ID="ShippingMethodLabel" runat="server" />
										</div>
									</fieldset>
								</asp:Panel>
							</fieldset>
							<fieldset class="rvdSplit2">
								<div class="dnnFormGroup">
									<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("TotalsHeader") %></a></h2>
									<fieldset>
										<div class="dnnFormItem rvdsfSubTotalAmount">
											<dnn1:LabelControl ID="SubTotalAmountLabelControl" runat="server" />
											<asp:Label ID="SubTotalAmountLabel" runat="server"></asp:Label>
										</div>
										<div class="dnnFormItem rvdsfTotalShippingAmount">
											<dnn1:LabelControl ID="TotalShippingLabelControl" runat="server" />
											<asp:Label ID="TotalShippingAmountLabel" runat="server"></asp:Label>
										</div>
										<div class="dnnFormItem rvdsfTotalHandlingAmount">
											<dnn1:LabelControl ID="TotalHandlingAmountLabelControl" runat="server" />
											<asp:Label ID="TotalHandlingAmountLabel" runat="server"></asp:Label>
										</div>
										<div class="dnnFormItem rvdsfTotalTaxesAmount">
											<dnn1:LabelControl ID="TotalTaxAmountLabelControl" runat="server" />
											<asp:Label ID="TotalTaxAmountLabel" runat="server"></asp:Label>
										</div>
										<div class="dnnFormItem rvdsfTotalAmount">
											<dnn1:LabelControl ID="TotalAmountLabelControl" runat="server" />
											<asp:Label ID="TotalAmountLabel" runat="server"></asp:Label>
										</div>
									</fieldset>
									<fieldset>
										<asp:Panel ID="GroupTotalAmountPanel" runat="server" CssClass="dnnFormItem rvdsfTotalAmount">
											<dnn1:LabelControl ID="GroupTotalAmountLabelControl" runat="server" />
											<asp:Label ID="GroupTotalAmountLabel" runat="server"></asp:Label>
										</asp:Panel>
									</fieldset>
								</div>
								<div class="dnnFormGroup">
									<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("PaymentHeader") %></a></h2>
									<fieldset>
										<div class="dnnFormItem rvdsfTotalPaymentAmount">
											<dnn1:LabelControl ID="TotalPaymentReceivedLabelControl" runat="server" />
											<asp:Label ID="TotalPaymentReceivedLabel" runat="server"></asp:Label>
										</div>
                                        <div class="dnnFormItem rvdsfTotalPaymentAmount">
											<dnn1:LabelControl ID="TotalPaymentCommittedLabelControl" runat="server" />
											<asp:Label ID="TotalPaymentCommittedLabel" runat="server"></asp:Label>
										</div>
										<asp:Panel ID="BalanceDuePanel" runat="server" CssClass="dnnFormItem rvdsfBalanceDueAmount">
											<dnn1:LabelControl ID="BalanceDueLabelControl" runat="server" />
											<asp:Label ID="BalanceDueLabel" runat="server"></asp:Label>
										</asp:Panel>
									</fieldset>
									<fieldset>
										<asp:Panel ID="GroupTotalPaymentReceivedPanel" runat="server" CssClass="dnnFormItem rvdsfTotalPaymentAmount">
											<dnn1:LabelControl ID="GroupTotalPaymentReceivedLabelControl" runat="server" />
											<asp:Label ID="GroupTotalPaymentReceivedLabel" runat="server"></asp:Label>
										</asp:Panel>
                                        <asp:Panel ID="GroupTotalPaymentCommittedPanel" runat="server" CssClass="dnnFormItem rvdsfTotalPaymentAmount">
											<dnn1:LabelControl ID="GroupTotalPaymentCommittedLabelControl" runat="server" />
											<asp:Label ID="GroupTotalPaymentCommittedLabel" runat="server"></asp:Label>
										</asp:Panel>
										<asp:Panel ID="GroupBalanceDuePanel" runat="server" CssClass="dnnFormItem rvdsfBalanceDueAmount">
											<dnn1:LabelControl ID="GroupBalanceDueLabelControl" runat="server" />
											<asp:Label ID="GroupBalanceDueLabel" runat="server"></asp:Label>
										</asp:Panel>
									</fieldset>
									<fieldset>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="SalesPaymentMethodNameLabelControl" runat="server" />
											<asp:Label ID="SalesPaymentMethodNameLabel" runat="server"></asp:Label>
										</div>
									</fieldset>
								</div>
							</fieldset>
							<div class="dnnFormGroup">
								<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("NotesHeader") %></a></h2>
								<fieldset>
									<div>
										<asp:Label ID="AdminNotesLabel" runat="server"></asp:Label>
									</div>
								</fieldset>
							</div>
						</asp:Panel>
						<asp:Panel ID="CustomFieldDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<uc1:DynamicFormResultEditorControl ID="DynamicFormResultEditor" runat="server" />
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="PackingDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="PackingMethodNameLabelControl" runat="server" />
									<asp:DropDownList ID="PackingMethodDropDownList" runat="server">
									</asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingPackageLabelControl" runat="server" Text="" />
									<uc1:ShippingPackageControl ID="ShippingPackageControl" runat="server" />
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="ShippingDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="CopyFromBillingAddressLabelControl" runat="server" Text="" />
									<asp:LinkButton ID="CopyFromProfileToShippingAddressLinkButton" runat="server" CausesValidation="False" OnClick="CopyFromProfileToShippingAddressLinkButton_Click" CssClass="btn btn-link"><em class="glyphicon glyphicon-copy fa fas fa-copy"></em> <%= LocalizeString("CopyProfileLink") %></asp:LinkButton> <asp:LinkButton ID="CopyFromBillingAddressLinkButton" runat="server" CausesValidation="False" OnClick="CopyFromBillingAddressLinkButton_Click" CssClass="btn btn-link"><em class="glyphicon glyphicon-copy fa fas fa-copy"></em> <%= LocalizeString("CopyBillingLink") %></asp:LinkButton>
									<uc1:UserAddressDropDownListControl ID="ShippingUserAddressDropDownListControl" runat="server" AutoPostBack="True"  CssClass="rvdsf-btn-select"/>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingFirstNameLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:TextBox ID="ShippingFirstNameTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingLastNameLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:TextBox ID="ShippingLastNameTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingCompanyLabelControl" runat="server" />
									<asp:TextBox ID="ShippingCompanyTextBox" runat="server" MaxLength="100"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingCountryLabelControl" runat="server" />
									<asp:DropDownList ID="ShippingCountryDropDownList" runat="server" AutoPostBack="True" DataTextField="Name" DataValueField="IsoAlpha2Code" OnSelectedIndexChanged="ShippingCountryDropDownList_SelectedIndexChanged">
									</asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingStreetLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:TextBox ID="ShippingStreetTextBox" runat="server" MaxLength="200" CssClass="dnnFormRequired"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingUnitLabelControl" runat="server" />
									<asp:TextBox ID="ShippingUnitTextBox" runat="server" MaxLength="200"></asp:TextBox>
								</div>
								<asp:Panel ID="ShippingDistrictPanel" runat="server" CssClass="dnnFormItem" Visible="false">
									<dnn1:LabelControl ID="ShippingDistrictLabelControl" runat="server" />
									<asp:TextBox ID="ShippingDistrictTextBox" runat="server" MaxLength="50"></asp:TextBox>
								</asp:Panel>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingCityLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:TextBox ID="ShippingCityTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingSubdivisionLabelControl" runat="server" />
									<asp:DropDownList ID="ShippingSubdivisionDropDownList" runat="server" DataTextField="Name" DataValueField="IsoCode">
									</asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingPostalCodeLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:TextBox ID="ShippingPostalCodeTextBox" runat="server" MaxLength="10" CssClass="dnnFormRequired"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingPhoneLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:TextBox ID="ShippingPhoneTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingEmailLabelControl" runat="server" />
									<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="ShippingEmailTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
									<asp:TextBox ID="ShippingEmailTextBox" runat="server" MaxLength="256"></asp:TextBox>
								</div>
							</fieldset>
							<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("ShippingMethodHeader") %></a></h2>
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingMethodLabelControl" runat="server" />
									<asp:DropDownList ID="ShippingMethodDropDownList" runat="server">
									</asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingDestinationPointLabelControl" runat="server" />
									<asp:TextBox ID="ShippingDestinationPointTextBox" runat="server" MaxLength="100"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingTrackingCodeLabelControl" runat="server" />
									<asp:TextBox ID="ShippingTrackingCodeTextBox" runat="server"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippedDateLabelControl" runat="server" />
									<asp:TextBox ID="ShippedDateTextBox" runat="server" placeholder="YYYY-MM-DD" CssClass="rvd-form-datetime" data-role="datepicker" data-format="yyyy-MM-dd"/>
								</div>
							</fieldset>
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingAmountLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="ShippingAmountRequiredFieldValidator" runat="server" ControlToValidate="ShippingAmountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:CompareValidator ID="ShippingAmountCompareValidator" runat="server" ControlToValidate="ShippingAmountTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="ShippingAmountTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingDiscountAmountLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="ShippingDiscountAmountRequiredFieldValidator" runat="server" ControlToValidate="ShippingDiscountAmountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:CompareValidator ID="ShippingDiscountAmountCompareValidator" runat="server" ControlToValidate="ShippingDiscountAmountTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="ShippingDiscountAmountTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingQuotedLabelControl" runat="server" />
									<asp:CheckBox ID="ShippingQuotedCheckBox" runat="server" />
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="HandlingDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="HandlingAmountLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="HandlingAmountRequiredFieldValidator" runat="server" ControlToValidate="HandlingAmountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:CompareValidator ID="HandlingAmountCompareValidator" runat="server" ControlToValidate="HandlingAmountTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="HandlingAmountTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="HandlingDiscountAmountLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="HandlingDiscountAmountRequiredFieldValidator" runat="server" ControlToValidate="HandlingDiscountAmountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:CompareValidator ID="HandlingDiscountAmountCompareValidator" runat="server" ControlToValidate="HandlingDiscountAmountTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="HandlingDiscountAmountTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
								</div>
							</fieldset>
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="HandlingMethodNameLabelControl" runat="server" />
									<asp:DropDownList ID="HandlingMethodDropDownList" runat="server">
									</asp:DropDownList>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="TaxDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="TaxAmount1LabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="TaxAmount1RequiredFieldValidator" runat="server" ControlToValidate="TaxAmount1TextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:CompareValidator ID="TaxAmount1CompareValidator" runat="server" ControlToValidate="TaxAmount1TextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="TaxAmount1TextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="TaxAmount2LabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="TaxAmount2RequiredFieldValidator" runat="server" ControlToValidate="TaxAmount2TextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:CompareValidator ID="TaxAmount2CompareValidator" runat="server" ControlToValidate="TaxAmount2TextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="TaxAmount2TextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="TaxAmount3LabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="TaxAmount3RequiredFieldValidator" runat="server" ControlToValidate="TaxAmount3TextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:CompareValidator ID="TaxAmount3CompareValidator" runat="server" ControlToValidate="TaxAmount3TextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="TaxAmount3TextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="TaxAmount4LabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="TaxAmount4RequiredFieldValidator" runat="server" ControlToValidate="TaxAmount4TextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:CompareValidator ID="TaxAmount4CompareValidator" runat="server" ControlToValidate="TaxAmount4TextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="TaxAmount4TextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="TaxAmount5LabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="TaxAmount5RequiredFieldValidator" runat="server" ControlToValidate="TaxAmount5TextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:CompareValidator ID="TaxAmount5CompareValidator" runat="server" ControlToValidate="TaxAmount5TextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="TaxAmount5TextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="TaxDiscountAmountLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="TaxDiscountAmountRequiredFieldValidator" runat="server" ControlToValidate="TaxDiscountAmountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:CompareValidator ID="TaxDiscountAmountCompareValidator" runat="server" ControlToValidate="TaxDiscountAmountTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="TaxDiscountAmountTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="BillingDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="CopyFromProfileToBillingAddressLabelControl" runat="server" Text="" />
									<asp:LinkButton ID="CopyFromProfileToBillingAddressLinkButton" runat="server" CausesValidation="False" OnClick="CopyFromProfileToBillingAddressLinkButton_Click" CssClass="btn btn-link"><em class="glyphicon glyphicon-copy fa fas fa-copy"></em> <%= LocalizeString("CopyProfileLink") %></asp:LinkButton>
									<asp:LinkButton ID="CopyFromShippingAddressLinkButton" runat="server" CausesValidation="False" OnClick="CopyFromShippingAddressLinkButton_Click" CssClass="btn btn-link"><em class="glyphicon glyphicon-copy fa fas fa-copy"></em> <%= LocalizeString("CopyShippingLink") %></asp:LinkButton>
									<uc1:UserAddressDropDownListControl ID="BillingUserAddressDropDownListControl" runat="server" AutoPostBack="True" CssClass="rvdsf-btn-select"/>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="BillingFirstNameLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:TextBox ID="BillingFirstNameTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="BillingLastNameLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:TextBox CssClass="dnnFormRequired" ID="BillingLastNameTextBox" runat="server" MaxLength="50"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="BillingCompanyLabelControl" runat="server" />
									<asp:TextBox ID="BillingCompanyTextBox" runat="server" MaxLength="100"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="BillingCountryLabelControl" runat="server" />
									<asp:DropDownList ID="BillingCountryDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="BillingCountryDropDownList_SelectedIndexChanged">
									</asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="BillingStreetLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:TextBox CssClass="dnnFormRequired" ID="BillingStreetTextBox" runat="server" MaxLength="200"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="BillingUnitLabelControl" runat="server" />
									<asp:TextBox ID="BillingUnitTextBox" runat="server" MaxLength="200"></asp:TextBox>
								</div>
								<asp:Panel ID="BillingDistrictPanel" runat="server" CssClass="dnnFormItem" Visible="false">
									<dnn1:LabelControl ID="BillingDistrictLabelControl" runat="server" />
									<asp:TextBox ID="BillingDistrictTextBox" runat="server" MaxLength="50"></asp:TextBox>
								</asp:Panel>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="BillingCityLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:TextBox CssClass="dnnFormRequired" ID="BillingCityTextBox" runat="server" MaxLength="50"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="BillingSubdivisionLabelControl" runat="server" />
									<asp:DropDownList ID="BillingSubdivisionDropDownList" runat="server" DataTextField="Name" DataValueField="IsoCode">
									</asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="BillingPostalCodeLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:TextBox CssClass="dnnFormRequired" ID="BillingPostalCodeTextBox" runat="server" MaxLength="10"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="BillingPhoneLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:TextBox CssClass="dnnFormRequired" ID="BillingPhoneTextBox" runat="server" MaxLength="50"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="BillingEmailLabelControl" runat="server" />
									<asp:TextBox ID="BillingEmailTextBox" runat="server" MaxLength="256"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="BusinessTaxNumberLabelControl" runat="server" />
									<asp:TextBox ID="BusinessTaxNumberTextBox" runat="server"></asp:TextBox>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="PaymentDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div ID="SalesPaymentUnavailableLabel" runat="server" class="alert alert-info" ><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
								<uc1:SalesPaymentControl ID="SalesPaymentControl1" runat="server"></uc1:SalesPaymentControl>
							</fieldset>
							<fieldset>
                                <div class="dnnFormItem">
									<dnn1:LabelControl ID="PaymentTermLabelControl" runat="server" />
									<asp:DropDownList ID="PaymentTermDropDownList" runat="server" ></asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="PreferredUserPaymentLabelControl" runat="server" />
									<uc1:UserPaymentDropDownListControl ID="PreferredUserPaymentDropDownListControl" runat="server" />
								</div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentIncompleteRetryDateLabelControl" runat="server" />
									<asp:TextBox ID="PaymentIncompleteRetryDateTextBox" runat="server" placeholder="YYYY-MM-DD" CssClass="rvd-form-datetime" data-role="datepicker" data-format="yyyy-MM-dd"/>
                                </div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="RewardsPointDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RewardsPointsQualifiedLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="RewardsPointsQualifiedRequiredFieldValidator" runat="server" ControlToValidate="RewardsPointsQualifiedTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:RangeValidator ID="RewardsPointsQualifiedRangeValidator" runat="server" ControlToValidate="RewardsPointsQualifiedTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="RewardsPointsQualifiedCompareValidator" runat="server" ControlToValidate="RewardsPointsQualifiedTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="RewardsPointsQualifiedTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RewardsPointsRewardedLabelControl" runat="server" />
									<asp:Label ID="RewardsPointsRewardedLabel" runat="server"></asp:Label>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="NotesDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div id="NotesSalesOrderDetailsViewPanel">
									<h2 id="AdminNotesSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("AdminNotesHeader") %></a></h2>
									<fieldset>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="AdminNotesLabelControl" runat="server" />
											<dnn1:TextEditor ID="AdminNotesTextEditor" runat="server" ChooseRender="False" ChooseMode="False" DefaultMode="RICH" Mode="RICH" HtmlEncode="False" Width="100%" Height="460px" />
										</div>
									</fieldset>
									<h2 id="CustomerNotesSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("CustomerNotesHeader") %></a></h2>
									<fieldset>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="CustomerNotesLabelControl" runat="server" />
											<dnn1:TextEditor ID="CustomerNotesTextEditor" runat="server" ChooseRender="False" ChooseMode="False" DefaultMode="RICH" Mode="RICH" HtmlEncode="False" Width="100%" Height="460px" />
										</div>
									</fieldset>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="OtherDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="SalesOrderGUIDLabelControl" runat="server" />
									<asp:Label ID="SalesOrderGUIDLabel" runat="server"></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="CreateDateLabelControl" runat="server" />
									<asp:Label ID="CreateDateLabel" runat="server"></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="UpdateDateLabelControl" runat="server" />
									<asp:Label ID="UpdateDateLabel" runat="server"></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="OriginLabelControl" runat="server" />
									<asp:Label ID="OriginLabel" runat="server"></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="UserHostAddressLabelControl" runat="server" />
									<asp:Label ID="UserHostAddressLabel" runat="server"></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="UserAgentLabelControl" runat="server" />
									<asp:Label ID="UserAgentLabel" runat="server" style="word-wrap: break-word; max-width: 445px"></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="CultureCodeLabelControl" runat="server" />
									<asp:Label ID="CultureCodeLabel" runat="server"></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="CurrencyCultureCodeLabelControl" runat="server" />
									<asp:Label ID="CurrencyCultureCodeLabel" runat="server"></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ExchangeRateLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="ExchangeRateRequiredFieldValidator" runat="server" ControlToValidate="ExchangeRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:RangeValidator ID="ExchangeRateRangeValidator" runat="server" ControlToValidate="ExchangeRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="ExchangeRateCompareValidator" runat="server" ControlToValidate="ExchangeRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="ExchangeRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="PurchaseOrderNumberLabelControl" runat="server" />
									<asp:TextBox ID="PurchaseOrderNumberTextBox" runat="server"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="WishListIDLabelControl" runat="server" />
									<asp:Label ID="WishListIDLabel" runat="server"></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="AffiliateLabelControl" runat="server" />
									<asp:DropDownList ID="AffiliateDropDownList" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="CartAbandonNotifiedLabelControl" runat="server" />
									<asp:CheckBox ID="CartAbandonNotifiedCheckBox" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="OrderLockedLabelControl" runat="server" />
									<asp:CheckBox ID="OrderLockedCheckBox" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="SessionLabelControl" runat="server" />
									<asp:HyperLink ID="CartSessionHyperLink" runat="server" resourcekey="CartSessionHyperLink" />
									<asp:HyperLink ID="CheckoutSessionHyperLink" runat="server" resourcekey="CheckoutSessionHyperLink" />
									<asp:HyperLink ID="PaymentSessionHyperLink" runat="server" resourcekey="PaymentSessionHyperLink" />
								</div>
							</fieldset>
						</asp:Panel>
						
					</div>
					<div class="row rvdsf-footerbar-container">
                        <div class="col-sm-6">
                                
                        </div>
                        <div class="col-sm-6 text-sm-right">
                            <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
							<asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction"  />
							<asp:LinkButton ID="SaveAndBackLinkButton" runat="server" resourcekey="SaveAndBackLinkButton" OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl"  />
                        </div>
                    </div>
				</asp:View>
			</asp:MultiView>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
