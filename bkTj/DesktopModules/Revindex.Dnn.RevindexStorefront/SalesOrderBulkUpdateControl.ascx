<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesOrderBulkUpdateControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.SalesOrderBulkUpdateControl" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/urlcontrol.ascx" TagName="UrlControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="PlaceHolder1" runat="server">

	<script type="text/javascript">
		$(document).ready(function ()
		{
			$('#SalesOrderBulkDetailsViewTabPanel').dnnTabs();
			$('#<%= ResultPanel.ClientID %>').dnnPanels();
		});
		Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function ()
		{
			$('#SalesOrderBulkDetailsViewTabPanel').dnnTabs();
			$('#<%= ResultPanel.ClientID %>').dnnPanels();
		});
	</script>

</asp:PlaceHolder>
<div>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
			<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
			<h2><%= LocalizeString("BulkOperationHeader") %></h2>
			<p><%= LocalizeString("BulkDescriptionLabel") %></p>
			<div id="SalesOrderBulkDetailsViewTabPanel">
				<ul class="dnnAdminTabNav dnnClear">
					<li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
						<asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
				</ul>
				<asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
					<fieldset>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="CountLabelControl" runat="server" />
							<asp:Label ID="CountLabel" runat="server" />
						</div>
						<div class="dnnFormItem">
							<dnn1:LabelControl ID="OperationLabelControl" runat="server" />
							<asp:DropDownList ID="OperationDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="OperationDropDownList_SelectedIndexChanged">
								<asp:ListItem resourcekey="CapturePaymentLabel" Value="capturepayment" />
								<asp:ListItem resourcekey="UpdateSalesOrderLabel" Value="updatesalesorder" Selected="True" />
							</asp:DropDownList>
						</div>
						<asp:MultiView ID="OperationMultiView" runat="server" ActiveViewIndex="1">
							<asp:View ID="CapturePaymentView" runat="server">
								<div class="dnnFormItem">
								</div>
							</asp:View>
							<asp:View ID="UpdateSalesOrderView" runat="server">
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="StatusLabelControl" runat="server" />
									<asp:CheckBox ID="UpdateStatusCheckBox" runat="server" />
									<asp:DropDownList ID="StatusDropDownList" runat="server"></asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="SalesPaymentStatusLabelControl" runat="server" />
									<asp:CheckBox ID="UpdateSalesPaymentStatusCheckBox" runat="server" />
									<asp:DropDownList ID="SalesPaymentStatusDropDownList" runat="server"></asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShippingStatusLabelControl" runat="server" />
									<asp:CheckBox ID="UpdateShippingStatusCheckBox" runat="server" />
									<asp:DropDownList ID="ShippingStatusDropDownList" runat="server"></asp:DropDownList>
								</div>
							</asp:View>
						</asp:MultiView>
					</fieldset>
				</asp:Panel>
			</div>
			<div class="row rvdsf-footerbar-container">
                <div class="col-sm-6">
                                
                </div>
                <div class="col-sm-6 text-sm-right">
                    <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
					<asp:LinkButton ID="ExecuteLinkButton" runat="server" resourcekey="ExecuteLinkButton" OnClick="ExecuteLinkButton_Click" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
                </div>
            </div>
			<asp:Panel ID="ResultPanel" runat="server" >
				<h2 id="ResultSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("ResultHeader") %></a></h2>
				<fieldset>
					<asp:PlaceHolder ID="ResultPlaceHolder" runat="server" />
					<asp:GridView ID="ResultGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover" GridLines="None" EnableViewState="False">
						<PagerStyle CssClass="dnnGridPager" />
						<Columns>
							<asp:HyperLinkField DataTextField="Name" DataNavigateUrlFields="Url" Target="_blank" HeaderText="Item" />
							<asp:BoundField DataField="Success" HeaderText="Success" />
							<asp:BoundField DataField="Message" HeaderText="Message" />
						</Columns>
					</asp:GridView>
				</fieldset>
			</asp:Panel>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
