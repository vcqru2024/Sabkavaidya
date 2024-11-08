<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.UserBuyer_AddTicket, App_Web_userbuyer_addticket.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<table cellspacing="0" cellpadding="2" border="0"  width="100%" class="dnnFormItem" >
    <tr>
        <td colspan="2">
            <asp:Label ID="lblTicket" runat="server" CssClass="SubHead" />
            <br />
        </td>
    </tr>
    <tr>
        <td colspan="2" >
        <asp:Label ID="Label1" runat="server" resourcekey="Tip_HelpTicket"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
   
        </td>
    </tr>
    <tr>
        <td style="width:150px">
            <dnn:Label ID="plTicketTitle" runat="server"  ControlName="txtTitle" />
        </td>
        <td>
            <asp:TextBox ID="txtTitle" runat="server"  Width="600px" />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                AlternateText="Required" />
            <asp:RequiredFieldValidator ID="valNameRequired" runat="server" ControlToValidate="txtTitle"
                Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td valign="middle">
            <dnn:Label ID="plTicketDescription" runat="server"  ControlName="txtDescription" />
        </td>
        <td>
            <asp:TextBox ID="txtDescription" runat="server" Width="600px"  TextMode="Multiline"
                Rows="15" />
            <asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescription"
                Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <dnn:CommandButton ID="btnCreateTicket" runat="server" ResourceKey="btnCreateTicket"
                ImageUrl="~/images/add.gif" OnCommand="btnCreateTicket_Click" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnCancel" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                OnCommand="btnCancel_Click"  CausesValidation="false" />
        </td>
    </tr>
</table>
