<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InstallerControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.InstallerControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/urlcontrol.ascx" TagName="UrlControl" TagPrefix="dnn1" %>
<div>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False"></asp:PlaceHolder>
            <h2><%= LocalizeString("InstallerHeader") %></h2>
			<hr />
			<asp:MultiView ID="InstallerMultiView" runat="server">
				<asp:View ID="InstallView" runat="server">
					<asp:Panel ID="InstallListViewPanel" runat="server" >
						<p><%= LocalizeString("InstallerDescriptionLabel") %></p>
						<asp:GridView ID="InstallModuleControlGridView" runat="server" CssClass="table table-striped table-hover rvdsfInstallerGrid" GridLines="None" AutoGenerateColumns="False" Width="100%" OnSelectedIndexChanged="InstallModuleControlGridView_SelectedIndexChanged" DataKeyNames="ID" OnRowDataBound="InstallModuleControlGridView_RowDataBound">
							<PagerStyle CssClass="dnnGridPager" />
							<Columns>
								<asp:TemplateField>
									<HeaderTemplate>
										<input onclick="event.stopPropagation(); if ($(this).is(':checked')) { $('.rvdsfInstallerGrid :checkbox').each(function () { this.checked = true; }) } else { $('.rvdsfInstallerGrid :checkbox').each(function () { this.checked = false; }) }" runat="server" type="checkbox" />
									</HeaderTemplate>
									<ItemTemplate>
										<asp:CheckBox ID="IncludeCheckBox" runat="server" Checked='<%# Eval("Include") %>' onclick="event.stopPropagation()"/>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Module">
									<ItemTemplate>
										<asp:LinkButton ID="SelectLinkButton" runat="server" Text='<%# Eval("FriendlyName") %>' CommandName="Select" OnClientClick="event.stopPropagation()" ></asp:LinkButton><asp:Label runat="server" Visible='<%# Eval("Required") %>'> <em style="color: red">(required)</em></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField DataField="Description" HeaderText="Description" />
								<asp:BoundField DataField="TargetPageName" HeaderText="Page" />
							</Columns>
						</asp:GridView>
						<div class="row rvdsf-footerbar-container">
                            <div class="col-sm-6">
                                <asp:LinkButton CssClass="btn btn-default btn-light" ID="UninstallLinkButton" runat="server" resourcekey="UninstallLinkButton" OnClick="UninstallLinkButton_Click" OnClientClick="return confirm('Are you sure you want to completely uninstall this software? Uninstalling will delete all the Storefront data permanently.')" CausesValidation="False">
								</asp:LinkButton>
                            </div>
                            <div class="col-sm-6 text-sm-right">
                                <asp:LinkButton ID="CancelLinkButton" runat="server" resourcekey="CancelLinkButton" OnClick="CancelLinkButton_Click" CssClass="btn btn-default btn-light rvdCancelAction" ValidationGroup="DetailsViewControl" CausesValidation="False">
								</asp:LinkButton>
								<asp:LinkButton ID="InstallLinkButton" runat="server" resourcekey="InstallLinkButton" OnClick="InstallLinkButton_Click" CssClass="btn btn-primary">
								</asp:LinkButton>
                            </div>
                        </div>
					</asp:Panel>
					<asp:Panel ID="InstallDetailsViewPanel" runat="server" >
						<fieldset>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="InstallModuleTitleLabelControl" runat="server" CssClass="dnnFormRequired" />
								<asp:RequiredFieldValidator ID="InstallModuleTitleRequiredFieldValidator" runat="server" ControlToValidate="InstallModuleTitleTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
								<asp:TextBox ID="InstallModuleTitleTextBox" runat="server" CssClass="dnnFormRequired"></asp:TextBox>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="TargetPageModeLabelControl" runat="server" />
								<asp:RadioButtonList ID="InstallUrlModeRadioButtonList" runat="server" CssClass="dnnFormRadioButtons" OnSelectedIndexChanged="InstallUrlModeRadioButtonList_SelectedIndexChanged" AutoPostBack="True" RepeatLayout="Flow" RepeatDirection="Horizontal">
									<asp:ListItem resourcekey="CreateANewPageIfNotExistLabel" Value="New" />
									<asp:ListItem resourcekey="ChooseFromExistingPageLabel" Value="Existing" />
								</asp:RadioButtonList>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="InstallTargetPageLabelControl" runat="server" CssClass="dnnFormRequired" />
								<asp:MultiView ID="InstallUrlMultiView" runat="server">
									<asp:View ID="InstallUrlNewTabView" runat="server">
										<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="InstallUrlNewTabTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"></asp:RequiredFieldValidator>
										<asp:TextBox ID="InstallUrlNewTabTextBox" runat="server" CssClass="dnnFormRequired"></asp:TextBox>
									</asp:View>
									<asp:View ID="InstallUrlExistingTabView" runat="server">
										<dnn1:UrlControl ID="InstallTargetPageUrlControl" runat="server" IncludeActiveTab="False" ShowDatabase="False" ShowFiles="False" ShowImages="False" ShowLog="false" ShowNewWindow="False" ShowNone="False" ShowSecure="False" ShowTabs="True" ShowTrack="false" ShowUpLoad="False" ShowUrls="False" ShowUsers="false" />
									</asp:View>
								</asp:MultiView>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="InstallTargetPaneLabelControl" runat="server" CssClass="dnnFormRequired" />
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="InstallTargetPaneTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
								<asp:TextBox ID="InstallTargetPaneTextBox" runat="server" CssClass="dnnFormRequired"></asp:TextBox>
							</div>
						</fieldset>
						<div class="row rvdsf-footerbar-container">
                            <div class="col-sm-6">
                                
                            </div>
                            <div class="col-sm-6 text-sm-right">
                                <asp:LinkButton ID="CancelInstallDetailsViewLinkButton" runat="server" resourcekey="CancelInstallDetailsViewLinkButton" OnClick="CancelInstallDetailsViewLinkButton_Click" CssClass="btn btn-default btn-light rvdCancelAction" ValidationGroup="DetailsViewControl" CausesValidation="False">
								</asp:LinkButton>
								<asp:LinkButton ID="SaveInstallDetailsViewLinkButton" runat="server" resourcekey="SaveInstallDetailsViewLinkButton" OnClick="SaveInstallDetailsViewLinkButton_Click" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl">
								</asp:LinkButton>
                            </div>
                        </div>
					</asp:Panel>
				</asp:View>
				<asp:View ID="ConfirmationView" runat="server">
					<div>
						<div class="alert alert-info rvd-alert-important"><%= LocalizeString("InstallationCompleteLabel") %></div>
						<hr />
						<div style="width: 100%; padding: 10px; margin: 10px; overflow: auto; height: 200px;">
							<asp:Label ID="ConfirmationLogLabel" runat="server"></asp:Label>
						</div>
						<div class="row rvdsf-footerbar-container">
                            <div class="col-sm-6">
                                
                            </div>
                            <div class="col-sm-6 text-sm-right">
                                <asp:HyperLink ID="ReturnHyperLink" runat="server" resourcekey="ReturnHyperLink" CssClass="btn btn-primary rvdReturnAction"></asp:HyperLink>
                            </div>
                        </div>
					</div>
				</asp:View>
			</asp:MultiView>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
