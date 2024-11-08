<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.UserVendor_ItemInCart, App_Web_uservendor_itemincart.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<style type="text/css">
.CrossGrid th{
  text-align:center;
}
</style>

<script type="text/javascript">
    function checkAll() {
        if ($(":checkbox[id*='chkAll']").prop("checked") == true) {
            $(":checkbox[id*='chkItem']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem']").prop("checked", false);
        }
    }
</script>
<table width="100%" class="dnnFormItem" align="center">
    <tr>
        <td>
            <asp:Label ID="lblOrderTip" runat="server" resourcekey="lblOrderTip" CssClass="dnnFormMessage dnnFormInfo" />
            <br />
        </td>
    </tr>
    <tr>
        <td align="center">
            <dnn:CommandButton ID="btnUpdate" runat="server" ResourceKey="cmdUpdate" ImageUrl="~/images/save.gif"
                OnCommand="btnUpdate_Click" Visible="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnDelete" runat="server" ResourceKey="cmdDelete" ImageUrl="~/images/delete.gif"
                OnCommand="btnDelete_Click" Visible="false" CausesValidation="false" OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnCancel" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                OnCommand="btnCancel_Click" Visible="false" CausesValidation="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnDeleteSelected" runat="server" ResourceKey="btnDeleteSelected"
                CausesValidation="false" ImageUrl="~/images/delete.gif" OnCommand="btnDeleteSelected_Click"
                OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItems",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
            &nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnMyAccount" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
</table>
<table align="center" width="100%" class="dnnFormItem" id="tbl_List" runat="server">
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblClient" runat="server" resourcekey="lblClient" />
            <asp:DropDownList ID="ddlClient" runat="server" DataTextField="Text" DataValueField="Value"
                Width="200px">
            </asp:DropDownList>
            <asp:Label ID="lblProduct" runat="server" resourcekey="lblProduct" />
            <asp:DropDownList ID="ddlProduct" runat="server" DataTextField="Text" DataValueField="Value"
                Width="300px">
            </asp:DropDownList>
            <asp:Label ID="lblPageSize" runat="server" resourcekey="lblPageSize" />
            <asp:DropDownList ID="ddlPageSize" runat="server" Width="80px">
                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                <asp:ListItem Text="20" Value="20" Selected="True"></asp:ListItem>
                <asp:ListItem Text="30" Value="30"></asp:ListItem>
                <asp:ListItem Text="40" Value="40"></asp:ListItem>
                <asp:ListItem Text="50" Value="50"></asp:ListItem>
                <asp:ListItem Text="60" Value="60"></asp:ListItem>
                <asp:ListItem Text="70" Value="70"></asp:ListItem>
                <asp:ListItem Text="80" Value="80"></asp:ListItem>
                <asp:ListItem Text="90" Value="90"></asp:ListItem>
                <asp:ListItem Text="100" Value="100"></asp:ListItem>
                <asp:ListItem Text="200" Value="200"></asp:ListItem>
                <asp:ListItem Text="500" Value="500"></asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <dnn:CommandButton ID="btnSearch" runat="server" CausesValidation="false" ImageUrl="~/images/icon_search_16px.gif"
                ResourceKey="btnSearch" OnCommand="btnSearch_Click" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="Id" OnRowCommand="gvList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecords" Text='<%# Localization.GetString("NoRecords",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAll" runat="server" onclick="checkAll()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItem" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Select"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgEdit",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />
                            <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif" AlternateText='<%#Localization.GetString("imgDel",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblProductName" runat="server" resourcekey="lblProductName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlProductNameData" runat="server" Text='<%# Eval("ProductName") %>'
                                Target="_blank" NavigateUrl='<%#GetProductUrl(Convert.ToString(Eval("ProductId"))) %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblOptionName" runat="server" resourcekey="lblOptionName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblOptionNameData" runat="server" Text='<%#Eval("OptionName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblClientName" runat="server" resourcekey="lblClientName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblClientNameData" runat="server" Text='<%#Eval("ClientName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCreatedDateData" runat="server" Text='<%#Eval("CreatedDate")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblUnitPrice" runat="server" resourcekey="lblUnitPrice"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUnitPriceData" runat="server" Text='<%#Eval("UnitPrice") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblQuantity" runat="server" resourcekey="lblQuantity">Quantity</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblQuantityData" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblTaxFee" runat="server" resourcekey="lblTaxFee"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTaxFeeData" runat="server" Text='<%#Eval("TaxFee") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblShipFee" runat="server" resourcekey="lblShipFee"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblShipFeeData" runat="server" Text='<%#Eval("ShipFee") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblItemSum" runat="server" resourcekey="lblItemSum"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblItemSumData" runat="server" Text='<%#Eval("ItemSum") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblCoupon" runat="server" resourcekey="lblCoupon"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCouponData" runat="server" Text='<%#Eval("Coupon") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblVariant" runat="server" resourcekey="lblVariant"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblVariantData" runat="server" Text='<%#Eval("VariantValue") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblOrderMemo" runat="server" resourcekey="lblOrderMemo"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblOrderMemoData" runat="server" Text='<%#Eval("OrderMemo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblDiscountRequest" runat="server" resourcekey="lblDiscountRequest"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDiscountRequestData" runat="server" Text='<%#Eval("DiscountRequest") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblDiscountResponse" runat="server" resourcekey="lblDiscountResponse"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDiscountResponseData" runat="server" Text='<%#Eval("DiscountResponse") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" Wrap="true" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="CrossGrid"
                    Wrap="true" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" HorizontalAlign="Left" Wrap="true" />
                <EditRowStyle BackColor="#999999" Wrap="true" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr align="left" valign="top">
        <td>
            <cross:PagingControl ID="ctlPagingControl" runat="server" Mode="PostBack" OnPageChanged="ctlPagingControl_PageChanged">
            </cross:PagingControl>
        </td>
    </tr>
    <tr>
        <td>
            <div class="dnnTreeLegend" id="divLegend" runat="server">
                <h6>
                    <asp:Label ID="lblLegend" runat="server" resourcekey="lblLegend" /></h6>
                <div class="dtlItem">
                    <img alt="" id="Img1" runat="server" src="~/images/edit.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblEdit" runat="server" Text='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img7" runat="server" src="~/images/delete.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblDelete" runat="server" Text='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </div>
        </td>
    </tr>
</table>
<table align="center" width="100%" id="tblDetail" runat="server" visible="False"
    class="dnnFormItem">
    <tr>
        <td colspan="2">
            <div class="dnnFormItem dnnFormHelp dnnClear">
                <p align="right">
                    <span>
                        <asp:Image ID="Image16" runat="server" ImageUrl="~/images/rew.gif" />
                        <%=LocalizeString("Tip_ValueCanBeModify")%>
                    </span>
                </p>
            </div>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:Label ID="plProductName" runat="server"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtProductName" runat="server" Columns="70" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
    <tr runat="server" id="trOption">
        <td>
            <dnn:Label ID="plOption" runat="server" ControlName="ddlOption"></dnn:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlOption" runat="server" Width="450px" Enabled="false">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plQuantity" runat="server" ControlName="txtQuantity"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtQuantity" runat="server" Columns="10" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plUnitPrice" runat="server" ControlName="txtUnitPrice"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtUnitPrice" runat="server" Columns="20" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plProductSum" runat="server" ControlName="txtProductSum"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtProductSum" runat="server" Columns="20" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plShipFee" runat="server" ControlName="txtShipFee"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtShipFee" runat="server" Columns="20" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plTaxFee" runat="server" ControlName="txtTaxFee"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtTaxFee" runat="server" Columns="20" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label1" runat="server" resourcekey="Tip_EditSum" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plItemSum" runat="server" ControlName="txtItemSum"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtItemSum" runat="server" Columns="20"></asp:TextBox>
            <asp:Image ID="Image18" runat="server" ImageUrl="~/images/rew.gif" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plCoupon" runat="server" ControlName="txtCoupon"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtCoupon" runat="server" Columns="40" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plOrderMemo" runat="server" ControlName="txtOrderMemo"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOrderMemo" runat="server" Columns="70" Height="150px" TextMode="MultiLine"
                ReadOnly="true" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plDiscountRequest" runat="server" ControlName="txtDiscountRequest">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtDiscountRequest" runat="server" Columns="70" ReadOnly="true"
                Height="150px" TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label2" runat="server" resourcekey="Tip_DiscountResponse" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plDiscountResponse" runat="server" ControlName="txtDiscountResponse">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtDiscountResponse" runat="server" Columns="70" Height="150px"
                TextMode="MultiLine" />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/rew.gif" />
        </td>
    </tr>
</table>
