<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.AdminProduct_Settings, App_Web_adminproduct_settings.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="CountryListBox" %>
<div class="dnnFormItem dnnFormHelp dnnClear">
    <p align="right">
        <span>
            <asp:Image ID="Image17" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" />
            <%=LocalizeString("RequiredFields")%>
        </span>
    </p>
</div>
<dnn:sectionhead ID="secFeature" runat="server" Section="tblFeature" ResourceKey="secFeature"
    IncludeRule="True" IsExpanded="true" CssClass="SubHead"></dnn:sectionhead>
<table id="tblFeature" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server"
    class="dnnFormItem">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="lblFeature" runat="server" resourcekey="Tip_Feature" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plEnableFixedPrice" runat="server" ControlName="chkEnableFixedPrice">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkEnableFixedPrice" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plEnableAuction" runat="server" ControlName="chkEnableAuction"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkEnableAuction" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plEnableAd" runat="server" ControlName="chkEnableAd"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkEnableAd" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label7" runat="server" resourcekey="Tip_EnableRelated" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plEnableDocument" runat="server" ControlName="chkEnableDocument" />
        </td>
        <td>
            <asp:CheckBox ID="chkEnableDocument" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plEnableVideo" runat="server" ControlName="chkEnableVideo" />
        </td>
        <td>
            <asp:CheckBox ID="chkEnableVideo" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plEnableAudio" runat="server" ControlName="chkEnableAudio" />
        </td>
        <td>
            <asp:CheckBox ID="chkEnableAudio" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plEnableImage" runat="server" ControlName="chkEnableImage" />
        </td>
        <td>
            <asp:CheckBox ID="chkEnableImage" runat="server" />
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secOrder" runat="server" Section="tblOrder" ResourceKey="secOrder"
    IncludeRule="True" IsExpanded="true" CssClass="SubHead"></dnn:sectionhead>
<table id="tblOrder" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server"
    class="dnnFormItem">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label1" runat="server" resourcekey="Tip_Order" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plStoreName" runat="server" ControlName="txtStoreName"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtStoreName" runat="server" Columns="70"></asp:TextBox>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtStoreName" resourcekey="Required"
                ID="RequiredFieldValidator1" />
        </td>
    </tr>
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label2" runat="server" resourcekey="Tip_StoreEmail" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plStoreEmail" runat="server" ControlName="txtStoreEmail"></dnn:label>
        </td>
        <td valign="top">
            <asp:TextBox ID="txtStoreEmail" runat="server" Columns="40"></asp:TextBox>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtStoreEmail" resourcekey="Required"
                ID="RequiredFieldValidator2" />
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="Tip_InvalidEmail"
                runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="txtStoreEmail" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plCurrencySymbol" runat="server" ControlName="txtCurrencySymbol">
            </dnn:label>
        </td>
        <td valign="top">
            <asp:TextBox ID="txtCurrencySymbol" runat="server" Columns="10"></asp:TextBox>
            <asp:Image ID="Image3" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCurrencySymbol"
                resourcekey="Required" ID="validatorSymbol" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plWeightSymbol" runat="server" ControlName="txtWeightSymbol"></dnn:label>
        </td>
        <td valign="top">
            <asp:TextBox ID="txtWeightSymbol" runat="server" Columns="10"></asp:TextBox>
            <asp:Image ID="Image15" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtWeightSymbol" resourcekey="Required"
                ID="RequiredFieldValidator3" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShippingTaxable" runat="server" ControlName="chkShippingTaxable">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShippingTaxable" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label3" runat="server" resourcekey="Tip_EnableDeleteOrder" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plEnableDeleteOrder" runat="server" ControlName="chkEnableDeleteOrder">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkEnableDeleteOrder" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label4" runat="server" resourcekey="Tip_EnableModifyPrice" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plEnableModifyPrice" runat="server" ControlName="chkEnableModifyPrice">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkEnableModifyPrice" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label5" runat="server" resourcekey="Tip_SendMoneyToVendorAccount"
                CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plSendMoneyToVendorAccount" runat="server" ControlName="chkSendMoneyToVendorAccount">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkSendMoneyToVendorAccount" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label19" runat="server" resourcekey="Tip_AllowVendorDefineShippingMethod"
                CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plAllowVendorDefineShippingMethod" runat="server" ControlName="chkAllowVendorDefineShippingMethod">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkAllowVendorDefineShippingMethod" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secAuction" runat="server" Section="tblAuction" ResourceKey="secAuction"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblAuction" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server"
    class="dnnFormItem">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label16" runat="server" resourcekey="Tip_Auction" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 300px">
            <dnn:label ID="plDomainName" runat="server" ControlName="txtDomainName"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtDomainName" runat="server" Columns="90" Width="400px"></asp:TextBox>
            <asp:Image ID="Image20" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDomainName" resourcekey="Required"
                ForeColor="Red" ID="RequiredFieldValidator5" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plAutomatic_Republish_Expired" runat="server" ControlName="chkAutomatic_Republish_Expired">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkAutomatic_Republish_Expired" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <br />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBidder_Bid_Notify" runat="server" ControlName="chkBidder_Bid_Notify">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBidder_Bid_Notify" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBidder_Bid_Title" runat="server" ControlName="txtBidder_Bid_Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtBidder_Bid_Title" runat="server" Columns="90" Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBidder_Bid_Content" runat="server" ControlName="txtBidder_Bid_Content">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtBidder_Bid_Content" runat="server" Columns="90" Rows="4" TextMode="MultiLine"
                Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBidder_Proxy_Notify" runat="server" ControlName="chkBidder_Proxy_Notify">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBidder_Proxy_Notify" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBidder_Proxy_Title" runat="server" ControlName="txtBidder_Proxy_Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtBidder_Proxy_Title" runat="server" Columns="90" Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBidder_Proxy_Content" runat="server" ControlName="txtBidder_Proxy_Content">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtBidder_Proxy_Content" runat="server" Columns="90" Rows="4" TextMode="MultiLine"
                Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBidder_Outbid_Notify" runat="server" ControlName="chkBidder_Outbid_Notify">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBidder_Outbid_Notify" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBidder_Outbid_Title" runat="server" ControlName="txtBidder_Outbid_Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtBidder_Outbid_Title" runat="server" Columns="90" Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBidder_Outbid_Content" runat="server" ControlName="txtBidder_Outbid_Content">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtBidder_Outbid_Content" runat="server" Columns="90" Rows="4" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBidder_Won_Notify" runat="server" ControlName="chkBidder_Won_Notify">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBidder_Won_Notify" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBidder_Won_Title" runat="server" ControlName="txtBidder_Won_Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtBidder_Won_Title" runat="server" Columns="90" Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBidder_Won_Content" runat="server" ControlName="txtBidder_Won_Content">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtBidder_Won_Content" runat="server" Columns="90" Rows="4" TextMode="MultiLine"
                Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBidder_NotWon_Notify" runat="server" ControlName="chkBidder_NotWon_Notify">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBidder_NotWon_Notify" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBidder_NotWon_Title" runat="server" ControlName="txtBidder_NotWon_Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtBidder_NotWon_Title" runat="server" Columns="90" Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBidder_NotWon_Content" runat="server" ControlName="txtBidder_NotWon_Content">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtBidder_NotWon_Content" runat="server" Columns="90" Rows="4" TextMode="MultiLine"
                Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plSeller_Bid_Notify" runat="server" ControlName="chkSeller_Bid_Notify">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkSeller_Bid_Notify" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plSeller_Bid_Title" runat="server" ControlName="txtSeller_Bid_Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtSeller_Bid_Title" runat="server" Columns="90" Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plSeller_Bid_Content" runat="server" ControlName="txtSeller_Bid_Content">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtSeller_Bid_Content" runat="server" Columns="90" Rows="4" TextMode="MultiLine"
                Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plSeller_NoBid_Notify" runat="server" ControlName="chkSeller_NoBid_Notify">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkSeller_NoBid_Notify" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plSeller_NoBid_Title" runat="server" ControlName="txtSeller_NoBid_Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtSeller_NoBid_Title" runat="server" Columns="90" Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plSeller_NoBid_Content" runat="server" ControlName="txtSeller_NoBid_Content">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtSeller_NoBid_Content" runat="server" Columns="90" Rows="4" TextMode="MultiLine"
                Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plSeller_NotMet_Notify" runat="server" ControlName="chkSeller_NotMet_Notify">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkSeller_NotMet_Notify" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plSeller_NotMet_Title" runat="server" ControlName="txtSeller_NotMet_Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtSeller_NotMet_Title" runat="server" Columns="90" Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plSeller_NotMet_Content" runat="server" ControlName="txtSeller_NotMet_Content">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtSeller_NotMet_Content" runat="server" Columns="90" Rows="4" TextMode="MultiLine"
                Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plSeller_AuctionOff_Notify" runat="server" ControlName="chkSeller_AuctionOff_Notify">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkSeller_AuctionOff_Notify" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plSeller_AuctionOff_Title" runat="server" ControlName="txtSeller_AuctionOff_Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtSeller_AuctionOff_Title" runat="server" Columns="90" Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plSeller_AuctionOff_Content" runat="server" ControlName="txtSeller_AuctionOff_Content">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtSeller_AuctionOff_Content" runat="server" Columns="90" Rows="4"
                TextMode="MultiLine" Width="400px"></asp:TextBox>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secGeneral" runat="server" Section="tblGeneral" ResourceKey="secGeneral"
    IncludeRule="True" IsExpanded="False" CssClass="SubHead"></dnn:sectionhead>
<table id="tblGeneral" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server"
    class="dnnFormItem">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label6" runat="server" resourcekey="Tip_ManageRoles" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plDataManageRoles" runat="server" ControlName="chkDataManageRoles">
            </dnn:label>
        </td>
        <td valign="top">
            <asp:CheckBoxList ID="chkDataManageRoles" runat="server" CellSpacing="2" CellPadding="2"
                RepeatColumns="4">
            </asp:CheckBoxList>
            <br />
        </td>
    </tr>
    
    <tr>
        <td>
            <dnn:label ID="plCategorySelectCount" runat="server" ControlName="txtCategorySelectCount">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtCategorySelectCount" runat="server" Columns="10"></asp:TextBox>1-10
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator5" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtCategorySelectCount"></asp:RegularExpressionValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtCategorySelectCount"
                resourcekey="MustBetween1To10" MinimumValue="1" MaximumValue="10" Type="Integer"></asp:RangeValidator>
        </td>
    </tr>
   
   
    <tr>
        <td>
            <dnn:label ID="plTagSelectCount" runat="server" ControlName="txtTagSelectCount">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtTagSelectCount" runat="server" Columns="10"></asp:TextBox>1-10
            <asp:RangeValidator ID="rang1" runat="server" ControlToValidate="txtTagSelectCount"
                resourcekey="MustBetween1To10" MinimumValue="1" MaximumValue="10" Type="Integer"></asp:RangeValidator>
        </td>
    </tr>
  
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label20" runat="server" resourcekey="Tip_RequireApproval" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plRequireApproval" runat="server" ControlName="chkRequireApproval">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkRequireApproval" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plViewRoles" runat="server" ControlName="chkViewRoles"></dnn:label>
        </td>
        <td valign="top">
            <asp:CheckBoxList ID="chkViewRoles" runat="server" CellSpacing="2" CellPadding="2"
                RepeatColumns="4">
            </asp:CheckBoxList>
        </td>
    </tr>
    
</table>
<dnn:sectionhead ID="secPaypal" runat="server" Section="tblPaypal" ResourceKey="secPaypal"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblPaypal" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server"
    class="dnnFormItem">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="lblPayPalTip" runat="server" resourcekey="Help_Payment_Paypal" CssClass="dnnFormMessage dnnFormInfo" />
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plEnablePaypal" runat="server" ControlName="chkEnablePaypal"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkEnablePaypal" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUsePayPalSandbox" runat="server" ControlName="chkUsePayPalSandbox">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkUsePayPalSandbox" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label8" runat="server" resourcekey="Tip_PayPalId" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plPayPalId" runat="server" ControlName="txtPayPalId"></dnn:label>
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
    <tr>
        <td>
            <dnn:label ID="plPayPalSecureId" runat="server" ControlName="txtPayPalSecureId">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtPayPalSecureId" runat="server" Columns="40"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plPayPalVerificationUrl" runat="server" ControlName="txtPayPalVerificationUrl">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtPayPalVerificationUrl" runat="server" Columns="70"></asp:TextBox>
            <asp:Image ID="Image5" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plPayPalPaymentUrl" runat="server" ControlName="txtPayPalPaymentUrl">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtPayPalPaymentUrl" runat="server" Columns="70"></asp:TextBox>
            <asp:Image ID="Image6" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plPayPalLanguage" runat="server" ControlName="txtPayPalLanguage">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlPayPalLanguage" runat="server">
                 <asp:ListItem resourcekey="li_PayPalLanguage_AU" Value="AU"></asp:ListItem>
                  <asp:ListItem resourcekey="li_PayPalLanguage_AT" Value="AT"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_BE" Value="BE"></asp:ListItem>

                   <asp:ListItem resourcekey="li_PayPalLanguage_BR" Value="BR"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_CA" Value="CA"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_CH" Value="CH"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_CN" Value="CN"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_DE" Value="DE"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_ES" Value="ES"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_GB" Value="GB"></asp:ListItem>
                    <asp:ListItem resourcekey="li_PayPalLanguage_FR" Value="FR"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_IT" Value="IT"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_NL" Value="NL"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_PL" Value="PL"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_PT" Value="PT"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_RU" Value="RU"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_US" Value="US"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_da_DK" Value="da_DK"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_he_IL" Value="he_IL"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_id_ID" Value="id_ID"></asp:ListItem>
                   <asp:ListItem resourcekey="li_PayPalLanguage_ja_JP" Value="ja_JP"></asp:ListItem>
                
               <asp:ListItem resourcekey="li_PayPalLanguage_no_NO" Value="no_NO"></asp:ListItem>
               <asp:ListItem resourcekey="li_PayPalLanguage_pt_BR" Value="pt_BR"></asp:ListItem>
               <asp:ListItem resourcekey="li_PayPalLanguage_ru_RU" Value="ru_RU"></asp:ListItem>
               <asp:ListItem resourcekey="li_PayPalLanguage_sv_SE" Value="sv_SE"></asp:ListItem>
               <asp:ListItem resourcekey="li_PayPalLanguage_th_TH" Value="th_TH"></asp:ListItem>
               <asp:ListItem resourcekey="li_PayPalLanguage_tr_TR" Value="tr_TR"></asp:ListItem>
               <asp:ListItem resourcekey="li_PayPalLanguage_zh_CN" Value="zh_CN"></asp:ListItem>
               <asp:ListItem resourcekey="li_PayPalLanguage_zh_HK" Value="zh_HK"></asp:ListItem>
               <asp:ListItem resourcekey="li_PayPalLanguage_zh_TW" Value="zh_TW"></asp:ListItem>
            
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plPayPalCharset" runat="server" ControlName="txtPayPalCharset"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtPayPalCharset" runat="server" Columns="40"></asp:TextBox>
            <asp:Image ID="Image8" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plPayPalButtonUrl" runat="server" ControlName="txtPayPalButtonUrl">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtPayPalButtonUrl" runat="server" Columns="70"></asp:TextBox>
            <asp:Image ID="Image9" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plPayPalCurrency" runat="server" ControlName="ddlPayPalCurrency">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlPayPalCurrency" runat="server">
                <asp:ListItem resourcekey="li_Currency_USD" Value="USD"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_AUD" Value="AUD"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_BRL" Value="BRL"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_CAD" Value="CAD"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_CZK" Value="CZK"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_DKK" Value="DKK"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_EUR" Value="EUR"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_HKD" Value="HKD"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_HUF" Value="HUF"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_ILS" Value="ILS"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_JPY" Value="JPY"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_MYR" Value="MYR"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_MXN" Value="MXN"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_NOK" Value="NOK"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_NZD" Value="NZD"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_PHP" Value="PHP"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_PLN" Value="PLN"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_GBP" Value="GBP"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_RUB" Value="RUB"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_SGD" Value="SGD"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_SEK" Value="SEK"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_CHF" Value="CHF"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_TWD" Value="TWD"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_THB" Value="THB"></asp:ListItem>
                <asp:ListItem resourcekey="li_Currency_TRY" Value="TRY"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
  
</table>
<dnn:sectionhead ID="secAuthorize" runat="server" Section="tblAuthorize" ResourceKey="secAuthorize"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblAuthorize" cellspacing="0" cellpadding="2" width="100%" border="0"
    class="dnnFormItem" runat="server">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="lblAuthorizeTest" runat="server" resourcekey="Help_AuthorizeTest"
                CssClass="dnnFormMessage dnnFormInfo" />
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plEnableAuthorize" runat="server" ControlName="chkEnableAuthorize">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkEnableAuthorize" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plAuthorizeTestMode" runat="server" ControlName="chkAuthorizeTestMode">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkAuthorizeTestMode" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plAuthorizeTransactionPostUrl" runat="server" ControlName="txtAuthorizeTransactionPostUrl">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtAuthorizeTransactionPostUrl" runat="server" Columns="70"></asp:TextBox>
            <asp:Image ID="Image11" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plAuthorizeVersion" runat="server" ControlName="txtAuthorizeVersion">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtAuthorizeVersion" runat="server" Columns="40"></asp:TextBox>
            <asp:Image ID="Image12" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
        </td>
    </tr>
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label9" runat="server" resourcekey="Tip_Authorize" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plAuthorizeApiLoginId" runat="server" ControlName="txtAuthorizeApiLoginId">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtAuthorizeApiLoginId" runat="server" Columns="40"></asp:TextBox>
            <asp:Image ID="Image13" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plAuthorizeTransactionKey" runat="server" ControlName="txtAuthorizeTransactionKey">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtAuthorizeTransactionKey" runat="server" Columns="40"></asp:TextBox>
            <asp:Image ID="Image14" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plAuthorizeCaptureType" runat="server" ControlName="ddlAuthorizeCaptureType">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlAuthorizeCaptureType" runat="server">
                <asp:ListItem resourcekey="li_AuthorizeCaptureType_AUTH_CAPTURE" Value="AUTH_CAPTURE"></asp:ListItem>
                <asp:ListItem resourcekey="li_AuthorizeCaptureType_AUTH_ONLY" Value="AUTH_ONLY"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secStripe" runat="server" Section="tblStripe" ResourceKey="secStripe"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblStripe" cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem"
    runat="server">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="lblStripeTip" runat="server" resourcekey="Tip_Stripe" CssClass="dnnFormMessage dnnFormInfo" />
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plEnableStripe" runat="server" ControlName="chkEnableStripe"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkEnableStripe" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plStripeTestMode" runat="server" ControlName="chkStripeTestMode">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkStripeTestMode" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plStripe_TestSecrectKey" runat="server" ControlName="txtStripe_TestSecrectKey">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtStripe_TestSecrectKey" runat="server"></asp:TextBox>
            <asp:Image ID="Image10" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plStripe_LiveSecrectKey" runat="server" ControlName="txtStripe_LiveSecrectKey">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtStripe_LiveSecrectKey" runat="server"></asp:TextBox>
            <asp:Image ID="Image21" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
        </td>
    </tr>
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label17" runat="server" resourcekey="Tip_Stripe_Currency" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plStripe_Currency" runat="server" ControlName="txtStripe_Currency">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtStripe_Currency" runat="server"></asp:TextBox>
            <asp:Image ID="Image22" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
        </td>
    </tr>
</table>

<dnn:sectionhead ID="secAlipay" runat="server" Section="tblAlipay" ResourceKey="secAlipay"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblAlipay" cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem"
    runat="server">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="lblAlipayTip" runat="server" resourcekey="Tip_Alipay" CssClass="dnnFormMessage dnnFormInfo" />
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plEnableAlipay" runat="server" ControlName="chkEnableAlipay"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkEnableAlipay" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plAlipaySeller_email" runat="server" ControlName="txtAlipaySeller_email">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtAlipaySeller_email" runat="server"></asp:TextBox>
           
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plAlipayPartner" runat="server" ControlName="txtAlipayPartner">
            </dnn:label>
        </td>
        <td>
              <asp:TextBox ID="txtAlipayPartner" runat="server"></asp:TextBox>
        </td>
    </tr>
    
    <tr>
        <td>
            <dnn:label ID="plAlipayKey" runat="server" ControlName="txtAlipayKey">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtAlipayKey" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>

<dnn:sectionhead ID="secDineroMail" runat="server" Section="tblDineroMail" ResourceKey="secDineroMail"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblDineroMail" cellspacing="0" cellpadding="2" width="100%" bauthorize="0"
    class="dnnFormItem" runat="server">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="lblDineroMail" runat="server" resourcekey="Help_Payment_DineroMail"
                CssClass="dnnFormMessage dnnFormInfo" />
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plEnableDineroMail" runat="server" ControlName="chkEnableDineroMail">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkEnableDineroMail" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plDineroMailMerchant" runat="server" ControlName="txtDineroMailMerchant">
            </dnn:label>
        </td>
        <td valign="top">
            <asp:TextBox ID="txtDineroMailMerchant" runat="server" Columns="50"></asp:TextBox>
            <asp:Image ID="Image16" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plDineroMailCountry_Id" runat="server" ControlName="ddlDineroMailCountry_Id">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlDineroMailCountry_Id" runat="server">
                <asp:ListItem resourcekey="li_DineroMailCountry_Argentina" Value="1"></asp:ListItem>
                <asp:ListItem resourcekey="li_DineroMailCountry_Brazil" Value="2"></asp:ListItem>
                <asp:ListItem resourcekey="li_DineroMailCountry_Chile" Value="3"></asp:ListItem>
                <asp:ListItem resourcekey="li_DineroMailCountry_Mexico" Value="4"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plDineroMailLanguage" runat="server" ControlName="ddlDineroMailLanguage">
            </dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlDineroMailLanguage" runat="server">
                <asp:ListItem resourcekey="li_DineroMailLanguage_es" Value="es"></asp:ListItem>
                <asp:ListItem resourcekey="li_DineroMailLanguage_pt" Value="pt"></asp:ListItem>
                <asp:ListItem resourcekey="li_DineroMailLanguage_en" Value="en"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plDineroMail_AuthorizePaid" runat="server" ControlName="rblDineroMail_AuthorizePaid">
            </dnn:label>
        </td>
        <td>
            <asp:RadioButtonList ID="rblDineroMail_AuthorizePaid" runat="server">
                <asp:ListItem resourcekey="li_DineroMail_AuthorizePaid_Manual" Value="Manual"></asp:ListItem>
                <asp:ListItem resourcekey="li_DineroMail_AuthorizePaid_Auto" Value="Auto"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secGoogleCheckout" runat="server" Section="tblGoogleCheckout"
    ResourceKey="secGoogleCheckout" IncludeRule="True" IsExpanded="false" CssClass="SubHead">
</dnn:sectionhead>
<table id="tblGoogleCheckout" cellspacing="0" cellpadding="2" width="100%" border="0"
    class="dnnFormItem" runat="server">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label10" runat="server" resourcekey="Help_Payment_GoogleCheckout"
                CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plEnableGoogleCheckout" runat="server" ControlName="chkEnableGoogleCheckout">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkEnableGoogleCheckout" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label11" runat="server" resourcekey="Help_Payment_GoogleCheckout_Sandbox"
                CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUseGoogleCheckoutSandbox" runat="server" ControlName="chkUseGoogleCheckoutSandbox">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkUseGoogleCheckoutSandbox" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label12" runat="server" resourcekey="Tip_GoogleCheckout_Id" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
            <br />
            <asp:Image ID="Image19" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/payment/GcMerchantID.gif"
                CssClass="dnnFormMessage dnnFormInfo" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plGoogleCheckoutMerchantId" runat="server" ControlName="txtGoogleCheckoutMerchantId">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtGoogleCheckoutMerchantId" runat="server" Columns="40"></asp:TextBox>
            <asp:Image ID="Image7" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plGoogleCheckoutMerchantKey" runat="server" ControlName="txtGoogleCheckoutMerchantKey">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtGoogleCheckoutMerchantKey" runat="server" Columns="70"></asp:TextBox>
            <asp:Image ID="Image24" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plGoogleCheckout_AuthorizePaid" runat="server" ControlName="rblGoogleCheckout_AuthorizePaid">
            </dnn:label>
        </td>
        <td>
            <asp:RadioButtonList ID="rblGoogleCheckout_AuthorizePaid" runat="server">
                <asp:ListItem resourcekey="li_DineroMail_AuthorizePaid_Manual" Value="Manual"></asp:ListItem>
                <asp:ListItem resourcekey="li_DineroMail_AuthorizePaid_Auto" Value="Auto"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secManual" runat="server" Section="tblManual" ResourceKey="secManual"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblManual" cellspacing="0" cellpadding="2" bauthorize="0" width="100%"
    class="dnnFormItem" runat="server">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="lblManualPayment" runat="server" resourcekey="Tip_ManualPayment" CssClass="dnnFormMessage dnnFormInfo" />
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plEnableManual" runat="server" ControlName="chkEnableManual"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkEnableManual" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secSoftware" runat="server" Section="tblSoftware" ResourceKey="secSoftware"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblSoftware" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server"
    class="dnnFormItem">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="lblExtensionTip" runat="server" resourcekey="Tip_Extension" CssClass="dnnFormMessage dnnFormInfo" />
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plFileExtension" runat="server" ControlName="txtFileExtension"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtFileExtension" Rows="80" runat="server" Width="600px" />
            <asp:Image ID="Image18" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFileExtension" resourcekey="Required"
                ID="RequiredFieldValidator4" />
        </td>
    </tr>
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="lblSoftwareTip" runat="server" resourcekey="Tip_Software" CssClass="dnnFormMessage dnnFormInfo" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowSoftwareUrl" runat="server" ControlName="chkShowSoftwareUrl">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowSoftwareUrl" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secComment" runat="server" Section="tblComment" ResourceKey="secComment"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblComment" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server"
    class="dnnFormItem">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label13" runat="server" resourcekey="Tip_Comment" CssClass="dnnFormMessage dnnFormInfo" />
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plAllowComment" runat="server" ControlName="chkAllowComment"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkAllowComment" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plCommentRoles" runat="server" ControlName="chkCommentRoles"></dnn:label>
        </td>
        <td valign="top">
            <asp:CheckBoxList ID="chkCommentRoles" runat="server" CellSpacing="2" CellPadding="2"
                RepeatColumns="4" ResourceKey="chkCommentRoles">
            </asp:CheckBoxList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plAutoAuthComment" runat="server" ControlName="chkAutoAuthComment">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkAutoAuthComment" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secRating" runat="server" Section="tblRating" ResourceKey="secRating"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblRating" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server"
    class="dnnFormItem">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label14" runat="server" resourcekey="Tip_Rating" CssClass="dnnFormMessage dnnFormInfo" />
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plAllowRating" runat="server" ControlName="chkAllowRating"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkAllowRating" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plRatingRoles" runat="server" ControlName="chkRatingRoles"></dnn:label>
        </td>
        <td valign="top">
            <asp:CheckBoxList ID="chkRatingRoles" runat="server" CellSpacing="2" CellPadding="2"
                RepeatColumns="4">
            </asp:CheckBoxList>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secDownload" runat="server" Section="tblDownload" ResourceKey="secDownload"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblDownload" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server"
    class="dnnFormItem">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label15" runat="server" resourcekey="Tip_Download" CssClass="dnnFormMessage dnnFormInfo" />
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plDownloadRoles" runat="server" ControlName="chkDownloadRoles"></dnn:label>
        </td>
        <td valign="top">
            <asp:CheckBoxList ID="chkDownloadRoles" runat="server" CellSpacing="2" CellPadding="2"
                RepeatColumns="4">
            </asp:CheckBoxList>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secRss" runat="server" Section="tblRss" ResourceKey="secRss"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblRss" cellspacing="0" cellpadding="2" bauthorize="0" width="100%" runat="server"
    class="dnnFormItem">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plRssItemCounts" runat="server" ControlName="txtRssItemCounts"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRssItemCounts" runat="server" Columns="10"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRssItemCounts"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plRssTitle" runat="server" ControlName="txtRssTitle"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRssTitle" runat="server" Columns="40" />
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secVendorProfile" runat="server" Section="tblVendorProfile"
    ResourceKey="secVendorProfile" IncludeRule="True" IsExpanded="false" CssClass="SubHead">
</dnn:sectionhead>
<table id="tblVendorProfile" cellspacing="0" cellpadding="2" bauthorize="0" width="100%"
    runat="server" class="dnnFormItem">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label18" runat="server" resourcekey="Tip_VendorProfile" CssClass="dnnFormMessage dnnFormInfo" />
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plVendorProfile_Field1Enable" runat="server" ControlName="chkVendorProfile_Field1Enable">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkVendorProfile_Field1Enable" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field1Title" runat="server" ControlName="txtVendorProfile_Field1Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtVendorProfile_Field1Title" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field2Enable" runat="server" ControlName="chkVendorProfile_Field2Enable">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkVendorProfile_Field2Enable" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field2Title" runat="server" ControlName="txtVendorProfile_Field2Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtVendorProfile_Field2Title" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field3Enable" runat="server" ControlName="chkVendorProfile_Field3Enable">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkVendorProfile_Field3Enable" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field3Title" runat="server" ControlName="txtVendorProfile_Field3Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtVendorProfile_Field3Title" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field4Enable" runat="server" ControlName="chkVendorProfile_Field4Enable">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkVendorProfile_Field4Enable" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field4Title" runat="server" ControlName="txtVendorProfile_Field4Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtVendorProfile_Field4Title" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field5Enable" runat="server" ControlName="chkVendorProfile_Field5Enable">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkVendorProfile_Field5Enable" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field5Title" runat="server" ControlName="txtVendorProfile_Field5Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtVendorProfile_Field5Title" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field6Enable" runat="server" ControlName="chkVendorProfile_Field6Enable">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkVendorProfile_Field6Enable" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field6Title" runat="server" ControlName="txtVendorProfile_Field6Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtVendorProfile_Field6Title" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field7Enable" runat="server" ControlName="chkVendorProfile_Field7Enable">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkVendorProfile_Field7Enable" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field7Title" runat="server" ControlName="txtVendorProfile_Field7Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtVendorProfile_Field7Title" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field8Enable" runat="server" ControlName="chkVendorProfile_Field8Enable">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkVendorProfile_Field8Enable" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field8Title" runat="server" ControlName="txtVendorProfile_Field8Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtVendorProfile_Field8Title" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field9Enable" runat="server" ControlName="chkVendorProfile_Field9Enable">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkVendorProfile_Field9Enable" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field9Title" runat="server" ControlName="txtVendorProfile_Field9Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtVendorProfile_Field9Title" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field10Enable" runat="server" ControlName="chkVendorProfile_Field10Enable">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkVendorProfile_Field10Enable" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVendorProfile_Field10Title" runat="server" ControlName="txtVendorProfile_Field10Title">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtVendorProfile_Field10Title" runat="server" />
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="dnnPrimaryAction" ID="lbtnUpdate" OnClick="lbtnUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none"></asp:LinkButton>&nbsp;
    <asp:HyperLink runat="server" ID="hlCancel" ResourceKey="cmdCancel" CssClass="dnnSecondaryAction"
        NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
</p>
