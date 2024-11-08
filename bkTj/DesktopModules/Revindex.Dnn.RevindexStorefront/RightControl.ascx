<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RightControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.RightControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<asp:PlaceHolder runat="server">

	<script type="text/javascript">
		Sys.Application.add_load(function () {
            kendo.culture(Revindex.Portal.CultureCode)
			kendo.bind($(".rvdsf-content-container"))

            $('#RightDetailsViewTabPanel').dnnTabs();
		})
    </script>

</asp:PlaceHolder>
<div>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
			<asp:MultiView ID="ContentMultiView" runat="server">
				<asp:View ID="ListView" runat="server">
					<h2><%= LocalizeString("RightsHeader") %></h2>
					<div class="row rvdsf-actionbar-container">
						<div class="col-sm-6">
							<asp:HyperLink ID="ExportHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportLink") %></asp:HyperLink>
							<asp:HyperLink ID="ImportHyperLink" runat="server" CssClass="btn btn-link rvdImportAction" ><em class="glyphicon glyphicon-import fa fas fa-download"></em> <%= LocalizeString("ImportLink") %></asp:HyperLink>
						</div>
						<div class="col-sm-6 text-sm-right">
							<asp:HyperLink ID="AddHyperLink" runat="server" resourcekey="AddHyperLink" CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-RightDetailsViewTabPanel', '/')" />
						</div>
					</div>
					<asp:Panel ID="SearchPanel" runat="server" DefaultButton="SearchLinkButton" CssClass="rvdsfSearchContainer">
						<fieldset>
							<div class="input-group">
								<asp:TextBox ID="SearchQueryTextBox" runat="server" CssClass="form-control" type="search"></asp:TextBox>
								<div class="input-group-btn input-group-append" >
									<button class="btn btn-default btn-outline-secondary" type="button" data-toggle="collapse" href="#rvdsfRightSearchPanel"><em class="glyphicon glyphicon-filter fa fas fa-filter"></em> <%= LocalizeString("FilterLink") %></button>
									<asp:LinkButton ID="ResetLinkButton" runat="server" resourcekey="ResetLinkButton" OnClick="ResetLinkButton_Click" CausesValidation="false" CssClass="btn btn-default btn-outline-secondary rvdResetAction" />
									<asp:LinkButton ID="SearchLinkButton" runat="server" resourcekey="SearchLinkButton" OnClick="SearchLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdSearchAction" />
								</div>
							</div>
						</fieldset>
						<div id="rvdsfRightSearchPanel" class="collapse persist">
							<fieldset class="rvdSplit2">
								<div class="dnnFormItem">
									<dnn1:LabelControl runat="server" ID="RightDefinitionSearchLabelControl" />
									<asp:DropDownList ID="RightDefinitionSearchDropDownList" runat="server" />
								</div>
								<asp:Panel ID="SellerSearchPanel" runat="server" CssClass="dnnFormItem">
									<dnn1:LabelControl runat="server" ID="SellerSearchLabelControl"></dnn1:LabelControl>
									<asp:TextBox ID="SellerSearchTextBox" runat="server" data-role="combobox" data-clear-button="true" data-text-field="Name" data-value-field="SellerID" 
										data-source="{
											serverFiltering: true,
											serverPaging: true,
											pageSize: 50,
											transport: {
												read: {
													type: 'POST',
													url: function() { return servicesFramework.getServiceRoot('Revindex.Dnn.RevindexStorefront') + 'Seller/Lookup' },
													   beforeSend: servicesFramework.setModuleHeaders,
													dataType: 'json',
													contentType: 'application/json; charset=UTF-8'
												},
												parameterMap: function (data, type) {
													return kendo.stringify({
														Query: data.filter.filters.length &gt; 0 ? data.filter.filters[0].value : '',
														ItemIndex: 0,
														MaxItems: data.pageSize
													})
												}
											},
											schema: {
												data: function (response) {

													// We need to decycle any circular references because Kendo UI can only support flat structure
													return JSON.decycle(response)
												}
											},
											sort: { field: 'Name', dir: 'asc' }
										}" 
										data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="SellerSearchTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
								</asp:Panel>
								<div class="dnnFormItem">
									<dnn1:LabelControl runat="server" ID="AssignedLabelControl" ></dnn1:LabelControl>
									<asp:CheckBox ID="AssignedSearchCheckBox" runat="server" Checked="True" />
								</div>
							</fieldset>
						</div>
					</asp:Panel>
					<div class="rvdsfListContainer">
						<asp:GridView ID="RightGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="RightID" OnRowDeleting="RightGridView_RowDeleting" OnRowDataBound="RightGridView_RowDataBound" >
							<PagerStyle CssClass="dnnGridPager" />
							<Columns>
								<asp:TemplateField HeaderText="Code" SortExpression="Code">
									<ItemTemplate>
										<asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" />
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField DataField="IssueDate" HeaderText="IssueDate" SortExpression="IssueDate" DataFormatString="{0:yyyy-MM-dd}" />
								<asp:BoundField DataField="AssignedUserID" HeaderText="AssignedUser" SortExpression="AssignedUserID" />
								<asp:TemplateField HeaderStyle-Width="5%">
									<ItemTemplate>
										<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>
						<asp:ObjectDataSource ID="RightObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCount" SelectMethod="GetAll" SortParameterName="sortExpression" TypeName="Revindex.Business.Revindex.Revindex.Storefront.RightController">
							<SelectParameters>
								<asp:Parameter Name="sortExpression" Type="String" />
								<asp:Parameter Name="maximumRows" Type="Int32" />
								<asp:Parameter Name="startRowIndex" Type="Int32" />
								<rvd1:UserControlParameter Name="portalID" PropertyName="PortalId" Type="Int32" />
								<asp:ControlParameter ControlID="SellerSearchTextBox" Name="sellerID" PropertyName="Text" Type="Int32" />
								<asp:ControlParameter ControlID="RightDefinitionSearchDropDownList" Name="rightDefinitionID" PropertyName="SelectedValue" Type="Int32" />
								<asp:ControlParameter ControlID="SearchQueryTextBox" Name="query" PropertyName="Text" Type="String" />
								<asp:ControlParameter ControlID="AssignedSearchCheckBox" Name="assigned" PropertyName="Checked" Type="Boolean" />
							</SelectParameters>
						</asp:ObjectDataSource>
					</div>
				</asp:View>
				<asp:View ID="DetailsView" runat="server">
					<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
					<h2><%= LocalizeString("RightHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label runat="server" ID="RightIDLabel" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
					<div class="row rvdsf-actionbar-container">
                        <div class="col-sm-6">
							<asp:LinkButton ID="EmailRightReceiptLinkButton" runat="server" OnClick="EmailRightReceiptLinkButton_Click" CssClass="btn btn-link rvdEmailAction" ValidationGroup="DetailsViewControl" ><em class="glyphicon glyphicon-envelope fa fas fa-envelope"></em> <%= LocalizeString("EmailRightsLink") %></asp:LinkButton>
                        </div>
                        <div class="col-sm-6 text-sm-right">

                        </div>
                    </div>
					<div id="RightDetailsViewTabPanel">
						<ul class="dnnAdminTabNav dnnClear">
							<li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
								<asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
							<li><a href="#<%= NotesDetailsViewPanel.ClientID %>">
								<asp:Label ID="NotesDetailsViewTabLabel" runat="server" resourcekey="NotesDetailsViewTabLabel" /></a></li>
						</ul>
						<asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<asp:Panel ID="SellerPanel" runat="server" CssClass="dnnFormItem">
                                    <dnn1:LabelControl ID="SellerLabelControl" runat="server" />
									<asp:TextBox ID="SellerTextBox" runat="server" data-role="combobox" data-clear-button="true" data-text-field="Name" data-value-field="SellerID" 
                                    data-source="{
                                        serverFiltering: true,
                                        serverPaging: true,
                                        pageSize: 50,
                                        transport: {
                                            read: {
                                                type: 'POST',
                                                url: function() { return servicesFramework.getServiceRoot('Revindex.Dnn.RevindexStorefront') + 'Seller/Lookup' },
                                                   beforeSend: servicesFramework.setModuleHeaders,
                                                dataType: 'json',
                                                contentType: 'application/json; charset=UTF-8'
                                            },
                                            parameterMap: function (data, type) {
                                                return kendo.stringify({
													Query: data.filter.filters.length &gt; 0 ? data.filter.filters[0].value : '',
													ItemIndex: 0,
													MaxItems: data.pageSize
												})
                                            }
                                        },
                                        schema: {
                                            data: function (response) {

                                                // We need to decycle any circular references because Kendo UI can only support flat structure
                                                return JSON.decycle(response)
                                            }
                                        },
                                        sort: { field: 'Name', dir: 'asc' }
                                    }" 
                                    data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="SellerTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
                                </asp:Panel>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="CodeLabelControl" runat="server" CssClass="dnnFormRequired"/>
									<asp:RequiredFieldValidator ID="CodeRequiredFieldValidator" runat="server" ControlToValidate="CodeTextBox" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ValidationGroup="DetailsViewControl" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:TextBox ID="CodeTextBox" runat="server" TextMode="MultiLine" Rows="10" MaxLength="450"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RightDefinitionLabelControl" runat="server" CssClass="dnnFormRequired"/>
									<asp:RequiredFieldValidator ID="RightDefinitionRequiredFieldValidator" runat="server" ControlToValidate="RightDefinitionDropDownList" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ValidationGroup="DetailsViewControl" ><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:DropDownList ID="RightDefinitionDropDownList" runat="server">
									</asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="AssignedUserIDLabelControl" runat="server"></dnn1:LabelControl>
									<asp:TextBox ID="AssignedUserIDTextBox" runat="server"></asp:TextBox>
									<asp:HyperLink ID="AssignedUserIDHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="IssueDateLabelControl" runat="server" />
									<asp:Label ID="IssueDateLabel" runat="server" Text=""></asp:Label>
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
