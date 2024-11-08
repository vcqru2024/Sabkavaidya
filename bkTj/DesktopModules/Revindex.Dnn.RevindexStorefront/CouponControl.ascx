<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CouponControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.CouponControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="CouponAvailabilityRuleControl.ascx" TagName="CouponAvailabilityRuleControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
    
<script type="text/javascript">
    Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))

        $('#CouponDetailsViewTabPanel').dnnTabs()
    })
</script>

<div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
            <asp:MultiView ID="ContentMultiView" runat="server">
                <asp:View ID="ListView" runat="server">
                    <h2><%= LocalizeString("CouponsHeader") %></h2>
                    <div class="rvdsfListContainer">
                        <div class="row rvdsf-actionbar-container">
							<div class="col-sm-6">
								
							</div>
							<div class="col-sm-6 text-sm-right">
								<asp:HyperLink ID="AddHyperLink" resourcekey="AddHyperLink" runat="server" CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-CouponDetailsViewTabPanel', '/')" />
							</div>
						</div>
                        <asp:GridView ID="CouponGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CouponID" OnRowDeleting="CouponGridView_RowDeleting" OnRowDataBound="CouponGridView_RowDataBound">
                            <PagerStyle CssClass="dnnGridPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="Code" SortExpression="Code">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" Text='<%# Eval("Code") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                                <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
                                <asp:BoundField DataField="StopDate" HeaderText="StopDate" SortExpression="StopDate" />
                                <asp:TemplateField HeaderStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="CouponObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCount" SelectMethod="GetAll" SortParameterName="sortExpression" TypeName="Revindex.Business.Revindex.Revindex.Storefront.CouponController">
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
                    <h2><%= LocalizeString("CouponHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label runat="server" ID="CouponIDLabel" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
                    <div id="CouponDetailsViewTabPanel">
                        <ul class="dnnAdminTabNav dnnClear">
                            <li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
                                <asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
                            <li><a href="#<%= AvailabilityDetailsViewPanel.ClientID %>">
                                <asp:Label ID="AvailabilityDetailsViewTabLabel" runat="server" resourcekey="AvailabilityDetailsViewTabLabel" /></a></li>
                        </ul>
                        <asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="CodeLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CodeTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="CodeTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="CodeTextBox" runat="server" CssClass="dnnFormRequired" MaxLength="100"></asp:TextBox>
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
                                    <dnn1:LabelControl ID="StartDateLabelControl" runat="server" />
                                    <asp:TextBox ID="StartDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm"/>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="StopDateLabelControl" runat="server" EnableViewState="False" />
                                    <asp:TextBox ID="StopDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm"/>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="InventoryLabelControl" runat="server" />
                                    <asp:RangeValidator ID="InventoryRangeValidator" runat="server" ControlToValidate="InventoryTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			                        <asp:TextBox ID="InventoryTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
                                </div>
                            </fieldset>
                        </asp:Panel>
                        <asp:Panel ID="AvailabilityDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <uc1:CouponAvailabilityRuleControl ID="AvailabilityRuleControl" runat="server" Width="100%" />
                            </fieldset>
                        </asp:Panel>
                    </div>
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
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>