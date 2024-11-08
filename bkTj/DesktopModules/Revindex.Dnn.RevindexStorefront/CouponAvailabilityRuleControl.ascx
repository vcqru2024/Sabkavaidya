<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CouponAvailabilityRuleControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.CouponAvailabilityRuleControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="DotNetNuke.Web.Client" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" TagPrefix="dnn3" %>
<%@ Register Src="WebUserControls/FormulaEditorControl.ascx" TagName="FormulaEditorControl" TagPrefix="uc1" %>
<%@ Register Src="CategoryCheckBoxListControl.ascx" TagName="CategoryCheckBoxListControl" TagPrefix="uc1" %>

<script type="text/javascript">	
    // Bind Kendo UI
	Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))
    })
</script>
<dnn3:DnnCssInclude runat="server" FilePath="../_default/WebControlSkin/Default/ComboBox.Default.css" PathNameAlias="SkinPath" />
<div class="dnnFormItem">
	<dnn1:LabelControl ID="RuleTypeLabelControl" runat="server" />
	<asp:DropDownList ID="RuleTypeDropDownList" runat="server" OnSelectedIndexChanged="RuleTypeDropDownList_SelectedIndexChanged" AutoPostBack="True">
		<asp:ListItem resourcekey="NoneLabel" Value=""></asp:ListItem>
		<asp:ListItem resourcekey="BasicLabel" Value="BasicAvailabilityView"></asp:ListItem>
		<asp:ListItem resourcekey="CustomRuleLabel" Value="CustomRuleView"></asp:ListItem>
	</asp:DropDownList>
</div>
<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="BasicAvailabilityView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MaxUserUsageBasicAvailabilityLabelControl" runat="server" />
			<asp:RangeValidator ID="MaxUserUsageBasicAvailabilityRangeValidator" runat="server" ControlToValidate="MaxUserUsageBasicAvailabilityTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:TextBox ID="MaxUserUsageBasicAvailabilityTextBox" runat="server" value="" TextMode="Number" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CouponBehaviorBasicAvailabilityLabelControl" runat="server" />
			<asp:RadioButtonList ID="CouponBehaviorBasicAvailabilityRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem resourcekey="AllowAllExceptSelectedBelowLabel" Value="exclusion" Selected="True" />
				<asp:ListItem resourcekey="AllowOnlyThoseSelectedBelowLabel" Value="inclusion" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CouponInclusionBasicAvailabilityLabelControl" runat="server" />
			<asp:Panel ID="CouponInclusionBasicAvailabilityPanel" runat="server" Height="250px" ScrollBars="Auto">
				<asp:CheckBoxList ID="CouponInclusionBasicAvailabilityCheckBoxList" runat="server" RepeatLayout="Flow" CssClass="rvdFormCheckBoxes">
				</asp:CheckBoxList>
			</asp:Panel>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductVariantBehaviorBasicAvailabilityLabelControl" runat="server" />
			<asp:RadioButtonList ID="ProductVariantBehaviorBasicAvailabilityRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem resourcekey="AllowAllExceptListedBelowLabel" Value="exclusion" Selected="True" />
				<asp:ListItem resourcekey="AllowOnlyThoseListedBelowLabel" Value="inclusion" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ProductVariantInclusionBasicAvailabilityLabelControl" runat="server"/>
			<div class="rvdFormSubContainer">
				<asp:TextBox ID="ProductVariantInclusionBasicAvailabilityTextBox" runat="server" style="width:100%" data-role="combobox" data-clear-button="true" data-text-field="TextField" data-value-field="ProductVariantID" 
                    data-source="{
						serverFiltering: true,
						serverPaging: true,
						pageSize: 50,
						transport: {
							read: {
								type: 'POST',
								url: function () { return servicesFramework.getServiceRoot('Revindex.Dnn.RevindexStorefront') + 'ProductVariant/Lookup' },
								beforeSend: servicesFramework.setModuleHeaders,
								dataType: 'json',
								contentType: 'application/json; charset=UTF-8',
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
								var res = JSON.decycle(response)
								res = res.map(function (v) { v.TextField = v.Product.Name + (v.Name ? ' - ' + v.Name : '') + ' ' + (v.SKU ? v.SKU : ''); return v; })
								return res
							}
						},
						sort: [{ field: 'TextField', dir: 'asc' }]
					}" 
                    data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="ProductVariantInclusionBasicAvailabilityTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
				<asp:CheckBoxList ID="ProductVariantInclusionBasicAvailabilityCheckBoxList" runat="server" CssClass="rvd-form-checklist" OnSelectedIndexChanged="ProductVariantInclusionBasicAvailabilityCheckBoxList_SelectedIndexChanged" AutoPostBack="True"></asp:CheckBoxList>
			</div>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CategoryBehaviorBasicAvailabilityLabelControl" runat="server" />
			<asp:RadioButtonList ID="CategoryBehaviorBasicAvailabilityRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem resourcekey="AllowAllExceptSelectedBelowLabel" Value="exclusion" Selected="True" />
				<asp:ListItem resourcekey="AllowOnlyThoseSelectedBelowLabel" Value="inclusion" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CategoryInclusionBasicAvailabilityLabelControl" runat="server"/>
			<uc1:CategoryCheckBoxListControl ID="CategoryInclusionBasicAvailabilityCheckBoxListControl1" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="RoleBehaviorBasicAvailabilityLabelControl" runat="server" />
			<asp:RadioButtonList ID="RoleBehaviorBasicAvailabilityRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem resourcekey="AllowAllExceptSelectedBelowLabel" Value="exclusion" Selected="True" />
				<asp:ListItem resourcekey="AllowOnlyThoseSelectedBelowLabel" Value="inclusion" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RoleBasicAvailabilityLabelControl" runat="server" />
			<div class="rvd-form-checkboxes">
				<asp:CheckBoxList ID="RoleBasicAvailabilityCheckBoxList" runat="server" CssClass="rvdFormCheckBoxes" >
				</asp:CheckBoxList>
			</div>
		</div>
	</asp:View>
	<asp:View ID="CustomRuleView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="AvailabilityRuleLabelControl" runat="server" />
			<uc1:FormulaEditorControl ID="AvailabilityRuleFormulaEditor" runat="server" Width="100%" ModuleControl="CouponAvailability" />
		</div>
	</asp:View>
</asp:MultiView>
