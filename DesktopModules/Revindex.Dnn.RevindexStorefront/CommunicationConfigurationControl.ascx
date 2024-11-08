<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommunicationConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.CommunicationConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="CommunicationConfigurationEmailControl.ascx" TagName="CommunicationConfigurationEmailControl" TagPrefix="uc1" %>
<%@ Register Src="CommunicationConfigurationPrintControl.ascx" TagName="CommunicationConfigurationPrintControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<asp:MultiView ID="ContentMultiView" runat="server">
	<asp:View ID="ListView" runat="server">
		<h2><%= LocalizeString("CommunicationHeader") %></h2>
		<div class="rvdsfListContainer">
			<asp:GridView ID="CommunicationGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="False" AllowSorting="False" AutoGenerateColumns="False" DataKeyNames="" OnRowDataBound="CommunicationGridView_RowDataBound">				
				<PagerStyle CssClass="dnnGridPager" />
				<Columns>
					<asp:TemplateField HeaderText="Name" SortExpression="Name">
						<ItemTemplate>
							<asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" NavigateUrl='<%# Eval("SelectHyperLink_NavigateUrl") %>' Text='<%# Eval("Name") %>' />
						</ItemTemplate>
					</asp:TemplateField>
					<asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
				</Columns>
			</asp:GridView>
		</div>
	</asp:View>
	<asp:View ID="DetailsView" runat="server">
		<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
		<asp:MultiView ID="TemplateMultiView" runat="server">
			<asp:View ID="CartAbandonEmailDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationCartAbandonEmailLabel") %></h2>
				<hr />
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CommunicationCartAbandonEmailActiveLabelControl" runat="server" />
						<asp:CheckBox ID="CommunicationCartAbandonEmailActiveCheckBox" runat="server" />
					</div>
					<uc1:CommunicationConfigurationEmailControl ID="CommunicationConfigurationCartAbandonEmailControl" runat="server" Width="100%" ModuleControl="CartAbandonEmail"/>
				</fieldset>
			</asp:View>
			<asp:View ID="OrderAlertEmailDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationSalesOrderAlertEmailLabel") %></h2>
				<hr />
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CommunicationSalesOrderAlertEmailActiveLabelControl" runat="server" />
						<asp:CheckBox ID="CommunicationSalesOrderAlertEmailActiveCheckBox" runat="server" />
					</div>
					<uc1:CommunicationConfigurationEmailControl ID="CommunicationConfigurationSalesOrderAlertEmailControl" runat="server" Width="100%" ModuleControl="SalesOrderAlertEmail" />
				</fieldset>
			</asp:View>
			<asp:View ID="OrderInvoiceEmailDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationSalesOrderInvoiceEmailLabel") %></h2>
				<hr />
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CommunicationSalesOrderInvoiceEmailActiveLabelControl" runat="server" />
						<asp:CheckBox ID="CommunicationSalesOrderInvoiceEmailActiveCheckBox" runat="server" />
					</div>
					<uc1:CommunicationConfigurationEmailControl ID="CommunicationConfigurationSalesOrderInvoiceEmailControl" runat="server" Width="100%" ModuleControl="SalesOrderInvoiceEmail" />
				</fieldset>
			</asp:View>
			<asp:View ID="OrderInvoicePrintDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationSalesOrderInvoicePrintLabel") %></h2>
				<hr />
				<fieldset>
					<uc1:CommunicationConfigurationPrintControl ID="CommunicationConfigurationSalesOrderInvoicePrintControl" runat="server" Width="100%" ModuleControl="SalesOrderInvoicePrint" />
				</fieldset>
			</asp:View>
			<asp:View ID="OrderQuoteEmailDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationSalesOrderQuoteEmailLabel") %></h2>
				<hr />
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CommunicationSalesOrderQuoteEmailActiveLabelControl" runat="server" />
						<asp:CheckBox ID="CommunicationSalesOrderQuoteEmailActiveCheckBox" runat="server" />
					</div>
					<uc1:CommunicationConfigurationEmailControl ID="CommunicationConfigurationSalesOrderQuoteEmailControl" runat="server" Width="100%" ModuleControl="SalesOrderQuoteEmail" />
				</fieldset>
			</asp:View>
			<asp:View ID="OrderQuotePrintDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationSalesOrderQuotePrintLabel") %></h2>
				<hr />
				<fieldset>
					<uc1:CommunicationConfigurationPrintControl ID="CommunicationConfigurationSalesOrderQuotePrintControl" runat="server" Width="100%" ModuleControl="SalesOrderQuotePrint" />
				</fieldset>
			</asp:View>
			<asp:View ID="OrderReceiptEmailDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationSalesOrderReceiptEmailLabel") %></h2>
				<hr />
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CommunicationSalesOrderReceiptEmailActiveLabelControl" runat="server" />
						<asp:CheckBox ID="CommunicationSalesOrderReceiptEmailActiveCheckBox" runat="server" />
					</div>
					<uc1:CommunicationConfigurationEmailControl ID="CommunicationConfigurationSalesOrderReceiptEmailControl" runat="server" Width="100%" ModuleControl="SalesOrderReceiptEmail" />
				</fieldset>
			</asp:View>
			<asp:View ID="OrderReceiptPrintDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationSalesOrderReceiptPrintLabel") %></h2>
				<hr />
				<fieldset>
					<uc1:CommunicationConfigurationPrintControl ID="CommunicationConfigurationSalesOrderReceiptPrintControl" runat="server" Width="100%" ModuleControl="SalesOrderReceiptPrint" />
				</fieldset>
			</asp:View>
			<asp:View ID="OrderUpdateEmailDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationSalesOrderUpdateEmailLabel") %></h2>
				<hr />
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CommunicationSalesOrderUpdateEmailActiveLabelControl" runat="server" />
						<asp:CheckBox ID="CommunicationSalesOrderUpdateEmailActiveCheckBox" runat="server" />
					</div>
					<uc1:CommunicationConfigurationEmailControl ID="CommunicationConfigurationSalesOrderUpdateEmailControl" runat="server" Width="100%" ModuleControl="SalesOrderUpdateEmail" />
				</fieldset>
			</asp:View>
			<asp:View ID="PackingSlipPrintDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationPackingSlipPrintLabel") %></h2>
				<hr />
				<fieldset>
					<uc1:CommunicationConfigurationPrintControl ID="CommunicationConfigurationPackingSlipPrintControl" runat="server" Width="100%" ModuleControl="PackingSlipPrint" />
				</fieldset>
			</asp:View>
			<asp:View ID="PaymentAlertEmailDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationSalePaymentAlertEmailLabel") %></h2>
				<hr />
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CommunicationSalesPaymentAlertEmailActiveLabelControl" runat="server" />
						<asp:CheckBox ID="CommunicationSalesPaymentAlertEmailActiveCheckBox" runat="server" />
					</div>
					<uc1:CommunicationConfigurationEmailControl ID="CommunicationConfigurationSalesPaymentAlertEmailControl" runat="server" Width="100%" ModuleControl="SalesPaymentAlertEmail" />
				</fieldset>
			</asp:View>
			<asp:View ID="ProductVariantInventoryUpdateEmailDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationProductVariantInventoryUpdateEmailLabel") %></h2>
				<hr />
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CommunicationProductVariantInventoryUpdateEmailActiveLabelControl" runat="server" />
						<asp:CheckBox ID="CommunicationProductVariantInventoryUpdateEmailActiveCheckBox" runat="server" />
					</div>
					<uc1:CommunicationConfigurationEmailControl ID="CommunicationConfigurationProductVariantInventoryUpdateEmailControl" runat="server" Width="100%" ModuleControl="ProductVariantInventoryUpdateEmail" />
				</fieldset>
			</asp:View>
			<asp:View ID="ProductVariantPriceUpdateEmailDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationProductVariantPriceUpdateEmailLabel") %></h2>
				<hr />
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CommunicationProductVariantPriceUpdateEmailActiveLabelControl" runat="server" />
						<asp:CheckBox ID="CommunicationProductVariantPriceUpdateEmailActiveCheckBox" runat="server" />
					</div>
					<uc1:CommunicationConfigurationEmailControl ID="CommunicationConfigurationProductVariantPriceUpdateEmailControl" runat="server" Width="100%" ModuleControl="ProductVariantPriceUpdateEmail" />
				</fieldset>
			</asp:View>
			<asp:View ID="ProductReviewEmailDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationProductReviewEmailLabel") %></h2>
				<hr />
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CommunicationProductReviewsAlertEmailActiveLabelControl" runat="server" />
						<asp:CheckBox ID="CommunicationProductReviewsAlertEmailActiveCheckBox" runat="server" />
					</div>
				</fieldset>
			</asp:View>
			<asp:View ID="RecurringOrderPaymentIncompleteRetryEmailDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationRecurringOrderPaymentIncompleteRetryEmailLabel") %></h2>
				<hr />
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CommunicationRecurringSalesOrderPaymentIncompleteRetryEmailActiveLabelControl" runat="server" />
						<asp:CheckBox ID="CommunicationRecurringSalesOrderPaymentIncompleteRetryEmailActiveCheckBox" runat="server" />
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CommunicationRecurringSalesOrderPaymentIncompleteRetryCountdownLabelControl" runat="server" CssClass="dnnFormRequired" />
						<asp:RequiredFieldValidator ID="CommunicationRecurringSalesOrderPaymentIncompleteRetryCountdownRequiredFieldValidator" runat="server" ControlToValidate="CommunicationRecurringSalesOrderPaymentIncompleteRetryCountdownTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
						<asp:RangeValidator ID="CommunicationRecurringSalesOrderPaymentIncompleteRetryCountdownRangeValidator" runat="server" ControlToValidate="CommunicationRecurringSalesOrderPaymentIncompleteRetryCountdownTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="10000" MinimumValue="0" Type="Integer" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:TextBox ID="CommunicationRecurringSalesOrderPaymentIncompleteRetryCountdownTextBox" runat="server" CssClass="dnnFormRequired" />
					</div>
					<uc1:CommunicationConfigurationEmailControl ID="CommunicationConfigurationRecurringSalesOrderPaymentIncompleteRetryEmailControl" runat="server" Width="100%" ModuleControl="RecurringSalesOrderPaymentIncompleteRetryEmail" />
				</fieldset>
			</asp:View>
			<asp:View ID="RecurringOrderReminderEmailDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationRecurringOrderReminderEmailLabel") %></h2>
				<hr />
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CommunicationRecurringSalesOrderReminderEmailActiveLabelControl" runat="server" />
						<asp:CheckBox ID="CommunicationRecurringSalesOrderReminderEmailActiveCheckBox" runat="server" />
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CommunicationRecurringSalesOrderReminderCountdownLabelControl" runat="server" CssClass="dnnFormRequired" />
						<asp:RequiredFieldValidator ID="CommunicationRecurringSalesOrderReminderCountdownRequiredFieldValidator" runat="server" ControlToValidate="CommunicationRecurringSalesOrderReminderCountdownTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
						<asp:RangeValidator ID="CommunicationRecurringSalesOrderReminderCountdownRangeValidator" runat="server" ControlToValidate="CommunicationRecurringSalesOrderReminderCountdownTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="10000" MinimumValue="0" Type="Integer" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:TextBox ID="CommunicationRecurringSalesOrderReminderCountdownTextBox" runat="server" CssClass="dnnFormRequired" />
					</div>
					<uc1:CommunicationConfigurationEmailControl ID="CommunicationConfigurationRecurringSalesOrderReminderEmailControl" runat="server" Width="100%" ModuleControl="RecurringSalesOrderReminderEmail" />
				</fieldset>
			</asp:View>
			<asp:View ID="RightReceiptEmailDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationRightReceiptEmailLabel") %></h2>
				<hr />
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CommunicationRightReceiptEmailActiveLabelControl" runat="server" />
						<asp:CheckBox ID="CommunicationRightReceiptEmailActiveCheckBox" runat="server" />
					</div>
					<uc1:CommunicationConfigurationEmailControl ID="CommunicationConfigurationRightReceiptEmailControl" runat="server" Width="100%" ModuleControl="RightReceiptEmail" />
				</fieldset>
			</asp:View>
			<asp:View ID="VoucherReceiptEmailDetailsView" runat="server">
				<h2><%= LocalizeString("CommunicationHeader") %>: <%= LocalizeString("CommunicationVoucherReceiptEmailLabel") %></h2>
				<hr />
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="CommunicationVoucherReceiptEmailActiveLabelControl" runat="server" />
						<asp:CheckBox ID="CommunicationVoucherReceiptEmailActiveCheckBox" runat="server" />
					</div>
					<uc1:CommunicationConfigurationEmailControl ID="CommunicationConfigurationVoucherReceiptEmailControl" runat="server" Width="100%" ModuleControl="VoucherReceiptEmail" />
				</fieldset>
			</asp:View>
		</asp:MultiView>
		<div class="row rvdsf-footerbar-container">
            <div class="col-sm-6">
                                
            </div>
            <div class="col-sm-6 text-sm-right">
                <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
				<asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />
				<asp:LinkButton ID="SaveAndBackLinkButton" runat="server" resourcekey="SaveAndBackLinkButton" OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
            </div>
        </div>
	</asp:View>
</asp:MultiView>
