<%@ control language="C#" autoeventwireup="true" enableviewstate="true" inherits="Cross.Modules.CP_Product.View.AdminPromotion_Discount, App_Web_adminpromotion_discount.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<style type="text/css">
.CrossGrid th{
  text-align:center;
}
</style>

<script type="text/javascript">

    function checkAll_RoleDiscount() {
        if ($(":checkbox[id*='chkAll_RoleDiscount']").prop("checked") == true) {
            $(":checkbox[id*='chkItem_RoleDiscount']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_RoleDiscount']").prop("checked", false);
        }
    }
    function checkAll_CouponDiscount() {
        if ($(":checkbox[id*='chkAll_CouponDiscount']").prop("checked") == true) {
            $(":checkbox[id*='chkItem_CouponDiscount']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_CouponDiscount']").prop("checked", false);
        }
    }
    function checkAll_DateDiscount() {
        if ($(":checkbox[id*='chkAll_DateDiscount']").prop("checked") == true) {
            $(":checkbox[id*='chkItem_DateDiscount']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_DateDiscount']").prop("checked", false);
        }
    }

    $(function () {


        $("#divDiscountTabs").tabs();

        $("#divDiscountTabs").tabs(
        {
            activate: function (event, ui) {
                //Get or set the active option, after initialization:
                var currentActive = $("#divDiscountTabs").tabs("option", "active");
                //set it to a hidden field
                $("#<%= hidLastDiscountTab.ClientID %>").attr("value", currentActive.toString());
            }
        });

        var currDiscountTab = $("#<%= hidLastDiscountTab.ClientID %>").val();
        if (!isNaN(parseInt(currDiscountTab))) {
            currDiscountTab = parseInt(currDiscountTab);
        }
        $("#divDiscountTabs").tabs({ active: currDiscountTab });

    });
</script>
<asp:HiddenField runat="server" ID="hidLastDiscountTab" Value="0" />
<table width="100%" class="dnnFormItem" align="center" runat="server" id="tblButton">
    <tr>
        <td align="center">
            <dnn:CommandButton ID="btnAdd" runat="server" ImageUrl="~/images/add.gif" OnCommand="btnAdd_Click"
                ResourceKey="btnAddDiscount" CausesValidation="false" Visible="false" />
            &nbsp; &nbsp;
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
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnAdminHome" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
</table>
<div id="divDiscount" runat="server" visible="false">
    <div class="dnnFormItem dnnFormHelp dnnClear">
        <p align="right">
            <span>
                <asp:Image ID="Image3" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" />
                <%=LocalizeString("RequiredFields")%>
            </span>
        </p>
    </div>
    <div id="divDiscountTabs" style="width: 100%; overflow: hidden">
        <ul>
            <li><a href="#divDateDiscount"><span>
                <%#Localization.GetString("divDateDiscount", LocalResourceFile)%></span></a>
            </li>
            <li><a href="#divCoupon"><span>
                <%#Localization.GetString("divCoupon", LocalResourceFile)%></span></a> </li>
            <li><a href="#divRoleDiscount"><span>
                <%#Localization.GetString("divRoleDiscount", LocalResourceFile)%></span></a>
            </li>
        </ul>
         <div id="divDateDiscount" style="height: 100%" class="dnnFormItem">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td>
                        <asp:Label ID="lblDateDiscountList" runat="server" ResourceKey="lblDateDiscountList"></asp:Label><br />
                        <asp:GridView ID="gvDateDiscountList" runat="server" AutoGenerateColumns="False"
                            Width="100%" CellPadding="1" CellSpacing="1" GridLines="Both" BackColor="Gray"
                            ForeColor="#333333" DataKeyNames="Id" OnRowCommand="gvDateDiscountList_RowCommand">
                            <EmptyDataTemplate>
                                <asp:Label ID="lblNoRecores" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                                    runat="server"></asp:Label>
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <input type="checkbox" id="chkAll_DateDiscount" runat="server" onclick="checkAll_DateDiscount()" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkItem_DateDiscount" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblDiscount" runat="server" resourcekey="lblDiscount"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblDiscountField" runat="server" Text='<%#Eval("Discount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblStartDate" runat="server" resourcekey="lblStartDate"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblStartDateField" runat="server" Text='<%#  Convert.ToDateTime(Eval("StartDate")).ToShortDateString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblEndDate" runat="server" resourcekey="lblEndDate"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblEndDateField" runat="server" Text='<%#  GetNullDate(Convert.ToDateTime(Eval("EndDate")).ToShortDateString()) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblActive" runat="server" resourcekey="lblActive"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkActiveField" runat="server" Checked='<%# Eval("Active") %>'
                                            Enabled="false" />
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
                        <br />
                        <br />
                        <asp:Label ID="Label24" runat="server" resourcekey="Tip_Discount_Date" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div id="divCoupon" style="height: 100%" class="dnnFormItem">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td>
                        <asp:Label ID="lblCouponDiscountList" runat="server" ResourceKey="lblCouponDiscountList"></asp:Label><br />
                        <asp:GridView ID="gvCouponDiscountList" runat="server" AutoGenerateColumns="False"
                            CellPadding="1" CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%"
                            ForeColor="#333333" DataKeyNames="Id" OnRowCommand="gvCouponDiscountList_RowCommand">
                            <EmptyDataTemplate>
                                <asp:Label ID="lblNoRecores" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                                    runat="server"></asp:Label>
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <input type="checkbox" id="chkAll_CouponDiscount" runat="server" onclick="checkAll_CouponDiscount()" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkItem_CouponDiscount" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Label ID="lblCoupon" runat="server" resourcekey="lblCoupon"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblCouponField" runat="server" Text='<%# Eval("Coupon") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblDiscount" runat="server" resourcekey="lblDiscount"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblDiscountField" runat="server" Text='<%#Eval("Discount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblStartDate" runat="server" resourcekey="lblStartDate"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblStartDateField" runat="server" Text='<%#  Convert.ToDateTime(Eval("StartDate")).ToShortDateString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblEndDate" runat="server" resourcekey="lblEndDate"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblEndDateField" runat="server" Text='<%#  GetNullDate(Convert.ToDateTime(Eval("EndDate")).ToShortDateString()) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblActive" runat="server" resourcekey="lblActive"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkActiveField" runat="server" Checked='<%# Eval("Active") %>'
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblIsPublic" runat="server" resourcekey="lblIsPublic"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkIsPublicField" runat="server" Checked='<%# Eval("IsPublic") %>'
                                            Enabled="false" />
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
                        <br />
                        <br />
                        <asp:Label ID="Label13" runat="server" resourcekey="Tip_Discount_Coupon" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div id="divRoleDiscount" style="height: 100%" class="dnnFormItem">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td>
                        <asp:Label ID="lblRoleDiscountList" runat="server" resourcekey="lblRoleDiscountList"></asp:Label><br />
                        <asp:GridView ID="gvRoleDiscountList" runat="server" AutoGenerateColumns="False"
                            CellPadding="1" CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%"
                            ForeColor="#333333" DataKeyNames="Id" OnRowCommand="gvRoleDiscountList_RowCommand">
                            <EmptyDataTemplate>
                                <asp:Label ID="lblNoRecores" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                                    runat="server"></asp:Label>
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <input type="checkbox" id="chkAll_RoleDiscount" runat="server" onclick="checkAll_RoleDiscount()" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkItem_RoleDiscount" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Label ID="lblRoleName" runat="server" resourcekey="lblRoleName"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblRoleNameField" runat="server" Text='<%# Eval("RoleName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblDiscount" runat="server" resourcekey="lblDiscount"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblDiscountField" runat="server" Text='<%#Eval("Discount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblStartDate" runat="server" resourcekey="lblStartDate"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblStartDateField" runat="server" Text='<%#  Convert.ToDateTime(Eval("StartDate")).ToShortDateString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblEndDate" runat="server" resourcekey="lblEndDate"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblEndDateField" runat="server" Text='<%#  GetNullDate(Convert.ToDateTime(Eval("EndDate")).ToShortDateString()) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblActive" runat="server" resourcekey="lblActive"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkActiveField" runat="server" Checked='<%# Eval("Active") %>'
                                            Enabled="false" />
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
                        <br />
                        <br />
                        <asp:Label ID="Label5" runat="server" resourcekey="Tip_Discount_Role" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
       
    </div>
</div>
<table id="tblDateDiscountDetail" cellspacing="0" cellpadding="2" width="100%" class="dnnFormItem"
    border="0" align="left" runat="server">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label22" runat="server" resourcekey="Tip_Discount" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plDateDiscount" runat="server" ControlName="txtDateDiscount" ResourceKey="plDiscount">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtDateDiscount" Columns="20" runat="server" Text="10" />1 - 100
            <asp:RangeValidator ForeColor="Red" ID="RangeValidator7" runat="server" MinimumValue="1"
                MaximumValue="100" ControlToValidate="txtDateDiscount" resourcekey="Between1to100"
                Type="Integer" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plDateDiscountActive" runat="server" ControlName="chkDateDiscountActive"
                ResourceKey="plDiscountActive" />
        </td>
        <td>
            <asp:CheckBox ID="chkDateDiscountActive" runat="server" Checked="true" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plDateDiscountStartDate" runat="server" ControlName="txtDateDiscountStartDate"
                ResourceKey="plStartDate" />
        </td>
        <td>
            <asp:TextBox ID="txtDateDiscountStartDate" MaxLength="10" Columns="10" runat="server" />
            <asp:HyperLink ID="hlDateDiscountStartDate" Text="Calendar" resourcekey="Calendar"
                 runat="server" />
            <asp:CompareValidator ID="CompareValidator15" runat="server" CssClass="NormalRed"
                ControlToValidate="txtDateDiscountStartDate" resourcekey="Date.ErrorMessage"
                ErrorMessage="<br>You have entered an invalid date!" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plDateDiscountEndDate" runat="server" ControlName="txtDateDiscountEndDate"
                ResourceKey="plEndDate" />
        </td>
        <td>
            <asp:TextBox ID="txtDateDiscountEndDate" MaxLength="10" Columns="10" runat="server" />
            <asp:HyperLink ID="hlDateDiscountEndDate" resourcekey="Calendar" runat="server" />
            <asp:CompareValidator ID="CompareValidator16" runat="server" CssClass="NormalRed"
                ControlToValidate="txtDateDiscountEndDate" resourcekey="Date.ErrorMessage" ErrorMessage="<br>You have entered an invalid date!"
                Display="Dynamic" Type="Date" Operator="DataTypeCheck" />
            <br />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label3" runat="server" resourcekey="Tip_DiscountType" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plDateDiscountType" runat="server" ControlName="cblDateDiscountType"
                ResourceKey="plDiscountType"></dnn:Label>
        </td>
        <td>
            <asp:CheckBoxList ID="cblDateDiscountType" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plDateDiscountDescription" runat="server" ControlName="txtDateDiscountDescription"
                ResourceKey="plDiscountDescription"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtDateDiscountDescription" Columns="60" runat="server" />
        </td>
    </tr>
</table>
<table id="tblCouponDiscountDetail" cellspacing="0" cellpadding="2" width="100%"
    class="dnnFormItem" border="0" align="left" runat="server">
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plCoupon" runat="server" ControlName="txtCoupon"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtCoupon" Columns="40" runat="server" />
            <asp:Image ID="Image8" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="valNameRequired" runat="server" ControlToValidate="txtCoupon"
                Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label18" runat="server" resourcekey="Tip_Discount" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plCouponDiscount" runat="server" ControlName="txtCouponDiscount" ResourceKey="plDiscount">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtCouponDiscount" Columns="20" runat="server" Text="10" />1 -
            100
            <asp:RangeValidator ForeColor="Red" ID="RangeValidator3" runat="server" MinimumValue="1"
                MaximumValue="100" ControlToValidate="txtCouponDiscount" resourcekey="Between1to100"
                Type="Integer" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plCouponDiscountActive" runat="server" ControlName="chkCouponDiscountActive"
                ResourceKey="plDiscountActive" />
        </td>
        <td>
            <asp:CheckBox ID="chkCouponDiscountActive" runat="server" Checked="true" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label15" runat="server" resourcekey="Tip_Public" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plIsPublic" runat="server" ControlName="chkIsPublic" />
        </td>
        <td>
            <asp:CheckBox ID="chkIsPublic" runat="server" Checked="true" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plCouponDiscountStartDate" runat="server" ControlName="txtCouponDiscountStartDate"
                ResourceKey="plStartDate" />
        </td>
        <td>
            <asp:TextBox ID="txtCouponDiscountStartDate" MaxLength="10" Columns="10" runat="server" />
            <asp:HyperLink ID="hlCouponDiscountStartDate" Text="Calendar" resourcekey="Calendar"
                 runat="server" />
            <asp:CompareValidator ID="CompareValidator9" runat="server" CssClass="NormalRed"
                ControlToValidate="txtCouponDiscountStartDate" resourcekey="Date.ErrorMessage"
                ErrorMessage="<br>You have entered an invalid date!" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plCouponDiscountEndDate" runat="server" ControlName="txtCouponDiscountEndDate"
                ResourceKey="plEndDate" />
        </td>
        <td>
            <asp:TextBox ID="txtCouponDiscountEndDate" MaxLength="10" Columns="10" runat="server" />
            <asp:HyperLink ID="hlCouponDiscountEndDate" resourcekey="Calendar" runat="server" />
            <asp:CompareValidator ID="CompareValidator10" runat="server" CssClass="NormalRed"
                ControlToValidate="txtCouponDiscountEndDate" resourcekey="Date.ErrorMessage"
                ErrorMessage="<br>You have entered an invalid date!" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" />
            <br />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label1" runat="server" resourcekey="Tip_DiscountType" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plCouponDiscountType" runat="server" ControlName="cblCouponDiscountType"
                ResourceKey="plDiscountType"></dnn:Label>
        </td>
        <td>
            <asp:CheckBoxList ID="cblCouponDiscountType" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plCouponDiscountDescription" runat="server" ControlName="txtCouponDiscountDescription"
                ResourceKey="plDiscountDescription"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtCouponDiscountDescription" Columns="60" runat="server" />
        </td>
    </tr>
</table>
<table id="tblRoleDiscountDetail" cellspacing="0" cellpadding="2" width="100%" class="dnnFormItem"
    border="0" align="left" runat="server">
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plRole" runat="server" ControlName="ddlRole" />
        </td>
        <td>
            <asp:DropDownList ID="ddlRole" runat="server" DataTextField="RoleName" DataValueField="RoleId"
                Width="500px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label19" runat="server" resourcekey="Tip_Discount" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plRoleDiscount" runat="server" ControlName="txtRoleDiscount" ResourceKey="plDiscount">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtRoleDiscount" Columns="20" runat="server" Text="10" />1 - 100
            <asp:RangeValidator ForeColor="Red" ID="RangeValidator5" runat="server" MinimumValue="1"
                MaximumValue="100" ControlToValidate="txtRoleDiscount" resourcekey="Between1to100"
                Type="Integer" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plRoleDiscountActive" runat="server" ControlName="chkRoleDiscountActive"
                ResourceKey="plDiscountActive" />
        </td>
        <td>
            <asp:CheckBox ID="chkRoleDiscountActive" runat="server" Checked="true" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plRoleDiscountStartDate" runat="server" ControlName="txtRoleDiscountStartDate"
                ResourceKey="plStartDate" />
        </td>
        <td>
            <asp:TextBox ID="txtRoleDiscountStartDate" MaxLength="10" Columns="10" runat="server" />
            <asp:HyperLink ID="hlRoleDiscountStartDate" Text="Calendar" resourcekey="Calendar"
                 runat="server" />
            <asp:CompareValidator ID="CompareValidator11" runat="server" CssClass="NormalRed"
                ControlToValidate="txtRoleDiscountStartDate" resourcekey="Date.ErrorMessage"
                ErrorMessage="<br>You have entered an invalid date!" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plRoleDiscountEndDate" runat="server" ControlName="txtRoleDiscountEndDate"
                ResourceKey="plEndDate" />
        </td>
        <td>
            <asp:TextBox ID="txtRoleDiscountEndDate" MaxLength="10" Columns="10" runat="server" />
            <asp:HyperLink ID="hlRoleDiscountEndDate" resourcekey="Calendar" runat="server" />
            <asp:CompareValidator ID="CompareValidator12" runat="server" CssClass="NormalRed"
                ControlToValidate="txtRoleDiscountEndDate" resourcekey="Date.ErrorMessage" ErrorMessage="<br>You have entered an invalid date!"
                Display="Dynamic" Type="Date" Operator="DataTypeCheck" />
            <br />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label2" runat="server" resourcekey="Tip_DiscountType" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plRoleDiscountType" runat="server" ControlName="cblRoleDiscountType"
                ResourceKey="plDiscountType"></dnn:Label>
        </td>
        <td>
            <asp:CheckBoxList ID="cblRoleDiscountType" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plRoleDiscountDescription" runat="server" ControlName="txtRoleDiscountDescription"
                ResourceKey="plDiscountDescription"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtRoleDiscountDescription" Columns="60" runat="server" />
        </td>
    </tr>
</table>
