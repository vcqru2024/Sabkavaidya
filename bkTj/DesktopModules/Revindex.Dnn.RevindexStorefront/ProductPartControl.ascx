<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductPartControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductPartControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="ProductPartModifierRuleControl.ascx" TagName="ProductPartModifierRuleControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>

<script type="text/javascript">
	Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))
    })
</script>
<div>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
			<asp:MultiView ID="ContentMultiView" runat="server">
				<asp:View ID="ListView" runat="server">
					<div class="rvdsfListContainer">
						<div class="row rvdsf-actionbar-container">
							<div class="col-sm-6">
								<asp:HyperLink ID="ExportViewHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportViewLink") %></asp:HyperLink>
								<asp:HyperLink ID="ExportAllHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportAllLink") %></asp:HyperLink>
								<asp:HyperLink ID="ImportHyperLink" runat="server" CssClass="btn btn-link rvdImportAction" ><em class="glyphicon glyphicon-import fa fas fa-download"></em> <%= LocalizeString("ImportLink") %></asp:HyperLink>
							</div>
							<div class="col-sm-6 text-sm-right">
								<asp:HyperLink ID="AddHyperLink" runat="server" resourcekey="AddHyperLink" CssClass="btn btn-primary rvdAddNewAction" />
							</div>
						</div>
						<asp:GridView ID="ProductPartGridView" runat="server" AllowSorting="False" AutoGenerateColumns="False" DataKeyNames="ProductPartID" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="False" OnRowDeleting="ProductPartGridView_RowDeleting" OnRowDataBound="ProductPartGridView_RowDataBound">
							<PagerStyle CssClass="dnnGridPager" />
							<Columns>
								<asp:TemplateField HeaderText="Product">
									<ItemTemplate>
										<asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" Text='<%# Eval("ProductName") %>' />
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField DataField="SKU" HeaderText="SKU" />
                                <asp:CheckBoxField DataField="Selected" HeaderText="Selected"  HeaderStyle-Width="10%"/>
								<asp:BoundField DataField="DefaultQuantity" HeaderText="Quantity"  HeaderStyle-Width="10%"/>
								<asp:BoundField DataField="DisplayOrder" HeaderText="DisplayOrder" HeaderStyle-Width="15%"/>
								<asp:TemplateField  HeaderStyle-Width="5%">
									<ItemTemplate>
										<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>
					</div>
				</asp:View>
				<asp:View ID="DetailsView" runat="server">
					<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
					<h2><%= LocalizeString("PartHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="ProductPartIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
					<div id="ProductPartDetailsViewTabPanel">
							<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("GeneralHeader") %></a></h2>
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ProductPartVariantLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="ProductPartVariantRequiredFieldValidator" runat="server" ControlToValidate="ProductPartVariantTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl" InitialValue=""><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:TextBox ID="ProductPartVariantTextBox" runat="server" style="width:100%" data-role="combobox" data-clear-button="true" data-text-field="TextField" data-value-field="ProductVariantID" 
										data-source="{
											serverFiltering: true,
											serverPaging: true,
											pageSize: 50,
											transport: {
												read: {
													type: 'POST',
													url: function () { return servicesFramework.getServiceRoot('Revindex.Dnn.RevindexStorefront') + 'ProductVariant/Lookup' },
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
													var res = JSON.decycle(response)
													res = res.map(function (v) { v.TextField = v.Product.Name + (v.Name ? ' - ' + v.Name : '') + ' ' + (v.SKU ? v.SKU : ''); return v; })
													return res
												}
											},
											sort: [{ field: 'TextField', dir: 'asc' }]
										}" 
										data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="ProductPartVariantTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
									<asp:LinkButton ID="ProductPartVariantLinkButton" runat="server" OnClick="ProductPartVariantLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="SelectedLabelControl" runat="server" />
									<asp:CheckBox ID="SelectedCheckBox" runat="server" />
								</div>
							</fieldset>
							<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("PriceHeader") %></a></h2>
							<fieldset>
								<uc1:ProductPartModifierRuleControl ID="ModifierRuleControl" runat="server" Width="100%" />
							</fieldset>
							<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("InventoryHeader") %></a></h2>
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="DefaultQuantityLabelControl" runat="server" CssClass="dnnFormRequired"></dnn1:LabelControl>
									<asp:RequiredFieldValidator ID="DefaultQuantityRequiredFieldValidator" runat="server" ControlToValidate="DefaultQuantityTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:RangeValidator ID="DefaultQuantityRangeValidator" runat="server" ControlToValidate="DefaultQuantityTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="DefaultQuantityCompareValidator" runat="server" ControlToValidate="DefaultQuantityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="DefaultQuantityTextBox" runat="server" value="1000" CssClass="dnnFormRequired" TextMode="Number" ></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="MinOrderQuantityLabelControl" runat="server"></dnn1:LabelControl>
									<asp:RangeValidator ID="MinOrderQuantityRangeValidator" runat="server" ControlToValidate="MinOrderQuantityTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="MinOrderQuantityCompareValidator" runat="server" ControlToValidate="MinOrderQuantityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="MinOrderQuantityTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="MaxOrderQuantityLabelControl" runat="server"></dnn1:LabelControl>
									<asp:RangeValidator ID="MaxOrderQuantityRangeValidator" runat="server" ControlToValidate="MaxOrderQuantityTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:CompareValidator ID="MaxOrderQuantityCompareValidator" runat="server" ControlToValidate="MaxOrderQuantityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
									<asp:TextBox ID="MaxOrderQuantityTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
								</div>
							</fieldset>
							<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("DisplayHeader") %></a></h2>
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="DisplayOrderLabelControl" runat="server" CssClass="dnnFormRequired" />
									<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DisplayOrderTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:RangeValidator ID="DisplayOrderRangeValidator" runat="server" ControlToValidate="DisplayOrderTextBox" MinimumValue="-2147483648" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:TextBox ID="DisplayOrderTextBox" runat="server" value="1000" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShowPriceLabelControl" runat="server" />
									<asp:CheckBox ID="ShowPriceCheckBox" runat="server" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ShowQuantityLabelControl" runat="server" />
									<asp:CheckBox ID="ShowQuantityCheckBox" runat="server" />
								</div>
							</fieldset>
					</div>
					<div class="row rvdsf-footerbar-container">
                        <div class="col-sm-6">
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" resourcekey="DeleteLinkButton" CssClass="btn btn-default btn-light" CausesValidation="false" OnClick="DeleteLinkButton_Click" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()"></asp:LinkButton>
                        </div>
                        <div class="col-sm-6 text-sm-right">
                            <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
							<asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />
							<asp:LinkButton ID="SaveAndBackLinkButton" runat="server" resourcekey="SaveAndBackLinkButton" OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
                        </div>
                    </div>
				</asp:View>
			</asp:MultiView>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>