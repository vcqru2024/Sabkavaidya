<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserPaymentControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.UserPaymentControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="UserAddressDropDownListControl.ascx" TagName="UserAddressDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="PlaceHolder1" runat="server">

    <script type="text/javascript">
        jQuery(document).ready(function ()
        {
            jQuery('#UserPaymentDetailsViewTabPanel').dnnTabs();
        });
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function ()
        {
            jQuery('#UserPaymentDetailsViewTabPanel').dnnTabs();
        });
    </script>

</asp:PlaceHolder>
<div>
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
            <asp:MultiView ID="ContentMultiView" runat="server">
                <asp:View ID="ListView" runat="server">
                    <div class="rvdsfListContainer">
                        <div class="row rvdsf-actionbar-container">
							<div class="col-sm-6">
								
							</div>
							<div class="col-sm-6 text-sm-right">
								<asp:HyperLink ID="AddHyperLink" resourcekey="AddHyperLink" runat="server" CssClass="btn btn-primary rvdAddNewAction" />
							</div>
						</div>
                        <asp:GridView ID="UserPaymentGridView" runat="server" AllowSorting="False" AutoGenerateColumns="False" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="True" DataKeyNames="UserPaymentID" OnRowDataBound="UserPaymentGridView_RowDataBound" OnRowDeleting="UserPaymentGridView_RowDeleting">
                            <PagerStyle CssClass="dnnGridPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="PaymentMethod" SortExpression="PaymentMethod">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Street" HeaderText="Address" />
                                <asp:TemplateField HeaderStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="UserPaymentObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCountByUser" SelectMethod="GetAllByUser" SortParameterName="sortExpression" TypeName="Revindex.Business.Revindex.Revindex.Storefront.UserPaymentController">
                            <SelectParameters>
                                <asp:Parameter Name="sortExpression" Type="String" />
                                <asp:Parameter Name="maximumRows" Type="Int32" />
                                <asp:Parameter Name="startRowIndex" Type="Int32" />
                                <rvd1:UserControlParameter Name="userID" PropertyName="UserID" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </asp:View>
                <asp:View ID="DetailsView" runat="server">
                    <uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
                    <h2><%= LocalizeString("UserPaymentHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="UserPaymentIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
                    <div id="UserPaymentDetailsViewTabPanel">
                        <ul class="dnnAdminTabNav dnnClear">
                            <li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
                                <asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
                        </ul>
                        <asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentMethodLabelControl" runat="server" />
                                    <asp:DropDownList ID="PaymentMethodDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="PaymentMethodDropDownList_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <asp:Panel ID="ACHPanel" runat="server">
                                    <div class="dnnFormItem">
                                        <dnn1:LabelControl ID="InstitutionNameLabelControl" runat="server" CssClass="dnnFormRequired" />
                                        <asp:RequiredFieldValidator ID="InstitutionNameRequiredFieldValidator" resourcekey="InstitutionNameRequiredFieldValidator" runat="server" ControlToValidate="InstitutionNameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="InstitutionNameTextBox" runat="server" CssClass="dnnFormRequired" />
                                    </div>
                                    <div class="dnnFormItem">
                                        <dnn1:LabelControl ID="InstitutionNumberLabelControl" runat="server" CssClass="dnnFormRequired" />
                                        <asp:RequiredFieldValidator ID="InstitutionNumberRequiredFieldValidator" resourcekey="InstitutionNumberRequiredFieldValidator" runat="server" ControlToValidate="InstitutionNumberTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="InstitutionNumberTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[\d]{6,20}" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="InstitutionNumberTextBox" runat="server" CssClass="dnnFormRequired" />
                                    </div>
                                    <div class="dnnFormItem">
                                        <dnn1:LabelControl ID="AccountTypeLabelControl" runat="server" CssClass="dnnFormRequired" />
                                        <asp:DropDownList ID="AccountTypeDropDownList" runat="server">
						                    <asp:ListItem resourcekey="CheckingLabel" Value="1" />
						                    <asp:ListItem resourcekey="SavingsLabel" Value="2" />
					                    </asp:DropDownList>
                                    </div>
                                    <div class="dnnFormItem">
                                        <dnn1:LabelControl ID="AccountNumberLabelControl" runat="server" CssClass="dnnFormRequired" />
                                        <asp:RequiredFieldValidator ID="AccountNumberRequiredFieldValidator" runat="server" ControlToValidate="AccountNumberTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="AccountNumberTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[\d]{6,20}" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="AccountNumberTextBox" runat="server" MaxLength="24" CssClass="dnnFormRequired" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="CreditCardPanel" runat="server">
                                    <asp:Panel ID="HostedCreditCardPanel" runat="server">
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="HostedCreditCardLabelControl" runat="server" CssClass="dnnFormRequired" />
                                            <div id="rvdsfCreditCardContainer" class="rvdFormSubContainer" style="max-width:445px; border:  1px solid #c9c9c9; padding: 10px; box-shadow: 0px 1px 0px 0px rgba(255, 255, 255, 0.8), inset 0px 1px 2px 0px rgba(0, 0, 0, 0.1)"></div>
                                            <span id="CreditCardGeneralValidator" class="dnnFormMessage dnnFormError" style="display: none"></span>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="InlineCreditCardPanel" runat="server">
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="CreditCardNumberLabelControl" runat="server" CssClass="dnnFormRequired" />
                                            <asp:RequiredFieldValidator ID="CreditCardNumberRequiredFieldValidator" runat="server" ControlToValidate="CreditCardNumberTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="CreditCardNumberTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[\*\d ]{13,24}" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                            <asp:TextBox ID="CreditCardNumberTextBox" runat="server" MaxLength="24" CssClass="dnnFormRequired" AutoCompleteType="Disabled"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="CreditCardExpiryLabelControl" runat="server" CssClass="dnnFormRequired" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="CreditCardExpiryYearTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="CreditCardExpiryYearTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^\d{4}$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                            <asp:DropDownList ID="CreditCardExpiryMonthDropDownList" runat="server" CssClass="dnnFormRequired rvdsfCreditCardExpiryMonthInput">
                                                <asp:ListItem Value="1">01</asp:ListItem>
                                                <asp:ListItem Value="2">02</asp:ListItem>
                                                <asp:ListItem Value="3">03</asp:ListItem>
                                                <asp:ListItem Value="4">04</asp:ListItem>
                                                <asp:ListItem Value="5">05</asp:ListItem>
                                                <asp:ListItem Value="6">06</asp:ListItem>
                                                <asp:ListItem Value="7">07</asp:ListItem>
                                                <asp:ListItem Value="8">08</asp:ListItem>
                                                <asp:ListItem Value="9">09</asp:ListItem>
                                                <asp:ListItem Value="10">10</asp:ListItem>
                                                <asp:ListItem Value="11">11</asp:ListItem>
                                                <asp:ListItem Value="12">12</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:TextBox ID="CreditCardExpiryYearTextBox" runat="server" Columns="4" MaxLength="4" CssClass="dnnFormRequired rvdsfCreditCardExpiryYearInput" AutoCompleteType="Disabled">2010</asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="CreditCardVerificationNumberLabelControl" runat="server" />
                                            <asp:TextBox ID="CreditCardVerificationNumberTextBox" runat="server" MaxLength="5" CssClass="rvdsfCreditCardVerificationNumberInput"></asp:TextBox>
                                        </div>
                                    </asp:Panel>
                                    <asp:HiddenField ID="PaymentNonceHiddenField" runat="server" />
                                    <asp:HiddenField ID="ProfileNumberHiddenField" runat="server" />
                                    <asp:HiddenField ID="PaymentNumberHiddenField" runat="server" />
                                    <asp:HiddenField ID="PaymentHintHiddenField" runat="server" />
                                    <asp:HiddenField ID="AuthenticationTokenHiddenField" runat="server" />
                                </asp:Panel>
                                <asp:Panel ID="TokenPanel" runat="server">
                                    <div class="dnnFormItem">
                                        <dnn1:LabelControl ID="ProfileNumberLabelControl" runat="server" />
                                        <asp:Label ID="ProfileNumberLabel" runat="server"></asp:Label>
                                    </div>
                                    <div class="dnnFormItem">
                                        <dnn1:LabelControl ID="PaymentNumberLabelControl" runat="server" />
                                        <asp:Label ID="PaymentNumberLabel" runat="server"></asp:Label>
                                    </div>
                                    <div class="dnnFormItem">
								        <dnn1:LabelControl ID="PaymentHintLabelControl" runat="server" />
								        <asp:Label ID="PaymentHintLabel" runat="server"></asp:Label>
							        </div>
                                </asp:Panel>
                                <asp:Panel ID="PaymentProfilePanel" runat="server" CssClass="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentProfileLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="PaymentProfileRequiredFieldValidator" runat="server" ControlToValidate="PaymentProfileRadioButtonList" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <div class="rvdFormSubContainer">
                                        <asp:RadioButtonList ID="PaymentProfileRadioButtonList" runat="server" CssClass="dnnFormRadioButtons dnnFormRequired" RepeatLayout="Flow" ValidationGroup="DetailsViewControl"></asp:RadioButtonList>
                                        <div class="rvdActions">
                                            <asp:LinkButton ID="CreatePaymentLinkButton" runat="server" OnClick="CreatePaymentLinkButton_Click" CausesValidation="False" resourcekey="CreatePaymentLinkButton" CssClass="btn btn-primary rvdAddNewAction" />
                                            <asp:LinkButton ID="EditPaymentLinkButton" runat="server" OnClick="EditPaymentLinkButton_Click" CausesValidation="False" resourcekey="EditPaymentLinkButton" CssClass="btn btn-primary rvdEditAction" />
                                            <asp:LinkButton ID="DeletePaymentLinkButton" runat="server" OnClick="DeletePaymentLinkButton_Click" CausesValidation="False" resourcekey="DeletePaymentLinkButton" CssClass="btn btn-default btn-light rvdDeleteAction" />
                                            <asp:LinkButton ID="UpdatePaymentLinkButton" runat="server" OnClick="UpdatePaymentLinkButton_Click" CausesValidation="False" resourcekey="UpdatePaymentLinkButton" CssClass="btn btn-default btn-light" Style="display: none" />
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="VoucherPanel" runat="server">
                                    <div class="dnnFormItem">
                                        <dnn1:LabelControl ID="VoucherCodeLabelControl" runat="server" CssClass="dnnFormRequired" />
                                        <asp:RequiredFieldValidator ID="VoucherCodeRequiredFieldValidator" runat="server" ControlToValidate="VoucherCodeTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="VoucherCodeTextBox" runat="server" MaxLength="255" CssClass="dnnFormRequired" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </asp:Panel>
                                <asp:UpdatePanel ID="UserAddressUpdatePanel" runat="server">
                                    <ContentTemplate>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="UserAddressLabelControl" runat="server" Text="" />
                                            <uc1:UserAddressDropDownListControl ID="UserAddressDropDownListControl" runat="server" AutoPostBack="True" CssClass="rvdsf-btn-select"/>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="FirstNameLabelControl" runat="server" CssClass="dnnFormRequired" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FirstNameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="FirstNameTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="LastNameLabelControl" runat="server" CssClass="dnnFormRequired" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LastNameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="LastNameTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="50"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="CompanyLabelControl" runat="server" />
                                            <asp:TextBox ID="CompanyTextBox" runat="server" MaxLength="100"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="CountryLabelControl" runat="server" />
                                            <asp:DropDownList ID="CountryDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="StreetLabelControl" runat="server" CssClass="dnnFormRequired" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="StreetTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="StreetTextBox" runat="server" MaxLength="200" CssClass="dnnFormRequired"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
									        <dnn1:LabelControl ID="UnitLabelControl" runat="server" />
									        <asp:TextBox ID="UnitTextBox" runat="server" MaxLength="200"></asp:TextBox>
								        </div>
								        <asp:Panel ID="DistrictPanel" runat="server" CssClass="dnnFormItem" Visible="false">
									        <dnn1:LabelControl ID="DistrictLabelControl" runat="server" />
									        <asp:TextBox ID="DistrictTextBox" runat="server" MaxLength="50"></asp:TextBox>
								        </asp:Panel>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="CityLabelControl" runat="server" CssClass="dnnFormRequired" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="CityTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="CityTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="SubdivisionLabelControl" runat="server" />
                                            <asp:DropDownList ID="SubdivisionDropDownList" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="PostalCodeLabelControl" runat="server" CssClass="dnnFormRequired" />
                                            <asp:RequiredFieldValidator ID="PostalCodeRequiredFieldValidator" runat="server" ControlToValidate="PostalCodeTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="PostalCodeTextBox" runat="server" MaxLength="10" CssClass="dnnFormRequired"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="PhoneLabelControl" runat="server" CssClass="dnnFormRequired" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="PhoneTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="PhoneTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="EmailLabelControl" runat="server" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="EmailTextBox" CssClass="dnnFormMessage dnnFormError" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                            <asp:TextBox ID="EmailTextBox" runat="server" MaxLength="256"></asp:TextBox>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="BusinessTaxNumberLabelControl" runat="server" />
                                    <asp:TextBox ID="BusinessTaxNumberTextBox" runat="server"></asp:TextBox>
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
                            <asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClientClick="return SaveLinkButton_ClientClick(this)" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />
                            <asp:LinkButton ID="SaveAndBackLinkButton" runat="server" resourcekey="SaveAndBackLinkButton" OnClientClick="return SaveLinkButton_ClientClick(this)" OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
                        </div>
                    </div>
                    <% if (this.Configuration.PaymentMethodsCreditCardActive && this.Configuration.PaymentMethodsCreditCardPaymentGateway == "Stripe") {  %>
                    <script type="text/javascript">
                            var stripe = null
                            var stripeCard = null
					        Sys.Application.add_load(function pageLoad(sender, args)
                            {
                                if ($("#rvdsfCreditCardContainer").length == 0) {
                                    stripeCard = null
                                }
                                else {
                                    if (document.getElementById("rvdsfCreditCardContainer") != null) {
                                        if (stripeCard == null) {
                                            $.getScript("https://js.stripe.com/v3/", function (data, textStatus, jqxhr) {
                                                stripe = Stripe("<%= this.Configuration.PaymentGatewaysStripePublishableKey %>")
                                                stripeCard = stripe.elements({ locale: "<%= this.PortalSettings.CultureCode.Substring(0, 2) %>" }).create('card', { hidePostalCode: true })
                                                stripeCard.mount('#rvdsfCreditCardContainer');
                                            })
                                        }
                                    }
                                    else if (!stripeCard._isMounted()) {
                                        stripeCard.mount('#rvdsfCreditCardContainer');
                                    }
                                }
					        });
				        </script>
                    <% } else if (this.Configuration.PaymentMethodsCreditCardActive && this.Configuration.PaymentMethodsCreditCardPaymentGateway == "Square") { %>
                    <script>
                        var square = null
                        Sys.Application.add_load(function pageLoad(sender, args) {
                            if ($("#rvdsfCreditCardContainer").length == 0) {
                                    square = null
                            }
                            else {
                                if (square == null) {
                                    $.getScript('<%= this.Configuration.PaymentGatewaysSquareTestMode ? "https://js.squareupsandbox.com/v2/paymentform" : "https://js.squareup.com/v2/paymentform" %>', function (data, textStatus, jqxhr) {

                                        square = new SqPaymentForm({
                                            applicationId: "<%= this.Configuration.PaymentGatewaysSquareApplicationID %>",
                                            locationId: "<%= this.Configuration.PaymentGatewaysSquareLocationID %>",
                                            card: {
                                                elementId: 'rvdsfCreditCardContainer'
                                            },
                                            callbacks: {
                                                cardNonceResponseReceived: function (errors, nonce, paymentData, contacts) {
                                                    if (errors) {
                                                        $("span[id='CreditCardGeneralValidator']").text(errors[0].message)
                                                        $("span[id='CreditCardGeneralValidator']").css("display", "inline")
                                                    } else {
                                                        <% if (this.Configuration.PaymentMethodsCreditCardActive) { %>
                                                        // Authenticate 3D Secure
                                                        square.verifyBuyer(
                                                            nonce,
                                                            {
                                                                intent: 'STORE',
                                                                billingContact: {
                                                                    givenName: $("input[id$='FirstNameTextBox']").val(),
                                                                    familyName: $("input[id$='LastNameTextBox']").val(),
                                                                }
                                                            },
                                                            function (err, verificationResult) {
                                                                if (err == null) {
                                                                    $("input[id$='PaymentNumberHiddenField']").val(nonce)
                                                                    $("input[id$='PaymentHintHiddenField']").val(paymentData.last_4)
                                                                    $("input[id$='AuthenticationTokenHiddenField']").val(verificationResult.token)

                                                                    // Scroll to top
                                                                    document.getElementById('RvdsfContentAnchor').scrollIntoView()

                                                                    // Fire postback by code
                                                                    WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(square.buttonName, "", true, "UserPaymentDetailsViewControl", "", false, true))
                                                                }
                                                                else {
                                                                    $("span[id='CreditCardGeneralValidator']").text(err.message)
                                                                    $("span[id='CreditCardGeneralValidator']").css("display", "inline")
                                                                }
                                                            })
                                                        <% } else { %>
                                                            $("input[id$='PaymentNumberHiddenField']").val(nonce)
                                                            $("input[id$='PaymentHintHiddenField']").val(paymentData.last_4)

                                                            // Scroll to top
                                                            document.getElementById('RvdsfContentAnchor').scrollIntoView()

                                                            // Fire postback by code
                                                            WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(square.buttonName, "", true, "UserPaymentDetailsViewControl", "", false, true))
                                                        <% } %>
                                                    }
                                                }
                                            }
                                        })

                                        square.build()
                                    })
                                }
                            }
                        })
                    </script>
                    <% } %>
                    <script type="text/javascript">
                        function SaveLinkButton_ClientClick(sender)
					            {
                                    if (typeof (Page_ClientValidate) != 'function' || Page_ClientValidate("UserPaymentDetailsViewControl"))
                                    {
                                        <% if (this.Configuration.PaymentMethodsCreditCardActive && this.Configuration.PaymentMethodsCreditCardPaymentGateway == "IntuitQBPayments") { %>

                                        var buttonName = $(sender).attr("id").replace(/_/g, "$")

                                        var tokenUrl = "<%= (this.Configuration.PaymentGatewaysIntuitQBPaymentsTestMode ? "https://sandbox.api.intuit.com/quickbooks/v4/payments/tokens" : "https://api.intuit.com/quickbooks/v4/payments/tokens") %>"

                                        var tokenData = {
                                            card: {
                                                name: $("input[id$='FirstNameTextBox']").val() + ' ' + $("input[id$='LastNameTextBox']").val(),
                                                number: $("input[id$='CreditCardNumberTextBox']").val().replaceAll(/ /g, ""),
                                                expMonth: $("select[id$='CreditCardExpiryMonthDropDownList']").val().padStart(2, "0"),
                                                address: {
                                                    postalCode: $("input[id$='PostalCodeTextBox']").val(),
                                                    country: $("select[id$='CountryDropDownList']").val(),
                                                    region: $("select[id$='SubdivisionDropDownList']").val() ? $("select[id$='SubdivisionDropDownList']").val().substring(3) : "",
                                                    streetAddress: $("input[id$='StreetTextBox']").val(),
                                                    city: $("input[name='CityTextBox']").val()
                                                },
                                                expYear: $("input[id$='CreditCardExpiryYearTextBox']").val(),
                                                cvc: $("input[id$='CreditCardVerificationNumberTextBox']").val()
                                            }
                                        }

                                        $.ajax({
                                            type: "POST",
                                            contentType: "application/json",
                                            url: tokenUrl,
                                            data: JSON.stringify(tokenData)
                                        })
                                        .done(function (data, textStatus, jqXHR) {

                                            $("input[id$='PaymentHintHiddenField']").val($("input[id$='CreditCardNumberTextBox']").val().slice(-4))
                                            $("input[id$='PaymentNonceHiddenField']").val(data.value)

                                            // Fire postback by code
                                            WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(buttonName, "", false, "UserPaymentDetailsViewControl", "", false, true))
                                        })
                                        .fail(function (data, textStatus, errorThrown) {
                                            $("#rvdsfSalesPaymentErrorManagePaymentContainer").text(data.responseJSON.errors[0].message).show()
                                        })

                                        return false;

                                        <% } %>
						                <% else if (this.Configuration.PaymentMethodsCreditCardActive && this.Configuration.PaymentMethodsCreditCardPaymentGateway == "Stripe") {  %>

                                        var buttonName = $(sender).attr("id").replace(/_/g, "$")
                                        $("span[id='CreditCardGeneralValidator']").css("display", "none")

                                        stripe.createPaymentMethod('card', stripeCard, {
									        billing_details: { name: $("input[id$='FirstNameTextBox']").val() + ' ' + $("input[id$='LastNameTextBox']").val() }
								        }).then(function (result) {
									        if (result.error) {
										        $("span[id='CreditCardGeneralValidator']").text(result.error.message)
						                        $("span[id='CreditCardGeneralValidator']").css("display", "inline")
									        } else {
                                                $("input[id$='PaymentNumberHiddenField']").val(result.paymentMethod.id)
						                        $("input[id$='PaymentHintHiddenField']").val(result.paymentMethod.card.last4)

										        // Scroll to top
                                                document.getElementById('RvdsfContentAnchor').scrollIntoView()

						                        // Fire postback by code
						                        WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(buttonName, "", true, "UserPaymentDetailsViewControl", "", false, true))
									        }
								        })

						                return false;
						                <% } else if (this.Configuration.PaymentMethodsCreditCardActive && this.Configuration.PaymentMethodsCreditCardPaymentGateway == "Square") { %>

                                        $("span[id='CreditCardGeneralValidator']").css("display", "none")

                                        square.buttonName = $(sender).attr("id").replace(/_/g, "$")
							            square.requestCardNonce()

                                        return false;
                                        <% } %>
							        }

                                    // Scroll to top
                                    document.getElementById('RvdsfContentAnchor').scrollIntoView()

							        return true;
						        }
                    </script>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
