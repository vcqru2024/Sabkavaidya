<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductComponentControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductComponentControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="ProductPartControl.ascx" TagName="ProductPartControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<div>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
			<asp:MultiView ID="ContentMultiView" runat="server">
				<asp:View ID="ListView" runat="server">
					<div class="rvdsfListContainer">
						<div class="row rvdsf-actionbar-container">
							<div class="col-sm-6">
								<asp:HyperLink ID="ExportViewHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportViewLink") %></asp:HyperLink>
								<asp:HyperLink ID="ExportAllHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportAllLink") %></asp:HyperLink>
								<asp:HyperLink ID="ImportHyperLink" runat="server" CssClass="btn btn-link rvdImportAction" ><em class="glyphicon glyphicon-import fa fas fa-download"></em> <%= LocalizeString("ImportLink") %></asp:HyperLink>
							</div>
							<div class="col-sm-6 text-sm-right">
								<asp:HyperLink ID="AddHyperLink" resourcekey="AddHyperLink" runat="server" CssClass="btn btn-primary rvdAddNewAction" />
							</div>
						</div>
						<asp:GridView ID="ProductComponentGridView" runat="server" AllowSorting="False" AutoGenerateColumns="False" DataKeyNames="ProductComponentID" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="False" OnRowDeleting="ProductComponentGridView_RowDeleting" OnRowDataBound="ProductComponentGridView_RowDataBound">
							<PagerStyle CssClass="dnnGridPager" />
							<Columns>
								<asp:TemplateField HeaderText="Name">
									<ItemTemplate>
										<asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" />
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField DataField="DisplayOrder" HeaderText="DisplayOrder" HeaderStyle-Width="15%" />
								<asp:TemplateField  HeaderStyle-Width="5%">
									<ItemTemplate>
										<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>
						<asp:ObjectDataSource runat="server" EnablePaging="True" SelectCountMethod="GetCount" SelectMethod="GetAll" SortParameterName="sortExpression" TypeName="Revindex.Business.Revindex.Revindex.Storefront.ProductComponentController" ID="ProductComponentObjectDataSource" DataObjectTypeName="Revindex.Business.Revindex.Revindex.Storefront.ProductComponent" DeleteMethod="Delete">
							<SelectParameters>
								<asp:Parameter Name="sortExpression" Type="String"></asp:Parameter>
								<asp:Parameter Name="maximumRows" Type="Int32"></asp:Parameter>
								<asp:Parameter Name="startRowIndex" Type="Int32"></asp:Parameter>
								<asp:Parameter Name="deleted" Type="Boolean" DefaultValue="false"></asp:Parameter>
								<rvd1:UserControlParameter Name="productVariantID" PropertyName="ProductVariantID" Type="Int32" />
							</SelectParameters>
						</asp:ObjectDataSource>
					</div>
				</asp:View>
				<asp:View ID="DetailsView" runat="server">
					<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
					<h2><%= LocalizeString("ComponentHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="ProductComponentIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
					<div id="ProductComponentDetailsViewTabPanel">
						<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("GeneralHeader") %></a></h2>
						<fieldset>
							<asp:Panel ID="ProductComponentKeyPanel" runat="server" CssClass="dnnFormItem">
								<dnn1:LabelControl ID="ProductComponentKeyLabelControl" runat="server" CssClass="dnnFormRequired" />
								<asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="ProductComponentKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ProductComponentKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
								<asp:TextBox ID="ProductComponentKeyTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
							</asp:Panel>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="NameLabelControl" runat="server" CssClass="dnnFormRequired" />
								<asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
								<asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="DisplayOrderLabelControl" runat="server" CssClass="dnnFormRequired" />
								<asp:RequiredFieldValidator ID="DisplayOrderRequiredFieldValidator" runat="server" ControlToValidate="DisplayOrderTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
								<asp:RangeValidator ID="DisplayOrderRangeValidator" runat="server" ControlToValidate="DisplayOrderTextBox" MinimumValue="-2147483648" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			                    <asp:TextBox ID="DisplayOrderTextBox" runat="server" value="1000" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="ComponentTypeLabelControl" runat="server" CssClass="dnnFormRequired" />
								<asp:DropDownList ID="ComponentTypeDropDownList" runat="server">
									<asp:ListItem resourcekey="ImplicitLabel" Value="1" />
									<asp:ListItem resourcekey="ExplicitLabel" Value="2" />
									<asp:ListItem resourcekey="MultipleSelectionLabel" Value="3" />
									<asp:ListItem resourcekey="SingleSelectionLabel" Value="4" />
								</asp:DropDownList>
							</div>
						</fieldset>
						<h2 class="dnnFormSectionHead"><a href="#"><%= LocalizeString("PartsHeader") %></a></h2>
						<fieldset>
							<div ID="ProductPartUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
							<uc1:ProductPartControl ID="ProductPartControl1" runat="server"></uc1:ProductPartControl>
						</fieldset>
					</div>
					<div class="row rvdsf-footerbar-container">
                        <div class="col-sm-6">
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" resourcekey="DeleteLinkButton" CssClass="btn btn-default btn-light" CausesValidation="false" OnClick="DeleteLinkButton_Click" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()"></asp:LinkButton>
                        </div>
                        <div class="col-sm-6 text-sm-right">
                            <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
							<asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />
							<asp:LinkButton ID="SaveAndBackLinkButton" runat="server" resourcekey="SaveAndBackLinkButton" OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
                        </div>
                    </div>
				</asp:View>
			</asp:MultiView>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
