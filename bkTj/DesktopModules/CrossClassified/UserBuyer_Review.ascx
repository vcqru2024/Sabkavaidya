<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.UserBuyer_Review, App_Web_userbuyer_review.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>

<style type="text/css">
.CrossGrid th{
  text-align:center;
}
</style>


<table width="100%" class="dnnFormItem" align="center">
    <tr>
        <td align="center">
            <dnn:CommandButton ID="btnUpdate" runat="server" ResourceKey="cmdUpdate" ImageUrl="~/images/save.gif"
                OnCommand="btnUpdate_Click" Visible="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnCancel" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                OnCommand="btnCancel_Click" Visible="false" CausesValidation="false" />
            &nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnMyAccount" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
</table>
<table align="center" width="100%" class="dnnFormItem" id="tbl_List" runat="server">
    <tr>
        <td>
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="1"  CellSpacing="1"  GridLines="Both" BackColor="Gray"
                Width="100%"  ForeColor="#333333" DataKeyNames="Id" OnRowCommand="gvList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecords" Text='<%# Localization.GetString("NoRecords",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderText="Id" SortExpression="Id" Visible="False">
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
                            <asp:Label ID="lblVendorNameData" runat="server" Text='<%#Eval("VendorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblRating" runat="server" resourcekey="lblRating"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRatingData" runat="server" Text='<%#Eval("Rating") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblInfo" runat="server" resourcekey="lblInfo"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblInfoData" runat="server" Text='<%#Eval("Info") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblReply" runat="server" resourcekey="lblReply"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblReplyData" runat="server" Text='<%#Eval("Reply") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblUpdatedDate" runat="server" resourcekey="lblUpdatedDate"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUpdatedDateData" runat="server" Text='<%#Convert.ToDateTime(Convert.ToString(Eval("UpdatedDate"))).ToShortDateString()%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Select"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgEdit",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />
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
</table>
<table align="center" width="100%" class="dnnFormItem" id="tblDetail" runat="server" visible="False">
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
        <td style="width: 150px">
            <dnn:Label ID="plYourRating" runat="server"  ControlName="rblRating" />
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
            <dnn:Label ID="plRatingInfo" runat="server"  ControlName="txtRatingInfo" />
        </td>
        <td>
            <asp:TextBox ID="txtRatingInfo" runat="server" Columns="60" TextMode="Multiline"
                Rows="5" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plRatingReply" runat="server"  ControlName="txtRatingReply" />
        </td>
        <td>
            <asp:TextBox ID="txtRatingReply" runat="server" Columns="60" TextMode="Multiline"
                ReadOnly="true" Rows="5" />
        </td>
    </tr>
</table>
