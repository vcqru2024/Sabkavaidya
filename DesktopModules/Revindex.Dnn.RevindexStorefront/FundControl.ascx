<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FundControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.FundControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="FundHistoryControl.ascx" TagName="FundHistoryControl" TagPrefix="uc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<asp:PlaceHolder runat="server">

    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery('#FundDetailsViewTabPanel').dnnTabs();
        });
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            jQuery('#FundDetailsViewTabPanel').dnnTabs();
        });
    </script>

</asp:PlaceHolder>
<div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
            <asp:MultiView ID="ContentMultiView" runat="server">
                <asp:View ID="ListView" runat="server">
                    <div class="row rvdsf-actionbar-container">
                        <div class="col-sm-6">
                        </div>
                        <div class="col-sm-6 text-sm-right">
                            <asp:HyperLink ID="AddHyperLink" runat="server" resourcekey="AddHyperLink" CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-FundDetailsViewTabPanel', '/')" />
                        </div>
                    </div>
                    <div class="rvdsfListContainer">
                        <asp:GridView ID="FundGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="False" AllowSorting="False" AutoGenerateColumns="False" DataKeyNames="FundID" OnRowDataBound="FundGridView_RowDataBound">
                            <PagerStyle CssClass="dnnGridPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                            </Columns>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="FundObjectDataSource" runat="server" EnablePaging="False" SelectCountMethod="GetActiveFundsCountByPortalUser" SelectMethod="GetActiveFundsByPortalUser" TypeName="Revindex.Business.Revindex.Revindex.Storefront.FundController">
                            <SelectParameters>
                                <rvd1:UserControlParameter Name="portalID" PropertyName="PortalId" Type="Int32" />
                                <rvd1:UserControlParameter Name="userID" PropertyName="UserId" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </asp:View>
                <asp:View ID="DetailsView" runat="server">
                    <uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
                    <h2><%= LocalizeString("FundHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="FundIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
                    <div class="row rvdsf-actionbar-container">
                        <div class="col-sm-6">
                        </div>
                        <div class="col-sm-6 text-sm-right">
                        </div>
                    </div>
                    <div id="FundDetailsViewTabPanel">
                        <ul class="dnnAdminTabNav dnnClear">
                            <li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
                                <asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" />
                                </a></li>
                            <li><a href="#<%= NotesDetailsViewPanel.ClientID %>">
                                <asp:Label ID="NotesDetailsViewTabLabel" runat="server" resourcekey="NotesDetailsViewTabLabel" />
                                </a></li>
                            <li><a href="#<%= HistoryDetailsViewPanel.ClientID %>">
                                <asp:Label ID="HistoryDetailsViewTabLabel" runat="server" resourcekey="HistoryDetailsViewTabLabel" />
                                </a></li>
                        </ul>
                        <asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="StatusLabelControl" runat="server" />
                                    <asp:DropDownList ID="StatusDropDownList" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="AmountLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="AmountRequiredFieldValidator" runat="server" ControlToValidate="AmountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="AmountCompareValidator" runat="server" ControlToValidate="AmountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" Operator="DataTypeCheck" Type="Double" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
                                    <asp:TextBox ID="AmountTextBox" runat="server" CssClass="rvd-form-number dnnFormRequired" value=""></asp:TextBox>
                                </div>
                            </fieldset>
                        </asp:Panel>
                        <asp:Panel ID="NotesDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="AdminNotesLabelControl" runat="server" />
                                    <asp:TextBox ID="AdminNotesTextBox" runat="server" MaxLength="4000" Rows="10" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </fieldset>
                        </asp:Panel>
                        <asp:Panel ID="HistoryDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <uc1:FundHistoryControl ID="FundHistoryControl1" runat="server" />
                            </fieldset>
                        </asp:Panel>
                    </div>
                    <div class="row rvdsf-footerbar-container">
                        <div class="col-sm-6">
                            
                        </div>
                        <div class="col-sm-6 text-sm-right">
                            <uc1:BackControl ID="BackControl" runat="server" ResourceKey="BackControl" />
                            <asp:LinkButton ID="SaveLinkButton" runat="server" CssClass="btn btn-primary rvdSaveAction" OnClick="SaveLinkButton_Click" resourcekey="SaveLinkButton" ValidationGroup="DetailsViewControl" />
                            <asp:LinkButton ID="SaveAndBackLinkButton" runat="server" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" OnClick="SaveLinkButton_Click" resourcekey="SaveAndBackLinkButton" ValidationGroup="DetailsViewControl" />
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
