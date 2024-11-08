<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductVariantGroupOptionControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductVariantGroupOptionControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<div>
	<asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="SaveLinkButton" />
            <asp:PostBackTrigger ControlID="SaveAndBackLinkButton" />
        </Triggers>
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
                                <asp:HyperLink ID="AddHyperLink" resourcekey="AddHyperLink" runat="server" CssClass="btn btn-primary rvdAddNewAction" />
                            </div>
                        </div>
						<asp:Panel ID="ProductVariantGroupOptionPanel" runat="server"></asp:Panel>
                        <asp:LinkButton ID="DeleteProductVariantGroupOptionLinkButton" runat="server" OnClick="DeleteProductVariantGroupOptionLinkButton_Click" Text="Delete" style="display:none"/>
                        <asp:LinkButton ID="MoveProductVariantGroupOptionLinkButton" runat="server" OnClick="MoveProductVariantGroupOptionLinkButton_Click" Text="Move" style="display:none"/>
                        <asp:HiddenField ID="SourceProductVariantGroupOptionIDHiddenField" runat="server" />
                        <asp:HiddenField ID="TargetProductVariantGroupOptionIDHiddenField" runat="server" />
                        <asp:HiddenField ID="ProductVariantGroupOptionPositionHiddenField" runat="server" />
                        <script>
                            Sys.Application.add_load(function () {
                                $("#<%= ProductVariantGroupOptionPanel.ClientID %>").kendoGrid({
                                    columns: [
                                        { field: "Name", title: "<%= Localization.GetString("Name.Header", this.LocalResourceFile) %>", template: '<a href="#: Administration.TabUrl #">#: Name ? Name : "" #</a>' },
                                        { field: "", <% if (this.ModuleSecurity.CanEditControl) { %> template: '<a href=""><em class="glyphicon glyphicon-remove fa fas fa-trash" onclick="event.stopPropagation(); $(\'\\#<%= SourceProductVariantGroupOptionIDHiddenField.ClientID.Replace("$", "_") %>\').val(\'#= ProductVariantGroupOptionID #\'); if (Revindex.Web.ConfirmDelete()) __doPostBack(\'<%= DeleteProductVariantGroupOptionLinkButton.UniqueID %>\', \'\'); return false;"></em></a>', <% } %> width: "5%" },
                                        { field: "", <% if (this.ModuleSecurity.CanEditControl) { %> template: '<em class="glyphicon glyphicon-option-vertical fa fas fa-ellipsis-v" style="cursor: move"></em>', <% } %> width: "5%" },
                                    ],
                                    editable: false,
                                    dataSource: new kendo.data.DataSource({
                                        data: $("#<%= ProductVariantGroupOptionPanel.ClientID %>").data("source"),
                                        schema: {
                                            model: {
                                                id: "ProductVariantGroupOptionID",
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

                                                $("#<%= SourceProductVariantGroupOptionIDHiddenField.ClientID.Replace("$", "_") %>").val(sourceItem.ProductVariantGroupOptionID)
                                                $("#<%= TargetProductVariantGroupOptionIDHiddenField.ClientID.Replace("$", "_") %>").val(targetItem.ProductVariantGroupOptionID)
                                                $("#<%= ProductVariantGroupOptionPositionHiddenField.ClientID.Replace("$", "_") %>").val(e.oldIndex > e.newIndex ? "before" : "after")
                                                __doPostBack("<%= MoveProductVariantGroupOptionLinkButton.UniqueID %>", "")
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
					<h2><%= LocalizeString("VariantGroupOptionHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="ProductVariantGroupOptionIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
					<div>
						<hr />
						<fieldset>
							<asp:Panel ID="ProductVariantGroupOptionKeyPanel" runat="server" CssClass="dnnFormItem">
								<dnn1:LabelControl ID="ProductVariantGroupOptionKeyLabelControl" runat="server" CssClass="dnnFormRequired" />
								<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ProductVariantGroupOptionKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ProductVariantGroupOptionKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
								<asp:TextBox ID="ProductVariantGroupOptionKeyTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
							</asp:Panel>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="NameLabelControl" runat="server" />
								<asp:RegularExpressionValidator ID="NameRegularExpressionValidator" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
								<asp:TextBox ID="NameTextBox" runat="server" CssClass="dnnFormRequired"></asp:TextBox>
							</div>
							<asp:Panel ID="ColorCodePanel" runat="server" CssClass="dnnFormItem">
								<dnn1:LabelControl ID="ColorCodeLabelControl" runat="server" CssClass="dnnFormRequired" />
								<asp:RequiredFieldValidator ID="ColorCodeRequiredFieldValidator" runat="server" ControlToValidate="ColorCodeTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="ColorCodeRegularExpressionValidator" runat="server" ControlToValidate="ColorCodeTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
								<asp:TextBox ID="ColorCodeTextBox" runat="server" CssClass="dnnFormRequired" ></asp:TextBox>
							</asp:Panel>
                            <asp:Panel ID="ImageSwatchPanel" runat="server">
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="ImageSwatchLabelControl" runat="server" />
                                    <asp:Image ID="ImageSwatchImage" runat="server" style="margin: 0 20px"/>
								    <asp:RegularExpressionValidator ID="ImageSwatchRegularExpressionValidator" runat="server" ControlToValidate="ImageSwatchFileUpload" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression=".+\.(gif|GIF|jpg|JPG|jpeg|JPEG|png|PNG)$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                    <asp:FileUpload ID="ImageSwatchFileUpload" runat="server" />
                                </div>
							</asp:Panel>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="DisplayOrderLabelControl" runat="server" CssClass="dnnFormRequired" />
								<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DisplayOrderTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
								<asp:RangeValidator ID="DisplayOrderRangeValidator" runat="server" ControlToValidate="DisplayOrderTextBox" MinimumValue="-2147483648" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
								<asp:TextBox ID="DisplayOrderTextBox" runat="server" value="1000" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
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
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
