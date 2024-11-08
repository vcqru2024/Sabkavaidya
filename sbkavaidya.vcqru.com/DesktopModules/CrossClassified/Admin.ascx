<%@ control language="C#" inherits="Cross.Modules.CP_Product.View.Admin, App_Web_admin.ascx.87459c53" autoeventwireup="true" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<asp:Label ID="lblTrialTips" runat="server" Visible="false" resourcekey="lblTrialTips"
    CssClass="Normal"></asp:Label>
<asp:Label ID="lblNoPermission" runat="server" resourcekey="lblNoPermission" Visible="false"></asp:Label>
<asp:Label ID="lblTrialExpired" runat="server" resourcekey="lblTrialExpired" Visible="false"
    CssClass="NormalRed"></asp:Label>
<asp:LinkButton CssClass="dnnPrimaryAction" ID="lbtnSetupWizard" OnClick="lbtnSetupWizard_Click"
    resourcekey="lbtnSetupWizard" runat="server" BorderStyle="none" CausesValidation="False">
</asp:LinkButton>
<dnn:SectionHead ID="secHowtostart" CssClass="SubHead" runat="server" Section="tblHowtostart"
    align="left" ResourceKey="secHowtostart" IncludeRule="True" IsExpanded="False"></dnn:SectionHead>
<table class="dnnFormItem" id="tblHowtostart" cellspacing="2" cellpadding="2" width="100%"
    align="center" visible="false" runat="server">
    <tr>
        <td colspan="2" class="dnnFormMessage dnnFormInfo">
            <%=LocalizeString("Help_HowToStart")%><br />
            <%=string.Format(LocalizeString("Help_ReadUserGuide"), FullDomainName + "/DesktopModules/CrossClassified/Help/Classified_Pro_User_Guide.pdf")%>
        </td>
    </tr>
</table>
<dnn:SectionHead ID="secHelp_ContentLocalization" CssClass="SubHead" runat="server"
    Section="tblHelp_ContentLocalization" align="left" ResourceKey="secHelp_ContentLocalization"
    IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
<table style="width: 100%;" cellpadding="2" cellspacing="2" runat="server" id="tblHelp_ContentLocalization">
    <tr>
        <td colspan="2" class="dnnFormMessage dnnFormInfo">
            <asp:Label ID="lblHelp_ContentLocalization" runat="server" resourcekey="Help_ContentLocalization"></asp:Label>
        </td>
    </tr>
</table>
<dnn:SectionHead ID="secAdmin" CssClass="SubHead" runat="server" Section="tblAdmin"
    align="left" ResourceKey="secAdmin" IncludeRule="True" IsExpanded="true"></dnn:SectionHead>
<table class="dnnFormItem" id="tblAdmin" cellspacing="2" cellpadding="2" width="90%"
    align="center" visible="false" runat="server">
    <tr id="trAdminGeneral" runat="server">
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secAdminGeneral" CssClass="SubHead" runat="server" Section="tblAdminGeneral"
                align="left" ResourceKey="secAdminGeneral" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblAdminGeneral">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" resourcekey="Tip_ForAdministratorOnly" CssClass="dnnFormMessage dnnFormInfo"
                            Visible="<%#UserInfo.IsInRole(PortalSettings.AdministratorRoleName) && !Settings_Portal.General.HideAllTips %>"></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <td valign="middle" align="left">
                        <asp:ImageButton ID="ibtnAdminGeneral_Settings" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/GeneralSettings.gif"
                            OnClick="lbtnAdminGeneral_Settings_Click"></asp:ImageButton>
                    </td>
                    <td valign="top" align="left">
                        <asp:LinkButton ID="lbtnAdminGeneral_Settings" runat="server" resourcekey="lbtnAdminGeneral_Settings"
                            CssClass="NormalBold" OnClick="lbtnAdminGeneral_Settings_Click"></asp:LinkButton><br />
                        <asp:Label ID="lblAdminGeneral_Settings" runat="server" resourcekey="lblAdminGeneral_Settings"
                            CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td valign="middle" align="left">
                        <asp:ImageButton ID="ibtnAdminProduct_Settings" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Dictionary.png"
                            OnClick="lbtnAdminProduct_Settings_Click"></asp:ImageButton>
                    </td>
                    <td valign="top" align="left">
                        <asp:LinkButton ID="lbtnAdminProduct_Settings" runat="server" resourcekey="lbtnAdminProduct_Settings"
                            CssClass="NormalBold" OnClick="lbtnAdminProduct_Settings_Click"></asp:LinkButton><br />
                        <asp:Label ID="lblAdminProduct_Settings" runat="server" resourcekey="lblAdminProduct_Settings"
                            CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td valign="middle" align="left">
                        <asp:ImageButton ID="ibtnAdminGeneral_Role" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/icon_securityroles_32px.gif"
                            OnClick="lbtnAdminGeneral_Role_Click"></asp:ImageButton>
                    </td>
                    <td valign="top" align="left">
                        <asp:LinkButton ID="lbtnAdminGeneral_Role" runat="server" resourcekey="lbtnAdminGeneral_Role"
                            CssClass="NormalBold" OnClick="lbtnAdminGeneral_Role_Click"></asp:LinkButton>
                        <br />
                        <asp:Label ID="lblAdminGeneral_Role" runat="server" resourcekey="lblAdminGeneral_Role"
                            CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td valign="middle" align="left">
                        <asp:ImageButton ID="ibtnAdminProduct_Location" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Location.gif"
                            OnClick="lbtnAdminProduct_Location_Click"></asp:ImageButton>
                    </td>
                    <td valign="top" align="left">
                        <asp:LinkButton ID="lbtnAdminProduct_Location" runat="server" resourcekey="lbtnAdminProduct_Location"
                            CssClass="NormalBold" OnClick="lbtnAdminProduct_Location_Click"></asp:LinkButton>
                        <br />
                        <asp:Label ID="lblAdminProduct_Location" runat="server" resourcekey="lblAdminProduct_Location"
                            CssClass="Normal"></asp:Label>
                        <asp:Label ID="lblContentLocalization_Location" runat="server" Visible="<%#SupportsContentLocalization%>"
                            CssClass="Normal" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                <tr runat="server" id="trAdminProduct_ShipMethod">
                    <td valign="middle" align="left">
                        <asp:ImageButton ID="ibtnAdminProduct_ShipMethod" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/ShipMethod.png"
                            OnClick="lbtnAdminProduct_ShipMethod_Click"></asp:ImageButton>
                    </td>
                    <td valign="top" align="left">
                        <asp:LinkButton ID="lbtnAdminProduct_ShipMethod" runat="server" resourcekey="lbtnAdminProduct_ShipMethod"
                            CssClass="NormalBold" OnClick="lbtnAdminProduct_ShipMethod_Click"></asp:LinkButton>
                        <br />
                        <asp:Label ID="lblAdminProduct_ShipMethod" runat="server" resourcekey="lblAdminProduct_ShipMethod"
                            CssClass="Normal"></asp:Label>
                        <asp:Label ID="lblContentLocalization_Shipping" runat="server" Visible="<%#SupportsContentLocalization%>"
                            CssClass="Normal" />
                    </td>
                </tr>
                  <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr id="trAdminType" runat="server">
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secAdminType" CssClass="SubHead" runat="server" Section="tblAdminType"
                align="left" ResourceKey="secAdminType" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblAdminType">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblAdminTypeTip" runat="server" CssClass="dnnFormMessage dnnFormInfo"
                            Visible="<%#UserInfo.IsInRole(PortalSettings.AdministratorRoleName) && !Settings_Portal.General.HideAllTips%>">
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label2" runat="server" resourcekey="Tip_Type" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                <tr runat="server" id="trAdminType_Fixed">
                    <td valign="middle" align="left">
                        <asp:ImageButton ID="ibtnAdminType_Fixed" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Type.gif"
                            OnClick="lbtnAdminType_Fixed_Click"></asp:ImageButton>
                    </td>
                    <td valign="top" align="left">
                        <asp:LinkButton ID="lbtnAdminType_Fixed" runat="server" resourcekey="lbtnAdminType_Fixed"
                            CssClass="NormalBold" OnClick="lbtnAdminType_Fixed_Click"></asp:LinkButton><br />
                        <asp:Label ID="lblAdminType_Fixed" runat="server" resourcekey="lblAdminType_Fixed"
                            CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                <tr runat="server" id="trAdminType_Auction">
                    <td valign="middle" align="left">
                        <asp:ImageButton ID="ibtnAdminType_Auction" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/auction32.png"
                            OnClick="lbtnAdminType_Auction_Click"></asp:ImageButton>
                    </td>
                    <td valign="top" align="left">
                        <asp:LinkButton ID="lbtnAdminType_Auction" runat="server" resourcekey="lbtnAdminType_Auction"
                            CssClass="NormalBold" OnClick="lbtnAdminType_Auction_Click"></asp:LinkButton><br />
                        <asp:Label ID="lblAdminType_Auction" runat="server" resourcekey="lblAdminType_Auction"
                            CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                <tr runat="server" id="trAdminType_Ad">
                    <td valign="middle" align="left">
                        <asp:ImageButton ID="ibtnAdminType_Ad" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/ClassifiedAd32.png"
                            OnClick="lbtnAdminType_Ad_Click"></asp:ImageButton>
                    </td>
                    <td valign="top" align="left">
                        <asp:LinkButton ID="lbtnAdminType_Ad" runat="server" resourcekey="lbtnAdminType_Ad"
                            CssClass="NormalBold" OnClick="lbtnAdminType_Ad_Click"></asp:LinkButton><br />
                        <asp:Label ID="lblAdminType_Ad" runat="server" resourcekey="lblAdminType_Ad"
                            CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                  <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr id="trAdminSystem" runat="server">
        <td valign="top" align="left" width="100%">
            <dnn:SectionHead ID="secAdminSystem" CssClass="SubHead" runat="server" Section="tblAdminSystem"
                align="left" ResourceKey="secAdminSystem" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblAdminSystem">
                <tbody>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblSystemDataTip" runat="server" 
                                Visible="<%#UserInfo.IsInRole(PortalSettings.AdministratorRoleName) && !Settings_Portal.General.HideAllTips%>"
                                CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminProduct_Category" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Category.gif"
                                OnClick="lbtnAdminProduct_Category_Click"></asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminProduct_Category" runat="server" resourcekey="lbtnAdminProduct_Category"
                                CssClass="NormalBold" OnClick="lbtnAdminProduct_Category_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminProduct_Category" runat="server" resourcekey="lblAdminProduct_Category"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminProduct_UDT" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Udt.gif"
                                OnClick="lbtnAdminProduct_UDT_Click"></asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminProduct_UDT" runat="server" resourcekey="lbtnAdminProduct_UDT"
                                CssClass="NormalBold" OnClick="lbtnAdminProduct_UDT_Click"></asp:LinkButton><br />
                            <asp:Label ID="lblAdminProduct_UDT" runat="server" resourcekey="lblAdminProduct_UDT"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminProduct_Manufacturer" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Manufacturer.png"
                                OnClick="lbtnAdminProduct_Manufacturer_Click"></asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminProduct_Manufacturer" runat="server" resourcekey="lbtnAdminProduct_Manufacturer"
                                CssClass="NormalBold" OnClick="lbtnAdminProduct_Manufacturer_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminProduct_Manufacturer" runat="server" resourcekey="lblAdminProduct_Manufacturer"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                      <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
    <tr id="trAdminProduct" runat="server">
        <td valign="top" align="left" width="100%">
            <dnn:SectionHead ID="secAdminProduct" CssClass="SubHead" runat="server" Section="tblAdminProduct"
                align="left" ResourceKey="secAdminProduct" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblAdminProduct">
                <tbody>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblManageTip" runat="server" 
                                Visible="<%#UserInfo.IsInRole(PortalSettings.AdministratorRoleName) && !Settings_Portal.General.HideAllTips %>"
                                CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                        </td>
                    </tr>
                    <tr runat="server" id="trAdminProduct_Product" visible="false">
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminProduct_Product" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Product.gif"
                                OnClick="lbtnAdminProduct_Product_Click"></asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminProduct_Product" runat="server" resourcekey="lbtnAdminProduct_Product"
                                CssClass="NormalBold" OnClick="lbtnAdminProduct_Product_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminProduct_Product" runat="server" resourcekey="lblAdminProduct_Product"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                        </td>
                    </tr>
                    <tr runat="server" id="trAdminProduct_Auction" visible="false">
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminProduct_Auction" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/auction32.png"
                                OnClick="lbtnAdminProduct_Auction_Click"></asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminProduct_Auction" runat="server" resourcekey="lbtnAdminProduct_Auction"
                                CssClass="NormalBold" OnClick="lbtnAdminProduct_Auction_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminProduct_Auction" runat="server" resourcekey="lblAdminProduct_Auction"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                        </td>
                    </tr>
                    <tr runat="server" id="trAdminProduct_Ad" visible="false">
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminProduct_Ad" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/ClassifiedAd32.png"
                                OnClick="lbtnAdminProduct_Ad_Click"></asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminProduct_Ad" runat="server" resourcekey="lbtnAdminProduct_Ad"
                                CssClass="NormalBold" OnClick="lbtnAdminProduct_Ad_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminProduct_Ad" runat="server" resourcekey="lblAdminProduct_Ad"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminProduct_Tag" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Tag.gif"
                                OnClick="lbtnAdminProduct_Tag_Click"></asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminProduct_Tag" runat="server" resourcekey="lbtnAdminProduct_Tag"
                                CssClass="NormalBold" OnClick="lbtnAdminProduct_Tag_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminProduct_Tag" runat="server" resourcekey="lblAdminProduct_Tag"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminProduct_Vendor" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/AuthorList.gif"
                                OnClick="lbtnAdminProduct_Vendor_Click"></asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminProduct_Vendor" runat="server" resourcekey="lbtnAdminProduct_Vendor"
                                CssClass="NormalBold" OnClick="lbtnAdminProduct_Vendor_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminProduct_Vendor" runat="server" resourcekey="lblAdminProduct_Vendor"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                      <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
    <tr id="trAdminSell" runat="server">
        <td valign="top" align="left" width="100%">
            <dnn:SectionHead ID="secAdminSell" CssClass="SubHead" runat="server" Section="tblAdminSell"
                align="left" ResourceKey="secAdminSell" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblAdminSell">
                <tbody>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label3" runat="server" resourcekey="Tip_ForAdministratorAndManageRole"
                                Visible="<%#UserInfo.IsInRole(PortalSettings.AdministratorRoleName) && !Settings_Portal.General.HideAllTips %>" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminProduct_Order" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Order.gif"
                                OnClick="lbtnAdminProduct_Order_Click"></asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminProduct_Order" runat="server" resourcekey="lbtnAdminProduct_Order"
                                CssClass="NormalBold" OnClick="lbtnAdminProduct_Order_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminProduct_Order" runat="server" resourcekey="lblAdminProduct_Order"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminProduct_SellReport" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/SellReport.gif"
                                OnClick="lbtnAdminProduct_SellReport_Click"></asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminProduct_SellReport" runat="server" resourcekey="lbtnAdminProduct_SellReport"
                                CssClass="NormalBold" OnClick="lbtnAdminProduct_SellReport_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminProduct_SellReport" runat="server" resourcekey="lblAdminProduct_SellReport"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminProduct_Statistic" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Statistic.gif"
                                OnClick="lbtnAdminProduct_Statistic_Click"></asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminProduct_Statistic" runat="server" resourcekey="lbtnAdminProduct_Statistic"
                                CssClass="NormalBold" OnClick="lbtnAdminProduct_Statistic_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminProduct_Statistic" runat="server" resourcekey="lblAdminProduct_Statistic"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                      <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
    <tr id="trAdminPromotion" runat="server">
        <td valign="top" align="left" width="100%">
            <dnn:SectionHead ID="secAdminPromotion" CssClass="SubHead" runat="server" Section="tblAdminPromotion"
                align="left" ResourceKey="secAdminPromotion" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblAdminPromotion">
                <tbody>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label4" runat="server" Visible="<%#UserInfo.IsInRole(PortalSettings.AdministratorRoleName) && !Settings_Portal.General.HideAllTips %>"
                                resourcekey="Tip_ForAdministratorOnly" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                        </td>
                    </tr>
                    <tr runat="server" id="trAdminPromotion_Discount" visible="false">
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminPromotion_Discount" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Discount.png"
                                OnClick="lbtnAdminPromotion_Discount_Click"></asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminPromotion_Discount" runat="server" resourcekey="lbtnAdminPromotion_Discount"
                                CssClass="NormalBold" OnClick="lbtnAdminPromotion_Discount_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminPromotion_Discount" runat="server" resourcekey="lblAdminPromotion_Discount"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminPromotion_Campaign" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Campaign.gif"
                                OnClick="lbtnAdminPromotion_Campaign_Click"></asp:ImageButton>
                        </td>
                        <td valign="middle" align="left">
                            <asp:LinkButton ID="lbtnAdminPromotion_Campaign" runat="server" resourcekey="lbtnAdminPromotion_Campaign"
                                CssClass="NormalBold" OnClick="lbtnAdminPromotion_Campaign_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminPromotion_Campaign" runat="server" resourcekey="lblAdminPromotion_Campaign"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                      <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
</table>
<dnn:SectionHead ID="secUserVendor" CssClass="SubHead" runat="server" Section="tblUserVendor"
    align="left" ResourceKey="secUserVendor" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
<table style="width: 100%;" align="left" border="0" cellpadding="2" cellspacing="2"
    runat="server" id="tblUserVendor">
    <tbody>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblVendorTip" runat="server" Visible="<%#UserInfo.IsInRole(PortalSettings.AdministratorRoleName) && !Settings_Portal.General.HideAllTips %>"
                    CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
            </td>
        </tr>
        <tr>
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserGeneral_Profile" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Author.gif"
                    OnClick="lbtnUserGeneral_Profile_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserGeneral_Profile" runat="server" resourcekey="lbtnUserGeneral_Profile"
                    CssClass="NormalBold" OnClick="lbtnUserGeneral_Profile_Click"></asp:LinkButton><br />
                <asp:Label ID="lblUserGeneral_Profile" runat="server" resourcekey="lblUserGeneral_Profile"
                    CssClass="Normal"></asp:Label>
                <asp:Label ID="lblTip_UserGeneral_ReceiveMoney" runat="server" resourcekey="Tip_UserGeneral_ReceiveMoney"
                    Visible="false" CssClass="NormalRed"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr runat="server" id="trUserGeneral_Folder" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserGeneral_Folder" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Folder.gif"
                    OnClick="lbtnUserGeneral_Folder_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserGeneral_Folder" runat="server" resourcekey="lbtnUserGeneral_Folder"
                    CssClass="NormalBold" OnClick="lbtnUserGeneral_Folder_Click"></asp:LinkButton><br />
                <asp:Label ID="lblUserGeneral_Folder" runat="server" resourcekey="lblUserGeneral_Folder"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trUserGeneral_File" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserGeneral_File" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/File.gif"
                    OnClick="lbtnUserGeneral_File_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserGeneral_File" runat="server" resourcekey="lbtnUserGeneral_File"
                    CssClass="NormalBold" OnClick="lbtnUserGeneral_File_Click"></asp:LinkButton><br />
                <asp:Label ID="lblUserGeneral_File" runat="server" resourcekey="lblUserGeneral_File"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr runat="server" id="trUserVendor_Product" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserVendor_Product" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Product.gif"
                    OnClick="lbtnUserVendor_Product_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserVendor_Product" runat="server" resourcekey="lbtnUserVendor_Product"
                    CssClass="NormalBold" OnClick="lbtnUserVendor_Product_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserVendor_Product" runat="server" resourcekey="lblUserVendor_Product"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr runat="server" id="trUserVendor_Auction" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserVendor_Auction" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/auction32.png"
                    OnClick="lbtnUserVendor_Auction_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserVendor_Auction" runat="server" resourcekey="lbtnUserVendor_Auction"
                    CssClass="NormalBold" OnClick="lbtnUserVendor_Auction_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserVendor_Auction" runat="server" resourcekey="lblUserVendor_Auction"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr runat="server" id="trUserVendor_Ad" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserVendor_Ad" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/ClassifiedAd32.png"
                    OnClick="lbtnUserVendor_Ad_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserVendor_Ad" runat="server" resourcekey="lbtnUserVendor_Ad"
                    CssClass="NormalBold" OnClick="lbtnUserVendor_Ad_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserVendor_Ad" runat="server" resourcekey="lblUserVendor_Ad" CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr runat="server" id="trUserVendor_Discount" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserVendor_Discount" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Discount.png"
                    OnClick="lbtnUserVendor_Discount_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserVendor_Discount" runat="server" resourcekey="lbtnUserVendor_Discount"
                    CssClass="NormalBold" OnClick="lbtnUserVendor_Discount_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserVendor_Discount" runat="server" resourcekey="lblUserVendor_Discount"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr runat="server" id="trUserVendor_ItemInCart" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserVendor_ItemInCart" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Cart.gif"
                    OnClick="lbtnUserVendor_ItemInCart_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserVendor_ItemInCart" runat="server" CssClass="NormalBold"
                    OnClick="lbtnUserVendor_ItemInCart_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserVendor_ItemInCart" runat="server" resourcekey="lblUserVendor_ItemInCart"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr runat="server" id="trUserVendor_SellReport" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserVendor_SellReport" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/SellReport.gif"
                    OnClick="lbtnUserVendor_SellReport_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserVendor_SellReport" runat="server" resourcekey="lbtnUserVendor_SellReport"
                    CssClass="NormalBold" OnClick="lbtnUserVendor_SellReport_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserVendor_SellReport" runat="server" resourcekey="lblUserVendor_SellReport"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr>
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserVendor_Review" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Review.gif"
                    OnClick="lbtnUserVendor_Review_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserVendor_Review" runat="server" resourcekey="lbtnUserVendor_Review"
                    CssClass="NormalBold" OnClick="lbtnUserVendor_Review_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserVendor_Review" runat="server" resourcekey="lblUserVendor_Review"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr>
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserVendor_Ticket" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Help.gif"
                    OnClick="lbtnUserVendor_Ticket_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserVendor_Ticket" runat="server" resourcekey="lbtnUserVendor_Ticket"
                    CssClass="NormalBold" OnClick="lbtnUserVendor_Ticket_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserVendor_Ticket" runat="server" resourcekey="lblUserVendor_Ticket"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr>
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserVendor_Comment" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Comment.gif"
                    OnClick="lbtnUserVendor_Comment_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserVendor_Comment" runat="server" resourcekey="lbtnUserVendor_Comment"
                    CssClass="NormalBold" OnClick="lbtnUserVendor_Comment_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserVendor_Comment" runat="server" resourcekey="lblUserVendor_Comment"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
          <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
    </tbody>
</table>
<dnn:SectionHead ID="secUserBuyer" CssClass="SubHead" runat="server" Section="tblUserBuyer"
    align="left" ResourceKey="secUserBuyer" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
<table style="width: 100%;" align="left" border="0" cellpadding="2" cellspacing="1"
    runat="server" id="tblUserBuyer">
    <tbody>
        <tr>
            <td colspan="2" runat="server" visible="<%#UserId != -1 && UserInfo.IsInRole(PortalSettings.AdministratorRoleName) && !Settings_Portal.General.HideAllTips %>">
                <asp:Label ID="Label6" runat="server" resourcekey="Tip_ForRegister" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
            </td>
        </tr>

        <tr runat="server" id="trUserBuyer_Address" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserBuyer_Address" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Address.png"
                    OnClick="lbtnUserBuyer_Address_Click"></asp:ImageButton>
            </td>
            <td valign="middle" align="left">
                <asp:LinkButton ID="lbtnUserBuyer_Address" runat="server" resourcekey="lbtnUserBuyer_Address"
                    CssClass="NormalBold" OnClick="lbtnUserBuyer_Address_Click"></asp:LinkButton><br />
                <asp:Label ID="lblUserBuyer_Address" runat="server" resourcekey="lblUserBuyer_Address"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr runat="server" id="trUserBuyer_Cart" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserBuyer_Cart" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Cart.gif"
                    OnClick="lbtnUserBuyer_Cart_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserBuyer_Cart" runat="server" CssClass="NormalBold" OnClick="lbtnUserBuyer_Cart_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserBuyer_Cart" runat="server" resourcekey="lblUserBuyer_Cart"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr runat="server" id="trUserBuyer_Auction" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserBuyer_Auction" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/auction32.png"
                    OnClick="lbtnUserBuyer_Auction_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserBuyer_Auction" runat="server" resourcekey="lbtnUserBuyer_Auction"
                    CssClass="NormalBold" OnClick="lbtnUserBuyer_Auction_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserBuyer_Auction" runat="server" resourcekey="lblUserBuyer_Auction"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr runat="server" id="trUserBuyer_Order" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserBuyer_Order" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Order.gif"
                    OnClick="lbtnUserBuyer_Order_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserBuyer_Order" runat="server" resourcekey="lbtnUserBuyer_Order"
                    CssClass="NormalBold" OnClick="lbtnUserBuyer_Order_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserBuyer_Order" runat="server" resourcekey="lblUserBuyer_Order"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr runat="server" id="trUserBuyer_Product" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserBuyer_Product" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Product.gif"
                    OnClick="lbtnUserBuyer_Product_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserBuyer_Product" runat="server" resourcekey="lbtnUserBuyer_Product"
                    CssClass="NormalBold" OnClick="lbtnUserBuyer_Product_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserBuyer_Product" runat="server" resourcekey="lblUserBuyer_Product"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr runat="server" id="trUserBuyer_Discount" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserBuyer_Discount" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Discount.png"
                    OnClick="lbtnUserBuyer_Discount_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserBuyer_Discount" runat="server" resourcekey="lbtnUserBuyer_Discount"
                    CssClass="NormalBold" OnClick="lbtnUserBuyer_Discount_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserBuyer_Discount" runat="server" resourcekey="lblUserBuyer_Discount"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr>
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserBuyer_Watch" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Watch.gif"
                    OnClick="lbtnUserBuyer_Watch_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserBuyer_Watch" runat="server" resourcekey="lbtnUserBuyer_Watch"
                    CssClass="NormalBold" OnClick="lbtnUserBuyer_Watch_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserBuyer_Watch" runat="server" resourcekey="lblUserBuyer_Watch"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr>
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserBuyer_Review" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Review.gif"
                    OnClick="lbtnUserBuyer_Review_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserBuyer_Review" runat="server" resourcekey="lbtnUserBuyer_Review"
                    CssClass="NormalBold" OnClick="lbtnUserBuyer_Review_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserBuyer_Review" runat="server" resourcekey="lblUserBuyer_Review"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
        <tr>
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnUserBuyer_Ticket" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/Help.gif"
                    OnClick="lbtnUserBuyer_Ticket_Click"></asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnUserBuyer_Ticket" runat="server" resourcekey="lbtnUserBuyer_Ticket"
                    CssClass="NormalBold" OnClick="lbtnUserBuyer_Ticket_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblUserBuyer_Ticket" runat="server" resourcekey="lblUserBuyer_Ticket"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
          <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
    </tbody>
</table>
<dnn:SectionHead ID="secHelp" CssClass="SubHead" runat="server" Section="tblHelp"
    align="left" ResourceKey="secHelp" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
<table class="dnnFormItem" id="tblHelp" cellspacing="2" cellpadding="2" width="90%"
    align="center" visible="false" runat="server">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label7" runat="server" Visible="<%#UserInfo.IsInRole(PortalSettings.AdministratorRoleName) && !Settings_Portal.General.HideAllTips%>"
                resourcekey="Tip_ForAdministratorOnly" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_SubModulesIntroduction" CssClass="SubHead" runat="server"
                Section="tblHelp_SubModulesIntroduction" align="left" ResourceKey="secHelp_SubModulesIntroduction"
                IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_SubModulesIntroduction">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_SubModulesIntroduction" runat="server" resourcekey="Help_SubModulesIntroduction"></asp:Label><br />
                        <asp:Image runat="server" ID="Image3" ImageUrl="~/DesktopModules/CrossClassified/images/Help/SumModules.jpg" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_VideoConvert_Online" CssClass="SubHead" runat="server"
                Section="tblHelp_VideoConvert_Online" align="left" ResourceKey="secHelp_VideoConvert_Online"
                IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_VideoConvert_Online">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_VideoConvert_Online" runat="server" resourcekey="Help_VideoConvert_Online"></asp:Label><br />
                        <asp:Image runat="server" ID="imgHelp_VideoConvert" ImageUrl="~/DesktopModules/CrossClassified/images/Help/ExecuteSetting.jpg"
                            Width="60%" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_VideoConvert_Offline" CssClass="SubHead" runat="server"
                Section="tblHelp_VideoConvert_Offline" align="left" ResourceKey="secHelp_VideoConvert_Offline"
                IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_VideoConvert_Offline">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_VideoConvert_Offline" runat="server" resourcekey="Help_VideoConvert_Offline"></asp:Label><br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_MimeType" CssClass="SubHead" runat="server" Section="tblHelp_MimeType"
                align="left" ResourceKey="secHelp_MimeType" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_MimeType">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_MimeType" runat="server" resourcekey="lblHelp_MimeType"></asp:Label><br />
                        <asp:Image runat="server" ID="imgHelp_MimeType" ImageUrl="~/DesktopModules/CrossClassified/images/Help/MimeType.jpg" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_UploadFileExtension" CssClass="SubHead" runat="server"
                Section="tblHelp_UploadFileExtension" align="left" ResourceKey="secHelp_UploadFileExtension"
                IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_UploadFileExtension">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_UploadFileExtension" runat="server" resourcekey="lblHelp_UploadFileExtension"></asp:Label><br />
                        <asp:Image runat="server" ID="imgHelp_UploadFileExtension" ImageUrl="~/DesktopModules/CrossClassified/images/Help/UploadFileExtension.jpg" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_ChargeCommision" CssClass="SubHead" runat="server" Section="tblHelp_ChargeCommision"
                align="left" ResourceKey="secHelp_ChargeCommision" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_ChargeCommision">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_ChargeCommision" runat="server" resourcekey="Help_ChargeCommision"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_SellRole" CssClass="SubHead" runat="server" Section="tblHelp_SellRole"
                align="left" ResourceKey="secHelp_SellRole" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_SellRole">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_SellRole" runat="server" resourcekey="Help_SellRole"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_PaypalSandbox" CssClass="SubHead" runat="server" Section="tblHelp_PaypalSandbox"
                align="left" ResourceKey="secHelp_PaypalSandbox" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_PaypalSandbox">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_PaypalSandbox" runat="server" resourcekey="Help_Payment_Paypal"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_AuthorizeTest" CssClass="SubHead" runat="server" Section="tblHelp_AuthorizeTest"
                align="left" ResourceKey="secHelp_AuthorizeTest" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_AuthorizeTest">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_AuthorizeTest" runat="server" resourcekey="Help_AuthorizeTest"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_GoogleCheckoutSandbox" CssClass="SubHead" runat="server"
                Section="tblHelp_GoogleCheckoutSandbox" align="left" ResourceKey="secHelp_GoogleCheckoutSandbox"
                IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_GoogleCheckoutSandbox">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_GoogleCheckoutSandbox" runat="server" resourcekey="Help_Payment_GoogleCheckout_Sandbox"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_DineroMail" CssClass="SubHead" runat="server" Section="tblHelp_DineroMail"
                align="left" ResourceKey="secHelp_DineroMail" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_DineroMail">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_DineroMail" runat="server" resourcekey="Help_Payment_DineroMail"></asp:Label><br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_AddFromFtp" CssClass="SubHead" runat="server" Section="tblHelp_AddFromFtp"
                align="left" ResourceKey="secHelp_AddFromFtp" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_AddFromFtp">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_AddFromFtp" runat="server" resourcekey="Help_AddFromFtp"></asp:Label><br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_SendReceiveMail" CssClass="SubHead" runat="server" Section="tblHelp_SendReceiveMail"
                align="left" ResourceKey="secHelp_SendReceiveMail" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_SendReceiveMail">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_SendReceiveMail" runat="server" resourcekey="Help_SendReceiveMail"></asp:Label><br />
                        <asp:Image runat="server" ID="imgHelp_SendReceiveMail" ImageUrl="~/DesktopModules/CrossClassified/images/Help/Smtp.jpg" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_CreateBanner" CssClass="SubHead" runat="server" Section="tblHelp_CreateBanner"
                align="left" ResourceKey="secHelp_CreateBanner" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_CreateBanner">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_CreateBanner" runat="server" resourcekey="Help_CreateBanner"></asp:Label><br />
                        <asp:Image runat="server" ID="Image2" ImageUrl="~/DesktopModules/CrossClassified/images/slideshow/SlideshowDemo_Flow.jpg" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_SplitCpAdmin" CssClass="SubHead" runat="server" Section="tblHelp_SplitCpAdmin"
                align="left" ResourceKey="secHelp_SplitCpAdmin" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_SplitCpAdmin">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_SplitCpAdmin" runat="server" resourcekey="Help_SplitCpAdmin"></asp:Label><br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_AttributeAndOption" CssClass="SubHead" runat="server" Section="tblHelp_AttributeAndOption"
                align="left" ResourceKey="secHelp_AttributeAndOption" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_AttributeAndOption">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_AttributeAndOption" runat="server" resourcekey="Help_AttributeAndOption"></asp:Label><br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_Faqs" CssClass="SubHead" runat="server" Section="tblHelp_Faqs"
                align="left" ResourceKey="secHelp_Faqs" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_Faqs">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_Faqs" runat="server" resourcekey="Help_Faqs"></asp:Label><br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_Online" CssClass="SubHead" runat="server" Section="tblHelp_Online"
                align="left" ResourceKey="secHelp_Online" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="2" cellspacing="2"
                runat="server" id="tblHelp_Online">
                <tr align="left">
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_Online" runat="server" resourcekey="lblHelp_Online"></asp:Label><br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<dnn:SectionHead ID="secRegister" CssClass="SubHead" runat="server" Section="tblRegister"
    align="left" ResourceKey="secRegister" IncludeRule="True" IsExpanded="false"
    Visible="false"></dnn:SectionHead>
<table style="width: 100%;" border="0" cellpadding="2" cellspacing="2" class="dnnFormItem"
    runat="server" id="tblRegister" visible="false">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label8" runat="server" resourcekey="Help_Register" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:Label ID="plInvoiceId" runat="server" ControlName="txtInvoiceId"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtInvoiceId" runat="server" Width="300px"></asp:TextBox>
            <dnn:CommandButton ID="btnRegister" runat="server" ResourceKey="btnRegister" ImageUrl="~/images/add.gif"
                OnCommand="btnRegister_Click" CausesValidation="false" />
            <asp:Label ID="lblRegisterStatus" runat="server" resourcekey="lblRegisterStatus"></asp:Label>
        </td>
    </tr>
</table>
<dnn:SectionHead ID="secShowcase" CssClass="SubHead" runat="server" Section="tblShowcase"
    align="left" ResourceKey="secShowcase" IncludeRule="True" IsExpanded="false"
    Visible="false"></dnn:SectionHead>
<table style="width: 100%;" border="0" cellpadding="2" cellspacing="2" class="dnnFormItem"
    runat="server" id="tblShowcase" visible="false">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label9" runat="server" resourcekey="Help_Showcase" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:Label ID="plName" runat="server" ControlName="txtName"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtName" Columns="70" runat="server" /><asp:Image ID="Image1" runat="server"
                ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                AlternateText="Required" />
            <asp:RequiredFieldValidator ID="varName" runat="server" CssClass="NormalRed" resourcekey="Required"
                Display="Dynamic" ControlToValidate="txtName">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plUrl" runat="server" ControlName="txtUrl"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtUrl" Columns="70" runat="server" />
            <asp:Image ID="Image4" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="NormalRed"
                resourcekey="Required" Display="Dynamic" ControlToValidate="txtUrl">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plLogo" runat="server" ControlName="txtLogo"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtLogo" Columns="70" runat="server" />
        </td>
    </tr>
    <tr>
        <td valign="middle">
            <dnn:Label ID="plDescription" runat="server" ControlName="txtDescription"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtDescription" Columns="70" runat="server" Height="200px" TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <dnn:CommandButton ID="btnAddShowcase" runat="server" ImageUrl="~/images/add.gif"
                OnCommand="btnAddShowcase_Click" ResourceKey="btnAddShowcase" CausesValidation="true" />
            <asp:Label ID="lblSuccess" runat="server" Visible="false" resourcekey="lblSuccess" />
        </td>
    </tr>
</table>
