<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.AdminProduct_UDT, App_Web_adminproduct_udt.ascx.87459c53" %>
<%@ Register TagPrefix="Portal" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<style type="text/css">
.CrossGrid th{
  text-align:center;
}
</style>


<table width="100%" class="dnnFormItem" align="center" runat="server" id="tblButton">
    <tr>
        <td align="center">
            <asp:Label ID="lblProductType" runat="server" resourcekey="lblProductType" />
            <asp:DropDownList ID="ddlProductType"  runat="server"  Width="300px"
                DataTextField="Name" DataValueField="Id" AutoPostBack="True" OnSelectedIndexChanged="ddlProductType_SelectedIndexChanged">
            </asp:DropDownList>
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnAdd" runat="server" ResourceKey="btnAdd" ImageUrl="~/images/add.gif"
                OnCommand="btnAdd_Click" CausesValidation="false" />
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
    <tr visible="true" id="trGrid" runat="server" valign="top">
        <td align="left" valign="top">
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="1"  CellSpacing="1"  GridLines="Both" BackColor="Gray"
                Width="100%"  ForeColor="#333333"  DataKeyNames="Id"
                OnRowCommand="gvList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecores" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server" CssClass="Normal"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FieldName" SortExpression="FieldName">
                        <HeaderTemplate>
                            <asp:Label ID="lblFieldName" runat="server" resourcekey="lblFieldName">FieldName</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFieldNameData" runat="server" Text='<%# Eval("FieldName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FieldTitle" SortExpression="FieldTitle">
                        <HeaderTemplate>
                            <asp:Label ID="lblFieldTitle" runat="server" resourcekey="lblFieldTitle">FieldTitle</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFieldTitleData" runat="server" Text='<%#Eval("FieldTitle") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FieldType" SortExpression="FieldType">
                        <HeaderTemplate>
                            <asp:Label ID="lblFieldType" runat="server" resourcekey="lblFieldType">FieldType</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFieldTypeData" runat="server" Text='<%# Eval("FieldType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Required" SortExpression="Required">
                        <HeaderTemplate>
                            <asp:Label ID="lblRequired" runat="server" resourcekey="lblRequired">Required</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkRequiredData" runat="server" Checked='<%# Eval("Required") %>'
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
                            <asp:ImageButton ID="imgUp" runat="server" CausesValidation="false" CommandName="Up"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/up.gif" ToolTip='<%#Localization.GetString("imgUp", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                AlternateText='<%#Localization.GetString("imgUp", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                Visible="<%#Container.DataItemIndex>0%>" />
                            <asp:ImageButton ID="imgDown" runat="server" CausesValidation="false" CommandName="Down"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/dn.gif" ToolTip='<%#Localization.GetString("imgDown", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                AlternateText='<%#Localization.GetString("imgDown", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                Visible="<%#Container.DataItemIndex< PortalFieldOrder - 1%>" />
                              <asp:HyperLink ID="hlContentLocalization" Target="_blank" ImageUrl="~/DesktopModules/CrossClassified/images/ml_content_16.gif"
                                Visible="<%#SupportsContentLocalization%>" runat="server" NavigateUrl='<%# EditUrl("ContentLocalize_UDT") + "?UDFieldId=" + Eval("Id").ToString() %>' />
                        
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="CrossGrid" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </td>
    </tr>
     <tr runat="server" id="trLegend">
        <td>
            <div class="dnnTreeLegend" id="divLegend" runat="server">
                <h6>
                    <asp:Label ID="lblLegend" runat="server" resourcekey="lblLegend" /></h6>
                <div class="dtlItem">
                    <img alt="" id="Img1" runat="server" src="~/images/edit.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblEdit" runat="server" Text='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img7" runat="server" src="~/images/delete.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblDelete" runat="server" Text='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img3" runat="server" src="~/images/up.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblUp" runat="server" Text='<%#Localization.GetString("imgUp", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img2" runat="server" src="~/images/dn.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblDown" runat="server" Text='<%#Localization.GetString("imgDown", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />
                    <%if (SupportsContentLocalization)
                      {%>
                    <img alt="" id="Img12" runat="server" src="~/DesktopModules/CrossClassified/images/ml_content_16.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="Literal8" runat="server" Text='<%#Localization.GetString("imgContentLocalization", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <% } %>
                </div>
            </div>
        </td>
    </tr>
    <tr runat="server" id="trDetail" visible="False" width="100%">
        <td>
            <table width="100%" cellspacing="2" cellpadding="2" border="0" class="dnnFormItem">
                  <tr class="dnnFormItem dnnFormHelp dnnClear">
                    <td align="right" colspan="2">
                        <asp:Image ID="Image7" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" />
                        <%=LocalizeString("RequiredFields")%>
                     </td>
                </tr>
                
                 <tr>
                    <td colspan="2" >
                      <asp:Label ID="Label1" runat="server" resourcekey="Tip_AddAttribute"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                      
                    </td>
                </tr>
                
                <tr>
                    <td  style="width:150px">
                        <dnn:Label ID="plName" runat="server" ></dnn:Label>
                    </td>
                    <td >
                        <asp:TextBox ID="txtName" runat="server"  Width="400px"></asp:TextBox>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="varName" runat="server" CssClass="NormalRed" resourcekey="Required"
                            Display="Dynamic" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plTitle" runat="server" ></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTitle" runat="server"  Width="400px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plType" runat="server" ></dnn:Label>
                    </td>
                    <td valign="top">
                        <asp:DropDownList ID="ddlType" runat="server"  AutoPostBack="true"
                            Width="400px" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRequired" runat="server" ></dnn:Label>
                    </td>
                    <td >
                        <asp:CheckBox ID="chkRequired" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr id="trInputSettings" runat="server">
                    <td>
                        <dnn:Label ID="plInputSettings" runat="server" ></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtInputSettings" runat="server"  Width="400px"
                            MaxLength="2000"></asp:TextBox>
                        <asp:DropDownList ID="ddlInputSettings" runat="server"  Width="400px"
                            Visible="False" DataTextField="Key" DataValueField="Value">
                        </asp:DropDownList>
                        <asp:RadioButtonList ID="rblListType" runat="server" RepeatDirection="Vertical"
                            >
                            <asp:ListItem Selected="True" Value="DropDown" resourcekey="li_DropDown"></asp:ListItem>
                            <asp:ListItem Value="RadioButtonsVertical" resourcekey="li_RadioButtonsVertical"></asp:ListItem>
                            <asp:ListItem Value="RadioButtonsHorizontal" resourcekey="li_RadioButtonsHorizontal"></asp:ListItem>
                            <asp:ListItem Value="CheckBoxsVertical" resourcekey="li_CheckBoxsVertical"></asp:ListItem>
                            <asp:ListItem Value="CheckBoxsHorizontal" resourcekey="li_CheckBoxsHorizontal"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr id="trOutputSettings" runat="server">
                    <td>
                        <dnn:Label ID="plOutputSettings" runat="server" ></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOutputSettings" runat="server"  Width="400px"
                            MaxLength="2000"></asp:TextBox>
                    </td>
                </tr>
                <tr id="trNormalizeFlag" runat="server">
                    <td>
                        <dnn:Label ID="plNormalizeFlag" runat="server" ></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkNormalizeFlag" runat="server" Width="100%"></asp:CheckBox>
                    </td>
                </tr>
                <tr id="trDefault" runat="server">
                    <td>
                        <dnn:Label ID="plDefault" runat="server" ></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDefault" runat="server"  Width="400px"></asp:TextBox>
                    </td>
                </tr>
                <tr id="trValidationRule" runat="server">
                    <td>
                        <dnn:Label ID="plValidationRule" runat="server" ></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtValidationRule" runat="server"  Width="400px"
                            MaxLength="512"></asp:TextBox>
                    </td>
                </tr>
                <tr id="trValidationMessage" runat="server">
                    <td>
                        <dnn:Label ID="plValidationMessage" runat="server" ></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtValidationMessage" runat="server"  Width="400px"
                            MaxLength="512"></asp:TextBox>
                    </td>
                </tr>
                <tr id="trEditStyle" runat="server">
                    <td>
                        <dnn:Label ID="plEditStyle" runat="server" ></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEditStyle" runat="server"  Width="400px"
                            MaxLength="512"></asp:TextBox>
                    </td>
                </tr>
                <tr id="trHelpText" runat="server">
                    <td>
                        <dnn:Label ID="plHelpText" runat="server" ></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtHelpText" runat="server"  Width="400px" TextMode="MultiLine"
                            MaxLength="512" Height="100px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
