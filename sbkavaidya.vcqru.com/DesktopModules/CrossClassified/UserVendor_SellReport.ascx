<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.UserVendor_SellReport, App_Web_uservendor_sellreport.ascx.87459c53" %>
<%@ Register TagPrefix="cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<style type="text/css">
.CrossGrid th{
  text-align:center;
}
</style>

<script type="text/javascript">
    function checkAll_Main() {
        if ($(":checkbox[id*='chkAll_Main']").prop("checked") == true) {
            $(":checkbox[id*='chkItem_Main']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_Main']").prop("checked", false);
        }
    }
</script>

<table width="100%" class="dnnFormItem" cellpadding="0" cellspacing="0" border="0" runat="server"
    id="tblButton">
    <tr>
        <td id="td_Button_Search" runat="server">
            <asp:Label ID="lblStart" runat="server" resourcekey="lblStart" />
            <asp:TextBox ID="txtStart" MaxLength="10" Columns="10" runat="server" Width="120px" />
            <asp:HyperLink ID="hlStart" Text="Calendar" resourcekey="Calendar"
                runat="server" />
            <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="NormalRed"
                ControlToValidate="txtStart" resourcekey="Date.ErrorMessage" ErrorMessage="<br>You have entered an invalid date!"
                Display="Dynamic" Type="Date" Operator="DataTypeCheck" />&nbsp;&nbsp;
            <asp:Label ID="lblEnd" runat="server" resourcekey="lblEnd" />
            <asp:TextBox ID="txtEnd" MaxLength="10" Columns="10" runat="server" Width="120px"/>
            <asp:HyperLink ID="hlEnd" Text="Calendar" resourcekey="Calendar"
                runat="server" />
            <asp:CompareValidator ID="CompareValidator2" runat="server" CssClass="NormalRed"
                ControlToValidate="txtEnd" resourcekey="Date.ErrorMessage" ErrorMessage="<br>You have entered an invalid date!"
                Display="Dynamic" Type="Date" Operator="DataTypeCheck" /><br />
            <asp:Label ID="lblProduct" runat="server" resourcekey="lblProduct" />
            <asp:TextBox ID="txtProduct" Columns="60" runat="server" Width="300px"/><br />
            <asp:Label ID="lblInvoiceId" runat="server" resourcekey="lblInvoiceId" />
            <asp:TextBox ID="txtInvoiceNo" Columns="40" runat="server" Width="300px"/><br />
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
            <asp:Label ID="lblOrderStatus" runat="server" resourcekey="lblOrderStatus" />
            <asp:DropDownList ID="ddlOrderStatus" runat="server" Width="200px">
                <asp:ListItem Value="-1" resourcekey="OrderStatus_All"></asp:ListItem>
                <asp:ListItem Value="0" resourcekey="OrderStatus_Paid"></asp:ListItem>
                <asp:ListItem Value="1" resourcekey="OrderStatus_AwaitingPayment"></asp:ListItem>
                <asp:ListItem Value="2" resourcekey="OrderStatus_Canceled"></asp:ListItem>
                <asp:ListItem Value="3" resourcekey="OrderStatus_Refunded"></asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <dnn:CommandButton ID="btnSearch" runat="server" CausesValidation="false" ImageUrl="~/images/icon_search_16px.gif"
                ResourceKey="btnSearch" OnCommand="btnSearch_Click" />
        </td>
        <td>
            <asp:Label ID="lblOrderDetail" runat="server" Visible="false" CssClass="SubHead" />&nbsp;&nbsp;
            <dnn:CommandButton ID="btnCancel" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                OnCommand="btnCancel_Click" Visible="false" CausesValidation="false" />
            &nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnMyAccount" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
    <tr>
        <td colspan="2" >
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr runat="server" id="tr_Button_Delete">
        <td colspan="2" align="center">
            <dnn:CommandButton ID="btnDeleteSelected" runat="server" ResourceKey="btnDeleteSelected" Visible="<%#Settings_Portal.Order.EnableDeleteOrder%>"
                CausesValidation="false" ImageUrl="~/images/delete.gif" OnCommand="btnDeleteSelected_Click"
                OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItems", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
            &nbsp;&nbsp;
            <asp:Label ID="lblChangeOrderStatus" runat="server" resourcekey="lblChangeOrderStatus" />
            <asp:DropDownList ID="ddlChangeOrderStatus" runat="server" Width="150px">
                <asp:ListItem Value="0" resourcekey="OrderStatus_Paid"></asp:ListItem>
                <asp:ListItem Value="1" resourcekey="OrderStatus_AwaitingPayment"></asp:ListItem>
                <asp:ListItem Value="2" resourcekey="OrderStatus_Canceled"></asp:ListItem>
                <asp:ListItem Value="3" resourcekey="OrderStatus_Refunded"></asp:ListItem>
            </asp:DropDownList>
            <dnn:CommandButton ID="btnChangeOrderStatus" runat="server" ResourceKey="btnChangeOrderStatus" CausesValidation="false"
                ImageUrl="~/DesktopModules/CrossClassified/Images/accept.png" OnCommand="btnChangeOrderStatus_Click"
                OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("ChangeOrderStatus", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
        </td>
    </tr>
</table>
<table  width="100%" class="dnnFormItem" id="tblOrderDetailList" runat="server">
    <tr>
        <td align="right">
            <asp:GridView ID="gvOrderDetail" runat="server" AutoGenerateColumns="False" CellPadding="1"  CellSpacing="1"  GridLines="Both" BackColor="Gray"
                Width="100%"  ForeColor="#333333" DataKeyNames="Id" OnRowCommand="gvOrderDetail_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecords" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                 <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAll_Main" runat="server" onclick="checkAll_Main()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItem_Main" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                  <asp:TemplateField  HeaderStyle-HorizontalAlign="Center" >
                    <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction"/>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgViewOrderDetail" runat="server" CausesValidation="False"
                                CommandName="ViewOrderDetail" CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgViewOrderDetail", LocalResourceFile)%>'
                                ImageUrl="~/images/icon_search_16px.gif" AlternateText='<%#Localization.GetString("imgViewOrderDetail", LocalResourceFile)%>' />

                                <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif" AlternateText='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' 
                                 Visible="<%#Settings_Portal.Order.EnableDeleteOrder%>"/>

                              <asp:ImageButton ID="imgViewUpload_Client" runat="server" CausesValidation="False" CommandName="ViewUpload_Client"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgViewUpload_Client",LocalResourceFile)%>'
                                ImageUrl="~/desktopmodules/crossclassified/images/up.gif" AlternateText='<%#Localization.GetString("imgViewUpload_Client",LocalResourceFile)%>'
                                Visible='<%#(Convert.ToInt32(Eval("OrderStatus"))==0) && (AllowUpload_Client(Convert.ToInt32(Eval("TypeId")))) %>' />

                             <asp:ImageButton ID="imgViewUpload_Vendor" runat="server" CausesValidation="False" CommandName="ViewUpload_Vendor"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgViewUpload_Vendor",LocalResourceFile)%>'
                                ImageUrl="~/desktopmodules/crossclassified/images/watch.png" AlternateText='<%#Localization.GetString("imgViewUpload_Vendor",LocalResourceFile)%>'
                                Visible='<%#(Convert.ToInt32(Eval("OrderStatus"))==0) && (AllowUpload_Vendor(Convert.ToInt32(Eval("TypeId")))) %>' />

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblInvoiceNo" runat="server" resourcekey="lblInvoiceNo"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblInvoiceNoData" runat="server" Text='<%#Eval("InvoiceNo") %>'></asp:Label>
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
                    <asp:TemplateField>
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
                        <ItemStyle HorizontalAlign="Center" />
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
                            <asp:Label ID="lblOrderStatus" runat="server" resourcekey="lblOrderStatus"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblOrderStatusData" runat="server" Text='<%#GetOrderStatus(Convert.ToInt32(Eval("OrderStatus"))) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblShippingStatus" runat="server" resourcekey="lblShippingStatusHead"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblShippingStatusData" runat="server" Text='<%#GetShippingStatus(Convert.ToInt32(Eval("ShippingStatus"))) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblRecursiveCharge" runat="server" resourcekey="lblRecursiveCharge"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:checkbox ID="lblRecursiveChargeData" runat="server"  Checked='<%#Eval("RecursiveBill") %>' Enabled="false"/>
                        </ItemTemplate>
                         <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    
                      <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblNextBillDate" runat="server" resourcekey="lblNextBillDate"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNextBillDateData" runat="server"  
                            Text='<%#Convert.ToBoolean(Convert.ToString(Eval("RecursiveBill")))==false?"":Convert.ToDateTime(Eval("NextBillDate")).ToShortDateString() %>'/>
                        </ItemTemplate>
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
                        <ItemStyle HorizontalAlign="left" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblDiscountRequest" runat="server" resourcekey="lblDiscountRequest"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDiscountRequestData" runat="server" Text='<%#Eval("DiscountRequest") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="left" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblDiscountResponse" runat="server" resourcekey="lblDiscountResponse"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDiscountResponseData" runat="server" Text='<%#Eval("DiscountResponse") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="left" />
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
            <br />
            <asp:Label ID="lblSummary" runat="server" resourcekey="lblSummary"></asp:Label>
            <asp:Label ID="lblSummaryField" CssClass="NormalRed" runat="server"></asp:Label>
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
    <tr >
        <td>
            <div class="dnnTreeLegend" id="divLegend" runat="server">
                <h6>
                    <asp:Label ID="lblLegend" runat="server" resourcekey="lblLegend" /></h6>
                <div class="dtlItem">
                    <img alt="" id="Img1" runat="server" src="~/images/icon_search_16px.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblEdit" runat="server" Text='<%#Localization.GetString("imgViewOrderDetail", LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <%if (Settings_Portal.Order.EnableDeleteOrder)
                      {
                    %>
                    <img alt="" id="Img7" runat="server" src="~/images/delete.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblDelete" runat="server" Text='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />
                    <% } %>
                    <br />
                    <img alt="" id="Img6" runat="server" src="~/desktopmodules/crossclassified/images/up.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="litUpload_Client" runat="server" Text='<%#Localization.GetString("imgViewUpload_Client",LocalResourceFile)%>' />  <br />

                    <img alt="" id="Img2" runat="server" src="~/desktopmodules/crossclassified/images/watch.png" />&nbsp;=&nbsp;
                    <asp:Literal ID="litUpload_Vendor" runat="server" Text='<%#Localization.GetString("imgViewUpload_Vendor",LocalResourceFile)%>' />
                </div>
            </div>
        </td>
    </tr>
</table>

<table  width="100%" class="dnnFormItem" id="tblOrder" runat="server">
    <tr>
        <td>
            <br />
            <asp:Label ID="lblOrderNo" runat="server" />
            <br />
            <asp:Label ID="lblOrderDate" runat="server" />
            <br />
            <br />
            <asp:Label ID="lblProductInOrder" runat="server" resourcekey="lblProductInOrder" />
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr>
        <td align="right">
            <asp:GridView ID="gvDetailInOrder" runat="server" AutoGenerateColumns="False" CellPadding="1"  CellSpacing="1"  GridLines="Both" BackColor="Gray"
                Width="100%"  ForeColor="#333333" DataKeyNames="Id">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecords" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblInvoiceNo" runat="server" resourcekey="lblInvoiceNo"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblInvoiceNoData" runat="server" Text='<%#Eval("InvoiceNo") %>'></asp:Label>
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
                         <asp:Label ID="lblClientNameData" runat="server" Text='<%# Eval("ClientName") %>'/>
                           
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
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
                        <ItemStyle HorizontalAlign="Center" />
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
                            <asp:Label ID="lblOrderStatus" runat="server" resourcekey="lblOrderStatus"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblOrderStatusData" runat="server" Text='<%#GetOrderStatus(Convert.ToInt32(Eval("OrderStatus"))) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                      <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblShippingStatus" runat="server" resourcekey="lblShippingStatusHead"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblShippingStatusData" runat="server" Text='<%#GetShippingStatus(Convert.ToInt32(Eval("ShippingStatus"))) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblRecursiveCharge" runat="server" resourcekey="lblRecursiveCharge"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:checkbox ID="lblRecursiveChargeData" runat="server"  Checked='<%#Eval("RecursiveBill") %>' Enabled="false"/>
                        </ItemTemplate>
                         <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    
                      <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblNextBillDate" runat="server" resourcekey="lblNextBillDate"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNextBillDateData" runat="server"  
                            Text='<%#Convert.ToBoolean(Convert.ToString(Eval("RecursiveBill")))==false?"":Convert.ToDateTime(Eval("NextBillDate")).ToShortDateString() %>'/>
                        </ItemTemplate>
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
                        <ItemStyle HorizontalAlign="left" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblDiscountRequest" runat="server" resourcekey="lblDiscountRequest"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDiscountRequestData" runat="server" Text='<%#Eval("DiscountRequest") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="left" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblDiscountResponse" runat="server" resourcekey="lblDiscountResponse"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDiscountResponseData" runat="server" Text='<%#Eval("DiscountResponse") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="left" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" Wrap="true" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="CrossGrid"
                    Wrap="true" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" HorizontalAlign="left" Wrap="true" />
                <EditRowStyle BackColor="#999999" Wrap="true" />
            </asp:GridView>
            <br />
            <asp:Label ID="lblSummary1" runat="server" resourcekey="lblSummary"></asp:Label>
            <asp:Label ID="lblSummaryInOrder" CssClass="NormalRed" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
     
</table>

 <dnn:SectionHead ID="secShipping" runat="server" Section="tblShipping" ResourceKey="secShipping"
                IncludeRule="True" IsExpanded="true" CssClass="SubHead"></dnn:SectionHead>
<table id="tblShipping" cellspacing="0" cellpadding="2" width="100%" border="0"  class="dnnFormItem"
    visible="false" runat="server">
    <tr>
        <td colspan="2">
           <asp:Label ID="lblShippingTip" runat="server" resourcekey="lblShippingTip" CssClass="dnnFormMessage dnnFormInfo"/>
        </td>
    </tr>
      <tr>
        <td style="width: 150px">
           <dnn:Label ID="plShippingMethod" runat="server" ControlName="txtShippingMethod"></dnn:Label>
           
        </td>
        <td>
             <asp:TextBox ID="txtShippingMethod" Columns="70" runat="server"  />
        </td>
    </tr>
     <tr>
        <td>
           <dnn:Label ID="plShippingNo" runat="server" ControlName="txtShippingNo"></dnn:Label>
           
        </td>
        <td>
             <asp:TextBox ID="txtShippingNo" Columns="70" runat="server"  />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plShippingStatus" runat="server" ControlName="ddlShippingStatus"></dnn:Label>
        </td>
        <td>
             <asp:DropDownList ID="ddlShippingStatus" runat="server">
                <asp:ListItem Value="0" resourcekey="li_ShippingStatus_NotRequired"></asp:ListItem>
                <asp:ListItem Value="1" resourcekey="li_ShippingStatus_NotShipped"></asp:ListItem>
                <asp:ListItem Value="2" resourcekey="li_ShippingStatus_Packing"></asp:ListItem>
                <asp:ListItem Value="3" resourcekey="li_ShippingStatus_Packed"></asp:ListItem>
                <asp:ListItem Value="4" resourcekey="li_ShippingStatus_Dispatching"></asp:ListItem>
                <asp:ListItem Value="5" resourcekey="li_ShippingStatus_Delivered"></asp:ListItem>
                <asp:ListItem Value="6" resourcekey="li_ShippingStatus_Undeliverable"></asp:ListItem>
                <asp:ListItem Value="7" resourcekey="li_ShippingStatus_OtherStatus"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
     <tr>
        <td>
           <dnn:Label ID="plClientSignDate" runat="server" ControlName="txtClientSignDate"></dnn:Label>
           
        </td>
        <td>
             <asp:TextBox ID="txtClientSignDate" Columns="70" runat="server" ReadOnly="true" Enabled="false"/>
        </td>
    </tr>
     <tr>
        <td colspan="2" align="center">
              <dnn:CommandButton ID="btnUpdateShipping" runat="server" ResourceKey="btnUpdateShipping" CausesValidation="false"
                ImageUrl="~/DesktopModules/CrossClassified/Images/ship.png" OnCommand="btnUpdateShipping_Click" />
        </td>
    </tr>
</table>

<table id="tblAddress" cellspacing="0" cellpadding="2" width="100%" border="0" align="left" class="dnnFormItem"
    visible="false" runat="server">
    <tr>
        <td colspan="2">
            <dnn:SectionHead ID="secBillAddress" runat="server" Section="tblAddress_Bill" ResourceKey="secBillAddress"
                IncludeRule="True" IsExpanded="true" CssClass="SubHead"></dnn:SectionHead>
            <table id="tblAddress_Bill" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblFirstName" runat="server" ResourceKey="lblFirstName" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstName" Columns="70" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblLastName" runat="server" ResourceKey="lblLastName" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtLastName" Columns="70" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                  <tr>
                    <td >
                        <asp:Label ID="lblTitle" runat="server" ResourceKey="lblTitle" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtTitle" Columns="70" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                  <tr >
                    <td >
                        <asp:Label ID="lblAddressEmail" runat="server" ResourceKey="lblAddressEmail" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddressEmail" Columns="40" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblCountryCode" runat="server" ResourceKey="lblCountryCode" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtCountryCode" Columns="40" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblRegionCode" runat="server" ResourceKey="lblRegionCode" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtRegionCode" Columns="40" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblCity" runat="server" ResourceKey="lblCity" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity" Columns="40" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblPostalCode" runat="server" ResourceKey="lblPostalCode" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtPostalCode" Columns="40" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblAddress1" runat="server" ResourceKey="lblAddress1" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress1" Columns="70" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblAddress2" runat="server" ResourceKey="lblAddress2" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress2" Columns="70" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblPhone1" runat="server" ResourceKey="lblPhone1" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone1" Columns="40" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblPhone2" runat="server" ResourceKey="lblPhone2" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone2" Columns="40" runat="server" ReadOnly="true" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
      <tr id="tr_Address_ShipMethod" runat="server">
        <td style="width: 150px">
            <asp:Label ID="lblShipMethod" ResourceKey="lblShipMethod" runat="server"></asp:Label>
        </td>
        <td>
             <asp:TextBox ID="txtShipMethod" Columns="40" runat="server" ReadOnly="true" />
        </td>
    </tr>
    <tr id="tr_Address_ShipSameAsBill" runat="server">
        <td style="width: 150px">
            <asp:Label ID="lblShipAddressOption" ResourceKey="lblShipAddressOption" runat="server"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="chkShipAddressOption_Same" runat="server" Enabled="false" ResourceKey="chkShipAddressOption_Same"
                Checked="true" />
        </td>
    </tr>
    <tr runat="server" id="tr_Address_ShipAddress">
        <td colspan="2">
            <dnn:SectionHead ID="secShipAddress" runat="server" Section="tblAddress_Ship" ResourceKey="secShipAddress"
                IncludeRule="True" IsExpanded="true" CssClass="SubHead"></dnn:SectionHead>
            <table id="tblAddress_Ship" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblFirstName1" runat="server" ResourceKey="lblFirstName" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstName1" Columns="70" runat="server" ReadOnly="true"  />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblLastName1" runat="server" ResourceKey="lblLastName" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtLastName1" Columns="70" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                  <tr>
                    <td >
                        <asp:Label ID="lblTitle1" runat="server" ResourceKey="lblTitle" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtTitle1" Columns="70" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                  <tr >
                    <td >
                        <asp:Label ID="lblAddressEmail1" runat="server" ResourceKey="lblAddressEmail" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddressEmail1" Columns="40" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblCountryCode1" runat="server" ResourceKey="lblCountryCode" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtCountryCode1" Columns="40" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblRegionCode1" runat="server" ResourceKey="lblRegionCode" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtRegionCode1" Columns="40" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblCity1" runat="server" ResourceKey="lblCity" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity1" Columns="40" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblPostalCode1" runat="server" ResourceKey="lblPostalCode" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtPostalCode1" Columns="40" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblAddress11" runat="server" ResourceKey="lblAddress1" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress11" Columns="70" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblAddress21" runat="server" ResourceKey="lblAddress2" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress21" Columns="70" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblPhone11" runat="server" ResourceKey="lblPhone1" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone11" Columns="40" runat="server" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblPhone21" runat="server" ResourceKey="lblPhone2" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone21" Columns="40" runat="server" ReadOnly="true" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<table id="tblOrderDetail_Upload_Client" cellspacing="0" cellpadding="2" border="0" align="left"
    width="100%" class="dnnFormItem" visible="false" runat="server">
    <tr>
        <td>
            <asp:Label ID="lblUpload_Client" runat="server" CssClass="SubHead"  resourcekey="lblUpload_Client"/><br /><br />
           <asp:Label ID="lblUploadSummary_Client" runat="server" />
            <hr style="border: 1px dotted #999999; size: 1" />
          
            <asp:GridView ID="gvUploadList_Client" runat="server" AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" GridLines="Both" BackColor="Gray"
                Width="100%" ForeColor="#333333" DataKeyNames="Id">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecordes" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblFileName" runat="server" resourcekey="lblFileName">FileName</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFileNameField" runat="server" Text='<%# Eval("FileName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblTitle" runat="server" resourcekey="lblUploadTitle"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTitleField" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblSize" runat="server" resourcekey="lblSize"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSizeField" runat="server"
                                Text='<%#Cross.Modules.CP_Product.Business.LocalUtils.FormatFileSize(Convert.ToString(Eval("FileSize"))) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate">Created Date</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCreatedDateField" runat="server" Text='<%#  Convert.ToDateTime(Eval("CreatedDate")).ToShortDateString() %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblDownload" runat="server" resourcekey="lblDownload" />
                        </HeaderTemplate>
                        <ItemTemplate>
                          <asp:HyperLink ID="hlDownload" runat="server" Text='<%# Localization.GetString("lblDownload", LocalResourceFile) %>'
                                Target="_blank" NavigateUrl='<%#GetUploadFileUrl(Convert.ToString(Eval("Id")),Cross.Modules.CP_Product.Business.LocalUtils.FileUploadFrom_Client) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"  CssClass="CrossGrid"/>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" HorizontalAlign="Left" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </td>
    </tr>
</table>

<table id="tblOrderDetail_Upload_Vendor" cellspacing="0" cellpadding="2" border="0" align="left"
    width="100%" class="dnnFormItem" visible="false" runat="server">
    <tr>
        <td>
            <asp:Label ID="lblUpload_Vendor" runat="server" CssClass="SubHead"/><br /><br />

               <asp:Label ID="lblUploadSummary_Vendor" runat="server" />
            &nbsp; &nbsp; &nbsp; &nbsp;
             <asp:HyperLink ID="hlUpload_Unlimited" runat="server" Text='<%# Localization.GetString("hlUpload_Unlimited", LocalResourceFile) %>'
                Target="_blank" />&nbsp; &nbsp; &nbsp; &nbsp;
               <dnn:CommandButton ID="btnRefeshUpload" runat="server" ResourceKey="btnRefeshUpload" ImageUrl="~/desktopmodules/crossclassified/images/watch.png"
                OnCommand="btnRefeshUpload_Click"  CausesValidation="false" />

            <hr style="border: 1px dotted #999999; size: 1" />
        
            <asp:GridView ID="gvUploadList_Vendor" runat="server" AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" GridLines="Both" BackColor="Gray"
                Width="100%" ForeColor="#333333" DataKeyNames="Id" OnRowCommand="gvUploadList_Vendor_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecordes" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblFileName" runat="server" resourcekey="lblFileName">FileName</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFileNameField" runat="server" Text='<%# Eval("FileName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                  

                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblSize" runat="server" resourcekey="lblSize"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSizeField" runat="server"
                                Text='<%#Cross.Modules.CP_Product.Business.LocalUtils.FormatFileSize(Convert.ToString(Eval("FileSize"))) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate">Created Date</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCreatedDateField" runat="server" Text='<%#  Convert.ToDateTime(Eval("CreatedDate")).ToShortDateString() %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif"
                                AlternateText='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblDownload" runat="server" resourcekey="lblDownload" />
                        </HeaderTemplate>
                        <ItemTemplate>
                             <asp:HyperLink ID="hlDownload" runat="server" Text='<%# Localization.GetString("lblDownload", LocalResourceFile) %>'
                                Target="_blank" NavigateUrl='<%#GetUploadFileUrl(Convert.ToString(Eval("Id")),Cross.Modules.CP_Product.Business.LocalUtils.FileUploadFrom_Vendor) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="CrossGrid" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" HorizontalAlign="Left" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </td>
    </tr>
</table>