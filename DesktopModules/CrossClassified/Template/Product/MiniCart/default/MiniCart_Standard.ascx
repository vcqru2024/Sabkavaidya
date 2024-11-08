<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MiniCart.ascx.cs" Inherits="Cross.Modules.CP_Product.View.MiniCart" %>
<style type="text/css">
.CrossGrid th{
  text-align:center;
}
</style>
<asp:Label runat="server" ID="lblLoginFirst" resourcekey="lblLoginFirst" CssClass="NormalRed"></asp:Label>
<table runat="server" width="100%" id="tblMiniCart">
    <tr>
        <td>
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="1"  CellSpacing="1"  GridLines="both" BackColor="Gray"
                Width="100%"  ForeColor="#333333" DataKeyNames="Id" OnRowCommand="gvList_RowCommand"
                OnDataBinding="gvList_DataBinding">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecords" Text='<%# Localization.GetString("EmptyCart",this.LocalResourceFile) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Image runat="server" ImageUrl='<%#GetThumbnail(Convert.ToString(Eval("ProductId")))%>'
                                Width='<%#Convert.ToInt32(Settings_MiniCart.General.ThumbnailWidth) %>' BorderStyle="Solid"
                                BorderWidth="1" BorderColor="DarkGray" ID='imgProduct'  />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblProductAndOption" runat="server" resourcekey="lblProductAndOption"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlProductAndOption" runat="server" Text='<%# Convert.ToString(Eval("ProductName")) + (string.IsNullOrEmpty(Convert.ToString(Eval("OptionName")))?string.Empty:" - "+Convert.ToString(Eval("OptionName"))) %>'
                                Target="_blank" NavigateUrl='<%#GetProductUrl(Convert.ToString(Eval("ProductId"))) %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="left" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblVariant" runat="server" resourcekey="lblVariant"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblVariantData" runat="server" Text='<%#Eval("VariantValue") %>'></asp:Label>
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
                            <asp:Label ID="lblQuantity" runat="server" resourcekey="lblQuantity"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblQuantityData" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="right" />
                    </asp:TemplateField>
                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgAdd" runat="server" CausesValidation="False" CommandName="Add"
                                Width="16" Height="16" CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgAdd",this.LocalResourceFile)%>'
                                ImageUrl="~/desktopmodules/crossclassified/images/add.jpg" AlternateText='<%#Localization.GetString("imgAdd",this.LocalResourceFile)%>' />
                            <asp:ImageButton ID="imgMinus" runat="server" CausesValidation="False" CommandName="Minus"
                                Width="16" Height="16" CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgMinus",this.LocalResourceFile)%>'
                                ImageUrl="~/desktopmodules/crossclassified/images/Minus.jpg" AlternateText='<%#Localization.GetString("imgMinus",this.LocalResourceFile)%>' />
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
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" Wrap="true" />
                <EditRowStyle BackColor="#999999" Wrap="true" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td align="right">
            <asp:Label ID="lblSummary" runat="server" resourcekey="lblSummary"></asp:Label>
            <asp:Label ID="lblSummaryField" CssClass="NormalRed" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlCheckOut" ResourceKey="hlCheckOut" />
        </td>
    </tr>
</table>
