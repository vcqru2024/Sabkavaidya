<%@ control language="C#" inherits="Cross.Modules.CP_Product.View.P_Settings_ListDashboard, App_Web_p_settings_listdashboard.ascx.87459c53" autoeventwireup="true" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<asp:Wizard ID="wizFlash" runat="server" ActiveStepIndex="0" Font-Names="Verdana"
    CssClass="Normal" CellPadding="5" CellSpacing="5" FinishCompleteButtonType="Link"
    FinishPreviousButtonType="Link" StartNextButtonType="Link" StepNextButtonType="Link"
    StepPreviousButtonType="Link" Width="98%" BackColor="#F7F6F3" BorderColor="#CCCCCC"
    BorderStyle="Solid" BorderWidth="1px" Font-Size="1.0em" OnFinishButtonClick="wizFlash_FinishButtonClick">
    <StepStyle VerticalAlign="Top" Width="100%" BorderWidth="0px" ForeColor="#5D7B9D" />
    <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
        BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em" ForeColor="#284775" />
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
                        Text='<%#Localization.GetString("StepPreviousButton", LocalResourceFile)%>' CssClass="dnnSecondaryAction" />
                </td>
                <td align="right">
                    <asp:LinkButton ID="StepNextButton" runat="server" CommandName="MoveNext" Text='<%#Localization.GetString("StepNextButton", LocalResourceFile)%>'
                        CssClass="dnnPrimaryAction" />
                </td>
                <td align="right">
                    <asp:HyperLink ID="hlCancel" runat="server" Text="Cancel" CssClass="dnnSecondaryAction"
                        resourcekey="cmdCancel" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(this.TabId)%>" />
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
                <asp:Label ID="lblGeneral" runat="server" resourcekey="lblGeneral" />
            </h4>
            <hr />
            <table id="tblGeneral" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server"
                class="dnnFormItem">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plType" runat="server" ControlName="ddlType"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlType" runat="server" Width="350px" DataTextField="Name" DataValueField="Id"
                            AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" resourcekey="Tip_Template" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plTemplate" runat="server" ControlName="ddlTemplate"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTemplate" runat="server" Width="350px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plPlayMode" runat="server" ControlName="ddlPlayMode" Text="Choose Play Mode">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rbPlayModeList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rbPlayModeList_SelectedIndexChanged">
                            <asp:ListItem Value="ImageNavigate" resourcekey="liPlayModeList_ImageNavigate" />
                            <asp:ListItem Value="ImageNavigateIntegrative" resourcekey="liPlayModeList_ImageNavigateIntegrative" />
                            <asp:ListItem Value="ImageNavigateButtonFree" resourcekey="liPlayModeList_ImageNavigateButtonFree" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plLinkTarget" ControlName="ddlLinkTarget" runat="server"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLinkTarget" runat="server" Width="200px">
                            <asp:ListItem Value="_self" resourcekey="liLinkTarget_Self">_Self</asp:ListItem>
                            <asp:ListItem Value="_blank" resourcekey="liLinkTarget_Blank">_Blank</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label2" runat="server" resourcekey="Tip_DetailTab" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plDetailTab" runat="server" ControlName="ddlDetailTab"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDetailTab" DataValueField="TabId" DataTextField="IndentedTabName"
                            Width="350px" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plRows" runat="server" ControlName="txtRows"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRows" runat="server"  Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRows"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plFeatured" runat="server" ControlName="chkFeatured"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFeatured" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plSortField" runat="server" Text="Sort By" ControlName="ddlSortField">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSortField" runat="server" Width="450px">
                             <asp:ListItem Value="CreationDateDesc" Selected="True" resourcekey="li_SortField_CreationDateDesc" />
                            <asp:ListItem Value="CreationDateAsc"  resourcekey="li_SortField_CreationDateAsc" />
                           
                            <asp:ListItem Value="PublishDateDesc"  resourcekey="li_SortField_PublishDateDesc" />
                            <asp:ListItem Value="PublishDateAsc"  resourcekey="li_SortField_PublishDateAsc" />

                              <asp:ListItem Value="LastModifiedDateDesc"  resourcekey="li_SortField_LastModifiedDateDesc" />
                            <asp:ListItem Value="LastModifiedDateAsc"  resourcekey="li_SortField_LastModifiedDateAsc" />

                              <asp:ListItem Value="ViewsDesc"  resourcekey="li_SortField_ViewsDesc" />
                            <asp:ListItem Value="ViewsAsc"  resourcekey="li_SortField_ViewsAsc" />

                             <asp:ListItem Value="NameDesc"  resourcekey="li_SortField_NameDesc" />
                            <asp:ListItem Value="NameAsc"  resourcekey="li_SortField_NameAsc" />

                             <asp:ListItem Value="PurchasePriceDesc"  resourcekey="li_SortField_PurchasePriceDesc" />
                            <asp:ListItem Value="PurchasePriceAsc"  resourcekey="li_SortField_PurchasePriceAsc" />

                             <asp:ListItem Value="StartPriceDesc"  resourcekey="li_SortField_StartPriceDesc" />
                            <asp:ListItem Value="StartPriceAsc"  resourcekey="li_SortField_StartPriceAsc" />
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <dnn:sectionhead ID="secPlayModeTips" runat="server" Section="tblPlayModeTips" ResourceKey="secPlayModeTips"
                IncludeRule="True" IsExpanded="False" CssClass="SubHead"></dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" runat="server" id="tblPlayModeTips" width="100%">
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgImageNavigate_Classical" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/CrossClassified/Images/ImageNavigate_Classical.jpg" />
                        <br />
                        <asp:Label ID="lblImageNavigate_Classical" resourcekey="lblImageNavigate_Classical"
                            CssClass="dnnFormMessage dnnFormInfo" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgImageNavigate_Integrative" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/CrossClassified/Images/ImageNavigate_Integrative.jpg" />
                        <br />
                        <asp:Label ID="lblImageNavigate_Integrative" resourcekey="lblImageNavigate_Integrative"
                            CssClass="dnnFormMessage dnnFormInfo" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Image ID="imgNavigate_ButtonFree" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/CrossClassified/images/ImageNavigate_ButtonFree.jpg" />
                        <br />
                        <asp:Label ID="lblImageNavigate_ButtonFree" resourcekey="lblImageNavigate_ButtonFree"
                            CssClass="dnnFormMessage dnnFormInfo" runat="server"></asp:Label><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Label ID="lblPlayModeTips" resourcekey="lblPlayModeTips" runat="server" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
            </table>
            <dnn:sectionhead ID="secAbout" runat="server" Section="tblAbout" ResourceKey="secAbout"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblAbout" cellspacing="0" cellpadding="2" border="0" runat="server" width="100%"
                class="dnnFormItem">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label23" runat="server" resourcekey="Tip_About" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="wsCategory" runat="server" Title='<%# Localization.GetString("wsCategory", LocalResourceFile) %>'>
            <h4>
                <asp:Label ID="lblCategory" runat="server" resourcekey="lblCategory" />
            </h4>
            <hr />
            <table cellspacing="0" cellpadding="2" border="0" class="dnnFormItem" width="100%">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label3" runat="server" resourcekey="Tip_Category" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plCategory" runat="server" ControlName="tvCategory"></dnn:Label>
                    </td>
                    <td>
                        <asp:TreeView ID="tvCategory" runat="server" ImageSet="XPFileExplorer" NodeIndent="10"
                            PathSeparator="/" ShowCheckBoxes="All" ExpandDepth="-1">
                            <ParentNodeStyle Font-Bold="False" />
                            <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                            <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                VerticalPadding="0px" />
                            <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                NodeSpacing="0px" VerticalPadding="2px" />
                        </asp:TreeView>
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="wsFlashSettings" runat="server" Title='<%# Localization.GetString("wsFlashSettings",LocalResourceFile) %>'>
            <h4>
                <asp:Label ID="lblFlashSettings" runat="server" resourcekey="lblFlashSettings" />
            </h4>
            <hr />
            <dnn:sectionhead ID="secFlashGeneral" runat="server" Section="tblFlashGeneral" ResourceKey="secFlashGeneral"
                IncludeRule="True" IsExpanded="True" CssClass="SubHead"></dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" runat="server" id="tblFlashGeneral" class="dnnFormItem" width="100%">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plFlashWidth" runat="server" Text="Flash Width" ResourceKey="plFlashWidth"
                            ControlName="txtFlashWidth"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlashWidth" runat="server"  Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regWidth" resourcekey="MustBeInteger" runat="server"
                            ValidationExpression="\d*" ControlToValidate="txtFlashWidth"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plFlashHeight" runat="server" ResourceKey="plFlashHeight" ControlName="txtFlashHeight"
                            Text="Flash Height"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlashHeight" runat="server"  Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regHeight" resourcekey="MustBeInteger" runat="server"
                            ValidationExpression="\d*" ControlToValidate="txtFlashHeight"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plFlashBgColor" runat="server" ControlName="txtFlashBgColor" Text="Background Color">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlashBgColor" runat="server"  Columns="16"></asp:TextBox>
                        <a id="pickFlashBgColor" name="pickFlashBgColor" href="javascript:void(PickFlashBgColor())"
                            target="_self">
                            <asp:Image ID="Image13" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossClassified/Images/ColorPick.jpg" /></a>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtFlashBgColor"
                            CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator28" runat="server"
                            ControlToValidate="txtFlashBgColor" CssClass="NormalRed" ResourceKey="InvalidHex"
                            SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plFlashAlign" runat="server" ControlName="ddlFlashAlign" Text="Flash Align">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFlashAlign" runat="server" Width="200px">
                            <asp:ListItem Value="left" ResourceKey="liFlashAlign_left" />
                            <asp:ListItem Value="center" ResourceKey="liFlashAlign_center" />
                            <asp:ListItem Value="right" ResourceKey="liFlashAlign_right" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plFlashWmode" runat="server" ControlName="ddlFlashWmode" Text="Flash Wmode Option">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFlashWmode" runat="server" Width="200px">
                            <asp:ListItem Value="window" resourcekey="liFlashWmode_window" />
                            <asp:ListItem Value="opaque" resourcekey="liFlashWmode_opaque" />
                            <asp:ListItem Value="transparent" resourcekey="liFlashWmode_transparent" />
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <dnn:sectionhead ID="secNavigateSettings" runat="server" Section="tblNavigateSettings"
                ResourceKey="secNavigateSettings" IncludeRule="True" IsExpanded="True" CssClass="SubHead">
            </dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" runat="server" id="tblNavigateSettings" class="dnnFormItem" width="100%"
                visible="false">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plIntervalTime" runat="server" ControlName="txtIntervalTime" Text="Rotator Internal(sec)">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtIntervalTime" runat="server"  Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtIntervalTime"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plTextHeight" runat="server" ResourceKey="plTextHeight" ControlName="txtTextHeight"
                            Text="Image Title Height"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTextHeight" runat="server"  Width="100px"></asp:TextBox>
                        <asp:Label ID="lblTextHeightTips" runat="server" resourcekey="lblTextHeightTips"
                            Text="Set it to zero if you don't want to show image title"></asp:Label>
                        <asp:RegularExpressionValidator ID="regTextHeight" resourcekey="MustBeInteger" runat="server"
                            ValidationExpression="\d*" ControlToValidate="txtTextHeight"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plTextAlign" runat="server" ControlName="ddlTextAlign" Text="Text Align">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTextAlign" runat="server" Width="200px">
                            <asp:ListItem Value="left" ResourceKey="liTextAlign_left" />
                            <asp:ListItem Value="center" ResourceKey="liTextAlign_center" />
                            <asp:ListItem Value="right" ResourceKey="liTextAlign_right" />
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <dnn:sectionhead ID="secNavigateIntegrativeSettings" runat="server" Section="tblNavigateIntegrativeSettings"
                ResourceKey="secNavigateIntegrativeSettings" IncludeRule="True" IsExpanded="True"
                CssClass="SubHead"></dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" runat="server" id="tblNavigateIntegrativeSettings" width="100%"
                class="dnnFormItem" visible="false">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plNavigateIntegrative_TextSize" runat="server" ControlName="txtNavigateIntegrative_TextSize">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNavigateIntegrative_TextSize" runat="server" 
                            Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator14" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtNavigateIntegrative_TextSize"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plNavigateIntegrative_TxtColor" runat="server" ControlName="txtNavigateIntegrative_TxtColor">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNavigateIntegrative_TxtColor" runat="server" 
                            Columns="16"></asp:TextBox>
                        <a id="pickNavigateIntegrative_TxtColor" name="pickNavigateIntegrative_TxtColor"
                            href="javascript:void(PickNavigateIntegrative_TxtColor())" target="_self">
                            <asp:Image ID="Image9" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossClassified/Images/ColorPick.jpg" /></a>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtNavigateIntegrative_TxtColor"
                            CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator18" runat="server"
                            ControlToValidate="txtNavigateIntegrative_TxtColor" CssClass="NormalRed" ResourceKey="InvalidHex"
                            SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plNavigateIntegrative_Speed" runat="server" ControlName="txtNavigateIntegrative_Speed">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNavigateIntegrative_Speed" runat="server" 
                            Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator15" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtNavigateIntegrative_Speed"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plNavigateIntegrative_BtnBg" runat="server" ControlName="txtNavigateIntegrative_BtnBg">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNavigateIntegrative_BtnBg" runat="server" 
                            Columns="16"></asp:TextBox>
                        <a id="pickNavigateIntegrative_BtnBg" name="pickNavigateIntegrative_BtnBg" href="javascript:void(PickNavigateIntegrative_BtnBg())"
                            target="_self">
                            <asp:Image ID="Image8" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossClassified/Images/ColorPick.jpg" /></a>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtNavigateIntegrative_BtnBg"
                            CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server"
                            ControlToValidate="txtNavigateIntegrative_BtnBg" CssClass="NormalRed" ResourceKey="InvalidHex"
                            SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                    </td>
                </tr>
            </table>
            <dnn:sectionhead ID="secNavigateButtonFreeSettings" runat="server" Section="tblNavigateButtonFreeSettings"
                ResourceKey="secNavigateButtonFreeSettings" IncludeRule="True" IsExpanded="True"
                CssClass="SubHead"></dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" runat="server" id="tblNavigateButtonFreeSettings" width="100%"
                class="dnnFormItem" visible="false">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plNavigateButtonFree_Button_Pos" runat="server" ControlName="ddlNavigateButtonFree_Button_Pos">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlNavigateButtonFree_Button_Pos" runat="server" Width="200px">
                            <asp:ListItem Value="1" resourcekey="li_NavigateButtonFree_Button_Pos_Left"></asp:ListItem>
                            <asp:ListItem Value="2" resourcekey="li_NavigateButtonFree_Button_Pos_Right"></asp:ListItem>
                            <asp:ListItem Value="3" resourcekey="li_NavigateButtonFree_Button_Pos_Top"></asp:ListItem>
                            <asp:ListItem Value="4" resourcekey="li_NavigateButtonFree_Button_Pos_Buttom"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plNavigateButtonFree_Stop_Time" runat="server" ControlName="txtNavigateButtonFree_Stop_Time">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNavigateButtonFree_Stop_Time" runat="server" 
                            Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator20" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtNavigateButtonFree_Stop_Time"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plNavigateButtonFree_Show_Text" runat="server" ControlName="chkNavigateButtonFree_Show_Text">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkNavigateButtonFree_Show_Text" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plNavigateButtonFree_TxtColor" runat="server" ControlName="txtNavigateButtonFree_TxtColor">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNavigateButtonFree_TxtColor" runat="server" 
                            Columns="16"></asp:TextBox>
                        <a id="pickNavigateButtonFree_TxtColor" name="pickNavigateButtonFree_TxtColor" href="javascript:void(PickNavigateButtonFree_TxtColor())"
                            target="_self">
                            <asp:Image ID="Image7" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossClassified/images/ColorPick.jpg" /></a>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtNavigateButtonFree_TxtColor"
                            CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator19" runat="server"
                            ControlToValidate="txtNavigateButtonFree_TxtColor" CssClass="NormalRed" ResourceKey="InvalidHex"
                            SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plNavigateButtonFree_BgColor" runat="server" ControlName="txtNavigateButtonFree_BgColor">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNavigateButtonFree_BgColor" runat="server" 
                            Columns="16"></asp:TextBox>
                        <a id="pickNavigateButtonFree_BgColor" name="pickNavigateButtonFree_BgColor" href="javascript:void(PickNavigateButtonFree_BgColor())"
                            target="_self">
                            <asp:Image ID="Image10" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossClassified/images/ColorPick.jpg" /></a>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtNavigateButtonFree_BgColor"
                            CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator21" runat="server"
                            ControlToValidate="txtNavigateButtonFree_BgColor" CssClass="NormalRed" ResourceKey="InvalidHex"
                            SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="wsFinish" runat="server" Title='<%# Localization.GetString("wsFinish", LocalResourceFile) %>'
            StepType="Finish">
            <h4>
                <asp:Label ID="lblFinish" runat="server" Text="Finish" resourcekey="lblFinish"  /></h4>
            <hr />
            <asp:Label ID="lblFailure" runat="server" Visible="False" CssClass="normalred" Text="Submit Failure" />
        </asp:WizardStep>
    </WizardSteps>
    <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top"
        Width="120px" />
    <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" CssClass="CommandButton" />
    <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em"
        ForeColor="White" HorizontalAlign="Left" />
</asp:Wizard>
