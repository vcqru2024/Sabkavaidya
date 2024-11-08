<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddressValidationMethodConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.AddressValidationMethodConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<asp:MultiView ID="ContentMultiView" runat="server">
    <asp:View ID="ListView" runat="server">
        <h2><%= LocalizeString("AddressValidationMethodsHeader") %></h2>
        <div>
            <div class="row rvdsf-actionbar-container">
				<div class="col-sm-6">
								
				</div>
				<div class="col-sm-6 text-sm-right">
					<asp:HyperLink  ID="AddHyperLink" resourcekey="AddHyperLink" runat="server"  CssClass="btn btn-primary rvdAddNewAction" />
				</div>
			</div>
            <asp:GridView ID="AddressValidationMethodGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="AddressValidationMethodID" OnRowDeleting="AddressValidationMethodGridView_RowDeleting" OnRowDataBound="AddressValidationMethodGridView_RowDataBound">
                <PagerStyle CssClass="dnnGridPager" />
                <Columns>
                    <asp:TemplateField HeaderText="Country" SortExpression="CountryCode">
                        <ItemTemplate>
                            <asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="AddressValidationProvider" HeaderText="Provider" SortExpression="AddressValidationProvider" />
                    <asp:TemplateField HeaderStyle-Width="5%">
						<ItemTemplate>
							<asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" CausesValidation="false" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
						</ItemTemplate>
					</asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="AddressValidationMethodObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCount" SelectMethod="GetAll" SortParameterName="sortExpression" TypeName="Revindex.Business.Revindex.Revindex.Storefront.AddressValidationMethodController">
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
        <h2><%= LocalizeString("AddressValidationMethodHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="AddressValidationMethodIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
        <div>
            <hr />
            <fieldset>
                <div class="dnnFormItem">
                    <dnn1:LabelControl ID="CountryCodeLabelControl" runat="server" />
                    <asp:DropDownList ID="CountryCodeDropDownList" runat="server"></asp:DropDownList>
                </div>
                <div class="dnnFormItem">
                    <dnn1:LabelControl ID="AddressValidationProviderLabelControl" runat="server" CssClass="dnnFormRequired" />
                    <asp:DropDownList ID="AddressValidationProviderDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="AddressValidationProviderDropDownList_SelectedIndexChanged">
                        <asp:ListItem Text="AvaTax" Value="AvaTax" />
                        <asp:ListItem Text="SkyNet" Value="SkyNet" />
                        <asp:ListItem Text="USPS" Value="USPS" />
                    </asp:DropDownList>
					<asp:HyperLink ID="AddressValidationProviderHyperLink" runat="server" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
                </div>
                <div class="dnnFormItem">
                    <dnn1:LabelControl ID="ValidationSeverityLabelControl" runat="server" CssClass="dnnFormRequired" />
                    <asp:DropDownList ID="ValidationSeverityDropDownList" runat="server"></asp:DropDownList>
                </div>
            </fieldset>
            <div class="row rvdsf-footerbar-container">
                <div class="col-sm-6">
                    <asp:LinkButton  ID="DeleteLinkButton" resourcekey="DeleteLinkButton" runat="server"  CssClass="btn btn-default btn-light" CausesValidation="false" OnClick="DeleteLinkButton_Click" OnClientClick="return Revindex.Web.ConfirmDelete()"></asp:LinkButton>         
                </div>
                <div class="col-sm-6 text-sm-right">
                    <uc1:BackControl  ID="BackControl" resourcekey="BackControl" runat="server"  />
                    <asp:LinkButton  ID="SaveLinkButton" resourcekey="SaveLinkButton" runat="server"  OnClick="SaveLinkButton_Click" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
                    <asp:LinkButton  ID="SaveAndBackLinkButton" resourcekey="SaveAndBackLinkButton" runat="server"  OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl"/>
                </div>
            </div>
        </div>
    </asp:View>
</asp:MultiView>
