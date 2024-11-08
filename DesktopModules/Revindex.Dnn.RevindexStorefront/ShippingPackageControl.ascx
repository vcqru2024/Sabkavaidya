<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShippingPackageControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ShippingPackageControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>

<div class="rvdFormSubContainer">
	<asp:MultiView ID="ContentMultiView" runat="server">
		<asp:View ID="ListView" runat="server">
			<asp:Panel ID="ShippingPackagePanel" runat="server" ></asp:Panel>
			<asp:HiddenField ID="ShippingPackageTargetValueHiddenField" runat="server" />
			<asp:HiddenField ID="ShippingPackageSourceValueHiddenField" runat="server" />
			<asp:HiddenField ID="ShippingPackageDestinationValueHiddenField" runat="server" />
			<asp:LinkButton ID="ShippingPackageSelectedLinkButton" runat="server" OnClick="ShippingPackageSelectedLinkButton_Click" style="display:none" CausesValidation="false"></asp:LinkButton>
			<asp:LinkButton ID="ShippingPackageDroppedLinkButton" runat="server" OnClick="ShippingPackageDroppedLinkButton_Click" style="display:none" CausesValidation="false"></asp:LinkButton>
			<script>
                Sys.Application.add_load(function () {
                    var rvdsfShippingPackageTreeView = $("#<%= ShippingPackagePanel.ClientID %>").kendoTreeView({
						checkboxes: false,
                        dragAndDrop: true,
                        dataSource: new kendo.data.HierarchicalDataSource({
                            data: $("#<%= ShippingPackagePanel.ClientID %>").data("source")
						}),
                        select: function (e) {
                            $("#<%= ShippingPackageTargetValueHiddenField.ClientID %>").val(rvdsfShippingPackageTreeView.data("kendoTreeView").dataItem(e.node).value)
                            __doPostBack('<%= ShippingPackageSelectedLinkButton.ClientID.Replace("_", "$") %>', "")
						},
						drop: function (e) {
							// Allow drop only if the destination node is a package type
                            if (this.dataSource.getByUid($(e.destinationNode).data("uid")).Attributes.Type == "ShippingPackage") {
								$("#<%= ShippingPackageSourceValueHiddenField.ClientID %>").val(this.dataSource.getByUid($(e.sourceNode).data("uid")).value)
								$("#<%= ShippingPackageDestinationValueHiddenField.ClientID %>").val(this.dataSource.getByUid($(e.destinationNode).data("uid")).value)
								__doPostBack('<%= ShippingPackageDroppedLinkButton.ClientID.Replace("_", "$") %>', "")
							}
							else
								e.setValid(false)	
						}
                    })
                })
            </script>
			<div class="text-right dnnClear">
				<asp:LinkButton ID="AddShippingPackageLinkButton" runat="server" CssClass="btn btn-primary rvdAddNewAction" resourcekey="AddShippingPackageLinkButton" OnClick="AddShippingPackageLinkButton_Click" ValidationGroup="ShippingPackageDetailsViewControl" CausesValidation="False"></asp:LinkButton>
			</div>
		</asp:View>
		<asp:View ID="ShippingPackageDetailsView" runat="server">
			<asp:HiddenField ID="GuidShippingPackageHiddenField" runat="server" />
			<asp:HiddenField ID="InternalDepthShippingPackageHiddenField" runat="server" />
			<asp:HiddenField ID="InternalWidthShippingPackageHiddenField" runat="server" />
			<asp:HiddenField ID="InternalHeightShippingPackageHiddenField" runat="server" />
			<asp:HiddenField ID="MaxQuantityCapacityShippingPackageHiddenField" runat="server" />
			<asp:HiddenField ID="MaxWeightCapacityShippingPackageHiddenField" runat="server" />
			<asp:Panel ID="CopyPackagePanel" runat="server" CssClass ="dnnFormItem">
				<dnn1:LabelControl ID="CopyPackageLabelControl" runat="server" Text="" />
				<asp:DropDownList ID="CopyPackageDropDownList" runat="server" CssClass="rvdsf-btn-select" OnSelectedIndexChanged="CopyPackageDropDownList_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
			</asp:Panel>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="NameShippingPackageLabelControl" runat="server" />
				<asp:TextBox ID="NameShippingPackageTextBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="PackageTypeShippingPackageLabelControl" runat="server" />
				<asp:DropDownList ID="PackageTypeShippingPackageDropDownList" runat="server">
					<asp:ListItem resourcekey="BagLabel" Value="3000"></asp:ListItem>
					<asp:ListItem resourcekey="BoxLabel" Value="2000"></asp:ListItem>
					<asp:ListItem resourcekey="EnvelopeLabel" Value="1000"></asp:ListItem>
					<asp:ListItem resourcekey="PalletLabel" Value="5000"></asp:ListItem>
					<asp:ListItem resourcekey="TubeLabel" Value="4000"></asp:ListItem>
					<asp:ListItem resourcekey="UnspecifiedLabel" Value="1"></asp:ListItem>
				</asp:DropDownList>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="WidthShippingPackageLabelControl" runat="server" CssClass="dnnFormRequired" />
				<asp:RequiredFieldValidator ID="WidthShippingPackageRequiredFieldValidator" runat="server" ControlToValidate="WidthShippingPackageTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
				<asp:RangeValidator ID="WidthShippingPackageRangeValidator" runat="server" ControlToValidate="WidthShippingPackageTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
				<asp:CompareValidator ID="WidthShippingPackageCompareValidator" runat="server" ControlToValidate="WidthShippingPackageTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
				<asp:TextBox ID="WidthShippingPackageTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="HeightShippingPackageLabelControl" runat="server" CssClass="dnnFormRequired" />
				<asp:RequiredFieldValidator ID="HeightShippingPackageRequiredFieldValidator" runat="server" ControlToValidate="HeightShippingPackageTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
				<asp:RangeValidator ID="HeightShippingPackageRangeValidator" runat="server" ControlToValidate="HeightShippingPackageTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
				<asp:CompareValidator ID="HeightShippingPackageCompareValidator" runat="server" ControlToValidate="HeightShippingPackageTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
				<asp:TextBox ID="HeightShippingPackageTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="DepthShippingPackageLabelControl" runat="server" CssClass="dnnFormRequired" />
				<asp:RequiredFieldValidator ID="DepthShippingPackageRequiredFieldValidator" runat="server" ControlToValidate="DepthShippingPackageTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
				<asp:RangeValidator ID="DepthShippingPackageRangeValidator" runat="server" ControlToValidate="DepthShippingPackageTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
				<asp:CompareValidator ID="DepthShippingPackageCompareValidator" runat="server" ControlToValidate="DepthShippingPackageTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
				<asp:TextBox ID="DepthShippingPackageTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="WeightShippingPackageLabelControl" runat="server" CssClass="dnnFormRequired" />
				<asp:RequiredFieldValidator ID="WeightShippingPackageRequiredFieldValidator" runat="server" ControlToValidate="WeightShippingPackageTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
				<asp:RangeValidator ID="WeightShippingPackageRangeValidator" runat="server" ControlToValidate="WeightShippingPackageTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
				<asp:CompareValidator ID="WeightShippingPackageCompareValidator" runat="server" ControlToValidate="WeightShippingPackageTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
				<asp:TextBox ID="WeightShippingPackageTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="InsurredAmountShippingPackageLabelControl" runat="server" CssClass="dnnFormRequired" />
				<asp:RequiredFieldValidator ID="InsurredAmountShippingPackageRequiredFieldValidator" runat="server" ControlToValidate="InsurredAmountShippingPackageTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
				<asp:RangeValidator ID="InsurredAmountShippingPackageRangeValidator" runat="server" ControlToValidate="InsurredAmountShippingPackageTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
				<asp:CompareValidator ID="InsurredAmountShippingPackageCompareValidator" runat="server" ControlToValidate="InsurredAmountShippingPackageTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
				<asp:TextBox ID="InsurredAmountShippingPackageTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ShippingCodeShippingPackageLabelControl" runat="server" />
				<asp:TextBox ID="ShippingCodeShippingPackageTextBox" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="QuantityShippingPackageLabelControl" runat="server" />
				<asp:Label ID="QuantityShippingPackageLabel" runat="server" />
				<asp:LinkButton ID="AddShippingItemLinkButton" runat="server" CssClass="btn btn-link rvdAddNewAction" resourcekey="AddShippingItemLinkButton" OnClick="AddShippingItemLinkButton_Click" ValidationGroup="ShippingPackageDetailsViewControl" CausesValidation="False"></asp:LinkButton>
			</div>
			<div class="text-right">
				<asp:LinkButton ID="CancelShippingPackageButton" runat="server" CssClass="btn btn-default btn-light rvdCancelAction" resourcekey="CancelShippingPackageButton" OnClick="CancelShippingPackageButton_Click" CausesValidation="False"></asp:LinkButton>
				<asp:LinkButton ID="DeleteShippingPackageLinkButton" runat="server" CausesValidation="false" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" CssClass="btn btn-default btn-light rvdDeleteAction" OnClick="DeleteShippingPackageLinkButton_Click" resourcekey="DeleteShippingPackageLinkButton"></asp:LinkButton>
				<asp:LinkButton ID="SaveShippingPackageButton" runat="server" CssClass="btn btn-primary rvdSaveAction" resourcekey="SaveShippingPackageButton" OnClick="SaveShippingPackageButton_Click" ValidationGroup="ShippingPackageDetailsViewControl"></asp:LinkButton>				
			</div>
		</asp:View>
		<asp:View ID="ShippingItemDetailsView" runat="server">
			<asp:HiddenField ID="GuidShippingItemHiddenField" runat="server" />
			<asp:HiddenField ID="ParentGuidShippingItemHiddenField" runat="server" />
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="SalesOrderDetailIDShippingItemLabelControl" runat="server" />
				<asp:DropDownList ID="SalesOrderDetailIDShippingItemDropDownList" runat="server" OnSelectedIndexChanged="SalesOrderDetailIDShippingItemDropDownList_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="QuantityShippingItemLabelControl" runat="server" CssClass="dnnFormRequired" />
				<asp:RequiredFieldValidator ID="QuantityShippingItemRequiredFieldValidator" runat="server" ControlToValidate="QuantityShippingItemTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
				<asp:RangeValidator ID="QuantityShippingItemRangeValidator" runat="server" ControlToValidate="QuantityShippingItemTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
				<asp:CompareValidator ID="QuantityShippingItemCompareValidator" runat="server" ControlToValidate="QuantityShippingItemTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
				<asp:TextBox ID="QuantityShippingItemTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="InsurredAmountShippingItemLabelControl" runat="server" CssClass="dnnFormRequired" />
				<asp:RequiredFieldValidator ID="InsurredAmountShippingItemRequiredFieldValidator" runat="server" ControlToValidate="InsurredAmountShippingItemTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
				<asp:RangeValidator ID="InsurredAmountShippingItemRangeValidator" runat="server" ControlToValidate="InsurredAmountShippingItemTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
				<asp:CompareValidator ID="InsurredAmountShippingItemCompareValidator" runat="server" ControlToValidate="InsurredAmountShippingItemTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="ShippingPackageDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
				<asp:TextBox ID="InsurredAmountShippingItemTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="WidthShippingItemLabelControl" runat="server" />
				<asp:Label ID="WidthShippingItemLabel" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="HeightShippingItemLabelControl" runat="server" />
				<asp:Label ID="HeightShippingItemLabel" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="DepthShippingItemLabelControl" runat="server" />
				<asp:Label ID="DepthShippingItemLabel" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="WeightShippingItemLabelControl" runat="server" />
				<asp:Label ID="WeightShippingItemLabel" runat="server" />
			</div>
			<div class="text-right">
				<asp:LinkButton ID="CancelShippingItemButton" runat="server" CssClass="btn btn-default btn-light rvdCancelAction" resourcekey="CancelShippingItemButton" OnClick="CancelShippingItemButton_Click" CausesValidation="False"></asp:LinkButton>
				<asp:LinkButton ID="DeleteShippingItemLinkButton" runat="server" CausesValidation="false" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" CssClass="btn btn-default btn-light rvdDeleteAction" OnClick="DeleteShippingItemLinkButton_Click" resourcekey="DeleteShippingItemLinkButton"></asp:LinkButton>
				<asp:LinkButton ID="SaveShippingItemButton" runat="server" CssClass="btn btn-primary rvdSaveAction" resourcekey="SaveShippingItemButton" OnClick="SaveShippingItemButton_Click" ValidationGroup="ShippingPackageDetailsViewControl"></asp:LinkButton>
			</div>
		</asp:View>
	</asp:MultiView>
</div>
