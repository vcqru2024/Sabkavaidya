<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VoucherControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.VoucherControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="VoucherHistoryControl.ascx" TagName="VoucherHistoryControl" TagPrefix="uc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<asp:PlaceHolder runat="server">

	<script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery('#VoucherDetailsViewTabPanel').dnnTabs();
        });
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            jQuery('#VoucherDetailsViewTabPanel').dnnTabs();
        });
    </script>

</asp:PlaceHolder>
<div>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
			<asp:MultiView ID="ContentMultiView" runat="server">
				<asp:View ID="ListView" runat="server">
					<h2><%= LocalizeString("VouchersHeader") %></h2>
					<div class="row rvdsf-actionbar-container">
							<div class="col-sm-6">
								<asp:HyperLink ID="ExportHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportLink") %></asp:HyperLink>
								<asp:HyperLink ID="ImportHyperLink" runat="server" CssClass="btn btn-link rvdImportAction" ><em class="glyphicon glyphicon-import fa fas fa-download"></em> <%= LocalizeString("ImportLink") %></asp:HyperLink>
							</div>
							<div class="col-sm-6 text-sm-right">
								<asp:HyperLink ID="AddHyperLink" runat="server" resourcekey="AddHyperLink" CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-VoucherDetailsViewTabPanel', '/')" />
							</div>
						</div>
					<asp:Panel ID="SearchPanel" runat="server" DefaultButton="SearchLinkButton" CssClass="rvdsfSearchContainer">
						<fieldset>
							<div class="input-group">
								<asp:TextBox ID="SearchQueryTextBox" runat="server" CssClass="form-control" type="search"></asp:TextBox>
								<div class="input-group-btn input-group-append" >
									<button class="btn btn-default btn-outline-secondary" type="button" data-toggle="collapse" href="#rvdsfVoucherSearchPanel"><em class="glyphicon glyphicon-filter fa fas fa-filter"></em> <%= LocalizeString("FilterLink") %></button>
									<asp:LinkButton ID="ResetLinkButton" runat="server" resourcekey="ResetLinkButton" OnClick="ResetLinkButton_Click" CausesValidation="false" CssClass="btn btn-default btn-outline-secondary rvdResetAction" />
									<asp:LinkButton ID="SearchLinkButton" runat="server" resourcekey="SearchLinkButton" OnClick="SearchLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdSearchAction" />
								</div>
							</div>
						</fieldset>

						<div id="rvdsfVoucherSearchPanel" class="collapse persist">
							<fieldset class="rvdSplit2">
								<div class="dnnFormItem">
									<dnn1:LabelControl runat="server" ID="VoucherDefinitionSearchLabelControl" />
									<asp:DropDownList ID="VoucherDefinitionSearchDropDownList" runat="server" />
								</div>
							</fieldset>
						</div>
					</asp:Panel>
					<div class="rvdsfListContainer">
						<asp:GridView ID="VoucherGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="VoucherID" OnRowDeleting="VoucherGridView_RowDeleting" OnRowDataBound="VoucherGridView_RowDataBound">
							<PagerStyle CssClass="dnnGridPager" />
							<Columns>
								<asp:TemplateField HeaderText="Code" SortExpression="Code">
									<ItemTemplate>
										<asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" />
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
								<asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
								<asp:BoundField DataField="IssueDate" HeaderText="IssueDate" SortExpression="IssueDate" DataFormatString="{0:yyyy-MM-dd}" />
								<asp:TemplateField HeaderStyle-Width="5%">
									<ItemTemplate>
										<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>
						<asp:ObjectDataSource ID="VoucherObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCount" SelectMethod="GetAll" SortParameterName="sortExpression" TypeName="Revindex.Business.Revindex.Revindex.Storefront.VoucherController">
							<SelectParameters>
								<asp:Parameter Name="sortExpression" Type="String" />
								<asp:Parameter Name="maximumRows" Type="Int32" />
								<asp:Parameter Name="startRowIndex" Type="Int32" />
								<asp:Parameter Name="deleted" Type="Boolean" DefaultValue="false"></asp:Parameter>
								<rvd1:UserControlParameter Name="portalID" PropertyName="PortalId" Type="Int32" />
								<asp:ControlParameter ControlID="SearchQueryTextBox" Name="query" PropertyName="Text" Type="String" />
								<asp:ControlParameter ControlID="VoucherDefinitionSearchDropDownList" Name="voucherDefinitionID" PropertyName="SelectedValue" Type="Int32" />
							</SelectParameters>
						</asp:ObjectDataSource>
					</div>
				</asp:View>
				<asp:View ID="DetailsView" runat="server">
					<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
					<h2><%= LocalizeString("VoucherHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label runat="server" ID="VoucherIDLabel" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
					<div class="row rvdsf-actionbar-container">
                        <div class="col-sm-6">
							<asp:LinkButton ID="EmailVoucherReceiptLinkButton" runat="server" OnClick="EmailVoucherReceiptLinkButton_Click" CssClass="btn btn-link rvdEmailAction" ValidationGroup="DetailsViewControl" ><em class="glyphicon glyphicon-envelope fa fas fa-envelope"></em> <%= LocalizeString("EmailVoucherLink") %></asp:LinkButton>
                        </div>
                        <div class="col-sm-6 text-sm-right">

                        </div>
                    </div>
					<div id="VoucherDetailsViewTabPanel">
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
								<asp:Panel ID="QuantityPanel" runat="server" CssClass="dnnFormItem">
									<dnn1:LabelControl ID="QuantityLabelControl" runat="server" />
									<asp:RequiredFieldValidator ID="QuantityRequiredFieldValidator" runat="server" ControlToValidate="QuantityTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:RangeValidator ID="QuantityRangeValidator" runat="server" ControlToValidate="QuantityTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="QuantityCompareValidator" runat="server" ControlToValidate="QuantityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="QuantityTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
								</asp:Panel>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="CodeLabelControl" runat="server" />
									<asp:Label runat="server" ID="CodeLabel"></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="VoucherDefinitionLabelControl" runat="server" />
									<asp:DropDownList ID="VoucherDefinitionDropDownList" runat="server" OnSelectedIndexChanged="VoucherDefinitionDropDownList_SelectedIndexChanged" AutoPostBack="True">
									</asp:DropDownList>
									<asp:Label ID="VoucherDefinitionLabel" runat="server" Text=""></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="StatusLabelControl" runat="server" />
									<asp:DropDownList ID="StatusDropDownList" runat="server"></asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="AssignedUserIDLabelControl" runat="server"></dnn1:LabelControl>
									<asp:TextBox ID="AssignedUserIDTextBox" runat="server"></asp:TextBox>
									<asp:HyperLink ID="AssignedUserIDHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="InitialAmountLabelControl" runat="server"></dnn1:LabelControl>
									<asp:Label ID="InitialAmountLabel" runat="server" Text=""></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="AmountLabelControl" runat="server" CssClass="dnnFormRequired"></dnn1:LabelControl>
									<asp:RequiredFieldValidator ID="AmountRequiredFieldValidator" runat="server" ControlToValidate="AmountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:CompareValidator ID="AmountCompareValidator" runat="server" ControlToValidate="AmountTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="AmountTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="PromotionAmountLabelControl" runat="server" />
									<asp:Label ID="PromotionAmountLabel" runat="server" Text=""></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="IssueDateLabelControl" runat="server" />
									<asp:Label ID="IssueDateLabel" runat="server" Text=""></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ExpiryDateLabelControl" runat="server"></dnn1:LabelControl>
									<asp:Label ID="ExpiryDateLabel" runat="server" Text=""></asp:Label>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="SalesOrderDetailIDLabelControl" runat="server"></dnn1:LabelControl>
									<asp:HyperLink ID="SalesOrderDetailIDHyperLink" runat="server" Text=""></asp:HyperLink>
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
								<uc1:VoucherHistoryControl ID="VoucherHistoryControl1" runat="server"></uc1:VoucherHistoryControl>
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
