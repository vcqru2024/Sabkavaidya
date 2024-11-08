<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductAttributeControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductAttributeControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="~/Controls/texteditor.ascx" TagName="TextEditor" TagPrefix="dnn1" %>
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
                                <asp:HyperLink ID="AddHyperLink" runat="server" resourcekey="AddHyperLink" CssClass="btn btn-primary rvdAddNewAction" />
                            </div>
                        </div>
                        <asp:GridView ID="ProductAttributeGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnRowDeleting="ProductAttributeGridView_RowDeleting" CssClass="table table-striped table-hover" GridLines="None" DataKeyNames="ProductAttributeID" OnPageIndexChanging="ProductAttributeGridView_PageIndexChanging" OnSorting="ProductAttributeGridView_Sorting" OnRowDataBound="ProductAttributeGridView_RowDataBound">
                            <PagerStyle CssClass="dnnGridPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="Attribute" SortExpression="Name">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" Text='<%# Eval("Name") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Value" HeaderText="Value" />
                                <asp:TemplateField HeaderStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:View>
                <asp:View ID="DetailsView" runat="server">
                    <uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
                    <h2><%= LocalizeString("AttributeHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="ProductAttributeIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
                    <hr />
                    <div>
                        <fieldset>
                            <div class="dnnFormItem">
                                <dnn1:LabelControl ID="ProductAttributeDefinitionLabelControl" runat="server" />
                                <asp:DropDownList ID="ProductAttributeDefinitionDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ProductAttributeDefinitionDropDownList_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <div class="dnnFormItem">
                                <dnn1:LabelControl ID="ValueLabelControl" runat="server" />
                                <asp:RangeValidator ID="IntegerRangeValidator" runat="server" ControlToValidate="IntegerValueTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="2147483647" MinimumValue="-2147483648" Type="Integer" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
                                <asp:RangeValidator ID="DecimalRangeValidator" runat="server" ControlToValidate="DecimalValueTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" MaximumValue="9999999" MinimumValue="-99999999" Type="Double" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
                                <asp:DropDownList ID="BooleanValueDropDownList" runat="server">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem resourcekey="YesLabel" Value="1"></asp:ListItem>
                                    <asp:ListItem resourcekey="NoLabel" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <dnn1:TextEditor ID="StringValueTextEditor" runat="server" ChooseRender="False" ChooseMode="False" DefaultMode="RICH" HtmlEncode="False" Mode="RICH" Width="100%" Height="460px" />
                                <asp:TextBox ID="IntegerValueTextBox" runat="server"></asp:TextBox>
                                <asp:CheckBoxList ID="SelectionValueCheckBoxList" runat="server">
                                </asp:CheckBoxList>
                                <asp:TextBox ID="DecimalValueTextBox" runat="server"></asp:TextBox>
                            </div>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
