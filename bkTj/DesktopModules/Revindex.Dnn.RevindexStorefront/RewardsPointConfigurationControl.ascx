<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RewardsPointConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.RewardsPointConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("RewardsPointHeader") %></h2>
<div>
	<hr />
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RewardsPointMonetaryRateLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="RewardsPointMonetaryRateRequiredFieldValidator" runat="server" ControlToValidate="RewardsPointMonetaryRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="RewardsPointMonetaryRateRangeValidator" runat="server" ControlToValidate="RewardsPointMonetaryRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="RewardsPointMonetaryRateCompareValidator" runat="server" ControlToValidate="RewardsPointMonetaryRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="RewardsPointMonetaryRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RewardsPointRewardOrderActiveLabelControl" runat="server" />
			<asp:CheckBox ID="RewardsPointRewardOrderActiveCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RewardsPointRewardOrderMinAmountLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="RewardsPointRewardOrderMinAmountRequiredFieldValidator" runat="server" ControlToValidate="RewardsPointRewardOrderMinAmountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="RewardsPointRewardOrderMinAmountRangeValidator" runat="server" ControlToValidate="RewardsPointRewardOrderMinAmountTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="RewardsPointRewardOrderMinAmountCompareValidator" runat="server" ControlToValidate="RewardsPointRewardOrderMinAmountTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="RewardsPointRewardOrderMinAmountTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RewardsPointRewardOrderPointRateLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="RewardsPointRewardOrderPointRateRequiredFieldValidator" runat="server" ControlToValidate="RewardsPointRewardOrderPointRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="RewardsPointRewardOrderPointRateRangeValidator" runat="server" ControlToValidate="RewardsPointRewardOrderPointRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="RewardsPointRewardOrderPointRateCompareValidator" runat="server" ControlToValidate="RewardsPointRewardOrderPointRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="RewardsPointRewardOrderPointRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RewardsPointRewardOrderDelayLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="RewardsPointRewardOrderDelayRequiredFieldValidator" runat="server" ControlToValidate="RewardsPointRewardOrderDelayTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="RewardsPointRewardOrderDelayRangeValidator" runat="server" ControlToValidate="RewardsPointRewardOrderDelayTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="RewardsPointRewardOrderDelayCompareValidator" runat="server" ControlToValidate="RewardsPointRewardOrderDelayTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="RewardsPointRewardOrderDelayTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RewardsPointRedeemMinPointQuantityLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="RewardsPointRedeemMinPointQuantityRequiredFieldValidator" runat="server" ControlToValidate="RewardsPointRedeemMinPointQuantityTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="RewardsPointRedeemMinPointQuantityRangeValidator" runat="server" ControlToValidate="RewardsPointRedeemMinPointQuantityTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="RewardsPointRedeemMinPointQuantityCompareValidator" runat="server" ControlToValidate="RewardsPointRedeemMinPointQuantityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="RewardsPointRedeemMinPointQuantityTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RewardsPointExpiryIntervalLabelControl" runat="server" CssClass="dnnFormRequired" />
			<asp:RequiredFieldValidator ID="RewardsPointExpiryIntervalRequiredFieldValidator" runat="server" ControlToValidate="RewardsPointExpiryIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:RangeValidator ID="RewardsPointExpiryIntervalRangeValidator" runat="server" ControlToValidate="RewardsPointExpiryIntervalTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="RewardsPointExpiryIntervalCompareValidator" runat="server" ControlToValidate="RewardsPointExpiryIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="RewardsPointExpiryIntervalTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
			<asp:DropDownList ID="RewardsPointExpiryIntervalTypeDropDownList" runat="server" CssClass="rvdUnitInput">
				<asp:ListItem Value="1" resourcekey="DayLabel" ></asp:ListItem>
				<asp:ListItem Value="2" resourcekey="WeekLabel" ></asp:ListItem>
				<asp:ListItem Value="3" resourcekey="MonthLabel" ></asp:ListItem>
				<asp:ListItem Value="4" resourcekey="YearLabel" ></asp:ListItem>
			</asp:DropDownList>
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
