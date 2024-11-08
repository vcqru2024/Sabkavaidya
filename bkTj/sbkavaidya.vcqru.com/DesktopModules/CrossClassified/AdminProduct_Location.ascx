<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.AdminProduct_Location, App_Web_adminproduct_location.ascx.87459c53" %>
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

<script type="text/javascript">
    function checkAll_Country() {
        if ($(":checkbox[id*='chkAllCountry']").prop("checked") == true) {
            $(":checkbox[id*='chkItemCountry']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItemCountry']").prop("checked", false);
        }
    }
    function checkAll_State() {
        if ($(":checkbox[id*='chkAllState']").prop("checked") == true) {
            $(":checkbox[id*='chkItemState']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItemState']").prop("checked", false);
        }
    }
    function checkAll_City() {
        if ($(":checkbox[id*='chkAllCity']").prop("checked") == true) {
            $(":checkbox[id*='chkItemCity']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItemCity']").prop("checked", false);
        }
    }
    function checkAll_Town() {
        if ($(":checkbox[id*='chkAllTown']").prop("checked") == true) {
            $(":checkbox[id*='chkItemTown']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItemTown']").prop("checked", false);
        }
    }
</script>
<table width="100%" class="dnnFormItem" align="center" runat="server" id="tblButton">
    <tr>
        <td align="center">
            <dnn:CommandButton ID="btnAdd" runat="server" ImageUrl="~/images/add.gif" OnCommand="btnAdd_Click"
                CausesValidation="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnDeleteSelected" runat="server" ResourceKey="btnDeleteSelected"
                CausesValidation="false" ImageUrl="~/images/delete.gif" OnCommand="btnDeleteSelected_Click"
                OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItems",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
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
            <dnn:CommandButton ID="btnUpLevel" runat="server" ResourceKey="btnUpLevel" CausesValidation="false"
                Visible="false" ImageUrl="~/DesktopModules/CrossClassified/images/up.gif" OnCommand="btnUpLevel_Click" />
            &nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnAdminHome" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
</table>
<table width="100%" class="dnnFormItem" align="left" runat="server" id="tblCountryList">
    <tr align="left" valign="top">
        <td>
            <asp:Label ID="lblCountryList" runat="server" resourcekey="lblCountryList" CssClass="SubHead" />
            <br />
            <asp:GridView ID="gvCountryList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="Id" OnRowCommand="gvCountryList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecordes" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAllCountry" runat="server" onclick="checkAll_Country()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItemCountry" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblCountryName" runat="server" resourcekey="lblCountryName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCountryNameField" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblDisplayOrder" runat="server" resourcekey="lblDisplayOrder"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayOrderField" runat="server" Text='<%#Eval("DisplayOrder") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblIsDefault" runat="server" resourcekey="lblIsDefault"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsDefaultField" runat="server" Checked='<%# Eval("IsDefault") %>'
                                Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
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
                                Visible="<%#SupportsContentLocalization%>" runat="server" NavigateUrl='<%# EditUrl("ContentLocalize_Misc") + "?Table=Country&ItemId=" + Eval("Id").ToString() %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblState" runat="server" resourcekey="lblState"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgState" runat="server" CausesValidation="False" CommandName="State"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgState",LocalResourceFile)%>'
                                ImageUrl="~/DesktopModules/CrossClassified/images/Option.gif" AlternateText='<%#Localization.GetString("imgState", LocalResourceFile)%>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
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
            <div class="dnnTreeLegend" id="divLegend" runat="server">
                <h6>
                    <asp:Label ID="lblLegend" runat="server" resourcekey="lblLegend" /></h6>
                <div class="dtlItem">
                    <img alt="" id="Img1" runat="server" src="~/images/edit.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblEdit" runat="server" Text='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img7" runat="server" src="~/images/delete.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblDelete" runat="server" Text='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <%if (SupportsContentLocalization)
                      {%>
                    <img alt="" id="Img10" runat="server" src="~/DesktopModules/CrossClassified/images/ml_content_16.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblContentLocalization" runat="server" Text='<%#Localization.GetString("imgContentLocalization", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <% } %>
                    <img alt="" id="Img2" runat="server" src="~/DesktopModules/CrossClassified/images/Option.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblState" runat="server" Text='<%#Localization.GetString("imgState", LocalResourceFile)%>' />
                </div>
            </div>
        </td>
    </tr>
</table>
<table id="tblCountryDetail" cellspacing="0" cellpadding="2" width="100%" border="0"
    class="dnnFormItem" runat="server" align="left">
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plCountryName" runat="server" ControlName="txtCountryName"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtCountryName" Columns="70" runat="server" /><asp:Image ID="Image1"
                runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="varCountryName" runat="server" CssClass="NormalRed"
                resourcekey="Required" Display="Dynamic" ControlToValidate="txtCountryName">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plCountryDisplayOrder" runat="server" ControlName="txtCountryDisplayOrder">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtCountryDisplayOrder" runat="server" Columns="10" Text="10"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator9" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="^-?\d+$" ControlToValidate="txtCountryDisplayOrder"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label2" runat="server" resourcekey="Tip_CountryIsDefault" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plCountryIsDefault" runat="server" ControlName="chkCountryIsDefault" />
        </td>
        <td>
            <asp:CheckBox ID="chkCountryIsDefault" runat="server" />
        </td>
    </tr>
</table>
<table width="100%" class="dnnFormItem" align="left" runat="server" id="tblStateList">
    <tr>
        <td>
            <asp:Label ID="lblStateList" runat="server" CssClass="SubHead"></asp:Label><br />
            <asp:GridView ID="gvStateList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="Id" OnRowCommand="gvStateList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecordes" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAllState" runat="server" onclick="checkAll_State()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItemState" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblStateName" runat="server" resourcekey="lblStateName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblStateNameField" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblDisplayOrder" runat="server" resourcekey="lblDisplayOrder"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayOrderField" runat="server" Text='<%#Eval("DisplayOrder") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
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
                                Visible="<%#SupportsContentLocalization%>" runat="server" NavigateUrl='<%# EditUrl("ContentLocalize_Misc") + "?Table=State&ItemId=" + Eval("Id").ToString() %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblCity" runat="server" resourcekey="lblCity"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgCity" runat="server" CausesValidation="False" CommandName="City"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgCity",LocalResourceFile)%>'
                                ImageUrl="~/DesktopModules/CrossClassified/images/Home.gif" AlternateText='<%#Localization.GetString("imgCity", LocalResourceFile)%>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" Wrap="true" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="CrossGrid" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" Wrap="true" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" Wrap="true" HorizontalAlign="Left" />
                <EditRowStyle BackColor="#999999" Wrap="true" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <div class="dnnTreeLegend" id="div1" runat="server">
                <h6>
                    <asp:Label ID="Label1" runat="server" resourcekey="lblLegend" /></h6>
                <div class="dtlItem">
                    <img alt="" id="Img3" runat="server" src="~/images/edit.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="Literal1" runat="server" Text='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img4" runat="server" src="~/images/delete.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="Literal2" runat="server" Text='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <%if (SupportsContentLocalization)
                      {%>
                    <img alt="" id="Img11" runat="server" src="~/DesktopModules/CrossClassified/images/ml_content_16.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="Literal7" runat="server" Text='<%#Localization.GetString("imgContentLocalization", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <% } %>
                    <img alt="" id="Img5" runat="server" src="~/DesktopModules/CrossClassified/images/Home.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="Literal3" runat="server" Text='<%#Localization.GetString("imgCity", LocalResourceFile)%>' />
                </div>
            </div>
        </td>
    </tr>
</table>
<table id="tblStateDetail" cellspacing="0" cellpadding="2" width="100%" border="0"
    class="dnnFormItem" align="left" runat="server">
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plStateName" runat="server" ControlName="txtStateName"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtStateName" Columns="40" runat="server" /><asp:Image ID="Image2"
                runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="NormalRed"
                resourcekey="Required" Display="Dynamic" ControlToValidate="txtStateName">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plStateDisplayOrder" runat="server" ControlName="txtStateDisplayOrder">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtStateDisplayOrder" runat="server" Columns="10" Text="10"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="^-?\d+$" ControlToValidate="txtStateDisplayOrder"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<table width="100%" class="dnnFormItem" align="left" runat="server" id="tblCityList">
    <tr>
        <td>
            <asp:Label ID="lblCityList" runat="server" CssClass="SubHead"></asp:Label><br />
            <asp:GridView ID="gvCityList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="Id" OnRowCommand="gvCityList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecordes" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAllCity" runat="server" onclick="checkAll_City()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItemCity" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblCityName" runat="server" resourcekey="lblCityName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCityNameField" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblDisplayOrder" runat="server" resourcekey="lblDisplayOrder"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayOrderField" runat="server" Text='<%#Eval("DisplayOrder") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
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
                                Visible="<%#SupportsContentLocalization%>" runat="server" NavigateUrl='<%# EditUrl("ContentLocalize_Misc") + "?Table=City&ItemId=" + Eval("Id").ToString() %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblTown" runat="server" resourcekey="lblTown"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgTown" runat="server" CausesValidation="False" CommandName="Town"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgTown",LocalResourceFile)%>'
                                ImageUrl="~/DesktopModules/CrossClassified/images/Home.gif" AlternateText='<%#Localization.GetString("imgTown", LocalResourceFile)%>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" Wrap="true" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"  CssClass="CrossGrid"/>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" Wrap="true" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" Wrap="true" HorizontalAlign="Left" />
                <EditRowStyle BackColor="#999999" Wrap="true" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <div class="dnnTreeLegend" id="div2" runat="server">
                <h6>
                    <asp:Label ID="Label3" runat="server" resourcekey="lblLegend" /></h6>
                <div class="dtlItem">
                    <img alt="" id="Img6" runat="server" src="~/images/edit.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="Literal4" runat="server" Text='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img8" runat="server" src="~/images/delete.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="Literal5" runat="server" Text='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <%if (SupportsContentLocalization)
                      {%>
                    <img alt="" id="Img12" runat="server" src="~/DesktopModules/CrossClassified/images/ml_content_16.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="Literal8" runat="server" Text='<%#Localization.GetString("imgContentLocalization", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <% } %>
                    <img alt="" id="Img9" runat="server" src="~/DesktopModules/CrossClassified/images/Home.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="Literal6" runat="server" Text='<%#Localization.GetString("imgTown", LocalResourceFile)%>' />
                </div>
            </div>
        </td>
    </tr>
</table>
<table id="tblCityDetail" cellspacing="0" cellpadding="2" width="100%" border="0"
    class="dnnFormItem" align="left" runat="server">
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plCityName" runat="server" ControlName="txtCityName"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtCityName" Columns="40" runat="server" /><asp:Image ID="Image3"
                runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="NormalRed"
                resourcekey="Required" Display="Dynamic" ControlToValidate="txtCityName">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plCityDisplayOrder" runat="server" ControlName="txtCityDisplayOrder">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtCityDisplayOrder" runat="server" Columns="10" Text="10"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="^-?\d+$" ControlToValidate="txtCityDisplayOrder"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<table width="100%" class="dnnFormItem" runat="server" id="tblTownList">
    <tr>
        <td>
            <asp:Label ID="lblTownList" runat="server" CssClass="SubHead"></asp:Label><br />
            <asp:GridView ID="gvTownList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="Id" OnRowCommand="gvTownList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecordes" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAllTown" runat="server" onclick="checkAll_Town()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItemTown" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblTownName" runat="server" resourcekey="lblTownName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTownNameField" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblDisplayOrder" runat="server" resourcekey="lblDisplayOrder"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayOrderField" runat="server" Text='<%#Eval("DisplayOrder") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
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
                                Visible="<%#SupportsContentLocalization%>" runat="server" NavigateUrl='<%# EditUrl("ContentLocalize_Misc") + "?Table=Town&ItemId=" + Eval("Id").ToString() %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" Wrap="true" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="CrossGrid" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" Wrap="true" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" Wrap="true" HorizontalAlign="Left" />
                <EditRowStyle BackColor="#999999" Wrap="true" />
            </asp:GridView>
        </td>
    </tr>
</table>
<table id="tblTownDetail" cellspacing="0" cellpadding="2" width="100%" border="0"
    class="dnnFormItem" runat="server">
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plTownName" runat="server" ControlName="txtTownName"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtTownName" Columns="40" runat="server" />
            <asp:Image ID="Image4" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="NormalRed"
                resourcekey="Required" Display="Dynamic" ControlToValidate="txtTownName">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plTownDisplayOrder" runat="server" ControlName="txtTownDisplayOrder">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtTownDisplayOrder" runat="server" Columns="10" Text="10"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="^-?\d+$" ControlToValidate="txtTownDisplayOrder"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
