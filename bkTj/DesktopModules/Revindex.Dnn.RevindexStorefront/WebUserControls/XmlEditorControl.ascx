<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="XmlEditorControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.WebUserControls.XmlEditorControl" %>
<%@ Register Assembly="DotNetNuke.Web.Client" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" TagPrefix="dnn3" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<dnn3:DnnCssInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/lib/codemirror.css" />
<dnn3:DnnCssInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/addon/fold/foldgutter.css"/>
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/lib/codemirror.js" Priority="1" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/mode/xml/xml.js" Priority="5" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/addon/fold/foldcode.js" Priority="6"/>
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/addon/fold/foldgutter.js" Priority="7"/>
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/addon/fold/xml-fold.js" Priority="8"/>
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/addon/display/autorefresh.js" Priority="9"/>

<script type="text/javascript">	
    // Bind Kendo UI
    Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))
    })
</script>
<div>
	<asp:UpdatePanel ID="EditorUpdatePanel" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:Panel runat="server" ID="XmlEditorPanel" CssClass="rvdsfFormXmlEditor">
				<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
				<ul data-role="menu" >
					<li>
						<em class="glyphicon glyphicon-file fa fas fa-file"></em><span class="hidden-xs d-none d-sm-inline"> <%= LocalizeString("TemplatesLabel") %></span>
						<ul>
							<asp:Repeater ID="TemplateFileRepeater" runat="server">
								<ItemTemplate>
									<li><asp:LinkButton ID="TemplateFileLinkButton" runat="server" OnCommand="TemplateFileLinkButton_Command" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Value") %>'><%# DataBinder.Eval(Container.DataItem, "Text") %></asp:LinkButton></li>
								</ItemTemplate>
							</asp:Repeater>
						</ul>
					</li>
					<li>
						<em class="glyphicon glyphicon-question-sign fa fas fa-question-circle"></em><span class="hidden-xs d-none d-sm-inline"> <%= LocalizeString("HelpLabel") %></span>
						<ul>
							<li><a href="http://www.w3schools.com/xml/" target="_blank">XML tutorial</a></li>
							<li><a href="https://www.revindex.com/Support/Forum" target="_blank" >Revindex forum</a></li>
						</ul>
					</li>
				</ul>
				<asp:TextBox ID="XmlTextBox" runat="server" TextMode="MultiLine" Rows="26" Width="100%" Wrap="False" ></asp:TextBox>
			</asp:Panel>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
