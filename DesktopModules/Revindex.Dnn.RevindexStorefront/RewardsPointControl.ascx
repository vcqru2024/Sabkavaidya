<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RewardsPointControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.RewardsPointControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="RewardsPointHistoryControl.ascx" TagName="RewardsPointHistoryControl" TagPrefix="uc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<asp:PlaceHolder runat="server">

	<script type="text/javascript">
		jQuery(document).ready(function ()
		{
			jQuery('#RewardsPointDetailsViewTabPanel').dnnTabs();
		});
		Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function ()
		{
			jQuery('#RewardsPointDetailsViewTabPanel').dnnTabs();
		});
	</script>

</asp:PlaceHolder>
<div>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
			<asp:MultiView ID="ContentMultiView" runat="server">
				<asp:View ID="ListView" runat="server">
					<h2><%= LocalizeString("RewardsPointsHeader") %></h2>
					<div class="row rvdsf-actionbar-container">
							<div class="col-sm-6">
								
							</div>
							<div class="col-sm-6 text-sm-right">
								<asp:HyperLink ID="AddHyperLink" runat="server" resourcekey="AddHyperLink" CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-RewardsPointDetailsViewTabPanel', '/')" />
							</div>
						</div>
					<asp:Panel ID="SearchPanel" runat="server" DefaultButton="SearchLinkButton" CssClass="rvdsfSearchContainer">
						<fieldset>
							<div class="input-group">
								<asp:TextBox ID="SearchQueryTextBox" runat="server" CssClass="form-control" type="search"></asp:TextBox>
								<div class="input-group-btn input-group-append" >
									<asp:LinkButton ID="ResetLinkButton" runat="server" resourcekey="ResetLinkButton" OnClick="ResetLinkButton_Click" CausesValidation="false" CssClass="btn btn-default btn-outline-secondary rvdResetAction" />
									<asp:LinkButton ID="SearchLinkButton" runat="server" resourcekey="SearchLinkButton" OnClick="SearchLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdSearchAction" />
								</div>
							</div>
						</fieldset>
					</asp:Panel>
					<div class="rvdsfListContainer">
						<asp:GridView ID="RewardsPointGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="RewardsPointID" OnRowDeleting="RewardsPointGridView_RowDeleting" OnRowDataBound="RewardsPointGridView_RowDataBound">
							<PagerStyle CssClass="dnnGridPager" />
							<Columns>
								<asp:TemplateField HeaderText="User">
									<ItemTemplate>
										<asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" />
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField DataField="Points" HeaderText="Points" SortExpression="Points" />
								<asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
								<asp:TemplateField HeaderStyle-Width="5%">
									<ItemTemplate>
										<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>
						<asp:ObjectDataSource ID="RewardsPointObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCount" SelectMethod="GetAll" SortParameterName="sortExpression" TypeName="Revindex.Business.Revindex.Revindex.Storefront.RewardsPointController">
							<SelectParameters>
								<asp:Parameter Name="sortExpression" Type="String" />
								<asp:Parameter Name="maximumRows" Type="Int32" />
								<asp:Parameter Name="startRowIndex" Type="Int32" />
								<rvd1:UserControlParameter Name="portalID" PropertyName="PortalId" Type="Int32" />
								<asp:ControlParameter ControlID="SearchQueryTextBox" Name="query" PropertyName="Text" Type="String" />
							</SelectParameters>
						</asp:ObjectDataSource>
					</div>
				</asp:View>
				<asp:View ID="DetailsView" runat="server">
					<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
					<h2><%= LocalizeString("RewardsPointHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label runat="server" ID="RewardsPointIDLabel" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
					<div id="RewardsPointDetailsViewTabPanel">
						<ul class="dnnAdminTabNav dnnClear">
							<li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
								<asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
							<li><a href="#<%= NotesDetailsViewPanel.ClientID %>">
								<asp:Label ID="NotesDetailsViewTabLabel" runat="server" resourcekey="NotesDetailsViewTabLabel" /></a></li>
							<li><a href="#<%= HistoryDetailsViewPanel.ClientID %>">
								<asp:Label ID="HistoryDetailsViewTabLabel" runat="server" resourcekey="HistoryDetailsViewTabLabel" /></a></li>
						</ul>
						<asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="StatusLabelControl" runat="server" />
									<asp:DropDownList ID="StatusDropDownList" runat="server">
										<asp:ListItem resourcekey="ActiveLabel" Value="2" />
										<asp:ListItem resourcekey="InactiveLabel" Value="1" />
										<asp:ListItem resourcekey="HoldLabel" Value="3" />
										<asp:ListItem resourcekey="CancelledLabel" Value="4" />
									</asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="UserIDLabelControl" runat="server"></dnn1:LabelControl>
									<asp:RequiredFieldValidator ID="UserIDRequiredFieldValidator" runat="server" ControlToValidate="UserIDTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:TextBox ID="UserIDTextBox" runat="server"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="PointsLabelControl" runat="server" CssClass="dnnFormRequired"></dnn1:LabelControl>
									<asp:RequiredFieldValidator ID="PointsRequiredFieldValidator" runat="server" ControlToValidate="PointsTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:RangeValidator ID="PointsRangeValidator" runat="server" ControlToValidate="PointsTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="PointsCompareValidator" runat="server" ControlToValidate="PointsTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="PointsTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ExpiryDateLabelControl" runat="server"></dnn1:LabelControl>
									<asp:Label ID="ExpiryDateLabel" runat="server" Text=""></asp:Label>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="NotesDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="AdminNotesLabelControl" runat="server"></dnn1:LabelControl>
									<asp:TextBox ID="AdminNotesTextBox" runat="server" MaxLength="4000" Rows="10" TextMode="MultiLine"></asp:TextBox>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="HistoryDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<uc1:RewardsPointHistoryControl ID="RewardsPointHistoryControl1" runat="server"></uc1:RewardsPointHistoryControl>
							</fieldset>
						</asp:Panel>
					</div>
					<div class="row rvdsf-footerbar-container">
                        <div class="col-sm-6">
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" resourcekey="DeleteLinkButton" CssClass="btn btn-default btn-light" CausesValidation="false" OnClick="DeleteLinkButton_Click" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()"></asp:LinkButton>
                        </div>
                        <div class="col-sm-6 text-sm-right">
                            <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
							<asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
							<asp:LinkButton ID="SaveAndBackLinkButton" runat="server" resourcekey="SaveAndBackLinkButton" OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
                        </div>
                    </div>
				</asp:View>
			</asp:MultiView>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
