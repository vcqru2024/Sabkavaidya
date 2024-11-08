<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.UserBuyer_Product, App_Web_userbuyer_product.ascx.87459c53" %>
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

<table width="100%" class="dnnFormItem" cellpadding="0" cellspacing="0" border="0"
    runat="server" id="tblButton">
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
            <asp:TextBox ID="txtEnd" MaxLength="10" Columns="10" runat="server" Width="120px" />
            <asp:HyperLink ID="hlEnd" Text="Calendar" resourcekey="Calendar"
                runat="server" />
            <asp:CompareValidator ID="CompareValidator2" runat="server" CssClass="NormalRed"
                ControlToValidate="txtEnd" resourcekey="Date.ErrorMessage" ErrorMessage="<br>You have entered an invalid date!"
                Display="Dynamic" Type="Date" Operator="DataTypeCheck" /><br />
            <asp:Label ID="lblProduct" runat="server" resourcekey="lblProduct" />
            <asp:TextBox ID="txtProduct" Columns="60" runat="server" Width="300px" /><br />
            <asp:Label ID="lblInvoiceId" runat="server" resourcekey="lblInvoiceId" />
            <asp:TextBox ID="txtInvoiceNo" Columns="40" runat="server" Width="200px" />
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
        <td>
            <asp:Label ID="lblOrderDetail" runat="server" Visible="false" CssClass="SubHead" /> &nbsp;&nbsp;
            <dnn:CommandButton ID="btnCancel" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                OnCommand="btnCancel_Click" Visible="false" CausesValidation="false" />
           &nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnMyAccount" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
</table>
<table align="center" width="100%" class="dnnFormItem" id="tblOrderDetailList" runat="server">
    <tr>
        <td align="right">
            <asp:GridView ID="gvOrderDetail" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="Id" OnRowCommand="gvOrderDetail_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecords" Text='<%# Localization.GetString("NoRecords",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgViewOrderDetail" runat="server" CausesValidation="False"
                                CommandName="ViewOrderDetail" CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgViewOrderDetail",LocalResourceFile)%>'
                                ImageUrl="~/images/icon_search_16px.gif" AlternateText='<%#Localization.GetString("imgViewOrderDetail",LocalResourceFile)%>' />

                             <asp:ImageButton ID="imgSignFor" runat="server" CausesValidation="False" CommandName="SignFor"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgSignFor",LocalResourceFile)%>'
                                ImageUrl="~/desktopmodules/crossclassified/images/edit.png" AlternateText='<%#Localization.GetString("imgSignFor",LocalResourceFile)%>'
                                Visible='<%# ( NeedToSignFor(Convert.ToInt32(Eval("Id")))) %>' 
                                
                               OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("SignFor",LocalResourceFile)) %>' />


                            <asp:ImageButton ID="imgViewDownload" runat="server" CausesValidation="False" CommandName="ViewDownload"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgViewDownload",LocalResourceFile)%>'
                                ImageUrl="~/desktopmodules/crossclassified/images/download.gif" AlternateText='<%#Localization.GetString("imgViewDownload",LocalResourceFile)%>'
                                Visible='<%# (Convert.ToInt32(Eval("OrderStatus"))==0) && (DownloadAvailable(Convert.ToInt32(Eval("Id")))) %>' />
                            <asp:ImageButton ID="imgAddTicket" runat="server" CausesValidation="False" CommandName="AddTicket"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgAddTicket",LocalResourceFile)%>'
                                ImageUrl="~/images/action_help.gif" AlternateText='<%#Localization.GetString("imgAddTicket",LocalResourceFile)%>' />
                            <asp:ImageButton ID="imgRating" runat="server" CausesValidation="False" CommandName="ViewRating"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgRating",LocalResourceFile)%>'
                                ImageUrl="~/desktopmodules/crossclassified/images/approve.gif" AlternateText='<%#Localization.GetString("imgRating",LocalResourceFile)%>'
                                Visible='<%# Convert.ToInt32(Eval("OrderStatus"))==0 %>' />

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
                            <asp:Label ID="lblVariant" runat="server" resourcekey="lblVariant"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblVariantData" runat="server" Text='<%#Eval("VariantValue") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblVendorName" runat="server" resourcekey="lblVendorName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblVendorNameData" runat="server" Text='<%#Eval("VendorName") %>'></asp:Label>
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
                        <ItemStyle HorizontalAlign="left" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblShippingMethod" runat="server" resourcekey="lblShippingMethodHead"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblShippingMethodData" runat="server" Text='<%#Eval("ShippingMethod") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="left" />
                    </asp:TemplateField>
                     <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblShippingNo" runat="server" resourcekey="lblShippingNoHead"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblShippingNoData" runat="server" Text='<%#Eval("ShippingNo") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="left" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblClientSignDate" runat="server" resourcekey="lblClientSignDateHead"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblClientSignDateData" runat="server" Text='<%#GetNullDate(Convert.ToDateTime(Eval("ClientSignDate")).ToShortDateString()) %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="right" />
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
    <tr>
        <td>
            <div class="dnnTreeLegend" id="divLegend" runat="server">
                <h6>
                    <asp:Label ID="lblLegnedDetail" runat="server" resourcekey="lblLegend" /></h6>
                <div class="dtlItem">
                    <img alt="" id="Img1" runat="server" src="~/images/icon_search_16px.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblEdit" runat="server" Text='<%#Localization.GetString("imgViewOrderDetail", LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;

                    <img alt="" id="Img9" runat="server" src="~/desktopmodules/crossclassified/images/edit.png" />&nbsp;=&nbsp;
                    <asp:Literal ID="litSignFor" runat="server" Text='<%#Localization.GetString("imgSignFor", LocalResourceFile)%>' />
                    <br />
                   
                    <img alt="" id="Img2" runat="server" src="~/images/action_help.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblAddHelp" runat="server" Text='<%#Localization.GetString("imgAddTicket",LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img3" runat="server" src="~/desktopmodules/crossclassified/images/approve.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="Literal1" runat="server" Text='<%#Localization.GetString("imgRating",LocalResourceFile)%>' />  <br />

                     <img alt="" id="Img4" runat="server" src="~/desktopmodules/crossclassified/images/download.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="Literal2" runat="server" Text='<%#Localization.GetString("imgViewDownload",LocalResourceFile)%>' />  <br />

                      <img alt="" id="Img6" runat="server" src="~/desktopmodules/crossclassified/images/up.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="litUpload" runat="server" Text='<%#Localization.GetString("imgViewUpload_Client",LocalResourceFile)%>' />  <br />

                    <img alt="" id="Img7" runat="server" src="~/desktopmodules/crossclassified/images/watch.png" />&nbsp;=&nbsp;
                    <asp:Literal ID="litUpload_Vendor" runat="server" Text='<%#Localization.GetString("imgViewUpload_Vendor",LocalResourceFile)%>' />
                </div>
            </div>
        </td>
    </tr>
</table>
<table align="center" width="100%" class="Normal" id="tblOrder" runat="server">
    <tr>
        <td>
            <br />
            <asp:Label ID="lblOrderNo" runat="server" />
            <br />
            <asp:Label ID="lblOrderDate" runat="server" />
            <br />
            <asp:Label ID="lblOrderSummary" runat="server" />
            <br />
            <br />
            <asp:Label ID="lblProductInOrder" runat="server" resourcekey="lblProductInOrder" />
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="gvDetailInOrder" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="Id" >
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
                            <asp:Label ID="lblVendorName" runat="server" resourcekey="lblVendorName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblVendorNameData" runat="server" Text='<%#Eval("VendorName") %>'></asp:Label>
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
                            <asp:Label ID="lblRecursiveCharge" runat="server" resourcekey="lblRecursiveCharge"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="lblRecursiveChargeData" runat="server" Checked='<%#Eval("RecursiveBill") %>'
                                Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblNextBillDate" runat="server" resourcekey="lblNextBillDate"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNextBillDateData" runat="server" Text='<%#Convert.ToBoolean(Convert.ToString(Eval("RecursiveBill")))==false?"":Convert.ToDateTime(Eval("NextBillDate")).ToShortDateString() %>' />
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
        </td>
    </tr>
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
</table>
<table id="tblAddress" cellspacing="0" cellpadding="2" width="100%" border="0" align="left"
    class="dnnFormItem" visible="false" runat="server">
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
                    <td style="width: 150px">
                        <asp:Label ID="lblCountryCode" runat="server" ResourceKey="lblCountryCode" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtCountryCode" Columns="70" runat="server" ReadOnly="true" />
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
            <asp:CheckBox ID="chkShipAddressOption_Same" runat="server"  Enabled="false" ResourceKey="chkShipAddressOption_Same"
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
                        <asp:TextBox ID="txtFirstName1" Columns="70" runat="server" ReadOnly="true" />
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
                    <td style="width: 150px">
                        <asp:Label ID="lblCountryCode1" runat="server" ResourceKey="lblCountryCode" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtCountryCode1" Columns="70" runat="server" ReadOnly="true" />
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
<table id="tblOrderDetail_Rating" cellspacing="0" cellpadding="2" border="0" align="left"
    width="100%" class="dnnFormItem" visible="false" runat="server">
    <tr>
        <td colspan="2">
            <asp:Label ID="lblRating" runat="server" CssClass="SubHead" /><br />
            <br />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblRatingVotes" resourcekey="lblRatingVotes" runat="server"></asp:Label>
            <asp:Label ID="lblVotes" runat="server"></asp:Label>&nbsp;&nbsp;
            <asp:Label ID="lblAverage" resourcekey="lblAverage" runat="server"></asp:Label>&nbsp;&nbsp;
            <asp:Image ID="imgAverage" runat="server"></asp:Image>&nbsp;&nbsp;
        </td>
    </tr>
    <tr align="left">
        <td style="width:150px">
            <dnn:Label ID="plYourRating" runat="server" ControlName="rblRating" />
        </td>
        <td>
            <asp:RadioButtonList ID="rblRating" EnableViewState="True" RepeatDirection="Horizontal"
                runat="server">
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="5">5</asp:ListItem>
                <asp:ListItem Value="6">6</asp:ListItem>
                <asp:ListItem Value="7">7</asp:ListItem>
                <asp:ListItem Value="8">8</asp:ListItem>
                <asp:ListItem Value="9">9</asp:ListItem>
                <asp:ListItem Value="10" Selected="True">10</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plRatingInfo" runat="server" ControlName="txtRatingInfo" />
        </td>
        <td>
            <asp:TextBox ID="txtRatingInfo" runat="server" Columns="60" TextMode="Multiline"
                Rows="5" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plRatingReply" runat="server" ControlName="txtRatingReply" />
        </td>
        <td>
            <asp:TextBox ID="txtRatingReply" runat="server" Columns="60" TextMode="Multiline"
                ReadOnly="true" Rows="5" />
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <dnn:CommandButton ID="btnPostRating" runat="server" ResourceKey="btnPostRating"
                ImageUrl="~/images/save.gif" OnCommand="btnPostRating_Click" CausesValidation="false" />
        </td>
    </tr>
</table>
<table id="tblOrderDetail_Ticket" cellspacing="0" cellpadding="2" border="0" align="left"
    width="100%" class="dnnFormItem" visible="false" runat="server">
    <tr>
        <td colspan="2">
            <asp:Label ID="lblTicket" runat="server" CssClass="SubHead" /><br />
            <br />
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plTicketTitle" runat="server" ControlName="txtTitle" />
        </td>
        <td>
            <asp:TextBox ID="txtTitle" runat="server" Width="600px" />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="valNameRequired" runat="server" ControlToValidate="txtTitle"
                Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td valign="middle">
            <dnn:Label ID="plTicketDescription" runat="server" ControlName="txtDescription" />
        </td>
        <td>
            <asp:TextBox ID="txtDescription" runat="server" Width="600px" TextMode="Multiline"
                Rows="15" />
            <asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescription"
                Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <dnn:CommandButton ID="btnCreateTicket" runat="server" ResourceKey="btnCreateTicket"
                ImageUrl="~/images/add.gif" OnCommand="btnCreateTicket_Click" />
        </td>
    </tr>
</table>
<table id="tblOrderDetail_Download" cellspacing="0" cellpadding="2" border="0" align="left"
    class="dnnFormItem" width="100%" visible="false" runat="server">
    <tr>
        <td>
            <asp:Label ID="lblDownload" runat="server" CssClass="SubHead" /><br />
            <hr style="border: 1px dotted #999999; size: 1" />
            <br />
            <asp:GridView ID="gvDownloadList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                CssClass="Normal" DataKeyNames="Id" OnRowCommand="gvDownloadList_RowCommand">
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
                            <asp:Label ID="lblSizeField" runat="server" Text='<%#Cross.Modules.CP_Product.Business.LocalUtils.FormatFileSize(Convert.ToString(Eval("Size"))) %>'></asp:Label>
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
                            <asp:ImageButton ID="imgDownload" runat="server" CausesValidation="False" CommandName="Download"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/save.gif" AlternateText='<%#Localization.GetString("imgDownload", LocalResourceFile)%>'
                                ToolTip='<%#Localization.GetString("imgDownload", LocalResourceFile)%>' Visible='<%#!Settings_Portal.Software.ShowSoftwareUrl %>' />
                            <asp:HyperLink ID="hlDownload" runat="server" Text='<%# Localization.GetString("hlDownload", LocalResourceFile) %>'
                                Target="_blank" NavigateUrl='<%#GetDownloadUrl(Convert.ToString(Eval("Id"))) %>'
                                Visible='<%#Settings_Portal.Software.ShowSoftwareUrl %>' />
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
    <tr>
        <td>
            <div class="dnnTreeLegend">
                <h6>
                    <asp:Label ID="Label2" runat="server" resourcekey="lblLegend" /></h6>
                <div class="dtlItem">
                    <img alt="" id="Img8" runat="server" src="~/images/save.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="Literal6" runat="server" Text='<%#Localization.GetString("imgDownload", LocalResourceFile)%>' />
                </div>
            </div>
        </td>
    </tr>
</table>

<table id="tblOrderDetail_Upload_Client" cellspacing="0" cellpadding="2" border="0" align="left"
    width="100%" class="dnnFormItem" visible="false" runat="server">
    <tr>
        <td>
            <asp:Label ID="lblUpload" runat="server" CssClass="SubHead" /><br /> <br />
             <asp:Label ID="lblUploadSummary" runat="server" />
            &nbsp; &nbsp; &nbsp; &nbsp;
             <asp:HyperLink ID="hlUpload_Unlimited" runat="server" Text='<%# Localization.GetString("hlUpload_Unlimited", LocalResourceFile) %>'
                Target="_blank" />&nbsp; &nbsp; &nbsp; &nbsp;
               <dnn:CommandButton ID="btnRefeshUpload" runat="server" ResourceKey="btnRefeshUpload" ImageUrl="~/desktopmodules/crossclassified/images/watch.png"
                OnCommand="btnRefeshUpload_Click"  CausesValidation="false" />
           
            <hr style="border: 1px dotted #999999; size: 1" />
          
            <asp:GridView ID="gvUploadList" runat="server" AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" GridLines="Both" BackColor="Gray"
                Width="100%" ForeColor="#333333" DataKeyNames="Id"
                OnRowCommand="gvUploadList_RowCommand">
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
                          <asp:HyperLink ID="hlDownload" runat="server" Text='<%# Localization.GetString("hlDownload", LocalResourceFile) %>'
                                Target="_blank" NavigateUrl='<%#GetUploadFileUrl(Convert.ToString(Eval("Id")),Cross.Modules.CP_Product.Business.LocalUtils.FileUploadFrom_Client) %>' />
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
             <br /> <br />
        </td>
    </tr>
   
    <tr>
        <td>
            <table id="tblUploadRule_1" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">

                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle1" runat="server" ResourceKey="lblUploadRuleTitle1" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle1" runat="server" Text="File 1" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize1" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize1" runat="server" Text="10" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension1" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension1" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus1" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload1" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload1" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload1" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <br />
                    </td>
                </tr>

            </table>
        </td>
    </tr>


    <tr>
        <td>
            <table id="tblUploadRule_2" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle2" runat="server" ResourceKey="lblUploadRuleTitle2" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle2" runat="server" Text="File 2" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize2" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize2" runat="server" Text="20" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension2" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension2" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus2" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload2" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload2" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload2" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr>
        <td>
            <table id="tblUploadRule_3" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">

                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle3" runat="server" ResourceKey="lblUploadRuleTitle3" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle3" runat="server" Text="File 3" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize3" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize3" runat="server" Text="30" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension3" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension3" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus3" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload3" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload3" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload3" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr>
        <td>
            <table id="tblUploadRule_4" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle4" runat="server" ResourceKey="lblUploadRuleTitle4" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle4" runat="server" Text="File 4" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize4" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize4" runat="server" Text="40" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension4" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension4" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus4" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload4" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload4" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload4" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr>
        <td>
            <table id="tblUploadRule_5" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle5" runat="server" ResourceKey="lblUploadRuleTitle5" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle5" runat="server" Text="File 5" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize5" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize5" runat="server" Text="50" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension5" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension5" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus5" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload5" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload5" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload5" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <br />
                    </td>
                </tr>

            </table>
        </td>
    </tr>

    <tr>
        <td>
            <table id="tblUploadRule_6" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle6" runat="server" ResourceKey="lblUploadRuleTitle6" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle6" runat="server" Text="File 6" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize6" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize6" runat="server" Text="60" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension6" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension6" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadStatus6" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload6" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload6" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload6" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <br />
                    </td>
                </tr>

            </table>
        </td>
    </tr>

    <tr>
        <td>
            <table id="tblUploadRule_7" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">

                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle7" runat="server" ResourceKey="lblUploadRuleTitle7" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle7" runat="server" Text="File 7" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize7" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize7" runat="server" Text="70" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension7" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension7" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus7" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload7" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload7" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload7" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <br />
                    </td>
                </tr>

            </table>
        </td>
    </tr>

    <tr>
        <td>
            <table id="tblUploadRule_8" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle8" runat="server" ResourceKey="lblUploadRuleTitle8" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle8" runat="server" Text="File 8" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize8" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize8" runat="server" Text="80" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension8" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension8" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus8" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload8" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload8" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload8" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr>
        <td>
            <table id="tblUploadRule_9" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle9" runat="server" ResourceKey="lblUploadRuleTitle9" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle9" runat="server" Text="File 9" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize9" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize9" runat="server" Text="90" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension9" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension9" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus9" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload9" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload9" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload9" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr>
        <td>
            <table id="tblUploadRule_10" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle10" runat="server" ResourceKey="lblUploadRuleTitle10" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle10" runat="server" Text="File 10" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize10" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize10" runat="server" Text="100" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension10" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension10" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus10" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload10" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload10" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload10" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
                    </td>
                </tr>
                
            </table>
        </td>
    </tr>
</table>

<table id="tblOrderDetail_Upload_Vendor" cellspacing="0" cellpadding="2" border="0" align="left"
    width="100%" class="dnnFormItem" visible="false" runat="server">
    <tr>
        <td>
            <asp:Label ID="lblUpload_Vendor" runat="server" CssClass="SubHead"  ResourceKey="lblUpload_Vendor" />
            <hr style="border: 1px dotted #999999; size: 1" />
        
            <asp:GridView ID="gvUploadList_Vendor" runat="server" AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" GridLines="Both" BackColor="Gray"
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
                             <asp:HyperLink ID="hlDownload" runat="server" Text='<%# Localization.GetString("hlDownload", LocalResourceFile) %>'
                                Target="_blank" NavigateUrl='<%#GetUploadFileUrl(Convert.ToString(Eval("Id")),Cross.Modules.CP_Product.Business.LocalUtils.FileUploadFrom_Vendor) %>' />
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