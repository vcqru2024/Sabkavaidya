<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.AdminGeneral_Settings, App_Web_admingeneral_settings.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<div class="dnnFormItem dnnFormHelp dnnClear">
    <p align="right">
        <span>
            <asp:Image ID="Image6" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" />
            <%=LocalizeString("RequiredFields")%>
        </span>
    </p>
</div>
<dnn:sectionhead ID="secFileStorage" runat="server" Section="tblFileStorage" ResourceKey="secFileStorage"
    IncludeRule="True" IsExpanded="true" CssClass="SubHead"></dnn:sectionhead>
<table id="tblFileStorage" cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem"
    runat="server">
    <tr>
        <td style="width: 200px">
            <dnn:Label ID="plFileStorage" runat="server" ControlName="rblFileStorage"></dnn:Label>
        </td>
        <td>
            <asp:RadioButtonList ID="rblFileStorage" runat="server" AutoPostBack="true"
                OnSelectedIndexChanged="rblFileStorage_SelectedIndexChanged">
                <asp:ListItem Value="Local" ResourceKey="li_FileStorage_Local" />
                <asp:ListItem Value="A3" ResourceKey="li_FileStorage_A3" />
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr runat="server" id="trLocalTip">
        <td colspan="2">
            <asp:Label ID="Label1" runat="server" resourcekey="Tip_UserFolderRoot" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr runat="server" id="trLocal">
        <td>
            <dnn:Label ID="plUserFolderRoot" runat="server" ControlName="txtUserFolderRoot">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtUserFolderRoot" runat="server" Columns="40"></asp:TextBox>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="valNameRequired" runat="server" ControlToValidate="txtUserFolderRoot"
                Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr runat="server" id="trA3Tip">
        <td colspan="2">
            <asp:Label ID="Label2" runat="server" resourcekey="Tip_A3" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr runat="server" id="trA3AccessKey">
        <td>
            <dnn:Label ID="plA3AccessKey" runat="server" ControlName="txtA3AccessKey"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtA3AccessKey" runat="server" Columns="70"></asp:TextBox>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtA3AccessKey"
                Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr runat="server" id="trA3SecretKey">
        <td>
            <dnn:Label ID="plA3SecretKey" runat="server" ControlName="txtA3SecretKey"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtA3SecretKey" runat="server" Columns="70"></asp:TextBox>
            <asp:Image ID="Image3" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtA3SecretKey"
                Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr runat="server" id="trA3Bucket">
        <td>
            <dnn:Label ID="plA3Bucket" runat="server" ControlName="txtA3Bucket"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtA3Bucket" runat="server" Columns="70"></asp:TextBox>
            <asp:Image ID="Image4" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtA3Bucket"
                Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
        </td>
    </tr>
</table>

<dnn:sectionhead ID="secLayoutContent" runat="server" Section="tblLayoutContent" ResourceKey="secLayoutContent" IsExpanded="false"
    IncludeRule="True"  CssClass="SubHead"></dnn:sectionhead>
<table id="tblLayoutContent" cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem"
    runat="server">
     <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label10" runat="server" resourcekey="Help_SplitCpAdmin" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:Label ID="plLayoutContent" runat="server" ControlName="rblLayoutContent"></dnn:Label>
        </td>
        <td>
            <asp:RadioButtonList ID="rblLayoutContent" runat="server">
                <asp:ListItem Value="0" ResourceKey="li_LayoutContent_All" />
                <asp:ListItem Value="1" ResourceKey="li_LayoutContent_Admin" />
                <asp:ListItem Value="2" ResourceKey="li_LayoutContent_AdminAndVendor" />
                <asp:ListItem Value="3" ResourceKey="li_LayoutContent_Vendor" />
                <asp:ListItem Value="4" ResourceKey="li_LayoutContent_VendorAndBuyer" />
                <asp:ListItem Value="5" ResourceKey="li_LayoutContent_Buyer" />
            </asp:RadioButtonList>
        </td>
    </tr>
</table>

<dnn:sectionhead ID="secVideoConvert_Online" runat="server" Section="tblVideoConvert_Online"
    ResourceKey="secVideoConvert_Online" IncludeRule="True" IsExpanded="false" CssClass="SubHead">
</dnn:sectionhead>
<table id="tblVideoConvert_Online" cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem"
    runat="server">
    <tr runat="server" id="trVideoConvertTips">
        <td colspan="2">
            <asp:Label ID="lblVideoConvertTips" runat="server" CssClass="dnnFormMessage dnnFormError"
                resourcekey="lblVideoConvertTips"></asp:Label>
        </td>
    </tr>
    <tr align="left" runat="server" id="trVideoConvertHelp">
        <td colspan="2" >
            <asp:Label ID="lblHelp_VideoConvert" runat="server" resourcekey="Help_VideoConvert_Online" class="dnnFormMessage dnnFormInfo"></asp:Label><br />
            <asp:Image runat="server" ID="imgHelp_VideoConvert" ImageUrl="~/DesktopModules/CrossClassified/images/Help/ExecuteSetting.jpg"
                Width="60%" class="dnnFormMessage dnnFormInfo"/>
        </td>
    </tr>
    <tr runat="server" id="trPermissionCheck">
        <td style="width: 200px">
            <dnn:Label ID="plPermissionCheck" runat="server" ControlName="lblPermissionCheckOk">
            </dnn:Label>
        </td>
        <td>
            <asp:Image runat="server" ID="imgPermissionCheckOk" ImageUrl="~/DesktopModules/CrossClassified/images/Blue-Ok.gif"
                Visible="false" />
            <asp:Label ID="lblPermissionCheckOk" runat="server" Visible="false" resourcekey="lblPermissionCheckOk"></asp:Label>
            <asp:Image ID="imgPermissionCheckDeny" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/red-error.gif"
                Visible="false" />
            <asp:Label ID="lblPermissionCheckDeny" runat="server" Visible="false" resourcekey="lblPermissionCheckDeny"></asp:Label>
        </td>
    </tr>
    <tr runat="server" id="trVideoConvert">
        <td style="width: 200px">
            <dnn:Label ID="plVideoConvert" runat="server" ControlName="chkVideoConvert"></dnn:Label>
        </td>
        <td>
            <asp:CheckBox ID="chkVideoConvert" runat="server" />
        </td>
    </tr>
    <tr runat="server" id="trVideoConvert_Type">
        <td style="width: 200px">
            <dnn:Label ID="plVideoConvert_Type" runat="server" ControlName="ddlVideoConvert_Type">
            </dnn:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlVideoConvert_Type" runat="server">
                <asp:ListItem Value="Flv" ResourceKey="li_VideoConvert_Type_Flv" />
                <asp:ListItem Value="H264" ResourceKey="li_VideoConvert_Type_H264" />
            </asp:DropDownList>
        </td>
    </tr>
    <tr runat="server" id="trVideoConvert_Width">
        <td style="width: 200px">
            <dnn:Label ID="plVideoConvert_Width" runat="server" ControlName="ddlVideoConvert_Width">
            </dnn:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlVideoConvert_Width" runat="server">
                <asp:ListItem Value="128" Text="128x96 sqcif" />
                <asp:ListItem Value="160" Text="160x120 qqvga" />
                <asp:ListItem Value="176" Text="176x144 qcif" />
                <asp:ListItem Value="320" Text="320x240 qvga" />
                <asp:ListItem Value="352" Text="352x288 cif" />
                <asp:ListItem Value="448" Text="448x336 Flash 7 video" />
                <asp:ListItem Value="480" Text="480x360 YouTube Standard" />
                <asp:ListItem Value="640" Text="640x480 SD" />
                <asp:ListItem Value="800" Text="800x600 svga" />
                <asp:ListItem Value="852" Text="852x480 HD480" />
                <asp:ListItem Value="1024" Text="1024x768 xga" />
                <asp:ListItem Value="1280" Text="1280x720 HD720" />
                <asp:ListItem Value="1600" Text="1600x1200 uxga" />
                <asp:ListItem Value="1920" Text="1920x1080 HD1080" />
                <asp:ListItem Value="-1" ResourceKey="li_VideoConvert_Width_UseExisting" />
            </asp:DropDownList>
        </td>
    </tr>
    <tr runat="server" id="trProcessExitTime">
        <td style="width: 200px">
            <dnn:Label ID="plProcessExitTime" runat="server" ControlName="txtProcessExitTime">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtProcessExitTime" runat="server" Columns="10"></asp:TextBox>millisecond
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtProcessExitTime"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secVideoConvert_Offline" runat="server" Section="tblVideoConvert_Offline"
    ResourceKey="secVideoConvert_Offline" IncludeRule="True" IsExpanded="false" CssClass="SubHead">
</dnn:sectionhead>
<table id="tblVideoConvert_Offline" cellspacing="0" cellpadding="2" width="100%" class="dnnFormItem"
    border="0" runat="server">
    <tr>
        <td colspan="2" class="dnnFormMessage dnnFormInfo">
            <asp:Label ID="lblVideoConvert_Offline" runat="server" resourcekey="Help_VideoConvert_Offline"></asp:Label>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secWatermark" runat="server" Section="tblWatermark" ResourceKey="secWatermark"
    IncludeRule="True" IsExpanded="False" CssClass="SubHead"></dnn:sectionhead>
<table id="tblWatermark" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label3" runat="server" resourcekey="Tip_GenerateThumb" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:Label ID="plGenerateThumb" runat="server" ControlName="chkGenerateThumb"></dnn:Label>
        </td>
        <td>
            <asp:CheckBox ID="chkGenerateThumb" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:Label ID="plThumbnailSize" runat="server" ControlName="txtThumbnailSize"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtThumbnailSize" runat="server" Columns="10"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator6" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtThumbnailSize"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label4" runat="server" resourcekey="Tip_Watermark" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 300px">
            <dnn:Label ID="plAddWatermark" runat="server" ControlName="chkAddWatermark"></dnn:Label>
        </td>
        <td>
            <asp:CheckBox runat="server" ID="chkAddWatermark" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plWatermarkPosition" runat="server" ControlName="ddlWatermarkPosition">
            </dnn:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlWatermarkPosition" runat="server">
                <asp:ListItem Value="TopLeft" ResourceKey="li_WatermarkPosition_TopLeft" />
                <asp:ListItem Value="TopRight" ResourceKey="li_WatermarkPosition_TopRight" />
                <asp:ListItem Value="BottomLeft" ResourceKey="li_WatermarkPosition_BottomLeft" />
                <asp:ListItem Value="BottomRight" ResourceKey="li_WatermarkPosition_BottomRight" />
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plWatermarkType" runat="server" ControlName="rblWatermarkType"></dnn:Label>
        </td>
        <td>
            <asp:RadioButtonList ID="rblWatermarkType" runat="server" AutoPostBack="true" CellSpacing="2"
             OnSelectedIndexChanged="rblWatermarkType_SelectedIndexChanged" RepeatColumns="2">
                <asp:ListItem Value="Text" ResourceKey="li_WatermarkType_Text" />
                <asp:ListItem Value="Image" ResourceKey="li_WatermarkType_Image" />
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr runat="server" id="trWatermarkImage">
        <td>
            <dnn:Label ID="plWatermarkImage" runat="server" ControlName="ctlWatermarkImage">
            </dnn:Label>
        </td>
        <td>
            <dnn:URL ID="ctlWatermarkImage" runat="server" Width="400" ShowTabs="False" ShowFiles="True"
                FileFilter="gif" ShowUrls="False" UrlType="F" ShowLog="False" ShowNewWindow="False"
                ShowTrack="False"></dnn:URL>
        </td>
    </tr>
    <tr runat="server" id="trWatermarkText">
        <td>
            <dnn:Label ID="plWatermarkText" runat="server" ControlName="txtWatermarkText"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtWatermarkText" runat="server" Columns="80"></asp:TextBox>
            <asp:Image ID="Image7" runat="server" ImageUrl="~/desktopmodules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtWatermarkText"
                Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr runat="server" id="trTextFontFamily">
        <td>
            <dnn:Label ID="plTextFontFamily" runat="server" ControlName="txtTextFontFamily">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtTextFontFamily" runat="server" Columns="40"></asp:TextBox>
            <asp:Image ID="Image8" runat="server" ImageUrl="~/desktopmodules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTextFontFamily"
                Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr runat="server" id="trTextFontColor">
        <td>
            <dnn:Label ID="plTextFontColor" runat="server" ControlName="txtTextFontColor"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtTextFontColor" runat="server" Columns="40"></asp:TextBox>
            <asp:Image ID="Image9" runat="server" ImageUrl="~/desktopmodules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtTextFontColor"
                Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr runat="server" id="trTextFontBgColor">
        <td>
            <dnn:Label ID="plTextFontBgColor" runat="server" ControlName="txtTextFontBgColor">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtTextFontBgColor" runat="server" Columns="70"></asp:TextBox>
            <asp:Image ID="Image10" runat="server" ImageUrl="~/desktopmodules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtTextFontBgColor"
                Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <asp:Image ID="Image11" runat="server" ImageUrl="~/desktopmodules/CrossClassified/images/Watermark_Sample_Text.jpg" /><br />
            <%=LocalizeString("Tip_Watermark_Sample_Text")%><br />
            <br />
            <asp:Image ID="Image12" runat="server" ImageUrl="~/desktopmodules/CrossClassified/images/Watermark_Sample_Gif.jpg" /><br />
            <%=LocalizeString("Tip_Watermark_Sample_Gif")%>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secHelp_DnnSitemap" runat="server" Section="tblHelp_DnnSitemap"
    ResourceKey="secHelp_DnnSitemap" IncludeRule="True" IsExpanded="false" CssClass="SubHead">
</dnn:sectionhead>
<table id="tblHelp_DnnSitemap" cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem"
    runat="server">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label5" runat="server" resourcekey="Tip_DnnSitemapIntegration" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 300px">
            <dnn:Label ID="plDnnSitemap" runat="server" ControlName="chkDnnSitemap"></dnn:Label>
        </td>
        <td>
            <asp:CheckBox ID="chkDnnSitemap" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="width: 300px">
            <dnn:Label ID="plYourSitemap" runat="server" ControlName="hlYourSitemap"></dnn:Label>
        </td>
        <td>
            <asp:HyperLink ID="hlYourSitemap" runat="server" Target="_blank"></asp:HyperLink>
        </td>
    </tr>
</table>
<%--<dnn:sectionhead ID="secGoogleMap" runat="server" Section="tblGoogleMap" ResourceKey="secGoogleMap"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblGoogleMap" cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem"
    runat="server">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label6" runat="server" resourcekey="Tip_GoogleMapApi" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 300px">
            <dnn:Label ID="plGoogleMapApi" runat="server" ControlName="txtGoogleMapApi"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtGoogleMapApi" runat="server" Columns="60"></asp:TextBox>
            <asp:Image ID="Image5" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtGoogleMapApi"
                Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
        </td>
    </tr>
</table>--%>
<dnn:sectionhead ID="secJournal" runat="server" Section="tblJournal" ResourceKey="secJournal"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblJournal" cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem"
    runat="server">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
        <asp:Label ID="Label9" runat="server" resourcekey="Tip_JournalIntegration"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                       
        </td>
    </tr>
    
    <tr>
        <td style="width: 200px">
            <dnn:Label  ID="plJournal_Enabled" runat="server" ControlName="chkJournal_Enabled">
            </dnn:Label>
        </td>
        <td>
            <asp:CheckBox ID="chkJournal_Enabled" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:Label ID="plJournalTypeId" runat="server" ControlName="ddlJournalTypeId">
            </dnn:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlJournalTypeId" DataValueField="JournalTypeId" DataTextField="JournalType"
                runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label12" runat="server" resourcekey="Tip_AdSocialShare"
                CssClass="dnnFormMessage dnnFormInfo"></asp:Label>

        </td>
    </tr>
      <tr>
        <td>
            <dnn:Label  ID="plEnableAdSocialShare" runat="server" ControlName="chkEnableAdSocialShare">
            </dnn:Label>
        </td>
        <td>
            <asp:CheckBox ID="chkEnableAdSocialShare" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secSeo" runat="server" Section="tblSeo" ResourceKey="secSeo" 
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblSeo" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server" class="dnnFormItem">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label7" runat="server" resourcekey="Tip_SeoUrl" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:Label ID="plUseSeoFriendlyUrl" runat="server" ControlName="chkUseSeoFriendlyUrl">
            </dnn:Label>
        </td>
        <td>
            <asp:CheckBox ID="chkUseSeoFriendlyUrl" runat="server"></asp:CheckBox>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secModulePage_Help" runat="server" Section="tblModulePage_Help" 
    ResourceKey="secModulePage_Help" IncludeRule="True" IsExpanded="false" CssClass="SubHead">
</dnn:sectionhead>
<table id="tblModulePage_Help" cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem"
    runat="server">
    <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2">
            <asp:Label ID="Label8" runat="server" resourcekey="Tip_HelpPage" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:Label ID="plModulePage_Help" runat="server" ControlName="ddlModulePage_Help">
            </dnn:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlModulePage_Help" DataValueField="TabId" DataTextField="IndentedTabName"
                runat="server">
            </asp:DropDownList>
        </td>
    </tr>
      <tr>
        <td>
            <dnn:Label ID="plEnableSilverlightUpload" runat="server" ControlName="chkEnableSilverlightUpload" />
        </td>
        <td>
            <asp:CheckBox ID="chkEnableSilverlightUpload" runat="server" />
        </td>
    </tr>

     <tr>
        <td >
            <dnn:Label ID="plShowCopyright" runat="server" ControlName="chkShowCopyright">
            </dnn:Label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCopyright" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plShowSettingActionButton" runat="server" ControlName="chkShowSettingActionButton" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowSettingActionButton" runat="server" />
        </td>
    </tr>
      <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2" >
         <asp:Label ID="Label6" runat="server" resourcekey="Tip_TabStyle"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
          
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plTabStyle" runat="server" ControlName="ddlTabStyle"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTabStyle" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
     <tr runat="server" Visible="<%#!Settings_Portal.General.HideAllTips %>">
        <td colspan="2" >
         <asp:Label ID="Label11" runat="server" resourcekey="Tip_HideAllTips"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
          
        </td>
    </tr>
    <tr>
        <td >
            <dnn:label ID="plHideAllTips" runat="server" ControlName="chkHideAllTips"></dnn:label>
        </td>
        <td>
           <asp:CheckBox ID="chkHideAllTips" runat="server" />
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="dnnPrimaryAction" ID="lbtnUpdate" OnClick="lbtnUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none"></asp:LinkButton>&nbsp;
    <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnAdminHome" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>"
        CssClass="dnnSecondaryAction" />
</p>
