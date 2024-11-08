<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.AdminProduct_TypeDetailWizard, App_Web_adminproduct_typedetailwizard.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="Portal" Namespace="DotNetNuke.Security.Permissions.Controls"
    Assembly="DotNetNuke" %>
<asp:Wizard ID="wizProduct" runat="server" CssClass="dnnFormItem" ActiveStepIndex="0"
    SideBarStyle-Width="100px" Font-Names="Verdana" CellPadding="5" CellSpacing="5"
    FinishCompleteButtonType="Link" FinishPreviousButtonType="Link" StartNextButtonType="Link"
    StepNextButtonType="Link" StepPreviousButtonType="Link" Width="100%" BackColor="#F7F6F3"
    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Size="1.0em"
    OnFinishButtonClick="wizProduct_FinishButtonClick">
    <StepStyle VerticalAlign="Top" Width="100%" BorderWidth="0px" ForeColor="#5D7B9D"
        CssClass="dnnFormItem" />
    <NavigationButtonStyle CssClass="dnnFormItem" BackColor="#FFFBFF" BorderColor="#CCCCCC"
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
                <asp:Label ID="lblGeneral" runat="server" />
            </h4>
            <hr />
            <table cellspacing="2" cellpadding="2" class="dnnFormItem" width="100%">
                <tr>
                    <td>
                        <asp:Label ID="lblGeneralTips" runat="server" resourcekey="Tip_General" CssClass="dnnFormMessage dnnFormInfo"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButtonList ID="rblCreateType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblCreateType_SelectedIndexChanged">
                            <asp:ListItem Value="CreateNew" ResourceKey="li_CreateType_CreateNew" />
                            <asp:ListItem Value="UseExisting" ResourceKey="li_CreateType_UseExisting" />
                            <asp:ListItem Value="Later" ResourceKey="li_CreateType_Later" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="wsPage" runat="server" Title='<%# Localization.GetString("wsPage", LocalResourceFile) %>'>
            <h4>
                <asp:Label ID="lblPage" runat="server" resourcekey="lblPage" />
            </h4>
            <hr />
            <table cellspacing="2" cellpadding="2" class="dnnFormItem" runat="server" id="tblPageCreateNew">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plTabName" runat="server" ControlName="txtTabName" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtTabName" runat="server" MaxLength="50" Text="Product Detail"
                            Width="300px" />
                        <asp:RequiredFieldValidator ID="valTabName" CssClass="NormalRed" runat="server" resourcekey="valTabName.ErrorMessage"
                            Display="Dynamic" ControlToValidate="txtTabName" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plParentTab" runat="server" ControlName="ddlParentTab" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlParentTab" runat="server" DataTextField="IndentedTabName"
                            Width="400px" DataValueField="TabId" />
                    </td>
                </tr>
                <tr runat="server" visible="false">
                    <td colspan="2">
                        <dnn:Label ID="plPermissions" runat="server" CssClass="SubHead" ControlName="dgPermissions" />
                        <br /> <br />
                        <div style="text-align: left">
                            <Portal:TabPermissionsGrid ID="dgPermissions" runat="server" />
                        </div>
                    </td>
                </tr>
            </table>
            <table cellspacing="2" cellpadding="2" class="dnnFormItem" runat="server" id="tblExistingTab">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plExistingTab" runat="server" ControlName="ddlExistingTab" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlExistingTab" runat="server" DataTextField="IndentedTabName"
                            Width="400px" DataValueField="TabId" />
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="wsFinish" runat="server" Title='<%# Localization.GetString("Finish",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
            StepType="Finish">
            <h4>
                <asp:Label ID="lblFinish" runat="server" Text="Finish" resourcekey="lblFinish" Width="600px" /></h4>
            <hr />
            <asp:Label ID="lblFailure" runat="server" Visible="False" CssClass="NormalRed" />
        </asp:WizardStep>
    </WizardSteps>
    <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top"
        CssClass="dnnFormItem" />
    <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" CssClass="CommandButton" />
    <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em"
        ForeColor="White" HorizontalAlign="Left" />
</asp:Wizard>
