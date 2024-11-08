<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommunicationConfigurationEmailControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.CommunicationConfigurationEmailControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/texteditor.ascx" TagName="TextEditor" TagPrefix="dnn1" %>
<%@ Register Assembly="DotNetNuke.Web.Client" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" TagPrefix="dnn3" %>
<dnn3:DnnCssInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/lib/codemirror.css" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/lib/codemirror.js" Priority="1" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/mode/javascript/javascript.js" Priority="2" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/mode/css/css.js" Priority="3" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/mode/htmlmixed/htmlmixed.js" Priority="4" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/mode/xml/xml.js" Priority="5" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/addon/fold/foldcode.js" Priority="6"/>
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/addon/fold/foldgutter.js" Priority="7"/>
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/addon/fold/xml-fold.js" Priority="8"/>
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/addon/display/autorefresh.js" Priority="9"/>

<script type="text/javascript">
	Sys.Application.add_load(function () {

		if (typeof CodeMirror != 'undefined') {
			if (document.getElementById('<%= BodyTextBox.ClientID %>') != null) {
				CodeMirror.fromTextArea(document.getElementById('<%= BodyTextBox.ClientID %>'),
					{
						value: document.getElementById('<%= BodyTextBox.ClientID %>').value,
						lineNumbers: true,
                        mode: 'htmlmixed',
						indentUnit: 4,
						indentWithTabs: true,
						lineWrapping: false,
                        foldGutter: true,
                        gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"],
                        autoRefresh: true,
                        foldOptions: { minFoldSize: 1 }
					});
			}
		}
	})
</script>

<div class="dnnFormItem">
	<dnn1:LabelControl ID="RuleTypeLabelControl" runat="server" />
	<asp:DropDownList ID="RuleTypeDropDownList" runat="server" OnSelectedIndexChanged="RuleTypeDropDownList_SelectedIndexChanged" AutoPostBack="True">
		<asp:ListItem resourcekey="NoneLabel" Value="" />
		<asp:ListItem resourcekey="BasicLabel" Value="BasicView" />
	</asp:DropDownList>
</div>
<asp:MultiView ID="FormulaMultiView" runat="server" ActiveViewIndex="0">
	<asp:View ID="BasicView" runat="server">
        <div class="dnnFormItem">
            <span class="dnnLabel" ></span>
            <asp:LinkButton ID="ResetDefaultBasicLinkButton" runat="server" OnClick="ResetDefaultBasicLinkButton_Click" CssClass="btn btn-link rvdResetAction" CausesValidation="False" ><em class="glyphicon glyphicon-refresh fa fas fa-sync"></em> <%= LocalizeString("ResetDefaultTemplateLink") %></asp:LinkButton>
        </div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MailFromBasicLabelControl" runat="server" />
			<asp:TextBox ID="MailFromBasicTextBox" runat="server"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MailToBasicLabelControl" runat="server" />
			<asp:TextBox ID="MailToBasicTextBox" runat="server"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MailBccBasicLabelControl" runat="server" />
			<asp:TextBox ID="MailBccBasicTextBox" runat="server"></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="SubjectBasicLabelControl" runat="server" CssClass="dnnFormRequired"/>
			<asp:RequiredFieldValidator ID="SubjectBasicRequiredFieldValidator" runat="server" ControlToValidate="SubjectBasicTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			<asp:TextBox ID="SubjectBasicTextBox" runat="server" CssClass="dnnFormRequired"></asp:TextBox>
		</div>
		<fieldset>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="HtmlBodyBasicLabelControl" runat="server" />
			</div>
		</fieldset>
		<asp:TextBox ID="BodyTextBox" runat="server" TextMode="MultiLine" Rows="30" style="width: 100%; max-width: none"></asp:TextBox>
	</asp:View>
</asp:MultiView>
