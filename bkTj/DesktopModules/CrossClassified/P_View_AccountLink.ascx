<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.P_View_AccountLink, App_Web_p_view_accountlink.ascx.87459c53" %>
<asp:LinkButton CssClass="dnnPrimaryAction" ID="lbtnSetupWizard" OnClick="lbtnSetupWizard_Click"
        resourcekey="lbtnSetupWizard" runat="server" BorderStyle="none" CausesValidation="False"  Visible="false">
</asp:LinkButton>
<table id="tblLink" cellspacing="0" cellpadding="0" visible="false" width="100%"
    runat="server">
    <tr>
        <td>
            <asp:Image ImageUrl="~/images/edit.gif" runat="server" ID="imgEdit" Visible="false" />
            <asp:HyperLink runat="server" ID="hlEdit" Visible="false" />
            &nbsp; &nbsp;
            <asp:Image ImageUrl="~/DesktopModules/CrossClassified/images/home.gif" runat="server" ID="imgAdminControlPanel"
                Visible="false" />
            <asp:HyperLink runat="server" ID="hlAdminControlPanel" Visible="false" Target="_blank" />
             &nbsp; &nbsp;
            <asp:Image ImageUrl="~/images/action_help.gif" runat="server" ID="imgHelp"
                Visible="false" />
            <asp:HyperLink runat="server" ID="hlHelp" Visible="false" Target="_blank" />
        </td>
    </tr>
</table>

<asp:PlaceHolder ID="plhView" runat="server"></asp:PlaceHolder>