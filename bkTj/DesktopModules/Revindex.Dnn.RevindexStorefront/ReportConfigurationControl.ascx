<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReportConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ReportConfigurationControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="WebUserControls/BasicDynamicFormDetailsViewControl.ascx" TagName="BasicDynamicFormDetailsViewControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<%@ Register Assembly="DotNetNuke.Web.Client" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" TagPrefix="dnn3" %>
<dnn3:DnnCssInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/lib/codemirror.css" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/lib/codemirror.js" Priority="1" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/mode/javascript/javascript.js" Priority="2" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/mode/css/css.js" Priority="3" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/mode/htmlmixed/htmlmixed.js" Priority="4" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/mode/xml/xml.js" Priority="5" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/mode/sql/sql.js" Priority="6" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/addon/display/autorefresh.js" Priority="7"/>
<asp:PlaceHolder ID="PlaceHolder1" runat="server">

<script type="text/javascript">
	Sys.Application.add_load(function () {
		jQuery('#ReportConfigurationDetailsViewTabPanel').dnnTabs();

		if (typeof CodeMirror != 'undefined') {
			if (document.getElementById('<%= QueryTextBox.ClientID %>') != null) {
				CodeMirror.fromTextArea(document.getElementById('<%= QueryTextBox.ClientID %>'),
					{
						value: document.getElementById('<%= QueryTextBox.ClientID %>').value,
						lineNumbers: true,
                        mode: 'text/x-mssql',
						indentUnit: 4,
						indentWithTabs: true,
						lineWrapping: false,
						autoRefresh: true,
					});
			}
		}

		if (typeof CodeMirror != 'undefined') {
			if (document.getElementById('<%= VisualizerTextBox.ClientID %>') != null) {
				CodeMirror.fromTextArea(document.getElementById('<%= VisualizerTextBox.ClientID %>'),
					{
						value: document.getElementById('<%= VisualizerTextBox.ClientID %>').value,
						lineNumbers: true,
						mode: 'htmlmixed',
						indentUnit: 4,
						indentWithTabs: true,
						lineWrapping: false,
						autoRefresh: true,
					});
			}
		}

		if (document.getElementById('<%= ExportTextBox.ClientID %>') != null) {
			CodeMirror.fromTextArea(document.getElementById('<%= ExportTextBox.ClientID %>'),
				{
					value: document.getElementById('<%= ExportTextBox.ClientID %>').value,
					lineNumbers: true,
					mode: 'htmlmixed',
					indentUnit: 4,
					indentWithTabs: true,
					lineWrapping: false,
					autoRefresh: true,
				});
		}
	})
</script>

</asp:PlaceHolder>
<div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:PostBackTrigger ControlID="SaveLinkButton" />
            <asp:PostBackTrigger ControlID="SaveAndBackLinkButton" />
        </Triggers>
	    <ContentTemplate>
            <asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
            <asp:MultiView ID="ContentMultiView" runat="server">
                <asp:View ID="ListView" runat="server">
                    <h2><%= LocalizeString("ReportsHeader") %></h2>
                    <div class="rvdsfListContainer">
						<div class="row rvdsf-actionbar-container">
							<div class="col-sm-6">
								
							</div>
							<div class="col-sm-6 text-sm-right">
								<asp:HyperLink ID="AddHyperLink" runat="server" resourcekey="AddHyperLink" CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-ReportConfigurationDetailsViewTabPanel', '/')" />
							</div>
						</div>
			            <asp:GridView ID="ReportConfigurationGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ReportDefinitionID" OnRowDeleting="ReportConfigurationGridView_RowDeleting" OnRowDataBound="ReportConfigurationGridView_RowDataBound" OnRowCommand="ReportConfigurationGridView_RowCommand">
				            <PagerStyle CssClass="dnnGridPager" />
				            <Columns>
								<asp:TemplateField HeaderText="Name" SortExpression="Name">
									<ItemTemplate>
										<asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" Text='<%# Eval("Name") %>' />
									</ItemTemplate>
								</asp:TemplateField>
					            <asp:BoundField DataField="ReportGroup" HeaderText="ReportGroup" SortExpression="ReportGroup" />
					            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" HeaderStyle-Width="10%"/>
					            <asp:CheckBoxField DataField="Standard" HeaderText="Standard" SortExpression="Standard" HeaderStyle-Width="10%"/>
								<asp:TemplateField HeaderStyle-Width="5%">
									<ItemTemplate>
										<asp:LinkButton ID="DuplicateLinkButton" runat="server" CommandName="Duplicate" CausesValidation="false" OnClientClick="event.stopPropagation();" CommandArgument='<%# Eval("ReportDefinitionID") %>'><em class="glyphicon glyphicon-duplicate"></em></asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderStyle-Width="5%">
									<ItemTemplate>
										<asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" CausesValidation="false" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateField>
				            </Columns>
			            </asp:GridView>
			            <asp:ObjectDataSource ID="ReportConfigurationObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCount" SelectMethod="GetAll" SortParameterName="sortExpression" TypeName="Revindex.Business.Revindex.Revindex.Storefront.ReportDefinitionController">
				            <SelectParameters>
					            <asp:Parameter Name="sortExpression" Type="String" />
					            <asp:Parameter Name="maximumRows" Type="Int32" />
					            <asp:Parameter Name="startRowIndex" Type="Int32" />
					            <rvd1:UserControlParameter Name="portalID" PropertyName="PortalId" Type="Int32" />
				            </SelectParameters>
			            </asp:ObjectDataSource>
                    </div>
                </asp:View>
                <asp:View ID="DetailsView" runat="server">
                    <uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction"/>
                    <h2><%= LocalizeString("ReportHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label runat="server" ID="ReportDefinitionIDLabel" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
			        <div id="ReportConfigurationDetailsViewTabPanel">
				        <ul class="dnnAdminTabNav dnnClear">
					        <li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
						        <asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
					        <li><a href="#<%= DataSourceDetailsViewPanel.ClientID %>">
						        <asp:Label ID="DataSourceDetailsViewTabLabel" runat="server" resourcekey="DataSourceDetailsViewTabLabel" /></a></li>
					        <li><a href="#<%= ParameterDetailsViewPanel.ClientID %>">
						        <asp:Label ID="ParameterDetailsViewTabLabel" runat="server" resourcekey="ParameterDetailsViewTabLabel" /></a></li>
					        <li><a href="#<%= VisualizerDetailsViewPanel.ClientID %>">
						        <asp:Label ID="VisualizerDetailsViewTabLabel" runat="server" resourcekey="VisualizerDetailsViewTabLabel" /></a></li>
                            <li><a href="#<%= ExportDetailsViewPanel.ClientID %>">
						        <asp:Label ID="ExportDetailsViewTabLabel" runat="server" resourcekey="ExportDetailsViewTabLabel" /></a></li>
				        </ul>
				        <asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
					        <fieldset>
						        <div class="dnnFormItem">
							        <dnn1:LabelControl ID="NameLabelControl" runat="server" CssClass="dnnFormRequired" />
							        <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
							        <asp:RegularExpressionValidator ID="NameRegularExpressionValidator" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
							        <asp:TextBox ID="NameTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="100"></asp:TextBox>
						        </div>
						        <div class="dnnFormItem">
							        <dnn1:LabelControl ID="DescriptionLabelControl" runat="server" />
							        <asp:TextBox ID="DescriptionTextBox" runat="server" Rows="8" TextMode="MultiLine" MaxLength="4000"></asp:TextBox>
						        </div>
						        <div class="dnnFormItem">
							        <dnn1:LabelControl ID="ActiveLabelControl" runat="server" />
							        <asp:CheckBox ID="ActiveCheckBox" runat="server" />
						        </div>
						        <div class="dnnFormItem">
							        <dnn1:LabelControl ID="AllPortalLabelControl" runat="server" />
							        <asp:CheckBox ID="AllPortalCheckBox" runat="server" />
						        </div>
						        <div class="dnnFormItem">
							        <dnn1:LabelControl ID="ReportGroupLabelControl" runat="server" />
							        <asp:DropDownList ID="ReportGroupDropDownList" runat="server">
								        <asp:ListItem Text="Catalog" Value="1" Selected="True" />
                                        <asp:ListItem Text="Marketing" Value="3" />
								        <asp:ListItem Text="People" Value="4" />
								        <asp:ListItem Text="Sales" Value="2" />
							        </asp:DropDownList>
						        </div>
					        </fieldset>
				        </asp:Panel>
				        <asp:Panel ID="DataSourceDetailsViewPanel" runat="server" CssClass="dnnClear">
					        <fieldset>
						        <div class="dnnFormItem">
							        <dnn1:LabelControl ID="QueryLabelControl" runat="server" />
						        </div>
					        </fieldset>
							<asp:TextBox ID="QueryTextBox" runat="server" TextMode="MultiLine" Rows="30" style="width: 100%; max-width: none"></asp:TextBox>
				        </asp:Panel>
				        <asp:Panel ID="ParameterDetailsViewPanel" runat="server" CssClass="dnnClear">
					        <fieldset>
						        <div class="dnnFormItem">
							        <dnn1:LabelControl ID="ParameterLabelControl" runat="server" />
							        <div class="rvdFormSubContainer">
								        <asp:PlaceHolder ID="EditParameterMessagePlaceHolder" runat="server" />
							        </div>
							        <div class="rvdFormListBox">
										<table style="width: 100%">
											<tr>
												<td style="padding-right: 10px">
													<asp:ListBox ID="ParameterListBox" runat="server" style="width: 100%; max-width: 100%" AutoPostBack="True" OnSelectedIndexChanged="ParameterListBox_SelectedIndexChanged" Rows="8" ></asp:ListBox>
												</td>
												<td style="width: 20px; vertical-align:top">
													<asp:LinkButton ID="MoveUpParameterLinkButton" runat="server" CausesValidation="False" OnClick="MoveUpParameterLinkButton_Click" style="display: block; margin-bottom: 5px;"><em class="glyphicon glyphicon-triangle-top fa fas fa-caret-up"></em></asp:LinkButton>
													<asp:LinkButton ID="MoveDownParameterLinkButton" runat="server" CausesValidation="False" OnClick="MoveDownParameterLinkButton_Click" style="display: block; margin-bottom: 5px;"><em class="glyphicon glyphicon-triangle-bottom fa fas fa-caret-down"></em></asp:LinkButton>
													<asp:LinkButton ID="DeleteParameterLinkButton" runat="server" CausesValidation="False" OnClick="DeleteParameterLinkButton_Click" style="display: block; margin-bottom: 5px;"><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
													<asp:LinkButton  ID="AddParameterLinkButton" runat="server" CausesValidation="False"  OnClick="AddParameterLinkButton_Click" style="display: block; margin-bottom: 5px;"><em class="glyphicon glyphicon-plus fa fas fa-plus"></em></asp:LinkButton>
												</td>
											</tr>
										</table>
								        <asp:Panel ID="EditParameterPanel" runat="server">
									        <div class="dnnFormItem">
										        <dnn1:LabelControl ID="ParameterNameLabelControl" runat="server" CssClass="dnnFormRequired" />
										        <asp:RequiredFieldValidator ID="ParameterNameRequiredFieldValidator" runat="server" ControlToValidate="ParameterNameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="ParameterReportConfigurationDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
										        <asp:RegularExpressionValidator ID="ParameterNameRegularExpressionValidator" runat="server" ControlToValidate="ParameterNameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^@\w+$" ValidationGroup="ParameterReportConfigurationDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
										        <asp:TextBox ID="ParameterNameTextBox" runat="server" CssClass="dnnFormRequired"></asp:TextBox>
									        </div>
									        <div class="dnnFormItem">
										        <dnn1:LabelControl ID="ParameterDbTypeLabelControl" runat="server" />
										        <asp:DropDownList ID="ParameterDbTypeDropDownList" runat="server">
											        <asp:ListItem Text="Binary" Value="1" />
											        <asp:ListItem Text="Byte" Value="2" />
											        <asp:ListItem Text="Boolean" Value="3" />
											        <asp:ListItem Text="Currency" Value="4" />
											        <asp:ListItem Text="Date" Value="5" />
											        <asp:ListItem Text="DateTime" Value="6" />
											        <asp:ListItem Text="Decimal" Value="7" />
											        <asp:ListItem Text="Double" Value="8" />
											        <asp:ListItem Text="Guid" Value="9" />
											        <asp:ListItem Text="Int16" Value="10" />
											        <asp:ListItem Text="Int32" Value="11" />
											        <asp:ListItem Text="Int64" Value="12" />
											        <asp:ListItem Text="SByte" Value="14" />
											        <asp:ListItem Text="Single" Value="15" />
											        <asp:ListItem Text="String" Value="16" />
											        <asp:ListItem Text="Time" Value="17" />
											        <asp:ListItem Text="UInt16" Value="18" />
											        <asp:ListItem Text="UInt32" Value="19" />
											        <asp:ListItem Text="UInt64" Value="20" />
											        <asp:ListItem Text="VarNumeric" Value="21" />
											        <asp:ListItem Text="Xml" Value="25" />
										        </asp:DropDownList>
									        </div>
									        <div class="dnnFormItem">
										        <dnn1:LabelControl ID="ParameterSourceLabelControl" runat="server" />
										        <asp:DropDownList ID="ParameterSourceDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ParameterSourceDropDownList_SelectedIndexChanged">
											        <asp:ListItem Text="Control" Value="ControlParameterSourceDetailsViewView" />
											        <asp:ListItem Text="Variable" Value="VariableParameterSourceDetailsViewView" />
										        </asp:DropDownList>
									        </div>
									        <asp:MultiView ID="ParameterSourceDetailsViewMultiView" runat="server" ActiveViewIndex="0">
										        <asp:View ID="ControlParameterSourceDetailsViewView" runat="server">
											        <uc1:BasicDynamicFormDetailsViewControl id="ControlParameterSourceBasicDynamicFormDetailsViewControl" runat="server" ValidationGroup="ParameterReportConfigurationDetailsViewControl" />
										        </asp:View>
										        <asp:View ID="VariableParameterSourceDetailsViewView" runat="server">
											        <div class="dnnFormItem">
												        <dnn1:LabelControl ID="VariableNameVariableParameterLabelControl" runat="server" />
												        <asp:DropDownList ID="VariableNameVariableParameterDropDownList" runat="server">
															<asp:ListItem Text="Culture:Name" Value="Culture:Name" />
													        <asp:ListItem Text="Date:Current" Value="Date:Current" />
													        <asp:ListItem Text="Date:Now" Value="Date:Now" />
													        <asp:ListItem Text="Membership:Email" Value="Membership:Email" />
													        <asp:ListItem Text="Membership:LastActivityDate" Value="Membership:LastActivityDate" />
													        <asp:ListItem Text="Membership:LastLockoutDate" Value="Membership:LastLockoutDate" />
													        <asp:ListItem Text="Membership:LastLoginDate" Value="Membership:LastLoginDate" />
													        <asp:ListItem Text="Membership:LastPasswordChangeDate" Value="Membership:LastPasswordChangeDate" />
													        <asp:ListItem Text="Membership:Username" Value="Membership:Username" />
													        <asp:ListItem Text="Module:Alignment" Value="Module:Alignment" />
													        <asp:ListItem Text="Module:Border" Value="Module:Border" />
													        <asp:ListItem Text="Module:BusinessControllerClass" Value="Module:BusinessControllerClass" />
													        <asp:ListItem Text="Module:Color" Value="Module:Color" />
													        <asp:ListItem Text="Module:ControlTitle" Value="Module:ControlTitle" />
													        <asp:ListItem Text="Module:Description" Value="Module:Description" />
													        <asp:ListItem Text="Module:Footer" Value="Module:Footer" />
													        <asp:ListItem Text="Module:FriendlyName" Value="Module:FriendlyName" />
													        <asp:ListItem Text="Module:Header" Value="Module:Header" />
													        <asp:ListItem Text="Module:HelpUrl" Value="Module:HelpUrl" />
													        <asp:ListItem Text="Module:IconFile" Value="Module:IconFile" />
													        <asp:ListItem Text="Module:ModuleID" Value="Module:ModuleID" />
													        <asp:ListItem Text="Module:ModuleTitle" Value="Module:ModuleTitle" />
													        <asp:ListItem Text="Module:PaneName" Value="Module:PaneName" />
													        <asp:ListItem Text="Module:PortalID" Value="Module:PortalID" />
													        <asp:ListItem Text="Module:TabID" Value="Module:TabID" />
													        <asp:ListItem Text="Module:TabModuleID" Value="Module:TabModuleID" />
													        <asp:ListItem Text="Module:Version" Value="Module:Version" />
													        <asp:ListItem Text="Portal:BackgroundFile" Value="Portal:BackgroundFile" />
													        <asp:ListItem Text="Portal:Currency" Value="Portal:Currency" />
													        <asp:ListItem Text="Portal:DefaultLanguage" Value="Portal:DefaultLanguage" />
													        <asp:ListItem Text="Portal:Description" Value="Portal:Description" />
													        <asp:ListItem Text="Portal:Email" Value="Portal:Email" />
													        <asp:ListItem Text="Portal:FooterText" Value="Portal:FooterText" />
													        <asp:ListItem Text="Portal:HomeDirectory" Value="Portal:HomeDirectory" />
													        <asp:ListItem Text="Portal:Keywords" Value="Portal:Keywords" />
													        <asp:ListItem Text="Portal:LogoFile" Value="Portal:LogoFile" />
													        <asp:ListItem Text="Portal:PortalID" Value="Portal:PortalID" />
													        <asp:ListItem Text="Portal:PortalName" Value="Portal:PortalName" />
													        <asp:ListItem Text="Portal:Url" Value="Portal:Url" />
													        <asp:ListItem Text="Profile:Cell" Value="Profile:Cell" />
													        <asp:ListItem Text="Profile:City" Value="Profile:City" />
													        <asp:ListItem Text="Profile:Country" Value="Profile:Country" />
													        <asp:ListItem Text="Profile:Fax" Value="Profile:Fax" />
													        <asp:ListItem Text="Profile:FirstName" Value="Profile:FirstName" />
													        <asp:ListItem Text="Profile:IM" Value="Profile:IM" />
													        <asp:ListItem Text="Profile:LastName" Value="Profile:LastName" />
													        <asp:ListItem Text="Profile:PostalCode" Value="Profile:PostalCode" />
													        <asp:ListItem Text="Profile:PreferredLocale" Value="Profile:PreferredLocale" />
													        <asp:ListItem Text="Profile:Region" Value="Profile:Region" />
													        <asp:ListItem Text="Profile:Street" Value="Profile:Street" />
													        <asp:ListItem Text="Profile:Telephone" Value="Profile:Telephone" />
													        <asp:ListItem Text="Profile:TimeZone" Value="Profile:TimeZone" />
													        <asp:ListItem Text="Profile:Unit" Value="Profile:Unit" />
													        <asp:ListItem Text="Profile:Website" Value="Profile:Website" />
													        <asp:ListItem Text="Tab:Description" Value="Tab:Description" />
													        <asp:ListItem Text="Tab:FullUrl" Value="Tab:FullUrl" />
													        <asp:ListItem Text="Tab:IconFile" Value="Tab:IconFile" />
													        <asp:ListItem Text="Tab:Keywords" Value="Tab:Keywords" />
													        <asp:ListItem Text="Tab:PortalID" Value="Tab:PortalID" />
													        <asp:ListItem Text="Tab:TabID" Value="Tab:TabID" />
													        <asp:ListItem Text="Tab:TabName" Value="Tab:TabName" />
													        <asp:ListItem Text="Tab:TabPath" Value="Tab:TabPath" />
													        <asp:ListItem Text="Tab:Title" Value="Tab:Title" />
													        <asp:ListItem Text="Tab:Url" Value="Tab:Url" />
													        <asp:ListItem Text="Ticks:Now" Value="Ticks:Now" />
													        <asp:ListItem Text="Ticks:TicksPerDay" Value="Ticks:TicksPerDay" />
													        <asp:ListItem Text="Ticks:Today" Value="Ticks:Today" />
													        <asp:ListItem Text="User:DisplayName" Value="User:DisplayName" />
													        <asp:ListItem Text="User:Email" Value="User:Email" />
													        <asp:ListItem Text="User:FirstName" Value="User:FirstName" />
													        <asp:ListItem Text="User:FullName" Value="User:FullName" />
													        <asp:ListItem Text="User:LastName" Value="User:LastName" />
													        <asp:ListItem Text="User:PortalID" Value="User:PortalID" />
													        <asp:ListItem Text="User:UserID" Value="User:UserID" />
													        <asp:ListItem Text="User:Username" Value="User:Username" />
												        </asp:DropDownList>
											        </div>
										        </asp:View>
									        </asp:MultiView>
									        <div class="rvdActions">
										        <asp:LinkButton ID="SaveParameterLinkButton" runat="server" resourcekey="SaveParameterLinkButton" OnClick="SaveParameterLinkButton_Click" ValidationGroup="ParameterReportConfigurationDetailsViewControl" CssClass="btn btn-primary rvdOKAction" />
									        </div>
								        </asp:Panel>
							        </div>
						        </div>
					        </fieldset>
				        </asp:Panel>
				        <asp:Panel ID="VisualizerDetailsViewPanel" runat="server" CssClass="dnnClear">
					        <fieldset>
						        <div class="dnnFormItem">
							        <dnn1:LabelControl ID="VisualizerLabelControl" runat="server" />
						        </div>
					        </fieldset>
                            <asp:TextBox ID="VisualizerTextBox" runat="server" TextMode="MultiLine" Rows="30" style="width: 100%; max-width: none"></asp:TextBox>
				        </asp:Panel>
                        <asp:Panel ID="ExportDetailsViewPanel" runat="server" CssClass="dnnClear">
					        <fieldset>
						        <div class="dnnFormItem">
							        <dnn1:LabelControl ID="ExportLabelControl" runat="server" />
						        </div>
					        </fieldset>
                            <asp:TextBox ID="ExportTextBox" runat="server" TextMode="MultiLine" Rows="30" style="width: 100%; max-width: none"></asp:TextBox>
				        </asp:Panel>
			        </div>
					<div class="row rvdsf-footerbar-container">
                        <div class="col-sm-6">
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" resourcekey="DeleteLinkButton" CssClass="btn btn-default btn-light" CausesValidation="false" OnClick="DeleteLinkButton_Click" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()"></asp:LinkButton>
                        </div>
                        <div class="col-sm-6 text-sm-right">
                            <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl"/>
							<asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
							<asp:LinkButton ID="SaveAndBackLinkButton" runat="server" resourcekey="SaveAndBackLinkButton" OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
	    </ContentTemplate>
    </asp:UpdatePanel>
</div>
