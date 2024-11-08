<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesExportControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.SalesExportControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="PlaceHolder1" runat="server">

	<script type="text/javascript">
		jQuery(document).ready(function ()
		{
			jQuery('#SalesExportDetailsViewTabPanel').dnnTabs();
		});
		Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function ()
		{
			jQuery('#SalesExportDetailsViewTabPanel').dnnTabs();
		});
	</script>

</asp:PlaceHolder>
<div>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<Triggers>
			<asp:PostBackTrigger ControlID="ExportLinkButton" />
		</Triggers>
		<ContentTemplate>
			<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
			<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
			<h2><%= LocalizeString("ExportSalesHeader") %></h2>
			<div id="SalesExportDetailsViewTabPanel">
				<ul class="dnnAdminTabNav dnnClear">
					<li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
						<asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
				</ul>
				<asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
					<fieldset>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="EntityTypeLabelControl" runat="server" />
							<asp:DropDownList ID="EntityTypeDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="EntityTypeDropDownList_SelectedIndexChanged">
								<asp:ListItem Text="Pirate Ship shipment" Value="PirateShipShipment" />
								<asp:ListItem Text="QuickBooks invoice" Value="QuickBooksInvoice" />
								<asp:ListItem Text="Recurring sales order" Value="RecurringSalesOrder" />
								<asp:ListItem Text="Right" Value="Right" />
								<asp:ListItem Text="Sales order" Value="SalesOrder" />
								<asp:ListItem Text="Sales order detail" Value="SalesOrderDetail" />
								<asp:ListItem Text="Voucher" Value="Voucher" />
								<asp:ListItem Text="Xero invoice" Value="XeroInvoice" />
							</asp:DropDownList>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="OutputLabelControl" runat="server" />
							<asp:RadioButtonList ID="OutputRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons" AutoPostBack="True" OnSelectedIndexChanged="OutputRadioButtonList_SelectedIndexChanged">
								<asp:ListItem Text="Download" Value="download" Selected="True" />
								<asp:ListItem Text="Server" Value="server" />
							</asp:RadioButtonList>
						</div>
						<asp:Panel ID="FolderPanel" runat="server" CssClass="dnnFormItem" Visible="false">
							<dnn1:LabelControl ID="FolderLabelControl" runat="server" CssClass="dnnFormRequired" />
							<asp:DropDownList ID="FolderDropDownList" runat="server"></asp:DropDownList>
						</asp:Panel>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="FileLabelControl" runat="server" CssClass="dnnFormRequired"/>
							<asp:RequiredFieldValidator ID="FileRequiredFieldValidator" runat="server" ControlToValidate="FileTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
							<asp:RegularExpressionValidator ID="FileRegularExpressionValidator" runat="server" ControlToValidate="FileTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\w\-.]+$" ValidationGroup="DetailsViewControl" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
							<asp:TextBox ID="FileTextBox" runat="server" Text=""></asp:TextBox>
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="ColumnDelimiterLabelControl" runat="server" />
							<asp:DropDownList ID="ColumnDelimiterDropDownList" runat="server">
								<asp:ListItem resourcekey="CommaLabel" Value="," />
								<asp:ListItem resourcekey="PipeLabel" Value="|" />
								<asp:ListItem resourcekey="SemicolonLabel" Value=";" />
								<asp:ListItem resourcekey="TabLabel" Value="&#9;" />
							</asp:DropDownList>
						</div>
					</fieldset>
				</asp:Panel>
			</div>
			<div class="row rvdsf-footerbar-container">
                <div class="col-sm-6">
                                
                </div>
                <div class="col-sm-6 text-sm-right">
                    <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
					<asp:LinkButton ID="ExportLinkButton" runat="server" resourcekey="ExportLinkButton" OnClick="ExportLinkButton_Click" CssClass="btn btn-primary rvdExportAction" ValidationGroup="DetailsViewControl" />
                </div>
            </div>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
