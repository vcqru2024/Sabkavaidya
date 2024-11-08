<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.Admin_SetupWizard, App_Web_admin_setupwizard.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="Portal" Namespace="DotNetNuke.Security.Permissions.Controls"
    Assembly="DotNetNuke" %>
<asp:Wizard ID="wizSetup" runat="server" CssClass="dnnFormItem" ActiveStepIndex="0" SideBarStyle-Width="200px"
    Font-Names="Verdana" CellPadding="5" CellSpacing="5" FinishCompleteButtonType="Link"
    FinishPreviousButtonType="Link" StartNextButtonType="Link" StepNextButtonType="Link"
    StepPreviousButtonType="Link" Width="98%" BackColor="#F7F6F3" BorderColor="#CCCCCC"
    BorderStyle="Solid" BorderWidth="1px" Font-Size="1.0em" 
    OnFinishButtonClick="wizSetup_FinishButtonClick" 
    onactivestepchanged="wizSetup_ActiveStepChanged">
    <StepStyle VerticalAlign="Top" Width="100%" BorderWidth="0px" ForeColor="#5D7B9D"
        CssClass="Normal" />
    <NavigationButtonStyle CssClass="Normal" BackColor="#FFFBFF" BorderColor="#CCCCCC"
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em"
        ForeColor="#284775" />
    <StartNavigationTemplate>
        <table border="0" cellpadding="5" cellspacing="5">
            <tr>
                <td align="right">
                    <asp:LinkButton ID="StartNextButton" runat="server" CommandName="MoveNext" CssClass="dnnPrimaryAction"
                        Text='<%#Localization.GetString("StepNextButton",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />
                </td>
            </tr>
        </table>
    </StartNavigationTemplate>
    <StepNavigationTemplate>
        <table border="0" cellpadding="5" cellspacing="5">
            <tr>
                <td align="right">
                    <asp:LinkButton ID="StepPreviousButton" runat="server" CommandName="MovePrevious"
                        Text='<%#Localization.GetString("StepPreviousButton",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                        CssClass="dnnSecondaryAction" />
                </td>
                <td align="right">
                    <asp:LinkButton ID="StepNextButton" runat="server" CommandName="MoveNext" Text='<%#Localization.GetString("StepNextButton",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                        CssClass="dnnPrimaryAction" />
                </td>
            </tr>
        </table>
    </StepNavigationTemplate>
    <FinishNavigationTemplate>
        <table border="0" cellpadding="5" cellspacing="5">
            <tr>
                <td align="right">
                    <asp:LinkButton ID="FinishPreviousButton" runat="server" CommandName="MovePrevious"
                        Text='<%#Localization.GetString("StepPreviousButton",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                        CssClass="dnnSecondaryAction" />
                </td>
                <td align="right">
                    <asp:LinkButton ID="FinishButton" runat="server" CommandName="MoveComplete" Text='<%#Localization.GetString("StepFinishButton",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                        CssClass="dnnPrimaryAction" />
                </td>
            </tr>
        </table>
    </FinishNavigationTemplate>
    <WizardSteps>
        <asp:WizardStep ID="wsGeneral" runat="server" Title='<%# Localization.GetString("wsGeneral", LocalResourceFile) %>'
            StepType="Start">
            <h4>
                <asp:Label ID="lblGeneral" runat="server" resourcekey="lblGeneral"/>
            </h4>
            <hr />
            <table cellspacing="2" cellpadding="2" class="dnnFormItem" width="100%">
                <tr>
                    <td>
                        <asp:Label ID="lblGeneralTips" runat="server" resourcekey="lblGeneralTips" CssClass="dnnFormMessage dnnFormInfo"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButtonList ID="rblSetupType" runat="server" AutoPostBack="True" 
                            OnSelectedIndexChanged="rblSetupType_SelectedIndexChanged">
                            <asp:ListItem Value="Yes" ResourceKey="li_SetupType_Yes" Selected="True"/>
                            <asp:ListItem Value="No" ResourceKey="li_SetupType_No" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </asp:WizardStep>

         <asp:WizardStep ID="wsFixedPrice" runat="server" Title='<%# Localization.GetString("wsFixedPrice", LocalResourceFile) %>'>
            <h4>
                <asp:Label ID="lblFixedPrice" runat="server" resourcekey="lblFixedPrice" />
            </h4>
            <hr />
            
             <table cellspacing="2" cellpadding="2" class="dnnFormItem" width="100%">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblFixedPriceTip" runat="server" resourcekey="lblFixedPriceTip" CssClass="dnnFormMessage dnnFormInfo"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:RadioButtonList ID="rblFixedPrice" runat="server" AutoPostBack="True" 
                            OnSelectedIndexChanged="rblFixedPrice_SelectedIndexChanged">
                            <asp:ListItem Value="Yes" ResourceKey="li_FixedPrice_Yes"  Selected="True"/>
                            <asp:ListItem Value="No" ResourceKey="li_FixedPrice_No" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
            <table cellspacing="2" cellpadding="2" runat="server" id="tblFixedPrice_Property" class="dnnFormItem" width="100%">
               <tr>
                    <td colspan="2">
                        <asp:Label ID="lblFixedPrice_Property" runat="server" resourcekey="lblFixedPrice_Property" CssClass="dnnFormMessage dnnFormInfo"/>
                    </td>
                </tr>
                <tr>
                 <td style="width: 200px;vertical-align:middle">
                        <dnn:Label ID="plFixedPrice_Property" runat="server" ControlName="cblFixedPrice_Property" />
                    </td>
                    <td>
                     <asp:CheckBox ID="cbFixedPrice_Property_Goods" runat="server" Checked="true"  resourcekey="cbFixedPrice_Property_Goods"/><br /><br />
                     <asp:CheckBox ID="cbFixedPrice_Property_Software" runat="server" Checked="true"  resourcekey="cbFixedPrice_Property_Software"/><br /><br />
                     <asp:CheckBox ID="cbFixedPrice_Property_Role" runat="server" Checked="true"  resourcekey="cbFixedPrice_Property_Role"/><br /><br />
                     <asp:CheckBox ID="cbFixedPrice_Property_Other" runat="server" Checked="true"  resourcekey="cbFixedPrice_Property_Other"/>
                    </td>
                </tr>
            </table>         
        </asp:WizardStep>

          <asp:WizardStep ID="wsAuction" runat="server" Title='<%# Localization.GetString("wsAuction", LocalResourceFile) %>'>
            <h4>
                <asp:Label ID="lblAuction" runat="server" resourcekey="lblAuction" />
            </h4>
            <hr />
            
             <table cellspacing="2" cellpadding="2" class="dnnFormItem" width="100%">
                <tr>
                    <td>
                        <asp:Label ID="lblAuctionTip" runat="server" resourcekey="lblAuctionTip" CssClass="dnnFormMessage dnnFormInfo"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButtonList ID="rblAuction" runat="server" AutoPostBack="True" 
                            OnSelectedIndexChanged="rblAuction_SelectedIndexChanged">
                            <asp:ListItem Value="Yes" ResourceKey="li_Auction_Yes"  Selected="True"/>
                            <asp:ListItem Value="No" ResourceKey="li_Auction_No" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
            <table cellspacing="2" cellpadding="2" runat="server" id="tblAuction_Property" class="dnnFormItem" width="100%">
               <tr>
                    <td colspan="2">
                        <asp:Label ID="lblAuction_Property" runat="server" resourcekey="lblAuction_Property" CssClass="dnnFormMessage dnnFormInfo"/>
                    </td>
                </tr>
                <tr>
                 <td style="width: 200px">
                        <dnn:Label ID="plAuction_Property" runat="server" ControlName="cblAuction_Property" />
                    </td>
                    <td>
                     <asp:CheckBox ID="cbAuction_Property_Goods" runat="server" Checked="true"  resourcekey="cbAuction_Property_Goods"/><br /><br />
                     <asp:CheckBox ID="cbAuction_Property_Software" runat="server" Checked="true"  resourcekey="cbAuction_Property_Software"/><br /><br />
                   
                     <asp:CheckBox ID="cbAuction_Property_Other" runat="server" Checked="true"  resourcekey="cbAuction_Property_Other"/>
                       
                    </td>
                </tr>
            </table>         
        </asp:WizardStep>

         <asp:WizardStep ID="wsAd" runat="server" Title='<%# Localization.GetString("wsAd", LocalResourceFile) %>'>
            <h4>
                <asp:Label ID="lblAd" runat="server" resourcekey="lblAd" />
            </h4>
            <hr />
            
             <table cellspacing="2" cellpadding="2" class="dnnFormItem" width="100%">
                <tr>
                    <td>
                        <asp:Label ID="lblAdTip" runat="server" resourcekey="lblAdTip" CssClass="dnnFormMessage dnnFormInfo"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButtonList ID="rblAd" runat="server">
                            <asp:ListItem Value="Yes" ResourceKey="li_Ad_Yes"  Selected="True"/>
                            <asp:ListItem Value="No" ResourceKey="li_Ad_No" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                       
                      <Portal:TabPermissionsGrid ID="ctlTabPermissionsGrid" runat="server" Visible="false"/>
                      
                    </td>
                </tr>
            </table>
          
        </asp:WizardStep>
         <asp:WizardStep ID="wsPayPal" runat="server" Title='<%# Localization.GetString("wsPayPal", LocalResourceFile) %>'>
            <h4>
                <asp:Label ID="lblPayPal" runat="server" resourcekey="lblPayPal" />
            </h4>
            <hr />
             <table cellspacing="2" cellpadding="2" class="dnnFormItem" width="100%">
                 <tr>
                     <td colspan="2">
                         <asp:Label ID="lblPayPalTip" runat="server" resourcekey="Tip_PayPal" CssClass="dnnFormMessage dnnFormInfo" />
                     </td>
                 </tr>
                 <tr>
                     <td style="width: 200px">
                         <dnn:Label ID="plEnablePaypal" runat="server" ControlName="chkEnablePaypal"></dnn:Label>
                     </td>
                     <td>
                         <asp:CheckBox ID="chkEnablePaypal" runat="server"></asp:CheckBox>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <dnn:Label ID="plPayPalId" runat="server" ControlName="txtPayPalId"></dnn:Label>
                     </td>
                     <td>
                         <asp:TextBox ID="txtPayPalId" runat="server" Columns="40"></asp:TextBox>
                         <asp:Image ID="Image4" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                             ToolTip="Reuired" AlternateText="Required" />
                         <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" resourcekey="Tip_InvalidEmail"
                             runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                             ControlToValidate="txtPayPalId" />
                     </td>
                 </tr>
             </table>         
        </asp:WizardStep>

        <asp:WizardStep ID="wsFinish" runat="server" Title='<%# Localization.GetString("Finish",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
            StepType="Finish">
            <h4>
                <asp:Label ID="lblFinish" runat="server" Text="Finish" resourcekey="lblFinish"  /></h4>
            <hr />
            <asp:Label ID="lblFailure" runat="server" Visible="False" CssClass="NormalRed" />
            <asp:Label ID="lblSummary" runat="server" resourcekey="lblSummary" CssClass="dnnFormMessage dnnFormInfo"/>

            
        </asp:WizardStep>
    </WizardSteps>
    <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top"
        CssClass="Normal" />
    <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" CssClass="CommandButton" />
    <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em"
        ForeColor="White" HorizontalAlign="Left" />
</asp:Wizard>
<table width="100%" class="dnnFormItem"  runat="server" id="tblFinish" visible="false">
    <tr>
        <td>
           <asp:Label ID="lblSuccess" runat="server" resourcekey="lblSuccess"  CssClass="dnnFormMessage dnnFormInfo"/>
           <br />
          
           <asp:HyperLink runat="server" ID="hlAccessAdmin" ResourceKey="hlAccessAdmin"  Target="_blank"/>
            &nbsp;&nbsp;&nbsp;&nbsp;
         
           <asp:HyperLink runat="server" ID="hlReturn" ResourceKey="hlReturn" Target="_self"/>
        </td>
    </tr>
</table>