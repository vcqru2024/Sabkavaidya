<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CategoryControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.CategoryControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/texteditor.ascx" TagName="TextEditor" TagPrefix="dnn1" %>
<%@ Register Src="CategoryAvailabilityRuleControl.ascx" TagName="CategoryAvailabilityRuleControl" TagPrefix="uc1" %>
<%@ Register Src="CategoryDropDownListControl.ascx" TagName="CategoryDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="GalleryControl.ascx" TagName="GalleryControl" TagPrefix="uc1" %>
<%@ Register Src="ProductCategoryControl.ascx" TagName="ProductCategoryControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/XmlEditorControl.ascx" TagName="XmlEditorControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>

<asp:PlaceHolder ID="PlaceHolder1" runat="server">

    <script type="text/javascript">
        jQuery(document).ready(function ()
        {
            jQuery('#CategoryDetailsViewTabPanel').dnnTabs();
            jQuery('#GeneralDetailsViewSubPanel').dnnPanels();
        });
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function ()
        {
            jQuery('#CategoryDetailsViewTabPanel').dnnTabs();
            jQuery('#GeneralDetailsViewSubPanel').dnnPanels();
        });
    </script>

</asp:PlaceHolder>
<div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
            <asp:MultiView ID="ContentMultiView" runat="server">
                <asp:View ID="ListView" runat="server">
                    <h2><%= LocalizeString("CategoriesHeader") %></h2>
                    <div class="rvdsfListContainer">
                        <div class="row rvdsf-actionbar-container">
                            <div class="col-sm-6">
                                <asp:HyperLink ID="ExportHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportLink") %></asp:HyperLink>
                                <asp:HyperLink ID="ImportHyperLink" runat="server" CssClass="btn btn-link rvdImportAction" ><em class="glyphicon glyphicon-import fa fas fa-download"></em> <%= LocalizeString("ImportLink") %></asp:HyperLink>
                                <asp:LinkButton ID="ResetDisplayOrderLinkButton" runat="server" CssClass="btn btn-link" OnClick="ResetDisplayOrderLinkButton_Click"><em class="glyphicon glyphicon-sort-by-alphabet fa fas fa-sort-alpha-down"></em> <%= LocalizeString("ResetDisplayOrderLink") %></asp:LinkButton>
                                <asp:LinkButton ID="SyncTabsLinkButton" runat="server" CssClass="btn btn-link" OnClick="SyncTabsLinkButton_Click"><em class="glyphicon glyphicon-refresh fa fas fa-sync"></em> <%= LocalizeString("SynchronizeMenuLink") %></asp:LinkButton>
                            </div>
                            <div class="col-sm-6 text-sm-right">
                                <asp:HyperLink  ID="AddHyperLink" resourcekey="AddHyperLink" runat="server"  CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-CategoryDetailsViewTabPanel', '/')" />
                            </div>
                        </div>
                        <asp:Panel ID="CategoryPanel" runat="server" ViewStateMode="Inherit"></asp:Panel> 
                        <asp:LinkButton ID="DeleteCategoryLinkButton" runat="server" OnClick="DeleteCategoryLinkButton_Click" Text="Delete" style="display:none"/>
                        <asp:LinkButton ID="MoveCategoryLinkButton" runat="server" OnClick="MoveCategoryLinkButton_Click" Text="Move" style="display:none"/>
                        <asp:HiddenField ID="SourceCategoryIDHiddenField" runat="server" />
                        <asp:HiddenField ID="TargetCategoryIDHiddenField" runat="server" />
                        <asp:HiddenField ID="CategoryPositionHiddenField" runat="server" />
                        <script>
                            Sys.Application.add_load(function () {
                                var rvdsfCategoryTreeList = $("#<%= CategoryPanel.ClientID %>").kendoTreeList({
                                    scrollable: false,
                                    columns: [
                                        { field: "<%= LocalizeString("Name.Header") %>", template: '<a href="#: Administration.TabUrl #">#: Name #</a>' },
                                        { field: "<%= LocalizeString("Published.Header") %>", template: '# if (Published) {# <em class="glyphicon glyphicon-check fa fas fa-check-square"></em> #} else { # <em class="glyphicon glyphicon-unchecked fa fas fa-square"></em> # } #', width: "10%" },
                                        { field: "", template: '<a href="#: ProductList.TabUrl #" target="_blank"><em class="glyphicon glyphicon-eye-open fa fas fa-eye" onclick="event.stopPropagation()"></em></a>', width: "5%" },
                                        { field: "", <% if (this.ModuleSecurity.CanEditControl && this.Seller == null) { %> template: '<a href=""><em class="glyphicon glyphicon-remove fa fas fa-trash" onclick="event.stopPropagation(); $(\'\\#<%= SourceCategoryIDHiddenField.ClientID.Replace("$", "_") %>\').val(\'#= CategoryID #\'); if (Revindex.Web.ConfirmDelete()) __doPostBack(\'<%= DeleteCategoryLinkButton.UniqueID %>\', \'\'); return false;"></em></a>', <% } %> width: "5%" },
                                        { field: "", <% if (this.ModuleSecurity.CanEditControl && this.Seller == null) { %> template: '<em class="glyphicon glyphicon-option-vertical fa fas fa-ellipsis-v" style="cursor: move"></em>', <% } %> width: "5%" },
                                    ],
                                    <% if (this.ModuleSecurity.CanEditControl && this.Seller == null) { %>
                                    editable: {
                                        move: {
                                            reorderable: true
                                         }
                                    },
                                    <% } %>
                                    dataSource: new kendo.data.TreeListDataSource({
                                        data: $("#<%= CategoryPanel.ClientID %>").data("source"),
                                        schema: {
                                            model: {
                                                id: "CategoryID",
                                                parentId: "ParentCategoryID",
                                                fields: {
                                                    CategoryID: { type: "number", editable: false, nullable: false },
                                                    ParentCategoryID: { nullable: true, type: "number" },
                                                    Name: { field: "Name", type: "string" },
                                                    Published: { field: "Published", type: "boolean" },
                                                }
                                            }
                                        }
                                    }),
                                    dataBound: function (e) {
                                        var treeList = this
                                        // Make row clickable
                                        treeList.table.find("tbody > tr").each(function () {
                                            var $tr = $(this)
                                            $tr.css("cursor", "pointer")
                                            $tr.on("click", function () { location.href = $tr.find("td > a")[0].href })
                                            $tr.find("td > span.k-icon").on("click", function () { event.stopPropagation() })
                                        })

                                        // Expand previously expanded categories
                                        var expandedCategories = []
                                        if (sessionStorage["CategoryTreeList.Data.Expanded"] != null)
                                            expandedCategories = JSON.parse(sessionStorage["CategoryTreeList.Data.Expanded"])

                                        treeList.items().each(function (index) {
                                            var row = this
                                            var categoryID = treeList.dataItem(row).CategoryID
                                            if (expandedCategories.indexOf(categoryID) >= 0)
                                                treeList.expand(row)
                                        })
                                    },
                                    drop: function (e) {

                                        // Disallow dragging from parent category to child category
                                        if (e.valid) {

                                            $("#<%= SourceCategoryIDHiddenField.ClientID.Replace("$", "_") %>").val(e.source.CategoryID)
                                            $("#<%= TargetCategoryIDHiddenField.ClientID.Replace("$", "_") %>").val(e.destination.CategoryID)
                                            $("#<%= CategoryPositionHiddenField.ClientID.Replace("$", "_") %>").val(e.position)
                                            __doPostBack("<%= MoveCategoryLinkButton.UniqueID %>", "")

                                            e.setValid(true)
                                        }
                                    },
                                    collapse: function (e) {
                                        // Keep track of expanded categories
                                        var expandedCategories = []
                                        if (sessionStorage["CategoryTreeList.Data.Expanded"] != null)
                                            expandedCategories = JSON.parse(sessionStorage["CategoryTreeList.Data.Expanded"])

                                        var index = expandedCategories.indexOf(e.model.CategoryID)
                                        if (index >= 0)
                                            expandedCategories.splice(index, 1)

                                        sessionStorage["CategoryTreeList.Data.Expanded"] = kendo.stringify(expandedCategories)
                                    },
                                    expand: function (e) {
                                        // Keep track of expanded categories
                                        var expandedCategories = []
                                        if (sessionStorage["CategoryTreeList.Data.Expanded"] != null)
                                            expandedCategories = JSON.parse(sessionStorage["CategoryTreeList.Data.Expanded"])

                                        var index = expandedCategories.indexOf(e.model.CategoryID)
                                        if (index < 0)
                                            expandedCategories.push(e.model.CategoryID)

                                        sessionStorage["CategoryTreeList.Data.Expanded"] = kendo.stringify(expandedCategories)
                                    }
                                })
                            })
                        </script>
                    </div>
                </asp:View>
                <asp:View ID="DetailsView" runat="server">
                    <uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
                    <h2><%= LocalizeString("CategoryHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="CategoryIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
                    <div class="row rvdsf-actionbar-container">
                        <div class="col-sm-6">
							<asp:HyperLink ID="PreviewHyperLink" runat="server" CssClass="btn btn-link rvdPreviewAction" Target="_blank" ><em class="glyphicon glyphicon-eye-open fa fas fa-eye"></em> <%= LocalizeString("PreviewLink") %></asp:HyperLink>
							<asp:HyperLink ID="AddFeaturesHyperLink" runat="server" CssClass="btn btn-link" ><em class="glyphicon glyphicon-plus fa fas fa-plus"></em> <%= LocalizeString("MoreFeaturesLink") %></asp:HyperLink>
                        </div>
                        <div class="col-sm-6 text-sm-right">

                        </div>
                    </div>
                    <div id="CategoryDetailsViewTabPanel">
                        <ul class="dnnAdminTabNav dnnClear">
                            <li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
                                <asp:Label  ID="GeneralDetailsViewTabLabel" resourcekey="GeneralDetailsViewTabLabel" runat="server"  /></a></li>
                            <li><a href="#<%= GalleryDetailsViewPanel.ClientID %>">
                                <asp:Label  ID="GalleryDetailsViewTabLabel" resourcekey="GalleryDetailsViewTabLabel" runat="server"  /></a></li>
                            <li><a href="#<%= DisplayDetailsViewPanel.ClientID %>">
                                <asp:Label  ID="DisplayDetailsViewTabLabel" resourcekey="DisplayDetailsViewTabLabel" runat="server"  /></a></li>
                            <li ID="AvailabilityDetailsViewListItem" runat="server"><a href="#<%= AvailabilityDetailsViewPanel.ClientID %>">
                                <asp:Label  ID="AvailabilityDetailsViewTabLabel" resourcekey="AvailabilityDetailsViewTabLabel" runat="server"  /></a></li>
                            <li ID="ExtensionDetailsViewListItem" runat="server"><a href="#<%= ExtensionDetailsViewPanel.ClientID %>">
                                <asp:Label  ID="ExtensionDetailsViewTabLabel" resourcekey="ExtensionDetailsViewTabLabel" runat="server"  /></a></li>
                        </ul>
                        <asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div ID="GeneralDetailsViewSubPanel">
								    <asp:Panel ID="CategoryKeyPanel" runat="server" CssClass="dnnFormItem">
									    <dnn1:LabelControl ID="CategoryKeyLabelControl" runat="server" CssClass="dnnFormRequired" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="CategoryKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="CategoryKeyTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
								    </asp:Panel>
                                    <div class="dnnFormItem">
                                        <dnn1:LabelControl ID="NameLabelControl" runat="server" CssClass="dnnFormRequired" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="NameTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
                                    </div>
                                    <div class="dnnFormItem">
                                        <dnn1:LabelControl ID="ParentCategoryLabelControl" runat="server" />
                                        <uc1:CategoryDropDownListControl ID="ParentCategoryDropDownListControl" runat="server" ShowEmptyRoot="true" EmptyText="None"/>
                                    </div>
                                    <div class="dnnFormItem" style="min-height: 525px">
                                        <dnn1:LabelControl ID="DescriptionLabelControl" runat="server" />
                                        <dnn1:TextEditor ID="DescriptionTextEditor" runat="server" ChooseRender="False" ChooseMode="False" DefaultMode="RICH" HtmlEncode="False" Mode="RICH" Height="460px" Width="100%" />
                                    </div>
                                    <h2 id="ProductsSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("ProductsHeader") %></a></h2>
                                    <fieldset>
                                        <div ID="ProductCategoryUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
                                        <uc1:ProductCategoryControl ID="ProductCategoryControl1" runat="server" />
                                    </fieldset>
                                    <h2 id="SEOSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("SEOHeader") %></a></h2>
                                    <fieldset>
								        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="UrlNameLabelControl" runat="server" />
                                            <asp:TextBox ID="UrlNameTextBox" runat="server" MaxLength="400"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="PageTitleLabelControl" runat="server"></dnn1:LabelControl>
                                            <asp:TextBox ID="PageTitleTextBox" runat="server" MaxLength="400"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="MetaKeywordsLabelControl" runat="server"></dnn1:LabelControl>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="MetaKeywordsTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\s\S]{0,400}$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                            <asp:TextBox ID="MetaKeywordsTextBox" runat="server" MaxLength="400" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="MetaDescriptionLabelControl" runat="server"></dnn1:LabelControl>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="MetaDescriptionTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\s\S]{0,400}$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                            <asp:TextBox ID="MetaDescriptionTextBox" runat="server" MaxLength="400" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </fieldset>
                                </div>
                            </fieldset>
                        </asp:Panel>
                        <asp:Panel ID="GalleryDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div ID="GalleryUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
                                <uc1:GalleryControl ID="GalleryControl1" runat="server"></uc1:GalleryControl>
                            </fieldset>
                        </asp:Panel>
                        <asp:Panel ID="DisplayDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PublishedLabelControl" runat="server" />
                                    <asp:CheckBox ID="PublishedCheckBox" runat="server" Checked="True" />
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="DisplayTemplateLabelControl" runat="server" />
                                    <uc1:DisplayTemplateDropDownListControl ID="DisplayTemplateDropDownList" runat="server"></uc1:DisplayTemplateDropDownListControl>
									<asp:LinkButton ID="DisplayTemplateLinkButton" runat="server" OnClick="DisplayTemplateLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="DisplayOrderLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DisplayOrderTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="DisplayOrderRangeValidator" runat="server" ControlToValidate="DisplayOrderTextBox" MinimumValue="-2147483648" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl" Type="Integer"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			                        <asp:TextBox ID="DisplayOrderTextBox" runat="server" value="1000" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
                                </div>
                            </fieldset>
                        </asp:Panel>
                        <asp:Panel ID="AvailabilityDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <uc1:CategoryAvailabilityRuleControl ID="AvailabilityRuleControl" runat="server" Width="100%" />
                            </fieldset>
                        </asp:Panel>
                        <asp:Panel ID="ExtensionDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="ExtensionLabelControl" runat="server" />
                                    <uc1:XmlEditorControl ID="ExtensionXmlEditor" runat="server" ModuleControl="CategoryExtension" />
                                </div>
                            </fieldset>
                        </asp:Panel>
                    </div>
                    <div class="row rvdsf-footerbar-container">
                        <div class="col-sm-6">
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" resourcekey="DeleteLinkButton" CssClass="btn btn-default btn-light" CausesValidation="false" OnClick="DeleteLinkButton_Click" OnClientClick="return Revindex.Web.ConfirmDelete()"></asp:LinkButton>
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
