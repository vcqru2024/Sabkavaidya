<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReportControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ReportControl" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>

<script type="text/javascript">
    Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))
    })
</script>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<asp:MultiView ID="ContentMultiView" runat="server">
    <asp:View ID="ListView" runat="server">
        <h2><%= LocalizeString("ReportsHeader") %></h2>
        <div class="rvdsfListContainer">
            <div class="row rvdsf-actionbar-container">
				<div class="col-sm-6">
								
				</div>
				<div class="col-sm-6 text-sm-right">
					
				</div>
			</div>
            <asp:GridView ID="ReportDefinitionGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AllowSorting="False" AutoGenerateColumns="False" DataKeyNames="ReportDefinitionID" Width="100%" AllowPaging="False" OnRowDataBound="ReportDefinitionGridView_RowDataBound">
                <PagerStyle CssClass="dnnGridPager" />
                <Columns>
                    <asp:TemplateField HeaderText="Name" SortExpression="Name" HeaderStyle-Width="30%">
                        <ItemTemplate>
                            <asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" Text='<%# Eval("Name") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Description" HeaderText="Description"/>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ReportDefinitionObjectDataSource" runat="server" EnablePaging="False" SelectCountMethod="GetActiveReportDefinitionsCount" SelectMethod="GetActiveReportDefinitions" TypeName="Revindex.Dnn.RevindexStorefront.ReportControl" DataObjectTypeName="Revindex.Business.Revindex.Revindex.Storefront.ReportDefinition">
                <SelectParameters>
                    <rvd1:UserControlParameter Name="portalID" PropertyName="PortalId" Type="Int32" />
                    <rvd1:UserControlParameter Name="reportGroup" PropertyName="ReportGroup" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>

    </asp:View>
    <asp:View ID="DetailsView" runat="server">
        <uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
        <h2><%= LocalizeString("ReportHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /></h2>
        <p><asp:Label ID="DescriptionLabel" runat="server" Text="" /></p>
        <hr />
        <div class="rvdsfSearchContainer">
            <fieldset>
                <asp:ListView ID="DynamicFormListView" runat="server" GroupItemCount="1" OnItemCreated="DynamicFormListView_ItemCreated">
                    <LayoutTemplate>
                        <div runat="server" id="groupPlaceholder" />
                    </LayoutTemplate>
                    <GroupTemplate>
                        <div runat="server" id="itemPlaceholder" />
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="dnnFormItem rvdsfDynamicFormItem">
                            <asp:PlaceHolder ID="LabelDynamicFormPlaceHolder" runat="server"></asp:PlaceHolder>
                            <asp:PlaceHolder ID="ValidatorDynamicFormPlaceHolder" runat="server"></asp:PlaceHolder>
                            <asp:PlaceHolder ID="InputControlDynamicFormPlaceHolder" runat="server"></asp:PlaceHolder>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </fieldset>
            <div class="row rvdsf-actionbar-container">
                <div class="col-sm-6">
                                
                </div>
                <div class="col-sm-6 text-sm-right">
                    <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
                    <asp:LinkButton ID="ExportLinkButton" runat="server" resourcekey="ExportLinkButton" OnClick="ExportLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary" />
                    <asp:LinkButton ID="ViewLinkButton" runat="server" resourcekey="ViewLinkButton" OnClick="ViewLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <hr />
        <fieldset>
            <asp:Literal ID="HtmlReportLiteral" runat="server" ViewStateMode="Disabled"></asp:Literal>
        </fieldset>
    </asp:View>
</asp:MultiView>
