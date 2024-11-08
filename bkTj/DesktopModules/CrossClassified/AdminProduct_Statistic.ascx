<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.AdminProduct_Statistic, App_Web_adminproduct_statistic.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<style type="text/css">
.CrossGrid th{
  text-align:center;
}
</style>

<table width="100%" class="dnnFormItem" >
    <tr>
        <td  align="left" runat="server" id="td_Button_Search">
         <asp:Label ID="lblStart" runat="server" resourcekey="lblStart" />
            <asp:TextBox ID="txtStart" MaxLength="10" Columns="10" runat="server"  Width="120px"/>
            <asp:HyperLink ID="hlStart" Text="Calendar" resourcekey="Calendar"
                runat="server" />
            <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="NormalRed"
                ControlToValidate="txtStart" resourcekey="Date.ErrorMessage" ErrorMessage="<br>You have entered an invalid date!"
                Display="Dynamic" Type="Date" Operator="DataTypeCheck" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblEnd" runat="server" resourcekey="lblEnd" />
            <asp:TextBox ID="txtEnd" MaxLength="10" Columns="10" runat="server"  Width="120px"/>
            <asp:HyperLink ID="hlEnd" Text="Calendar" resourcekey="Calendar"
                runat="server" />
            <asp:CompareValidator ID="CompareValidator2" runat="server" CssClass="NormalRed"
                ControlToValidate="txtEnd" resourcekey="Date.ErrorMessage" ErrorMessage="<br>You have entered an invalid date!"
                Display="Dynamic" Type="Date" Operator="DataTypeCheck" /><br />
         
            <asp:Label ID="lblProductType" runat="server" resourcekey="lblProductType" />
            <asp:DropDownList ID="ddlProductType"  Width="300px" runat="server" 
                DataTextField="Name" DataValueField="Id" >
            </asp:DropDownList>
                <asp:Label ID="lblUserName" runat="server" resourcekey="lblUserName1" />
            <asp:TextBox ID="txtUserName" runat="server" Columns="10"  Width="120px">
            </asp:TextBox>
            <asp:Label ID="lblPageSize" runat="server" resourcekey="lblPageSize" />
            <asp:DropDownList ID="ddlPageSize" runat="server"  Width="80px">
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
            </asp:DropDownList>
          
            <dnn:CommandButton ID="btnSearch" runat="server" CausesValidation="false" ImageUrl="~/images/icon_search_16px.gif"
                ResourceKey="btnSearch" OnCommand="btnSearch_Click" /> &nbsp;&nbsp;

       
            </td>
            <td align="right">
               <asp:Label ID="lblUser" runat="server" Visible="false" CssClass="SubHead" />   &nbsp;&nbsp;
            <dnn:CommandButton ID="btnCancel" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                OnCommand="btnCancel_Click" Visible="false" CausesValidation="false" />
            &nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnMyAccount" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
     <tr>
        <td colspan="2">
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
</table>
<table width="100%" class="dnnFormItem" id="tbl_List" runat="server">
   
    <tr>
        <td align="right">
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="1"  CellSpacing="1"  GridLines="Both" BackColor="Gray"
                Width="100%"  ForeColor="#333333" DataKeyNames="Value"  OnRowCommand="gvList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecords" Text='<%# Localization.GetString("NoRecords",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                  
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblUserId" runat="server" resourcekey="lblUserId"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUserIdData" runat="server" Text='<%# Eval("Value") %>'></asp:Label>
                        </ItemTemplate>
                         <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblUsername" runat="server" resourcekey="lblUsername"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:label ID="lblUsernameData" runat="server" Text='<%# Eval("Text") %>' /> 
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblDisplayName" runat="server" resourcekey="lblDisplayName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:label ID="lblDisplayNameData" runat="server" Text='<%# GetDisplayName(Convert.ToString(Eval("Value"))) %>' /> 
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblUserSell" runat="server" resourcekey="lblUserSell"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUserSellData" runat="server" Text='<%#GetUserSell(Convert.ToString(Eval("Value"))).ToString("N") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblSiteCharge" runat="server" resourcekey="lblSiteCharge"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSiteChargeData" runat="server" Text='<%#GetSiteCharge(Convert.ToString(Eval("Value"))).ToString("N") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblUserRemain" runat="server" resourcekey="lblUserRemain"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUserRemainData" runat="server" Text='<%#GetUserRemain(Convert.ToString(Eval("Value"))).ToString("N") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                     <asp:TemplateField  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction"/>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgViewPayment" runat="server" CausesValidation="False"
                                CommandName="ViewPayment" CommandArgument='<%# Eval("Value")%>' ToolTip='<%#Localization.GetString("imgViewPayment",LocalResourceFile)%>'
                                ImageUrl="~/images/icon_search_16px.gif" AlternateText='<%#Localization.GetString("imgViewPayment",LocalResourceFile)%>' />
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
             <asp:Label ID="lblUserSell" runat="server" resourcekey="lblUserSell1"></asp:Label>
             <asp:Label ID="lblUserSellSum" runat="server"  CssClass="NormalRed"></asp:Label>&nbsp;&nbsp;
              <asp:Label ID="lblSiteCharge" runat="server" resourcekey="lblSiteCharge1"></asp:Label>
             <asp:Label ID="lblSiteChargeSum" runat="server"  CssClass="NormalRed"></asp:Label>&nbsp;&nbsp;
              <asp:Label ID="lblUserRemain" runat="server" resourcekey="lblUserRemain1"></asp:Label>
             <asp:Label ID="lblUserRemainSum" runat="server"  CssClass="NormalRed"></asp:Label>&nbsp;&nbsp;
        </td>
    </tr>
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr align="left" valign="top">
        <td>
            <cross:PagingControl ID="ctlPagingControl" runat="server" Mode="PostBack" OnPageChanged="ctlPagingControl_PageChanged">
            </cross:PagingControl>
        </td>
    </tr>
    <%--  <tr >
        <td>
            <div class="dnnTreeLegend" id="divLegend" runat="server">
                <h6>
                    <asp:Label ID="lblLegend" runat="server" resourcekey="lblLegend" /></h6>
                <div class="dtlItem">
                    <img alt="" id="Img1" runat="server" src="~/images/icon_search_16px.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblEdit" runat="server" Text='<%#Localization.GetString("imgViewPayment", LocalResourceFile)%>' />
                </div>
            </div>
        </td>
    </tr>--%>
     <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
     <tr>
        <td>

            <asp:Label ID="lblMassPaymentTip" runat="server" resourcekey="lblMassPaymentTip" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
             <asp:Label ID="lblNote" runat="server" resourcekey="lblNote" />
            <asp:TextBox ID="txtNote" runat="server" Columns="10"  Width="300px" Text="Payment from {startdate} to {enddate}"/>
             <asp:Label ID="lblCurrency" runat="server" resourcekey="lblCurrency" />
            <asp:DropDownList ID="ddlCurrency" runat="server"  Width="200px">
                <asp:ListItem resourcekey="li_Currency_USD" Value="USD" Selected="True"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_AUD" Value="AUD" ></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_GBP" Value="GBP"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_CAD" Value="CAD"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_CZK" Value="CZK"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_DKK" Value="DKK"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_EUR" Value="EUR"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_HKD" Value="HKD"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_HUF" Value="HUF"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_ILS" Value="ILS"></asp:ListItem>

                 <asp:ListItem resourcekey="li_Currency_JPY" Value="JPY"></asp:ListItem>
                 <asp:ListItem resourcekey="li_Currency_MXN" Value="MXN"></asp:ListItem>
                 <asp:ListItem resourcekey="li_Currency_TWD" Value="TWD"></asp:ListItem>
                 <asp:ListItem resourcekey="li_Currency_NZD" Value="NZD"></asp:ListItem>
                 <asp:ListItem resourcekey="li_Currency_NOK" Value="NOK"></asp:ListItem>
                 <asp:ListItem resourcekey="li_Currency_PHP" Value="PHP"></asp:ListItem>
                 <asp:ListItem resourcekey="li_Currency_PLN" Value="PLN"></asp:ListItem>
              
                 <asp:ListItem resourcekey="li_Currency_RUB" Value="RUB"></asp:ListItem>
                 <asp:ListItem resourcekey="li_Currency_SGD" Value="SGD"></asp:ListItem>
                 <asp:ListItem resourcekey="li_Currency_SEK" Value="SEK"></asp:ListItem>
                 <asp:ListItem resourcekey="li_Currency_CHF" Value="CHF"></asp:ListItem>
                 <asp:ListItem resourcekey="li_Currency_THB" Value="THB"></asp:ListItem>
            </asp:DropDownList>
           
            <dnn:CommandButton ID="btnCreatePayPalMass" runat="server" CausesValidation="false" ImageUrl="~/desktopmodules/crossclassified/images/up.gif"
                ResourceKey="btnCreatePayPalMass" OnCommand="btnCreatePayPalMass_Click" />
        </td>
    </tr>
</table>
<table id="tblPayment" cellspacing="0" cellpadding="2"  border="0" align="left" class="dnnFormItem" width="100%"
    visible="false" runat="server">
    <tr>
        <td style="width:150px">
            <asp:Label ID="lblP_Type" runat="server" ResourceKey="lblP_Type"  />
        </td>
        <td align="left">
            <asp:DropDownList ID="ddlP_Type" runat="server" Width="150px" Enabled="false">
                <asp:ListItem Value="Paypal" resourcekey="li_P_Type_Paypal"></asp:ListItem>
                <asp:ListItem Value="Direct Deposit" resourcekey="li_P_Type_DirectDeposit"></asp:ListItem>
                <asp:ListItem Value="Check" resourcekey="li_P_Type_Check"></asp:ListItem>
                <asp:ListItem Value="Alipay" resourcekey="li_P_Type_Alipay"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td valign="top" colspan="2">
            <dnn:SectionHead ID="secPaypal" CssClass="SubHead" runat="server" Section="tblPaypal"
                ResourceKey="secPaypal" IncludeRule="True" IsExpanded="true"></dnn:SectionHead>
            <table id="tblPaypal" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblP_Paypal" runat="server" ResourceKey="lblP_Paypal" ></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_Paypal"  runat="server"  ReadOnly="True" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" colspan="2">
            <dnn:SectionHead ID="secAlipay" CssClass="SubHead" runat="server" Section="tblAlipay"
                ResourceKey="secAlipay" IncludeRule="True" IsExpanded="true"></dnn:SectionHead>
            <table id="tblAlipay" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td style="width: 150px">
                    <asp:Label ID="lblP_Alipay" runat="server" ResourceKey="lblP_Alipay" ></asp:Label>
                       
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_Alipay"  runat="server"  ReadOnly="True"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" colspan="2">
            <dnn:SectionHead ID="secDirectDeposit" CssClass="SubHead" runat="server" Section="tblDirectDeposit"
                ResourceKey="secDirectDeposit" IncludeRule="True" IsExpanded="true"></dnn:SectionHead>
            <table id="tblDirectDeposit" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblP_DD_BankName" runat="server" ResourceKey="lblP_DD_BankName" >
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_DD_BankName" Columns="70" runat="server" ReadOnly="True"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblP_DD_RoutingNumber" runat="server" ResourceKey="lblP_DD_RoutingNumber"
                            ></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_DD_RoutingNumber" Columns="70" runat="server" ReadOnly="True" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblP_DD_AccountNumber" runat="server" ResourceKey="lblP_DD_AccountNumber"
                            ></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_DD_AccountNumber" Columns="40" runat="server" ReadOnly="True"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblP_DD_AccountType" runat="server" ResourceKey="lblP_DD_AccountType"
                            ></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlP_DD_AccountType" runat="server" Enabled="false">
                            <asp:ListItem Value="Savings" resourcekey="li_P_DD_AccountType_Savings"></asp:ListItem>
                            <asp:ListItem Value="Checking" resourcekey="li_P_DD_AccountType_Checking"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" colspan="2">
            <dnn:SectionHead ID="secCheck" CssClass="SubHead" runat="server" Section="tblCheck"
                ResourceKey="secCheck" IncludeRule="True" IsExpanded="true"></dnn:SectionHead>
            <table id="tblCheck" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblP_C_Payee" runat="server" ResourceKey="lblP_C_Payee" >
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_C_Payee" Columns="70" runat="server" ReadOnly="True"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblP_C_Address1" runat="server" ResourceKey="lblP_C_Address1" >
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_C_Address1" Columns="70" runat="server" ReadOnly="True"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblP_C_Address2" runat="server" ResourceKey="lblP_C_Address2" >
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_C_Address2" Columns="70" runat="server" ReadOnly="True"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblP_C_City" runat="server" ResourceKey="lblP_C_City" ></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_C_City" Columns="40" runat="server" ReadOnly="True"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblP_C_RegionCode" runat="server" ResourceKey="lblP_C_RegionCode" >
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_C_RegionCode" Columns="40" runat="server" ReadOnly="True"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <asp:Label ID="lblP_C_CountryCode" runat="server" ResourceKey="lblP_C_CountryCode"
                            ></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_C_CountryCode" Columns="40" runat="server" ReadOnly="True"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

