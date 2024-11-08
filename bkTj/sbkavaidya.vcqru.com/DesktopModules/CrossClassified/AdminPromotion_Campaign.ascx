<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.AdminPromotion_Campaign, App_Web_adminpromotion_campaign.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" TagName="URLControl" Src="~/controls/URLControl.ascx" %>
<table cellspacing="2" cellpadding="2" border="0" width="100%" class="dnnFormItem">
    <tr>
        <td colspan="2">
        <asp:Label ID="Label1" runat="server" resourcekey="Tip_SendMail"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
       
        </td>
    </tr>
    
    <tr>
        <td  style="width: 150px; vertical-align: middle">
            <dnn:Label ID="plRoles" runat="server" ControlName="dgSelectedRoles" 
                 />
        </td>
        <td >
            <dnn:RolesSelectionGrid runat="server" ID="dgSelectedRoles" />
        </td>
    </tr>
    <tr>
        <td >
            <dnn:Label ID="plEmail" runat="server" ControlName="txtEmail"  />
        </td>
        <td >
            <asp:TextBox ID="txtEmail"  runat="server" TextMode="MultiLine" Rows="6" Style="width: 525px" />
        </td>
    </tr>
    <tr>
        <td >
            <dnn:Label ID="plFrom" runat="server" ControlName="txtFrom"  />
        </td>
        <td >
            <asp:TextBox ID="txtFrom"  runat="server" Style="width: 525px"
                MaxLength="100" />
              <asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                AlternateText="Required" />
            <asp:RegularExpressionValidator ID="revEmailAddress" runat="server" resourcekey="revEmailAddress.ErrorMessage"
                ErrorMessage="RegularExpressionValidator" CssClass="NormalRed" ControlToValidate="txtFrom"
                ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
        </td>
    </tr>
   
    <tr>
        <td >
            <dnn:Label ID="plSubject" runat="server" ControlName="txtSubject"  />
        </td>
        <td>
            <asp:TextBox ID="txtSubject" runat="server" Style="width: 525px" MaxLength="100" />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                AlternateText="Required" />
            <asp:RequiredFieldValidator ID="varName" runat="server" CssClass="NormalRed" resourcekey="Required"
                Display="Dynamic" ControlToValidate="txtSubject">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
     <tr>
        <td colspan="2">
            <br />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblMessage"  runat="server"  resourcekey="lblMessage" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <dnn:TextEditor ID="txtMessage" runat="server" Width="100%" TextRenderMode="Raw" HtmlEncode="False"
                DefaultMode="Rich" Height="350" ChooseMode="True" ChooseRender="False" />
        </td>
    </tr>
     <tr>
        <td colspan="2">
          <asp:Label ID="Label3" runat="server" resourcekey="Tip_Attachment"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
          
        </td>
    </tr>
    <tr>
        <td  valign="middle">
            <dnn:Label ID="plAttachment" runat="server" ControlName="ctlAttachment"  />
        </td>
        <td>
            <dnn:URLControl id="ctlAttachment" runat="server" Required="False" ShowUpLoad="true"
                width="325" ShowTrack="False" ShowLog="False" ShowTabs="False" ShowUrls="False" />
        </td>
    </tr>
</table>
<p align="center">
    <dnn:CommandButton ID="cmdSend" ResourceKey="cmdSend" runat="server" CssClass="CommandButton" OnCommand="cmdSend_Click" CausesValidation="true"
        ImageUrl="~/images/rt.gif" />
    &nbsp;&nbsp;
    <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnAdminHome" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
</p>
