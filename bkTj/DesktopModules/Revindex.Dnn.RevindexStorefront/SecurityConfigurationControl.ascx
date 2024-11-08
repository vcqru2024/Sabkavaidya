<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SecurityConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.SecurityConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("SecurityHeader") %></h2>
<div>
    <hr />
    <fieldset>
        <asp:Panel ID="SecuritySellerRolePanel" runat="server" CssClass="dnnFormItem">
            <dnn1:LabelControl ID="SecuritySellerRoleLabelControl" runat="server" />
            <asp:DropDownList ID="SecuritySellerRoleDropDownList" runat="server" >
            </asp:DropDownList>
        </asp:Panel>
        <asp:Panel ID="SecurityAllowedProductRolePanel" runat="server" CssClass="dnnFormItem">
            <dnn1:LabelControl ID="SecurityAllowedProductRoleLabelControl" runat="server" />
            <div class="rvd-form-checkboxes">
                <asp:CheckBoxList ID="SecurityAllowedProductRoleCheckBoxList" runat="server" CssClass="rvdFormCheckBoxes" >
                </asp:CheckBoxList>
            </div>
        </asp:Panel>
        <asp:Panel ID="SecurityAllowedProductRoleGroupPanel" runat="server" CssClass="dnnFormItem">
            <dnn1:LabelControl ID="SecurityAllowedProductRoleGroupLabelControl" runat="server" />
            <div class="rvd-form-checkboxes">
                <asp:CheckBoxList ID="SecurityAllowedProductRoleGroupCheckBoxList" runat="server" CssClass="rvdFormCheckBoxes" >
                </asp:CheckBoxList>
            </div>
        </asp:Panel>
        <asp:Panel ID="SecurityActionSqlActivePanel" runat="server" CssClass="dnnFormItem">
            <dnn1:LabelControl ID="SecurityActionSqlActiveLabelControl" runat="server" />
            <asp:CheckBox ID="SecurityActionSqlActiveCheckBox" runat="server" />
        </asp:Panel>
        <asp:Panel ID="SecurityDisplayTemplateServerCodeActivePanel" runat="server" CssClass="dnnFormItem">
            <dnn1:LabelControl ID="SecurityDisplayTemplateServerCodeActiveLabelControl" runat="server" />
            <asp:CheckBox ID="SecurityDisplayTemplateServerCodeActiveCheckBox" runat="server" />
        </asp:Panel>
		<asp:Panel ID="SecurityReportCustomActivePanel" runat="server" CssClass="dnnFormItem">
            <dnn1:LabelControl ID="SecurityReportCustomActiveLabelControl" runat="server" />
            <asp:CheckBox ID="SecurityReportCustomActiveCheckBox" runat="server" />
        </asp:Panel>
        <div class="dnnFormItem">
            <dnn1:LabelControl ID="SecurityEncryptionKeyLabelControl" runat="server" CssClass="dnnFormRequired" />
            <div class="rvdFormSubContainer">
                <asp:Panel ID="SecurityEncryptionKeyPanel" runat="server" Visible="False">
                    <div class="dnnFormItem">
                        <asp:TextBox ID="SecurityEncryptionKeyTextBox" runat="server" MaxLength="20" CssClass="dnnFormRequired"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="SecurityEncryptionKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="SecurityEncryptionKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\S]{6,20}$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                    </div>
                    <div class="alert alert-warning" ><%= LocalizeString("ChangeEncryptionKeyWarningLabel") %></div>
                </asp:Panel>
                <asp:LinkButton ID="ChangeEncryptionKeyLinkButton" resourcekey="ChangeEncryptionKeyLinkButton" runat="server" CausesValidation="False" OnClick="ChangeEncryptionKeyLinkButton_Click" CssClass="btn btn-link"></asp:LinkButton>
            </div>
        </div>
        <div class="dnnFormItem">
            <dnn1:LabelControl ID="SecurityStoreACHLabelControl" runat="server" />
            <asp:CheckBox ID="SecurityStoreACHCheckBox" runat="server" />
            <asp:LinkButton ID="DeleteACHLinkButton" resourcekey="DeleteACHLinkButton" runat="server" CausesValidation="False" OnClick="DeleteACHLinkButton_Click" CssClass="btn btn-default btn-light" OnClientClick="return Revindex.Web.ConfirmAction()"></asp:LinkButton>
        </div>
        <div class="dnnFormItem">
            <dnn1:LabelControl ID="SecurityStoreCreditCardLabelControl" runat="server" />
            <asp:CheckBox ID="SecurityStoreCreditCardCheckBox" runat="server" />
            <asp:LinkButton ID="DeleteCreditCardLinkButton" resourcekey="DeleteCreditCardLinkButton" runat="server" CausesValidation="False" OnClick="DeleteCreditCardLinkButton_Click" CssClass="btn btn-default btn-light" OnClientClick="return Revindex.Web.ConfirmAction()"></asp:LinkButton>
            <script>

            </script>
        </div>
    </fieldset>
    <div class="row rvdsf-footerbar-container">
        <div class="col-sm-6">
                                
        </div>
        <div class="col-sm-6 text-sm-right">
            <asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />                    
        </div>
    </div>
</div>
