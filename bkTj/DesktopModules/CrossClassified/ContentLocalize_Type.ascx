<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.ContentLocalize_Type, App_Web_contentlocalize_type.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<script type="text/javascript">
    $(function () {
        var showTabs = '<%=ShowTabs%>';

        //only display jquery tabs when currently have more than 1 tabs to show
        if (showTabs.toLowerCase() == "true") {
            $("#tabs").tabs();
            $("#tabs").tabs(
         {
             activate: function (event, ui) {
                 //Get or set the active option, after initialization:
                 var currentActive = $("#tabs").tabs("option", "active");
                 //set it to a hidden field
                 $("#<%= hidLastTab.ClientID %>").attr("value", currentActive.toString());
             }
         });

            var currTab = $("#<%= hidLastTab.ClientID %>").val();
            if (!isNaN(parseInt(currTab)))//if current value is number, then parse it as integer
            {
                currTab = parseInt(currTab);
            }

            $("#tabs").tabs({ active: currTab });
        }
    });
</script>
<asp:HiddenField runat="server" ID="hidLastTab" Value="0" />
<table width="100%" class="dnnFormItem" runat="server" id="tblButton">
    
    <tr>
        <td align="center">
            <asp:Label ID="lblSelectTargetLanguage" runat="server" resourcekey="lblSelectTargetLanguage" />
            <asp:DropDownList ID="ddlTargetLanguage" runat="server" Width="300px" AutoPostBack="True" 
            OnSelectedIndexChanged="ddlTargetLanguage_SelectedIndexChanged"/>
         <asp:Image ID="imgTargetLanguage" runat="server" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <dnn:CommandButton ID="btnUpdate" runat="server" ResourceKey="cmdUpdate" ImageUrl="~/images/save.gif"
                OnCommand="btnUpdate_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a onclick="window.opener=null" href="javascript:window.close()">
                <img alt="" id="Img10" runat="server" src="~/DesktopModules/CrossClassified/images/delete.gif" />
                <asp:Label ID="lblClosePage" runat="server" ResourceKey="lblClosePage" />
            </a>
        </td>
    </tr>
</table>
<div id="divTypeDetail" runat="server">
    <%--<div class="dnnFormItem dnnFormHelp dnnClear">
        <p align="right">
            <span>
                <asp:Image ID="Image7" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" />
                <%=LocalizeString("RequiredFields")%>
            </span>
        </p>
    </div>--%>
    <div id="tabs" style="width: 100%; overflow: hidden">
        <ul>
            <%if (ShowTabs == true)
              { %>
            <li><a href="#divBasic"><span>
                <%#Localization.GetString("divBasic", LocalResourceFile)%></span></a> </li>
            <%} %>


            <%if (objTargetType.EnableField1 == true)
              { %>
            <li><a href="#divField1"><span>
                <%#Localization.GetString("divSpecification_1", LocalResourceFile)%></span></a>
            </li>
            <%} %>

            <%if (objTargetType.EnableField2 == true)
              { %>
            <li><a href="#divField2"><span>
                <%#Localization.GetString("divSpecification_2", LocalResourceFile)%></span></a>
            </li>
             <%} %>

              <%if (objTargetType.EnableField3 == true)
              { %>
            <li><a href="#divField3"><span>
                <%#Localization.GetString("divSpecification_3", LocalResourceFile)%></span></a>
            </li>
             <%} %>
             <%if (objTargetType.EnableField4 == true)
              { %>
            <li><a href="#divField4"><span>
                <%#Localization.GetString("divSpecification_4", LocalResourceFile)%></span></a>
            </li>
             <%} %>

             <%if (objTargetType.EnableField5 == true)
              { %>
            <li><a href="#divField5"><span>
                <%#Localization.GetString("divSpecification_5", LocalResourceFile)%></span></a>
            </li>
             <%} %>
        </ul>
        <div id="divBasic" class="dnnFormItem" style="height: 100%">
            <table cellspacing="2" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label16" runat="server" resourcekey="Tip_ContentLocalize" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 300px">
                        <asp:Label ID="lblName" runat="server" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" Columns="70"></asp:TextBox>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="valNameRequired" runat="server" ControlToValidate="txtName"
                            ForeColor="Red" Display="Dynamic" resourcekey="Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label7" runat="server" resourcekey="Tip_ListPage" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblListPage" runat="server" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlListPage"
                            runat="server" />

                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label8" runat="server" resourcekey="Tip_DetailPage" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDetailPage" runat="server" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDetailPage" runat="server" />

                    </td>
                </tr>
                 <tr>
                    <td colspan="2">
                        <asp:Label ID="lbl_VendorProfilePage" runat="server" resourcekey="Tip_VendorProfilePage" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblVendorProfilePage" runat="server" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlVendorProfilePage" runat="server" />

                    </td>
                </tr>
            </table>
        </div>

          <%if (objTargetType.EnableField1 == true)
            { %>
        <div id="divField1" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label9" runat="server" resourcekey="Tip_ExtendField" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
               
                <tr>
                    <td style="width: 200px">
                        <asp:Label ID="lblField1Title" runat="server">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtField1Title" runat="server" Columns="70" Text="Specification_1"></asp:TextBox>
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Label ID="lblField1Default" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr style="border: 1px dotted #999999; size: 1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField1Default" Width="100%" Height="400px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
          <%if (objTargetType.EnableField2 == true)
              { %>
        <div id="divField2" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label10" runat="server" resourcekey="Tip_ExtendField" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <asp:Label ID="lblField2Title" runat="server">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtField2Title" runat="server" Columns="40" Text="Specification_2"></asp:TextBox>
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="left">
                        <br />
                        <asp:Label ID="lblField2Default" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr style="border: 1px dotted #999999; size: 1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField2Default" Width="100%" Height="400px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>

          <%if (objTargetType.EnableField3 == true)
              { %>
        <div id="divField3" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label11" runat="server" resourcekey="Tip_ExtendField" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <asp:Label ID="lblField3Title" runat="server">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtField3Title" runat="server" Columns="40" Text="Specification_3"></asp:TextBox>
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Label ID="lblField3Default" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr style="border: 1px dotted #999999; size: 1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField3Default" Width="100%" Height="400px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>

          <%if (objTargetType.EnableField4 == true)
              { %>
        <div id="divField4" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label12" runat="server" resourcekey="Tip_ExtendField" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                
                <tr>
                    <td style="width: 200px">
                        <asp:Label ID="lblField4Title" runat="server">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtField4Title" runat="server" Columns="40" Text="Specification_4"></asp:TextBox>
                        <asp:Image ID="Image5" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="left">
                        <br />
                        <asp:Label ID="lblField4Default" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr style="border: 1px dotted #999999; size: 1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField4Default" Width="100%" Height="400px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
          <%if (objTargetType.EnableField5 == true)
              { %>
        <div id="divField5" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label13" runat="server" resourcekey="Tip_ExtendField" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                
                <tr>
                    <td style="width: 200px">
                        <asp:Label ID="lblField5Title" runat="server"/>
                       
                    </td>
                    <td>
                        <asp:TextBox ID="txtField5Title" runat="server" Columns="40" Text="Specification_5"/>
                        <asp:Image ID="Image6" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Label ID="lblField5Default" runat="server" ResourceKey="lblFieldDefault" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr style="border: 1px dotted #999999; size: 1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField5Default" Width="100%" Height="400px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
    </div>
</div>
