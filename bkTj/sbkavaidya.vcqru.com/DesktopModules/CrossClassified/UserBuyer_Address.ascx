<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.UserBuyer_Address, App_Web_userbuyer_address.ascx.87459c53" %>
<%@ Register TagPrefix="cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<style type="text/css">
.CrossGrid th{
  text-align:center;
}
</style>

<table width="100%" class="dnnFormItem" cellpadding="2" cellspacing="2" border="0">
    <tr>
        <td  align="center">
            <dnn:CommandButton ID="btnAddAddress" runat="server" ResourceKey="btnAddAddress"
                ImageUrl="~/images/add.gif" OnCommand="btnAddAddress_Click" CausesValidation="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnUpdate" runat="server" ResourceKey="cmdUpdate" ImageUrl="~/images/save.gif"
                OnCommand="btnUpdate_Click" Visible="false" />
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

<table width="100%" class="dnnFormItem" align="left" runat="server" id="tblAddressList"
    visible="false">
    <tr>
        <td>
            <asp:Label ID="lblAddressList" runat="server" CssClass="SubHead" resourcekey="Tip_Address"></asp:Label><br />
            <asp:GridView ID="gvAddressList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="Id" OnRowCommand="gvAddressList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecordes" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderText="Id" SortExpression="Id" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" SortExpression="Name" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblName" runat="server" resourcekey="lblAddressName">Name</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNameField" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address1" SortExpression="Address1" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAddress1" runat="server" resourcekey="lblAddress1"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAddress1Field" runat="server" Text='<%#Eval("Address1") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IsPrimary" SortExpression="IsPrimary" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblIsPrimary" runat="server" resourcekey="lblIsPrimary">IsPrimary</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsPrimaryField" runat="server" Checked='<%# Eval("IsPrimary") %>'
                                Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
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
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"  CssClass="CrossGrid"/>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </td>
    </tr>
</table>
<table id="tblAddressDetail" cellspacing="0" cellpadding="2" width="100%" border="0"
    class="dnnFormItem" align="left" visible="false" runat="server">
    <tr>
        <td colspan="2">
            <div class="dnnFormItem dnnFormHelp dnnClear">
                <p align="right">
                    <span>
                        <asp:Image ID="Image7" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" />
                        <%=LocalizeString("RequiredFields")%>
                    </span>
                </p>
            </div>
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plAddressName" runat="server" ControlName="txtAddressName"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtAddressName" Columns="40" runat="server" /><asp:Image ID="Image2"
                runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="NormalRed"
                resourcekey="Required" Display="Dynamic" ControlToValidate="txtAddressName">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plFirstName" runat="server" ControlName="txtFirstName" />
        </td>
        <td>
            <asp:TextBox ID="txtFirstName" Columns="70" runat="server" />
            <asp:Image ID="Image3" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="NormalRed"
                resourcekey="Required" Display="Dynamic" ControlToValidate="txtFirstName">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plLastName" runat="server" ControlName="txtLastName" />
        </td>
        <td>
            <asp:TextBox ID="txtLastName" Columns="70" runat="server" />
            <asp:Image ID="Image4" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="NormalRed"
                resourcekey="Required" Display="Dynamic" ControlToValidate="txtLastName">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plTitle" runat="server" ControlName="txtTitle" />
        </td>
        <td>
            <asp:TextBox ID="txtTitle" Columns="70" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plAddressEmail" runat="server" ControlName="txtAddressEmail" />
        </td>
        <td>
            <asp:TextBox ID="txtAddressEmail" Columns="40" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plCountryCode" runat="server" ControlName="ddlCountry" />
        </td>
        <td>
            <asp:DropDownList ID="ddlCountry" runat="server" DataValueField="Id" DataTextField="Name"
                AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" />
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plRegionCode" runat="server" ControlName="txtRegionCode" />
        </td>
        <td>
            <asp:DropDownList ID="ddlRegion" runat="server" DataTextField="Name" DataValueField="Id"
                Visible="False" AutoPostBack="True" OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged" />
            <asp:TextBox ID="txtRegionCode" Columns="40" runat="server" />
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
        <td>
            <dnn:Label ID="plCity" runat="server" ControlName="txtCity" />
        </td>
        <td>
            <asp:TextBox ID="txtCity" Columns="40" runat="server" />
            <asp:Image ID="Image6" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" CssClass="NormalRed"
                resourcekey="Required" Display="Dynamic" ControlToValidate="txtCity">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plPostalCode" runat="server" ControlName="txtPostalCode" />
        </td>
        <td>
            <asp:TextBox ID="txtPostalCode" Columns="40" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plAddress1" runat="server" ControlName="txtAddress1" />
        </td>
        <td>
            <asp:TextBox ID="txtAddress1" Columns="70" runat="server" />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="NormalRed"
                resourcekey="Required" Display="Dynamic" ControlToValidate="txtAddress1">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plAddress2" runat="server" ControlName="txtAddress2" />
        </td>
        <td>
            <asp:TextBox ID="txtAddress2" Columns="70" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plPhone1" runat="server" ControlName="txtPhone1" />
        </td>
        <td>
            <asp:TextBox ID="txtPhone1" Columns="40" runat="server" /><asp:Image ID="Image5"
                runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="NormalRed"
                resourcekey="Required" Display="Dynamic" ControlToValidate="txtPhone1">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plPhone2" runat="server" ControlName="txtPhone2" />
        </td>
        <td>
            <asp:TextBox ID="txtPhone2" Columns="40" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plIsPrimary" runat="server" ControlName="chkIsPrimary"></dnn:Label>
        </td>
        <td>
            <asp:CheckBox ID="chkIsPrimary" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>
