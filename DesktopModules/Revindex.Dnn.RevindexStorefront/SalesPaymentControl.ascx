<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesPaymentControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.SalesPaymentControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="UserAddressDropDownListControl.ascx" TagName="UserAddressDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="UserPaymentDropDownListControl.ascx" TagName="UserPaymentDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="PlaceHolder1" runat="server">

    <script type="text/javascript">
        jQuery(document).ready(function ()
        {
            jQuery('#SalesPaymentDetailsViewTabPanel').dnnTabs();
        });
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function ()
        {
            jQuery('#SalesPaymentDetailsViewTabPanel').dnnTabs();
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
								<asp:HyperLink ID="AddHyperLink" resourcekey="AddHyperLink" runat="server" CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-SalesPaymentDetailsViewTabPanel', '/')" />
							</div>
						</div>
                        <asp:GridView ID="SalesPaymentGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="True" DataKeyNames="SalesPaymentID" OnRowDataBound="SalesPaymentGridView_RowDataBound" OnRowDeleting="SalesPaymentGridView_RowDeleting">
                            <PagerStyle CssClass="dnnGridPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="Date" SortExpression="PaymentDate">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="PaymentMethod" HeaderText="Method" SortExpression="PaymentMethod" />
                                <asp:BoundField DataField="TransactionType" HeaderText="Transaction" SortExpression="TransactionType" />
                                <asp:BoundField DataField="PaymentGatewayResponseCode" HeaderText="GatewayResult" SortExpression="PaymentGatewayResponseCode" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                                <asp:TemplateField HeaderStyle-Width="5%">
									<ItemTemplate>
										<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="SalesPaymentObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCount" SelectMethod="GetAll" SortParameterName="sortExpression" TypeName="Revindex.Business.Revindex.Revindex.Storefront.SalesPaymentController">
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
                    <h2><%= LocalizeString("PaymentHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="SalesPaymentIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label><span style="margin-left: 20px; color: #999">Total:</span> <asp:Label ID="HeaderTotalAmountLabel" runat="server" style="color: #999"/><span style="margin-left: 20px; color: #999">Balance:</span> <asp:Label ID="HeaderBalanceDueLabel" runat="server" style="color: #999"/></h2>
                    <div class="row rvdsf-actionbar-container">
                        <div class="col-sm-6">
							<asp:LinkButton ID="CreateUserPaymentLinkButton" runat="server" OnClick="CreateUserPaymentLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-link" ><em class="glyphicon glyphicon-copy fa fas fa-copy"></em> <%= LocalizeString("CreateUserPaymentLink") %></asp:LinkButton>
                        </div>
                        <div class="col-sm-6 text-sm-right">

                        </div>
                    </div>
                    <div id="SalesPaymentDetailsViewTabPanel">
                        <ul class="dnnAdminTabNav dnnClear">
                            <li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
                                <asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
                            <li><a href="#<%= PaymentResultDetailsViewPanel.ClientID %>">
                                <asp:Label ID="PaymentResultDetailsViewTabLabel" runat="server" resourcekey="PaymentResultDetailsViewTabLabel" /></a></li>
                        </ul>
                        <asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="SalesPaymentGUIDLabelControl" runat="server" />
                                    <asp:Label ID="SalesPaymentGUIDLabel" runat="server"></asp:Label>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="ParentPaymentIDLabelControl" runat="server" />
                                    <asp:HyperLink ID="ParentSalesPaymentIDHyperLink" runat="server"></asp:HyperLink>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentDateLabelControl" runat="server" />
                                    <asp:Label ID="PaymentDateLabel" runat="server"></asp:Label>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="OriginLabelControl" runat="server" />
                                    <asp:Label ID="OriginLabel" runat="server"></asp:Label>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="TransactionTypeLabelControl" runat="server" />
                                    <asp:Label ID="TransactionTypeLabel" runat="server"></asp:Label>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="AmountLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="AmountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="AmountRangeValidator" runat="server" ControlToValidate="AmountTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			                        <asp:CompareValidator ID="AmountCompareValidator" runat="server" ControlToValidate="AmountTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			                        <asp:TextBox ID="AmountTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="UserPaymentLabelControl" runat="server" Text="" />
                                    <uc1:UserPaymentDropDownListControl ID="UserPaymentDropDownListControl" runat="server" AutoPostBack="True" CssClass="rvdsf-btn-select"/>
                                </div>
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
                                    <div class="dnnFormItem">
                                        <dnn1:LabelControl ID="ACHHintLabelControl" runat="server" />
                                        <asp:Label ID="ACHHintLabel" runat="server"></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="CreditCardPanel" runat="server">
                                    <div class="dnnFormItem">
                                        <dnn1:LabelControl ID="CreditCardNumberLabelControl" runat="server" CssClass="dnnFormRequired" />
                                        <asp:RequiredFieldValidator ID="CreditCardNumberRequiredFieldValidator" runat="server" ControlToValidate="CreditCardNumberTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="CreditCardNumberTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[\d ]{13,24}" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="CreditCardNumberTextBox" runat="server" MaxLength="24" CssClass="dnnFormRequired" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                    <div class="dnnFormItem">
                                        <dnn1:LabelControl ID="CreditCardHintLabelControl" runat="server" />
                                        <asp:Label ID="CreditCardHintLabel" runat="server"></asp:Label>
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
                                <asp:Panel ID="PaymentProfilePanel" runat="server" CssClass="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentProfileLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="PaymentProfileRequiredFieldValidator" runat="server" ControlToValidate="PaymentProfileRadioButtonList" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <div class="rvdFormSubContainer">
                                        <asp:RadioButtonList ID="PaymentProfileRadioButtonList" runat="server" CssClass="dnnFormRadioButtons dnnFormRequired" RepeatLayout="Flow" ValidationGroup="DetailsViewControl"></asp:RadioButtonList>
                                        <asp:Label ID="PaymentHintLabel" runat="server" />
                                        <div class="rvdActions">
                                            <asp:LinkButton ID="CreatePaymentLinkButton" runat="server" OnClick="CreatePaymentLinkButton_Click" CausesValidation="False" resourcekey="CreatePaymentLinkButton" CssClass="btn btn-primary rvdAddNewAction" />
                                            <asp:LinkButton ID="EditPaymentLinkButton" runat="server" OnClick="EditPaymentLinkButton_Click" CausesValidation="False" resourcekey="EditPaymentLinkButton" CssClass="btn btn-primary rvdEditAction" />
                                            <asp:LinkButton ID="DeletePaymentLinkButton" runat="server" OnClick="DeletePaymentLinkButton_Click" CausesValidation="False" resourcekey="DeletePaymentLinkButton" CssClass="btn btn-default btn-light rvdDeleteAction" />
                                            <asp:LinkButton ID="UpdatePaymentLinkButton" runat="server" OnClick="UpdatePaymentLinkButton_Click" CausesValidation="False" resourcekey="UpdatePaymentLinkButton" CssClass="btn btn-default btn-light" Style="display: none" />
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="ProfileNumberPanel" runat="server" CssClass="dnnFormItem">
                                    <dnn1:LabelControl ID="ProfileNumberLabelControl" runat="server" />
                                    <asp:TextBox ID="ProfileNumberTextBox" runat="server" CssClass="dnnFormRequired" />
                                </asp:Panel>
                                <asp:Panel ID="PaymentNumberPanel" runat="server" CssClass="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentNumberLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="PaymentNumberRequiredFieldValidator" runat="server" ControlToValidate="PaymentNumberTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="PaymentNumberTextBox" runat="server" CssClass="dnnFormRequired" />
                                </asp:Panel>
                                <asp:Panel ID="VoucherPanel" runat="server">
                                    <div class="dnnFormItem">
                                        <dnn1:LabelControl ID="VoucherCodeLabelControl" runat="server" CssClass="dnnFormRequired" />
                                        <asp:RequiredFieldValidator ID="VoucherCodeRequiredFieldValidator" runat="server" ControlToValidate="VoucherCodeTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="VoucherCodeTextBox" runat="server" MaxLength="255" CssClass="dnnFormRequired" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </asp:Panel>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="UserHostAddressLabelControl" runat="server" />
                                    <asp:Label ID="UserHostAddressLabel" runat="server"></asp:Label>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="UserAddressLabelControl" runat="server" Text="" />
                                    <uc1:UserAddressDropDownListControl ID="UserAddressDropDownListControl" runat="server" AutoPostBack="True" CssClass="rvdsf-btn-select"/>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="FirstNameLabelControl" runat="server" />
                                    <asp:TextBox ID="FirstNameTextBox" runat="server" MaxLength="50" ></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="LastNameLabelControl" runat="server" />
                                    <asp:TextBox ID="LastNameTextBox" runat="server" MaxLength="50"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="CompanyLabelControl" runat="server" />
                                    <asp:TextBox ID="CompanyTextBox" runat="server" MaxLength="100"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="CountryLabelControl" runat="server" CssClass="dnnFormRequired"/>
									<asp:RequiredFieldValidator ID="CountryRequiredFieldValidator" runat="server" ControlToValidate="CountryDropDownList" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:DropDownList ID="CountryDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="StreetLabelControl" runat="server" />
                                    <asp:TextBox ID="StreetTextBox" runat="server" MaxLength="200"></asp:TextBox>
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
                                    <dnn1:LabelControl ID="CityLabelControl" runat="server" />
                                    <asp:TextBox ID="CityTextBox" runat="server" MaxLength="50"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="SubdivisionLabelControl" runat="server" />
                                    <asp:DropDownList ID="SubdivisionDropDownList" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PostalCodeLabelControl" runat="server" />
                                    <asp:TextBox ID="PostalCodeTextBox" runat="server" MaxLength="10"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PhoneLabelControl" runat="server" />
                                    <asp:TextBox ID="PhoneTextBox" runat="server" MaxLength="50"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="EmailLabelControl" runat="server" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="EmailTextBox" CssClass="dnnFormMessage dnnFormError" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="EmailTextBox" runat="server" MaxLength="256"></asp:TextBox>
                                </div>
                            </fieldset>
                        </asp:Panel>
                        <asp:Panel ID="PaymentResultDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentGatewayLabelControl" runat="server" />
                                    <asp:Label ID="PaymentGatewayLabel" runat="server"></asp:Label>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentGatewayResponseCodeLabelControl" runat="server" />
                                    <asp:Label ID="PaymentGatewayResponseCodeLabel" runat="server"></asp:Label>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentGatewayTransactionIDCodeLabelControl" runat="server" />
                                    <asp:Label ID="PaymentGatewayTransactionIDLabel" runat="server"></asp:Label>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentGatewayReferenceIDLabelControl" runat="server" />
                                    <asp:Label ID="PaymentGatewayReferenceIDLabel" runat="server"></asp:Label>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentGatewayTokenLabelControl" runat="server" />
                                    <asp:Label ID="PaymentGatewayTokenLabel" runat="server"></asp:Label>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentGatewayResponseMessageLabelControl" runat="server" />
                                    <asp:Label ID="PaymentGatewayResponseMessageLabel" runat="server"></asp:Label>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentGatewayAuthorizationCodeLabelControl" runat="server" />
                                    <asp:Label ID="PaymentGatewayAuthorizationCodeLabel" runat="server"></asp:Label>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentGatewayAvsResponseCodeLabelControl" runat="server" />
                                    <asp:Label ID="PaymentGatewayAvsResponseCodeLabel" runat="server"></asp:Label>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentGatewayCvvResponseCodeLabelControl" runat="server" />
                                    <asp:Label ID="PaymentGatewayCvvResponseCodeLabel" runat="server"></asp:Label>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentGatewayDetailedResponseLabelControl" runat="server" />
                                    <asp:TextBox ID="PaymentGatewayDetailedResponseTextBox" runat="server" ReadOnly="True" Rows="10" TextMode="MultiLine" Width="100%" Wrap="False"></asp:TextBox>
                                </div>
                            </fieldset>
                        </asp:Panel>
                    </div>
                    <div class="row rvdsf-footerbar-container">
                        <div class="col-sm-4">
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" resourcekey="DeleteLinkButton" CssClass="btn btn-default btn-light" CausesValidation="false" OnClick="DeleteLinkButton_Click" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()"></asp:LinkButton>
                        </div>
                        <div class="col-sm-8 text-sm-right">
                            <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
                            <asp:LinkButton ID="InvoiceLinkButton" runat="server" resourcekey="InvoiceLinkButton" OnClick="InvoiceLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary" />
                            <asp:LinkButton ID="AuthorizeLinkButton" runat="server" resourcekey="AuthorizeLinkButton" OnClick="AuthorizeLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary" />
                            <asp:LinkButton ID="CaptureLinkButton" runat="server" resourcekey="CaptureLinkButton" OnClick="CaptureLinkButton_Click" ValidationGroup="DetailsViewControl"  CssClass="btn btn-primary" />
                            <asp:LinkButton ID="PurchaseLinkButton" runat="server" resourcekey="PurchaseLinkButton" OnClick="PurchaseLinkButton_Click" ValidationGroup="DetailsViewControl"  CssClass="btn btn-primary" />
                            <asp:LinkButton ID="VoidLinkButton" runat="server" resourcekey="VoidLinkButton" OnClick="VoidLinkButton_Click" ValidationGroup="DetailsViewControl" OnClientClick="return Revindex.Web.ConfirmAction()" CssClass="btn btn-primary" />
                            <asp:LinkButton ID="RefundLinkButton" runat="server" resourcekey="RefundLinkButton" OnClick="RefundLinkButton_Click" ValidationGroup="DetailsViewControl" OnClientClick="return Revindex.Web.ConfirmAction()" CssClass="btn btn-primary" />
                            <div class="btn-group dropup">
							    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%= LocalizeString("RecordExternalTransactionLink") %> <span class="caret"></span></button>
							    <ul class="dropdown-menu">
							        <li class="dropdown-item"><asp:LinkButton ID="ManualInvoiceLinkButton" runat="server" resourcekey="ManualInvoiceLinkButton" OnClick="ManualInvoiceLinkButton_Click" ValidationGroup="DetailsViewControl" /></li>
                                    <li class="dropdown-item"><asp:LinkButton ID="ManualAuthorizeLinkButton" runat="server" resourcekey="ManualAuthorizeLinkButton" OnClick="ManualAuthorizeLinkButton_Click" ValidationGroup="DetailsViewControl" /></li>
                                    <li class="dropdown-item"><asp:LinkButton ID="ManualCaptureLinkButton" runat="server" resourcekey="ManualCaptureLinkButton" OnClick="ManualCaptureLinkButton_Click" ValidationGroup="DetailsViewControl" /></li>
                                    <li class="dropdown-item"><asp:LinkButton ID="ManualPurchaseLinkButton" runat="server" resourcekey="ManualPurchaseLinkButton" OnClick="ManualPurchaseLinkButton_Click" ValidationGroup="DetailsViewControl" /></li>
                                    <li class="dropdown-item"><asp:LinkButton ID="ManualVoidLinkButton" runat="server" resourcekey="ManualVoidLinkButton" OnClick="ManualVoidLinkButton_Click" ValidationGroup="DetailsViewControl" OnClientClick="return Revindex.Web.ConfirmAction()" /></li>
                                    <li class="dropdown-item"><asp:LinkButton ID="ManualRefundLinkButton" runat="server" resourcekey="ManualRefundLinkButton" OnClick="ManualRefundLinkButton_Click" ValidationGroup="DetailsViewControl" OnClientClick="return Revindex.Web.ConfirmAction()" /></li>
							    </ul>
						    </div>
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
