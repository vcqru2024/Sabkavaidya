<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.UserBuyer_Cart, App_Web_userbuyer_cart.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="gc" Namespace="GCheckout.Checkout" Assembly="GCheckout" %> 
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

<table width="100%" class="Normal" align="center" runat="server" id="tblAfterPaid" visible="false">
    <tr>
        <td>
            <asp:HyperLink runat="server" ID="hlContinueCheckout" ResourceKey="hlContinueCheckout"
                Visible="false" />&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlViewProduct" ResourceKey="hlViewProduct" Visible="false" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlReturnAccount" ResourceKey="btnMyAccount" Visible="false" />
        </td>
    </tr>
</table>
<table width="100%" class="dnnFormItem" align="center" runat="server" id="tblCart">
    <tr>
        <td>
            <table width="100%">
               
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
                <tr>
                    <td>
                        <hr style="border: 1px dotted #999999; size: 1" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table  width="100%">
                <tr visible="true" id="trCart_Grid" runat="server">
                    <td align="right">
                        <asp:Label ID="lblVendorSelect" runat="server" resourcekey="lblVendorSelect" Visible="False" />
                         <asp:DropDownList ID="ddlVendor" runat="server" Visible="False" DataValueField="Value" DataTextField="Text" Width="300px"
                         AutoPostBack="True" OnSelectedIndexChanged="ddlVendor_SelectedIndexChanged" /><%#GetBreak()%>
                        <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="1"  CellSpacing="1"  GridLines="Both" BackColor="Gray"
                            Width="100%"  ForeColor="#333333" DataKeyNames="Id" OnRowCommand="gvList_RowCommand">
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
                                <asp:TemplateField  ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <input type="checkbox" id="chkAll" runat="server" onclick="checkAll()" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkItem" runat="server" />
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
                                     <ItemStyle HorizontalAlign="Right" />
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
                                        <asp:Label ID="lblShipFee" runat="server" resourcekey="lblShipFee"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblShipFeeData" runat="server" Text='<%#Eval("ShipFee") %>'></asp:Label>
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
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Select"
                                            CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgEdit",LocalResourceFile)%>'
                                            ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit",LocalResourceFile)%>' />
                                        <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                            CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif" AlternateText='<%#Localization.GetString("imgDel",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                            ToolTip='<%#Localization.GetString("imgDel",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                            OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
                                    </ItemTemplate>
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
                        <asp:Label ID="lblSummary" runat="server" resourcekey="lblSummary"></asp:Label>
                        <asp:Label ID="lblSummaryField" CssClass="NormalRed" runat="server"></asp:Label><br />
                        <br />
                        <%--  <asp:Label ID="lblShipAndTaxTip" runat="server" resourcekey="lblShipAndTaxTip"></asp:Label>--%>
                        <dnn:CommandButton ID="btnConfigShip" runat="server" ResourceKey="btnConfigShip"
                            ImageUrl="~/desktopmodules/crossclassified/images/article_trackback.png" OnCommand="btnConfigShip_Click" />
                        <br />
                        <br />
                        <asp:Image runat="server" ID="imgPayment_Logo_Authorize" ImageUrl="~/DesktopModules/CrossClassified/Images/payment/Payment_Logo_Authorize.jpg"
                            ImageAlign="AbsMiddle" Visible="false" Height="25px" />
                        <asp:Image runat="server" ID="imgPayment_Logo_Authorize1" ImageUrl="~/DesktopModules/CrossClassified/Images/payment/Authorize90x72.png"
                            ImageAlign="AbsMiddle" Visible="false" Height="25px" />&nbsp;&nbsp;
                        <asp:Image runat="server" ID="imgPayment_Logo_Paypal" ImageUrl="~/DesktopModules/CrossClassified/Images/Payment/Payment_Logo_Paypal.jpg"
                            ImageAlign="AbsMiddle" Visible="false" Height="25px" />&nbsp;&nbsp;
                        <asp:Image runat="server" ID="imgPayment_Logo_Stripe" ImageUrl="~/DesktopModules/CrossClassified/Images/Payment/Payment_Logo_Stripe.jpg"
                            ImageAlign="AbsMiddle" Visible="false" Height="25px" />&nbsp;&nbsp;
                        <asp:Image runat="server" ID="imgPayment_Logo_DineroMail" ImageUrl="~/DesktopModules/CrossClassified/Images/Payment/Payment_Logo_DineroMail.jpg"
                            ImageAlign="AbsMiddle" Visible="false" Height="25px" />
                         <asp:Image runat="server" ID="imgPayment_Logo_GoogleCheckout" ImageUrl="~/DesktopModules/CrossClassified/Images/Payment/Payment_Logo_GoogleCheckout.jpg"
                            ImageAlign="AbsMiddle" Visible="false" Height="25px" />
                        <asp:Image runat="server" ID="imgPayment_Logo_Alipay" ImageUrl="~/DesktopModules/CrossClassified/Images/Payment/Payment_Logo_Alipay.png"
                            ImageAlign="AbsMiddle" Visible="false" Height="25px" />
                        <dnn:CommandButton ID="btnCheckOut" runat="server" ResourceKey="btnCheckOut" ImageUrl="~/desktopmodules/crossclassified/images/order.png"
                            OnCommand="btnCheckOut_Click" />
                    </td>
                </tr>
                <tr runat="server" id="trLegend">
                    <td>
                        <div class="dnnTreeLegend" id="divLegend" runat="server">
                            <h6>
                                <asp:Label ID="lblLegend" runat="server" resourcekey="lblLegend" /></h6>
                            <div class="dtlItem">
                                <img alt="" id="Img1" runat="server" src="~/images/edit.gif" />&nbsp;=&nbsp;
                                <asp:Literal ID="lblEdit" runat="server" Text='<%#Localization.GetString("imgEdit", LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <img alt="" id="Img7" runat="server" src="~/images/delete.gif" />&nbsp;=&nbsp;
                                <asp:Literal ID="lblDelete" runat="server" Text='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                        </div>
                    </td>
                </tr>
                <tr runat="server" id="trCart_Detail" visible="False">
                    <td>
                        <table cellspacing="2" cellpadding="2" border="0" class="dnnFormItem" width="100%">
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
                                    <dnn:Label ID="plProductName" runat="server" ></dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtProductName" runat="server" Columns="70" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr runat="server" id="trOption">
                                <td>
                                    <dnn:Label ID="plOption" runat="server"  ControlName="ddlOption"></dnn:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlOption" runat="server" Width="450px">
                                    </asp:DropDownList>
                                    <asp:Image ID="Image17" runat="server" ImageUrl="~/images/rew.gif" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:label id="plQuantity" runat="server" controlname="txtQuantity"></dnn:label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtQuantity" runat="server" Columns="10"></asp:TextBox>
                                    <asp:Image ID="imgQuantity" runat="server" ImageUrl="~/images/rew.gif" />
                                    <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="MustBeInteger"
                                        ForeColor="Red" runat="server" ValidationExpression="\d+$" ControlToValidate="txtQuantity"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plUnitPrice" runat="server"  ControlName="txtUnitPrice">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtUnitPrice" runat="server" Columns="20" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plProductSum" runat="server"  ControlName="txtProductSum">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtProductSum" runat="server" Columns="20" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plShipFee" runat="server"  ControlName="txtShipFee"></dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtShipFee" runat="server" Columns="20" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plTaxFee" runat="server"  ControlName="txtTaxRate"></dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTaxFee" runat="server" Columns="20" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plItemSum" runat="server"  ControlName="txtItemSum"></dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtItemSum" runat="server" Columns="20" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                             <tr id="trCouponTip" runat="server" >
                                <td colspan="2">
                                    <asp:Label ID="Label2" runat="server" resourcekey="Tip_Coupon" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trCouponInput" runat="server" >
                                <td>
                                    <dnn:Label ID="plCoupon" runat="server" resourcekey="plCoupon" ControlName="txtCoupon"/>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtCoupon" Columns="40" />
                                </td>
                            </tr>
                               <tr>
                                <td colspan="2">
                                   <asp:Label ID="Label1" runat="server" resourcekey="Tip_OrderMemo"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plOrderMemo" runat="server"  ControlName="txtOrderMemo">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOrderMemo" runat="server" Columns="70" Height="100px" TextMode="MultiLine" />
                                    <asp:Image ID="Image19" runat="server" ImageUrl="~/images/rew.gif" />
                                </td>
                            </tr>
                            <tr runat="server" visible="<%#Settings_Portal.Order.EnableModifyPrice %>">
                                <td colspan="2">
                                    <asp:Label ID="lblOrderTip" runat="server" resourcekey="Tip_DiscountRequest" CssClass="dnnFormMessage dnnFormInfo" />
                                </td>
                            </tr>
                            <tr runat="server" 
                                visible="<%#Settings_Portal.Order.EnableModifyPrice && UserInfo.IsInRole(PortalSettings.AdministratorRoleName) && !Settings_Portal.General.HideAllTips %>">
                                <td colspan="2">
                                   <asp:Label ID="Label3" runat="server" resourcekey="Tip_HideDiscountRequest"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                                </td>
                            </tr>
                            <tr runat="server" visible="<%#Settings_Portal.Order.EnableModifyPrice %>">
                                <td>
                                    <dnn:Label ID="plDiscountRequest" runat="server"  ControlName="txtDiscountRequest">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDiscountRequest" runat="server" Columns="70" Height="100px" TextMode="MultiLine" />
                                    <asp:Image ID="Image20" runat="server" ImageUrl="~/images/rew.gif" />
                                </td>
                            </tr>
                          
                          
                              <tr  runat="server" visible="<%#Settings_Portal.Order.EnableModifyPrice %>">
                                <td>
                                    <dnn:Label ID="plDiscountResponse" runat="server"  ControlName="txtDiscountResponse">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDiscountResponse" runat="server" Columns="70" Height="100px" TextMode="MultiLine"
                                         ReadOnly="true" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table id="tblAddress" cellspacing="0" cellpadding="2" width="100%" border="0" align="left" class="dnnFormItem"
    visible="false" runat="server">
    <tr runat="server" id="trAddress_Bill">
        <td colspan="2">
            <dnn:SectionHead ID="secBillAddress" runat="server" Section="tblAddress_Bill" ResourceKey="secBillAddress"
                IncludeRule="True" IsExpanded="true" CssClass="SubHead"></dnn:SectionHead>
            <table id="tblAddress_Bill" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td colspan="2">
                        <div class="dnnFormItem dnnFormHelp dnnClear">
                            <p align="right">
                                <span>
                                    <asp:Image ID="Image15" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" />
                                    <%=LocalizeString("RequiredFields")%><br />
                                </span>
                            </p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plBillAddressList" runat="server" ControlName="ddlBillAddressList"
                            ></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlBillAddressList" runat="server" DataValueField="Id" DataTextField="Name"  Width="200px"/>
                        <dnn:CommandButton ID="btnApplyBillAddress" runat="server" ResourceKey="btnApplyAddress"
                            ImageUrl="~/desktopmodules/crossclassified/images/accept.png" OnCommand="btnApplyBillAddress_Click"
                            CausesValidation="false" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:HyperLink runat="server" ID="hlEditBillList" ResourceKey="hlEditBillList" Target="_blank" />&nbsp;&nbsp;&nbsp;&nbsp;
                        <dnn:CommandButton ID="btnRefreshAddressList" runat="server" ResourceKey="btnRefreshAddressList"
                            ImageUrl="~/images/action_refresh.gif" OnCommand="btnRefreshAddressList_Click"
                            CausesValidation="false" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plFirstName" runat="server" ControlName="txtFirstName"  />
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstName" Columns="50" runat="server" />
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="NormalRed"
                            resourcekey="Required" Display="Dynamic" ControlToValidate="txtFirstName">* Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plLastName" runat="server" ControlName="txtLastName"  />
                    </td>
                    <td>
                        <asp:TextBox ID="txtLastName" Columns="50" runat="server" />
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="NormalRed"
                            resourcekey="Required" Display="Dynamic" ControlToValidate="txtLastName">* Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plTitle" runat="server" ControlName="txtTitle"  />
                    </td>
                    <td>
                        <asp:TextBox ID="txtTitle" Columns="50" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plAddressEmail" runat="server" ControlName="txtAddressEmail"  />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddressEmail" Columns="30" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plCountryCode" runat="server" ControlName="ddlCountry"  />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCountry" runat="server" DataValueField="Id" DataTextField="Name" 
                            AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plRegionCode" runat="server" ControlName="txtRegionCode"  />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlRegion" runat="server" DataTextField="Name" DataValueField="Id" 
                            Visible="False" AutoPostBack="True" OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged"/>
                        <asp:TextBox ID="txtRegionCode" Columns="30" runat="server" />
                    </td>
                </tr>
                <tr runat="server" id="trCity_List">
                    <td>
                        <dnn:Label ID="plCityList" runat="server" ControlName="ddlCity" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCity" runat="server" DataTextField="Name" DataValueField="Id" />
                    </td>
                </tr>
                <tr runat="server" id="trCity_Text">
                    <td style="width: 150px">
                        <dnn:Label ID="plCity" runat="server" ControlName="txtCity"  />
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity" Columns="30" runat="server" />
                        <asp:Image ID="Image9" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" CssClass="NormalRed"
                            resourcekey="Required" Display="Dynamic" ControlToValidate="txtCity">* Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plPostalCode" runat="server" ControlName="txtPostalCode"  />
                    </td>
                    <td>
                        <asp:TextBox ID="txtPostalCode" Columns="30" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plAddress1" runat="server" ControlName="txtAddress1"  />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress1" Columns="70" runat="server" />
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="NormalRed"
                            resourcekey="Required" Display="Dynamic" ControlToValidate="txtAddress1">* Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plAddress2" runat="server" ControlName="txtAddress2"  />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress2" Columns="70" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plPhone1" runat="server" ControlName="txtPhone1"  />
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone1" Columns="40" runat="server" /><asp:Image ID="Image5"
                            runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired" AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="NormalRed"
                            resourcekey="Required" Display="Dynamic" ControlToValidate="txtPhone1">* Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plPhone2" runat="server" ControlName="txtPhone2"  />
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone2" Columns="40" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr runat="server" id="trAddress_ShipOption" align="left">
        <td style="width: 150px">
            <dnn:Label ID="plShipAddressOption" ControlName="rblShipAddressOption" runat="server"
                ></dnn:Label>
        </td>
        <td>
            <asp:RadioButtonList ID="rblShipAddressOption" AutoPostBack="True" OnSelectedIndexChanged="rblShipAddressOption_SelectedIndexChanged"
                runat="server">
                <asp:ListItem Value="same" resourcekey="li_ShipAddressOption_Same" Selected="True"></asp:ListItem>
                <asp:ListItem Value="separate" resourcekey="li_ShipAddressOption_separate"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr runat="server" id="trShipAddress">
        <td colspan="2">
            <dnn:SectionHead ID="secShipAddress" runat="server" Section="tblAddress_Ship" ResourceKey="secShipAddress"
                IncludeRule="True" IsExpanded="true" CssClass="SubHead"></dnn:SectionHead>
            <table id="tblAddress_Ship" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plShipAddressList" runat="server" ControlName="ddlShipAddressList"
                            ></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlShipAddressList" runat="server" DataValueField="Id" DataTextField="Name" Width="200px"/>
                        <dnn:CommandButton ID="btnApplyShipAddress" runat="server" ResourceKey="btnApplyAddress"
                            ImageUrl="~/desktopmodules/crossclassified/images/accept.png" OnCommand="btnApplyShipAddress_Click"
                            CausesValidation="false" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plFirstName1" runat="server" ControlName="txtFirstName1" 
                            ResourceKey="plFirstName" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstName1" Columns="50" runat="server" />
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="NormalRed"
                            resourcekey="Required" Display="Dynamic" ControlToValidate="txtFirstName1">* Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plLastName1" runat="server" ControlName="txtLastName1" 
                            ResourceKey="plLastName" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtLastName1" Columns="50" runat="server" />
                        <asp:Image ID="Image6" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" CssClass="NormalRed"
                            resourcekey="Required" Display="Dynamic" ControlToValidate="txtLastName1">* Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plTitle1" runat="server" ControlName="txtTitle1"  />
                    </td>
                    <td>
                        <asp:TextBox ID="txtTitle1" Columns="50" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plAddressEmail1" runat="server" ControlName="txtAddressEmai1"  />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddressEmail1" Columns="30" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plCountryCode1" runat="server" ControlName="ddlCountry1" 
                            ResourceKey="plCountryCode" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCountry1" runat="server" DataValueField="Id" DataTextField="Name" Shipping Method
                            AutoPostBack="True" OnSelectedIndexChanged="ddlCountry1_SelectedIndexChanged" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plRegionCode1" runat="server" ControlName="txtRegionCode1" 
                            ResourceKey="plRegionCode" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlRegion1" runat="server" DataTextField="Name" DataValueField="Id"
                            Visible="False" AutoPostBack="True" OnSelectedIndexChanged="ddlRegion1_SelectedIndexChanged"/>
                        <asp:TextBox ID="txtRegionCode1" Columns="30" runat="server" />
                    </td>
                </tr>
                <tr runat="server" id="trCity_List1">
                    <td>
                        <dnn:Label ID="plCityList1" runat="server" ControlName="ddlCity1" ResourceKey="plCityList" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCity1" runat="server" DataTextField="Name" DataValueField="Id" Shipping Method/>
                    </td>
                </tr>
                <tr  runat="server" id="trCity_Text1">
                    <td >
                        <dnn:Label ID="plCity1" runat="server" ControlName="txtCity1"  ResourceKey="plCity" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity1" Columns="30" runat="server" />
                        <asp:Image ID="Image12" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" CssClass="NormalRed"
                            resourcekey="Required" Display="Dynamic" ControlToValidate="txtCity1">* Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plPostalCode1" runat="server" ControlName="txtPostalCode1" 
                            ResourceKey="plPostalCode" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtPostalCode1" Columns="30" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plAddress11" runat="server" ControlName="txtAddress11" 
                            ResourceKey="plAddress1" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress11" Columns="70" runat="server" />
                        <asp:Image ID="Image7" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" CssClass="NormalRed"
                            resourcekey="Required" Display="Dynamic" ControlToValidate="txtAddress11">* Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plAddress21" runat="server" ControlName="txtAddress21" 
                            ResourceKey="plAddress2" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress21" Columns="70" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plPhone11" runat="server" ControlName="txtPhone11"  ResourceKey="plPhone1" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone11" Columns="40" runat="server" /><asp:Image ID="Image8"
                            runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired" AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" CssClass="NormalRed"
                            resourcekey="Required" Display="Dynamic" ControlToValidate="txtPhone11">* Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plPhone21" runat="server" ControlName="txtPhone21"  ResourceKey="plPhone2" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone21" Columns="40" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr runat="server" id="trAddress_ShipMethod">
        <td colspan="2">
            <dnn:SectionHead ID="secShipMethod" runat="server" Section="tblShipMethod" ResourceKey="secShipMethod"
                IncludeRule="True" IsExpanded="true" CssClass="SubHead"></dnn:SectionHead>
            <table id="tblShipMethod" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plShipMethod" runat="server" ControlName="ddlShipMethod" >
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlShipMethod" runat="server" DataValueField="ShipMethodId"
                            DataTextField="ShipMethod"  />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <dnn:CommandButton ID="btnConfirmAddressAndGo" runat="server" ResourceKey="btnConfirmAddressAndGo"
                ImageUrl="~/desktopmodules/crossclassified/images/accept.png" OnCommand="btnConfirmAddressAndGo_Click"
                CausesValidation="true" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <dnn:CommandButton ID="btnConfirmAddressAndReturn" runat="server" ResourceKey="btnConfirmAddressAndReturn"
                ImageUrl="~/desktopmodules/crossclassified/images/article_trackback.png" OnCommand="btnConfirmAddressAndReturn_Click"
                CausesValidation="true" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <dnn:CommandButton ID="btnCancelAddress" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                OnCommand="btnCancelAddress_Click" CausesValidation="false" />
        </td>
    </tr>
</table>
<table id="tblPayment" cellspacing="0" cellpadding="2" border="0" align="left" visible="false" class="dnnFormItem" width="100%"
    runat="server">
    <tr>
        <td colspan="2">
            <asp:Label ID="lblOrderSummary" runat="server" CssClass="SubHead"></asp:Label><br /><br />
        </td>
    </tr>
    <tr runat="server" id="trPayment_Option" visible="false">
        <td style="width: 150px" valign="middle">
            <dnn:Label ID="plPaymentOption" ControlName="rblPaymentOption" runat="server" >
            </dnn:Label>
        </td>
        <td>
            <asp:RadioButton ID="rbPayment_Option_Authorize" runat="server" AutoPostBack="true"
                OnCheckedChanged="rbPayment_Option_Authorize_CheckedChanged" />
            <asp:Image runat="server" ID="imgPayment_Option_Authorize" ImageUrl="~/DesktopModules/CrossClassified/Images/payment/Authorize90x72.png"
                ImageAlign="AbsMiddle"   />
            <br />
            <br />
            <asp:RadioButton ID="rbPayment_Option_PayPal" runat="server" AutoPostBack="true"
                OnCheckedChanged="rbPayment_Option_PayPal_CheckedChanged" />
            <asp:Image runat="server" ID="imgPayment_Option_Paypal" ImageUrl="~/DesktopModules/CrossClassified/Images/payment/Payment_Option_Paypal.jpg"
                ImageAlign="AbsMiddle"  />
            <br />
            <br />

              <asp:RadioButton ID="rbPayment_Option_Stripe" runat="server" AutoPostBack="true"
                OnCheckedChanged="rbPayment_Option_Stripe_CheckedChanged" />
            <asp:Image runat="server" ID="imgPayment_Option_Stripe" ImageUrl="~/DesktopModules/CrossClassified/Images/payment/Payment_Option_Stripe.jpg" 
                ImageAlign="AbsMiddle"  Height="73px"/>
            <br />
            <br />

            <asp:RadioButton ID="rbPayment_Option_DineroMail" runat="server" AutoPostBack="true"
                OnCheckedChanged="rbPayment_Option_DineroMail_CheckedChanged" />
            <asp:Image runat="server" ID="imgPayment_Option_DineroMail" ImageUrl="~/DesktopModules/CrossClassified/Images/payment/Payment_Logo_DineroMail.jpg"
                ImageAlign="AbsMiddle"   />
            <br />
            <br />
            <asp:RadioButton ID="rbPayment_Option_GoogleCheckout" runat="server" AutoPostBack="true"
                OnCheckedChanged="rbPayment_Option_GoogleCheckout_CheckedChanged" />
            <asp:Image runat="server" ID="imgPayment_Option_GoogleCheckout" ImageUrl="~/DesktopModules/CrossClassified/Images/payment/Payment_Logo_GoogleCheckout.jpg"
                ImageAlign="AbsMiddle"  />
            <br />
            <br />

            <asp:RadioButton ID="rbPayment_Option_Alipay" runat="server" AutoPostBack="true"
                OnCheckedChanged="rbPayment_Option_Alipay_CheckedChanged" />
            <asp:Image runat="server" ID="imgPayment_Option_Alipay" ImageUrl="~/DesktopModules/CrossClassified/Images/payment/Payment_Option_Alipay.png"
                ImageAlign="AbsMiddle"  />
            <br />
            <br />

            <asp:RadioButton ID="rbPayment_Option_Manual" runat="server" AutoPostBack="true"
                resourcekey="rbPayment_Option_Manual" OnCheckedChanged="rbPayment_Option_Manual_CheckedChanged" />
              <asp:Image runat="server" ID="imgPayment_Option_Manual" ImageUrl="~/DesktopModules/CrossClassified/Images/payment/Payment_Option_Manual.jpg"
                ImageAlign="AbsMiddle" Height="73px"/>
        </td>
    </tr>
    <tr runat="server" id="trPayment_Paypal" visible="false">
        <td colspan="2">
            <dnn:SectionHead ID="secPaypal" runat="server" Section="tblPayment_Paypal" ResourceKey="secPaypal"
                IncludeRule="True" IsExpanded="true" CssClass="SubHead"></dnn:SectionHead>
            <table id="tblPayment_Paypal" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td  runat="server" id="td_PaypalSandbox">
                        <asp:Label ID="lblPaypalSandbox" runat="server" resourcekey="Help_Payment_Paypal"  CssClass="dnnFormMessage dnnFormInfo"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPaypalError" runat="server" CssClass="NormalRed" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="lblPaypalConfirmMessage" runat="server"  resourcekey="lblPaypalConfirmMessage" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                    <br />
                        <asp:Image ID="imgPaypal" runat="server" AlternateText="Click here to pay by PayPal using your credit/debit card or PayPal account" /><br />
                        <asp:Button ID="btnPaypalConfirmOrder" runat="server" resourcekey="btnConfirmOrder"
                            Width="200px" Text="Confirm Order" OnClick="btnPaypalConfirmOrder_Click" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr runat="server" id="trPayment_Authorize" visible="false">
        <td colspan="2">
            <dnn:SectionHead ID="secAuthorize" runat="server" Section="tblPayment_Authorize"
                ResourceKey="secAuthorize" IncludeRule="True" IsExpanded="true" CssClass="SubHead">
            </dnn:SectionHead>
            <table id="tblPayment_Authorize" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblAuthorizeError" runat="server" CssClass="NormalRed" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image runat="server" ID="Image13" ImageUrl="~/DesktopModules/CrossClassified/Images/payment/Payment_Option_Authorize.jpg"
                            ImageAlign="AbsMiddle" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px" >
                        <dnn:Label ID="plCardName" runat="server"  />
                    </td>
                    <td>
                        <asp:TextBox ID="txtCardName" runat="server" Width="250px" MaxLength="255"></asp:TextBox>
                        <asp:Image ID="Image10" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtCardName"
                            CssClass="NormalRed" resourcekey="Required" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plCardNumber" runat="server" ControlName="txtCardNumber" >
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCardNumber" runat="server" Width="200px" MaxLength="100"></asp:TextBox>
                        <asp:Image ID="Image11" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="rfvNumber" runat="server" ControlToValidate="txtCardNumber"
                            CssClass="NormalRed" resourcekey="Required" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plExpiryDate" runat="server" ControlName="ddlMonth" ></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlMonth" runat="server" Width="100px">
                            <asp:ListItem Value="01">01</asp:ListItem>
                            <asp:ListItem Value="02">02</asp:ListItem>
                            <asp:ListItem Value="03">03</asp:ListItem>
                            <asp:ListItem Value="04">04</asp:ListItem>
                            <asp:ListItem Value="05">05</asp:ListItem>
                            <asp:ListItem Value="06">06</asp:ListItem>
                            <asp:ListItem Value="07">07</asp:ListItem>
                            <asp:ListItem Value="08">08</asp:ListItem>
                            <asp:ListItem Value="09">09</asp:ListItem>
                            <asp:ListItem Value="10">10</asp:ListItem>
                            <asp:ListItem Value="11">11</asp:ListItem>
                            <asp:ListItem Value="12">12</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="lblSlash" runat="server">&nbsp;/&nbsp;</asp:Label>
                        <asp:DropDownList ID="ddlYear" runat="server" Width="100px"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plCSC" runat="server" ControlName="txtVer" ></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtVer" runat="server" Width="60px" MaxLength="4"></asp:TextBox>
                        <asp:Image ID="Image14" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="rfvVer" runat="server" ControlToValidate="txtVer"
                            CssClass="NormalRed" resourcekey="Required" />
                    </td>
                </tr>
                <tr>
                    <td  colspan="2">
                       
                        <asp:Label ID="lblAuthorizeConfirmMessage" runat="server"  resourcekey="lblAuthorizeConfirmMessage" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                    <br />
                        <asp:Button ID="btnAuthorizeConfirmOrder" runat="server" resourcekey="btnConfirmOrder"
                            Width="200px" Text="Confirm Order" OnClick="btnAuthorizeConfirmOrder_Click" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>

      <tr runat="server" id="trPayment_Stripe" visible="false">
        <td colspan="2">
            <dnn:SectionHead ID="secStripe" runat="server" Section="tblPayment_Stripe"
                ResourceKey="secStripe" IncludeRule="True" IsExpanded="true" CssClass="SubHead">
            </dnn:SectionHead>
            <table id="tblPayment_Stripe" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblStripeError" runat="server" CssClass="NormalRed" Visible="false"  ForeColor="Red"></asp:Label>
                    </td>
                </tr>
               
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblStripeTip" runat="server" resourcekey="Tip_Payment_Stripe"  CssClass="dnnFormMessage dnnFormInfo"/>
                    </td>
                </tr>
                 <tr runat="server" id="tr_StripeTest" >
                    <td colspan="2">
                        <asp:Label ID="lblStripeTest" runat="server" resourcekey="Tip_Payment_StripeTest"  CssClass="dnnFormMessage dnnFormInfo"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plStipeCardNumber" runat="server" ControlName="txtStipeCardNumber" >
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStipeCardNumber" runat="server" Width="300px" MaxLength="100"></asp:TextBox>
                        <asp:Image ID="Image22" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtStipeCardNumber"
                            CssClass="NormalRed" resourcekey="Required" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plStripeExpireDate" runat="server" ControlName="ddlStripeCardExpirationMonth" ></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlStripeCardExpirationMonth" runat="server" Width="100px">
                            <asp:ListItem Value="01">01</asp:ListItem>
                            <asp:ListItem Value="02">02</asp:ListItem>
                            <asp:ListItem Value="03">03</asp:ListItem>
                            <asp:ListItem Value="04">04</asp:ListItem>
                            <asp:ListItem Value="05">05</asp:ListItem>
                            <asp:ListItem Value="06">06</asp:ListItem>
                            <asp:ListItem Value="07">07</asp:ListItem>
                            <asp:ListItem Value="08">08</asp:ListItem>
                            <asp:ListItem Value="09">09</asp:ListItem>
                            <asp:ListItem Value="10">10</asp:ListItem>
                            <asp:ListItem Value="11">11</asp:ListItem>
                            <asp:ListItem Value="12">12</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label4" runat="server">&nbsp;/&nbsp;</asp:Label>
                        <asp:DropDownList ID="ddlStripeCardExpirationYear" runat="server" Width="100px"/>
                    </td>
                </tr>
               
                <tr>
                    <td>
                        <dnn:Label ID="plStripeCardCvc" runat="server" ControlName="txtStripeCardCvc" ></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStripeCardCvc" runat="server" Width="60px" MaxLength="4"></asp:TextBox>
                        <asp:Image ID="Image23" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtStripeCardCvc"
                            CssClass="NormalRed" resourcekey="Required" />
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                    <br />
                        <asp:Button ID="btnStripeConfirmOrder" runat="server" resourcekey="btnConfirmOrder"
                            Width="200px" Text="Confirm Order" OnClick="btnStripeConfirmOrder_Click" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr runat="server" id="trPayment_DineroMail" visible="false">
        <td colspan="2">
            <dnn:SectionHead ID="secDineroMail" runat="server" Section="tblPayment_DineroMail"
                ResourceKey="secDineroMail" IncludeRule="True" IsExpanded="true" CssClass="SubHead">
            </dnn:SectionHead>
            <table id="tblPayment_DineroMail" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td>
                        <asp:Label ID="lblDineroMailConfirmMessage" runat="server"  resourcekey="lblDineroMailConfirmMessage" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                    <br />
                        <asp:Button ID="btnDineroMailConfirmOrder" runat="server" resourcekey="btnConfirmOrder"
                            Width="200px" Text="Confirm Order" OnClick="btnDineroMailConfirmOrder_Click" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr runat="server" id="trPayment_GoogleCheckout" visible="false">
        <td colspan="2">
            <dnn:SectionHead ID="secGoogleCheckout" runat="server" Section="tblPayment_GoogleCheckout"
                ResourceKey="secGoogleCheckout" IncludeRule="True" IsExpanded="true" CssClass="SubHead">
            </dnn:SectionHead>
            <table id="tblPayment_GoogleCheckout" cellspacing="0" cellpadding="2" width="100%"
                border="0" runat="server">
                <tr>
                    <td >
                        <asp:Label ID="lblGoogleCheckout_Manual" runat="server" resourcekey="lblGoogleCheckout_Manual" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                        <asp:Label ID="lblGoogleCheckout_Auto" runat="server" resourcekey="lblGoogleCheckout_Auto" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                    <br />
                        <gc:GCheckoutButton ID="btnGoogleCheckoutConfirmOrder" runat="server" Background="Transparent"
                            CartExpirationMinutes="0" Currency="USD" Size="Large" OnClick="btnGoogleCheckoutConfirmOrder_Click" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr runat="server" id="trPayment_Alipay" visible="false">
        <td colspan="2">
            <dnn:SectionHead ID="secAlipay" runat="server" Section="tblPayment_Alipay" ResourceKey="secAlipay"
                IncludeRule="True" IsExpanded="true" CssClass="SubHead"></dnn:SectionHead>
            <table id="tblPayment_Alipay" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td>
                        <asp:Label ID="lblAlipayConfirmMessage" runat="server" resourcekey="lblAlipayConfirmMessage"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <br />
                        <asp:Image ID="imgAlipay" runat="server" ImageUrl="~/DesktopModules/CrossClassified/Images/payment/Payment_Option_Alipay.png" /><br />
                        <asp:Button ID="btnAlipayConfirmOrder" runat="server" resourcekey="btnConfirmOrder"
                            Width="200px" Text="Confirm Order" OnClick="btnAlipayConfirmOrder_Click" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr runat="server" id="trPayment_Manual" visible="false">
        <td colspan="2">
            <dnn:SectionHead ID="secManual" runat="server" Section="tblPayment_Manual" ResourceKey="secManual"
                IncludeRule="True" IsExpanded="true" CssClass="SubHead"></dnn:SectionHead>
            <table id="tblPayment_Manual" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td>
                        <asp:Label ID="lblManualConfirmMessage" runat="server"  resourcekey="lblManualConfirmMessage" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                    <br />
                        <asp:Button ID="btnManualConfirmOrder" runat="server" resourcekey="btnConfirmOrder"
                            Width="200px" Text="Confirm Order" OnClick="btnManualConfirmOrder_Click" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
