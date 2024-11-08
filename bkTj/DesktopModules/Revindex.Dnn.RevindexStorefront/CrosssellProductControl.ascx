<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CrosssellProductControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.CrosssellProductControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="CrosssellProductAvailabilityRuleControl.ascx" TagName="CrosssellProductAvailabilityRuleControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
    
<script type="text/javascript">
    Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))

        $('#CrosssellProductDetailsViewTabPanel').dnnTabs()
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
                                
                            </div>
                            <div class="col-sm-6 text-sm-right">
                                <asp:HyperLink ID="AddHyperLink" runat="server" resourcekey="AddHyperLink" CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-CrosssellProductDetailsViewTabPanel', '/')" />
                            </div>
                        </div>
                        <asp:GridView ID="CrosssellProductGridView" runat="server" AllowSorting="False" AutoGenerateColumns="False" DataKeyNames="CrosssellProductID" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="False" OnRowDataBound="CrosssellProductGridView_RowDataBound" OnRowDeleting="CrosssellProductGridView_RowDeleting">
                            <PagerStyle CssClass="dnnGridPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="Product" SortExpression="ProductName">
				                    <ItemTemplate>
					                    <asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" Text='<%# Eval("ProductName") %>'/>
				                    </ItemTemplate>
			                    </asp:TemplateField>
                                <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active"  HeaderStyle-Width="10%"/>
                                <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" HeaderStyle-Width="10%" />
                                <asp:BoundField DataField="StopDate" HeaderText="StopDate" SortExpression="StopDate"   HeaderStyle-Width="10%"/>
                                <asp:TemplateField HeaderStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:View>
                <asp:View ID="DetailsView" runat="server">
                    <uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction"/>
                    <h2>Cross-sell product: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="CrosssellProductIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
                    <div id="CrosssellProductDetailsViewTabPanel">
                        <ul class="dnnAdminTabNav dnnClear">
                            <li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
                                <asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
                            <li><a href="#<%= AvailabilityDetailsViewPanel.ClientID %>">
                                <asp:Label ID="AvailabilityDetailsViewTabLabel" runat="server" resourcekey="AvailabilityDetailsViewTabLabel" /></a></li>
                        </ul>
                        <asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="OfferProductLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="OfferProductRequiredFieldValidator" runat="server" ControlToValidate="OfferProductTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl" InitialValue=""><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="OfferProductTextBox" runat="server" style="width:100%" data-role="combobox" data-clear-button="true" data-text-field="Name" data-value-field="ProductID" 
										data-source="{
											serverFiltering: true,
											serverPaging: true,
											pageSize: 50,
											transport: {
												read: {
													type: 'POST',
													url: function () { return servicesFramework.getServiceRoot('Revindex.Dnn.RevindexStorefront') + 'Product/Lookup' },
													beforeSend: servicesFramework.setModuleHeaders,
													dataType: 'json',
													contentType: 'application/json; charset=UTF-8'
												},
												parameterMap: function (data, type) {
													return kendo.stringify({
                                                        SellerID: -1,
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
											sort: [{ field: 'Name', dir: 'asc' }]
										}" 
										data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="OfferProductTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
									<asp:LinkButton ID="OfferProductLinkButton" runat="server" OnClick="OfferProductLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="DisplayOrderLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DisplayOrderTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="DisplayOrderRangeValidator" runat="server" ControlToValidate="DisplayOrderTextBox" MinimumValue="-2147483648" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			                        <asp:TextBox ID="DisplayOrderTextBox" runat="server" value="1000" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="ActiveLabelControl" runat="server" />
                                    <asp:CheckBox ID="ActiveCheckBox" runat="server" />
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="StartDateLabelControl" runat="server" />
                                    <asp:TextBox ID="StartDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm"/>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="StopDateLabelControl" runat="server" EnableViewState="False" />
                                    <asp:TextBox ID="StopDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm"/>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="TitleLabelControl" runat="server" />
                                    <asp:TextBox ID="TitleTextBox" runat="server"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="DescriptionLabelControl" runat="server" />
                                    <asp:TextBox ID="DescriptionTextBox" runat="server" Rows="8" TextMode="MultiLine" MaxLength="4000"></asp:TextBox>
                                </div>
                            </fieldset>
                        </asp:Panel>
                        <asp:Panel ID="AvailabilityDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <uc1:CrosssellProductAvailabilityRuleControl ID="CrosssellProductAvailabilityRuleControl" runat="server" Width="100%" />
                            </fieldset>
                        </asp:Panel>
                    </div>
                    <div class="row rvdsf-footerbar-container">
                        <div class="col-sm-6">
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" resourcekey="DeleteLinkButton" CssClass="btn btn-default btn-light" CausesValidation="false" OnClick="DeleteLinkButton_Click" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()"></asp:LinkButton>
                        </div>
                        <div class="col-sm-6 text-sm-right">
                            <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl"/>
                            <asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />
                            <asp:LinkButton ID="SaveAndBackLinkButton" runat="server" resourcekey="SaveAndBackLinkButton" OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
