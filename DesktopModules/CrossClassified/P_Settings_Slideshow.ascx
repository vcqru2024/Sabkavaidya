<%@ control language="C#" inherits="Cross.Modules.CP_Product.View.P_Settings_Slideshow, App_Web_p_settings_slideshow.ascx.87459c53" autoeventwireup="true" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="Portal" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<asp:Wizard ID="wizSlideshow" runat="server" CssClass="dnnFormItem" ActiveStepIndex="0"
    SideBarButtonStyle-Width="150px" Font-Names="Verdana" CellPadding="5" CellSpacing="5"
    FinishCompleteButtonType="Link" FinishPreviousButtonType="Link" StartNextButtonType="Link"
    StepNextButtonType="Link" StepPreviousButtonType="Link" Width="98%" BackColor="#F7F6F3"
    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Size="1.0em"
    OnFinishButtonClick="wizSlideshow_FinishButtonClick">
    <StepStyle VerticalAlign="Top" Width="100%" BorderWidth="0px" ForeColor="#5D7B9D"
        CssClass="Normal" />
    <NavigationButtonStyle CssClass="dnnFormItem" BackColor="#FFFBFF" BorderColor="#CCCCCC"
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em"
        ForeColor="#284775" />
    <StartNavigationTemplate>
        <table border="0" cellpadding="5" cellspacing="5">
            <tr>
                <td align="right">
                    <asp:LinkButton ID="StartNextButton" runat="server" CommandName="MoveNext" CssClass="dnnPrimaryAction"
                        Text='<%#Localization.GetString("StepNextButton",LocalResourceFile)%>' />
                </td>
                <td align="right">
                    <asp:HyperLink ID="hlCancel" runat="server" Text="Cancel" CssClass="dnnSecondaryAction"
                        resourcekey="cmdCancel" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(this.TabId)%>" />
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
                        Text='<%#Localization.GetString("StepPreviousButton",LocalResourceFile)%>' CssClass="dnnSecondaryAction" />
                </td>
                <td align="right">
                    <asp:LinkButton ID="FinishButton" runat="server" CommandName="MoveComplete" Text='<%#Localization.GetString("StepFinishButton",LocalResourceFile)%>'
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
            <table cellspacing="2" cellpadding="2" id="tblGeneral" runat="server" width="100%"
                class="dnnFormItem">
                <tr>
                    <td style="width: 200px">
                        <dnn:label id="plType" runat="server" controlname="ddlType"></dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlType" runat="server" Width="350px" DataTextField="Name"
                            DataValueField="Id" AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
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
                        <dnn:label id="plTemplate" runat="server" controlname="ddlTemplate"></dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTemplate" runat="server" Width="350px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label2" runat="server" resourcekey="Tip_SlideshowMode" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plSlideshowMode" runat="server" controlname="rblSlideshowMode"></dnn:label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblSlideshowMode" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblSlideshowMode_SelectedIndexChanged">
                            <asp:ListItem Value="Galleria" resourcekey="li_SlideshowMode_Galleria" />
                            <asp:ListItem Value="NumericRotator" resourcekey="li_SlideshowMode_NumericRotator" />
                            <asp:ListItem Value="OwlCarousel" resourcekey="li_SlideshowMode_OwlCarousel" />
                            
                          <%--  <asp:ListItem Value="TransBanner" resourcekey="li_SlideshowMode_TransBanner" />--%>
                            <asp:ListItem Value="BootstrapCarousel" resourcekey="li_SlideshowMode_BootstrapCarousel" />
                            <asp:ListItem Value="Flow" resourcekey="li_SlideshowMode_Flow" />
                            <asp:ListItem Value="PgwGallery" resourcekey="li_SlideshowMode_PgwGallery" />
                            <asp:ListItem Value="PgwSlider" resourcekey="li_SlideshowMode_PgwSlider" />
                            <asp:ListItem Value="Unslider" resourcekey="li_SlideshowMode_Unslider" />
                            <asp:ListItem Value="RevolutionSlider" resourcekey="li_SlideshowMode_RevolutionSlider" />
                            <asp:ListItem Value="LiteAccordion" resourcekey="li_SlideshowMode_LiteAccordion" />
                            <asp:ListItem Value="Slidorion" resourcekey="li_SlideshowMode_Slidorion" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label3" runat="server" resourcekey="Tip_DetailTab" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plDetailTab" runat="server" controlname="ddlDetailTab"></dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDetailTab" DataValueField="TabId" DataTextField="IndentedTabName"
                            Width="350px" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plLinkTarget" controlname="ddlLinkTarget" runat="server"></dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLinkTarget" runat="server" Width="200px">
                            <asp:ListItem Value="_self" resourcekey="li_LinkTarget_Self"></asp:ListItem>
                            <asp:ListItem Value="_blank" resourcekey="li_LinkTarget_Blank"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <dnn:sectionhead id="secSlideshowModeTip" runat="server" section="tblSlideshowModeTip"
                resourcekey="secSlideshowModeTip" includerule="True" isexpanded="False" cssclass="SubHead">
            </dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" runat="server" id="tblSlideshowModeTip" width="100%">
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgSlideshowMode_Galleria" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/CrossClassified/Images/Slideshow/SlideshowDemo_Galleria.jpg" />
                        <br />
                        <asp:Label ID="lblSlideshowMode_Galleria" resourcekey="Tip_SlideshowMode_Galleria"
                            CssClass="dnnFormMessage dnnFormInfo" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgSlideshowMode_NumericRotator" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/CrossClassified/Images/Slideshow/SlideshowDemo_NumericRotator.jpg" />
                        <br />
                        <asp:Label ID="lblSlideshowMode_NumericRotator" resourcekey="Tip_SlideshowMode_NumericRotator"
                            CssClass="dnnFormMessage dnnFormInfo" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgSlideshowMode_OwlCarousel" runat="server" ImageAlign="Top" 
                        ImageUrl="~/DesktopModules/CrossClassified/Images/Slideshow/SlideshowDemo_OwlCarousel.jpg" />
                        <br />
                        <asp:Label ID="lblSlideshowMode_OwlCarousel" resourcekey="Tip_SlideshowMode_OwlCarousel"
                            CssClass="dnnFormMessage dnnFormInfo" runat="server"></asp:Label>
                    </td>
                </tr>
               
                <%-- <tr>
                    <td colspan="2">
                        <asp:Image ID="imgSlideshowMode_TransBanner" runat="server" ImageAlign="Top" 
                        ImageUrl="~/DesktopModules/CrossClassified/Images/Slideshow/SlideshowDemo_TransBanner.jpg" />
                        <br />
                        <asp:Label ID="lblSlideshowMode_TransBanner" resourcekey="Tip_SlideshowMode_TransBanner"
                            CssClass="dnnFormMessage dnnFormInfo" runat="server"></asp:Label>
                    </td>
                </tr>--%>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgSlideshowMode_BootstrapCarousel" runat="server" ImageAlign="Top"
                            ImageUrl="~/DesktopModules/CrossClassified/Images/Slideshow/SlideshowDemo_BootstrapCarousel.jpg" />
                        <br />
                        <asp:Label ID="lblSlideshowMode_BootstrapCarousel" resourcekey="Tip_SlideshowMode_BootstrapCarousel"
                            CssClass="dnnFormMessage dnnFormInfo" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgSlideshowMode_Flow" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/CrossClassified/Images/Slideshow/SlideshowDemo_Flow.jpg" />
                        <br />
                        <asp:Label ID="lblSlideshowMode_Flow" resourcekey="Tip_SlideshowMode_Flow" CssClass="dnnFormMessage dnnFormInfo"
                            runat="server"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td colspan="2">
                        <asp:Image ID="imgSlideshowMode_PgwGallery" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/CrossClassified/Images/Slideshow/SlideshowDemo_PgwGallery.jpg" />
                        <br />
                        <asp:Label ID="lblSlideshowMode_PgwGallery" resourcekey="Tip_SlideshowMode_PgwGallery"
                            CssClass="dnnFormMessage dnnFormInfo" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgSlideshowMode_PgwSlider" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/CrossClassified/Images/Slideshow/SlideshowDemo_PgwSlider.jpg" />
                        <br />
                        <asp:Label ID="lblSlideshowMode_PgwSlider" resourcekey="Tip_SlideshowMode_PgwSlider"
                            CssClass="dnnFormMessage dnnFormInfo" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgSlideshowMode_Unslider" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/CrossClassified/Images/Slideshow/SlideshowDemo_Unslider.jpg" />
                        <br />
                        <asp:Label ID="lblSlideshowMode_Unslider" resourcekey="Tip_SlideshowMode_Unslider"
                            CssClass="dnnFormMessage dnnFormInfo" runat="server"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td colspan="2">
                        <asp:Image ID="imgSlideshowMode_RevolutionSlider" runat="server" ImageAlign="Top" 
                        ImageUrl="~/DesktopModules/CrossClassified/Images/Slideshow/SlideshowDemo_RevolutionSlider.jpg" />
                        <br />
                        <asp:Label ID="lblSlideshowMode_RevolutionSlider" resourcekey="Tip_SlideshowMode_RevolutionSlider"
                            CssClass="dnnFormMessage dnnFormInfo" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgSlideshowMode_LiteAccordion" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/CrossClassified/Images/Slideshow/SlideshowDemo_LiteAccordion.jpg" />
                        <br />
                        <asp:Label ID="lblSlideshowMode_LiteAccordion" resourcekey="Tip_SlideshowMode_LiteAccordion"
                            CssClass="dnnFormMessage dnnFormInfo" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgSlideshowMode_Slidorion" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/CrossClassified/Images/Slideshow/SlideshowDemo_Slidorion.jpg" />
                        <br />
                        <asp:Label ID="lblSlideshowMode_Slidorion" resourcekey="Tip_SlideshowMode_Slidorion"
                            CssClass="dnnFormMessage dnnFormInfo" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
             <dnn:SectionHead ID="secHelp_CreateBanner" CssClass="SubHead" runat="server" Section="tblHelp_CreateBanner"
                align="left" ResourceKey="secHelp_CreateBanner" IncludeRule="True" IsExpanded="false">
            </dnn:SectionHead>
            <table style="width: 100%;"  border="0" cellpadding="1" cellspacing="1"
                runat="server" id="tblHelp_CreateBanner">
                <tr>
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_CreateBanner" runat="server" resourcekey="Help_CreateBanner"></asp:Label><br />
                         <asp:Image runat="server" ID="Image2" ImageUrl="~/DesktopModules/CrossClassified/images/slideshow/SlideshowDemo_Flow.jpg" />
                    </td>
                </tr>
            </table>
             <dnn:sectionhead ID="secAbout" runat="server" Section="tblAbout" ResourceKey="secAbout"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblAbout" cellspacing="0" cellpadding="2" border="0" runat="server" width="100%"
                class="dnnFormItem">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label21" runat="server" resourcekey="Tip_About" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="wsItem" runat="server" Title='<%# Localization.GetString("wsItem", LocalResourceFile) %>'>
            <h4>
                <asp:Label ID="lblItem" runat="server" resourcekey="lblItem" />
            </h4>
            <hr />
            <table cellspacing="0" cellpadding="2" border="0" class="dnnFormItem" width="100%">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label4" runat="server" resourcekey="Tip_Category" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px; vertical-align: middle">
                        <dnn:label id="plCategory" runat="server" controlname="tvCategory"></dnn:label>
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
                <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plRows" runat="server" controlname="txtRows"></dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRows" runat="server" Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRows"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFeatured" runat="server" controlname="chkFeatured"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFeatured" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plSortField" runat="server" text="Sort By" controlname="ddlSortField">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSortField" runat="server" Width="400px">
                            <asp:ListItem Value="CreationDateDesc" Selected="True" resourcekey="li_SortField_CreationDateDesc" />
                            <asp:ListItem Value="CreationDateAsc" resourcekey="li_SortField_CreationDateAsc" />
                            <asp:ListItem Value="PublishDateDesc" resourcekey="li_SortField_PublishDateDesc" />
                            <asp:ListItem Value="PublishDateAsc" resourcekey="li_SortField_PublishDateAsc" />
                            <asp:ListItem Value="LastModifiedDateDesc" resourcekey="li_SortField_LastModifiedDateDesc" />
                            <asp:ListItem Value="LastModifiedDateAsc" resourcekey="li_SortField_LastModifiedDateAsc" />
                            <asp:ListItem Value="ViewsDesc" resourcekey="li_SortField_ViewsDesc" />
                            <asp:ListItem Value="ViewsAsc" resourcekey="li_SortField_ViewsAsc" />
                            <asp:ListItem Value="NameDesc" resourcekey="li_SortField_NameDesc" />
                            <asp:ListItem Value="NameAsc" resourcekey="li_SortField_NameAsc" />
                            <asp:ListItem Value="PurchasePriceDesc" resourcekey="li_SortField_PurchasePriceDesc" />
                            <asp:ListItem Value="PurchasePriceAsc" resourcekey="li_SortField_PurchasePriceAsc" />
                            <asp:ListItem Value="StartPriceDesc" resourcekey="li_SortField_StartPriceDesc" />
                            <asp:ListItem Value="StartPriceAsc" resourcekey="li_SortField_StartPriceAsc" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label7" runat="server" resourcekey="Tip_RandomDisplay" CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plRandomDisplay" runat="server" controlname="chkRandomDisplay"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkRandomDisplay" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plTitleLength" runat="server" controlname="txtTitleLength"></dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTitleLength" runat="server" Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator21" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtTitleLength"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plSummaryLength" runat="server" controlname="txtSummaryLength"></dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSummaryLength" runat="server" Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator22" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtSummaryLength"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label12" runat="server" resourcekey="Tip_ImageSize" CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plImageWidth" runat="server" controlname="txtImageWidth"></dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtImageWidth" runat="server" Width="100px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plImageHeight" runat="server" controlname="txtImageHeight"></dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtImageHeight" runat="server" Width="100px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="wsSlideshowSettings" runat="server" Title='<%# Localization.GetString("wsSlideshowSettings", LocalResourceFile) %>'>
            <h4>
                <asp:Label ID="lblSlideshowSettings" runat="server" resourcekey="lblSlideshowSettings" />
            </h4>
            <hr />
            <dnn:sectionhead id="secGalleria" runat="server" section="tblGalleria" resourcekey="secGalleria"
                includerule="True" isexpanded="True" cssclass="SubHead">
            </dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" id="tblGalleria" runat="server" class="dnnFormItem"
                width="100%">
                <tr>
                    <td style="width: 200px">
                        <dnn:label id="plGalleria_Width" runat="server" controlname="txtGalleria_Width">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtGalleria_Width" runat="server" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plGalleria_Height" runat="server" controlname="txtGalleria_Height">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtGalleria_Height" runat="server" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plGalleria_Autoplay" runat="server" controlname="txtGalleria_Autoplay">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtGalleria_Autoplay" runat="server" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plGalleria_Responsive" runat="server" controlname="chkGalleria_Responsive">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkGalleria_Responsive" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label17" runat="server" resourcekey="Tip_Galleria_Lightbox" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plGalleria_Lightbox" runat="server" controlname="chkGalleria_Lightbox">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkGalleria_Lightbox" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plGalleria_ShowTitle" runat="server" controlname="chkGalleria_ShowTitle">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkGalleria_ShowTitle" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plGalleria_ShowSummary" runat="server" controlname="chkGalleria_ShowSummary">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkGalleria_ShowSummary" runat="server" />
                    </td>
                </tr>
            </table>
            <dnn:sectionhead id="secNumericRotator" runat="server" section="tblNumericRotator"
                resourcekey="secNumericRotator" includerule="True" isexpanded="True" cssclass="SubHead">
            </dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" id="tblNumericRotator" runat="server" class="dnnFormItem"
                width="100%">
                <tr>
                    <td style="width: 200px">
                        <dnn:label id="plNumericRotator_Width" runat="server" controlname="txtNumericRotator_Width">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNumericRotator_Width" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator23" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtNumericRotator_Width" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plNumericRotator_Height" runat="server" controlname="txtNumericRotator_Height">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNumericRotator_Height" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator24" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtNumericRotator_Height" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plNumericRotator_TimeOut" runat="server" controlname="txtNumericRotator_TimeOut">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNumericRotator_TimeOut" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator25" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtNumericRotator_TimeOut" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plNumericRotator_TitleHeight" runat="server" controlname="txtNumericRotator_TitleHeight">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNumericRotator_TitleHeight" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator26" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtNumericRotator_TitleHeight" />
                    </td>
                </tr>
            </table>
            <dnn:sectionhead ID="secOwlCarousel" runat="server" Section="tblOwlCarousel" ResourceKey="secOwlCarousel"
                IncludeRule="True" IsExpanded="True" CssClass="SubHead"></dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" id="tblOwlCarousel" runat="server" class="dnnFormItem"
                width="100%">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plOwlCarousel_theme" runat="server" ControlName="rblOwlCarousel_theme">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblOwlCarousel_theme" runat="server" RepeatColumns="2">
                            <asp:ListItem Value="default" resourcekey="li_OwlCarousel_theme_default" />
                            <asp:ListItem Value="green" resourcekey="li_OwlCarousel_theme_green" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_autoplay" runat="server" ControlName="chkOwlCarousel_autoplay">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkOwlCarousel_autoplay" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_autoplayTimeout" runat="server" ControlName="txtOwlCarousel_autoplayTimeout">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOwlCarousel_autoplayTimeout" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator38" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtOwlCarousel_autoplayTimeout" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_autoplayHoverPause" runat="server" ControlName="chkOwlCarousel_autoplayHoverPause">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkOwlCarousel_autoplayHoverPause" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_margin" runat="server" ControlName="txtOwlCarousel_margin">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOwlCarousel_margin" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator39" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtOwlCarousel_margin" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_loop" runat="server" ControlName="chkOwlCarousel_loop">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkOwlCarousel_loop" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_center" runat="server" ControlName="chkOwlCarousel_center">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkOwlCarousel_center" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_mouseDrag" runat="server" ControlName="chkOwlCarousel_mouseDrag">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkOwlCarousel_mouseDrag" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_touchDrag" runat="server" ControlName="chkOwlCarousel_touchDrag">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkOwlCarousel_touchDrag" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_pullDrag" runat="server" ControlName="chkOwlCarousel_pullDrag">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkOwlCarousel_pullDrag" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_freeDrag" runat="server" ControlName="chkOwlCarousel_freeDrag">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkOwlCarousel_freeDrag" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_stagePadding" runat="server" ControlName="txtOwlCarousel_stagePadding">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOwlCarousel_stagePadding" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator40" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtOwlCarousel_stagePadding" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_nav" runat="server" ControlName="chkOwlCarousel_nav">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkOwlCarousel_nav" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_navRewind" runat="server" ControlName="chkOwlCarousel_navRewind">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkOwlCarousel_navRewind" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_dots" runat="server" ControlName="chkOwlCarousel_dots">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkOwlCarousel_dots" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_ShowTitle" runat="server" ControlName="chkOwlCarousel_ShowTitle"
                            ResourceKey="plShowTitle"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkOwlCarousel_ShowTitle" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_ShowSummary" runat="server" ControlName="chkOwlCarousel_ShowSummary"
                            ResourceKey="plShowSummary"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkOwlCarousel_ShowSummary" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label20" runat="server" resourcekey="Tip_OwlCarousel_ImageSize" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_imageSource" runat="server" ControlName="rblOwlCarousel_imageSource">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblOwlCarousel_imageSource" runat="server" RepeatColumns="2">
                            <asp:ListItem Value="thumbnail" resourcekey="li_OwlCarousel_imageSource_thumbnail" />
                            <asp:ListItem Value="original" resourcekey="li_OwlCarousel_imageSource_original" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_imageWidth" runat="server" ControlName="txtOwlCarousel_imageWidth"
                            ResourceKey="plImageWidth"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOwlCarousel_imageWidth" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_imageHeight" runat="server" ControlName="txtOwlCarousel_imageHeight"
                            ResourceKey="plImageHeight"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOwlCarousel_imageHeight" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_items" runat="server" ControlName="txtOwlCarousel_items">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOwlCarousel_items" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator37" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtOwlCarousel_items" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label16" runat="server" resourcekey="Tip_OwlCarousel_Responsive" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_responsive" runat="server" ControlName="chkOwlCarousel_responsive">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkOwlCarousel_responsive" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_items_480" runat="server" ControlName="txtOwlCarousel_items_480">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOwlCarousel_items_480" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator43" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtOwlCarousel_items_480" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_items_768" runat="server" ControlName="txtOwlCarousel_items_768">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOwlCarousel_items_768" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator44" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtOwlCarousel_items_768" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_items_980" runat="server" ControlName="txtOwlCarousel_items_980">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOwlCarousel_items_980" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator45" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtOwlCarousel_items_980" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_items_1200" runat="server" ControlName="txtOwlCarousel_items_1200">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOwlCarousel_items_1200" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator46" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtOwlCarousel_items_1200" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOwlCarousel_items_than1200" runat="server" ControlName="txtOwlCarousel_items_than1200">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOwlCarousel_items_than1200" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator47" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtOwlCarousel_items_than1200" />
                    </td>
                </tr>
            </table>

            <dnn:sectionhead ID="secRevolutionSlider" runat="server" Section="tblRevolutionSlider" ResourceKey="secRevolutionSlider"
                IncludeRule="True" IsExpanded="True" CssClass="SubHead"></dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" id="tblRevolutionSlider" runat="server" class="dnnFormItem"
                width="100%">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plRevolutionSlider_Delay" runat="server" ControlName="txtRevolutionSlider_Delay">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRevolutionSlider_Delay" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator55" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRevolutionSlider_Delay" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_startWidth" runat="server" ControlName="txtRevolutionSlider_startWidth">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRevolutionSlider_startWidth" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator56" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRevolutionSlider_startWidth" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_startHeight" runat="server" ControlName="txtRevolutionSlider_startHeight">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRevolutionSlider_startHeight" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator57" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRevolutionSlider_startHeight" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_onHoverStop" runat="server" ControlName="chkRevolutionSlider_onHoverStop">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkRevolutionSlider_onHoverStop" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_navigationType" runat="server" ControlName="cblRevolutionSlider_navigationType">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="cblRevolutionSlider_navigationType" runat="server" RepeatColumns="3">
                            <asp:ListItem Value="bullet" resourcekey="li_RevolutionSlider_navigationType_bullet" />
                            <asp:ListItem Value="thumb" resourcekey="li_RevolutionSlider_navigationType_thumb" />
                            <asp:ListItem Value="none" resourcekey="li_none" />
                            </asp:RadioButtonList>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_navigationArrows" runat="server" ControlName="cblRevolutionSlider_navigationArrows">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="cblRevolutionSlider_navigationArrows" runat="server" RepeatColumns="3">
                            <asp:ListItem Value="nexttobullets" resourcekey="li_RevolutionSlider_navigationArrows_nexttobullets" />
                            <asp:ListItem Value="solo" resourcekey="li_RevolutionSlider_navigationArrows_solo" />
                            <asp:ListItem Value="none" resourcekey="li_none" />
                            </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_navigationStyle" runat="server" ControlName="cblRevolutionSlider_navigationStyle">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="cblRevolutionSlider_navigationStyle" runat="server" RepeatColumns="3">
                            <asp:ListItem Value="round" resourcekey="li_RevolutionSlider_navigationStyle_round" />
                            <asp:ListItem Value="square" resourcekey="li_RevolutionSlider_navigationStyle_square" />
                            <asp:ListItem Value="navbar" resourcekey="li_RevolutionSlider_navigationStyle_navbar" />
                            </asp:RadioButtonList>
                    </td>
                </tr>
                 <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                 <tr>
                    <td colspan="2">
                        <asp:Label ID="Label23" runat="server" resourcekey="Tip_RevolutionSlider_Thumb" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_thumbWidth" runat="server" ControlName="txtRevolutionSlider_thumbWidth">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRevolutionSlider_thumbWidth" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator41" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRevolutionSlider_thumbWidth" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_thumbHeight" runat="server" ControlName="txtRevolutionSlider_thumbHeight">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRevolutionSlider_thumbHeight" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator58" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRevolutionSlider_thumbHeight" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_thumbAmount" runat="server" ControlName="txtRevolutionSlider_thumbAmount">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRevolutionSlider_thumbAmount" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator42" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRevolutionSlider_thumbAmount" />
                    </td>
                </tr>
                 <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_navigationHAlign" runat="server" ControlName="cblRevolutionSlider_navigationHAlign"/>
                        
                    </td>
                    <td>
                        <asp:RadioButtonList ID="cblRevolutionSlider_navigationHAlign" runat="server" RepeatColumns="3">
                            <asp:ListItem Value="left" resourcekey="li_left" />
                            <asp:ListItem Value="center" resourcekey="li_center" />
                            <asp:ListItem Value="right" resourcekey="li_right" />
                            </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_navigationHOffset" runat="server" ControlName="txtRevolutionSlider_navigationHOffset">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRevolutionSlider_navigationHOffset" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator59" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRevolutionSlider_navigationHOffset" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_navigationVAlign" runat="server" ControlName="cblRevolutionSlider_navigationVAlign"/>
                        
                    </td>
                    <td>
                        <asp:RadioButtonList ID="cblRevolutionSlider_navigationVAlign" runat="server" RepeatColumns="3">
                            <asp:ListItem Value="top" resourcekey="li_top" />
                            <asp:ListItem Value="center" resourcekey="li_center" />
                            <asp:ListItem Value="bottom" resourcekey="li_bottom" />
                            </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_navigationVOffset" runat="server" ControlName="txtRevolutionSlider_navigationVOffset">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRevolutionSlider_navigationVOffset" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator60" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRevolutionSlider_navigationVOffset" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_soloArrowLeftHAlign" runat="server" ControlName="cblRevolutionSlider_soloArrowLeftHAlign"/>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="cblRevolutionSlider_soloArrowLeftHAlign" runat="server" RepeatColumns="3">
                            <asp:ListItem Value="left" resourcekey="li_left" />
                            <asp:ListItem Value="center" resourcekey="li_center" />
                            <asp:ListItem Value="right" resourcekey="li_right" />
                            </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_soloArrowLeftHOffset" runat="server" ControlName="txtRevolutionSlider_soloArrowLeftHOffset">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRevolutionSlider_soloArrowLeftHOffset" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator61" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRevolutionSlider_soloArrowLeftHOffset" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_soloArrowLeftVAlign" runat="server" ControlName="cblRevolutionSlider_soloArrowLeftVAlign"/>
                        
                    </td>
                    <td>
                        <asp:RadioButtonList ID="cblRevolutionSlider_soloArrowLeftVAlign" runat="server" RepeatColumns="3">
                            <asp:ListItem Value="top" resourcekey="li_top" />
                            <asp:ListItem Value="center" resourcekey="li_center" />
                            <asp:ListItem Value="bottom" resourcekey="li_bottom" />
                            </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_soloArrowLeftVOffset" runat="server" ControlName="txtRevolutionSlider_soloArrowLeftVOffset">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRevolutionSlider_soloArrowLeftVOffset" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator62" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRevolutionSlider_soloArrowLeftVOffset" />
                    </td>
                </tr>
               
                <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_soloArrowRightHAlign" runat="server" ControlName="cblRevolutionSlider_soloArrowRightHAlign"/>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="cblRevolutionSlider_soloArrowRightHAlign" runat="server" RepeatColumns="3">
                            <asp:ListItem Value="left" resourcekey="li_left" />
                            <asp:ListItem Value="center" resourcekey="li_center" />
                            <asp:ListItem Value="right" resourcekey="li_right" />
                            </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_soloArrowRightHOffset" runat="server" ControlName="txtRevolutionSlider_soloArrowRightHOffset">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRevolutionSlider_soloArrowRightHOffset" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator63" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRevolutionSlider_soloArrowRightHOffset" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_soloArrowRightVAlign" runat="server" ControlName="cblRevolutionSlider_soloArrowRightVAlign"/>
                        
                    </td>
                    <td>
                        <asp:RadioButtonList ID="cblRevolutionSlider_soloArrowRightVAlign" runat="server" RepeatColumns="3">
                            <asp:ListItem Value="top" resourcekey="li_top" />
                            <asp:ListItem Value="center" resourcekey="li_center" />
                            <asp:ListItem Value="bottom" resourcekey="li_bottom" />
                            </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_soloArrowRightVOffset" runat="server" ControlName="txtRevolutionSlider_soloArrowRightVOffset">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRevolutionSlider_soloArrowRightVOffset" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator64" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRevolutionSlider_soloArrowRightVOffset" />
                    </td>
                </tr>
               
               <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_touchEnabled" runat="server" ControlName="chkRevolutionSlider_touchEnabled">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkRevolutionSlider_touchEnabled" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_stopAtSlide" runat="server" ControlName="txtRevolutionSlider_stopAtSlide">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRevolutionSlider_stopAtSlide" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator48" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="^-?\d+$" ControlToValidate="txtRevolutionSlider_stopAtSlide" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_stopAfterLoops" runat="server" ControlName="txtRevolutionSlider_stopAfterLoops">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRevolutionSlider_stopAfterLoops" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator65" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="^-?\d+$" ControlToValidate="txtRevolutionSlider_stopAfterLoops" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_hideCaptionAtLimit" runat="server" ControlName="txtRevolutionSlider_hideCaptionAtLimit">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRevolutionSlider_hideCaptionAtLimit" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator66" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="^-?\d+$" ControlToValidate="txtRevolutionSlider_hideCaptionAtLimit" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_hideAllCaptionAtLilmit" runat="server" ControlName="txtRevolutionSlider_hideAllCaptionAtLilmit">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRevolutionSlider_hideAllCaptionAtLilmit" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator67" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="^-?\d+$" ControlToValidate="txtRevolutionSlider_hideAllCaptionAtLilmit" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_hideSliderAtLimit" runat="server" ControlName="txtRevolutionSlider_hideSliderAtLimit">
                        </dnn:Label>
                    </td>
                    <td>
                         <asp:TextBox ID="txtRevolutionSlider_hideSliderAtLimit" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator68" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="^-?\d+$" ControlToValidate="txtRevolutionSlider_hideSliderAtLimit" />
                    </td>
                </tr>
               
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_fullWidth" runat="server" ControlName="chkRevolutionSlider_fullWidth">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkRevolutionSlider_fullWidth" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_ShowTitle" runat="server" ControlName="chkRevolutionSlider_ShowTitle"
                            ResourceKey="plShowTitle"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkRevolutionSlider_ShowTitle" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRevolutionSlider_ShowSummary" runat="server" ControlName="chkRevolutionSlider_ShowSummary"
                            ResourceKey="plShowSummary"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkRevolutionSlider_ShowSummary" runat="server" />
                    </td>
                </tr>
          </table>

              <dnn:sectionhead ID="secTransBanner" runat="server" Section="tblTransBanner" ResourceKey="secTransBanner"
                IncludeRule="True" IsExpanded="True" CssClass="SubHead"></dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" id="tblTransBanner" runat="server" class="dnnFormItem"
                width="100%">
            </table>

            <dnn:sectionhead id="secBootstrapCarousel" runat="server" section="tblBootstrapCarousel"
                resourcekey="secBootstrapCarousel" includerule="True" isexpanded="True" cssclass="SubHead"></dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" id="tblBootstrapCarousel" runat="server" class="dnnFormItem"
                width="100%">
                <tr>
                    <td style="width: 200px">
                        <dnn:label id="plBootstrapCarousel_Interval" runat="server" controlname="txtBootstrapCarousel_Interval"></dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBootstrapCarousel_Interval" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator32" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtBootstrapCarousel_Interval" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label11" runat="server" resourcekey="Tip_BootstrapCarousel_RefLibrary"
                            CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plBootstrapCarousel_RefLibrary" runat="server" controlname="chkBootstrapCarousel_RefLibrary">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkBootstrapCarousel_RefLibrary" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plBootstrapCarousel_ShowTitle" runat="server" controlname="chkBootstrapCarousel_ShowTitle">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkBootstrapCarousel_ShowTitle" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plBootstrapCarousel_ShowSummary" runat="server" controlname="chkBootstrapCarousel_ShowSummary">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkBootstrapCarousel_ShowSummary" runat="server" />
                    </td>
                </tr>
            </table>
            <dnn:sectionhead id="secSlidorion" runat="server" section="tblSlidorion" resourcekey="secSlidorion"
                includerule="True" isexpanded="True" cssclass="SubHead"></dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" id="tblSlidorion" runat="server" class="dnnFormItem"
                width="100%">
                <tr>
                    <td style="width: 200px">
                        <dnn:label id="plSlidorion_AutoPlay" runat="server" controlname="chkSlidorion_AutoPlay">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkSlidorion_AutoPlay" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plSlidorion_ContainerWidth" runat="server" controlname="txtSlidorion_ContainerWidth">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSlidorion_ContainerWidth" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator16" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtSlidorion_ContainerWidth" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plSlidorion_ContainerHeight" runat="server" controlname="txtSlidorion_ContainerHeight">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSlidorion_ContainerHeight" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator17" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtSlidorion_ContainerHeight" />
                    </td>
                </tr>
              
                <tr>
                    <td>
                        <dnn:label id="plSlidorion_Effect" runat="server" controlname="ddlSlidorion_Effect">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSlidorion_Effect" runat="server">
                            <asp:ListItem Value="random" resourcekey="li_Slidorion_Effect_random" />
                            <asp:ListItem Value="fade" resourcekey="li_Slidorion_Effect_fade" />
                            <asp:ListItem Value="slideLeft" resourcekey="li_Slidorion_Effect_slideLeft" />
                            <asp:ListItem Value="slideUp" resourcekey="li_Slidorion_Effect_slideUp" />
                            <asp:ListItem Value="slideRight" resourcekey="li_Slidorion_Effect_slideRight" />
                            <asp:ListItem Value="slideDown" resourcekey="li_Slidorion_Effect_slideDown" />
                            <asp:ListItem Value="overLeft" resourcekey="li_Slidorion_Effect_overLeft" />
                            <asp:ListItem Value="overRight" resourcekey="li_Slidorion_Effect_overRight" />
                            <asp:ListItem Value="overUp" resourcekey="li_Slidorion_Effect_overUp" />
                            <asp:ListItem Value="overDown" resourcekey="li_Slidorion_Effect_overDown" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plSlidorion_First" runat="server" controlname="txtSlidorion_First">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSlidorion_First" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator18" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtSlidorion_First" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plSlidorion_HoverPause" runat="server" controlname="chkSlidorion_HoverPause">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkSlidorion_HoverPause" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plSlidorion_Speed" runat="server" controlname="txtSlidorion_Speed">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSlidorion_Speed" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator19" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtSlidorion_Speed" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plSlidorion_Interval" runat="server" controlname="txtSlidorion_Interval">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSlidorion_Interval" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator20" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtSlidorion_Interval" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plSlidorion_ControlNav" runat="server" controlname="chkSlidorion_ControlNav">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkSlidorion_ControlNav" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label15" runat="server" resourcekey="Tip_Easing" CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plSlidorion_Easing" runat="server" controlname="ddlSlidorion_Easing">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSlidorion_Easing" runat="server">
                            <asp:ListItem Value="none" resourcekey="li_None" />
                            <asp:ListItem Value="linear" />
                            <asp:ListItem Value="swing" />
                            <asp:ListItem Value="easeInQuad" />
                            <asp:ListItem Value="easeOutQuad" />
                            <asp:ListItem Value="easeInOutQuad" />
                            <asp:ListItem Value="easeInCubic" />
                            <asp:ListItem Value="easeOutCubic" />
                            <asp:ListItem Value="easeInOutCubic" />
                            <asp:ListItem Value="easeInQuart" />
                            <asp:ListItem Value="easeOutQuart" />
                            <asp:ListItem Value="easeInOutQuart" />
                            <asp:ListItem Value="easeInQuint" />
                            <asp:ListItem Value="easeOutQuint" />
                            <asp:ListItem Value="easeInOutQuint" />
                            <asp:ListItem Value="easeInExpo" />
                            <asp:ListItem Value="easeOutExpo" />
                            <asp:ListItem Value="easeInOutExpo" />
                            <asp:ListItem Value="easeInSine" />
                            <asp:ListItem Value="easeOutSine" />
                            <asp:ListItem Value="easeInOutSine" />
                            <asp:ListItem Value="easeInCirc" />
                            <asp:ListItem Value="easeOutCirc" />
                            <asp:ListItem Value="easeInOutCirc" />
                            <asp:ListItem Value="easeInElastic" />
                            <asp:ListItem Value="easeOutElastic" />
                            <asp:ListItem Value="easeInOutElastic" />
                            <asp:ListItem Value="easeInBack" />
                            <asp:ListItem Value="easeOutBack" />
                            <asp:ListItem Value="easeInOutBack" />
                            <asp:ListItem Value="easeInBounce" />
                            <asp:ListItem Value="easeOutBounce" />
                            <asp:ListItem Value="easeInOutBounce" />
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <dnn:sectionhead id="secLiteAccordion" runat="server" section="tblLiteAccordion"
                resourcekey="secLiteAccordion" includerule="True" isexpanded="True" cssclass="SubHead">
            </dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" id="tblLiteAccordion" runat="server" class="dnnFormItem"
                width="100%">
                <tr>
                    <td style="width: 200px">
                        <dnn:label id="plLiteAccordion_Theme" runat="server" controlname="rblLiteAccordion_Theme">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblLiteAccordion_Theme" runat="server">
                            <asp:ListItem Value="basic" resourcekey="li_LiteAccordion_Theme_basic" />
                            <asp:ListItem Value="dark" resourcekey="li_LiteAccordion_Theme_dark" />
                            <asp:ListItem Value="light" resourcekey="li_LiteAccordion_Theme_light" />
                            <asp:ListItem Value="colorful" resourcekey="li_LiteAccordion_Theme_colorful" />
                            <asp:ListItem Value="stitch" resourcekey="li_LiteAccordion_Theme_stitch" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plLiteAccordion_AutoPlay" runat="server" controlname="chkLiteAccordion_AutoPlay">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkLiteAccordion_AutoPlay" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plLiteAccordion_ContainerWidth" runat="server" controlname="txtLiteAccordion_ContainerWidth">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLiteAccordion_ContainerWidth" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator10" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtLiteAccordion_ContainerWidth" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plLiteAccordion_ContainerHeight" runat="server" controlname="txtLiteAccordion_ContainerHeight">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLiteAccordion_ContainerHeight" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator12" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtLiteAccordion_ContainerHeight" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plLiteAccordion_HeaderWidth" runat="server" controlname="txtLiteAccordion_HeaderWidth">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLiteAccordion_HeaderWidth" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator13" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtLiteAccordion_HeaderWidth" />
                    </td>
                </tr>
                <%-- <tr>
                    <td>
                        <dnn:Label ID="plLiteAccordion_ImageWidth" runat="server" ControlName="txtLiteAccordion_ImageWidth">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLiteAccordion_ImageWidth" runat="server" ></asp:TextBox>
                    </td>
                </tr>--%>
                <tr>
                    <td>
                        <dnn:label id="plLiteAccordion_ActivateOn" runat="server" controlname="rblLiteAccordion_ActivateOn">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblLiteAccordion_ActivateOn" runat="server">
                            <asp:ListItem Value="click" Selected="True" resourcekey="li_LiteAccordion_ActivateOn_click" />
                            <asp:ListItem Value="mouseover" resourcekey="li_LiteAccordion_ActivateOn_mouseover" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plLiteAccordion_FirstSlide" runat="server" controlname="txtLiteAccordion_FirstSlide">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLiteAccordion_FirstSlide" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator11" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtLiteAccordion_FirstSlide" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plLiteAccordion_SlideSpeed" runat="server" controlname="txtLiteAccordion_SlideSpeed">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLiteAccordion_SlideSpeed" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator14" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtLiteAccordion_SlideSpeed" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label13" runat="server" resourcekey="Tip_LiteAccordion_ShowSummary"
                            CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plLiteAccordion_ShowSummary" runat="server" controlname="chkLiteAccordion_ShowSummary">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkLiteAccordion_ShowSummary" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plLiteAccordion_PauseOnHover" runat="server" controlname="chkLiteAccordion_PauseOnHover">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkLiteAccordion_PauseOnHover" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plLiteAccordion_CycleSpeed" runat="server" controlname="txtLiteAccordion_CycleSpeed">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLiteAccordion_CycleSpeed" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator15" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtLiteAccordion_CycleSpeed" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label14" runat="server" resourcekey="Tip_Easing" CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plLiteAccordion_Easing" runat="server" controlname="ddlLiteAccordion_Easing">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLiteAccordion_Easing" runat="server">
                            <asp:ListItem Value="none" resourcekey="li_None" />
                            <asp:ListItem Value="linear" />
                            <asp:ListItem Value="swing" />
                            <asp:ListItem Value="easeInQuad" />
                            <asp:ListItem Value="easeOutQuad" />
                            <asp:ListItem Value="easeInOutQuad" />
                            <asp:ListItem Value="easeInCubic" />
                            <asp:ListItem Value="easeOutCubic" />
                            <asp:ListItem Value="easeInOutCubic" />
                            <asp:ListItem Value="easeInQuart" />
                            <asp:ListItem Value="easeOutQuart" />
                            <asp:ListItem Value="easeInOutQuart" />
                            <asp:ListItem Value="easeInQuint" />
                            <asp:ListItem Value="easeOutQuint" />
                            <asp:ListItem Value="easeInOutQuint" />
                            <asp:ListItem Value="easeInExpo" />
                            <asp:ListItem Value="easeOutExpo" />
                            <asp:ListItem Value="easeInOutExpo" />
                            <asp:ListItem Value="easeInSine" />
                            <asp:ListItem Value="easeOutSine" />
                            <asp:ListItem Value="easeInOutSine" />
                            <asp:ListItem Value="easeInCirc" />
                            <asp:ListItem Value="easeOutCirc" />
                            <asp:ListItem Value="easeInOutCirc" />
                            <asp:ListItem Value="easeInElastic" />
                            <asp:ListItem Value="easeOutElastic" />
                            <asp:ListItem Value="easeInOutElastic" />
                            <asp:ListItem Value="easeInBack" />
                            <asp:ListItem Value="easeOutBack" />
                            <asp:ListItem Value="easeInOutBack" />
                            <asp:ListItem Value="easeInBounce" />
                            <asp:ListItem Value="easeOutBounce" />
                            <asp:ListItem Value="easeInOutBounce" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plLiteAccordion_Rounded" runat="server" controlname="chkLiteAccordion_Rounded">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkLiteAccordion_Rounded" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plLiteAccordion_EnumerateSlides" runat="server" controlname="chkLiteAccordion_EnumerateSlides">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkLiteAccordion_EnumerateSlides" />
                    </td>
                </tr>
            </table>
            <dnn:sectionhead id="secUnslider" runat="server" section="tblUnslider" resourcekey="secUnslider"
                includerule="True" isexpanded="True" cssclass="SubHead"></dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" id="tblUnslider" runat="server" class="dnnFormItem">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label10" runat="server" resourcekey="Tip_ModifyUnsliderCss" CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:label id="plUnslider_Speed" runat="server" controlname="txtUnslider_Speed">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUnslider_Speed" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator8" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtUnslider_Speed" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plUnslider_Delay" runat="server" controlname="txtUnslider_Delay">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUnslider_Delay" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator9" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtUnslider_Delay" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plUnslider_Keys" runat="server" controlname="chkUnslider_Keys"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkUnslider_Keys" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plUnslider_Dots" runat="server" controlname="chkUnslider_Dots"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkUnslider_Dots" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plUnslider_ShowImageOnly" runat="server" controlname="chkUnslider_ShowImageOnly">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkUnslider_ShowImageOnly" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label9" runat="server" resourcekey="Tip_Unslider_ShowImageAsBackground"
                            CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plUnslider_ShowImageAsBackground" runat="server" controlname="chkUnslider_ShowImageAsBackground">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkUnslider_ShowImageAsBackground" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plUnslider_BackgroundRepeat" runat="server" controlname="ddlUnslider_BackgroundRepeat">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlUnslider_BackgroundRepeat" runat="server">
                            <asp:ListItem Value="repeat" />
                            <asp:ListItem Value="repeat-x" />
                            <asp:ListItem Value="repeat-y" />
                            <asp:ListItem Value="no-repeat" />
                            <asp:ListItem Value="inherit" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plUnslider_ShowSummary" runat="server" controlname="chkUnslider_ShowSummary">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkUnslider_ShowSummary" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plUnslider_Fluid" runat="server" controlname="chkUnslider_Fluid">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkUnslider_Fluid" />
                    </td>
                </tr>
            </table>
            <dnn:sectionhead id="secFlow" runat="server" section="tblFlow" resourcekey="secFlow"
                includerule="True" isexpanded="True" cssclass="SubHead"></dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" id="tblFlow" runat="server" class="dnnFormItem">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label5" runat="server" resourcekey="Tip_Flow_GalleryStyle" CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:label id="plFlow_GalleryStyle" runat="server" controlname="txtFlow_GalleryStyle">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlow_GalleryStyle" runat="server"  TextMode="MultiLine"  Width="250px"
                            Rows="6"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_HeightReflection" runat="server" controlname="txtFlow_HeightReflection">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtFlow_HeightReflection"  />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label6" runat="server" resourcekey="Tip_Flow_HighSlideEffect" CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_HighSlideEffect" runat="server" controlname="chkFlow_HighSlideEffect">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkFlow_HighSlideEffect" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_PreloadImages" runat="server" controlname="chkFlow_PreloadImages">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkFlow_PreloadImages" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_StartAnimation" runat="server" controlname="chkFlow_StartAnimation">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkFlow_StartAnimation" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_Buttons" runat="server" controlname="chkFlow_Buttons"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkFlow_Buttons" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_AspectRatio" runat="server" controlname="txtFlow_AspectRatio">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlow_AspectRatio" runat="server" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_ScrollbarP" runat="server" controlname="txtFlow_ScrollbarP">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlow_ScrollbarP" runat="server" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_ImagesHeight" runat="server" controlname="txtFlow_ImagesHeight">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlow_ImagesHeight" runat="server" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_PercentOther" runat="server" controlname="txtFlow_PercentOther">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlow_PercentOther" runat="server" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_ImagesM" runat="server" controlname="txtFlow_ImagesM"></dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlow_ImagesM" runat="server" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_PercentLandscape" runat="server" controlname="txtFlow_PercentLandscape">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlow_PercentLandscape" runat="server" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_ImageWidth" runat="server" controlname="txtFlow_ImageWidth">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlow_ImageWidth" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtFlow_ImageWidth" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_ImageFocus" runat="server" controlname="txtFlow_ImageFocus">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlow_ImageFocus" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator30" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtFlow_ImageFocus" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_ImageFocusM" runat="server" controlname="txtFlow_ImageFocusM">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlow_ImageFocusM" runat="server" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_StartId" runat="server" controlname="txtFlow_StartId"></dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlow_StartId" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtFlow_StartId" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_ImagesCursor" runat="server" controlname="txtFlow_ImagesCursor">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlow_ImagesCursor" runat="server" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_Slider" runat="server" controlname="chkFlow_Slider"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkFlow_Slider" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_SliderWidth" runat="server" controlname="txtFlow_SliderWidth">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlow_SliderWidth" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtFlow_SliderWidth" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_SliderCursor" controlname="ddlFlow_SliderCursor" runat="server">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFlow_SliderCursor" runat="server">
                            <asp:ListItem Value="default" resourcekey="li_SliderCursor_Default">default</asp:ListItem>
                            <asp:ListItem Value="e-resize" resourcekey="li_SliderCursor_Resize">resize</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_XStep" runat="server" controlname="txtFlow_XStep"></dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlow_XStep" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator5" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtFlow_XStep" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_Captions" runat="server" controlname="chkFlow_Captions"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkFlow_Captions" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_AnimationSpeed" runat="server" controlname="txtFlow_AnimationSpeed">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlow_AnimationSpeed" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtFlow_AnimationSpeed" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_Circular" runat="server" controlname="chkFlow_Circular"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkFlow_Circular" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_Slideshow" runat="server" controlname="chkFlow_Slideshow">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkFlow_Slideshow" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_SlideshowSpeed" runat="server" controlname="txtFlow_SlideshowSpeed">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlow_SlideshowSpeed" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator6" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtFlow_SlideshowSpeed" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_SlideshowAutoplay" runat="server" controlname="chkFlow_SlideshowAutoplay">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkFlow_SlideshowAutoplay" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label8" runat="server" resourcekey="Tip_Flow_EnableReflection" CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_EnableReflection" runat="server" controlname="chkFlow_EnableReflection">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkFlow_EnableReflection" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_BackgroundRed" runat="server" controlname="txtFlow_BackgroundRed">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtFlow_BackgroundRed" Columns="6" />0-255
                        <asp:RangeValidator ID="RangeValidator1" runat="server" Type="Integer" MinimumValue="0"
                            MaximumValue="255" Text="Value must be 0 - 255" ControlToValidate="txtFlow_BackgroundRed"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_BackgroundGreen" runat="server" controlname="txtFlow_BackgroundGreen">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtFlow_BackgroundGreen" Columns="6" />0-255
                        <asp:RangeValidator ID="RangeValidator2" runat="server" Type="Integer" MinimumValue="0"
                            MaximumValue="255" Text="Value must be 0 - 255" ControlToValidate="txtFlow_BackgroundGreen"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plFlow_BackgroundBlack" runat="server" controlname="txtFlow_BackgroundBlack">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtFlow_BackgroundBlack" Columns="6" />0-255
                        <asp:RangeValidator ID="RangeValidator3" runat="server" Type="Integer" MinimumValue="0"
                            MaximumValue="255" Text="Value must be 0 - 255" ControlToValidate="txtFlow_BackgroundBlack"></asp:RangeValidator>
                    </td>
                </tr>
            </table>
             <dnn:sectionhead ID="secPgwGallery" runat="server" Section="tblPgwGallery"
                ResourceKey="secPgwGallery" IncludeRule="True" IsExpanded="True" CssClass="SubHead">
            </dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" id="tblPgwGallery" runat="server" class="dnnFormItem" width="100%">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plPgwGallery_mainClassName" runat="server" ControlName="txtPgwGallery_mainClassName">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPgwGallery_mainClassName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plPgwGallery_displayList" runat="server" ControlName="chkPgwGallery_displayList">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:checkbox ID="chkPgwGallery_displayList" runat="server"/>
                    </td>
                </tr>
               
                
                <tr>
                    <td>
                        <dnn:Label ID="plPgwGallery_transitionEffect" runat="server" ControlName="rblPgwGallery_transitionEffect">
                        </dnn:Label>
                    </td>
                    <td>
                         <asp:RadioButtonList ID="rblPgwGallery_transitionEffect" runat="server" RepeatColumns="2">
                         <asp:ListItem Value="sliding" ResourceKey="li_PgwSlider_transitionEffect_sliding" />
                            <asp:ListItem Value="fading" ResourceKey="li_PgwSlider_transitionEffect_fading"/>
                            
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label19" runat="server" resourcekey="Tip_PgwGallery_LimitHeight" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plPgwGallery_limitMaxHeight" runat="server" ControlName="chkPgwGallery_limitMaxHeight">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:checkbox ID="chkPgwGallery_limitMaxHeight" runat="server"/>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plPgwGallery_maxHeight" runat="server" ControlName="txtPgwGallery_maxHeight">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPgwGallery_maxHeight" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator33" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtPgwGallery_maxHeight" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <dnn:Label ID="plPgwGallery_autoSlide" runat="server" ControlName="chkPgwGallery_autoSlide">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:checkbox ID="chkPgwGallery_autoSlide" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plPgwGallery_displayControls" runat="server" ControlName="chkPgwGallery_displayControls">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:checkbox ID="chkPgwGallery_displayControls" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plPgwGallery_touchControls" runat="server" ControlName="chkPgwGallery_touchControls">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:checkbox ID="chkPgwGallery_touchControls" runat="server"/>
                    </td>
                </tr>
               
               
                 <tr>
                    <td>
                        <dnn:Label ID="plPgwGallery_adaptiveDuration" runat="server" ControlName="txtPgwGallery_adaptiveDuration">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPgwGallery_adaptiveDuration" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator34" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtPgwGallery_adaptiveDuration" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plPgwGallery_transitionDuration" runat="server" ControlName="txtPgwGallery_transitionDuration">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPgwGallery_transitionDuration" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator35" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtPgwGallery_transitionDuration" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plPgwGallery_intervalDuration" runat="server" ControlName="txtPgwGallery_intervalDuration">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPgwGallery_intervalDuration" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator36" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtPgwGallery_intervalDuration" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <dnn:Label ID="plPgwGallery_ShowTitle" runat="server" ControlName="chkPgwGallery_ShowTitle" ResourceKey="plShowTitle">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkPgwGallery_ShowTitle" runat="server" />
                    </td>
                </tr>
               
                 <tr>
                    <td>
                        <dnn:Label ID="plPgwGallery_ShowSummary" runat="server" ControlName="chkPgwGallery_ShowSummary" ResourceKey="plShowSummary">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkPgwGallery_ShowSummary" runat="server" />
                    </td>
                </tr>
            </table>

              <dnn:sectionhead ID="secPgwSlider" runat="server" Section="tblPgwSlider"
                ResourceKey="secPgwSlider" IncludeRule="True" IsExpanded="True" CssClass="SubHead">
            </dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" id="tblPgwSlider" runat="server" class="dnnFormItem" width="100%">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plPgwSlider_mainClassName" runat="server" ControlName="txtPgwSlider_mainClassName">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPgwSlider_mainClassName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plPgwSlider_displayList" runat="server" ControlName="chkPgwSlider_displayList">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:checkbox ID="chkPgwSlider_displayList" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plPgwSlider_listPosition" runat="server" ControlName="rblPgwSlider_listPosition">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblPgwSlider_listPosition" runat="server" RepeatColumns="2">
                            <asp:ListItem Value="right" ResourceKey="li_PgwSlider_listPosition_right"/>
                            <asp:ListItem Value="left" ResourceKey="li_PgwSlider_listPosition_left" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plPgwSlider_selectionMode" runat="server" ControlName="rblPgwSlider_selectionMode">
                        </dnn:Label>
                    </td>
                    <td>
                         <asp:RadioButtonList ID="rblPgwSlider_selectionMode" runat="server" RepeatColumns="2">
                            <asp:ListItem Value="click" ResourceKey="li_PgwSlider_selectionMode_click"/>
                            <asp:ListItem Value="mouseOver" ResourceKey="li_PgwSlider_selectionMode_mouseOver" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plPgwSlider_transitionEffect" runat="server" ControlName="rblPgwSlider_transitionEffect">
                        </dnn:Label>
                    </td>
                    <td>
                         <asp:RadioButtonList ID="rblPgwSlider_transitionEffect" runat="server" RepeatColumns="2">
                            <asp:ListItem Value="fading" ResourceKey="li_PgwSlider_transitionEffect_fading"/>
                            <asp:ListItem Value="sliding" ResourceKey="li_PgwSlider_transitionEffect_sliding" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label18" runat="server" resourcekey="Tip_PgwSlider_LimitHeight" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plPgwSlider_limitMaxHeight" runat="server" ControlName="chkPgwSlider_limitMaxHeight">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:checkbox ID="chkPgwSlider_limitMaxHeight" runat="server"/>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plPgwSlider_maxHeight" runat="server" ControlName="txtPgwSlider_maxHeight">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPgwSlider_maxHeight" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator27" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtPgwSlider_maxHeight" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <dnn:Label ID="plPgwSlider_autoSlide" runat="server" ControlName="chkPgwSlider_autoSlide">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:checkbox ID="chkPgwSlider_autoSlide" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plPgwSlider_displayControls" runat="server" ControlName="chkPgwSlider_displayControls">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:checkbox ID="chkPgwSlider_displayControls" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plPgwSlider_touchControls" runat="server" ControlName="chkPgwSlider_touchControls">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:checkbox ID="chkPgwSlider_touchControls" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plPgwSlider_verticalCentering" runat="server" ControlName="chkPgwSlider_verticalCentering">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:checkbox ID="chkPgwSlider_verticalCentering" runat="server"/>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plPgwSlider_adaptiveHeight" runat="server" ControlName="chkPgwSlider_adaptiveHeight">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:checkbox ID="chkPgwSlider_adaptiveHeight" runat="server"/>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plPgwSlider_adaptiveDuration" runat="server" ControlName="txtPgwSlider_adaptiveDuration">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPgwSlider_adaptiveDuration" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator28" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtPgwSlider_adaptiveDuration" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plPgwSlider_transitionDuration" runat="server" ControlName="txtPgwSlider_transitionDuration">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPgwSlider_transitionDuration" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator29" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtPgwSlider_transitionDuration" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plPgwSlider_intervalDuration" runat="server" ControlName="txtPgwSlider_intervalDuration">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPgwSlider_intervalDuration" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator31" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtPgwSlider_intervalDuration" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <dnn:Label ID="plPgwSlider_ShowTitle" runat="server" ControlName="chkPgwSlider_ShowTitle" ResourceKey="plShowTitle">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkPgwSlider_ShowTitle" runat="server" />
                    </td>
                </tr>
               
                 <tr>
                    <td>
                        <dnn:Label ID="plPgwSlider_ShowSummary" runat="server" ControlName="chkPgwSlider_ShowSummary" ResourceKey="plShowSummary">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkPgwSlider_ShowSummary" runat="server" />
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="wsFinish" runat="server" Title='<%# Localization.GetString("wsFinish", LocalResourceFile) %>'
            StepType="Finish">
            <h4>
                <asp:Label ID="lblFinish" runat="server" Text="Finish" resourcekey="lblFinish" Width="600px" /></h4>
            <hr />
            <asp:Label ID="lblFailure" runat="server" Visible="False" CssClass="normalred" Text="Submit Failure" />
        </asp:WizardStep>
    </WizardSteps>
    <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top"
        CssClass="Normal" />
    <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" CssClass="CommandButton" />
    <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em"
        ForeColor="White" HorizontalAlign="Left" />
</asp:Wizard>
