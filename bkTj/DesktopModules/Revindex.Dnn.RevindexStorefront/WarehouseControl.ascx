<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WarehouseControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.WarehouseControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/texteditor.ascx" TagName="TextEditor" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>

<script type="text/javascript">	
    // Bind Kendo UI
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
                    <h2><%= LocalizeString("WarehousesHeader") %></h2>
                    <div class="row rvdsf-actionbar-container">
                            <div class="col-sm-6">
                                <asp:HyperLink ID="ExportHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportLink") %></asp:HyperLink>
                                <asp:HyperLink ID="ImportHyperLink" runat="server" CssClass="btn btn-link rvdImportAction" ><em class="glyphicon glyphicon-import fa fas fa-download"></em> <%= LocalizeString("ImportLink") %></asp:HyperLink>
                            </div>
                            <div class="col-sm-6 text-sm-right">
                                <asp:HyperLink ID="AddHyperLink" resourcekey="AddHyperLink" runat="server" CssClass="btn btn-primary rvdAddNewAction" />
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
                        <asp:GridView ID="WarehouseGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="WarehouseID" Width="100%" AllowPaging="True" OnRowDeleting="WarehouseGridView_RowDeleting" OnRowDataBound="WarehouseGridView_RowDataBound">
                            <PagerStyle CssClass="dnnGridPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" CausesValidation="False" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="WarehouseObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCount" SelectMethod="GetAll" TypeName="Revindex.Business.Revindex.Revindex.Storefront.WarehouseController" SortParameterName="sortExpression" DataObjectTypeName="Revindex.Business.Revindex.Revindex.Storefront.Warehouse" DeleteMethod="Delete">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="" Name="sortExpression" Type="String" />
                                <asp:Parameter DefaultValue="" Name="maximumRows" Type="Int32" />
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
                    <h2><%= LocalizeString("WarehouseHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="WarehouseIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
                    <hr />
                    <div>
                        <fieldset>
								<asp:Panel ID="WarehouseKeyPanel" runat="server" CssClass="dnnFormItem">
									<dnn1:LabelControl ID="WarehouseKeyLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="WarehouseKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="WarehouseKeyTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="NameTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="100"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem" style="min-height: 525px">
                                    <dnn1:LabelControl ID="DescriptionLabelControl" runat="server" />
                                    <dnn1:TextEditor ID="DescriptionTextEditor" runat="server" ChooseRender="False" ChooseMode="False" DefaultMode="RICH" HtmlEncode="False" Mode="RICH" Height="460px" Width="100%" />
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="CountryCodeLabelControl" runat="server" />
                                    <asp:DropDownList ID="CountryDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="StreetLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="StreetRequiredFieldValidator" runat="server" ControlToValidate="StreetTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" resourcekey="StreetRequiredFieldValidator" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="StreetTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired" ></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
									<dnn1:LabelControl ID="UnitLabelControl" runat="server" />
									<asp:TextBox ID="UnitTextBox" runat="server" MaxLength="100" ></asp:TextBox>
								</div>
                                <asp:Panel ID="DistrictPanel" runat="server" CssClass="dnnFormItem">
									<dnn1:LabelControl ID="DistrictLabelControl" runat="server" />
									<asp:TextBox ID="DistrictTextBox" runat="server" MaxLength="50" ></asp:TextBox>
								</asp:Panel>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="CityLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="CityRequiredFieldValidator" runat="server" ControlToValidate="CityTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" resourcekey="PostalCodeRequiredFieldValidator" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="CityTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="SubdivisionCodeLabelControl" runat="server" />
                                    <asp:DropDownList ID="SubdivisionDropDownList" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PostalCodeLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="PostalCodeRequiredFieldValidator" runat="server" ControlToValidate="PostalCodeTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" resourcekey="PostalCodeRequiredFieldValidator" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="PostalCodeTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PhoneLabelControl" runat="server" />
                                    <asp:TextBox ID="PhoneTextBox" runat="server" MaxLength="50"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="EmailLabelControl" runat="server" />
                                    <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" runat="server" ControlToValidate="EmailTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^(\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*|(&quot;*[\w ]*&quot;*\s*)&lt;\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*&gt;)$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="EmailTextBox" runat="server" MaxLength="256"></asp:TextBox>
                                </div>
                            </fieldset>
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
