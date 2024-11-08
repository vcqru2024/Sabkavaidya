<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductVariantBookingRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductVariantBookingRuleControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
    
<script type="text/javascript">
	Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))
    })
</script>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="BookingRuleLabelControl" runat="server"></dnn1:LabelControl>
	<div class="rvdFormSubContainer">
		<asp:ListBox ID="SelectionListBox" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SelectionListBox_SelectedIndexChanged" CssClass="rvdFormListBox"></asp:ListBox>
		<div class="rvdActions">
			<asp:LinkButton ID="AddSelectionLinkButton" runat="server" CausesValidation="False" resourcekey="AddSelectionLinkButton" OnClick="AddSelectionLinkButton_Click" CssClass="btn btn-primary rvdAddNewAction" />
		</div>
		<asp:Panel ID="EditSelectionPanel" runat="server">
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="StartDateLabelControl" runat="server" CssClass="dnnFormRequired"/>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="StartDateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="ProductVariantBookingRuleDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
				<asp:TextBox ID="StartDateTextBox" runat="server" placeholder="YYYY-MM-DD" CssClass="rvd-form-datetime" data-role="datepicker" data-format="yyyy-MM-dd"/>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="RepeatLabelControl" runat="server" />
				<asp:DropDownList ID="RepeatDropDownList" runat="server">
					<asp:ListItem resourcekey="NeverLabel" Value="" />
					<asp:ListItem resourcekey="DailyLabel" Value="day" />
					<asp:ListItem resourcekey="WeeklyLabel" Value="week" />
					<asp:ListItem resourcekey="MonthlyLabel" Value="month" />
					<asp:ListItem resourcekey="YearlyLabel" Value="year" />
				</asp:DropDownList>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="StopDateValueLabelControl" runat="server" />
				<asp:TextBox ID="StopDateTextBox" runat="server" placeholder="YYYY-MM-DD" CssClass="rvd-form-datetime" data-role="datepicker" data-format="yyyy-MM-dd"/>
			</div>
			<div class="rvdActions">
				<asp:LinkButton ID="DeleteLinkButton" runat="server" resourcekey="DeleteLinkButton" OnClick="DeleteLinkButton_Click" CssClass="btn btn-default btn-light rvdDeleteAction" CausesValidation="False" />
				<asp:LinkButton ID="SaveSelectionLinkButton" runat="server" resourcekey="SaveSelectionLinkButton" OnClick="SaveSelectionLinkButton_Click" CssClass="btn btn-primary rvdOKAction" ValidationGroup="ProductVariantBookingRuleDetailsViewControl" />
			</div>
		</asp:Panel>
	</div>
</div>
