<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductAttributeDefinitionControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductAttributeDefinitionControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="ProductAttributeDefinitionSelectionControl.ascx" TagName="ProductAttributeDefinitionSelectionControl" TagPrefix="uc1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<div>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
			<asp:MultiView ID="ContentMultiView" runat="server">
				<asp:View ID="ListView" runat="server">
					<h2><%= LocalizeString("ProductAttributeDefinitionsHeader") %></h2>
					<div class="rvdsfListContainer">
						<div class="row rvdsf-actionbar-container">
                            <div class="col-sm-6">
                                <asp:HyperLink ID="ExportHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportLink") %></asp:HyperLink>
								<asp:HyperLink ID="ImportHyperLink" runat="server" CssClass="btn btn-link rvdImportAction" ><em class="glyphicon glyphicon-import fa fas fa-download"></em> <%= LocalizeString("ImportLink") %></asp:HyperLink>
                            </div>
                            <div class="col-sm-6 text-sm-right">
								<asp:HyperLink ID="AddHyperLink" runat="server" CssClass="btn btn-primary rvdAddNewAction" ><%= LocalizeString("AddLink") %></asp:HyperLink>
                            </div>
                        </div>
						<asp:GridView ID="ProductAttributeDefinitionGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnRowDeleting="ProductAttributeDefinitionGridView_RowDeleting" CssClass="table table-striped table-hover" GridLines="None" DataKeyNames="ProductAttributeDefinitionID" OnRowDataBound="ProductAttributeDefinitionGridView_RowDataBound">
							<PagerStyle CssClass="dnnGridPager" />
							<Columns>
								<asp:TemplateField HeaderText="Name" SortExpression="Name">
									<ItemTemplate>
										<asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" />
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField DataField="DisplayOrder" HeaderText="DisplayOrder" SortExpression="DisplayOrder"  HeaderStyle-Width="15%"/>
								<asp:TemplateField HeaderStyle-Width="5%">
									<ItemTemplate>
										<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>
						<asp:ObjectDataSource ID="ProductAttributeDefinitionObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCount" SelectMethod="GetAll" SortParameterName="sortExpression" TypeName="Revindex.Business.Revindex.Revindex.Storefront.ProductAttributeDefinitionController">
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
					<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
					<h2><%= LocalizeString("ProductAttributeDefinitionHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="ProductAttributeDefinitionIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
					<hr />
					<div>
						<fieldset>
							<asp:Panel ID="ProductAttributeDefinitionKeyPanel" runat="server" CssClass="dnnFormItem">
								<dnn1:LabelControl ID="ProductAttributeDefinitionKeyLabelControl" runat="server" CssClass="dnnFormRequired" />
								<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ProductAttributeDefinitionKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ProductAttributeDefinitionKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
								<asp:TextBox ID="ProductAttributeDefinitionKeyTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
							</asp:Panel>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="ProductAttributeGroupIDLabelControl" runat="server" />
								<asp:DropDownList ID="ProductAttributeGroupDropDownList" runat="server">
								</asp:DropDownList>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="NameLabelControl" runat="server" CssClass="dnnFormRequired" />
								<asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="NameRegularExpressionValidator" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
								<asp:TextBox ID="NameTextBox" runat="server" CssClass="dnnFormRequired"></asp:TextBox>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="DescriptionLabelControl" runat="server" />
								<asp:TextBox ID="DescriptionTextBox" runat="server" Rows="4" TextMode="MultiLine"></asp:TextBox>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="HelpTextLabelControl" runat="server" />
								<asp:TextBox ID="HelpTextTextBox" runat="server" Rows="4"></asp:TextBox>
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="ProductAttributeTypeLabelControl" runat="server" />
								<asp:DropDownList ID="ProductAttributeTypeDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ProductAttributeTypeDropDownList_SelectedIndexChanged">
									<asp:ListItem Value="1" resourcekey="BooleanLabel"></asp:ListItem>
									<asp:ListItem Value="3" resourcekey="DecimalLabel" ></asp:ListItem>
									<asp:ListItem Value="2" resourcekey="IntegerLabel" ></asp:ListItem>
									<asp:ListItem Value="5" resourcekey="SelectionLabel" ></asp:ListItem>
									<asp:ListItem Value="4" resourcekey="TextLabel" ></asp:ListItem>
								</asp:DropDownList>
							</div>
							<asp:MultiView ID="ProductAttributeTypeDetailMultiView" runat="server">
								<asp:View ID="DecimalProductAttributeTypeView" runat="server">
									<div class="dnnFormItem">
										<dnn1:LabelControl ID="StepSizeProductAttributeTypeLabelControl" runat="server" />
										<asp:RequiredFieldValidator ID="StepSizeProductAttributeTypeRequiredFieldValidator" runat="server" ControlToValidate="StepSizeProductAttributeTypeTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
										<asp:RangeValidator ID="StepSizeProductAttributeTypeRangeValidator" runat="server" ControlToValidate="StepSizeProductAttributeTypeTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
										<asp:CompareValidator ID="StepSizeProductAttributeTypeCompareValidator" runat="server" ControlToValidate="StepSizeProductAttributeTypeTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
										<asp:TextBox ID="StepSizeProductAttributeTypeTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
									</div>
								</asp:View>
								<asp:View ID="SelectionProductAttributeTypeView" runat="server">
									<div class="dnnFormItem">
										<dnn1:LabelControl ID="SelectionProductAttributeTypeLabelControl" runat="server" />
										<uc1:ProductAttributeDefinitionSelectionControl ID="ProductAttributeDefinitionSelectionControl1" runat="server" Height="120px" />
									</div>
								</asp:View>
							</asp:MultiView>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="PublishedLabelControl" runat="server" />
								<asp:CheckBox ID="PublishedCheckBox" runat="server" />
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="SearchableLabelControl" runat="server" />
								<asp:CheckBox ID="SearchableCheckBox" runat="server" />
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="FilterableLabelControl" runat="server" />
								<asp:CheckBox ID="FilterableCheckBox" runat="server" />
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="ComparableLabelControl" runat="server" />
								<asp:CheckBox ID="ComparableCheckBox" runat="server" />
							</div>
							<div class="dnnFormItem">
								<dnn1:LabelControl ID="DisplayOrderLabelControl" runat="server" CssClass="dnnFormRequired" />
								<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DisplayOrderTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
								<asp:RangeValidator ID="DisplayOrderRangeValidator" runat="server" ControlToValidate="DisplayOrderTextBox" MinimumValue="-2147483648" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			                    <asp:TextBox ID="DisplayOrderTextBox" runat="server" value="1000" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
							</div>
						</fieldset>
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
					</div>
				</asp:View>
			</asp:MultiView>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
