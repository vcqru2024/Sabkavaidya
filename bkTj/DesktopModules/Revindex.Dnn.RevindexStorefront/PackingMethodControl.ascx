<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PackingMethodControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.PackingMethodControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="PackingMethodPackRuleControl.ascx" TagName="PackingMethodPackRuleControl" TagPrefix="uc1" %>
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
                    <h2><%= LocalizeString("PackingMethodsHeader") %></h2>
                    <div class="row rvdsf-actionbar-container">
						<div class="col-sm-6">
							
						</div>
						<div class="col-sm-6 text-sm-right">
							<asp:HyperLink ID="AddHyperLink" runat="server" resourcekey="AddHyperLink" CssClass="btn btn-primary rvdAddNewAction" />
						</div>
					</div>
                    <asp:Panel ID="SearchPanel" runat="server" CssClass="rvdsfSearchContainer">
                        <fieldset>
                            <div class="dnnFormItem">
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
                            </div>
                        </fieldset>
                    </asp:Panel>
                    <div class="rvdsfListContainer">
                        <asp:GridView ID="PackingMethodGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PackingMethodID" OnRowDeleting="PackingMethodGridView_RowDeleting" OnDataBound="PackingMethodGridView_DataBound" OnRowDataBound="PackingMethodGridView_RowDataBound">
                            <PagerStyle CssClass="dnnGridPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-Width="5%">
									<ItemTemplate>
										<asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" CausesValidation="false" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="PackingMethodObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCount" SelectMethod="GetAll" SortParameterName="sortExpression" TypeName="Revindex.Business.Revindex.Revindex.Storefront.PackingMethodController">
                            <SelectParameters>
                                <asp:Parameter Name="sortExpression" Type="String" />
                                <asp:Parameter Name="maximumRows" Type="Int32" />
                                <asp:Parameter Name="startRowIndex" Type="Int32" />
								<asp:Parameter Name="deleted" Type="Boolean" DefaultValue="false"></asp:Parameter>
                                <rvd1:UserControlParameter Name="portalID" PropertyName="PortalId" Type="Int32" />
                                <asp:ControlParameter ControlID="SellerSearchTextBox" Name="sellerID" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </asp:View>
                <asp:View ID="DetailsView" runat="server">
                    <uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
                    <h2><%= LocalizeString("PackingMethodHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label runat="server" ID="PackingMethodIDLabel" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
                    <div id="PackingMethodDetailsViewTabPanel">
                        <hr/>
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
                                <dnn1:LabelControl ID="NameLabelControl" runat="server" CssClass="dnnFormRequired" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                <asp:TextBox ID="NameTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="100"></asp:TextBox>
                            </div>
                            <uc1:PackingMethodPackRuleControl ID="PackingMethodPackRuleControl" runat="server" Width="100%" />
                        </fieldset>
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
