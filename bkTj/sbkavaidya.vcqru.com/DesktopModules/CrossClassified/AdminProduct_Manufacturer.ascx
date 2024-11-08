<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.AdminProduct_Manufacturer, App_Web_adminproduct_manufacturer.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<style type="text/css">
.CrossGrid th{
  text-align:center;
}
</style>

<script type="text/javascript">
    function checkAll_Manufacturer() {
        if ($(":checkbox[id*='chkAll_Manufacturer']").prop("checked") == true) {
            $(":checkbox[id*='chkItem_Manufacturer']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_Manufacturer']").prop("checked", false);
        }
    }
</script>
<table width="100%" class="dnnFormItem" runat="server" id="tblButton">
    <tr>
        <td align="center">
            <asp:Label ID="lblProductType" runat="server" resourcekey="lblProductType" />
            <asp:DropDownList ID="ddlProductType" runat="server" DataTextField="Name" DataValueField="Id" Width="300px"
                AutoPostBack="True" OnSelectedIndexChanged="ddlProductType_SelectedIndexChanged">
            </asp:DropDownList>
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnAdd" runat="server" ResourceKey="btnAdd" ImageUrl="~/images/add.gif"
                OnCommand="btnAdd_Click" CausesValidation="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnDeleteSelected" runat="server" ResourceKey="btnDeleteSelected"
                CausesValidation="false" ImageUrl="~/images/delete.gif" OnCommand="btnDeleteSelected_Click"
                OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItems",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnUpdate" runat="server" CssClass="Normal" ResourceKey="cmdUpdate"
                ImageUrl="~/images/save.gif" OnCommand="btnUpdate_Click" Visible="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnDelete" runat="server" ResourceKey="cmdDelete" ImageUrl="~/images/delete.gif"
                OnCommand="btnDelete_Click" Visible="false" CausesValidation="false" OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnCancel" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                OnCommand="btnCancel_Click" Visible="false" CausesValidation="false" />
            &nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnAdminHome" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
</table>
<table width="100%" class="dnnFormItem" align="center" runat="server" id="tblList">
    <tr>
        <td align="left" valign="top">
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="1"  CellSpacing="1"  GridLines="Both" BackColor="Gray"
                Width="100%" ForeColor="#333333"  DataKeyNames="Id"
                OnRowCommand="gvList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecords" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server" CssClass="Normal"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAll_Manufacturer" runat="server" onclick="checkAll_Manufacturer()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItem_Manufacturer" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='40px' Height='40px' BorderStyle="Solid"
                                BorderWidth="1" BorderColor="DarkGray" ID='imgManufacturer'  />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblName" runat="server" resourcekey="lblName">Name</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNameData" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblDisplayOrder" runat="server" resourcekey="lblDisplayOrder">DisplayOrder</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayOrderData" runat="server" Text='<%#Eval("DisplayOrder") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblProducts" runat="server" resourcekey="lblProducts">Products</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblProductsData" runat="server" Text='<%#Eval("ProductCounts") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Select"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />
                            <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif" AlternateText='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />

                            <asp:HyperLink ID="hlContentLocalization" Target="_blank" ImageUrl="~/DesktopModules/CrossClassified/images/ml_content_16.gif"
                                Visible="<%#SupportsContentLocalization%>" runat="server" NavigateUrl='<%# EditUrl("ContentLocalize_Misc") + "?Table=Manufacturer&ItemId=" + Eval("Id").ToString() %>' />
                        
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
    <tr>
        <td>
            <cross:PagingControl ID="ctlPagingControl" runat="server" Mode="PostBack" OnPageChanged="ctlPagingControl_PageChanged">
            </cross:PagingControl>
        </td>
    </tr>
</table>
<table width="100%" cellspacing="2" cellpadding="2" border="0" runat="server" id="tblDetail"  align="center" class="dnnFormItem"
    visible="False">
    <tr class="dnnFormItem dnnFormHelp dnnClear">
        <td align="right" colspan="2">
            <asp:Image ID="Image7" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" />
            <%=LocalizeString("RequiredFields")%>
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plName" runat="server"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server" Width="400px"></asp:TextBox>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="varName" runat="server" CssClass="NormalRed" resourcekey="Required"
                Display="Dynamic" ControlToValidate="txtName"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plImage" runat="server" Text="Image:" ControlName="ctlImage"></dnn:Label>
        </td>
        <td valign="top" >
            <dnn:URL ID="ctlImage" runat="server" FileFilter="jpg,jpeg,jpe,bmp,png,gif" Required="False"
                ShowLog="false" ShowNewWindow="false" ShowNone="false" ShowTabs="false" ShowTrack="false"
                ShowUrls="false" ShowFiles="true" ShowUpLoad="true" Width="350px"></dnn:URL>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plDisplayOrder" runat="server" ControlName="txtDisplayOrder"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtDisplayOrder" runat="server" Columns="10" Text="100"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="^-?\d+$" ControlToValidate="txtDisplayOrder"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblDescription" runat="server" resourcekey="lblDescription" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <dnn:TextEditor ID="txtDescription" Width="100%" Height="400px" runat="server" />
        </td>
    </tr>
</table>
