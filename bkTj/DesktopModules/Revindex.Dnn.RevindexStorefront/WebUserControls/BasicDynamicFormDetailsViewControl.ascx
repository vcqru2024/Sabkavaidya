<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BasicDynamicFormDetailsViewControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.WebUserControls.BasicDynamicFormDetailsViewControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="ListItemControl.ascx" TagName="ListItemControl" TagPrefix="uc1" %>

<script type="text/javascript">	
    // Bind Kendo UI
    Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))
    })
</script>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="FieldTypeBasicDynamicFormLabelControl" runat="server" />
	<asp:DropDownList ID="FieldTypeBasicDynamicFormDropDownList" runat="server" OnSelectedIndexChanged="FieldTypeBasicDynamicFormDropDownList_SelectedIndexChanged" AutoPostBack="True">
		<asp:ListItem Text="Calendar" Value="CalendarFieldTypeBasicDynamicFormView" Selected="True" />
		<asp:ListItem Text="CheckBox" Value="CheckBoxFieldTypeBasicDynamicFormView" />
		<asp:ListItem Text="CheckBoxList" Value="CheckBoxListFieldTypeBasicDynamicFormView" />
		<asp:ListItem Text="DatePicker" Value="DatePickerFieldTypeBasicDynamicFormView" />
		<asp:ListItem Text="DropDownList" Value="DropDownListFieldTypeBasicDynamicFormView" />
		<asp:ListItem Text="FileUpload" Value="FileUploadFieldTypeBasicDynamicFormView" />
        <asp:ListItem Text="Hidden" Value="HiddenFieldTypeBasicDynamicFormView" />
		<asp:ListItem Text="ListBox" Value="ListBoxFieldTypeBasicDynamicFormView" />
        <asp:ListItem Text="Literal" Value="LiteralFieldTypeBasicDynamicFormView" />
		<asp:ListItem Text="RadioButtonList" Value="RadioButtonListFieldTypeBasicDynamicFormView" />
		<asp:ListItem Text="TextBox" Value="TextBoxFieldTypeBasicDynamicFormView" />
	</asp:DropDownList>
</div>
<div class="dnnFormItem">
	<dnn1:LabelControl ID="FieldIDBasicDynamicFormLabelControl" runat="server" CssClass="dnnFormRequired" />
	<asp:RequiredFieldValidator ID="FieldIDBasicDynamicFormRequiredFieldValidator" runat="server" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ValidationGroup="FieldBasicDynamicFormDetailsViewControl" ControlToValidate="FieldIDBasicDynamicFormTextBox"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
	<asp:RegularExpressionValidator ID="FieldIDBasicDynamicFormRegularExpressionValidator" runat="server" ControlToValidate="FieldIDBasicDynamicFormTextBox" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ValidationGroup="FieldBasicDynamicFormDetailsViewControl" ValidationExpression="^[a-zA-Z][a-zA-Z0-9_]+$"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
	<asp:TextBox ID="FieldIDBasicDynamicFormTextBox" runat="server" CssClass="dnnFormRequired"></asp:TextBox>
</div>
<asp:Panel ID="InputFieldPanel" runat="server">
    <div class="dnnFormItem">
	    <dnn1:LabelControl ID="FieldLabelBasicDynamicFormLabelControl" runat="server" />
	    <asp:TextBox ID="FieldLabelBasicDynamicFormTextBox" runat="server"></asp:TextBox>
    </div>
    <div class="dnnFormItem">
	    <dnn1:LabelControl ID="FieldRequiredBasicDynamicFormLabelControl" runat="server" />
	    <asp:CheckBox ID="FieldRequiredBasicDynamicFormCheckBox" runat="server" />
    </div>
    <div class="dnnFormItem">
	    <dnn1:LabelControl ID="FieldValidatorTextBasicDynamicFormLabelControl" runat="server" />
	    <asp:TextBox ID="FieldValidatorTextBasicDynamicFormTextBox" runat="server" Text="*"></asp:TextBox>
    </div>
    <div class="dnnFormItem">
	    <dnn1:LabelControl ID="FieldInputControlWidthBasicDynamicFormLabelControl" runat="server" />
	    <asp:RegularExpressionValidator ID="FieldInputControlWidthBasicDynamicFormRegularExpressionValidator" runat="server" ControlToValidate="FieldInputControlWidthBasicDynamicFormTextBox" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ValidationGroup="FieldBasicDynamicFormDetailsViewControl" ValidationExpression="^\d+\s*(px|%){0,1}$"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
	    <asp:TextBox ID="FieldInputControlWidthBasicDynamicFormTextBox" runat="server"></asp:TextBox>
    </div>
    <div class="dnnFormItem">
	    <dnn1:LabelControl ID="FieldInputControlHeightBasicDynamicFormLabelControl" runat="server" />
	    <asp:RegularExpressionValidator ID="FieldInputControlHeightBasicDynamicFormRegularExpressionValidator" runat="server" ControlToValidate="FieldInputControlHeightBasicDynamicFormTextBox" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ValidationGroup="FieldBasicDynamicFormDetailsViewControl" ValidationExpression="^\d+\s*(px|%){0,1}$"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
	    <asp:TextBox ID="FieldInputControlHeightBasicDynamicFormTextBox" runat="server"></asp:TextBox>
    </div>
</asp:Panel>
<asp:MultiView ID="FieldTypeBasicDynamicFormDetailsViewMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="CalendarFieldTypeBasicDynamicFormView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="SelectedDateCalendarFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:TextBox ID="SelectedDateCalendarFieldTypeBasicDynamicFormTextBox" runat="server" placeholder="YYYY-MM-DD" CssClass="rvd-form-datetime" data-role="datepicker" data-format="yyyy-MM-dd" />
		</div>
	</asp:View>
	<asp:View ID="CheckBoxFieldTypeBasicDynamicFormView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="AutoPostBackCheckBoxFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:CheckBox ID="AutoPostBackCheckBoxFieldTypeBasicDynamicFormCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CausesValidationCheckBoxFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:CheckBox ID="CausesValidationCheckBoxFieldTypeBasicDynamicFormCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CheckedCheckBoxFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:CheckBox ID="CheckedCheckBoxFieldTypeBasicDynamicFormCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="TextCheckBoxFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:TextBox ID="TextCheckBoxFieldTypeBasicDynamicFormTextBox" runat="server"></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="CheckBoxListFieldTypeBasicDynamicFormView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="AutoPostBackCheckBoxListFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:CheckBox ID="AutoPostBackCheckBoxListFieldTypeBasicDynamicFormCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CausesValidationCheckBoxListFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:CheckBox ID="CausesValidationCheckBoxListFieldTypeBasicDynamicFormCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RepeatDirectionCheckBoxListFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:RadioButtonList ID="RepeatDirectionCheckBoxListFieldTypeBasicDynamicFormRadioButtonList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem Text="Horizontal" Value="Horizontal" />
				<asp:ListItem Text="Vertical" Value="Vertical" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ListItemCheckBoxListFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<uc1:ListItemControl ID="ListItemCheckBoxListFieldTypeBasicDynamicFormListItemControl" runat="server" Height="120px" AllowReorder="True" AllowDelete="True" AllowInsert="True" />
		</div>
	</asp:View>
	<asp:View ID="DatePickerFieldTypeBasicDynamicFormView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="AutoPostBackDatePickerFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:CheckBox ID="AutoPostBackDatePickerFieldTypeBasicDynamicFormCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="SelectedDateDatePickerFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:TextBox ID="SelectedDateDatePickerFieldTypeBasicDynamicFormTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datepicker" data-format="yyyy-MM-dd" />
		</div>
	</asp:View>
	<asp:View ID="DropDownListFieldTypeBasicDynamicFormView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="AutoPostBackDropDownListFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:CheckBox ID="AutoPostBackDropDownListFieldTypeBasicDynamicFormCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CausesValidationDropDownListFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:CheckBox ID="CausesValidationDropDownListFieldTypeBasicDynamicFormCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ListItemDropDownListFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<uc1:ListItemControl ID="ListItemDropDownListFieldTypeBasicDynamicFormListItemControl" runat="server" Height="120px" AllowReorder="True" AllowDelete="True" AllowInsert="True" />
		</div>
	</asp:View>
	<asp:View ID="FileUploadFieldTypeBasicDynamicFormView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="FileExtensionFileUploadFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:TextBox ID="FileExtensionFileUploadFieldTypeBasicDynamicFormTextBox" runat="server"></asp:TextBox>
		</div>
	</asp:View>
    <asp:View ID="HiddenFieldTypeBasicDynamicFormView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ValueHiddenFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:TextBox ID="ValueHiddenFieldTypeBasicDynamicFormTextBox" runat="server" Height="80px" TextMode="MultiLine"></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="ListBoxFieldTypeBasicDynamicFormView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="AutoPostBackListBoxFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:CheckBox ID="AutoPostBackListBoxFieldTypeBasicDynamicFormCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CausesValidationListBoxFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:CheckBox ID="CausesValidationListBoxFieldTypeBasicDynamicFormCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="SelectionModeListBoxFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:RadioButtonList ID="SelectionModeListBoxFieldTypeBasicDynamicFormRadioButtonList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem Text="Multiple" Value="Multiple" />
				<asp:ListItem Text="Single" Value="Single" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ListItemListBoxFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<uc1:ListItemControl ID="ListItemListBoxFieldTypeBasicDynamicFormListItemControl" runat="server" Height="120px" AllowReorder="True" AllowDelete="True" AllowInsert="True" />
		</div>
	</asp:View>
        <asp:View ID="LiteralFieldTypeBasicDynamicFormView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="TextLiteralFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:TextBox ID="TextLiteralFieldTypeBasicDynamicFormTextBox" runat="server" Height="200px" TextMode="MultiLine"></asp:TextBox>
		</div>
	</asp:View>
	<asp:View ID="RadioButtonListFieldTypeBasicDynamicFormView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="AutoPostBackRadioButtonListFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:CheckBox ID="AutoPostBackRadioButtonListFieldTypeBasicDynamicFormCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CausesValidationRadioButtonListFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:CheckBox ID="CausesValidationRadioButtonListFieldTypeBasicDynamicFormCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="RepeatDirectionRadioButtonListFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:RadioButtonList ID="RepeatDirectionRadioButtonListFieldTypeBasicDynamicFormRadioButtonList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem Text="Horizontal" Value="Horizontal" />
				<asp:ListItem Text="Vertical" Value="Vertical" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ListItemRadioButtonListFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<uc1:ListItemControl ID="ListItemRadioButtonListFieldTypeBasicDynamicFormListItemControl" runat="server" Height="120px" AllowReorder="True" AllowDelete="True" AllowInsert="True" />
		</div>
	</asp:View>
	<asp:View ID="TextBoxFieldTypeBasicDynamicFormView" runat="server">
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="AutoPostBackTextBoxFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:CheckBox ID="AutoPostBackTextBoxFieldTypeBasicDynamicFormCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CausesValidationTextBoxFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:CheckBox ID="CausesValidationTextBoxFieldTypeBasicDynamicFormCheckBox" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="TextTextBoxFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:TextBox ID="TextTextBoxFieldTypeBasicDynamicFormTextBox" runat="server" Height="80px" TextMode="MultiLine"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="TextModeTextBoxFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:RadioButtonList ID="TextModeTextBoxFieldTypeBasicDynamicFormRadioButtonList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem Text="Multiple lines" Value="MultiLine" />
				<asp:ListItem Text="Single line" Value="SingleLine" Selected="True" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="DataTypeTextBoxFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:RadioButtonList ID="DataTypeTextBoxFieldTypeBasicDynamicFormRadioButtonList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem Text="Date" Value="Date" />
				<asp:ListItem Text="Decimal" Value="Decimal" />
				<asp:ListItem Text="Integer" Value="Integer" />
				<asp:ListItem Text="String" Value="String" Selected="True" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MinimumValueTextBoxFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:TextBox ID="MinimumValueTextBoxFieldTypeBasicDynamicFormTextBox" runat="server" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MaximumValueTextBoxFieldTypeBasicDynamicFormLabelControl1" runat="server" />
			<asp:TextBox ID="MaximumValueTextBoxFieldTypeBasicDynamicFormTextBox" runat="server" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="WrapTextBoxFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:RadioButtonList ID="WrapTextBoxFieldTypeBasicDynamicFormRadioButtonList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
				<asp:ListItem Text="False" Value="False" Selected="True" />
				<asp:ListItem Text="True" Value="True" />
			</asp:RadioButtonList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MaxLengthTextBoxFieldTypeBasicDynamicFormLabelControl" runat="server" />
			<asp:RangeValidator ID="MaxLengthTextBoxFieldTypeBasicDynamicFormRangeValidator" runat="server" ControlToValidate="MaxLengthTextBoxFieldTypeBasicDynamicFormTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			<asp:CompareValidator ID="MaxLengthTextBoxFieldTypeBasicDynamicFormCompareValidator" runat="server" ControlToValidate="MaxLengthTextBoxFieldTypeBasicDynamicFormTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			<asp:TextBox ID="MaxLengthTextBoxFieldTypeBasicDynamicFormTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
		</div>
	</asp:View>
</asp:MultiView>
