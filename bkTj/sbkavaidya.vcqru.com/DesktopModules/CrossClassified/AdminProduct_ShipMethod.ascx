<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.AdminProduct_ShipMethod, App_Web_adminproduct_shipmethod.ascx.87459c53" %>
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
    function checkAll_ShipMethod() {
        if ($(":checkbox[id*='chkAllShipMethod']").prop("checked") == true) {
            $(":checkbox[id*='chkItemShipMethod']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItemShipMethod']").prop("checked", false);
        }
    }
    function checkAll_ShipFee() {
        if ($(":checkbox[id*='chkAllShipFee']").prop("checked") == true) {
            $(":checkbox[id*='chkItemShipFee']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItemShipFee']").prop("checked", false);
        }
    }
</script>

<table width="100%" class="dnnFormItem" align="center" runat="server" id="tblButton">
    <tr >
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
            <dnn:CommandButton ID="btnBackToList" runat="server" ResourceKey="btnBackToList"
                CausesValidation="false" Visible="false" ImageUrl="~/DesktopModules/CrossClassified/images/up.gif"
                OnCommand="btnBackToList_Click" />
            &nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnAdminHome" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
</table>
<table width="100%" class="dnnFormItem"  runat="server" id="tblShipMethodList">
    <tr  >
        <td>
            <asp:Label ID="lblShipMethodList" runat="server" resourcekey="lblShipMethodList"
                CssClass="SubHead" />
            <br />
            <asp:GridView ID="gvShipMethodList" runat="server" AutoGenerateColumns="False" CellPadding="1"  CellSpacing="1"  GridLines="Both" BackColor="Gray"
                Width="100%"  ForeColor="#333333"  DataKeyNames="Id"
                OnRowCommand="gvShipMethodList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecordes" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAllShipMethod" runat="server" onclick="checkAll_ShipMethod()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItemShipMethod" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblShipMethodName" runat="server" resourcekey="lblShipMethodName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblShipMethodNameField" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
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
                               <asp:HyperLink ID="hlContentLocalization" Target="_blank" ImageUrl="~/DesktopModules/CrossClassified/images/ml_content_16.gif"
                                Visible="<%#SupportsContentLocalization%>" runat="server" NavigateUrl='<%# EditUrl("ContentLocalize_Misc") + "?Table=ShipMethod&ItemId=" + Eval("Id").ToString() %>' />
                        
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblShipFee" runat="server" resourcekey="lblShipFee"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgShipFee" runat="server" CausesValidation="False" CommandName="ShipFee"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgShipFee",LocalResourceFile)%>'
                                ImageUrl="~/DesktopModules/CrossClassified/images/Option.gif" AlternateText='<%#Localization.GetString("imgShipFee", LocalResourceFile)%>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"  CssClass="CrossGrid"/>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" />
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
                    <img alt="" id="Img12" runat="server" src="~/DesktopModules/CrossClassified/images/ml_content_16.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="Literal8" runat="server" Text='<%#Localization.GetString("imgContentLocalization", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <% } %>

                    <img alt="" id="Img2" runat="server" src="~/DesktopModules/CrossClassified/images/Option.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblState" runat="server" Text='<%#Localization.GetString("imgShipFee", LocalResourceFile)%>' />
                </div>
            </div>
        </td>
    </tr>
</table>
<table id="tblShipMethodDetail" cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem"
    runat="server" >
    <tr >
        <td style="width: 150px">
            <dnn:Label ID="plShipMethodName" runat="server" ControlName="txtShipMethodName" >
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtShipMethodName" Columns="40" runat="server" /><asp:Image ID="Image1"
                runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="varShipMethodName" runat="server" CssClass="NormalRed"
                resourcekey="Required" Display="Dynamic" ControlToValidate="txtShipMethodName">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plApplyToCountry" runat="server"  ControlName="cblCountry">
            </dnn:Label>
        </td>
        <td>
            <asp:CheckBoxList ID="cblCountry" runat="server" RepeatColumns="4" DataTextField="Name"
                DataValueField="Id">
            </asp:CheckBoxList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plShipMethodDisplayOrder" runat="server"  ControlName="txtShipMethodDisplayOrder">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtShipMethodDisplayOrder" runat="server" Columns="10" Text="10"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator9" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="^-?\d+$" ControlToValidate="txtShipMethodDisplayOrder"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<table width="100%" class="dnnFormItem"  runat="server" id="tblShipFeeList">
    <tr >
        <td>
            <asp:Label ID="lblShipFeeList" runat="server" CssClass="SubHead"></asp:Label><br />
            <asp:GridView ID="gvShipFeeList" runat="server" AutoGenerateColumns="False" CellPadding="1"  CellSpacing="1"  GridLines="Both" BackColor="Gray"
                Width="100%"  ForeColor="#333333" DataKeyNames="Id"
                OnRowCommand="gvShipFeeList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecordes" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAllShipFee" runat="server" onclick="checkAll_ShipFee()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItemShipFee" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblCountryName" runat="server" resourcekey="lblCountryName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCountryNameField" runat="server" Text='<%# GetCountry(Convert.ToString(Eval("CountryId"))) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblStateName" runat="server" resourcekey="lblStateName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblStateNameField" runat="server" Text='<%#GetState(Convert.ToString(Eval("StateId"))) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblBasicWeight" runat="server" resourcekey="lblBasicWeight"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBasicWeightField" runat="server" Text='<%# Eval("BasicWeight") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblBasicFee" runat="server" resourcekey="lblBasicFee"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBasicFeeField" runat="server" Text='<%# Eval("BasicFee") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblExtendWeight" runat="server" resourcekey="lblExtendWeight"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblExtendWeightField" runat="server" Text='<%# Eval("ExtendWeight") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblExtendFee" runat="server" resourcekey="lblExtendFee"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblExtendFeeField" runat="server" Text='<%# Eval("ExtendFee") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
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
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" Wrap="true" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="CrossGrid" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" Wrap="true" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" Wrap="true" />
                <EditRowStyle BackColor="#999999" Wrap="true" />
            </asp:GridView>
        </td>
    </tr>
</table>
<table id="tblShipFeeDetail" cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem"
     runat="server">
    <tr>
        <td colspan="2">
            <asp:Label ID="lblShipFeeCompute" runat="server" resourcekey="lblShipFeeCompute"  CssClass="dnnFormMessage dnnFormInfo"/>
        </td>
    </tr>
    <tr >
        <td style="width: 150px">
            <dnn:Label ID="plCountry" runat="server" ControlName="ddlCountry" ></dnn:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlCountry" runat="server" DataTextField="Country" DataValueField="CountryId"
                AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"
                Width="300" />
        </td>
    </tr>
    <tr >
        <td style="width: 150px">
            <dnn:Label ID="plState" runat="server" ControlName="ddlState" ></dnn:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlState" runat="server" DataTextField="Name" DataValueField="Id"
                Width="300px" />
        </td>
    </tr>
    <tr>
        <td >
            <dnn:Label ID="plBasicWeight" runat="server"  ControlName="txtBasicWeight">
            </dnn:Label>
        </td>
        <td  >
            <asp:TextBox ID="txtBasicWeight" runat="server" Columns="10" Text="1"></asp:TextBox><%#Settings_Portal.Order.WeightSymbol%>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:Label ID="plBasicFee" runat="server"  ControlName="txtBasicFee"></dnn:Label>
        </td>
        <td  >
            <asp:TextBox ID="txtBasicFee" runat="server" Columns="10" Text="1"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:Label ID="plExtendWeight" runat="server"  ControlName="txtExtendWeight">
            </dnn:Label>
        </td>
        <td  >
            <asp:TextBox ID="txtExtendWeight" runat="server" Columns="10" Text="1"></asp:TextBox><%#Settings_Portal.Order.WeightSymbol%>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:Label ID="plExtendFee" runat="server"  ControlName="txtExtendFee">
            </dnn:Label>
        </td>
        <td  >
            <asp:TextBox ID="txtExtendFee" runat="server" Columns="10" Text="1"></asp:TextBox>
        </td>
    </tr>
</table>
