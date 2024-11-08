<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesReturnConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.SalesReturnConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("ReturnsHeader") %></h2>
<div>
	<hr />
    <fieldset>
        <div class="dnnFormItem">
            <dnn1:LabelControl ID="SalesReturnSalesReturnNumberFormatLabelControl" runat="server" CssClass="dnnFormRequired" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="SalesReturnSalesReturnNumberFormatTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="SalesReturnSalesReturnNumberFormatTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\w-.]*\{0:?[\w.#]*\}[\w-.]*$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
            <asp:TextBox ID="SalesReturnSalesReturnNumberFormatTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
        </div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="SalesReturnRefundIntervalLabelControl" runat="server" CssClass="dnnFormRequired" ></dnn1:LabelControl>
            <div>
				<asp:RequiredFieldValidator ID="SalesReturnRefundIntervalRequiredFieldValidator" runat="server" ControlToValidate="SalesReturnRefundIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
				<asp:RangeValidator ID="SalesReturnRefundIntervalRangeValidator" runat="server" ControlToValidate="SalesReturnRefundIntervalTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
				<asp:CompareValidator ID="SalesReturnRefundIntervalCompareValidator" runat="server" ControlToValidate="SalesReturnRefundIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
				<asp:TextBox ID="SalesReturnRefundIntervalTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
				<asp:DropDownList ID="SalesReturnRefundIntervalTypeDropDownList" runat="server" CssClass="rvdUnitInput">
					<asp:ListItem Value="1" resourcekey="DayLabel" ></asp:ListItem>
					<asp:ListItem Value="2" resourcekey="WeekLabel" ></asp:ListItem>
					<asp:ListItem Value="3" resourcekey="MonthLabel" ></asp:ListItem>
					<asp:ListItem Value="4" resourcekey="YearLabel" ></asp:ListItem>
				</asp:DropDownList>
            </div>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="SalesReturnCreditIntervalLabelControl" runat="server" CssClass="dnnFormRequired" ></dnn1:LabelControl>
            <div>
				<asp:RequiredFieldValidator ID="SalesReturnCreditIntervalRequiredFieldValidator" runat="server" ControlToValidate="SalesReturnCreditIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
				<asp:RangeValidator ID="SalesReturnCreditIntervalRangeValidator" runat="server" ControlToValidate="SalesReturnCreditIntervalTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
				<asp:CompareValidator ID="SalesReturnCreditIntervalCompareValidator" runat="server" ControlToValidate="SalesReturnCreditIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
				<asp:TextBox ID="SalesReturnCreditIntervalTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
				<asp:DropDownList ID="SalesReturnCreditIntervalTypeDropDownList" runat="server" CssClass="rvdUnitInput">
					<asp:ListItem Value="1" resourcekey="DayLabel" ></asp:ListItem>
					<asp:ListItem Value="2" resourcekey="WeekLabel" ></asp:ListItem>
					<asp:ListItem Value="3" resourcekey="MonthLabel" ></asp:ListItem>
					<asp:ListItem Value="4" resourcekey="YearLabel" ></asp:ListItem>
				</asp:DropDownList>
            </div>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="SalesReturnExchangeIntervalLabelControl" runat="server" CssClass="dnnFormRequired" ></dnn1:LabelControl>
            <div>
				<asp:RequiredFieldValidator ID="SalesReturnExchangeIntervalRequiredFieldValidator" runat="server" ControlToValidate="SalesReturnExchangeIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
				<asp:RangeValidator ID="SalesReturnExchangeIntervalRangeValidator" runat="server" ControlToValidate="SalesReturnExchangeIntervalTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
				<asp:CompareValidator ID="SalesReturnExchangeIntervalCompareValidator" runat="server" ControlToValidate="SalesReturnExchangeIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
				<asp:TextBox ID="SalesReturnExchangeIntervalTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
				<asp:DropDownList ID="SalesReturnExchangeIntervalTypeDropDownList" runat="server" CssClass="rvdUnitInput">
					<asp:ListItem Value="1" resourcekey="DayLabel" ></asp:ListItem>
					<asp:ListItem Value="2" resourcekey="WeekLabel" ></asp:ListItem>
					<asp:ListItem Value="3" resourcekey="MonthLabel" ></asp:ListItem>
					<asp:ListItem Value="4" resourcekey="YearLabel" ></asp:ListItem>
				</asp:DropDownList>
            </div>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="SalesReturnRepairIntervalLabelControl" runat="server" CssClass="dnnFormRequired" ></dnn1:LabelControl>
            <div>
				<asp:RequiredFieldValidator ID="SalesReturnRepairIntervalRequiredFieldValidator" runat="server" ControlToValidate="SalesReturnRepairIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
				<asp:RangeValidator ID="SalesReturnRepairIntervalRangeValidator" runat="server" ControlToValidate="SalesReturnRepairIntervalTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
				<asp:CompareValidator ID="SalesReturnRepairIntervalCompareValidator" runat="server" ControlToValidate="SalesReturnRepairIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
				<asp:TextBox ID="SalesReturnRepairIntervalTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
				<asp:DropDownList ID="SalesReturnRepairIntervalTypeDropDownList" runat="server" CssClass="rvdUnitInput">
					<asp:ListItem Value="1" resourcekey="DayLabel" ></asp:ListItem>
					<asp:ListItem Value="2" resourcekey="WeekLabel" ></asp:ListItem>
					<asp:ListItem Value="3" resourcekey="MonthLabel" ></asp:ListItem>
					<asp:ListItem Value="4" resourcekey="YearLabel" ></asp:ListItem>
				</asp:DropDownList>
            </div>
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
