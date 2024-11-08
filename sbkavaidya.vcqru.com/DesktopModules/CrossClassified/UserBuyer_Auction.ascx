<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.UserBuyer_Auction, App_Web_userbuyer_auction.ascx.87459c53" %>
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
    function checkAll_NotWon() {
        if ($(":checkbox[id*='chkAll_NotWon']").prop("checked") == true) {
            $(":checkbox[id*='chkItem_NotWon']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_NotWon']").prop("checked", false);
        }
    }

    function checkAll_Won() {
        if ($(":checkbox[id*='chkAll_Won']").prop("checked") == true) {
            $(":checkbox[id*='chkItem_Won']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_Won']").prop("checked", false);
        }
    }

      $(function () {
        $("#tabs").tabs();
        $("#tabs").tabs(
         {
             activate: function (event, ui) {
                 //Get or set the active option, after initialization:
                 var currentActive = $("#tabs").tabs("option", "active");
                 //set it to a hidden field
                 $("#<%= hidLastTab.ClientID %>").attr("value", currentActive.toString());
             }
         });

        var currTab = $("#<%= hidLastTab.ClientID %>").val();
        if (!isNaN(parseInt(currTab)))//if current value is number, then parse it as integer
        {
            currTab = parseInt(currTab);
        }

        $("#tabs").tabs({ active: currTab });
    });
</script>
<asp:HiddenField runat="server" ID="hidLastTab" Value="0" />

<div id="Div1" style="width: 100%; overflow:hidden">
<asp:Label ID="Label1" runat="server" resourcekey="Tip_Auction" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
</div>

<div id="tabs" style="width: 100%; overflow:hidden">
    <ul>
       <li><a href="#divWon"><span>
            <%#Localization.GetString("divWon", LocalResourceFile)%></span></a> </li>

        <li><a href="#divActive"><span>
            <%#Localization.GetString("divActive", LocalResourceFile)%></span></a> </li>
        <li><a href="#divProxy"><span>
            <%#Localization.GetString("divProxy", LocalResourceFile)%></span></a> </li>
       
        <li><a href="#divNotWon"><span>
            <%#Localization.GetString("divNotWon", LocalResourceFile)%></span></a> </li>
        <li><a href="#divPaid"><span>
            <%#Localization.GetString("divPaid", LocalResourceFile)%></span></a> </li>
        <li><a href="#divGiveUp"><span>
            <%#Localization.GetString("divGiveUp", LocalResourceFile)%></span></a> </li>
    </ul>
     <div id="divWon" style="height: 100%" class="dnnFormItem">
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr>
                <td align="center">
                    <dnn:CommandButton ID="btnCheckOutSelected" runat="server" ResourceKey="btnCheckOutSelected"
                        CausesValidation="false" ImageUrl="~/DesktopModules/CrossClassified/images/order.png"
                        OnCommand="btnCheckOutSelected_Click" />
                    &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:HyperLink runat="server" ID="HyperLink2" ResourceKey="btnMyAccount" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvWonList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                        CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                        DataKeyNames="Id" OnRowCommand="gvWonList_RowCommand">
                        <EmptyDataTemplate>
                            <asp:Label ID="lblNoRecords" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                                runat="server"></asp:Label>
                        </EmptyDataTemplate>
                        <Columns>
                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <input type="checkbox" id="chkAll_Won" runat="server" onclick="checkAll_Won()" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkItem_Won" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
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
                                    <asp:Label ID="lblVendorName" runat="server" resourcekey="lblVendorName"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="hlVendorNameData" runat="server" Text='<%# Eval("VendorName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblBid" runat="server" resourcekey="lblBid">Bid</asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblBidField" runat="server" Text='<%# Eval("Bid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblQuantity" runat="server" resourcekey="lblQuantity"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblQuantityField" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblAvailableStock" runat="server" resourcekey="lblAvailableStock"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAvailableStockField" runat="server" Text='<%# GetAvailableStock(Convert.ToString(Eval("Id"))) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCreatedDateField" runat="server" Text='<%# Eval("CreatedDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgCheckOut" runat="server" CausesValidation="False" CommandName="CheckOut"
                                        CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgCheckOut",LocalResourceFile)%>'
                                        ImageUrl="~/DesktopModules/CrossClassified/images/order.png" AlternateText='<%#Localization.GetString("imgCheckOut", LocalResourceFile)%>' />
                                    <asp:ImageButton ID="imgGiveUp" runat="server" CausesValidation="False" CommandName="GiveUp"
                                        Visible='<%# CanGiveUp(Convert.ToString(Eval("Id")))%>' CommandArgument='<%# Eval("Id")%>'
                                        ToolTip='<%#Localization.GetString("imgGiveUp",LocalResourceFile)%>' ImageUrl="~/images/cancel.gif"
                                        AlternateText='<%#Localization.GetString("imgGiveUp", LocalResourceFile)%>'
                                         OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("GiveUp",LocalResourceFile)) %>' />
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
            <tr>
                <td>
                    <hr style="border: 1px dotted #999999; size: 1" />
                </td>
            </tr>
            <tr align="left">
                <td>
                    <cross:PagingControl ID="ctlWon" runat="server" Mode="PostBack" OnPageChanged="ctlWon_PageChanged">
                    </cross:PagingControl>
                </td>
            </tr>
        </table>
    </div>
    <div id="divActive" style="height: 100%" class="dnnFormItem">
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem">
            <tr>
                <td>
                    <asp:Label ID="lblProductName_Active" runat="server" resourcekey="lblProductName1" />
                    <asp:TextBox ID="txtSearch_Active" runat="server" Width="250px"></asp:TextBox>
                    <asp:Label ID="lblPageSize_Active" runat="server" resourcekey="lblPageSize" />
                    <asp:DropDownList ID="ddlPageSize_Active" runat="server" Width="80px">
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
                    <dnn:CommandButton ID="btnSearch_Active" runat="server" CausesValidation="false"
                        ImageUrl="~/images/icon_search_16px.gif" ResourceKey="btnSearch" OnCommand="btnSearch_Active_Click" />
                    &nbsp;&nbsp;
                    <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnMyAccount" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvActiveList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                        CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                        DataKeyNames="Id">
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
                                    <asp:Label ID="lblProductName" runat="server" resourcekey="lblProductName"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlProductNameData" runat="server" Text='<%# Eval("ProductName") %>'
                                        ForeColor='<%# GetForeColor(Convert.ToString(Eval("Id"))) %>' Target="_blank"
                                        NavigateUrl='<%#GetProductUrl(Convert.ToString(Eval("ProductId"))) %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblVendorName" runat="server" resourcekey="lblVendorName"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="hlVendorNameData" runat="server" Text='<%# Eval("VendorName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblBid" runat="server" resourcekey="lblBid">Bid</asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblBidField" runat="server" Text='<%# Eval("Bid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblQuantity" runat="server" resourcekey="lblQuantity"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblQuantityField" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCreatedDateField" runat="server" Text='<%# Eval("CreatedDate") %>'></asp:Label>
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
                    <hr style="border: 1px dotted #999999; size: 1" />
                </td>
            </tr>
            <tr align="left">
                <td>
                    <cross:PagingControl ID="ctlActive" runat="server" Mode="PostBack" OnPageChanged="ctlActive_PageChanged">
                    </cross:PagingControl>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="dnnTreeLegend">
                        <h6>
                            <asp:Label ID="lblLegend" runat="server" resourcekey="lblLegend" /></h6>
                        <div class="dtlItem">
                            <asp:Label ID="lblColor_Green" runat="server" resourcekey="lblColor_Green" ForeColor="Green" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblColor_Orange" runat="server" resourcekey="lblColor_Orange" ForeColor="Orange" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblColor_Red" runat="server" resourcekey="lblColor_Red" ForeColor="Red" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblColor_Black" runat="server" resourcekey="lblColor_Black" ForeColor="Black" />
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div id="divProxy" style="height: 100%" class="dnnFormItem">
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr>
                <td align="center">
                    <asp:HyperLink runat="server" ID="HyperLink1" ResourceKey="btnMyAccount" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvProxyList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                        CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                        DataKeyNames="Id">
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
                                    <asp:Label ID="lblProductName" runat="server" resourcekey="lblProductName"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlProductNameData" runat="server" Text='<%# Eval("ProductName") %>'
                                        Target="_blank" NavigateUrl='<%#GetProductUrl(Convert.ToString(Eval("ProductId"))) %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblVendorName" runat="server" resourcekey="lblVendorName"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="hlVendorNameData" runat="server" Text='<%# Eval("VendorName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblProxy" runat="server" resourcekey="lblProxy">Proxy</asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblProxyField" runat="server" Text='<%# Eval("Proxy") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblUpdateDate" runat="server" resourcekey="lblUpdateDate"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblUpdateDateField" runat="server" Text='<%# Eval("UpdateDate") %>'></asp:Label>
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
    </div>

   
    <div id="divNotWon" style="height: 100%" class="dnnFormItem">
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr>
                <td>
                    <asp:Label ID="lblProductName_NotWon" runat="server" resourcekey="lblProductName1" />
                    <asp:TextBox ID="txtSearch_NotWon" runat="server" Width="150px"></asp:TextBox>
                    <asp:Label ID="lblPageSize_NotWon" runat="server" resourcekey="lblPageSize" />
                    <asp:DropDownList ID="ddlPageSize_NotWon" runat="server" Width="80px">
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
                    <dnn:CommandButton ID="btnSearch_NotWon" runat="server" CausesValidation="false"
                        ImageUrl="~/images/icon_search_16px.gif" ResourceKey="btnSearch" OnCommand="btnSearch_NotWon_Click" />
                    &nbsp;&nbsp;
                    <dnn:CommandButton ID="btnDeleteSelected" runat="server" ResourceKey="btnDeleteSelected"
                        CausesValidation="false" ImageUrl="~/images/delete.gif" OnCommand="btnDeleteSelected_Click"
                        OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItems",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
                    &nbsp;&nbsp;
                    <asp:HyperLink runat="server" ID="HyperLink3" ResourceKey="btnMyAccount" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvNotWonList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                        CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                        DataKeyNames="Id" OnRowCommand="gvNotWonList_RowCommand">
                        <EmptyDataTemplate>
                            <asp:Label ID="lblNoRecords" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                                runat="server"></asp:Label>
                        </EmptyDataTemplate>
                        <Columns>
                         <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <input type="checkbox" id="chkAll_NotWon" runat="server" onclick="checkAll_NotWon()" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkItem_NotWon" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
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
                                    <asp:Label ID="lblVendorName" runat="server" resourcekey="lblVendorName"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="hlVendorNameData" runat="server" Text='<%# Eval("VendorName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblBid" runat="server" resourcekey="lblBid">Bid</asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblBidField" runat="server" Text='<%# Eval("Bid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblQuantity" runat="server" resourcekey="lblQuantity"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblQuantityField" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCreatedDateField" runat="server" Text='<%# Eval("CreatedDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif" AlternateText='<%#Localization.GetString("imgDel",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
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
            <tr>
                <td>
                    <hr style="border: 1px dotted #999999; size: 1" />
                </td>
            </tr>
            <tr align="left">
                <td>
                    <cross:PagingControl ID="ctlNotWon" runat="server" Mode="PostBack" OnPageChanged="ctlNotWon_PageChanged">
                    </cross:PagingControl>
                </td>
            </tr>
        </table>
    </div>
    <div id="divPaid" style="height: 100%" class="dnnFormItem">
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr align="left">
                <td>
                    <asp:Label ID="lblProductName_Paid" runat="server" resourcekey="lblProductName1" />
                    <asp:TextBox ID="txtSearch_Paid" runat="server" Width="250px"></asp:TextBox>
                    <asp:Label ID="lblPageSize_Paid" runat="server" resourcekey="lblPageSize" />
                    <asp:DropDownList ID="ddlPageSize_Paid" runat="server" Width="80px">
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
                    <dnn:CommandButton ID="btnSearch_Paid" runat="server" CausesValidation="false" ImageUrl="~/images/icon_search_16px.gif"
                        ResourceKey="btnSearch" OnCommand="btnSearch_Paid_Click" />
                    &nbsp;&nbsp;
                    <asp:HyperLink runat="server" ID="HyperLink4" ResourceKey="btnMyAccount" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
                </td>
            </tr>
            <tr>
                <td>
                 
                    <asp:GridView ID="gvPaidList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                        CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                        DataKeyNames="Id">
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
                                    <asp:Label ID="lblProductName" runat="server" resourcekey="lblProductName"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlProductNameData" runat="server" Text='<%# Eval("ProductName") %>'
                                        Target="_blank" NavigateUrl='<%#GetProductUrl(Convert.ToString(Eval("ProductId"))) %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblVendorName" runat="server" resourcekey="lblVendorName"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="hlVendorNameData" runat="server" Text='<%# Eval("VendorName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblBid" runat="server" resourcekey="lblBid">Bid</asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblBidField" runat="server" Text='<%# Eval("Bid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblQuantity" runat="server" resourcekey="lblQuantity"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblQuantityField" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCreatedDateField" runat="server" Text='<%# Eval("CreatedDate") %>'></asp:Label>
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
            <tr>
                <td>
                    <hr style="border: 1px dotted #999999; size: 1" />
                </td>
            </tr>
            <tr align="left">
                <td>
                    <cross:PagingControl ID="ctlPaid" runat="server" Mode="PostBack" OnPageChanged="ctlPaid_PageChanged">
                    </cross:PagingControl>
                </td>
            </tr>
        </table>
    </div>
    <div id="divGiveUp" style="height: 100%" class="dnnFormItem">
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr>
                <td>
                    <asp:Label ID="lblProductName_GiveUp" runat="server" resourcekey="lblProductName1" />
                    <asp:TextBox ID="txtSearch_GiveUp" runat="server" Width="250px"></asp:TextBox>
                    <asp:Label ID="lblPageSize_GiveUp" runat="server" resourcekey="lblPageSize" />
                    <asp:DropDownList ID="ddlPageSize_GiveUp" runat="server" Width="80px">
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
                    <dnn:CommandButton ID="btnSearch_GiveUp" runat="server" CausesValidation="false"
                        ImageUrl="~/images/icon_search_16px.gif" ResourceKey="btnSearch" OnCommand="btnSearch_GiveUp_Click" />
                    &nbsp;&nbsp;
                    <asp:HyperLink runat="server" ID="HyperLink5" ResourceKey="btnMyAccount" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvGiveUpList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                        CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                        DataKeyNames="Id" >
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
                                    <asp:Label ID="lblProductName" runat="server" resourcekey="lblProductName"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlProductNameData" runat="server" Text='<%# Eval("ProductName") %>'
                                        Target="_blank" NavigateUrl='<%#GetProductUrl(Convert.ToString(Eval("ProductId"))) %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblVendorName" runat="server" resourcekey="lblVendorName"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="hlVendorNameData" runat="server" Text='<%# Eval("VendorName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblBid" runat="server" resourcekey="lblBid">Bid</asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblBidField" runat="server" Text='<%# Eval("Bid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblQuantity" runat="server" resourcekey="lblQuantity"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblQuantityField" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                <HeaderTemplate>
                                    <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCreatedDateField" runat="server" Text='<%# Eval("CreatedDate") %>'></asp:Label>
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
            <tr>
                <td>
                    <hr style="border: 1px dotted #999999; size: 1" />
                </td>
            </tr>
            <tr align="left">
                <td>
                    <cross:PagingControl ID="ctlGiveUp" runat="server" Mode="PostBack" OnPageChanged="ctlGiveUp_PageChanged">
                    </cross:PagingControl>
                </td>
            </tr>
        </table>
    </div>
</div>
