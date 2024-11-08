<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManufacturerControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ManufacturerControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/texteditor.ascx" TagName="TextEditor" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/XmlEditorControl.ascx" TagName="XmlEditorControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="PlaceHolder1" runat="server">

    <script type="text/javascript">
        jQuery(document).ready(function ()
        {
            jQuery('#ManufacturerDetailsViewTabPanel').dnnTabs();
            jQuery('#GeneralDetailsViewSubPanel').dnnPanels();
        });
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function ()
        {
            jQuery('#ManufacturerDetailsViewTabPanel').dnnTabs();
            jQuery('#GeneralDetailsViewSubPanel').dnnPanels();
        });
    </script>

</asp:PlaceHolder>
<div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
            <asp:MultiView ID="ContentMultiView" runat="server">
                <asp:View ID="ListView" runat="server">
                    <h2><%= LocalizeString("ManufacturersHeader") %></h2>
                    <div class="rvdsfListContainer">
                        <div class="row rvdsf-actionbar-container">
                            <div class="col-sm-6">
                                <asp:HyperLink ID="ExportHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportLink") %></asp:HyperLink>
                                <asp:HyperLink ID="ImportHyperLink" runat="server" CssClass="btn btn-link rvdImportAction" ><em class="glyphicon glyphicon-import fa fas fa-download"></em> <%= LocalizeString("ImportLink") %></asp:HyperLink>
                                <asp:LinkButton ID="SyncTabsLinkButton" runat="server" CssClass="btn btn-link" OnClick="SyncTabsLinkButton_Click"><em class="glyphicon glyphicon-refresh fa fas fa-sync"></em> <%= LocalizeString("SynchronizeMenuLink") %></asp:LinkButton>
                            </div>
                            <div class="col-sm-6 text-sm-right">
                                 <asp:HyperLink  ID="AddHyperLink" resourcekey="AddHyperLink" runat="server"  CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-ManufacturerDetailsViewTabPanel', '/')" />
                            </div>
                        </div>
                        <asp:GridView ID="ManufacturerGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ManufacturerID" Width="100%" AllowPaging="True" OnRowDeleting="ManufacturerGridView_RowDeleting" OnRowDataBound="ManufacturerGridView_RowDataBound">
                            <PagerStyle CssClass="dnnGridPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CheckBoxField DataField="Published" HeaderText="Published" SortExpression="Published" HeaderStyle-Width="10%"/>
                                <asp:BoundField DataField="DisplayOrder" HeaderText="DisplayOrder" SortExpression="DisplayOrder" HeaderStyle-Width="15%"/>
                                <asp:TemplateField HeaderStyle-Width="5%" HeaderStyle-CssClass="hidden-xs" ItemStyle-CssClass="hidden-xs">
									<ItemTemplate>
										<asp:HyperLink ID="PreviewHyperLink" runat="server" target="_blank" onclick="event.stopPropagation();"><em class="glyphicon glyphicon-eye-open fa fas fa-eye"></em></asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateField>
                                <asp:TemplateField HeaderStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" CausesValidation="False" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ManufacturerObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCount" SelectMethod="GetAll" TypeName="Revindex.Business.Revindex.Revindex.Storefront.ManufacturerController" SortParameterName="sortExpression" DataObjectTypeName="Revindex.Business.Revindex.Revindex.Storefront.Manufacturer" DeleteMethod="Delete">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="" Name="sortExpression" Type="String" />
                                <asp:Parameter DefaultValue="" Name="maximumRows" Type="Int32" />
                                <asp:Parameter Name="startRowIndex" Type="Int32" />
                                <rvd1:UserControlParameter Name="portalID" PropertyName="PortalId" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </asp:View>
                <asp:View ID="DetailsView" runat="server">
                    <uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
                    <h2><%= LocalizeString("ManufacturerHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="ManufacturerIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
                    <div class="row rvdsf-actionbar-container">
                        <div class="col-sm-6">
							<asp:HyperLink ID="PreviewHyperLink" runat="server" CssClass="btn btn-link rvdPreviewAction" Target="_blank" ><em class="glyphicon glyphicon-eye-open fa fas fa-eye"></em> <%= LocalizeString("PreviewLink") %></asp:HyperLink>
							<asp:HyperLink ID="AddFeaturesHyperLink" runat="server" CssClass="btn btn-link" ><em class="glyphicon glyphicon-plus fa fas fa-plus"></em> <%= LocalizeString("MoreFeaturesLink") %></asp:HyperLink>
                        </div>
                        <div class="col-sm-6 text-sm-right">

                        </div>
                    </div>
                    <div id="ManufacturerDetailsViewTabPanel">
                        <ul class="dnnAdminTabNav dnnClear">
                            <li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
                                <asp:Label  ID="GeneralDetailsViewTabLabel" resourcekey="GeneralDetailsViewTabLabel" runat="server"  /></a></li>
                            <li><a href="#<%= DisplayDetailsViewPanel.ClientID %>">
                                <asp:Label  ID="DisplayDetailsViewTabLabel" resourcekey="DisplayDetailsViewTabLabel" runat="server"  /></a></li>
                            <li ID="ExtensionDetailsViewListItem" runat="server"><a href="#<%= ExtensionDetailsViewPanel.ClientID %>">
                                <asp:Label  ID="ExtensionDetailsViewTabLabel" resourcekey="ExtensionDetailsViewTabLabel" runat="server"  /></a></li>
                        </ul>
                        <asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div ID="GeneralDetailsViewSubPanel">
								    <asp:Panel ID="ManufacturerKeyPanel" runat="server" CssClass="dnnFormItem">
									    <dnn1:LabelControl ID="ManufacturerKeyLabelControl" runat="server" CssClass="dnnFormRequired" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ManufacturerKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="ManufacturerKeyTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
								    </asp:Panel>
                                    <div class="dnnFormItem">
                                        <dnn1:LabelControl ID="NameLabelControl" runat="server" CssClass="dnnFormRequired" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="NameTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="100" ></asp:TextBox>
                                    </div>
                                    <div class="dnnFormItem" style="min-height: 525px">
                                        <dnn1:LabelControl ID="DescriptionLabelControl" runat="server" />
                                        <dnn1:TextEditor ID="DescriptionTextEditor" runat="server" ChooseRender="False" ChooseMode="False" DefaultMode="RICH" HtmlEncode="False" Mode="RICH" Height="460px" Width="100%" />
                                    </div>
                                    <div class="dnnFormItem">
                                        <dnn1:LabelControl ID="PhoneLabelControl" runat="server" />
                                        <asp:TextBox ID="PhoneTextBox" runat="server" MaxLength="50"></asp:TextBox>
                                    </div>
                                    <div class="dnnFormItem">
                                        <dnn1:LabelControl ID="EmailLabelControl" runat="server" />
                                        <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" runat="server" ControlToValidate="EmailTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^(\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*|(&quot;*[\w ]*&quot;*\s*)&lt;\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*&gt;)$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="EmailTextBox" runat="server" MaxLength="256"></asp:TextBox>
                                    </div>
                                    <h2 id="SEOSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("SEOHeader") %></a></h2>
                                    <fieldset>
								        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="UrlNameLabelControl" runat="server" />
                                            <asp:TextBox ID="UrlNameTextBox" runat="server" MaxLength="400"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="PageTitleLabelControl" runat="server" />
                                            <asp:TextBox ID="PageTitleTextBox" runat="server" MaxLength="400"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="MetaKeywordsLabelControl" runat="server" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="MetaKeywordsTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\s\S]{0,400}$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                            <asp:TextBox ID="MetaKeywordsTextBox" runat="server" Rows="3" TextMode="MultiLine" MaxLength="400"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <dnn1:LabelControl ID="MetaDescriptionLabelControl" runat="server" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="MetaDescriptionTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="^[\s\S]{0,400}$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                            <asp:TextBox ID="MetaDescriptionTextBox" runat="server" Rows="3" TextMode="MultiLine" MaxLength="400"></asp:TextBox>
                                        </div>
                                    </fieldset>
                                </div>
                            </fieldset>
                        </asp:Panel>
                        <asp:Panel ID="DisplayDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PublishedLabelControl" runat="server" />
                                    <asp:CheckBox ID="PublishedCheckBox" runat="server" Checked="True" />
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="DisplayTemplateLabelControl" runat="server" />
                                    <uc1:DisplayTemplateDropDownListControl ID="DisplayTemplateDropDownList" runat="server" />
									<asp:LinkButton ID="DisplayTemplateLinkButton" runat="server" OnClick="DisplayTemplateLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="DisplayOrderExtensionLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DisplayOrderTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="DisplayOrderRangeValidator" runat="server" ControlToValidate="DisplayOrderTextBox" MinimumValue="-2147483648" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			                        <asp:TextBox ID="DisplayOrderTextBox" runat="server" value="1000" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
                                </div>
                            </fieldset>
                        </asp:Panel>
                        <asp:Panel ID="ExtensionDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="ExtensionLabelControl" runat="server" />
                                    <uc1:XmlEditorControl ID="ExtensionXmlEditor" runat="server" Width="100%" ModuleControl="ManufacturerExtension" />
                                </div>
                            </fieldset>
                        </asp:Panel>
                    </div>
                    <div class="row rvdsf-footerbar-container">
                        <div class="col-sm-6">
                            <asp:LinkButton  ID="DeleteLinkButton" resourcekey="DeleteLinkButton" runat="server"  CssClass="btn btn-default btn-light" CausesValidation="false" OnClick="DeleteLinkButton_Click" OnClientClick="return Revindex.Web.ConfirmDelete()"></asp:LinkButton>
                        </div>
                        <div class="col-sm-6 text-sm-right">
                            <uc1:BackControl  ID="BackControl" resourcekey="BackControl" runat="server"  />
                            <asp:LinkButton  ID="SaveLinkButton" resourcekey="SaveLinkButton" runat="server"  OnClick="SaveLinkButton_Click" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
                            <asp:LinkButton  ID="SaveAndBackLinkButton" resourcekey="SaveAndBackLinkButton" runat="server"  OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
