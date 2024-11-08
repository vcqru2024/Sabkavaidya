<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductVariantControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductVariantControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/texteditor.ascx" TagName="TextEditor" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/urlcontrol.ascx" TagName="UrlControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="GalleryControl.ascx" TagName="GalleryControl" TagPrefix="uc1" %>
<%@ Register Src="ProductComponentControl.ascx" TagName="ProductComponentControl" TagPrefix="uc1" %>
<%@ Register Src="RequiredProductControl.ascx" TagName="RequiredProductControl" TagPrefix="uc1" %>
<%@ Register Src="TaxClassDropDownListControl.ascx" TagName="TaxClassDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="ProductDynamicFormCodeControl.ascx" TagName="ProductDynamicFormCodeControl" TagPrefix="uc1" %>
<%@ Register Src="ProductVariantBookingRuleControl.ascx" TagName="ProductVariantBookingRuleControl" TagPrefix="uc1" %>
<%@ Register Src="ProductVariantPlaceOrderActionRuleControl.ascx" TagName="ProductVariantPlaceOrderActionRuleControl" TagPrefix="uc1" %>
<%@ Register Src="ProductVariantAvailabilityRuleControl.ascx" TagName="ProductVariantAvailabilityRuleControl" TagPrefix="uc1" %>
<%@ Register Src="ProductVariantModifierRuleControl.ascx" TagName="ProductVariantModifierRuleControl" TagPrefix="uc1" %>
<%@ Register Src="ProductVariantSalesPromotionRuleControl.ascx" TagName="ProductVariantSalesPromotionRuleControl" TagPrefix="uc1" %>
<%@ Register Src="ProductAttributeControl.ascx" TagName="ProductAttributeControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/XmlEditorControl.ascx" TagName="XmlEditorControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
    
<script type="text/javascript">
	Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
		kendo.bind($(".rvdsf-content-container"))

        $('#ProductVariantDetailsViewTabPanel').dnnTabs()
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
					<div class="rvdsfListContainer">
						<div class="row rvdsf-actionbar-container">
                            <div class="col-sm-6">
                                <asp:HyperLink ID="ExportViewHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportViewLink") %></asp:HyperLink>
								<asp:HyperLink ID="ExportAllHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportAllLink") %></asp:HyperLink>
								<asp:HyperLink ID="ImportHyperLink" runat="server" CssClass="btn btn-link rvdImportAction" ><em class="glyphicon glyphicon-import fa fas fa-download"></em> <%= LocalizeString("ImportLink") %></asp:HyperLink>
                            </div>
                            <div class="col-sm-6 text-sm-right">
                                <asp:HyperLink  ID="AddHyperLink" resourcekey="AddHyperLink" runat="server"  CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-ProductVariantDetailsViewTabPanel', '/')" />
                            </div>
                        </div>
						<asp:Panel ID="ProductVariantPanel" runat="server"></asp:Panel> 
						<asp:LinkButton ID="DuplicateProductVariantLinkButton" runat="server" OnClick="DuplicateProductVariantLinkButton_Click" Text="Duplicate" style="display:none"/>
                        <asp:LinkButton ID="DeleteProductVariantLinkButton" runat="server" OnClick="DeleteProductVariantLinkButton_Click" Text="Delete" style="display:none"/>
                        <asp:LinkButton ID="MoveProductVariantLinkButton" runat="server" OnClick="MoveProductVariantLinkButton_Click" Text="Move" style="display:none"/>
                        <asp:HiddenField ID="SourceProductVariantIDHiddenField" runat="server" />
                        <asp:HiddenField ID="TargetProductVariantIDHiddenField" runat="server" />
                        <asp:HiddenField ID="ProductVariantPositionHiddenField" runat="server" />
						<script>
                            Sys.Application.add_load(function () {
                                $("#<%= ProductVariantPanel.ClientID %>").kendoGrid({
                                    columns: [
                                        { field: "Name", title: "<%= Localization.GetString("Name.Header", this.LocalResourceFile) %>", template: '<a href="#: Administration.TabUrl #">#: Name ? Name : "" #</a>' },                                        
                                        { field: "Group", title: "<%= Localization.GetString("Group.Header", this.LocalResourceFile) %>", template: '#: ProductVariantOptions.map((obj) => obj.ProductVariantGroupOption.Name).join(", ") #' },
										{ field: "SKU", title: "<%= Localization.GetString("SKU.Header", this.LocalResourceFile) %>" },
										{ field: "Published", width: "10%", title: "<%= Localization.GetString("Published.Header", this.LocalResourceFile) %>", template: '<input type="checkbox" disabled #: Published ? "checked" : "" # />' },
                                        { field: "BasePrice", width: "10%", title: "<%= Localization.GetString("BasePrice.Header", this.LocalResourceFile) %>", format: "{0:n4}" },
                                        { field: "", template: '<a href="#: ProductDetail.TabUrl #" target="_blank"><em class="glyphicon glyphicon-eye-open fa fas fa-eye" onclick="event.stopPropagation();"></em></a>', width: "5%" },
                                        { field: "", <% if (this.ModuleSecurity.CanEditControl) { %> template: '<a href=""><em class="glyphicon glyphicon-duplicate fa fas fa-clone" onclick="event.stopPropagation(); $(\'\\#<%= SourceProductVariantIDHiddenField.ClientID.Replace("$", "_") %>\').val(\'#= ProductVariantID #\'); __doPostBack(\'<%= DuplicateProductVariantLinkButton.UniqueID %>\', \'\'); return false;"></em></a>', <% } %> width: "5%" },
                                        { field: "", <% if (this.ModuleSecurity.CanEditControl) { %> template: '<a href=""><em class="glyphicon glyphicon-remove fa fas fa-trash" onclick="event.stopPropagation(); $(\'\\#<%= SourceProductVariantIDHiddenField.ClientID.Replace("$", "_") %>\').val(\'#= ProductVariantID #\'); if (Revindex.Web.ConfirmDelete()) __doPostBack(\'<%= DeleteProductVariantLinkButton.UniqueID %>\', \'\'); return false;"></em></a>', <% } %> width: "5%" },
                                        { field: "", <% if (this.ModuleSecurity.CanEditControl) { %> template: '<em class="glyphicon glyphicon-option-vertical fa fas fa-ellipsis-v" style="cursor: move"></em>', <% } %> width: "5%" },
                                    ],
                                    editable: false,
                                    dataSource: new kendo.data.DataSource({
                                        data: $("#<%= ProductVariantPanel.ClientID %>").data("source"),
                                        schema: {
                                            model: {
                                                id: "ProductVariantID",
                                                fields: {
                                                    Name: { type: "string" },
													Group: { type: "string" },
                                                    SKU: { type: "string" },
                                                    Published: { type: "boolean" },
                                                    BasePrice: { type: "number" },
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
                                                return $('<tr colspan="9" class="placeholder"></tr>');
                                            },
                                            change: function (e) {

                                                var sourceItem = grid.dataSource.getByUid(e.item.data("uid"));
                                                var targetItem = grid.dataSource.options.data[e.newIndex]

                                                $("#<%= SourceProductVariantIDHiddenField.ClientID.Replace("$", "_") %>").val(sourceItem.ProductVariantID)
												$("#<%= TargetProductVariantIDHiddenField.ClientID.Replace("$", "_") %>").val(targetItem.ProductVariantID)
												$("#<%= ProductVariantPositionHiddenField.ClientID.Replace("$", "_") %>").val(e.oldIndex > e.newIndex ? "before" : "after")
                                                __doPostBack("<%= MoveProductVariantLinkButton.UniqueID %>", "")
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
					<h2><%= LocalizeString("VariantHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="ProductVariantIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
					<div class="row rvdsf-actionbar-container">
                        <div class="col-sm-6">
							<asp:LinkButton ID="DuplicateLinkButton" runat="server" CssClass="btn btn-link" OnClick="DuplicateLinkButton_Click" CausesValidation="False"><em class="glyphicon glyphicon-duplicate"></em> <%= LocalizeString("DuplicateLink") %></asp:LinkButton>
							<asp:HyperLink ID="PreviewHyperLink" runat="server" CssClass="btn btn-link rvdPreviewAction" Target="_blank" ><em class="glyphicon glyphicon-eye-open fa fas fa-eye"></em> <%= LocalizeString("PreviewLink") %></asp:HyperLink>
							<asp:HyperLink ID="AddFeaturesHyperLink" runat="server" CssClass="btn btn-link" ><em class="glyphicon glyphicon-plus fa fas fa-plus"></em> <%= LocalizeString("MoreFeaturesLink") %></asp:HyperLink>
                        </div>
                        <div class="col-sm-6 text-sm-right">

                        </div>
                    </div>
					<div id="ProductVariantDetailsViewTabPanel">
						<ul class="dnnAdminTabNav dnnClear">
							<li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
								<asp:Label  ID="GeneralDetailsViewTabLabel" resourcekey="GeneralDetailsViewTabLabel" runat="server"  /></a></li>
							<li><a href="#<%= DisplayDetailsViewPanel.ClientID %>">
								<asp:Label  ID="DisplayDetailsViewTabLabel" resourcekey="DisplayDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="AvailabilityDetailsViewListItem" runat="server"><a href="#<%= AvailabilityDetailsViewPanel.ClientID %>">
								<asp:Label  ID="AvailabilityDetailsViewTabLabel" resourcekey="AvailabilityDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="AttributeDetailsViewListItem" runat="server"><a href="#<%= AttributeDetailsViewPanel.ClientID %>">
								<asp:Label  ID="AttributeDetailsViewTabLabel" resourcekey="AttributeDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="CustomFieldDetailsViewListItem" runat="server"><a href="#<%= CustomFieldDetailsViewPanel.ClientID %>">
								<asp:Label  ID="CustomFieldDetailsViewTabLabel" resourcekey="CustomFieldDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="RecurringDetailsViewListItem" runat="server"><a href="#<%= RecurringDetailsViewPanel.ClientID %>">
								<asp:Label  ID="RecurringDetailsViewTabLabel" resourcekey="RecurringDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="BookingDetailsViewListItem" runat="server"><a href="#<%= BookingDetailsViewPanel.ClientID %>">
								<asp:Label  ID="BookingDetailsViewTabLabel" resourcekey="BookingDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="ComponentDetailsViewListItem" runat="server"><a href="#<%= ComponentDetailsViewPanel.ClientID %>">
								<asp:Label  ID="ComponentDetailsViewTabLabel" resourcekey="ComponentDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="RequiredDetailsViewListItem" runat="server"><a href="#<%= RequiredDetailsViewPanel.ClientID %>">
								<asp:Label  ID="RequiredDetailsViewTabLabel" resourcekey="RequiredDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="ActionDetailsViewListItem" runat="server"><a href="#<%= ActionDetailsViewPanel.ClientID %>">
								<asp:Label  ID="ActionDetailsViewTabLabel" resourcekey="ActionDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="RewardsPointDetailsViewListItem" runat="server"><a href="#<%= RewardsPointDetailsViewPanel.ClientID %>">
								<asp:Label  ID="RewardsPointDetailsViewTabLabel" resourcekey="RewardsPointDetailsViewTabLabel" runat="server"  /></a></li>
							<li><a href="#<%= ResourceDetailsViewPanel.ClientID %>">
								<asp:Label  ID="ResourceDetailsViewTabLabel" resourcekey="ResourceDetailsViewTabLabel" runat="server"  /></a></li>
                            <li id="SalesReturnDetailsViewListItem" runat="server"><a href="#<%= SalesReturnDetailsViewPanel.ClientID %>">
								<asp:Label  ID="ReturnDetailsViewTabLabel" resourcekey="ReturnDetailsViewTabLabel" runat="server"  /></a></li>
							<li id="ExtensionDetailsViewListItem" runat="server"><a href="#<%= ExtensionDetailsViewPanel.ClientID %>">
								<asp:Label  ID="ExtensionDetailsViewTabLabel" resourcekey="ExtensionDetailsViewTabLabel" runat="server"  /></a></li>
						</ul>
						<asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div id="GeneralDetailsViewSubPanel">
									<asp:Panel ID="ProductVariantKeyPanel" runat="server" CssClass="dnnFormItem">
										<dnn1:LabelControl ID="ProductVariantKeyLabelControl" runat="server" CssClass="dnnFormRequired" />
										<asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="ProductVariantKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
										<asp:TextBox ID="ProductVariantKeyTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
									</asp:Panel>
									<div class="dnnFormItem">
										<dnn1:LabelControl ID="NameLabelControl" runat="server"></dnn1:LabelControl>
										<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
										<asp:TextBox ID="NameTextBox" runat="server" MaxLength="100" ></asp:TextBox>
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
									<asp:Panel ID="ProductVariantOptionPanel" runat="server" CssClass="dnnFormItem">
										<dnn1:LabelControl ID="ProductVariantOptionLabelControl" runat="server"></dnn1:LabelControl>
										<asp:DropDownList ID="ProductVariantOptionDropDownList" runat="server">
										</asp:DropDownList>
									</asp:Panel>
									<h2 id="GallerySectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("GalleryHeader") %></a></h2>
									<fieldset>
										<div id="GalleryUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
										<uc1:GalleryControl ID="GalleryControl1" runat="server"></uc1:GalleryControl>
									</fieldset>
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
											<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="BasePriceTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
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
											<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="ManufacturerSKUTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
											<asp:TextBox ID="ManufacturerSKUTextBox" runat="server" MaxLength="100"></asp:TextBox>
										</asp:Panel>
										<asp:Panel ID="DistributorPanel" runat="server" CssClass="dnnFormItem">
											<dnn1:LabelControl ID="DistributorLabelControl" runat="server"></dnn1:LabelControl>
											<asp:DropDownList ID="DistributorDropDownList" runat="server" OnSelectedIndexChanged="DistributorDropDownList_SelectedIndexChanged" AutoPostBack="true">
											</asp:DropDownList>
										</asp:Panel>
										<asp:Panel ID="DistributorSKUPanel" runat="server" CssClass="dnnFormItem">
											<dnn1:LabelControl ID="DistributorSKULabelControl" runat="server"></dnn1:LabelControl>
											<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="DistributorSKUTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
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
									<asp:Panel ID="ShippingDetailsViewPanel" runat="server" >
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
											<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="MetaKeywordsTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\s\S]{0,400}$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
											<asp:TextBox ID="MetaKeywordsTextBox" runat="server" MaxLength="400" Rows="3" TextMode="MultiLine"></asp:TextBox>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="MetaDescriptionLabelControl" runat="server" />
											<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="MetaDescriptionTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\s\S]{0,400}$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
											<asp:TextBox ID="MetaDescriptionTextBox" runat="server" MaxLength="400" Rows="3" TextMode="MultiLine"></asp:TextBox>
										</div>
									</fieldset>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="DisplayDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="PublishedLabelControl" runat="server" />
									<asp:CheckBox ID="PublishedCheckBox" runat="server" Checked="True"></asp:CheckBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="StartDateLabelControl" runat="server" />
									<asp:TextBox ID="StartDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm"/>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="StopDateLabelControl" runat="server"></dnn1:LabelControl>
									<asp:TextBox ID="StopDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm"/>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="DisplayOrderLabelControl" runat="server" CssClass="dnnFormRequired"></dnn1:LabelControl>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DisplayOrderTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:RangeValidator ID="DisplayOrderRangeValidator" runat="server" ControlToValidate="DisplayOrderTextBox" MinimumValue="-2147483648" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
									<asp:TextBox ID="DisplayOrderTextBox" runat="server" value="1000" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="AllowProductComparisonLabelControl" runat="server" />
									<asp:CheckBox ID="AllowProductComparisonCheckBox" runat="server" Checked="True"></asp:CheckBox>
								</div>
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="AvailabilityDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<uc1:ProductVariantAvailabilityRuleControl ID="AvailabilityRuleControl" runat="server" Width="100%" />
							</fieldset>
						</asp:Panel>
						<asp:Panel ID="AttributeDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div id="ProductAttributeUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
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
						<asp:Panel ID="ExtensionDetailsViewPanel" runat="server" CssClass="dnnClear">
							<fieldset>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ExternalIDLabelControl" runat="server" />
									<asp:TextBox ID="ExternalIDTextBox" runat="server" MaxLength="100" />
								</div>
								<div class="dnnFormItem">
									<dnn1:LabelControl ID="ExtensionLabelControl" runat="server"></dnn1:LabelControl>
									<uc1:XmlEditorControl ID="ExtensionXmlEditor" runat="server" Width="100%" ModuleControl="ProductVariantExtension" />
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
