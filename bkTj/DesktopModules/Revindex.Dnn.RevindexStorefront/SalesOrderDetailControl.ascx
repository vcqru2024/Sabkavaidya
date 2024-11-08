<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesOrderDetailControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.SalesOrderDetailControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/texteditor.ascx" TagName="TextEditor" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/DynamicFormResultEditorControl.ascx" TagName="DynamicFormResultEditorControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
    
<script type="text/javascript">
    function rvdsfDateTimePicker_Open(e) {
		if (e.view === "time") {
			e.sender.timeView.setOptions({
				min: new Date("1970-01-01 " + (e.sender.element.data("starttime") ? e.sender.element.data("starttime") : "00:00:00")),
                max: new Date("1970-01-01 " + (e.sender.element.data("stoptime") ? e.sender.element.data("stoptime") : "00:00:00"))
			});
        }
	}

	Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))

		$('#SalesOrderDetailDetailsViewTabPanel').dnnTabs()        
    })
</script>

<div>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
			<asp:MultiView ID="ContentMultiView" runat="server">
				<asp:View ID="ListView" runat="server">
					<div class="rvdsfListContainer">
						<div class="row rvdsf-actionbar-container">
							<div class="col-sm-6">
								<asp:HyperLink ID="ExportViewHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportViewLink") %></asp:HyperLink>
								<asp:HyperLink ID="ExportAllHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportAllLink") %></asp:HyperLink>
							</div>
							<div class="col-sm-6 text-sm-right">
								<asp:HyperLink ID="AddHyperLink" resourcekey="AddHyperLink" runat="server" CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-SalesOrderDetailDetailsViewTabPanel', '/')" />
							</div>
						</div>
						<asp:GridView ID="SalesOrderDetailGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SalesOrderDetailID" CssClass="table table-striped table-hover rvdsfSalesOrderDetailGrid" GridLines="None" AllowPaging="False" OnRowDataBound="SalesOrderDetailGridView_RowDataBound" OnRowDeleting="SalesOrderDetailGridView_RowDeleting">
							<PagerStyle CssClass="dnnGridPager" />
							<Columns>
								<asp:TemplateField>
									<ItemTemplate>
										<asp:Image ID="ThumbnailImage" runat="server" />
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Product" SortExpression="ProductName">
									<ItemTemplate>
										<asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" />
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField DataField="SKU" HeaderText="SKU" SortExpression="SKU" />
								<asp:BoundField DataField="Status" HeaderText="Order" SortExpression="Status" />
								<asp:BoundField DataField="ShippingStatus" HeaderText="Shipping" SortExpression="ShippingStatus" />
								<asp:BoundField DataField="Quantity" HeaderText="Qty" SortExpression="Quantity" />
								<asp:BoundField DataField="TotalAmount" HeaderText="Amount" />
								<asp:TemplateField HeaderStyle-Width="5%">
									<ItemTemplate>
										<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>
						<asp:ObjectDataSource ID="SalesOrderDetailObjectDataSource" runat="server" SelectMethod="GetAll" SortParameterName="sortExpression" TypeName="Revindex.Dnn.RevindexStorefront.SalesOrderDetailControl" EnablePaging="True">
							<SelectParameters>
								<asp:Parameter Name="sortExpression" Type="String" />
								<asp:Parameter Name="maximumRows" Type="Int32" />
								<asp:Parameter Name="startRowIndex" Type="Int32" />
								<rvd1:UserControlParameter Name="salesOrderID" PropertyName="SalesOrderID" Type="Int32" />
							</SelectParameters>
						</asp:ObjectDataSource>
					</div>
				</asp:View>
				<asp:View ID="DetailsView" runat="server">
					<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
					<h2><%= LocalizeString("OrderDetailHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="SalesOrderDetailIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
					<div id="SalesOrderDetailDetailsViewTabPanel">
						<div class="row rvdsf-actionbar-container">
                            <div class="col-sm-6">
								<asp:LinkButton ID="CreateRecurringSalesOrderLinkButton" runat="server" OnClick="CreateRecurringSalesOrderLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-link" ><em class="glyphicon glyphicon-asterisk fa fas fa-asterisk"></em> <%= LocalizeString("CreateRecurringSalesOrderLink") %></asp:LinkButton>
								<asp:LinkButton ID="EmailRightReceiptLinkButton" runat="server" OnClick="EmailRightReceiptLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-link" ><em class="glyphicon glyphicon-envelope fa fas fa-envelope"></em> <%= LocalizeString("EmailRightsReceiptLink") %></asp:LinkButton>
								<asp:LinkButton ID="EmailVoucherReceiptLinkButton" runat="server" OnClick="EmailVoucherReceiptLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-link" ><em class="glyphicon glyphicon-envelope fa fas fa-envelope"></em> <%= LocalizeString("EmailVoucherReceiptLink") %></asp:LinkButton>
								<asp:LinkButton ID="IssueRightLinkButton" runat="server" OnClick="IssueRightLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-link" ><em class="glyphicon glyphicon-paperclip fa fas fa-paperclip"></em> <%= LocalizeString("IssueRightsLink") %></asp:LinkButton>
								<asp:LinkButton ID="IssueVoucherLinkButton" runat="server" OnClick="IssueVoucherLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-link" ><em class="glyphicon glyphicon-certificate fa fas fa-certificate"></em> <%= LocalizeString("IssueVoucherLink") %></asp:LinkButton>
								<asp:LinkButton ID="IssueFundLinkButton" runat="server" OnClick="IssueFundLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-link" ><em class="glyphicon glyphicon-piggy-bank fa fas fa-university"></em> <%= LocalizeString("IssueFundLink") %></asp:LinkButton>
                            </div>
                            <div class="col-sm-6 text-sm-right">
                                
                            </div>
                        </div>
						<ul class="dnnAdminTabNav dnnClear">
							<li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
								<asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
							<li id="CustomFieldDetailsViewListItem" runat="server"><a href="#<%= CustomFieldDetailsViewPanel.ClientID %>">
								<asp:Label ID="CustomFieldDetailsViewTabLabel" runat="server" resourcekey="CustomFieldDetailsViewTabLabel" /></a></li>
							<li id="ShippingDetailsViewListItem" runat="server"><a href="#<%= ShippingDetailsViewPanel.ClientID %>">
								<asp:Label ID="ShippingDetailsViewTabLabel" runat="server" resourcekey="ShippingDetailsViewTabLabel" /></a></li>
							<li id="HandlingDetailsViewListItem" runat="server"><a href="#<%= HandlingDetailsViewPanel.ClientID %>">
								<asp:Label ID="HandlingDetailsViewTabLabel" runat="server" resourcekey="HandlingDetailsViewTabLabel" /></a></li>
							<li id="RecurringDetailsViewListItem" runat="server"><a href="#<%= RecurringDetailsViewPanel.ClientID %>">
								<asp:Label ID="RecurringDetailsViewTabLabel" runat="server" resourcekey="RecurringDetailsViewTabLabel" /></a></li>
							<li id="ResourceDetailsViewListItem" runat="server"><a href="#<%= ResourceDetailsViewPanel.ClientID %>">
								<asp:Label ID="ResourceDetailsViewTabLabel" runat="server" resourcekey="ResourceDetailsViewTabLabel" /></a></li>
							<li id="NotesDetailsViewListItem" runat="server"><a href="#<%= NotesDetailsViewPanel.ClientID %>">
								<asp:Label ID="NotesDetailsViewTabLabel" runat="server" resourcekey="NotesDetailsViewTabLabel" /></a></li>
						</ul>
						<asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="StatusLabelControl" runat="server" />
									<asp:DropDownList ID="StatusDropDownList" runat="server" onchange="$(this).removeClass(); $(this).css('background-color', $(':selected',this).css('background-color'))"></asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingStatusLabelControl" runat="server" />
									<asp:DropDownList ID="ShippingStatusDropDownList" runat="server" onchange="$(this).removeClass(); $(this).css('background-color', $(':selected',this).css('background-color'))"></asp:DropDownList>
								</div>
								<asp:Panel ID="ParentSalesOrderDetailIDPanel" runat="server" class="dnnFormItem">
									<dnn1:LabelControl ID="ParentSalesOrderDetailIDLabelControl" runat="server" />
									<asp:DropDownList ID="ParentSalesOrderDetailDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ParentSalesOrderDetailDropDownList_SelectedIndexChanged" />
								</asp:Panel>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ProductNameLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="ProductVariantRequiredFieldValidator" runat="server" ControlToValidate="ProductVariantTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl" InitialValue=""><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:RequiredFieldValidator ID="ProductPartRequiredFieldValidator" runat="server" ControlToValidate="ProductPartDropDownList" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl" InitialValue=""><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:TextBox ID="ProductVariantTextBox" runat="server" style="width:100%" data-role="combobox" data-clear-button="true" data-text-field="TextField" data-value-field="ProductVariantID" 
										data-source="{
											serverFiltering: true,
											serverPaging: true,
											pageSize: 50,
											transport: {
												read: {
													type: 'POST',
													url: function () { return servicesFramework.getServiceRoot('Revindex.Dnn.RevindexStorefront') + 'ProductVariant/Lookup' },
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
													var res = JSON.decycle(response)
													res = res.map(function (v) { v.TextField = v.Product.Name + (v.Name ? ' - ' + v.Name : '') + ' ' + (v.SKU ? v.SKU : ''); return v; })
													return res
												}
											},
											sort: [{ field: 'TextField', dir: 'asc' }]
										}" 
										data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="ProductVariantTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
									<asp:DropDownList ID="ProductPartDropDownList" runat="server" OnSelectedIndexChanged="ProductPartDropDownList_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
									<asp:LinkButton ID="ProductVariantLinkButton" runat="server" OnClick="ProductVariantLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="SKULabelControl" runat="server" />
									<asp:Label ID="SKULabel" runat="server"></asp:Label>
								</div>
								<asp:Panel runat="server" ID="BookingPanel" >
									<div class="dnnFormItem">
										<dnn1:LabelControl ID="BookingStartDateLabelControl" runat="server" CssClass="dnnFormRequired"/>
										<asp:RequiredFieldValidator ID="BookingStartDateRequiredFieldValidator" runat="server" ControlToValidate="BookingStartDateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
										<asp:CustomValidator ID="BookingStartDateCustomValidator" runat="server" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ValidationGroup="DetailsViewControl" ControlToValidate="BookingStartDateTextBox" OnServerValidate="BookingStartDateCustomValidator_ServerValidate"><%= LocalizeString("BookingStartDateUnavailableError") %></asp:CustomValidator>
										<asp:TextBox ID="BookingStartDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:00" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:00" data-interval="60" data-open="rvdsfDateTimePicker_Open" AutoPostBack="True" OnTextChanged="BookingStartDateTextBox_TextChanged"/>
									</div>
									<div class="dnnFormItem">
										<dnn1:LabelControl ID="BookingStopDateLabelControl" runat="server" CssClass="dnnFormRequired"/>
										<asp:RequiredFieldValidator ID="BookingStopDateRequiredFieldValidator" runat="server" ControlToValidate="BookingStopDateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
										<asp:TextBox ID="BookingStopDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:00" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:00" data-interval="60" data-open="rvdsfDateTimePicker_Open" AutoPostBack="True" OnTextChanged="BookingStopDateTextBox_TextChanged"/>
									</div>
								</asp:Panel>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ProductCostControl" runat="server" />
									<asp:RangeValidator ID="ProductCostRangeValidator" runat="server" ControlToValidate="ProductCostTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="ProductCostCompareValidator" runat="server" ControlToValidate="ProductCostTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="ProductCostTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
								</div>
								<asp:Panel ID="WarehousePanel" runat="server" CssClass="dnnFormItem">
									<dnn1:LabelControl ID="WarehouseLabelControl" runat="server" />
									<asp:Label ID="WarehouseLabel" runat="server"></asp:Label>
								</asp:Panel>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="InventoryLabelControl" runat="server" />
									<asp:Label ID="InventoryLabel" runat="server"></asp:Label>
								</div>
							</fieldset>
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="QuantityLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="QuantityRequiredFieldValidator" runat="server" ControlToValidate="QuantityTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:RangeValidator ID="QuantityRangeValidator" runat="server" ControlToValidate="QuantityTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="QuantityCompareValidator" runat="server" ControlToValidate="QuantityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="QuantityTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="PriceLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="PriceRequiredFieldValidator" runat="server" ControlToValidate="PriceTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:RangeValidator ID="PriceRangeValidator" runat="server" ControlToValidate="PriceTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="PriceCompareValidator" runat="server" ControlToValidate="PriceTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="PriceTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="DiscountAmountLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="DiscountAmountRequiredFieldValidator" runat="server" ControlToValidate="DiscountAmountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:CompareValidator ID="DiscountAmountCompareValidator" runat="server" ControlToValidate="DiscountAmountTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="DiscountAmountTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="TotalLabelControl" runat="server" />
									<asp:Label ID="TotalAmountLabel" runat="server"></asp:Label>
								</div>
                                <div class="dnnFormItem">
									<dnn1:LabelControl ID="PriceLockedLabelControl" runat="server" />
									<asp:CheckBox ID="PriceLockedCheckBox" runat="server" />
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="CustomFieldDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<uc1:DynamicFormResultEditorControl ID="DynamicFormResultEditor" runat="server" />
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="ShippingDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RequireShippingLabelControl" runat="server" />
									<asp:CheckBox ID="RequireShippingCheckBox" runat="server" Enabled="False" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="WeightLabelControl" runat="server" />
									<asp:Label ID="WeightLabel" runat="server"></asp:Label> <%=  Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsMass).Symbols[0] %>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="DepthLabelControl" runat="server" />
									<asp:Label ID="DepthLabel" runat="server"></asp:Label> <%=  Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsLength).Symbols[0] %>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="WidthLabelControl" runat="server" />
									<asp:Label ID="WidthLabel" runat="server"></asp:Label> <%=  Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsLength).Symbols[0] %>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="HeightLabelControl" runat="server" />
									<asp:Label ID="HeightLabel" runat="server"></asp:Label> <%=  Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsLength).Symbols[0] %>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="HandlingDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RequireHandlingLabelControl" runat="server" />
									<asp:CheckBox ID="RequireHandlingCheckBox" runat="server" Enabled="False" />
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="RecurringDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RecurringSalesOrderIDLabelControl" runat="server" />
									<asp:HyperLink ID="RecurringSalesOrderIDHyperLink" runat="server"></asp:HyperLink>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RecurringLabelControl" runat="server" />
									<asp:Label ID="RecurringLabel" runat="server"></asp:Label>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="ResourceDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="FundIssuedLabelControl" runat="server" />
									<asp:CheckBox ID="FundIssuedCheckBox" runat="server"></asp:CheckBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="VoucherIssuedLabelControl" runat="server" />
									<asp:Label ID="VoucherIssuedLabel" runat="server"></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RightIssuedLabelControl" runat="server" />
									<asp:Label ID="RightIssuedLabel" runat="server"></asp:Label>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="NotesDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="AdminNotesLabelControl" runat="server" />
									<dnn1:TextEditor ID="AdminNotesTextEditor" runat="server" ChooseRender="False" ChooseMode="False" DefaultMode="RICH" Mode="RICH" HtmlEncode="False" Width="100%" Height="460px" />
								</div>
							</fieldset>
						</asp:Panel>
					</div>
					<div class="row rvdsf-footerbar-container">
                        <div class="col-sm-6">
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" resourcekey="DeleteLinkButton" CssClass="btn btn-default btn-light" CausesValidation="false" OnClick="DeleteLinkButton_Click" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()"></asp:LinkButton>
                        </div>
                        <div class="col-sm-6 text-sm-right">
                            <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
							<asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />
							<asp:LinkButton ID="SaveAndBackLinkButton" runat="server" resourcekey="SaveAndBackLinkButton" OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
                        </div>
                    </div>
				</asp:View>
			</asp:MultiView>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
