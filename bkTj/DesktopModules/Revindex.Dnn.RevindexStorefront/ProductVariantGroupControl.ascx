<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductVariantGroupControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductVariantGroupControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="ProductVariantGroupOptionControl.ascx" TagName="ProductVariantGroupOptionControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="PlaceHolder1" runat="server">

    <script type="text/javascript">
        jQuery(document).ready(function ()
        {
            jQuery('#ProductVariantGroupDetailsViewPanel').dnnPanels();
        });
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function ()
        {
            jQuery('#ProductVariantGroupDetailsViewPanel').dnnPanels();
        });
    </script>

</asp:PlaceHolder>
<div>
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
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
                                <asp:LinkButton ID="AssociateVariantLinkButton" runat="server" resourcekey="AssociateVariantLinkButton" OnClick="AssociateVariantLinkButton_Click" CssClass="btn btn-default btn-light" OnClientClick="return rvdsfConfirmAssociateVariants()" />
                                <script>
                                    function rvdsfConfirmAssociateVariants() {
                                        return confirm('<%= LocalizeString("ConfirmAssociateVariantsMessageLabel") %>')
                                    }
                                </script>
                                <asp:HyperLink  ID="AddHyperLink" resourcekey="AddHyperLink" runat="server"  CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-ProductVariantGroupDetailsViewTabPanel', '/')" />
                            </div>
                        </div>
                        <asp:Panel ID="ProductVariantGroupPanel" runat="server"></asp:Panel>
                        <asp:LinkButton ID="DeleteProductVariantGroupLinkButton" runat="server" OnClick="DeleteProductVariantGroupLinkButton_Click" Text="Delete" style="display:none"/>
                        <asp:LinkButton ID="MoveProductVariantGroupLinkButton" runat="server" OnClick="MoveProductVariantGroupLinkButton_Click" Text="Move" style="display:none"/>
                        <asp:HiddenField ID="SourceProductVariantGroupIDHiddenField" runat="server" />
                        <asp:HiddenField ID="TargetProductVariantGroupIDHiddenField" runat="server" />
                        <asp:HiddenField ID="ProductVariantGroupPositionHiddenField" runat="server" />
                        <script>
                            Sys.Application.add_load(function () {
                                $("#<%= ProductVariantGroupPanel.ClientID %>").kendoGrid({
                                    columns: [
                                        { field: "Name", title: "<%= Localization.GetString("Name.Header", this.LocalResourceFile) %>", template: '<a href="#: Administration.TabUrl #">#: Name ? Name : "" #</a>' },
                                        { field: "", <% if (this.ModuleSecurity.CanEditControl) { %> template: '<a href=""><em class="glyphicon glyphicon-remove fa fas fa-trash" onclick="event.stopPropagation(); $(\'\\#<%= SourceProductVariantGroupIDHiddenField.ClientID.Replace("$", "_") %>\').val(\'#= ProductVariantGroupID #\'); if (Revindex.Web.ConfirmDelete()) __doPostBack(\'<%= DeleteProductVariantGroupLinkButton.UniqueID %>\', \'\'); return false;"></em></a>', <% } %> width: "5%" },
                                        { field: "", <% if (this.ModuleSecurity.CanEditControl) { %> template: '<em class="glyphicon glyphicon-option-vertical fa fas fa-ellipsis-v" style="cursor: move"></em>', <% } %> width: "5%" },
                                    ],
                                    editable: false,
                                    dataSource: new kendo.data.DataSource({
                                        data: $("#<%= ProductVariantGroupPanel.ClientID %>").data("source"),
                                        schema: {
                                            model: {
                                                id: "ProductVariantGroupID",
                                                fields: {
                                                    Name: { type: "string" }
                                                }
                                            }
                                        },

                                    }),
                                    dataBound: function (e) {
                                        var grid = this
                                        // Make row clickable
                                        grid.table.find("tbody > tr").each(function () {
                                            var $tr = $(this)
                                            $tr.css("cursor", "pointer")
                                            $tr.on("click", function () { location.href = $tr.find("td > a")[0].href })
                                            $tr.find("td > span.k-icon").on("click", function () { event.stopPropagation() })
                                        })

                                        // Make row sortable
                                        grid.table.kendoSortable({
                                            filter: ">tbody >tr",
                                            hint: function (element) {
                                                var table = $('<table class="k-grid k-widget"></table>');

                                                // Append the dragged element
                                                table.append(element.clone());
                                                table.css("opacity", 0.7);

                                                return table;
                                            },
                                            cursor: "move",
                                            placeholder: function (element) {
                                                return $('<tr colspan="6" class="placeholder"></tr>');
                                            },
                                            change: function (e) {

                                                var sourceItem = grid.dataSource.getByUid(e.item.data("uid"));
                                                var targetItem = grid.dataSource.options.data[e.newIndex]

                                                $("#<%= SourceProductVariantGroupIDHiddenField.ClientID.Replace("$", "_") %>").val(sourceItem.ProductVariantGroupID)
                                                $("#<%= TargetProductVariantGroupIDHiddenField.ClientID.Replace("$", "_") %>").val(targetItem.ProductVariantGroupID)
                                                $("#<%= ProductVariantGroupPositionHiddenField.ClientID.Replace("$", "_") %>").val(e.oldIndex > e.newIndex ? "before" : "after")
                                                __doPostBack("<%= MoveProductVariantGroupLinkButton.UniqueID %>", "")
                                            }
                                        });
                                    },
                                    scrollable: false
                                })
                            })
                        </script>
                    </div>
                </asp:View>
                <asp:View ID="DetailsView" runat="server">
                    <uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
                    <h2><%= LocalizeString("VariantGroupHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="ProductVariantGroupIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
                    <hr />
                    <div id="ProductVariantGroupDetailsViewPanel">
                        <asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
								<asp:Panel ID="ProductVariantGroupKeyPanel" runat="server" CssClass="dnnFormItem">
									<dnn1:LabelControl ID="ProductVariantGroupKeyLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ProductVariantGroupKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ProductVariantGroupKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="ProductVariantGroupKeyTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
								</asp:Panel>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="NameLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="NameRegularExpressionValidator" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="NameTextBox" runat="server" CssClass="dnnFormRequired"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="HelpTextLabelControl" runat="server" />
                                    <asp:TextBox ID="HelpTextTextBox" runat="server" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="FieldTypeLabelControl" runat="server" />
                                    <asp:DropDownList ID="FieldTypeDropDownList" runat="server">
                                        <asp:ListItem resourcekey="ColorpickerLabel" Value="3" />
                                        <asp:ListItem resourcekey="DropdownlistLabel" Value="1" />
                                        <asp:ListItem resourcekey="ImageswatchLabel" Value="4" />
                                        <asp:ListItem resourcekey="RadiobuttonlistLabel" Value="2" />
                                    </asp:DropDownList>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="DisplayOrderLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DisplayOrderTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="DisplayOrderRangeValidator" runat="server" ControlToValidate="DisplayOrderTextBox" MinimumValue="-2147483648" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:TextBox ID="DisplayOrderTextBox" runat="server" value="1000" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
                                </div>
                                <h2 id="OptionSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("OptionHeader") %></a></h2>
                                <fieldset>
                                    <div ID="ProductVariantGroupOptionUnavailableLabel" runat="server" class="alert alert-info" ><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
                                    <uc1:ProductVariantGroupOptionControl ID="ProductVariantGroupOptionControl1" runat="server"></uc1:ProductVariantGroupOptionControl>
                                </fieldset>
                            </fieldset>
                        </asp:Panel>
                        <asp:Panel ID="OptionDetailsViewPanel" runat="server" CssClass="dnnClear">
                            
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
