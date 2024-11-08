<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesOrderConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.SalesOrderConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="PaymentTermAvailabilityRuleControl.ascx" TagName="PaymentTermAvailabilityRuleControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="PlaceHolder1" runat="server">

    <script type="text/javascript">
        jQuery(document).ready(function () {
            $('#<%= DetailsViewPanel.ClientID %>').dnnPanels();
        });
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            $('#<%= DetailsViewPanel.ClientID %>').dnnPanels();
        });
    </script>

</asp:PlaceHolder>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
        <h2><%= LocalizeString("SalesOrderHeader") %></h2>
            <asp:Panel ID="DetailsViewPanel" runat="server">
                <h2 id="GeneralFormSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("GeneralHeader") %></a></h2>
                <fieldset>
                    <div class="dnnFormItem">
                        <dnn1:LabelControl ID="SalesOrderSalesOrderNumberFormatLabelControl" runat="server" CssClass="dnnFormRequired" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="SalesOrderSalesOrderNumberFormatTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="SalesOrderSalesOrderNumberFormatTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\w-.]*\{0:?[\w.#]*\}[\w-.]*$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                        <asp:TextBox ID="SalesOrderSalesOrderNumberFormatTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
                    </div>
                    <div class="dnnFormItem">
                        <dnn1:LabelControl ID="NextSalesOrderNumberLabelControl" runat="server" CssClass="dnnFormRequired" />
                        <asp:RequiredFieldValidator ID="NextSalesOrderNumberRequiredFieldValidator" runat="server" ControlToValidate="NextSalesOrderNumberTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="NextSalesOrderNumberRangeValidator" runat="server" ControlToValidate="NextSalesOrderNumberTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:CompareValidator ID="NextSalesOrderNumberCompareValidator" runat="server" ControlToValidate="NextSalesOrderNumberTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
						<asp:TextBox ID="NextSalesOrderNumberTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="dnnFormItem">
                        <dnn1:LabelControl ID="SalesOrderBusinessTaxNumberValidateLabelControl" runat="server" />
                        <asp:CheckBox ID="SalesOrderBusinessTaxNumberValidateCheckBox" runat="server" />
                    </div>
                    <div class="dnnFormItem">
                        <dnn1:LabelControl ID="SalesOrderIncompleteOrdersAutoDeleteLabelControl" runat="server" />
                        <asp:RangeValidator ID="SalesOrderIncompleteOrdersAutoDeleteRangeValidator" runat="server" ControlToValidate="SalesOrderIncompleteOrdersAutoDeleteTextBox" MinimumValue="0" MaximumValue="24855" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
						<asp:CompareValidator ID="SalesOrderIncompleteOrdersAutoDeleteCompareValidator" runat="server" ControlToValidate="SalesOrderIncompleteOrdersAutoDeleteTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
						<asp:TextBox ID="SalesOrderIncompleteOrdersAutoDeleteTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="dnnFormItem">
                        <dnn1:LabelControl ID="SalesOrderPreorderProcessBehaviorLabelControl" runat="server" />
                        <asp:DropDownList ID="SalesOrderPreorderProcessBehaviorDropDownList" runat="server">
                            <asp:ListItem resourcekey="ManualProcessLabel" Value="1" />
                            <asp:ListItem resourcekey="AutomaticallyProcessLabel" Value="2" />
                        </asp:DropDownList>
                    </div>
                    <div class="dnnFormItem">
                        <dnn1:LabelControl ID="SalesOrderMethodsPurchaseOrderActiveLabelControl" runat="server" />
                        <asp:CheckBox ID="SalesOrderMethodsPurchaseOrderActiveCheckBox" runat="server" />
                    </div>

                </fieldset>
                <h2 id="CODFormSectionHead" class="dnnFormSectionHead">
                    <a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentTermType.COD).ToString(), Global.FilePaths.LocalPaymentTermTypeResourceFile) %></a></h2>
                <fieldset>
                    <p><%= LocalizeString("CODPaymentTermDescriptionLabel") %></p>
                    <div class="dnnFormItem">
                        <dnn1:LabelControl ID="PaymentTermsCODActiveLabelControl" runat="server" />
                        <asp:CheckBox ID="PaymentTermsCODActiveCheckBox" runat="server" />
                    </div>
                    <uc1:PaymentTermAvailabilityRuleControl ID="PaymentTermsCODAvailabilityRuleControl" runat="server" Width="100%" />
                </fieldset>
                <h2 id="Net30FormSectionHead" class="dnnFormSectionHead">
                    <a href="#" class="dnnSectionExpanded"><%= Localization.GetString(((int)PaymentTermType.Net30).ToString(), Global.FilePaths.LocalPaymentTermTypeResourceFile) %></a></h2>
                <fieldset>
                    <p><%= LocalizeString("Net30PaymentTermDescriptionLabel") %></p>
                    <div class="dnnFormItem">
                        <dnn1:LabelControl ID="PaymentTermsNet30ActiveLabelControl" runat="server" />
                        <asp:CheckBox ID="PaymentTermsNet30ActiveCheckBox" runat="server" />
                    </div>
                    <uc1:PaymentTermAvailabilityRuleControl ID="PaymentTermsNet30AvailabilityRuleControl" runat="server" Width="100%" />
                </fieldset>
            </asp:Panel>
            <div class="row rvdsf-footerbar-container">
                <div class="col-sm-6">
                                
                </div>
                <div class="col-sm-6 text-sm-right">
                    <asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />        
                </div>
            </div>
    </ContentTemplate>
</asp:UpdatePanel>
