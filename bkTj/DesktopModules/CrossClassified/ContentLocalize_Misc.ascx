<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.ContentLocalize_Misc, App_Web_contentlocalize_misc.ascx.87459c53" %>

<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>

<table width="100%" class="dnnFormItem" runat="server" id="tblButton">
    <tr>
        <td align="center">
            <dnn:commandbutton id="btnUpdate" runat="server" resourcekey="cmdUpdate" imageurl="~/images/save.gif"
                oncommand="btnUpdate_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <a onclick="window.opener=null" href="javascript:window.close()">
                <img alt="" id="Img10" runat="server" src="~/DesktopModules/CrossClassified/images/delete.gif" />
                <asp:Label ID="lblClosePage" runat="server" ResourceKey="lblClosePage" />
            </a>
        </td>
    </tr>
</table>
<table width="100%" cellspacing="2" cellpadding="2" border="0" runat="server" id="tblNameOrTitle"   class="dnnFormItem">
    <tr class="dnnFormItem dnnFormHelp dnnClear">
        <td align="right" colspan="2">
            <asp:Image ID="Image16" runat="server" ImageUrl="~/images/rew.gif" />
                  <%=LocalizeString("Tip_ValueCanBeModify")%>
        </td>
    </tr>
     <tr>
        <td colspan="2">
            <asp:Label ID="Label1" runat="server" resourcekey="Tip_ContentLocalize" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <asp:Label ID="lblCurrentTarget_NameOrTitle" runat="server" ResourceKey="lblCurrentTarget"/>
        </td>
        <td>
            <asp:TextBox ID="txtCurrentTarget_NameOrTitle" runat="server" Width="400px" ReadOnly="true" ></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Image ID="imgDefaultValue_NameOrTitle" runat="server"/>
            <asp:Label ID="lblDefaultValue_NameOrTitle" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtDefaultValue_NameOrTitle" runat="server" Width="400px" ReadOnly="true" ></asp:TextBox>
        </td>
    </tr>

    <tr runat="server" id="trLan1Value_NameOrTitle" visible="false">
        <td>
            <asp:Image ID="imgLan1Value_NameOrTitle" runat="server"/>
            <asp:Label ID="lblLan1Value_NameOrTitle" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan1Value_NameOrTitle" runat="server" Width="400px"></asp:TextBox>
             <asp:Image ID="Image2" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan2Value_NameOrTitle" visible="false">
        <td>
            <asp:Image ID="imgLan2Value_NameOrTitle" runat="server"/>
            <asp:Label ID="lblLan2Value_NameOrTitle" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan2Value_NameOrTitle" runat="server" Width="400px"></asp:TextBox>
             <asp:Image ID="Image3" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan3Value_NameOrTitle" visible="false">
        <td>
            <asp:Image ID="imgLan3Value_NameOrTitle" runat="server"/>
            <asp:Label ID="lblLan3Value_NameOrTitle" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan3Value_NameOrTitle" runat="server" Width="400px"></asp:TextBox>
             <asp:Image ID="Image4" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan4Value_NameOrTitle" visible="false">
        <td>
            <asp:Image ID="imgLan4Value_NameOrTitle" runat="server"/>
            <asp:Label ID="lblLan4Value_NameOrTitle" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan4Value_NameOrTitle" runat="server" Width="400px"></asp:TextBox>
             <asp:Image ID="Image5" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan5Value_NameOrTitle" visible="false">
        <td>
            <asp:Image ID="imgLan5Value_NameOrTitle" runat="server"/>
            <asp:Label ID="lblLan5Value_NameOrTitle" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan5Value_NameOrTitle" runat="server" Width="400px"></asp:TextBox>
             <asp:Image ID="Image6" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan6Value_NameOrTitle" visible="false">
        <td>
            <asp:Image ID="imgLan6Value_NameOrTitle" runat="server"/>
            <asp:Label ID="lblLan6Value_NameOrTitle" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan6Value_NameOrTitle" runat="server" Width="400px"></asp:TextBox>
             <asp:Image ID="Image8" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan7Value_NameOrTitle" visible="false">
        <td>
            <asp:Image ID="imgLan7Value_NameOrTitle" runat="server"/>
            <asp:Label ID="lblLan7Value_NameOrTitle" runat="server"/>
             </td>
        <td>
             <asp:TextBox ID="txtLan7Value_NameOrTitle" runat="server" Width="400px"></asp:TextBox>
             <asp:Image ID="Image9" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan8Value_NameOrTitle" visible="false">
        <td>
            <asp:Image ID="imgLan8Value_NameOrTitle" runat="server"/>
            <asp:Label ID="lblLan8Value_NameOrTitle" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan8Value_NameOrTitle" runat="server" Width="400px"></asp:TextBox>
             <asp:Image ID="Image10" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan9Value_NameOrTitle" visible="false">
        <td>
            <asp:Image ID="imgLan9Value_NameOrTitle" runat="server"/>
            <asp:Label ID="lblLan9Value_NameOrTitle" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan9Value_NameOrTitle" runat="server" Width="400px"></asp:TextBox>
             <asp:Image ID="Image11" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan10Value_NameOrTitle" visible="false">
        <td>
            <asp:Image ID="imgLan10Value_NameOrTitle" runat="server"/>
            <asp:Label ID="lblLan10Value_NameOrTitle" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan10Value_NameOrTitle" runat="server" Width="400px"></asp:TextBox>
             <asp:Image ID="Image12" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
</table>

<table width="100%" cellspacing="2" cellpadding="2" border="0" runat="server" id="tblDescription"  class="dnnFormItem" visible="false">
    
     <tr>
        <td colspan="2">
            <br /><br />
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <asp:Label ID="plCurrentTarget_Description" runat="server" ResourceKey="lblCurrentTarget"/>
        </td>
        <td>
            <asp:TextBox ID="txtCurrentTarget_Description" runat="server" Width="400px" ReadOnly="true" ></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Image ID="imgDefaultValue_Description" runat="server"/>
            <asp:Label ID="lblDefaultValue_Description" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtDefaultValue_Description" runat="server" Width="400px" TextMode="MultiLine" Rows="6" ReadOnly="true" ></asp:TextBox>
        </td>
    </tr>

    <tr runat="server" id="trLan1Value_Description" visible="false">
        <td>
            <asp:Image ID="imgLan1Value_Description" runat="server"/>
            <asp:Label ID="lblLan1Value_Description" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan1Value_Description" runat="server" Width="400px" TextMode="MultiLine" Rows="6"></asp:TextBox>
             <asp:Image ID="Image1" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan2Value_Description" visible="false">
        <td>
            <asp:Image ID="imgLan2Value_Description" runat="server"/>
            <asp:Label ID="lblLan2Value_Description" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan2Value_Description" runat="server" Width="400px" TextMode="MultiLine" Rows="6"></asp:TextBox>
             <asp:Image ID="Image7" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan3Value_Description" visible="false">
        <td>
            <asp:Image ID="imgLan3Value_Description" runat="server"/>
            <asp:Label ID="lblLan3Value_Description" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan3Value_Description" runat="server" Width="400px" TextMode="MultiLine" Rows="6"></asp:TextBox>
            <asp:Image ID="Image13" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan4Value_Description" visible="false">
        <td>
            <asp:Image ID="imgLan4Value_Description" runat="server"/>
            <asp:Label ID="lblLan4Value_Description" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan4Value_Description" runat="server" Width="400px" TextMode="MultiLine" Rows="6"></asp:TextBox>
            <asp:Image ID="Image14" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan5Value_Description" visible="false">
        <td>
            <asp:Image ID="imgLan5Value_Description" runat="server"/>
            <asp:Label ID="lblLan5Value_Description" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan5Value_Description" runat="server" Width="400px" TextMode="MultiLine" Rows="6"></asp:TextBox>
            <asp:Image ID="Image15" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan6Value_Description" visible="false">
        <td>
            <asp:Image ID="imgLan6Value_Description" runat="server"/>
            <asp:Label ID="lblLan6Value_Description" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan6Value_Description" runat="server" Width="400px" TextMode="MultiLine" Rows="6"></asp:TextBox>
           <asp:Image ID="Image17" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan7Value_Description" visible="false">
        <td>
            <asp:Image ID="imgLan7Value_Description" runat="server"/>
            <asp:Label ID="lblLan7Value_Description" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan7Value_Description" runat="server" Width="400px" TextMode="MultiLine" Rows="6"></asp:TextBox>
            <asp:Image ID="Image18" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan8Value_Description" visible="false">
        <td>
            <asp:Image ID="imgLan8Value_Description" runat="server"/>
            <asp:Label ID="lblLan8Value_Description" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan8Value_Description" runat="server" Width="400px" TextMode="MultiLine" Rows="6"></asp:TextBox>
            <asp:Image ID="Image19" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan9Value_Description" visible="false">
        <td>
            <asp:Image ID="imgLan9Value_Description" runat="server"/>
            <asp:Label ID="lblLan9Value_Description" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan9Value_Description" runat="server" Width="400px" TextMode="MultiLine" Rows="6"></asp:TextBox>
          <asp:Image ID="Image20" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
    <tr runat="server" id="trLan10Value_Description" visible="false">
        <td>
            <asp:Image ID="imgLan10Value_Description" runat="server"/>
            <asp:Label ID="lblLan10Value_Description" runat="server"/>
        </td>
        <td>
             <asp:TextBox ID="txtLan10Value_Description" runat="server" Width="400px" TextMode="MultiLine" Rows="6"></asp:TextBox>
             <asp:Image ID="Image21" runat="server" ImageUrl="~/images/rew.gif"
                 />
        </td>
    </tr>
</table>