<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductChannelControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductChannelControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/texteditor.ascx" TagName="TextEditor" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
    
<script type="text/javascript">
	Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))

		$('#ProductChannelDetailsViewPanel').dnnPanels()
	})

	// Handle eBay category treeview
    Sys.Application.add_load(function () {
        var rvdsfEBayCategoryTreeView = $("#<%= EBayCategoryPanel.ClientID %>").kendoTreeView({
            checkboxes: false,
            dataSource: new kendo.data.HierarchicalDataSource({
                data: $("#<%= EBayCategoryPanel.ClientID %>").data("source")
                }),
                collapse: function (e) {
                    $("#<%= EBayCategoryTargetValueHiddenField.ClientID %>").val(rvdsfEBayCategoryTreeView.data("kendoTreeView").dataItem(e.node).value)
                    __doPostBack('<%= EBayCategoryCollapsedLinkButton.ClientID.Replace("_", "$") %>', "")
                },
                expand: function (e) {
                    $("#<%= EBayCategoryTargetValueHiddenField.ClientID %>").val(rvdsfEBayCategoryTreeView.data("kendoTreeView").dataItem(e.node).value)
                    __doPostBack('<%= EBayCategoryExpandedLinkButton.ClientID.Replace("_", "$") %>', "")
                },
                template: (e) => {
                    return e.item.checkable ? "<input type='checkbox' name='check" + e.item.value + "' value='" + e.item.value + "' " + (e.item.checked ? "checked" : "") + " onclick='rvdsfEBayCategory_Checked(this)' /> " + e.item.text : e.item.text;
                }
            })
    })

    function rvdsfEBayCategory_Checked(e) {
        $("#<%= EBayCategoryTargetValueHiddenField.ClientID %>").val($(e).val())
        $("#<%= EBayCategoryCheckedHiddenField.ClientID %>").val($(e).is(':checked'))
        __doPostBack('<%= EBayCategoryCheckedLinkButton.ClientID.Replace("_", "$") %>', "")
	}


	// Handle Facebook category treeview
    Sys.Application.add_load(function () {
        var rvdsfFacebookCategoryTreeView = $("#<%= FacebookCategoryPanel.ClientID %>").kendoTreeView({
            checkboxes: false,
            dataSource: new kendo.data.HierarchicalDataSource({
                data: $("#<%= FacebookCategoryPanel.ClientID %>").data("source")
                }),
                collapse: function (e) {
                    $("#<%= FacebookCategoryTargetValueHiddenField.ClientID %>").val(rvdsfFacebookCategoryTreeView.data("kendoTreeView").dataItem(e.node).value)
                    __doPostBack('<%= FacebookCategoryCollapsedLinkButton.ClientID.Replace("_", "$") %>', "")
                },
                expand: function (e) {
                    $("#<%= FacebookCategoryTargetValueHiddenField.ClientID %>").val(rvdsfFacebookCategoryTreeView.data("kendoTreeView").dataItem(e.node).value)
					__doPostBack('<%= FacebookCategoryExpandedLinkButton.ClientID.Replace("_", "$") %>', "")
				},
				template: (e) => {
					return e.item.checkable ? "<input type='checkbox' name='check" + e.item.value + "' value='" + e.item.value + "' " + (e.item.checked ? "checked" : "") + " onclick='rvdsfFacebookCategory_Checked(this)' /> " + e.item.text : e.item.text;
				}
			})
	})

	function rvdsfFacebookCategory_Checked(e) {
		$("#<%= FacebookCategoryTargetValueHiddenField.ClientID %>").val($(e).val())
		$("#<%= FacebookCategoryCheckedHiddenField.ClientID %>").val($(e).is(':checked'))
        __doPostBack('<%= FacebookCategoryCheckedLinkButton.ClientID.Replace("_", "$") %>', "")
    }
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
								<asp:HyperLink ID="AddHyperLink" runat="server" resourcekey="AddHyperLink" CssClass="btn btn-primary rvdAddNewAction" />
							</div>
						</div>
						<asp:GridView ID="ProductChannelGridView" runat="server" AllowSorting="True" DataKeyNames="ProductChannelID" AutoGenerateColumns="False" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="True" OnRowDeleting="ProductChannelGridView_RowDeleting" OnRowDataBound="ProductChannelGridView_RowDataBound">
							<PagerStyle CssClass="dnnGridPager" />
							<Columns>
								<asp:TemplateField HeaderText="Provider" SortExpression="ChannelProvider">
									<ItemTemplate>
										<asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" Text='<%# Eval("ChannelProvider") %>'/>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField DataField="ExternalID" HeaderText="ExternalID" SortExpression="ExternalID" />
								<asp:BoundField DataField="ProductVariantID" HeaderText="Variant" SortExpression="ProductVariantID" />
								<asp:BoundField DataField="CreateDate" HeaderText="Date" SortExpression="CreateDate"  HeaderStyle-Width="10%"/>
								<asp:TemplateField HeaderStyle-Width="5%">
									<ItemTemplate>
										<asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" CausesValidation="false" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>
						<asp:ObjectDataSource ID="ProductChannelObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCount" SelectMethod="GetAll" SortParameterName="sortExpression" TypeName="Revindex.Business.Revindex.Revindex.Storefront.ProductChannelController">
							<SelectParameters>
								<asp:Parameter Name="sortExpression" Type="String" />
								<asp:Parameter Name="maximumRows" Type="Int32" />
								<asp:Parameter Name="startRowIndex" Type="Int32" />
								<rvd1:UserControlParameter Name="portalID" PropertyName="PortalId" Type="Int32" />
								<rvd1:UserControlParameter Name="productID" PropertyName="ProductID" Type="Int32" />
							</SelectParameters>
						</asp:ObjectDataSource>
					</div>
				</asp:View>
				<asp:View ID="DetailsView" runat="server">
					<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
					<h2><%= LocalizeString("ChannelHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="ProductChannelIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
					<div id="ProductChannelDetailsViewPanel">
						<hr />
						<fieldset>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="ExternalIDLabelControl" runat="server" />
								<asp:Label ID="ExternalIDLabel" runat="server"></asp:Label>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="CreateDateLabelControl" runat="server" />
								<asp:Label ID="CreateDateLabel" runat="server"></asp:Label>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="ChannelProviderLabelControl" runat="server" />
								<asp:DropDownList ID="ChannelProviderDropDownList" runat="server" OnSelectedIndexChanged="ChannelProviderDropDownList_SelectedIndexChanged" AutoPostBack="True">
									<asp:ListItem Text="eBay Canada" Value="eBayCA" />
									<asp:ListItem Text="eBay U.S" Value="eBayUS" Selected="False"/>
									<asp:ListItem Text="Facebook" Value="Facebook" Selected="True"/>
								</asp:DropDownList>
							</div>
						</fieldset>
							<asp:MultiView ID="ChannelProviderMultiView" runat="server" ActiveViewIndex="1">
								<asp:View ID="EBayView" runat="server">
									<h2 id="EBayProductSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("ProductHeader") %></a></h2>
									<fieldset>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="EBayProductVariantLabelControl" runat="server" />
											<asp:DropDownList ID="EBayProductVariantDropDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="EBayProductVariantDropDownList_SelectedIndexChanged">
											</asp:DropDownList>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="EBayTitleLabelControl" runat="server" CssClass="dnnFormRequired" />
											<asp:RequiredFieldValidator ID="EBayTitleRequiredFieldValidator" runat="server" ControlToValidate="EBayTitleTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
											<asp:TextBox ID="EBayTitleTextBox" runat="server"></asp:TextBox>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="EBayDescriptionLabelControl" runat="server" />
											<dnn1:TextEditor ID="EBayDescriptionTextEditor" runat="server" ChooseRender="False" ChooseMode="False" DefaultMode="RICH" HtmlEncode="False" Width="100%" Height="460px" Mode="RICH" />
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="EBayCategoryLabelControl" runat="server" CssClass="dnnFormRequired" />
											<asp:Panel ID="EBayCategoryPanel" runat="server" ></asp:Panel>
												<asp:HiddenField ID="EBayCategoryTargetValueHiddenField" runat="server" />
												<asp:HiddenField ID="EBayCategoryCheckedHiddenField" runat="server" />
												<asp:LinkButton ID="EBayCategoryExpandedLinkButton" runat="server" OnClick="EBayCategoryExpandedLinkButton_Click" style="display:none" CausesValidation="false"></asp:LinkButton>
												<asp:LinkButton ID="EBayCategoryCollapsedLinkButton" runat="server" OnClick="EBayCategoryCollapsedLinkButton_Click" style="display:none" CausesValidation="false"></asp:LinkButton>
												<asp:LinkButton ID="EBayCategoryCheckedLinkButton" runat="server" OnClick="EBayCategoryCheckedLinkButton_Click" style="display:none" CausesValidation="false"></asp:LinkButton>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="EBayQuantityLabelControl" runat="server" CssClass="dnnFormRequired" />
											<asp:RequiredFieldValidator ID="EBayQuantityRequiredFieldValidator" runat="server" ControlToValidate="EBayQuantityTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
											<asp:RangeValidator ID="EBayQuantityRangeValidator" runat="server" ControlToValidate="EBayQuantityTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
											<asp:CompareValidator ID="EBayQuantityCompareValidator" runat="server" ControlToValidate="EBayQuantityTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
											<asp:TextBox ID="EBayQuantityTextBox" runat="server" value="1" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="EBayListingTypeLabelControl" runat="server" />
											<asp:DropDownList ID="EBayListingTypeDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="EBayListingTypeDropDownList_SelectedIndexChanged">
												<asp:ListItem Text="Auction" Value="2" />
												<asp:ListItem Text="Fixed" Value="1" Selected="true" />
											</asp:DropDownList>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="EBayPriceLabelControl" runat="server" CssClass="dnnFormRequired"></dnn1:LabelControl>
											<asp:RequiredFieldValidator ID="EBayPriceRequiredFieldValidator" runat="server" ControlToValidate="EBayPriceTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
											<asp:RangeValidator ID="EBayPriceRangeValidator" runat="server" ControlToValidate="EBayPriceTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
											<asp:CompareValidator ID="EBayPriceCompareValidator" runat="server" ControlToValidate="EBayPriceTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
											<asp:TextBox ID="EBayPriceTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
										</div>
										<asp:Panel ID="EBayAuctionPricePanel" runat="server">
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="EBayStartPriceLabelControl" runat="server" CssClass="dnnFormRequired"></dnn1:LabelControl>
												<asp:RequiredFieldValidator ID="EBayStartPriceRequiredFieldValidator" runat="server" ControlToValidate="EBayStartPriceTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
												<asp:RangeValidator ID="EBayStartPriceRangeValidator" runat="server" ControlToValidate="EBayStartPriceTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
												<asp:CompareValidator ID="EBayStartPriceCompareValidator" runat="server" ControlToValidate="EBayStartPriceTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
												<asp:TextBox ID="EBayStartPriceTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
											</div>
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="EBayReservePriceLabelControl" runat="server"></dnn1:LabelControl>
												<asp:RangeValidator ID="EBayReservePriceRangeValidator" runat="server" ControlToValidate="EBayReservePriceTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
												<asp:CompareValidator ID="EBayReservePriceCompareValidator" runat="server" ControlToValidate="EBayReservePriceTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
												<asp:TextBox ID="EBayReservePriceTextBox" runat="server" value="" CssClass="rvd-form-number" ></asp:TextBox>
											</div>
										</asp:Panel>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="EBayConditionLabelControl" runat="server" />
											<asp:DropDownList ID="EBayConditionDropDownList" runat="server">
												<asp:ListItem Text="New" Value="1" Selected="true" />
												<asp:ListItem Text="Refurbished" Value="2" />
												<asp:ListItem Text="Used" Value="3" />
												<asp:ListItem Text="VeryGood" Value="4" />
												<asp:ListItem Text="Good" Value="5" />
												<asp:ListItem Text="Acceptable" Value="6" />
												<asp:ListItem Text="Defective" Value="7" />
											</asp:DropDownList>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="EBayStartDateLabelControl" runat="server" />
											<asp:TextBox ID="EBayStartDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm"/>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="EBayStopDateLabelControl" runat="server" />
											<asp:TextBox ID="EBayStopDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm"/>
										</div>
									</fieldset>
									<h2 id="EBayShippingSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("ShippingHeader") %></a></h2>
									<fieldset>
										<p><%= LocalizeString("EBayShippingDescriptionLabel") %></p>
										<div class="rvdActions text-sm-right">
											<asp:LinkButton ID="EBayAddShippingLinkButton" runat="server" resourcekey="EBayAddShippingLinkButton" OnClick="EBayAddShippingLinkButton_Click" CssClass="btn btn-primary rvdAddNewAction" CausesValidation="false" />
										</div>
										<asp:GridView ID="EBayShippingGridView" runat="server" AllowSorting="True" DataKeyNames="ShippingMethodID" AutoGenerateColumns="False" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="True" OnSelectedIndexChanged="EBayShippingGridView_SelectedIndexChanged" OnRowDeleting="EBayShippingGridView_RowDeleting" OnRowDataBound="EBayShippingGridView_RowDataBound">
											<PagerStyle CssClass="dnnGridPager" />
											<Columns>
												<asp:TemplateField HeaderText="Name">
													<ItemTemplate>
														<asp:LinkButton ID="EBaySelectLinkButton" runat="server" Text='<%# Eval("Name") %>' CommandName="Select" OnClientClick="event.stopPropagation()" ></asp:LinkButton>
													</ItemTemplate>
												</asp:TemplateField>
												<asp:BoundField DataField="ServiceType" HeaderText="ServiceType" SortExpression="ServiceType" />
												<asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="Rate" />
												<asp:TemplateField HeaderStyle-Width="10%">
													<ItemTemplate>
														<asp:LinkButton ID="EBayDeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
													</ItemTemplate>
												</asp:TemplateField>
											</Columns>
										</asp:GridView>
										<asp:Panel ID="EBayShippingDetailsViewPanel" runat="server">
											<div class="dnnFormItem">
												<dnn1:LabelControl ID="EBayShippingNameLabelControl" runat="server" />
												<asp:DropDownList ID="EBayShippingNameDropDownList" runat="server" OnSelectedIndexChanged="EBayShippingNameDropDownList_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
											</div>
											<asp:Panel ID="EBayShippingRatePanel" runat="server" CssClass="dnnFormItem">
												<dnn1:LabelControl ID="EBayShippingRateLabelControl" runat="server" CssClass="dnnFormRequired" />
												<asp:RequiredFieldValidator ID="EBayShippingRateRequiredFieldValidator" runat="server" ControlToValidate="EBayShippingRateTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
												<asp:RangeValidator ID="EBayShippingRateRangeValidator" runat="server" ControlToValidate="EBayShippingRateTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
												<asp:CompareValidator ID="EBayShippingRateCompareValidator" runat="server" ControlToValidate="EBayShippingRateTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
												<asp:TextBox ID="EBayShippingRateTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
											</asp:Panel>
											<asp:Panel ID="EBayShippingRegionPanel" runat="server" CssClass="dnnFormItem">
												<dnn1:LabelControl ID="EBayShippingRegionLabelControl" runat="server" CssClass="dnnFormRequired" />
												<asp:CheckBoxList ID="EBayShippingRegionCheckBoxList" runat="server" RepeatLayout="Flow">
													<asp:ListItem Text="Worldwide" Value="Worldwide" />
													<asp:ListItem Text="Africa" Value="Africa" />
													<asp:ListItem Text="Americas" Value="Americas" />
													<asp:ListItem Text="Asia" Value="Asia" />
													<asp:ListItem Text="Europe" Value="Europe" />
													<asp:ListItem Text="Middle East" Value="MiddleEast" />
													<asp:ListItem Text="North America" Value="NorthAmerica" />
													<asp:ListItem Text="Oceania" Value="Oceania" />
													<asp:ListItem Text="South America" Value="SouthAmerica" />
													<asp:ListItem Text="Australia" Value="AU" />
													<asp:ListItem Text="Canada" Value="CA" />
													<asp:ListItem Text="France" Value="FR" />
													<asp:ListItem Text="Germany" Value="DE" />
													<asp:ListItem Text="Italy" Value="IT" />
													<asp:ListItem Text="Japan" Value="JP" />
													<asp:ListItem Text="Spain" Value="ES" />
													<asp:ListItem Text="United Kingdom" Value="GB" />
													<asp:ListItem Text="United States" Value="US" />
												</asp:CheckBoxList>
											</asp:Panel>
											<div class="text-sm-right">
													<asp:LinkButton ID="EBaySaveShippingLinkButton" runat="server" resourcekey="EBaySaveShippingLinkButton" CssClass="btn btn-primary rvdOKAction" OnClick="EBaySaveShippingLinkButton_Click"></asp:LinkButton></li>
													<asp:LinkButton ID="EBayCancelShippingLinkButton" runat="server" resourcekey="EBayCancelShippingLinkButton" CssClass="btn btn-default btn-light rvdCancelAction" OnClick="EBayCancelShippingLinkButton_Click"></asp:LinkButton></li>
											</div>
										</asp:Panel>
									</fieldset>
									<h2 id="EBayPaymentSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("PaymentHeader") %></a></h2>
									<fieldset>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="EBayPaymentMethodLabelControl" runat="server" CssClass="dnnFormRequired"/>
											<asp:CheckBoxList ID="EBayPaymentMethodCheckBoxList" runat="server" RepeatLayout="Flow">
												<asp:ListItem Text="Amex" Value="AmEx" Selected="true"/>
												<asp:ListItem Text="Check" Value="PersonalCheck" />
												<asp:ListItem Text="Discover" Value="Discover" Selected="True"/>
												<asp:ListItem Text="PayPal" Value="PayPal" Selected="True"/>
												<asp:ListItem Text="Visa/MasterCard" Value="VisaMC" Selected="True" />
											</asp:CheckBoxList>
										</div>							
									</fieldset>
									<h2 id="EBayReturnSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("ReturnHeader") %></a></h2>
									<fieldset>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="EBayAllowCreditLabelControl" runat="server" />
											<asp:CheckBox ID="EBayAllowCreditCheckBox" runat="server" />
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="EBayAllowExchangeLabelControl" runat="server" />
											<asp:CheckBox ID="EBayAllowExchangeCheckBox" runat="server" />
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="EBayAllowRefundLabelControl" runat="server" />
											<asp:CheckBox ID="EBayAllowRefundCheckBox" runat="server" />
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="EBayReturnPeriodLabelControl" runat="server" />
											<asp:DropDownList ID="EBayReturnPeriodDropDownList" runat="server">
												<asp:ListItem Text="14 days" Value="14" />
												<asp:ListItem Text="30 days" Value="30" Selected="True" />
												<asp:ListItem Text="60 days" Value="60" />
											</asp:DropDownList>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="EBayReturnDescriptionLabelControl" runat="server" />
											<asp:TextBox ID="EBayReturnDescriptionTextBox" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
										</div>
									</fieldset>

								</asp:View>
								<asp:View ID="FacebookView" runat="server">
									<h2 id="FacebookProductSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("ProductHeader") %></a></h2>
									<fieldset>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="FacebookProductVariantLabelControl" runat="server" />
											<asp:DropDownList ID="FacebookProductVariantDropDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="FacebookProductVariantDropDownList_SelectedIndexChanged">
											</asp:DropDownList>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="FacebookTitleLabelControl" runat="server" CssClass="dnnFormRequired" />
											<asp:RequiredFieldValidator ID="FacebookTitleRequiredFieldValidator" runat="server" ControlToValidate="FacebookTitleTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
											<asp:TextBox ID="FacebookTitleTextBox" runat="server"></asp:TextBox>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="FacebookDescriptionLabelControl" runat="server" />
											<dnn1:TextEditor ID="FacebookDescriptionTextEditor" runat="server" ChooseRender="False" ChooseMode="False" DefaultMode="RICH" HtmlEncode="False" Width="100%" Height="460px" Mode="RICH" />
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="FacebookSizeLabelControl" runat="server" />
											<asp:TextBox ID="FacebookSizeTextBox" runat="server"></asp:TextBox>
										</div>
										<div class="dnnFormItem">
											<dnn1:LabelControl ID="FacebookCategoryLabelControl" runat="server" />
											<asp:Panel ID="FacebookCategoryPanel" runat="server" ></asp:Panel>
											<asp:HiddenField ID="FacebookCategoryTargetValueHiddenField" runat="server" />
											<asp:HiddenField ID="FacebookCategoryCheckedHiddenField" runat="server" />
											<asp:LinkButton ID="FacebookCategoryExpandedLinkButton" runat="server" OnClick="FacebookCategoryExpandedLinkButton_Click" style="display:none" CausesValidation="false"></asp:LinkButton>
											<asp:LinkButton ID="FacebookCategoryCollapsedLinkButton" runat="server" OnClick="FacebookCategoryCollapsedLinkButton_Click" style="display:none" CausesValidation="false"></asp:LinkButton>
											<asp:LinkButton ID="FacebookCategoryCheckedLinkButton" runat="server" OnClick="FacebookCategoryCheckedLinkButton_Click" style="display:none" CausesValidation="false"></asp:LinkButton>
										</div>
									</fieldset>
								</asp:View>
							</asp:MultiView>
					</div>
					<div class="row rvdsf-footerbar-container">
                        <div class="col-sm-6">
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" resourcekey="DeleteLinkButton" CssClass="btn btn-default btn-light" CausesValidation="false" OnClick="DeleteLinkButton_Click" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()"></asp:LinkButton>
                        </div>
                        <div class="col-sm-6 text-sm-right">
                            <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
							<asp:LinkButton ID="SaveLinkButton" runat="server" CssClass="btn btn-primary rvdSaveAction" OnClick="SaveLinkButton_Click" resourcekey="SaveLinkButton" ValidationGroup="DetailsViewControl" />
							<asp:LinkButton ID="SaveAndBackLinkButton" runat="server" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" OnClick="SaveLinkButton_Click" resourcekey="SaveAndBackLinkButton" ValidationGroup="DetailsViewControl" />
                        </div>
                    </div>
				</asp:View>
			</asp:MultiView>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
