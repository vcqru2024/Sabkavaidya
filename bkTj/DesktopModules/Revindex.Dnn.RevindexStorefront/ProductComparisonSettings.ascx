<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductComparisonSettings.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductComparisonSettings" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<div>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="OverrideDisplayTemplateLabelControl" runat="server" Text="Display template" HelpText="Select a custom display template to associate to this module instance. This setting will override any configured template at configuration level. Leave blank to use the default configured template."/>
			<uc1:DisplayTemplateDropDownListControl ID="DisplayTemplateDropDownList" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="DefaultControlLabelControl" runat="server" Text="Default" />
			<asp:CheckBox ID="DefaultControlCheckBox" runat="server" />
		</div>
	</fieldset>
</div>
