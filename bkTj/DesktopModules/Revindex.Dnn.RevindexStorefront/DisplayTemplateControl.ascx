<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DisplayTemplateControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.DisplayTemplateControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="DotNetNuke.Web.Client" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" TagPrefix="dnn3" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<dnn3:DnnCssInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/lib/codemirror.css" />
<dnn3:DnnCssInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/addon/merge/merge.css" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/lib/codemirror.js" Priority="1" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/mode/javascript/javascript.js" Priority="2" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/mode/css/css.js" Priority="3" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/mode/htmlmixed/htmlmixed.js" Priority="4" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/mode/xml/xml.js" Priority="5" />
<dnn3:DnnJsInclude runat="server" FilePath="https://cdnjs.cloudflare.com/ajax/libs/diff_match_patch/20121119/diff_match_patch.js" Priority="9" />
<dnn3:DnnJsInclude runat="server" FilePath="~/Resources/Shared/components/CodeEditor/addon/merge/merge.js" Priority="10" />

<script type="text/javascript">
	Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))
    })
</script>

<div>
	<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
	<asp:MultiView ID="ContentMultiView" runat="server">
		<asp:View ID="ListView" runat="server">
			<uc1:BackControl ID="BackControl2" runat="server" Text="" CssClass="rvdsfBackAction" />
			<h2><%= LocalizeString("DisplayTemplatesHeader") %></h2>
			<div class="dnnForm rvdsfListContainer">
				<div class="row rvdsf-actionbar-container">
					<div class="col-sm-6">
						
					</div>
					<div class="col-sm-6 text-sm-right">
						<asp:HyperLink ID="AddHyperLink" runat="server" resourcekey="AddHyperLink" CssClass="btn btn-primary rvdAddNewAction" />
					</div>
				</div>
				<asp:GridView ID="DisplayTemplateGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AutoGenerateColumns="False" DataKeyNames="DisplayTemplatePath,DisplayTemplateName,ModuleControl" OnRowDeleting="DisplayTemplateGridView_RowDeleting" OnRowDataBound="DisplayTemplateGridView_RowDataBound" AllowSorting="True" OnRowCommand="DisplayTemplateGridView_RowCommand">
					<PagerStyle CssClass="dnnGridPager" />
					<Columns>
						<asp:TemplateField HeaderText="Name">
							<ItemTemplate>
								<asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" Text='<%# Eval("DisplayTemplateName") %>'/>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="ModuleControl" HeaderText="ModuleControl" />
						<asp:CheckBoxField DataField="InUse" HeaderText="InUse" HeaderStyle-Width="10%"/>
						<asp:TemplateField HeaderStyle-Width="5%">
							<ItemTemplate>
								<asp:LinkButton ID="DuplicateLinkButton" runat="server" CommandName="Duplicate" CausesValidation="false" OnClientClick="event.stopPropagation();" CommandArgument='<%# Eval("DisplayTemplatePath") %>'><em class="glyphicon glyphicon-duplicate"></em></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderStyle-Width="5%">
							<ItemTemplate>
								<asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" CausesValidation="false" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
					</Columns>
				</asp:GridView>
			</div>
		</asp:View>
		<asp:View ID="DetailsView" runat="server">
			<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
			<h2><%= LocalizeString("DisplayTemplateHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /></h2>
			<div class="dnnForm">
				<hr />
				<fieldset>
					<div ID="UnsupportedWarningLabel" runat="server" class="alert alert-warning"><%= LocalizeString("BaseTemplateRemovedLabel") %></div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="ModuleControlLabelControl" runat="server" CssClass="dnnFormRequired" />
						<asp:DropDownList ID="ModuleControlDropDownList" runat="server" OnSelectedIndexChanged="ModuleControlDropDownList_SelectedIndexChanged" AutoPostBack="True">
							<asp:ListItem Value="Cart">Cart</asp:ListItem>
							<asp:ListItem Value="CartSummary">Cart Summary</asp:ListItem>
							<asp:ListItem Value="Category">Category</asp:ListItem>
							<asp:ListItem Value="Checkout">Checkout</asp:ListItem>
							<asp:ListItem Value="Confirmation">Confirmation</asp:ListItem>
                            <asp:ListItem Value="Currency">Currency</asp:ListItem>
							<asp:ListItem Value="Distributor">Distributor</asp:ListItem>
							<asp:ListItem Value="ManageFavorite">Manage Favorite</asp:ListItem>
							<asp:ListItem Value="ManageFund">Manage Fund</asp:ListItem>
							<asp:ListItem Value="ManageOrder">Manage Order</asp:ListItem>
							<asp:ListItem Value="ManageRegister">Manage Register</asp:ListItem>
							<asp:ListItem Value="Manufacturer">Manufacturer</asp:ListItem>
							<asp:ListItem Value="ProductComparison">Product Comparison</asp:ListItem>
							<asp:ListItem Value="ProductDetail">Product Detail</asp:ListItem>
							<asp:ListItem Value="ProductFilter">Product Filter</asp:ListItem>
							<asp:ListItem Value="ProductList">Product List</asp:ListItem>
							<asp:ListItem Value="ProductSearch">Product Search</asp:ListItem>
							<asp:ListItem Value="ProductShowcase">Product Showcase</asp:ListItem>
							<asp:ListItem Value="QuickOrder">Quick Order</asp:ListItem>
                            <asp:ListItem Value="Seller">Seller</asp:ListItem>
							<asp:ListItem Value="WishList">WishList</asp:ListItem>
						</asp:DropDownList>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="NameLabelControl" runat="server" CssClass="dnnFormRequired" />
						<asp:RequiredFieldValidator ID="NaemRequiredFieldValidator" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="NameRegularExpressionValidator" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^\w+$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
						<asp:TextBox ID="NameTextBox" runat="server" MaxLength="30" CssClass="dnnFormRequired"></asp:TextBox>
					</div>
					<asp:Panel ID="FileSystemPanel" runat="server" CssClass="dnnFormItem">
						<dnn1:LabelControl ID="FileSystemLabelControl" runat="server" CssClass="dnnFormRequired" />
						<asp:DropDownList ID="FileSystemDropDownList" runat="server" OnSelectedIndexChanged="FileSystemDropDownList_SelectedIndexChanged" AutoPostBack="True">
						</asp:DropDownList>
						<div class="btn-group">
							<a href="#" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><em class="glyphicon glyphicon-pencil fa fas fa-pencil"></em> <%= Localization.GetString("EditFileSystemLink", this.LocalResourceFile) %> <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="dropdown-item"><asp:LinkButton ID="AddDirectoryLinkButton" runat="server" OnClick="AddDirectoryLinkButton_Click" CausesValidation="false" resourcekey="AddDirectoryLinkButton"></asp:LinkButton></li>
								<li class="dropdown-item"><asp:LinkButton ID="AddFileLinkButton" runat="server" OnClick="AddFileLinkButton_Click" CausesValidation="false" resourcekey="AddFileLinkButton"></asp:LinkButton></li>
								<li class="dropdown-item"><asp:LinkButton ID="UploadFileLinkButton" runat="server" OnClick="UploadFileLinkButton_Click" CausesValidation="False" resourcekey="UploadFileLinkButton"></asp:LinkButton></li>
								<li class="dropdown-item"><asp:LinkButton ID="DeleteFileSystemLinkButton" runat="server" OnClick="DeleteFileSystemLinkButton_Click" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" resourcekey="DeleteFileSystemLinkButton"></asp:LinkButton></li>
								<li class="dropdown-item"><asp:LinkButton ID="DuplicateFileSystemLinkButton" runat="server" OnClick="DuplicateFileSystemLinkButton_Click" CausesValidation="False" resourcekey="DuplicateFileSystemLinkButton"></asp:LinkButton></li>
								<li class="dropdown-item"><asp:LinkButton ID="RenameFileSystemLinkButton" runat="server" OnClick="RenameFileSystemLinkButton_Click" CausesValidation="False" resourcekey="RenameFileSystemLinkButton"></asp:LinkButton></li>
							</ul>
						</div>						
					</asp:Panel>
					<asp:Panel ID="AddFilePanel" runat="server" CssClass="dnnFormItem alert alert-warning">
						<dnn1:LabelControl ID="AddFileLabelControl" runat="server" CssClass="dnnFormRequired" />
						<asp:RequiredFieldValidator id="RequiredFieldValidator1" ControlToValidate="AddFileTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="AddFileDetailsViewControl" runat="server"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="AddFileTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^([a-zA-Z0-9\s_\\.\-\(\)])+(.cshtml|.css|.csv|.doc|.docx|.gif|.htm|.html|.png|.js|.jsx|.jpg|.jpeg|.pdf|.resx|.xls|.xlsx|.xml|.xsl|.xslt|.txt|.zip)$" ValidationGroup="AddFileDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
						<asp:TextBox ID="AddFileTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
						<asp:LinkButton ID="SaveAddFileLinkButton" runat="server" CssClass="btn btn-primary rvdOKAction" OnClick="SaveAddFileLinkButton_Click" ValidationGroup="AddFileDetailsViewControl" resourcekey="OKLink"></asp:LinkButton>
						<asp:LinkButton ID="CancelAddFileLinkButton" runat="server" CssClass="btn btn-default btn-light" OnClick="CancelAddFileLinkButton_Click" CausesValidation="False" resourcekey="CancelLink"></asp:LinkButton>
					</asp:Panel>
					<asp:Panel ID="AddDirectoryPanel" runat="server" CssClass="dnnFormItem alert alert-warning">
						<dnn1:LabelControl ID="AddDirectoryLabelControl" runat="server" CssClass="dnnFormRequired" />
						<asp:RequiredFieldValidator id="RequiredFieldValidator2" ControlToValidate="AddDirectoryTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="AddDirectoryDetailsViewControl" runat="server"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="AddDirectoryTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^([a-zA-Z0-9\s_\\.\-\(\)])+$" ValidationGroup="AddDirectoryDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
						<asp:TextBox ID="AddDirectoryTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
						<asp:LinkButton ID="SaveAddDirectoryLinkButton" runat="server" CssClass="btn btn-primary rvdOKAction" OnClick="SaveAddDirectoryLinkButton_Click" ValidationGroup="AddDirectoryDetailsViewControl" resourcekey="OKLink"></asp:LinkButton>
						<asp:LinkButton ID="CancelAddDirectoryLinkButton" runat="server" CssClass="btn btn-default btn-light" OnClick="CancelAddDirectoryLinkButton_Click" CausesValidation="False" resourcekey="CancelLink"></asp:LinkButton>
					</asp:Panel>
					<asp:Panel ID="RenameFileSystemPanel" runat="server" CssClass="dnnFormItem alert alert-warning">
						<dnn1:LabelControl ID="RenameFileSystemLabelControl" runat="server" CssClass="dnnFormRequired" />
						<asp:RequiredFieldValidator id="RenameFileSystemRequiredFieldValidator" ControlToValidate="RenameFileSystemTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="RenameFileSystemDetailsViewControl" runat="server"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="RenameFileSystemRegularExpressionValidator" runat="server" ControlToValidate="RenameFileSystemTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^([a-zA-Z0-9\s_\\.\-\(\)])+(|.cshtml|.css|.csv|.doc|.docx|.gif|.htm|.html|.png|.js|.jsx|.jpg|.jpeg|.pdf|.resx|.xls|.xlsx|.xml|.xsl|.xslt|.txt|.zip)$" ValidationGroup="RenameFileSystemDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
						<asp:TextBox ID="RenameFileSystemTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
						<asp:LinkButton ID="SaveRenameFileSystemLinkButton" runat="server" CssClass="btn btn-primary rvdOKAction" OnClick="SaveRenameFileSystemLinkButton_Click" ValidationGroup="RenameFileSystemDetailsViewControl" resourcekey="OKLink"></asp:LinkButton>
						<asp:LinkButton ID="CancelRenameFileSystemLinkButton" runat="server" CssClass="btn btn-default btn-light" OnClick="CancelRenameFileSystemLinkButton_Click" CausesValidation="False" resourcekey="CancelLink"></asp:LinkButton>
					</asp:Panel>
					<asp:Panel ID="UploadFilePanel" runat="server" CssClass="dnnFormItem alert alert-warning">
						<dnn1:LabelControl ID="UploadFileLabelControl" runat="server" CssClass="dnnFormRequired" />
						<asp:RequiredFieldValidator id="RequiredFieldValidator3" ControlToValidate="UploadFileFileUpload" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="UploadFileDetailsViewControl" runat="server"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="UploadFileFileUpload" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^.+(.cshtml|.css|.csv|.doc|.docx|.gif|.htm|.html|.png|.js|.jsx|.jpg|.jpeg|.pdf|.resx|.xls|.xlsx|.xml|.xsl|.xslt|.txt|.zip)$" ValidationGroup="UploadFileDetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
						<asp:FileUpload ID="UploadFileFileUpload" runat="server" />
						<asp:LinkButton ID="SaveUploadFileLinkButton" runat="server" CssClass="btn btn-primary rvdOKAction" OnClick="SaveUploadFileLinkButton_Click" ValidationGroup="UploadFileDetailsViewControl" resourcekey="OKLink"></asp:LinkButton>
						<asp:LinkButton ID="CancelUploadFileLinkButton" runat="server" CssClass="btn btn-default btn-light" OnClick="CancelUploadFileLinkButton_Click" CausesValidation="False" resourcekey="CancelLink"></asp:LinkButton>
					</asp:Panel>
					<asp:Panel ID="BaseDisplayTemplatePanel" runat="server" CssClass="dnnFormItem">
						<dnn1:LabelControl ID="BaseDisplayTemplateLabelControl" runat="server" />
						<uc1:DisplayTemplateDropDownListControl ID="BaseDisplayTemplateDropDownList" runat="server" AutoPostBack="True" CausesValidation="False" />
					</asp:Panel>
					<asp:Panel ID="CodePanel" runat="server" CssClass="rvdsfFormCodeEditor">
							<script type="text/javascript">
								function rvdsfWrapTextArea(wrap)
								{
									if (wrap)
									{
										if (rvdsfFormCodeEditor)
										{
											// Only change wrap mode if not in mergeview mode
											if (!rvdsfFormCodeEditor.editor)
												rvdsfFormCodeEditor.setOption("lineWrapping", true);
										}
										else
											$('#<%= CodeTextBox.ClientID %>').attr("wrap", "soft");
											}
											else
											{
												if (rvdsfFormCodeEditor)
												{
													// Only change wrap mode if not in mergeview mode
													if (!rvdsfFormCodeEditor.editor)
														rvdsfFormCodeEditor.setOption("lineWrapping", false);
												}
												else
													$('#<%= CodeTextBox.ClientID %>').attr("wrap", "off");
											}
										}
							</script>
							<ul data-role="menu" >
								<li>
									<em class="glyphicon glyphicon-question-sign fa fas fa-question-circle"></em> <%= LocalizeString("HelpLabel") %>
									<ul>
										<li><a href="https://www.w3schools.com/html/" target="_blank">HTML tutorial</a></li>
										<li><a href="https://www.w3schools.com/css/" target="_blank">CSS tutorial</a></li>
										<li><a href="https://www.w3schools.com/js/" target="_blank" >Javascript tutorial</a></li>
										<li><a href="https://www.w3schools.com/jquery/" target="_blank" >JQuery tutorial</a></li>
										<li><a href="https://www.w3schools.com/asp/razor_intro.asp" target="_blank" >ASP.NET Razor reference</a></li>
										<li><a href="https://www.revindex.com/Support/Forum" target="_blank" >Revindex forum</a></li>
									</ul>
								</li>
								<li>
									<span><%= LocalizeString("CompareWithLabel") %>:</span>
									<uc1:DisplayTemplateDropDownListControl ID="CompareDisplayTemplateDropDownList" runat="server" AutoPostBack="True" CausesValidation="False" Style="margin-left: 10px; height: 24px; width: 200px"/>
								</li>
								<li>
									<asp:CheckBox ID="WrapCodeCheckBox" runat="server" Checked="false" OnClick="rvdsfWrapTextArea(this.checked)" resourcekey="WrapCodeCheckBox" />
								</li>
							</ul>
							<div id="CodeTextPanel" style="clear: both">
								<asp:TextBox ID="CodeTextBox" runat="server" Rows="26" TextMode="MultiLine" Width="100%" Wrap="True" />
								<asp:TextBox ID="CompareTextBox" runat="server" TextMode="MultiLine" EnableViewState="false" Style="display: none" />
							</div>
						</asp:Panel>
				</fieldset>
				<div class="row rvdsf-footerbar-container">
					<div class="col-sm-6">
						<asp:LinkButton ID="DeleteLinkButton" runat="server" resourcekey="DeleteLinkButton" CssClass="btn btn-default btn-light" CausesValidation="false" OnClick="DeleteLinkButton_Click" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()"></asp:LinkButton>     
					</div>
					<div class="col-sm-6 text-sm-right">
                        <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
						<asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
						<asp:LinkButton ID="SaveAndBackLinkButton" runat="server" resourcekey="SaveAndBackLinkButton" OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
					</div>
				</div>
			</div>
		</asp:View>
	</asp:MultiView>
</div>
