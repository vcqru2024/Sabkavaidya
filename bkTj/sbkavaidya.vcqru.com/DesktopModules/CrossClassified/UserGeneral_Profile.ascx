<%@ control language="C#" autoeventwireup="true" enableviewstate="true" inherits="Cross.Modules.CP_Product.View.UserGeneral_Profile, App_Web_usergeneral_profile.ascx.87459c53" %>
<%@ Register TagPrefix="cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
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


<table width="100%" class="dnnFormItem" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td align="left">
            <asp:Label ID="lblCurrentUser" runat="server" CssClass="SubHead" Visible="false" />
            <asp:Label ID="lblCurrent" runat="server" CssClass="SubHead" />
        </td>
        <td align="right">
            <asp:LinkButton ID="lbtnBasic" runat="server" resourcekey="lbtnBasic" OnClick="lbtnBasic_Click">Basic</asp:LinkButton>
            &nbsp;|&nbsp;
            <%if (Settings_Portal.Feature.EnableAuction || Settings_Portal.Feature.EnableFixedPrice)
              { %>
            <asp:LinkButton ID="lbtnPayment" runat="server" resourcekey="lbtnPayment" OnClick="lbtnPayment_Click">Payment</asp:LinkButton>
            &nbsp;|&nbsp;
            <asp:LinkButton ID="lbtnCustomerMessage" runat="server" resourcekey="lbtnCustomerMessage"
                OnClick="lbtnCustomerMessage_Click">CustomerMessage</asp:LinkButton>
            &nbsp;|&nbsp;
            <asp:LinkButton ID="lbtnOrderNotification" runat="server" resourcekey="lbtnOrderNotification"
                OnClick="lbtnOrderNotification_Click">OrderNotification</asp:LinkButton>
            &nbsp;|&nbsp;
            <% } %>
            <asp:LinkButton ID="lbtnCustomizeDisplay" runat="server" resourcekey="lbtnCustomizeDisplay"
                OnClick="lbtnCustomizeDisplay_Click">CustomizeDisplay</asp:LinkButton>
            &nbsp;|&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnAdminHome" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <hr />
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <dnn:CommandButton ID="btnUpdate" runat="server" ResourceKey="cmdUpdate" ImageUrl="~/images/save.gif"
                OnCommand="btnUpdate_Click" Visible="false" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <div class="dnnFormItem dnnFormHelp dnnClear">
                <p align="right">
                    <span>
                        <asp:Image ID="Image7" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" />
                        <%=LocalizeString("RequiredFields")%><br />
                    </span>
                </p>
            </div>
        </td>
    </tr>
</table>
<table cellspacing="0" cellpadding="2" width="100%" border="0" runat="server" id="tblBasic" class="dnnFormItem"
    visible="false">
    <tr>
        <td colspan="2" >
         <asp:Label ID="Label1" runat="server" resourcekey="Tip_Email"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
          
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:Label ID="plEmail" runat="server" ControlName="txtEmail"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtEmail"  runat="server" />
            <asp:Image ID="Image14" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" resourcekey="Required"
                ID="RequiredFieldValidator7" />
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="Tip_InvalidEmail"
                runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="txtEmail" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblEmailExplanation" runat="server" ResourceKey="Tip_AvatarEmail" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>

        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plAvatarEmail" runat="server" ControlName="txtAvatarEmail"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtAvatarEmail" runat="server" />

            <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" resourcekey="Tip_InvalidEmail"
                runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="txtAvatarEmail" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Image ID="imgGravatarPreview" runat="server"></asp:Image>
        </td>
    </tr>
   
     <tr runat="server"  Visible="<%#InProductEditRoles && Settings_Portal.Order.AllowVendorDefineShippingMethod%>">
        <td colspan="2">
            <asp:Label ID="Label10" runat="server" resourcekey="Tip_FavoriteShippingMethod" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
     <tr runat="server"  Visible="<%#InProductEditRoles && Settings_Portal.Order.AllowVendorDefineShippingMethod%>">
        <td >
            <dnn:Label ID="plFavoriteShippingMethod" runat="server"></dnn:Label>
        </td>
        <td>
            <asp:CheckBoxList ID="cblShippingMethod" runat="server"  RepeatColumns="3"/>
        </td>
    </tr>

      <tr runat="server"  Visible="<%#InProductEditRoles%>">
        <td colspan="2">
            <asp:Label ID="lblProtectPassword" runat="server" resourcekey="Tip_ProtectPassword" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
     <tr runat="server"  Visible="<%#InProductEditRoles%>">
        <td >
            <dnn:Label ID="plProtectPassword" runat="server"></dnn:Label>
        </td>
        <td>
            <asp:textbox ID="txtProtectPassword" runat="server"  />
        </td>
    </tr>

    <tr>
        <td colspan="2">
            <asp:Label ID="Label8" runat="server" resourcekey="Tip_Company" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
     <tr>
        <td >
            <dnn:Label ID="plCompany" runat="server" ControlName="txtCompany"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtCompany" Columns="80" runat="server" />
        </td>
    </tr>
     <tr>
        <td >
            <dnn:Label ID="plVendorCountry" runat="server" ControlName="ddlVendorCountry"></dnn:Label>
        </td>
        <td>
            <asp:dropdownlist ID="ddlVendorCountry"  runat="server" AutoPostBack="True" DataTextField="Name" DataValueField="Id"
            OnSelectedIndexChanged="ddlVendorCountry_SelectedIndexChanged"/>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:Label ID="plVendorState" runat="server" ControlName="ddlVendorState"></dnn:Label>
        </td>
        <td>
            <asp:dropdownlist ID="ddlVendorState"  runat="server" AutoPostBack="True" 
            OnSelectedIndexChanged="ddlVendorState_SelectedIndexChanged"/>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plVendorCity" runat="server" ControlName="ddlVendorCity"></dnn:Label>
        </td>
        <td>
            <asp:dropdownlist ID="ddlVendorCity"  runat="server" AutoPostBack="True" 
            OnSelectedIndexChanged="ddlVendorCity_SelectedIndexChanged"/>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:Label ID="plVendorTown" runat="server" ControlName="ddlVendorTown"></dnn:Label>
        </td>
        <td>
            <asp:dropdownlist ID="ddlVendorTown"  runat="server"/>
        </td>
    </tr>
     <tr>
        <td >
            <dnn:Label ID="plTel" runat="server" ControlName="txtTel"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtTel" Columns="80" runat="server" />
        </td>
    </tr>
     <tr>
        <td >
            <dnn:Label ID="plFax" runat="server" ControlName="txtFax"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtFax" Columns="80" runat="server" />
        </td>
    </tr>
    <tr>
        <td >
            <dnn:Label ID="plZipcode" runat="server" ControlName="txtZipcode"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtZipcode" Columns="80" runat="server" />
        </td>
    </tr>
     <tr>
        <td >
            <dnn:Label ID="plIM" runat="server" ControlName="txtIM"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtIM" Columns="80" runat="server" />
        </td>
    </tr>
     <tr>
        <td >
            <dnn:Label ID="plLinkman" runat="server" ControlName="txtLinkman"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtLinkman" Columns="80" runat="server" />
        </td>
    </tr>
     <tr>
        <td >
            <dnn:Label ID="plAddress" runat="server" ControlName="txtAddress"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtAddress" Columns="100" runat="server" />
        </td>
    </tr>
     <tr>
        <td >
            <dnn:Label ID="plBusinessScope" runat="server" ControlName="txtBusinessScope"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtBusinessScope" Columns="100" runat="server"  Rows="4" TextMode="MultiLine"/>
        </td>
    </tr>

    <tr>
        <td >
            <dnn:Label ID="plSiteUrl" runat="server" ControlName="txtSiteUrl"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtSiteUrl" Columns="80" runat="server" />
        </td>
    </tr>
    <tr>
        <td >
            <dnn:Label ID="plLogoUrl" runat="server" ControlName="txtLogoUrl"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtLogoUrl" Columns="80" runat="server" />
        </td>
    </tr>
    <tr>
        <td >
            <dnn:Label ID="plSlogan" runat="server" ControlName="txtSlogan"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtSlogan" Columns="80" runat="server" />
        </td>
    </tr>
   
    <tr runat="server" id="trField1">
        <td>
             <dnn:Label ID="plField1" runat="server"  />
        </td>
        <td>
            <asp:TextBox ID="txtField1" Columns="80" runat="server" />
        </td>
    </tr>
    <tr runat="server" id="trField2">
        <td>
             <dnn:Label ID="plField2" runat="server"  />
        </td>
        <td>
            <asp:TextBox ID="txtField2" Columns="80" runat="server" />
        </td>
    </tr>
     <tr runat="server" id="trField3">
        <td>
             <dnn:Label ID="plField3" runat="server"  />
        </td>
        <td>
            <asp:TextBox ID="txtField3" Columns="80" runat="server" />
        </td>
    </tr>
     <tr runat="server" id="trField4">
        <td>
             <dnn:Label ID="plField4" runat="server"  />
        </td>
        <td>
            <asp:TextBox ID="txtField4" Columns="80" runat="server" />
        </td>
    </tr>
     <tr runat="server" id="trField5">
        <td>
             <dnn:Label ID="plField5" runat="server"  />
        </td>
        <td>
            <asp:TextBox ID="txtField5" Columns="80" runat="server" />
        </td>
    </tr>
     <tr runat="server" id="trField6">
        <td>
             <dnn:Label ID="plField6" runat="server"  />
        </td>
        <td>
            <asp:TextBox ID="txtField6" Columns="80" runat="server" />
        </td>
    </tr>
     <tr runat="server" id="trField7">
        <td>
             <dnn:Label ID="plField7" runat="server"  />
        </td>
        <td>
            <asp:TextBox ID="txtField7" Columns="80" runat="server" />
        </td>
    </tr>
     <tr runat="server" id="trField8">
        <td>
             <dnn:Label ID="plField8" runat="server"  />
        </td>
        <td>
            <asp:TextBox ID="txtField8" Columns="80" runat="server" />
        </td>
    </tr>
     <tr runat="server" id="trField9">
        <td>
             <dnn:Label ID="plField9" runat="server"  />
        </td>
        <td>
            <asp:TextBox ID="txtField9" Columns="80" runat="server" />
        </td>
    </tr>
     <tr runat="server" id="trField10">
        <td>
             <dnn:Label ID="plField10" runat="server"  />
        </td>
        <td>
            <asp:TextBox ID="txtField10" Columns="80" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <br />
            <br />
            <asp:Label ID="lblBiography" runat="server" resourcekey="lblBiography" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <dnn:TextEditor ID="txtBiography" Width="100%" Height="250px" runat="server" />
        </td>
    </tr>
</table>
<table cellspacing="0" cellpadding="2" width="100%" border="0" id="tblCustomizeDisplay" class="dnnFormItem"
    visible="false" runat="server">
    <tr>
        <td colspan="2">
            <asp:Label ID="lblCustomizeDisplayTip" runat="server" resourcekey="lblCustomizeDisplayTip" CssClass="dnnFormMessage dnnFormInfo"/>
        </td>
    </tr>
    <tr>
        <td style="width: 150px; vertical-align:middle">
            <dnn:Label ID="plSupport" runat="server" ControlName="txtSupport"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtSupport" Columns="100" Height="150px" TextMode="MultiLine" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="width: 150px; vertical-align:middle">
            <dnn:Label ID="plLicense" runat="server" ControlName="txtLicense"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtLicense" Columns="100" Height="150px" TextMode="MultiLine" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="width: 150px; vertical-align:middle">
            <dnn:Label ID="plDelivery" runat="server" ControlName="txtDelivery"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtDelivery" Columns="100" Height="150px" TextMode="MultiLine" runat="server" />
        </td>
    </tr>
</table>

<table id="tblReceive" cellspacing="0" cellpadding="2" width="100%" border="0" align="left" class="dnnFormItem"
    visible="false" runat="server">
    <tr>
        <td colspan="2" >
        <asp:Label ID="Label2" runat="server" resourcekey="Tip_ReceiveMoney"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
          
        </td>
    </tr>
    <tr>
        <td>
            <dnn:SectionHead ID="secR_Paypal" runat="server" Section="tblR_Paypal" ResourceKey="secR_Paypal"
                IncludeRule="True" IsExpanded="True" CssClass="SubHead"></dnn:SectionHead>
            <table id="tblR_Paypal" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plR_Paypal_Enable" runat="server" ControlName="chkR_Paypal_Enable">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkR_Paypal_Enable" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" >
                      <asp:Label ID="Label3" runat="server" resourcekey="Tip_PayPalId"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                      
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plR_Paypal_Id" runat="server" ControlName="txtR_Paypal_Id"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtR_Paypal_Id" runat="server" Columns="40"></asp:TextBox>
                        <asp:Image ID="Image8" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="Tip_InvalidEmail"
                            runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtR_Paypal_Id" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:SectionHead ID="secR_Authorize" runat="server" Section="tblR_Authorize" ResourceKey="secR_Authorize"
                IncludeRule="True" IsExpanded="True" CssClass="SubHead"></dnn:SectionHead>
            <table id="tblR_Authorize" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plR_Authorize_Enable" runat="server" ControlName="chkR_Authorize_Enable">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkR_Authorize_Enable" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" >
                      <asp:Label ID="Label4" runat="server" resourcekey="Tip_Authorize"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                      
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plR_Authorize_Id" runat="server" ControlName="txtR_Authorize_Id">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtR_Authorize_Id" runat="server" Columns="40"></asp:TextBox>
                        <asp:Image ID="Image9" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plR_Authorize_Key" runat="server" ControlName="txtR_Authorize_Key">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtR_Authorize_Key" runat="server" Columns="40"></asp:TextBox>
                        <asp:Image ID="Image10" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
     <tr>
        <td>
            <dnn:SectionHead ID="secR_Stripe" runat="server" Section="tblR_Stripe" ResourceKey="secR_Stripe"
                IncludeRule="True" IsExpanded="True" CssClass="SubHead"></dnn:SectionHead>
            <table id="tblR_Stripe" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                 <tr>
                    <td colspan="2" >
                      <asp:Label ID="Label9" runat="server" resourcekey="Tip_Stripe"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                      
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plR_Stripe_Enable" runat="server" ControlName="chkR_Stripe_Enable">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkR_Stripe_Enable" runat="server"></asp:CheckBox>
                    </td>
                </tr>
               
                <tr>
                    <td>
                        <dnn:Label ID="plR_Stripe_LiveSecrectKey" runat="server" ControlName="txtR_Stripe_LiveSecrectKey">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtR_Stripe_LiveSecrectKey" runat="server" Columns="40"></asp:TextBox>
                        <asp:Image ID="Image15" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr>
        <td>
            <dnn:SectionHead ID="secR_Alipay" runat="server" Section="tblR_Alipay" ResourceKey="secR_Alipay"
                IncludeRule="True" IsExpanded="True" CssClass="SubHead"></dnn:SectionHead>
            <table id="tblR_Alipay" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                 <tr>
                    <td colspan="2" >
                      <asp:Label ID="Label11" runat="server" resourcekey="Tip_Alipay"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                      
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plR_Alipay_Enable" runat="server" ControlName="chkR_Alipay_Enable">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkR_Alipay_Enable" runat="server"></asp:CheckBox>
                    </td>
                </tr>
               
                <tr>
                    <td>
                        <dnn:Label ID="plR_Alipay_Id" runat="server" ControlName="txtR_Alipay_Id">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtR_Alipay_Id" runat="server"></asp:TextBox>
                      
                    </td>
                </tr>
                  <tr>
                    <td>
                        <dnn:Label ID="plR_Alipay_Partner" runat="server" ControlName="txtR_Alipay_Partner">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtR_Alipay_Partner" runat="server"></asp:TextBox>
                      
                    </td>
                </tr>
                  <tr>
                    <td>
                        <dnn:Label ID="plR_Alipay_Key" runat="server" ControlName="txtR_Alipay_Key">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtR_Alipay_Key" runat="server"></asp:TextBox>
                      
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr>
        <td>
            <dnn:SectionHead ID="secR_DineroMail" runat="server" Section="tblR_DineroMail" ResourceKey="secR_DineroMail"
                IncludeRule="True" IsExpanded="True" CssClass="SubHead"></dnn:SectionHead>
            <table id="tblR_DineroMail" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plR_DineroMail_Enable" runat="server" ControlName="chkR_DineroMail_Enable">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkR_DineroMail_Enable" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plR_DineroMail_Id" runat="server" ControlName="txtR_DineroMail_Id">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtR_DineroMail_Id" runat="server" Columns="40"></asp:TextBox>
                        <asp:Image ID="Image11" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:SectionHead ID="secR_GoogleCheckout" runat="server" Section="tblR_GoogleCheckout"
                ResourceKey="secR_GoogleCheckout" IncludeRule="True" IsExpanded="True" CssClass="SubHead">
            </dnn:SectionHead>
            <table id="tblR_GoogleCheckout" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plR_GoogleCheckout_Enable" runat="server" ControlName="chkR_GoogleCheckout_Enable">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkR_GoogleCheckout_Enable" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" >
                      <asp:Label ID="Label5" runat="server" resourcekey="Tip_GoogleCheckout_Id"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                        <br />
                        <asp:Image ID="Image19" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/payment/GcMerchantID.gif"  CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plR_GoogleCheckout_Id" runat="server" ControlName="txtR_GoogleCheckout_Id">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtR_GoogleCheckout_Id" runat="server" Columns="40"></asp:TextBox>
                        <asp:Image ID="Image12" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plR_GoogleCheckout_Key" runat="server" ControlName="txtR_GoogleCheckout_Key">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtR_GoogleCheckout_Key" runat="server" Columns="40"></asp:TextBox>
                        <asp:Image ID="Image13" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:SectionHead ID="secR_Manual" runat="server" Section="tblR_Manual" ResourceKey="secR_Manual"
                IncludeRule="True" IsExpanded="True" CssClass="SubHead"></dnn:SectionHead>
            <table id="tblR_Manual" cellspacing="0" cellpadding="2" bauthorize="0" width="100%"
                runat="server">
                <tr>
                    <td colspan="2" >
                     <asp:Label ID="Label6" runat="server" resourcekey="Tip_ManualPayment"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                       
                    </td>
                </tr>
                <tr align="left">
                    <td style="width: 150px">
                        <dnn:Label ID="plEnableR_Manual" runat="server" ControlName="chkEnableR_Manual">
                        </dnn:Label>
                    </td>
                    <td align="left">
                        <asp:CheckBox ID="chkEnableR_Manual" runat="server"></asp:CheckBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table id="tblPayment" cellspacing="0" cellpadding="2" width="100%" border="0" align="left" class="dnnFormItem"
    visible="false" runat="server">
    <tr>
        <td colspan="2" >
          <asp:Label ID="Label7" runat="server" resourcekey="Tip_Payment"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
           
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plP_Type" runat="server" ControlName="ddlP_Type" />
        </td>
        <td>
            <asp:DropDownList ID="ddlP_Type" runat="server">
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
                        <dnn:Label ID="plP_Paypal" runat="server" ControlName="txtP_Paypal"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_Paypal"  runat="server" />
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
                        <dnn:Label ID="plP_Alipay" runat="server" ControlName="txtP_Alipay"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_Alipay"  runat="server" />
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
                        <dnn:Label ID="plP_DD_BankName" runat="server" ControlName="txtP_DD_BankName"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_DD_BankName" Columns="70" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plP_DD_RoutingNumber" runat="server" ControlName="txtP_DD_RoutingNumber">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_DD_RoutingNumber" Columns="70" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plP_DD_AccountNumber" runat="server" ControlName="txtP_DD_AccountNumber">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_DD_AccountNumber" Columns="40" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plP_DD_AccountType" runat="server" ControlName="ddlP_DD_AccountType">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlP_DD_AccountType" runat="server">
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
                        <dnn:Label ID="plP_C_Payee" runat="server" ControlName="txtP_C_Payee"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_C_Payee" Columns="70" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plP_C_Address1" runat="server" ControlName="txtP_C_Address1"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_C_Address1" Columns="70" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plP_C_Address2" runat="server" ControlName="txtP_C_Address2"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_C_Address2" Columns="70" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plP_C_City" runat="server" ControlName="txtP_C_City"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_C_City" Columns="40" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plP_C_RegionCode" runat="server" ControlName="txtP_C_RegionCode">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_C_RegionCode" Columns="40" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plP_C_CountryCode" runat="server" ControlName="txtP_C_CountryCode">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtP_C_CountryCode" Columns="40" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table id="tblCustomerMessage" cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem"
    align="left" visible="false" runat="server">
    <tr>
        <td colspan="2" >
            <asp:Label ID="lblCustomerMessageTip" runat="server" resourcekey="lblCustomerMessageTip" CssClass="dnnFormMessage dnnFormInfo"/>
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plCustomerMessage" runat="server" ControlName="txtCustomerMessage">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtCustomerMessage" Columns="100" runat="server" TextMode="MultiLine"
                Height="300px" />
        </td>
    </tr>
</table>
<table id="tblOrderNotification" cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem"
    align="left" visible="false" runat="server">
    <tr>
        <td colspan="2" >
            <asp:Label ID="lblOrderNotificationTip" runat="server" resourcekey="lblOrderNotificationTip" CssClass="dnnFormMessage dnnFormInfo"/>
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plIntegrateUrl" runat="server" ControlName="txtIntegrateUrl"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtIntegrateUrl" Columns="100" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plSecurityValue" runat="server" ControlName="txtSecurityValue"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtSecurityValue" Columns="100" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plAdditionalParm" runat="server" ControlName="txtAdditionalParm">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtAdditionalParm" Columns="100" runat="server" />
        </td>
    </tr>
</table>
