<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PackageControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.PackageControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>

<script type="text/javascript">
    Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))
    })
</script>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<asp:MultiView ID="ContentMultiView" runat="server">
    <asp:View ID="ListView" runat="server">
        <h2><%= LocalizeString("PackagesHeader") %></h2>
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
            <asp:GridView ID="PackageGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PackageID" OnRowDeleting="PackageGridView_RowDeleting" OnRowDataBound="PackageGridView_RowDataBound">
                <PagerStyle CssClass="dnnGridPager" />
                <Columns>
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                        <ItemTemplate>
                            <asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PackageType" HeaderText="Type" HeaderStyle-Width="15%"/>
                    <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" HeaderStyle-Width="10%"/>
                    <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" HeaderStyle-Width="10%"/>
                    <asp:BoundField DataField="Depth" HeaderText="Depth" SortExpression="Depth" HeaderStyle-Width="10%"/>
                    <asp:TemplateField HeaderStyle-Width="5%">
						<ItemTemplate>
							<asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" CausesValidation="false" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
						</ItemTemplate>
					</asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="PackageObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCount" SelectMethod="GetAll" SortParameterName="sortExpression" TypeName="Revindex.Business.Revindex.Revindex.Storefront.PackageController">
                <SelectParameters>
                    <asp:Parameter Name="sortExpression" Type="String" />
                    <asp:Parameter Name="maximumRows" Type="Int32" />
                    <asp:Parameter Name="startRowIndex" Type="Int32" />
                    <rvd1:UserControlParameter Name="portalID" PropertyName="PortalId" Type="Int32" />
                    <asp:ControlParameter ControlID="SellerSearchTextBox" Name="sellerID" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </asp:View>
    <asp:View ID="DetailsView" runat="server">
        <uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
        <h2><%= LocalizeString("PackageHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="PackageIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
        <div>
            <hr />
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
                    <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="NameRegularExpressionValidator" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                    <asp:TextBox ID="NameTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="100"></asp:TextBox>
                </div>
                <div class="dnnFormItem">
                    <dnn1:LabelControl ID="PackageTypeLabelControl" runat="server" />
                    <asp:DropDownList ID="PackageTypeDropDownList" runat="server">
                        <asp:ListItem resourcekey="BagLabel" Value="3000"></asp:ListItem>
					    <asp:ListItem resourcekey="BoxLabel" Value="2000"></asp:ListItem>
					    <asp:ListItem resourcekey="EnvelopeLabel" Value="1000"></asp:ListItem>
					    <asp:ListItem resourcekey="PalletLabel" Value="5000"></asp:ListItem>
					    <asp:ListItem resourcekey="TubeLabel" Value="4000"></asp:ListItem>
					    <asp:ListItem resourcekey="UnspecifiedLabel" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="dnnFormItem">
                    <dnn1:LabelControl ID="WeightLabelControl" runat="server" CssClass="dnnFormRequired" />
                    <div class="rvdFormSubContainer">
                        <asp:RequiredFieldValidator ID="WeightRequiredFieldValidator" runat="server" ControlToValidate="WeightTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="WeightRangeValidator" runat="server" ControlToValidate="WeightTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="2000000000" MinimumValue="0" Type="Double" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
                        <asp:TextBox ID="WeightTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="100"></asp:TextBox>
                        <span><%= Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsMass).Symbols[0] %></span>
                    </div>
                </div>
                <div class="dnnFormItem">
                    <dnn1:LabelControl ID="WidthLabelControl" runat="server" CssClass="dnnFormRequired" />
                    <div class="rvdFormSubContainer">
                        <asp:RequiredFieldValidator ID="WidthRequiredFieldValidator" runat="server" ControlToValidate="WidthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="WidthRangeValidator" runat="server" ControlToValidate="WidthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="2000000000" MinimumValue="0" Type="Double" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
                        <asp:TextBox ID="WidthTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="100"></asp:TextBox>
                        <span><%= Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsLength).Symbols[0] %></span>
                    </div>
                </div>
                <div class="dnnFormItem">
                    <dnn1:LabelControl ID="HeightLabelControl" runat="server" CssClass="dnnFormRequired" />
                    <div class="rvdFormSubContainer">
                        <asp:RequiredFieldValidator ID="HeightRequiredFieldValidator" runat="server" ControlToValidate="HeightTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="HeightRangeValidator" runat="server" ControlToValidate="HeightTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="2000000000" MinimumValue="0" Type="Double" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
                        <asp:TextBox ID="HeightTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="100"></asp:TextBox>
                        <span><%= Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsLength).Symbols[0] %></span>
                    </div>
                </div>
                <div class="dnnFormItem">
                    <dnn1:LabelControl ID="DepthLabelControl" runat="server" CssClass="dnnFormRequired" />
                    <div class="rvdFormSubContainer">
                        <asp:RequiredFieldValidator ID="DepthRequiredFieldValidator" runat="server" ControlToValidate="DepthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="DepthRangeValidator" runat="server" ControlToValidate="DepthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="2000000000" MinimumValue="0" Type="Double" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
                        <asp:TextBox ID="DepthTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="100"></asp:TextBox>
                        <span><%= Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsLength).Symbols[0] %></span>
                    </div>
                </div>
                <div class="dnnFormItem">
                    <dnn1:LabelControl ID="InternalWidthLabelControl" runat="server" CssClass="dnnFormRequired" />
                    <div class="rvdFormSubContainer">
                        <asp:RequiredFieldValidator ID="InternalWidthRequiredFieldValidator" runat="server" ControlToValidate="InternalWidthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="InternalWidthRangeValidator" runat="server" ControlToValidate="InternalWidthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="2000000000" MinimumValue="0" Type="Double" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
                        <asp:TextBox ID="InternalWidthTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="100"></asp:TextBox>
                        <span><%= Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsLength).Symbols[0] %></span>
                    </div>
                </div>
                <div class="dnnFormItem">
                    <dnn1:LabelControl ID="InternalHeightLabelControl" runat="server" CssClass="dnnFormRequired" />
                    <div class="rvdFormSubContainer">
                        <asp:RequiredFieldValidator ID="InternalHeightRequiredFieldValidator" runat="server" ControlToValidate="InternalHeightTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="InternalHeightRangeValidator" runat="server" ControlToValidate="InternalHeightTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="2000000000" MinimumValue="0" Type="Double" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
                        <asp:TextBox ID="InternalHeightTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="100"></asp:TextBox>
                        <span><%= Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsLength).Symbols[0] %></span>
                    </div>
                </div>
                <div class="dnnFormItem">
                    <dnn1:LabelControl ID="InternalDepthLabelControl" runat="server" CssClass="dnnFormRequired" />
                    <div class="rvdFormSubContainer">
                        <asp:RequiredFieldValidator ID="InternalDepthRequiredFieldValidator" runat="server" ControlToValidate="InternalDepthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="InternalDepthRangeValidator" runat="server" ControlToValidate="InternalDepthTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="2000000000" MinimumValue="0" Type="Double" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
                        <asp:TextBox ID="InternalDepthTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="100"></asp:TextBox>
                        <span><%= Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsLength).Symbols[0] %></span>
                    </div>
                </div>
                <div class="dnnFormItem">
                    <dnn1:LabelControl ID="MaxWeightCapacityLabelControl" runat="server" CssClass="dnnFormRequired" />
                    <div class="rvdFormSubContainer">
                        <asp:RequiredFieldValidator ID="MaxWeightCapacityRequiredFieldValidator" runat="server" ControlToValidate="MaxWeightCapacityTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="MaxWeightCapacityRangeValidator" runat="server" ControlToValidate="MaxWeightCapacityTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="2000000000" MinimumValue="0" Type="Double" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
                        <asp:TextBox ID="MaxWeightCapacityTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="100"></asp:TextBox>
                        <span><%= Revindex.Math.Units.Unit.GetUnit(this.Configuration.GeneralUnitsMass).Symbols[0] %></span>
                    </div>
                </div>
                <div class="dnnFormItem">
                    <dnn1:LabelControl ID="MaxQuantityCapacityLabelControl" runat="server" CssClass="dnnFormRequired" />
                    <asp:RequiredFieldValidator ID="MaxQuantityCapacityRequiredFieldValidator" runat="server" ControlToValidate="MaxQuantityCapacityTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="MaxQuantityCapacityRangeValidator" runat="server" ControlToValidate="MaxQuantityCapacityTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="2000000000" MinimumValue="1" Type="Double" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
                    <asp:TextBox ID="MaxQuantityCapacityTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="100"></asp:TextBox>
                </div>
                <div class="dnnFormItem">
                    <dnn1:LabelControl ID="ShippingCodeLabelControl" runat="server" />
                    <asp:TextBox ID="ShippingCodeTextBox" runat="server" MaxLength="50"></asp:TextBox>
                </div>
            </fieldset>
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
        </div>
    </asp:View>
</asp:MultiView>

