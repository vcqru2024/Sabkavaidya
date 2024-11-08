<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/texteditor.ascx" TagName="TextEditor" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/urlcontrol.ascx" TagName="UrlControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="CategoryDropDownListControl.ascx" TagName="CategoryDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="CrosssellProductControl.ascx" TagName="CrosssellProductControl" TagPrefix="uc1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="GalleryControl.ascx" TagName="GalleryControl" TagPrefix="uc1" %>
<%@ Register Src="ProductVariantControl.ascx" TagName="ProductVariantControl" TagPrefix="uc1" %>
<%@ Register Src="ProductVariantGroupControl.ascx" TagName="ProductVariantGroupControl" TagPrefix="uc1" %>
<%@ Register Src="ProductVariantBookingRuleControl.ascx" TagName="ProductVariantBookingRuleControl" TagPrefix="uc1" %>
<%@ Register Src="ProductComponentControl.ascx" TagName="ProductComponentControl" TagPrefix="uc1" %>
<%@ Register Src="RequiredProductControl.ascx" TagName="RequiredProductControl" TagPrefix="uc1" %>
<%@ Register Src="CategoryCheckBoxListControl.ascx" TagName="CategoryCheckBoxListControl" TagPrefix="uc1" %>
<%@ Register Src="Pages/ProductReviewView.ascx" TagName="ProductReviewControl" TagPrefix="uc1" %>
<%@ Register Src="ProductChannelControl.ascx" TagName="ProductChannelControl" TagPrefix="uc1" %>
<%@ Register Src="RelatedProductControl.ascx" TagName="RelatedProductControl" TagPrefix="uc1" %>
<%@ Register Src="SimilarProductControl.ascx" TagName="SimilarProductControl" TagPrefix="uc1" %>
<%@ Register Src="ProductAttributeControl.ascx" TagName="ProductAttributeControl" TagPrefix="uc1" %>
<%@ Register Src="ProductDynamicFormCodeControl.ascx" TagName="ProductDynamicFormCodeControl" TagPrefix="uc1" %>
<%@ Register Src="ProductAvailabilityRuleControl.ascx" TagName="ProductAvailabilityRuleControl" TagPrefix="uc1" %>
<%@ Register Src="ProductVariantModifierRuleControl.ascx" TagName="ProductVariantModifierRuleControl" TagPrefix="uc1" %>
<%@ Register Src="ProductVariantSalesPromotionRuleControl.ascx" TagName="ProductVariantSalesPromotionRuleControl" TagPrefix="uc1" %>
<%@ Register Src="ProductVariantPlaceOrderActionRuleControl.ascx" TagName="ProductVariantPlaceOrderActionRuleControl" TagPrefix="uc1" %>
<%@ Register Src="TaxClassDropDownListControl.ascx" TagName="TaxClassDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/XmlEditorControl.ascx" TagName="XmlEditorControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
    
<script type="text/javascript">
	Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
		kendo.bind($(".rvdsf-content-container"))

		$('#ProductDetailsViewTabPanel').dnnTabs()
        $('#GeneralDetailsViewSubPanel').dnnPanels()

		// Set selected pill
        $("a[href='" + localStorage.getItem("DescriptionTabPanel") + "']").tab('show')
    })
</script>

<div>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
			<asp:MultiView ID="ContentMultiView" runat="server">
				<asp:View ID="ListView" runat="server">
					<h2><%= LocalizeString("ProductsHeader") %></h2>
					<div class="row rvdsf-actionbar-container">
                        <div class="col-sm-6">
							<asp:HyperLink ID="ExportHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportLink") %></asp:HyperLink>
							<asp:HyperLink ID="ImportHyperLink" runat="server" CssClass="btn btn-link rvdImportAction" ><em class="glyphicon glyphicon-import fa fas fa-download"></em> <%= LocalizeString("ImportLink") %></asp:HyperLink>
                        </div>
                        <div class="col-sm-6 text-sm-right">
							<asp:HyperLink  ID="AddHyperLink" resourcekey="AddHyperLink" runat="server"  CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-ProductDetailsViewTabPanel', '/')" />
                        </div>
                    </div>
					<asp:Panel ID="SearchPanel" runat="server" DefaultButton="SearchLinkButton" CssClass="rvdsfSearchContainer">
						<fieldset>
							<div class="input-group">
								<asp:TextBox ID="ProductSearchQueryTextBox" runat="server" CssClass="form-control" type="search"></asp:TextBox>
								<div class="input-group-btn input-group-append" >
									<button class="btn btn-default btn-outline-secondary" type="button" data-toggle="collapse" href="#rvdsfProductSearchPanel"><em class="glyphicon glyphicon-filter fa fas fa-filter"></em> <%= LocalizeString("FilterLink") %></button>
									<asp:LinkButton  ID="ResetLinkButton" resourcekey="ResetLinkButton" runat="server"  OnClick="ResetLinkButton_Click" CausesValidation="false" CssClass="btn btn-default btn-outline-secondary rvdResetAction" />
									<asp:LinkButton  ID="SearchLinkButton" resourcekey="SearchLinkButton" runat="server"  OnClick="SearchLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdSearchAction" />
								</div>
							</div>
						</fieldset>
						<div id="rvdsfProductSearchPanel" class="collapse persist">
							<fieldset class="rvdSplit2">
								<div class="dnnFormItem">
									<dnn1:LabelControl runat="server" ID="CategorySearchLabelControl" ></dnn1:LabelControl>
									<uc1:CategoryDropDownListControl ID="CategorySearchDropDownListControl" runat="server" ShowEmptyRoot="true"  />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl runat="server" ID="ManufacturerSearchLabelControl" ></dnn1:LabelControl>
									<asp:DropDownList runat="server" ID="ManufacturerSearchDropDownList" ></asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl runat="server" ID="DistributorSearchLabelControl" ></dnn1:LabelControl>
									<asp:DropDownList runat="server" ID="DistributorSearchDropDownList" ></asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl runat="server" ID="InventorySearchLabelControl" ></dnn1:LabelControl>
									<asp:DropDownList ID="InventorySearchDropDownList" runat="server">
										<asp:ListItem resourcekey="AnyLabel" Value="0" />
										<asp:ListItem resourcekey="BackorderInventoryLabel" Value="1" />
										<asp:ListItem resourcekey="EmptyInventoryLabel" Value="2" />
										<asp:ListItem resourcekey="UnderstockInventoryLabel" Value="3" />
										<asp:ListItem resourcekey="OverstockInventoryLabel" Value="4" />
										<asp:ListItem resourcekey="UnspecifiedInventoryLabel" Value="5" />
									</asp:DropDownList>
								</div>
								<asp:Panel ID="SellerSearchPanel" runat="server" CssClass="dnnFormItem">
									<dnn1:LabelControl runat="server" ID="SellerSearchLabelControl"></dnn1:LabelControl>
									<asp:TextBox ID="SellerSearchTextBox" runat="server" data-role="combobox" data-clear-button="true" data-text-field="Name" data-value-field="SellerID" 
										data-source="sellerSearchDataSource" 
										data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="SellerSearchTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
										<script type="text/javascript">
											var sellerSearchDataSource = new kendo.data.DataSource(
                                                {
                                                    serverFiltering: true,
                                                    serverPaging: true,
                                                    pageSize: 50,
                                                    transport: {
                                                        read: {
                                                            type: 'POST',
                                                            url: function () { return servicesFramework.getServiceRoot('Revindex.Dnn.RevindexStorefront') + 'Seller/Lookup' },
                                                            beforeSend: servicesFramework.setModuleHeaders,
                                                            dataType: 'json',
                                                            contentType: 'application/json; charset=UTF-8'
                                                        },
														parameterMap: function (data, type) {
															return kendo.stringify({
																Query: data.filter.filters.length > 0 ? data.filter.filters[0].value : '',
                                                                ItemIndex: 0,
                                                                MaxItems: data.pageSize
															})
                                                        }
                                                    },
                                                    schema: {
                                                        data: function (response) {

                                                            // We need to decycle any circular references because Kendo UI can only support flat structure
                                                            var res = JSON.decycle(response)

                                                            // Add standard choices
                                                            res.push({ Name: '<%= LocalizeString("AnyLabel") %>', SellerID: -1 })
                                                            return res
                                                        }
                                                    },
                                                    sort: { field: 'Name', dir: 'asc' }
                                                }
											)
                                        </script>
								</asp:Panel>
								<div class="row rvdsf-actionbar-container">
									<div class="col-sm-6"></div>
									<div class="col-sm-6 text-right">
										
										
									</div>
								</div>
							</fieldset>
						</div>
					</asp:Panel>
					<div class="rvdsfListContainer">
						<asp:GridView ID="ProductGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProductID" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="True" OnRowDeleting="ProductGridView_RowDeleting" OnRowDataBound="ProductGridView_RowDataBound" OnRowCommand="ProductGridView_RowCommand" OnDataBound="ProductGridView_DataBound">
							<PagerStyle CssClass="dnnGridPager" />
							<Columns>
								<asp:TemplateField HeaderStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Image ID="ThumbnailImage" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
								<asp:TemplateField HeaderText="Name" SortExpression="Name">
									<ItemTemplate>
										<asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" />
									</ItemTemplate>
								</asp:TemplateField>
								<asp:CheckBoxField DataField="Published" HeaderText="Published" SortExpression="Published" HeaderStyle-Width="10%"/>
								<asp:BoundField DataField="DisplayOrder" HeaderText="DisplayOrder" SortExpression="DisplayOrder" HeaderStyle-Width="15%"/>
								<asp:TemplateField HeaderStyle-Width="5%" HeaderStyle-CssClass="hidden-xs" ItemStyle-CssClass="hidden-xs">
									<ItemTemplate>
										<asp:HyperLink ID="PreviewHyperLink" runat="server" target="_blank" onclick="event.stopPropagation();"><em class="glyphicon glyphicon-eye-open fa fas fa-eye"></em></asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderStyle-Width="5%" HeaderStyle-CssClass="hidden-xs d-none d-sm-table-cell" ItemStyle-CssClass="hidden-xs d-none d-sm-table-cell">
									<ItemTemplate>
										<asp:LinkButton ID="DuplicateLinkButton" runat="server" CommandName="Duplicate" CausesValidation="false" OnClientClick="event.stopPropagation();" CommandArgument='<%# Eval("ProductID") %>'><em class="glyphicon glyphicon-duplicate"></em></asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderStyle-Width="5%">
									<ItemTemplate>
										<asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" CausesValidation="false" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
							<PagerTemplate>
								<table style="width: 100%">
									<tr>
										<td>
											<table>
												<tr>
													<td>
														<asp:LinkButton ID="PagePreviousLinkButton" runat="server" CommandName="Page" CommandArgument="Prev" Text="..." /></td>
													<td>
														<asp:LinkButton ID="Page1LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="1" /></td>
													<td>
														<asp:LinkButton ID="Page2LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="2" /></td>
													<td>
														<asp:LinkButton ID="Page3LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="3" /></td>
													<td>
														<asp:LinkButton ID="Page4LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="4" /></td>
													<td>
														<asp:LinkButton ID="Page5LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="5" /></td>
													<td>
														<asp:LinkButton ID="Page6LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="6" /></td>
													<td>
														<asp:LinkButton ID="Page7LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="7" /></td>
													<td>
														<asp:LinkButton ID="Page8LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="8" /></td>
													<td>
														<asp:LinkButton ID="Page9LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="9" /></td>
													<td>
														<asp:LinkButton ID="Page10LinkButton" runat="server" CommandName="Page" CommandArgument="1" Text="10" /></td>
													<td>
														<asp:LinkButton ID="PageNextLinkButton" runat="server" CommandName="Page" CommandArgument="Next" Text="..." /></td>
												</tr>
											</table>
										</td>
										<td style="text-align: right" class="form-inline"><%= LocalizeString("PageItemsLabel") %>
											<asp:DropDownList ID="PageViewSizeDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="PageViewSizeDropDownList_SelectedIndexChanged" CssClass="form-control input-sm">
												<asp:ListItem Value="10">10</asp:ListItem>
												<asp:ListItem Value="20">20</asp:ListItem>
												<asp:ListItem Value="50">50</asp:ListItem>
												<asp:ListItem Value="100">100</asp:ListItem>
											</asp:DropDownList>
										</td>
									</tr>
								</table>
							</PagerTemplate>
						</asp:GridView>
						<asp:ObjectDataSource ID="ProductObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCachedCount" SelectMethod="GetCachedAll" TypeName="Revindex.Business.Revindex.Revindex.Storefront.ProductController" SortParameterName="sortExpression" DataObjectTypeName="Revindex.Business.Revindex.Revindex.Storefront.Product" DeleteMethod="Delete">
							<SelectParameters>
								<asp:Parameter DefaultValue="" Name="sortExpression" Type="String" />
								<asp:Parameter DefaultValue="" Name="maximumRows" Type="Int32" />
								<asp:Parameter Name="startRowIndex" Type="Int32" />
								<asp:Parameter Name="deleted" Type="Boolean" DefaultValue="false"></asp:Parameter>
								<rvd1:UserControlParameter Name="portalID" PropertyName="PortalId" Type="Int32" />
								<asp:ControlParameter ControlID="ProductSearchQueryTextBox" Name="productSearch" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="CategorySearchDropDownListControl" Name="categoryID" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="ManufacturerSearchDropDownList" Name="manufacturerID" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="DistributorSearchDropDownList" Name="distributorID" PropertyName="SelectedValue" Type="Int32" />
								<asp:ControlParameter ControlID="InventorySearchDropDownList" Name="inventory" PropertyName="SelectedValue" Type="Int32" />
								<asp:ControlParameter ControlID="SellerSearchTextBox" Name="sellerID" PropertyName="Text" Type="Int32" />
							</SelectParameters>
						</asp:ObjectDataSource>
					</div>
				</asp:View>
				<asp:View ID="DetailsView" runat="server">
					<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
					<h2><%= LocalizeString("ProductHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="ProductIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
					<div class="row rvdsf-actionbar-container">
                        <div class="col-sm-6">
							<asp:LinkButton ID="DuplicateLinkButton" runat="server" CssClass="btn btn-link" OnClick="DuplicateLinkButton_Click" CausesValidation="False"><em class="glyphicon glyphicon-duplicate"></em> <%= LocalizeString("DuplicateLink") %></asp:LinkButton>
							<asp:HyperLink ID="PreviewHyperLink" runat="server" CssClass="btn btn-link rvdPreviewAction" Target="_blank" ><em class="glyphicon glyphicon-eye-open fa fas fa-eye"></em> <%= LocalizeString("PreviewLink") %></asp:HyperLink>
							<asp:HyperLink ID="AddFeaturesHyperLink" runat="server" CssClass="btn btn-link" ><em class="glyphicon glyphicon-plus fa fas fa-plus"></em> <%= LocalizeString("MoreFeaturesLink") %></asp:HyperLink>
                        </div>
                        <div class="col-sm-6 text-sm-right">
							
                        </div>
                    </div>
					<div id="ProductDetailsViewTabPanel">
						<ul class="dnnAdminTabNav dnnClear">
							<li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
								<asp:Label  ID="GeneralDetailsViewTabLabel" resourcekey="GeneralDetailsViewTabLabel" runat="server"  /></a></li>
							<li><a href="#<%= DisplayDetailsViewPanel.ClientID %>">
								<asp:Label  ID="DisplayDetailsViewTabLabel" resourcekey="DisplayDetailsViewTabLabel" runat="server"  /></a></li>
							<li ID="AvailabilityDetailsViewListItem" runat="server"><a href="#<%= AvailabilityDetailsViewPanel.ClientID %>">
								<asp:Label  ID="AvailabilityDetailsViewTabLabel" resourcekey="AvailabilityDetailsViewTabLabel" runat="server"  /></a></li>
							<li ID="AttributeDetailsViewListItem" runat="server"><a href="#<%= AttributeDetailsViewPanel.ClientID %>">
								<asp:Label  ID="AttributeDetailsViewTabLabel" resourcekey="AttributeDetailsViewTabLabel" runat="server"  /></a></li>
							<li ID="CustomFieldDetailsViewListItem" runat="server"><a href="#<%= CustomFieldDetailsViewPanel.ClientID %>">
								<asp:Label  ID="CustomFieldDetailsViewTabLabel" resourcekey="CustomFieldDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="RecurringDetailsViewListItem" runat="server"><a href="#<%= RecurringDetailsViewPanel.ClientID %>">
								<asp:Label  ID="RecurringDetailsViewTabLabel" resourcekey="RecurringDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="BookingDetailsViewListItem" runat="server"><a href="#<%= BookingDetailsViewPanel.ClientID %>">
								<asp:Label  ID="BookingDetailsViewTabLabel" resourcekey="BookingDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="ComponentDetailsViewListItem" runat="server"><a href="#<%= ComponentDetailsViewPanel.ClientID %>">
								<asp:Label  ID="ComponentDetailsViewTabLabel" resourcekey="ComponentDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="RequiredDetailsViewListItem" runat="server"><a href="#<%= RequiredDetailsViewPanel.ClientID %>">
								<asp:Label  ID="RequiredDetailsViewTabLabel" resourcekey="RequiredDetailsViewTabLabel" runat="server"  /></a></li>
							<li ID="RelatedDetailsViewListItem" runat="server"><a href="#<%= RelatedDetailsViewPanel.ClientID %>">
								<asp:Label  ID="RelatedDetailsViewTabLabel" resourcekey="RelatedDetailsViewTabLabel" runat="server"  /></a></li>
                            <li ID="SimilarDetailsViewListItem" runat="server"><a href="#<%= SimilarDetailsViewPanel.ClientID %>">
								<asp:Label  ID="SimilarDetailsViewTabLabel" resourcekey="SimilarDetailsViewTabLabel" runat="server"  /></a></li>
							<li ID="CrosssellDetailsViewListItem" runat="server"><a href="#<%= CrosssellDetailsViewPanel.ClientID %>">
								<asp:Label  ID="CrosssellDetailsViewTabLabel" resourcekey="CrosssellDetailsViewTabLabel" runat="server"  /></a></li>
							<li ID="ProductReviewDetailsViewListItem" runat="server"><a href="#<%= ProductReviewDetailsViewPanel.ClientID %>">
								<asp:Label  ID="ProductReviewDetailsViewTabLabel" resourcekey="ProductReviewDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="ActionDetailsViewListItem" runat="server"><a href="#<%= ActionDetailsViewPanel.ClientID %>">
								<asp:Label  ID="ActionDetailsViewTabLabel" resourcekey="ActionDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="RewardsPointDetailsViewListItem" runat="server"><a href="#<%= RewardsPointDetailsViewPanel.ClientID %>">
								<asp:Label  ID="RewardsPointDetailsViewTabLabel" resourcekey="RewardsPointDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="ResourceDetailsViewListItem" runat="server"><a href="#<%= ResourceDetailsViewPanel.ClientID %>">
								<asp:Label  ID="ResourceDetailsViewTabLabel" resourcekey="ResourceDetailsViewTabLabel" runat="server"  /></a></li>
                            <li id="SalesReturnDetailsViewListItem" runat="server"><a href="#<%= SalesReturnDetailsViewPanel.ClientID %>">
								<asp:Label  ID="ReturnDetailsViewTabLabel" resourcekey="ReturnDetailsViewTabLabel" runat="server"  /></a></li>
							<li ID="ProductChannelDetailsViewListItem" runat="server"><a href="#<%= ProductChannelDetailsViewPanel.ClientID %>">
								<asp:Label  ID="ProductChannelDetailsViewTabLabel" resourcekey="ProductChannelDetailsViewTabLabel" runat="server"  /></a></li>
							<li ID="ExtensionDetailsViewListItem" runat="server"><a href="#<%= ExtensionDetailsViewPanel.ClientID %>">
								<asp:Label  ID="ExtensionDetailsViewTabLabel" resourcekey="ExtensionDetailsViewTabLabel" runat="server"  /></a></li>
						</ul>
						<asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div ID="GeneralDetailsViewSubPanel">
									<asp:Panel ID="ProductKeyPanel" runat="server" CssClass="dnnFormItem">
										<dnn1:LabelControl ID="ProductKeyLabelControl" runat="server" CssClass="dnnFormRequired" />
										<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="ProductKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
										<asp:TextBox ID="ProductKeyTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
									</asp:Panel>
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
										<dnn1:LabelControl ID="NameLabelControl" runat="server" CssClass="dnnFormRequired" />
										<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
										<asp:TextBox ID="NameTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired" ></asp:TextBox>
									</div>
									<div class="dnnFormItem" style="display: none">
										<dnn1:LabelControl ID="ProductTypeLabelControl" runat="server" />
										<asp:DropDownList ID="ProductTypeDropDownList" runat="server">
											<asp:ListItem Value="1">Regular</asp:ListItem>
										</asp:DropDownList>
									</div>
									<div class="dnnFormItem">
										<dnn1:LabelControl runat="server" Text="" />
										<ul class="nav nav-pills" role="tablist">
											<li role="presentation" class="active"><a href="#SummaryTabPanel" role="tab" data-toggle="tab" onclick="localStorage.setItem('DescriptionTabPanel', this.getAttribute('href'))"><small><%= LocalizeString("SummaryLabel") %></small></a></li>
											<li role="presentation"><a href="#OverviewTabPanel" role="tab" data-toggle="tab" onclick="localStorage.setItem('DescriptionTabPanel', this.getAttribute('href'))"><small><%= LocalizeString("OverviewLabel") %></small></a></li>
											<li role="presentation"><a href="#SpecificationsTabPanel" role="tab" data-toggle="tab" onclick="localStorage.setItem('DescriptionTabPanel', this.getAttribute('href'))"><small><%= LocalizeString("SpecificationsLabel") %></small></a></li>
											<li role="presentation"><a href="#TermsTabPanel" role="tab" data-toggle="tab" onclick="localStorage.setItem('DescriptionTabPanel', this.getAttribute('href'))"><small><%= LocalizeString("TermsLabel") %></small></a></li>
											<li role="presentation"><a href="#FAQTabPanel" role="tab" data-toggle="tab" onclick="localStorage.setItem('DescriptionTabPanel', this.getAttribute('href'))"><small><%= LocalizeString("FAQLabel") %></small></a></li>
											<li role="presentation"><a href="#BuyingGuideTabPanel" role="tab" data-toggle="tab" onclick="localStorage.setItem('DescriptionTabPanel', this.getAttribute('href'))"><small><%= LocalizeString("GuideLabel") %></small></a></li>
										</ul>
										<div class="tab-content" style="min-height: 525px">
											<div role="tabpanel" class="tab-pane active" id="SummaryTabPanel">
												<div id="SummaryPanel" class="dnnFormItem">
													<dnn1:LabelControl ID="SummaryLabelControl" runat="server" />
													<asp:LinkButton ID="GenerateSummaryLinkButton" runat="server" CssClass="btn btn-link" OnClick="GenerateSummaryLinkButton_Click" CausesValidation="False"><em class="glyphicon glyphicon-education fa fas fa-graduation-cap"></em> <%= LocalizeString("GenerateContentLabel") %></asp:LinkButton>
													<dnn1:TextEditor ID="SummaryTextEditor" runat="server" ChooseRender="False" ChooseMode="False" DefaultMode="RICH" HtmlEncode="False" Width="100%" Height="460px" Mode="RICH" />
												</div>
											</div>
											<div role="tabpanel" class="tab-pane" id="OverviewTabPanel">
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="OverviewNameLabelControl" runat="server" />
													<asp:TextBox ID="OverviewNameTextBox" runat="server"></asp:TextBox>
												</div>
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="OverviewLabelControl" runat="server"/>
													<asp:LinkButton ID="GenerateOverviewLinkButton" runat="server" CssClass="btn btn-link" OnClick="GenerateOverviewLinkButton_Click" CausesValidation="False"><em class="glyphicon glyphicon-education fa fas fa-graduation-cap"></em> <%= LocalizeString("GenerateContentLabel") %></asp:LinkButton>
													<dnn1:TextEditor ID="OverviewTextEditor" runat="server" ChooseRender="False" ChooseMode="False" DefaultMode="RICH" HtmlEncode="False" Width="100%" Height="460px" Mode="RICH" />
												</div>
											</div>
											<div role="tabpanel" class="tab-pane" id="SpecificationsTabPanel">
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="SpecificationsNameLabelControl" runat="server" />
													<asp:TextBox ID="SpecificationsNameTextBox" runat="server"></asp:TextBox>
												</div>
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="SpecificationsLabelControl" runat="server"/>
													<asp:LinkButton ID="GenerateSpecificationsLinkButton" runat="server" CssClass="btn btn-link" OnClick="GenerateSpecificationsLinkButton_Click" CausesValidation="False"><em class="glyphicon glyphicon-education fa fas fa-graduation-cap"></em> <%= LocalizeString("GenerateContentLabel") %></asp:LinkButton>
													<dnn1:TextEditor ID="SpecificationsTextEditor" runat="server" ChooseRender="False" ChooseMode="False" DefaultMode="RICH" HtmlEncode="False" Width="100%" Height="460px" Mode="RICH" />
												</div>
											</div>
											<div role="tabpanel" class="tab-pane" id="TermsTabPanel">
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="TermsNameLabelControl" runat="server" />
													<asp:TextBox ID="TermsNameTextBox" runat="server"></asp:TextBox>
												</div>
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="TermsLabelControl" runat="server"/>
													<dnn1:TextEditor ID="TermsTextEditor" runat="server" ChooseRender="False" ChooseMode="False" DefaultMode="RICH" HtmlEncode="False" Width="100%" Height="460px" Mode="RICH" />
												</div>
											</div>
											<div role="tabpanel" class="tab-pane" id="FAQTabPanel">
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="FAQNameLabelControl" runat="server" />
													<asp:TextBox ID="FAQNameTextBox" runat="server"></asp:TextBox>
												</div>
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="FAQLabelControl" runat="server"/>
													<dnn1:TextEditor ID="FAQTextEditor" runat="server" ChooseRender="False" ChooseMode="False" DefaultMode="RICH" HtmlEncode="False" Width="100%" Height="460px" Mode="RICH" />
												</div>
											</div>
											<div role="tabpanel" class="tab-pane" id="BuyingGuideTabPanel">
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="BuyingGuideNameLabelControl" runat="server" />
													<asp:TextBox ID="BuyingGuideNameTextBox" runat="server"></asp:TextBox>
												</div>
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="BuyingGuideLabelControl" runat="server"/>
													<dnn1:TextEditor ID="BuyingGuideTextEditor" runat="server" ChooseRender="False" ChooseMode="False" DefaultMode="RICH" HtmlEncode="False" Width="100%" Height="460px" Mode="RICH" />
												</div>
											</div>
										</div>
									</div>
									<h2 id="GallerySectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("GalleryHeader") %></a></h2>
									<fieldset>
										<div ID="GalleryUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
										<uc1:GalleryControl ID="GalleryControl1" runat="server"></uc1:GalleryControl>
									</fieldset>
									<asp:Panel ID="ProductVariantPanel" runat="server">
										<h2 id="PriceSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("PriceHeader") %></a></h2>
										<fieldset>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="SalesTypeLabelControl" runat="server" />
												<asp:DropDownList ID="SalesTypeDropDownList" runat="server">
													<asp:ListItem Value="1" resourcekey="DirectSalesTypeLabel" ></asp:ListItem>
													<asp:ListItem Value="2" resourcekey="QuoteSalesTypeLabel" ></asp:ListItem>
												</asp:DropDownList>
											</div>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="BasePriceLabelControl" runat="server" CssClass="dnnFormRequired"></dnn1:LabelControl>
												<asp:RequiredFieldValidator ID="BasePriceRequiredFieldValidator" runat="server" ControlToValidate="BasePriceTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
												<asp:RangeValidator ID="BasePriceRangeValidator" runat="server" ControlToValidate="BasePriceTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
												<asp:CompareValidator ID="BasePriceCompareValidator" runat="server" ControlToValidate="BasePriceTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
												<asp:TextBox ID="BasePriceTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
											</div>
											<uc1:ProductVariantModifierRuleControl ID="ModifierRuleControl" runat="server" Width="100%" />
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="PriceTextLabelControl" runat="server"></dnn1:LabelControl>
												<asp:TextBox ID="PriceTextTextBox" runat="server" />
											</div>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="MSRPLabelControl" runat="server" />
												<asp:RangeValidator ID="MSRPRangeValidator" runat="server" ControlToValidate="MSRPTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
												<asp:CompareValidator ID="MSRPCompareValidator" runat="server" ControlToValidate="MSRPTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
												<asp:TextBox ID="MSRPTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
											</div>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="ProductCostLabelControl" runat="server" />
												<asp:RangeValidator ID="ProductCostRangeValidator" runat="server" ControlToValidate="ProductCostTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
												<asp:CompareValidator ID="ProductCostCompareValidator" runat="server" ControlToValidate="ProductCostTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
												<asp:TextBox ID="ProductCostTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
											</div>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="TaxClassLabelControl" runat="server" />
												<uc1:TaxClassDropDownListControl ID="TaxClassDropDownList" runat="server"></uc1:TaxClassDropDownListControl>
											</div>
										</fieldset>
										<h2 id="PromotionSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("PromotionHeader") %></a></h2>
										<fieldset>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="PromotionStartDateLabelControl" runat="server" />
												<asp:TextBox ID="PromotionStartDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm"/>
											</div>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="PromotionStopDateLabelControl" runat="server" />
												<asp:TextBox ID="PromotionStopDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm"/>
											</div>
											<uc1:ProductVariantSalesPromotionRuleControl ID="PromotionRuleControl" runat="server" Width="100%" />
										</fieldset>
										<h2 id="InventorySectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("InventoryHeader") %></a></h2>
										<fieldset>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="ConditionTypeLabelControl" runat="server"></dnn1:LabelControl>
												<asp:DropDownList ID="ConditionTypeDropDownList" runat="server" >
													<asp:ListItem Value="1" resourcekey="NewConditionTypeLabel" ></asp:ListItem>
													<asp:ListItem Value="2" resourcekey="RefurbishedConditionTypeLabel" ></asp:ListItem>
													<asp:ListItem Value="3" resourcekey="UsedConditionTypeLabel" ></asp:ListItem>
												</asp:DropDownList>
											</div>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="SKULabelControl" runat="server"></dnn1:LabelControl>
												<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="SKUTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
												<asp:TextBox ID="SKUTextBox" runat="server" MaxLength="100"></asp:TextBox>
											</div>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="UniversalProductCodeLabelControl" runat="server" />
												<asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="UniversalProductCodeTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
												<asp:TextBox ID="UniversalProductCodeTextBox" runat="server" MaxLength="100"></asp:TextBox>
											</div>
											<asp:Panel ID="ManufacturerPanel" runat="server" CssClass="dnnFormItem">
												<dnn1:LabelControl ID="ManufacturerLabelControl" runat="server"></dnn1:LabelControl>
												<asp:DropDownList ID="ManufacturerDropDownList" runat="server" OnSelectedIndexChanged="ManufacturerDropDownList_SelectedIndexChanged" AutoPostBack="True">
												</asp:DropDownList>
											</asp:Panel>
											<asp:Panel ID="ManufacturerSKUPanel" runat="server" CssClass="dnnFormItem">
												<dnn1:LabelControl ID="ManufacturerSKULabelControl" runat="server"></dnn1:LabelControl>
												<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ManufacturerSKUTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
												<asp:TextBox ID="ManufacturerSKUTextBox" runat="server" MaxLength="100"></asp:TextBox>
											</asp:Panel>
											<asp:Panel ID="DistributorPanel" runat="server" CssClass="dnnFormItem">
												<dnn1:LabelControl ID="DistributorLabelControl" runat="server"></dnn1:LabelControl>
												<asp:DropDownList ID="DistributorDropDownList" runat="server" OnSelectedIndexChanged="DistributorDropDownList_SelectedIndexChanged" AutoPostBack="true">
												</asp:DropDownList>
											</asp:Panel>
											<asp:Panel ID="DistributorSKUPanel" runat="server" CssClass="dnnFormItem">
												<dnn1:LabelControl ID="DistributorSKULabelControl" runat="server"></dnn1:LabelControl>
												<asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="DistributorSKUTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
												<asp:TextBox ID="DistributorSKUTextBox" runat="server" MaxLength="100"></asp:TextBox>
											</asp:Panel>
											<asp:Panel ID="WarehousePanel" runat="server" CssClass="dnnFormItem">
												<dnn1:LabelControl ID="WarehouseLabelControl" runat="server" />
												<asp:DropDownList ID="WarehouseDropDownList" runat="server">
												</asp:DropDownList>
											</asp:Panel>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="InventoryLabelControl" runat="server"></dnn1:LabelControl>
												<asp:CompareValidator ID="InventoryCompareValidator" runat="server" ControlToValidate="InventoryTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
												<asp:TextBox ID="InventoryTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
											</div>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="MinInventoryLabelControl" runat="server"></dnn1:LabelControl>
												<asp:CompareValidator ID="MinInventoryCompareValidator" runat="server" ControlToValidate="MinInventoryTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
												<asp:TextBox ID="MinInventoryTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
											</div>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="MaxInventoryLabelControl" runat="server"></dnn1:LabelControl>
												<asp:RangeValidator ID="MaxInventoryRangeValidator" runat="server" ControlToValidate="MaxInventoryTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
												<asp:CompareValidator ID="MaxInventoryCompareValidator" runat="server" ControlToValidate="MaxInventoryTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
												<asp:TextBox ID="MaxInventoryTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
											</div>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="InventoryEmptyBehaviorLabelControl" runat="server"></dnn1:LabelControl>
												<asp:DropDownList ID="InventoryEmptyBehaviorDropDownList" runat="server">
													<asp:ListItem resourcekey="DisallowOrderInventoryEmptyBehaviorLabel" Value="1" />
													<asp:ListItem resourcekey="DisableProductInventoryEmptyBehaviorLabel" Value="2" />
													<asp:ListItem resourcekey="AllowBackorderInventoryEmptyBehaviorLabel" Value="3" />
												</asp:DropDownList>
											</div>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="MinOrderQuantityLabelControl" runat="server"></dnn1:LabelControl>
												<asp:RangeValidator ID="MinOrderQuantityRangeValidator" runat="server" ControlToValidate="MinOrderQuantityTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
												<asp:CompareValidator ID="MinOrderQuantityCompareValidator" runat="server" ControlToValidate="MinOrderQuantityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
												<asp:TextBox ID="MinOrderQuantityTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
											</div>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="MaxOrderQuantityLabelControl" runat="server"></dnn1:LabelControl>
												<asp:RangeValidator ID="MaxOrderQuantityRangeValidator" runat="server" ControlToValidate="MaxOrderQuantityTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
												<asp:CompareValidator ID="MaxOrderQuantityCompareValidator" runat="server" ControlToValidate="MaxOrderQuantityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
												<asp:TextBox ID="MaxOrderQuantityTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
											</div>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="AllowableOrderQuantityLabelControl" runat="server"></dnn1:LabelControl>
												<asp:RegularExpressionValidator ID="AllowableOrderQuantityRegularExpressionValidator" runat="server" ControlToValidate="AllowableOrderQuantityTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^(?!([ \d]*-){2})\d+(?: *[-|] *\d+)*$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
												<asp:TextBox ID="AllowableOrderQuantityTextBox" runat="server">
												</asp:TextBox>
											</div>
										</fieldset>
										<asp:Panel ID="ShippingDetailsViewPanel" runat="server">
											<h2 id="ShippingSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("ShippingHeader") %></a></h2>
											<fieldset>
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="RequireShippingLabelControl" runat="server"></dnn1:LabelControl>
													<asp:CheckBox ID="RequireShippingCheckBox" runat="server"></asp:CheckBox>
												</div>
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="WeightLabelControl" runat="server" CssClass="dnnFormRequired"></dnn1:LabelControl>
													<div class="rvdFormSubContainer">
														<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="WeightTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
														<asp:RangeValidator ID="WeightRangeValidator" runat="server" ControlToValidate="WeightTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
														<asp:CompareValidator ID="WeightCompareValidator" runat="server" ControlToValidate="WeightTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
														<asp:TextBox ID="WeightTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
														<span><%= Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsMass).Symbols[0] %></span>
													</div>
												</div>
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="WidthLabelControl" runat="server" CssClass="dnnFormRequired" />
													<div class="rvdFormSubContainer">
														<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="WidthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
														<asp:RangeValidator ID="WidthRangeValidator" runat="server" ControlToValidate="WidthTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
														<asp:CompareValidator ID="WidthCompareValidator" runat="server" ControlToValidate="WidthTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
														<asp:TextBox ID="WidthTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
														<span><%= Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsLength).Symbols[0] %></span>
													</div>
												</div>
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="HeightLabelControl" runat="server" CssClass="dnnFormRequired" />
													<div class="rvdFormSubContainer">
														<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="HeightTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
														<asp:RangeValidator ID="HeightRangeValidator" runat="server" ControlToValidate="HeightTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
														<asp:CompareValidator ID="HeightCompareValidator" runat="server" ControlToValidate="HeightTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
														<asp:TextBox ID="HeightTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
														<span><%= Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsLength).Symbols[0] %></span>
													</div>
												</div>
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="DepthLabelControl" runat="server" CssClass="dnnFormRequired" />
													<div class="rvdFormSubContainer">
														<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DepthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
														<asp:RangeValidator ID="DepthRangeValidator" runat="server" ControlToValidate="DepthTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
														<asp:CompareValidator ID="DepthCompareValidator" runat="server" ControlToValidate="DepthTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
														<asp:TextBox ID="DepthTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
														<span><%= Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsLength).Symbols[0] %></span>
													</div>
												</div>
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="PackageTypeLabelControl" runat="server" />
													<asp:DropDownList ID="PackageTypeDropDownList" runat="server">
														<asp:ListItem Value="3000" resourcekey="BagPackageTypeLabel"></asp:ListItem>
														<asp:ListItem Value="2000" resourcekey="BoxPackageTypeLabel"></asp:ListItem>
														<asp:ListItem Value="1000" resourcekey="EnvelopePackageTypeLabel"></asp:ListItem>
														<asp:ListItem Value="4000" resourcekey="TubePackageTypeLabel"></asp:ListItem>
														<asp:ListItem Value="1" resourcekey="UnspecifiedPackageTypeLabel"></asp:ListItem>
													</asp:DropDownList>
												</div>
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="ShippingPriceLabelControl" runat="server"></dnn1:LabelControl>
													<asp:RequiredFieldValidator ID="ShippingPriceRequiredFieldValidator" runat="server" ControlToValidate="ShippingPriceTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
													<asp:RangeValidator ID="ShippingPriceRangeValidator" runat="server" ControlToValidate="ShippingPriceTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
													<asp:CompareValidator ID="ShippingPriceCompareValidator" runat="server" ControlToValidate="ShippingPriceTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
													<asp:TextBox ID="ShippingPriceTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
												</div>
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="ShippingCodeLabelControl" runat="server" />
													<asp:TextBox ID="ShippingCodeTextBox" runat="server" MaxLength="50"></asp:TextBox>
												</div>
											</fieldset>
										</asp:Panel>
										<asp:Panel ID="HandlingDetailsViewPanel" runat="server" >
											<h2 id="HandlingSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("HandlingHeader") %></a></h2>
											<fieldset>
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="RequireHandlingLabelControl" runat="server"></dnn1:LabelControl>
													<asp:CheckBox ID="RequireHandlingCheckBox" runat="server"></asp:CheckBox>
												</div>
												<div class="dnnFormItem">
													<dnn1:LabelControl ID="HandlingPriceLabelControl" runat="server" CssClass="dnnFormRequired"></dnn1:LabelControl>
													<asp:RequiredFieldValidator ID="HandlingPriceRequiredFieldValidator" runat="server" ControlToValidate="HandlingPriceTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
													<asp:RangeValidator ID="HandlingPriceRangeValidator" runat="server" ControlToValidate="HandlingPriceTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
													<asp:CompareValidator ID="HandlingPriceCompareValidator" runat="server" ControlToValidate="HandlingPriceTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
													<asp:TextBox ID="HandlingPriceTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
												</div>
											</fieldset>
										</asp:Panel>
									</asp:Panel>
									<h2 id="ProductVariantGroupSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("VariantGroupsHeader") %></a></h2>
									<fieldset>
										<div ID="ProductVariantGroupUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
										<uc1:ProductVariantGroupControl ID="ProductVariantGroupControl1" runat="server" />
									</fieldset>
									<h2 id="ProductVariantsSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("VariantsHeader") %></a></h2>
									<fieldset>
										<div ID="ProductVariantUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
										<uc1:ProductVariantControl ID="ProductVariantControl" runat="server"></uc1:ProductVariantControl>
									</fieldset>
									<h2 id="CategorySectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("CategoriesHeader") %></a></h2>
									<fieldset>
										<div class="row rvdsf-actionbar-container">
											<div class="col-sm-6">
												<asp:HyperLink ID="ExportProductCategoryViewHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportViewLink") %></asp:HyperLink>
												<asp:HyperLink ID="ExportProductCategoryAllHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportAllLink") %></asp:HyperLink>
												<asp:HyperLink ID="ImportProductCategoryHyperLink" runat="server" CssClass="btn btn-link rvdImportAction" ><em class="glyphicon glyphicon-import fa fas fa-download"></em> <%= LocalizeString("ImportLink") %></asp:HyperLink>
											</div>
											<div class="col-sm-6 text-sm-right">

											</div>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="FeaturedLabelControl" runat="server" />
											<asp:CheckBox ID="FeaturedCheckBox" runat="server" />
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="CategoriesLabelControl" runat="server"></dnn1:LabelControl>
											<div class="rvdFormSubContainer">
												<asp:HyperLink ID="EditCategoryHyperLink" runat="server" CssClass="btn btn-link" ><em class="glyphicon glyphicon-plus fa fas fa-plus"></em> <%= LocalizeString("AddNewCategoryLink") %></asp:HyperLink>
												<asp:LinkButton ID="GenerateCategoryLinkButton" runat="server" CssClass="btn btn-link" OnClick="GenerateCategoryLinkButton_Click" CausesValidation="False"><em class="glyphicon glyphicon-education fa fas fa-graduation-cap"></em> <%= LocalizeString("GenerateCategoryLabel") %></asp:LinkButton>
												<uc1:CategoryCheckBoxListControl ID="CategoryCheckBoxListControl1" runat="server" />
											</div>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="DefaultCategoryLabelControl" runat="server"></dnn1:LabelControl>
											<uc1:CategoryDropDownListControl ID="DefaultCategoryDropDownListControl" runat="server" ShowEmptyRoot="true" EmptyText="None"/>
										</div>
									</fieldset>
									<h2 id="SEOSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("SEOHeader") %></a></h2>
									<fieldset>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="UrlNameLabelControl" runat="server" />
											<asp:TextBox ID="UrlNameTextBox" runat="server" MaxLength="400"></asp:TextBox>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="PageTitleLabelControl" runat="server" />
											<asp:TextBox ID="PageTitleTextBox" runat="server" MaxLength="400"></asp:TextBox>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="MetaKeywordsLabelControl" runat="server" />
											<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="MetaKeywordsTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\s\S]{0,400}$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
											<asp:TextBox ID="MetaKeywordsTextBox" runat="server" MaxLength="400" Rows="3" TextMode="MultiLine"></asp:TextBox>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="MetaDescriptionLabelControl" runat="server" />
											<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="MetaDescriptionTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\s\S]{0,400}$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
											<asp:TextBox ID="MetaDescriptionTextBox" runat="server" MaxLength="400" Rows="3" TextMode="MultiLine"></asp:TextBox>
										</div>
									</fieldset>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="DisplayDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="PublishedLabelControl" runat="server"></dnn1:LabelControl>
									<asp:CheckBox ID="PublishedCheckBox" runat="server" Checked="True" />
								</div>
								<div class="dnnFormItem dnnClear">
									<dnn1:LabelControl ID="BuyMethodLabelControl" runat="server" />
									<div class="rvdFormCheckBoxes">
										<asp:CheckBox ID="AllowInternetOrderCheckBox" runat="server" resourcekey="AllowInternetOrderCheckBox" />
										<asp:CheckBox ID="AllowPhoneOrderCheckBox" runat="server" resourcekey="AllowPhoneOrderCheckBox" />
									</div>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="DisplayTemplateLabelControl" runat="server"></dnn1:LabelControl>
									<uc1:DisplayTemplateDropDownListControl ID="DisplayTemplateDropDownList" runat="server" />
									<asp:LinkButton ID="DisplayTemplateLinkButton" runat="server" OnClick="DisplayTemplateLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ProductDetailUrlLabelControl" runat="server" />
									<dnn1:UrlControl ID="ProductDetailUrlUrlControl" runat="server" ShowDatabase="false" ShowFiles="false" ShowImages="False" ShowLog="false" ShowNewWindow="False" ShowNone="true" ShowSecure="true" ShowTabs="True" ShowTrack="false" ShowUpLoad="false" ShowUrls="false" ShowUsers="false"></dnn1:UrlControl>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RedirectUrlLabelControl" runat="server" />
									<dnn1:UrlControl ID="RedirectUrlUrlControl" runat="server" ShowDatabase="false" ShowFiles="false" ShowImages="False" ShowLog="false" ShowNewWindow="False" ShowNone="true" ShowSecure="true" ShowTabs="True" ShowTrack="false" ShowUpLoad="false" ShowUrls="true" ShowUsers="false"></dnn1:UrlControl>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="StartDateLabelControl" runat="server" />
									<asp:TextBox ID="StartDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm"/>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="StopDateLabelControl" runat="server" />
									<asp:TextBox ID="StopDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm"/>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="DisplayOrderLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DisplayOrderTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:RangeValidator ID="DisplayOrderRangeValidator" runat="server" ControlToValidate="DisplayOrderTextBox" MinimumValue="-2147483648" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:TextBox ID="DisplayOrderTextBox" runat="server" value="1000" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
								</div>
								<div id="AllowProductComparisonPanel" runat="server" class="dnnFormItem">
									<dnn1:LabelControl ID="AllowProductComparisonLabelControl" runat="server" />
									<asp:CheckBox ID="AllowProductComparisonCheckBox" runat="server" Checked="True"></asp:CheckBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShowInventoryLabelControl" runat="server" />
									<asp:CheckBox ID="ShowInventoryCheckBox" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShowSKULabelControl" runat="server" />
									<asp:CheckBox ID="ShowSKUCheckBox" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShowPriceLabelControl" runat="server" />
									<asp:CheckBox ID="ShowPriceCheckBox" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShowQuantityLabelControl" runat="server" />
									<asp:CheckBox ID="ShowQuantityCheckBox" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShowMSRPLabelControl" runat="server" />
									<asp:CheckBox ID="ShowMSRPCheckBox" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShowSavingsLabelControl" runat="server" />
									<asp:CheckBox ID="ShowSavingsCheckBox" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShowRewardPointsLabelControl" runat="server" />
									<asp:CheckBox ID="ShowRewardPointsCheckBox" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShowAddToCartLabelControl" runat="server" />
									<asp:CheckBox ID="ShowAddToCartCheckBox" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShowBuyNowLabelControl" runat="server" />
									<asp:CheckBox ID="ShowBuyNowCheckBox" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShowSeeDetailsLabelControl" runat="server" />
									<asp:CheckBox ID="ShowSeeDetailsCheckBox" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShowAddToWishListLabelControl" runat="server" />
									<asp:CheckBox ID="ShowAddToWishListCheckBox" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShowUpdateLabelControl" runat="server" />
									<asp:CheckBox ID="ShowUpdateCheckBox" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShowSocialShareLabelControl" runat="server" />
									<asp:CheckBox ID="ShowSocialShareCheckBox" runat="server" />
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="AvailabilityDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<uc1:ProductAvailabilityRuleControl ID="AvailabilityRuleControl" runat="server" Width="100%" />
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="AttributeDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div ID="ProductAttributeUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
								<uc1:ProductAttributeControl ID="ProductAttributeControl1" runat="server" />
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="CustomFieldDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<uc1:ProductDynamicFormCodeControl ID="DynamicFormCodeControl" runat="server" Width="100%" />
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="RecurringDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RecurringLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="RecurringIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:RangeValidator ID="RangeValidator6" runat="server" ControlToValidate="RecurringIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="365" MinimumValue="0" Type="Double" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:TextBox ID="RecurringIntervalTextBox" runat="server" CssClass="dnnFormRequired" TextMode="Number">0</asp:TextBox>
									<asp:DropDownList ID="RecurringIntervalTypeDropDownList" runat="server" CssClass="rvdUnitInput">
										<asp:ListItem Value="1" resourcekey="DayIntervalTypeLabel" ></asp:ListItem>
										<asp:ListItem Value="2" resourcekey="WeekIntervalTypeLabel" ></asp:ListItem>
										<asp:ListItem Value="3" resourcekey="MonthIntervalTypeLabel" ></asp:ListItem>
										<asp:ListItem Value="4" resourcekey="YearIntervalTypeLabel" ></asp:ListItem>
									</asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="StartRecurringDateTypeLabelControl" runat="server" EnableViewState="False" />
									<asp:RadioButtonList ID="StartRecurringDateTypeRadioButtonList" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="StartRecurringDateTypeRadioButtonList_SelectedIndexChanged" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
										<asp:ListItem resourcekey="FixedDateRecurringDateTypeLabel" Value="Fixed date" Selected="True"></asp:ListItem>
										<asp:ListItem resourcekey="IntervalRecurringDateTypeLabel" Value="Interval"></asp:ListItem>
									</asp:RadioButtonList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="StartRecurringDateLabelControl" runat="server" EnableViewState="False" Text="" />
									<asp:MultiView ID="StartRecurringDateTypeMultiView" runat="server" ActiveViewIndex="0">
										<asp:View ID="FixedStartRecurringDateView" runat="server">
											<asp:TextBox ID="StartRecurringDateTextBox" runat="server" placeholder="YYYY-MM-DD" CssClass="rvd-form-datetime" data-role="datepicker" data-format="yyyy-MM-dd"/>
										</asp:View>
										<asp:View ID="StartRecurringIntervalView" runat="server">
											<asp:RequiredFieldValidator ID="StartRecurringRequiredFieldValidator" runat="server" ControlToValidate="StartRecurringIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
											<asp:RangeValidator ID="StartRecurringIntervalRangeValidator" runat="server" ControlToValidate="StartRecurringIntervalTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
											<asp:CompareValidator ID="StartRecurringIntervalCompareValidator" runat="server" ControlToValidate="StartRecurringIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
											<asp:TextBox ID="StartRecurringIntervalTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
											<asp:DropDownList ID="StartRecurringIntervalTypeDropDownList" runat="server" CssClass="rvdUnitInput">
												<asp:ListItem Value="1" resourcekey="DayIntervalTypeLabel" ></asp:ListItem>
												<asp:ListItem Value="2" resourcekey="WeekIntervalTypeLabel" ></asp:ListItem>
												<asp:ListItem Value="3" resourcekey="MonthIntervalTypeLabel" ></asp:ListItem>
												<asp:ListItem Value="4" resourcekey="YearIntervalTypeLabel" ></asp:ListItem>
											</asp:DropDownList>
										</asp:View>
									</asp:MultiView>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RecurringMinRepeatLabelControl" runat="server" />
									<asp:RangeValidator ID="RecurringMinRepeatRangeValidator" runat="server" ControlToValidate="RecurringMinRepeatTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="RecurringMinRepeatCompareValidator" runat="server" ControlToValidate="RecurringMinRepeatTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="RecurringMinRepeatTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RecurringMaxRepeatLabelControl" runat="server" />
									<asp:RangeValidator ID="RecurringMaxRepeatRangeValidator" runat="server" ControlToValidate="RecurringMaxRepeatTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="RecurringMaxRepeatCompareValidator" runat="server" ControlToValidate="RecurringMaxRepeatTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="RecurringMaxRepeatTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="AllowRecurringGroupOrdersLabelControl" runat="server" />
									<asp:CheckBox ID="AllowRecurringGroupOrdersCheckBox" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="PreorderLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="PreorderIntervalRequiredFieldValidator" runat="server" ControlToValidate="PreorderIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:RangeValidator ID="PreorderIntervalRangeValidator" runat="server" ControlToValidate="PreorderIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="365" MinimumValue="0" Type="Integer" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:TextBox ID="PreorderIntervalTextBox" runat="server" CssClass="dnnFormRequired" TextMode="Number">0</asp:TextBox>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="BookingDetailsViewPanel" runat="server" CssClass="dnnClear">
							<div ID="BookingUnavailableLabel" runat="server" class="alert alert-info" ><%= Localization.GetString(Global.LocalizedStrings.Message_LicenseFeatureUnavailable, Global.FilePaths.LocalSharedResourceFile) %></div>
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="InventoryUnitTypeLabelControl" runat="server"></dnn1:LabelControl>
									<asp:DropDownList ID="InventoryUnitTypeDropDownList" runat="server">
										<asp:ListItem resourcekey="ConstantInventoryUnitTypeLabel" Value="1" />
										<asp:ListItem resourcekey="YearInventoryUnitTypeLabel" Value="2" />
										<asp:ListItem resourcekey="MonthInventoryUnitTypeLabel" Value="3" />
										<asp:ListItem resourcekey="WeekInventoryUnitTypeLabel" Value="4" />
										<asp:ListItem resourcekey="DayInventoryUnitTypeLabel" Value="5" />
										<asp:ListItem resourcekey="HourInventoryUnitTypeLabel" Value="6" />
									</asp:DropDownList>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="MinOrderUnitLabelControl" runat="server" ></dnn1:LabelControl>
									<asp:RangeValidator ID="MinOrderUnitRangeValidator" runat="server" ControlToValidate="MinOrderUnitTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="MinOrderUnitCompareValidator" runat="server" ControlToValidate="MinOrderUnitTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="MinOrderUnitTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="MaxOrderUnitLabelControl" runat="server" ></dnn1:LabelControl>
									<asp:RangeValidator ID="MaxOrderUnitRangeValidator" runat="server" ControlToValidate="MaxOrderUnitTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="MaxOrderUnitCompareValidator" runat="server" ControlToValidate="MaxOrderUnitTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="MaxOrderUnitTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
								</div>							
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="MinBookingDateLabelControl" runat="server" ></dnn1:LabelControl>
									<asp:TextBox ID="MinBookingDateTextBox" runat="server" placeholder="YYYY-MM-DD" CssClass="rvd-form-datetime" data-role="datepicker" data-format="yyyy-MM-dd"/>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="MaxBookingDateLabelControl" runat="server" ></dnn1:LabelControl>
									<asp:TextBox ID="MaxBookingDateTextBox" runat="server" placeholder="YYYY-MM-DD" CssClass="rvd-form-datetime" data-role="datepicker" data-format="yyyy-MM-dd"/>
								</div>
								<uc1:ProductVariantBookingRuleControl ID="ProductVariantBookingRuleControl" runat="server" />
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="MinBookingTimeLabelControl" runat="server" ></dnn1:LabelControl>
									<asp:TextBox ID="MinBookingTimeTextBox" runat="server" placeholder="HH:00" CssClass="rvd-form-datetime" data-role="timepicker" data-format="HH:00" data-interval="60"/>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="MaxBookingTimeLabelControl" runat="server" ></dnn1:LabelControl>
									<asp:TextBox ID="MaxBookingTimeTextBox" runat="server" placeholder="HH:00" CssClass="rvd-form-datetime" data-role="timepicker" data-format="HH:00" data-interval="60"/>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="ComponentDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>								
								<div id="ProductComponentUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
								<uc1:ProductComponentControl ID="ProductComponentControl1" runat="server"></uc1:ProductComponentControl>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="RequiredDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div id="RequiredProductUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
								<uc1:RequiredProductControl ID="RequiredProductControl1" runat="server"></uc1:RequiredProductControl>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="RelatedDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div ID="RelatedProductUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
								<uc1:RelatedProductControl ID="RelatedProductControl1" runat="server" />
							</fieldset>
						</asp:Panel>
                        <asp:Panel ID="SimilarDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div ID="SimilarProductUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
								<uc1:SimilarProductControl ID="SimilarProductControl1" runat="server" />
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="CrosssellDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div ID="CrosssellProductUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
								<uc1:CrosssellProductControl ID="CrosssellProductControl1" runat="server"></uc1:CrosssellProductControl>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="ProductReviewDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="AllowProductReviewLabelControl" runat="server" />
									<asp:CheckBox ID="AllowProductReviewCheckBox" runat="server" />
								</div>
								<uc1:ProductReviewControl ID="ProductReviewControl1" runat="server" />
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="ActionDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<uc1:ProductVariantPlaceOrderActionRuleControl ID="PlaceOrderActionRuleControl" runat="server" Width="100%" />
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="RewardsPointDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="AllowRewardsPointLabelControl" runat="server" />
									<asp:CheckBox ID="AllowRewardsPointCheckBox" runat="server" Checked="True"></asp:CheckBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="RewardPointsLabelControl" runat="server"></dnn1:LabelControl>
									<asp:RangeValidator ID="RewardPointsRangeValidator" runat="server" ControlToValidate="RewardPointsTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="RewardPointsCompareValidator" runat="server" ControlToValidate="RewardPointsTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="RewardPointsTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="ResourceDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="DownloadFileLabelControl" runat="server"></dnn1:LabelControl>
									<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
										<ContentTemplate>
											<dnn1:UrlControl ID="DownloadFileUrlControl" runat="server" ShowDatabase="true" ShowFiles="true" ShowImages="False" ShowLog="false" ShowNewWindow="False" ShowNone="true" ShowSecure="true" ShowTabs="True" ShowTrack="false" ShowUpLoad="true" ShowUrls="True" ShowUsers="false"></dnn1:UrlControl>
										</ContentTemplate>
									</asp:UpdatePanel>
								</div>
								<asp:Panel ID="FundPanel" runat="server" CssClass="dnnFormItem">
									<dnn1:LabelControl ID="FundLabelControl" runat="server"></dnn1:LabelControl>
									<asp:CheckBox ID="FundCheckBox" runat="server" />
								</asp:Panel>
								<asp:Panel ID="RightDefinitionPanel" runat="server" CssClass="dnnFormItem">
									<dnn1:LabelControl ID="RightDefinitionLabelControl" runat="server"></dnn1:LabelControl>
									<asp:DropDownList ID="RightDefinitionDropDownList" runat="server">
									</asp:DropDownList>
								</asp:Panel>
								<asp:Panel ID="VoucherDefinitionPanel" runat="server" CssClass="dnnFormItem">
									<dnn1:LabelControl ID="VoucherDefinitionLabelControl" runat="server"></dnn1:LabelControl>
									<asp:DropDownList ID="VoucherDefinitionDropDownList" runat="server">
									</asp:DropDownList>
								</asp:Panel>
							</fieldset>
						</asp:Panel>
                        <asp:Panel ID="SalesReturnDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div class="dnnFormItem">
									<dnn1:LabelControl ID="RefundIntervalLabelControl" runat="server"></dnn1:LabelControl>
                                    <div>
										<asp:RangeValidator ID="RefundIntervalRangeValidator" runat="server" ControlToValidate="RefundIntervalTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
										<asp:CompareValidator ID="RefundIntervalCompareValidator" runat="server" ControlToValidate="RefundIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
										<asp:TextBox ID="RefundIntervalTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
									    <asp:DropDownList ID="RefundIntervalTypeDropDownList" runat="server" CssClass="rvdUnitInput">
										    <asp:ListItem Value="1" resourcekey="DayIntervalTypeLabel" ></asp:ListItem>
										    <asp:ListItem Value="2" resourcekey="WeekIntervalTypeLabel" ></asp:ListItem>
										    <asp:ListItem Value="3" resourcekey="MonthIntervalTypeLabel" ></asp:ListItem>
										    <asp:ListItem Value="4" resourcekey="YearIntervalTypeLabel" ></asp:ListItem>
									    </asp:DropDownList>
                                    </div>
								</div>
                                <div class="dnnFormItem">
									<dnn1:LabelControl ID="CreditIntervalLabelControl" runat="server"></dnn1:LabelControl>
                                    <div>
										<asp:RangeValidator ID="CreditIntervalRangeValidator" runat="server" ControlToValidate="CreditIntervalTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
										<asp:CompareValidator ID="CreditIntervalCompareValidator" runat="server" ControlToValidate="CreditIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
										<asp:TextBox ID="CreditIntervalTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
									    <asp:DropDownList ID="CreditIntervalTypeDropDownList" runat="server" CssClass="rvdUnitInput">
										    <asp:ListItem Value="1" resourcekey="DayIntervalTypeLabel" ></asp:ListItem>
										    <asp:ListItem Value="2" resourcekey="WeekIntervalTypeLabel" ></asp:ListItem>
										    <asp:ListItem Value="3" resourcekey="MonthIntervalTypeLabel" ></asp:ListItem>
										    <asp:ListItem Value="4" resourcekey="YearIntervalTypeLabel" ></asp:ListItem>
									    </asp:DropDownList>
                                    </div>
								</div>
                                <div class="dnnFormItem">
									<dnn1:LabelControl ID="ExchangeIntervalLabelControl" runat="server"></dnn1:LabelControl>
                                    <div>
										<asp:RangeValidator ID="ExchangeIntervalRangeValidator" runat="server" ControlToValidate="ExchangeIntervalTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
										<asp:CompareValidator ID="ExchangeIntervalCompareValidator" runat="server" ControlToValidate="ExchangeIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
										<asp:TextBox ID="ExchangeIntervalTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
									    <asp:DropDownList ID="ExchangeIntervalTypeDropDownList" runat="server" CssClass="rvdUnitInput">
										    <asp:ListItem Value="1" resourcekey="DayIntervalTypeLabel" ></asp:ListItem>
										    <asp:ListItem Value="2" resourcekey="WeekIntervalTypeLabel" ></asp:ListItem>
										    <asp:ListItem Value="3" resourcekey="MonthIntervalTypeLabel" ></asp:ListItem>
										    <asp:ListItem Value="4" resourcekey="YearIntervalTypeLabel" ></asp:ListItem>
									    </asp:DropDownList>
                                    </div>
								</div>
                                <div class="dnnFormItem">
									<dnn1:LabelControl ID="RepairIntervalLabelControl" runat="server"></dnn1:LabelControl>
                                    <div>
										<asp:RangeValidator ID="RepairIntervalRangeValidator" runat="server" ControlToValidate="RepairIntervalTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
										<asp:CompareValidator ID="RepairIntervalCompareValidator" runat="server" ControlToValidate="RepairIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
										<asp:TextBox ID="RepairIntervalTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
									    <asp:DropDownList ID="RepairIntervalTypeDropDownList" runat="server" CssClass="rvdUnitInput">
										    <asp:ListItem Value="1" resourcekey="DayIntervalTypeLabel" ></asp:ListItem>
										    <asp:ListItem Value="2" resourcekey="WeekIntervalTypeLabel" ></asp:ListItem>
										    <asp:ListItem Value="3" resourcekey="MonthIntervalTypeLabel" ></asp:ListItem>
										    <asp:ListItem Value="4" resourcekey="YearIntervalTypeLabel" ></asp:ListItem>
									    </asp:DropDownList>
                                    </div>
								</div>
                                <div class="dnnFormItem">
									<dnn1:LabelControl ID="AllowPartialReturnLabelControl" runat="server"></dnn1:LabelControl>
                                    <asp:CheckBox ID="AllowPartialReturnCheckBox" runat="server" Checked="false" />
								</div>
                                <div class="dnnFormItem">
									<dnn1:LabelControl ID="HasSerialNumberLabelControl" runat="server"></dnn1:LabelControl>
                                    <asp:CheckBox ID="HasSerialNumberCheckBox" runat="server" Checked="false" />
								</div>
                            </fieldset>
                        </asp:Panel>
						<asp:Panel ID="ProductChannelDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="AllowSalesChannelLabelControl" runat="server" />
									<asp:CheckBox ID="AllowSalesChannelCheckBox" runat="server" Checked="True"></asp:CheckBox>
								</div>
								<div ID="ProductChannelControlUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
								<uc1:ProductChannelControl ID="ProductChannelControl1" runat="server" />
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="ExtensionDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ExternalIDLabelControl" runat="server" />
									<asp:TextBox ID="ExternalIDTextBox" runat="server" MaxLength="100" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ExtensionLabelControl" runat="server" />
									<uc1:XmlEditorControl ID="ExtensionXmlEditor" runat="server" Width="100%" ModuleControl="ProductExtension" />
								</div>
							</fieldset>
						</asp:Panel>
					</div>
					<div class="row rvdsf-footerbar-container">
						<div class="col-sm-6">
							<asp:LinkButton  ID="DeleteLinkButton" resourcekey="DeleteLinkButton" runat="server"  CssClass="btn btn-default btn-light" CausesValidation="false" OnClick="DeleteLinkButton_Click" OnClientClick="return Revindex.Web.ConfirmDelete()"></asp:LinkButton>
						</div>
						<div class="col-sm-6 text-sm-right">
							<uc1:BackControl  ID="BackControl" resourcekey="BackControl" runat="server"  />
							<asp:LinkButton  ID="SaveLinkButton" resourcekey="SaveLinkButton" runat="server"  OnClick="SaveLinkButton_Click" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
							<asp:LinkButton  ID="SaveAndBackLinkButton" resourcekey="SaveAndBackLinkButton" runat="server"  OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
						</div>
					</div>
				</asp:View>
			</asp:MultiView>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>