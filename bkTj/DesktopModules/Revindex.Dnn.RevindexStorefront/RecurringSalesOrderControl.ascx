<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RecurringSalesOrderControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.RecurringSalesOrderControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/texteditor.ascx" TagName="TextEditor" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="UserAddressDropDownListControl.ascx" TagName="UserAddressDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="UserPaymentDropDownListControl.ascx" TagName="UserPaymentDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/DynamicFormResultEditorControl.ascx" TagName="DynamicFormResultEditorControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/XmlEditorControl.ascx" TagName="XmlEditorControl" TagPrefix="uc1" %>
    
<script type="text/javascript">
	Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))

        $('#RecurringSalesOrderDetailsViewTabPanel').dnnTabs()
    })
</script>

<div>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
			<asp:MultiView ID="ContentMultiView" runat="server">
				<asp:View ID="ListView" runat="server">
					<h2><%= LocalizeString("RecurringSalesOrdersHeader") %></h2>
					<div class="row rvdsf-actionbar-container">
						<div class="col-sm-6">
							<asp:HyperLink ID="ExportHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportLink") %></asp:HyperLink>
						</div>
						<div class="col-sm-6 text-sm-right">
							<asp:HyperLink ID="AddHyperLink" resourcekey="AddHyperLink" runat="server" CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-RecurringSalesOrderDetailsViewTabPanel', '/')" />
						</div>
					</div>
					<asp:Panel ID="SearchPanel" runat="server" DefaultButton="SearchLinkButton" CssClass="rvdsfSearchContainer">
						<fieldset>
							<div class="input-group">
								<asp:TextBox ID="RecurringSalesOrderSearchQueryTextBox" runat="server" CssClass="form-control" type="search"></asp:TextBox>
								<div class="input-group-btn input-group-append" >
									<button class="btn btn-default btn-outline-secondary" type="button" data-toggle="collapse" href="#rvdsfRecurringSalesOrderSearchPanel"><em class="glyphicon glyphicon-filter fa fas fa-filter"></em> <%= LocalizeString("FilterLink") %></button>
									<asp:LinkButton  ID="ResetLinkButton" resourcekey="ResetLinkButton" runat="server"  OnClick="ResetLinkButton_Click" CausesValidation="false" CssClass="btn btn-default btn-outline-secondary rvdResetAction" />
									<asp:LinkButton ID="SearchLinkButton" runat="server" resourcekey="SearchLinkButton" OnClick="SearchLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdSearchAction" />
								</div>
							</div>
						</fieldset>
						<div id="rvdsfRecurringSalesOrderSearchPanel" class="collapse persist">
							<fieldset class="rvdSplit2">
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RecurringSalesOrderSearchNextRecurringStartDateLabelControl" runat="server" />
									<asp:TextBox ID="RecurringSalesOrderSearchNextRecurringStartDateTextBox" runat="server" placeholder="YYYY-MM-DD" CssClass="rvd-form-datetime" data-role="datepicker" data-format="yyyy-MM-dd"/>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RecurringSalesOrderSearchNextRecurringStopDateLabelControl" runat="server" />
									<asp:TextBox ID="RecurringSalesOrderSearchNextRecurringStopDateTextBox" runat="server" placeholder="YYYY-MM-DD" CssClass="rvd-form-datetime" data-role="datepicker" data-format="yyyy-MM-dd"/>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RecurringSalesOrderSearchStatusLabelControl" runat="server" />
									<asp:DropDownList ID="RecurringSalesOrderSearchStatusDropDownList" runat="server"></asp:DropDownList>
								</div>
								<asp:Panel ID="RecurringSalesOrderSearchSellerPanel" runat="server" CssClass="dnnFormItem">
									<dnn1:LabelControl ID="RecurringSalesOrderSearchSellerLabelControl" runat="server" />
									<asp:TextBox ID="RecurringSalesOrderSearchSellerTextBox" runat="server" data-role="combobox" data-clear-button="true" data-text-field="Name" data-value-field="SellerID" 
										data-source="sellerSearchDataSource" 
										data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="RecurringSalesOrderSearchSellerTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
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
							</fieldset>
						</div>
					</asp:Panel>
					<div class="rvdsfListContainer">
						<asp:GridView ID="RecurringSalesOrderGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="True" DataKeyNames="RecurringSalesOrderID" OnRowDataBound="RecurringSalesOrderGridView_RowDataBound" OnRowDeleting="RecurringSalesOrderGridView_RowDeleting">
							<PagerStyle CssClass="dnnGridPager" />
							<Columns>
								<asp:TemplateField HeaderText="NextRecurringDate" SortExpression="NextRecurringDate" HeaderStyle-Width="20%">
									<ItemTemplate>
										<asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" />
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" HeaderStyle-Width="15%"/>
								<asp:BoundField HeaderText="Product" />
								<asp:BoundField HeaderText="Payment" HeaderStyle-Width="15%" />
								<asp:TemplateField HeaderStyle-Width="5%">
									<ItemTemplate>
										<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>
						<asp:ObjectDataSource ID="RecurringSalesOrderObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCount" SelectMethod="GetAll" SortParameterName="sortExpression" TypeName="Revindex.Business.Revindex.Revindex.Storefront.RecurringSalesOrderController" DataObjectTypeName="Revindex.Dnn.RevindexStorefront.RecurringSalesOrderControl">
							<SelectParameters>
								<asp:Parameter Name="sortExpression" Type="String" />
								<asp:Parameter Name="maximumRows" Type="Int32" />
								<asp:Parameter Name="startRowIndex" Type="Int32" />
								<rvd1:UserControlParameter Name="portalID" PropertyName="PortalId" Type="Int32" />
								<asp:ControlParameter ControlID="RecurringSalesOrderSearchNextRecurringStartDateTextBox" Name="nextRecurringStartDate" PropertyName="Text" Type="DateTime" />
								<asp:ControlParameter ControlID="RecurringSalesOrderSearchNextRecurringStopDateTextBox" Name="nextRecurringStopDate" PropertyName="Text" Type="DateTime" />
								<asp:ControlParameter ControlID="RecurringSalesOrderSearchQueryTextBox" Name="query" PropertyName="Text" Type="String" />
								<asp:ControlParameter ControlID="RecurringSalesOrderSearchStatusDropDownList" Name="status" PropertyName="SelectedValue" Type="Int32" />
								<asp:ControlParameter ControlID="RecurringSalesOrderSearchSellerTextBox" Name="sellerID" PropertyName="Text" Type="Int32" />
							</SelectParameters>
						</asp:ObjectDataSource>
					</div>
				</asp:View>
				<asp:View ID="DetailsView" runat="server">
					<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
					<h2><%= LocalizeString("RecurringOrderHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="RecurringSalesOrderIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
					<div class="row rvdsf-actionbar-container">
                        <div class="col-sm-6">
							<asp:LinkButton ID="EmailRecurringSalesOrderReminderLinkButton" runat="server" OnClick="EmailRecurringSalesOrderReminderLinkButton_Click" CssClass="btn btn-link rvdEmailAction" CausesValidation="false" ValidationGroup="DetailsViewControl" ><em class="glyphicon glyphicon-envelope fa fas fa-envelope"></em> <%= LocalizeString("EmailReminderLink") %></asp:LinkButton>
                        </div>
                        <div class="col-sm-6 text-sm-right">

                        </div>
                    </div>
					<div id="RecurringSalesOrderDetailsViewTabPanel">
						<ul class="dnnAdminTabNav dnnClear">
							<li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
								<asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
							<li><a href="#<%= CustomFieldDetailsViewPanel.ClientID %>">
								<asp:Label ID="CustomFieldDetailsViewTabLabel" runat="server" resourcekey="CustomFieldDetailsViewTabLabel" /></a></li>
							<li><a href="#<%= PaymentDetailsViewPanel.ClientID %>">
								<asp:Label ID="PaymentDetailsViewTabLabel" runat="server" resourcekey="PaymentDetailsViewTabLabel" /></a></li>
							<li><a href="#<%= ShippingDetailsViewPanel.ClientID %>">
								<asp:Label ID="ShippingDetailsViewTabLabel" runat="server" resourcekey="ShippingDetailsViewTabLabel" /></a></li>
							<li id="NotesDetailsViewListItem" runat="server"><a href="#<%= NotesDetailsViewPanel.ClientID %>">
								<asp:Label ID="NotesDetailsViewTabLabel" runat="server" resourcekey="NotesDetailsViewTabLabel" /></a></li>
							<li><a href="#<%= OtherDetailsViewPanel.ClientID %>">
								<asp:Label ID="OtherDetailsViewTabLabel" runat="server" resourcekey="OtherDetailsViewTabLabel" /></a></li>
							<li><a href="#<%= ExtensionDetailsViewPanel.ClientID %>">
                                <asp:Label  ID="ExtensionDetailsViewTabLabel" resourcekey="ExtensionDetailsViewTabLabel" runat="server"  /></a></li>
						</ul>
						<asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
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
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="StatusLabelControl" runat="server" />
									<asp:DropDownList ID="StatusDropDownList" runat="server"></asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ProductVariantLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="ProductVariantRequiredFieldValidator" runat="server" ControlToValidate="ProductVariantTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl" InitialValue=""><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
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
									<asp:LinkButton ID="ProductVariantLinkButton" runat="server" OnClick="ProductVariantLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RecurringIntervalLabelControl" runat="server" />
									<asp:Label ID="RecurringIntervalLabel" runat="server"></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="QuantityLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="QuantityTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:RangeValidator ID="QuantityRangeValidator" runat="server" ControlToValidate="QuantityTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="QuantityCompareValidator" runat="server" ControlToValidate="QuantityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="QuantityTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
								</div>
                                <div class="dnnFormItem">
									<dnn1:LabelControl ID="PriceLabelControl" runat="server" ></dnn1:LabelControl>
									<asp:RangeValidator ID="PriceRangeValidator" runat="server" ControlToValidate="PriceTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="ProductVariantDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="PriceCompareValidator" runat="server" ControlToValidate="PriceTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="ProductVariantDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="PriceTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="NextRecurringDateLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="NextRecurringDateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:TextBox ID="NextRecurringDateTextBox" runat="server" placeholder="YYYY-MM-DD" CssClass="rvd-form-datetime" data-role="datepicker" data-format="yyyy-MM-dd"/>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="MaxRepeatLabelControl" runat="server" />
									<asp:RangeValidator ID="MaxRepeatRangeValidator" runat="server" ControlToValidate="MaxRepeatTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="MaxRepeatCompareValidator" runat="server" ControlToValidate="MaxRepeatTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="MaxRepeatTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RepeatCountLabelControl" runat="server" />
									<asp:Label ID="RepeatCountLabel" runat="server" Text=""></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="UsernameLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="UsernameRequiredFieldValidator" runat="server" ControlToValidate="UsernameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:TextBox ID="UsernameTextBox" runat="server" CssClass="dnnFormRequired" OnTextChanged="UsernameTextBox_TextChanged" AutoPostBack="True"></asp:TextBox>
									<asp:HyperLink ID="UsernameHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="UserFirstNameLabelControl" runat="server" />
									<asp:Label ID="UserFirstNameLabel" runat="server"></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="UserLastNameLabelControl" runat="server" />
									<asp:Label ID="UserLastNameLabel" runat="server"></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="UserEmailLabelControl" runat="server" />
									<asp:HyperLink ID="UserEmailHyperLink" runat="server" />
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="CustomFieldDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<uc1:DynamicFormResultEditorControl ID="DynamicFormResultEditor" runat="server" />
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="PaymentDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="UserPaymentLabelControl" runat="server" />
									<uc1:UserPaymentDropDownListControl ID="UserPaymentDropDownListControl" runat="server" AutoPostBack="True" />
                                    <asp:HyperLink ID="UserPaymentHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="ShippingDetailsViewPanel" runat="server" CssClass="dnnClear">
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
									<dnn1:LabelControl ID="CopyFromBillingAddressLabelControl" runat="server" Text="" />
									<asp:LinkButton ID="CopyFromBillingAddressLinkButton" runat="server" CausesValidation="False" OnClick="CopyFromBillingAddressLinkButton_Click" CssClass="btn btn-link"><em class="glyphicon glyphicon-copy fa fas fa-copy"></em> <%= LocalizeString("CopyBillingLink") %></asp:LinkButton>
									<uc1:UserAddressDropDownListControl ID="ShippingUserAddressDropDownListControl" runat="server" AutoPostBack="True" CssClass="rvdsf-btn-select"/>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingFirstNameLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ShippingFirstNameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:TextBox ID="ShippingFirstNameTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="50"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingLastNameLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ShippingLastNameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:TextBox ID="ShippingLastNameTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="50"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingCompanyLabelControl" runat="server" />
									<asp:TextBox ID="ShippingCompanyTextBox" runat="server" MaxLength="100"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingCountryLabelControl" runat="server" CssClass="dnnFormRequired"/>
									<asp:RequiredFieldValidator ID="CountryRequiredFieldValidator" runat="server" ControlToValidate="ShippingCountryDropDownList" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:DropDownList ID="ShippingCountryDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ShippingCountryDropDownList_SelectedIndexChanged">
									</asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingStreetLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ShippingStreetTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:TextBox ID="ShippingStreetTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="200"></asp:TextBox>
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
									<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ShippingCityTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:TextBox ID="ShippingCityTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="50"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingSubdivisionLabelControl" runat="server" />
									<asp:DropDownList ID="ShippingSubdivisionDropDownList" runat="server" DataTextField="Name" DataValueField="IsoCode">
									</asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingPostalCodeLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="ShippingPostalCodeRequiredFieldValidator" runat="server" ControlToValidate="ShippingPostalCodeTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:TextBox ID="ShippingPostalCodeTextBox" runat="server" MaxLength="10" CssClass="dnnFormRequired"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingPhoneLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ShippingPhoneTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:TextBox ID="ShippingPhoneTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="50"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingEmailLabelControl" runat="server" />
									<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="ShippingEmailTextBox" CssClass="dnnFormMessage dnnFormError" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
									<asp:TextBox ID="ShippingEmailTextBox" runat="server" MaxLength="256"></asp:TextBox>
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
						<asp:Panel ID="OtherDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="SalesOrderDetailIDLabelControl" runat="server" />
									<asp:TextBox ID="SalesOrderDetailIDTextBox" runat="server"></asp:TextBox>
									<asp:LinkButton ID="SalesOrderDetailIDLinkButton" runat="server" OnClick="SalesOrderDetailIDLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="CultureCodeLabelControl" runat="server" />
									<asp:Label ID="CultureCodeLabel" runat="server"></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="CurrencyCultureCodeLabelControl" runat="server" />
									<asp:Label ID="CurrencyCultureCodeLabel" runat="server"></asp:Label>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="ExtensionDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="ExtensionLabelControl" runat="server" />
                                    <uc1:XmlEditorControl ID="ExtensionXmlEditor" runat="server" ModuleControl="CategoryExtension" />
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
							<asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
							<asp:LinkButton ID="SaveAndBackLinkButton" runat="server" resourcekey="SaveAndBackLinkButton" OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
                        </div>
                    </div>
				</asp:View>
			</asp:MultiView>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
