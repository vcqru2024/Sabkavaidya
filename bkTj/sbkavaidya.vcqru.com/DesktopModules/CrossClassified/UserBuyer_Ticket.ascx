﻿<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.UserBuyer_Ticket, App_Web_userbuyer_ticket.ascx.87459c53" %>
<%@ Register TagPrefix="cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<style type="text/css">
.CrossGrid th{
  text-align:center;
}
</style>

<table width="100%" class="dnnFormItem" cellpadding="0" cellspacing="0" border="0"
    runat="server" id="tblButton">
    <tr>
        <td id="td_Button_Search" runat="server">
            <asp:Label ID="lblStart" runat="server" resourcekey="lblStart" />
            <asp:TextBox ID="txtStart" MaxLength="10" Columns="10" runat="server" Width="120px" />
            <asp:HyperLink ID="hlStart" Text="Calendar" resourcekey="Calendar"
                runat="server" />
            <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="NormalRed"
                ControlToValidate="txtStart" resourcekey="Date.ErrorMessage" ErrorMessage="<br>You have entered an invalid date!"
                Display="Dynamic" Type="Date" Operator="DataTypeCheck" />&nbsp;&nbsp;
            <asp:Label ID="lblEnd" runat="server" resourcekey="lblEnd" />
            <asp:TextBox ID="txtEnd" MaxLength="10" Columns="10" runat="server" Width="120px" />
            <asp:HyperLink ID="hlEnd" Text="Calendar" resourcekey="Calendar"
                runat="server" />
            <asp:CompareValidator ID="CompareValidator2" runat="server" CssClass="NormalRed"
                ControlToValidate="txtEnd" resourcekey="Date.ErrorMessage" ErrorMessage="<br>You have entered an invalid date!"
                Display="Dynamic" Type="Date" Operator="DataTypeCheck" /><br />
            <asp:Label ID="lblTitle" runat="server" resourcekey="lblTitle" />
            <asp:TextBox ID="txtTitle" Columns="40" runat="server" Width="300px" /><br />
            <asp:Label ID="lblTicketId" runat="server" resourcekey="lblTicketId" />
            <asp:TextBox ID="txtTicketNo" Columns="40" runat="server" Width="200px" />
            <asp:Label ID="lblPageSize" runat="server" resourcekey="lblPageSize" />
            <asp:DropDownList ID="ddlPageSize" runat="server" Width="80px">
                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                <asp:ListItem Text="20" Value="20" Selected="True"></asp:ListItem>
                <asp:ListItem Text="30" Value="30"></asp:ListItem>
                <asp:ListItem Text="40" Value="40"></asp:ListItem>
                <asp:ListItem Text="50" Value="50"></asp:ListItem>
                <asp:ListItem Text="60" Value="60"></asp:ListItem>
                <asp:ListItem Text="70" Value="70"></asp:ListItem>
                <asp:ListItem Text="80" Value="80"></asp:ListItem>
                <asp:ListItem Text="90" Value="90"></asp:ListItem>
                <asp:ListItem Text="100" Value="100"></asp:ListItem>
                <asp:ListItem Text="200" Value="200"></asp:ListItem>
                <asp:ListItem Text="500" Value="500"></asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <dnn:CommandButton ID="btnSearch" runat="server" CausesValidation="false" ImageUrl="~/images/icon_search_16px.gif"
                ResourceKey="btnSearch" OnCommand="btnSearch_Click" />
        </td>
        <td align="right">
            <asp:Label ID="lblTicketDetail" runat="server" Visible="false" CssClass="SubHead" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnClose" runat="server" ResourceKey="btnClose" ImageUrl="~/images/lock.gif"
                OnCommand="btnClose_Click" Visible="false" CausesValidation="false" />
            <dnn:CommandButton ID="btnOpen" runat="server" ResourceKey="btnOpen" ImageUrl="~/images/login.gif"
                OnCommand="btnOpen_Click" Visible="false" CausesValidation="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnCancel" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                OnCommand="btnCancel_Click" Visible="false" CausesValidation="false" />
            &nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnMyAccount" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
</table>
<table align="center" width="100%" class="dnnFormItem" id="tblTicketList" runat="server">
    <tr>
        <td align="right">
            <asp:GridView ID="gvTicket" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="Id" OnRowCommand="gvTicket_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecords" Text='<%# Localization.GetString("NoRecords",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblTicketNo" runat="server" resourcekey="lblTicketNo"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTicketNoData" runat="server" Text='<%#Eval("TicketNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblTitle" runat="server" resourcekey="lblTitle1"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTitleData" runat="server" Text='<%#Eval("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblProductName" runat="server" resourcekey="lblProductName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlProductNameData" runat="server" Text='<%# Eval("ProductName") %>'
                                Target="_blank" NavigateUrl='<%#GetProductUrl(Convert.ToString(Eval("ProductId"))) %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblOptionName" runat="server" resourcekey="lblOptionName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblOptionNameData" runat="server" Text='<%#Eval("OptionName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblVendorName" runat="server" resourcekey="lblVendorName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblVendorNameData" runat="server" Text='<%#Eval("VendorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblUpdatedDate" runat="server" resourcekey="lblUpdatedDate"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUpdatedDateData" runat="server" Text='<%#Eval("UpdatedDate")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblClosed" runat="server" resourcekey="lblClosed"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkClosedData" runat="server" Checked='<%#Eval("Closed") %>' Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Select"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgEdit",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />
                          
                           <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif"
                                AlternateText='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
                 
                              <asp:ImageButton ID="imgViewUpload_Client" runat="server" CausesValidation="False" CommandName="ViewUpload_Client"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgViewUpload_Client",LocalResourceFile)%>'
                                ImageUrl="~/desktopmodules/crossclassified/images/up.gif" AlternateText='<%#Localization.GetString("imgViewUpload_Client",LocalResourceFile)%>'
                                Visible='<%#AllowUpload_Client(Convert.ToInt32(Eval("ProductId"))) %>' />

                             <asp:ImageButton ID="imgViewUpload_Vendor" runat="server" CausesValidation="False" CommandName="ViewUpload_Vendor"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgViewUpload_Vendor",LocalResourceFile)%>'
                                ImageUrl="~/desktopmodules/crossclassified/images/watch.png" AlternateText='<%#Localization.GetString("imgViewUpload_Vendor",LocalResourceFile)%>'
                                Visible='<%#AllowUpload_Vendor(Convert.ToInt32(Eval("ProductId"))) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" Wrap="true" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="CrossGrid"
                    Wrap="true" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" Wrap="true" />
                <EditRowStyle BackColor="#999999" Wrap="true" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr align="left" valign="top">
        <td>
            <cross:PagingControl ID="ctlPagingControl" runat="server" Mode="PostBack" OnPageChanged="ctlPagingControl_PageChanged">
            </cross:PagingControl>
        </td>
    </tr>
    <tr>
        <td>
            <div class="dnnTreeLegend" id="divLegend" runat="server">
                <h6>
                    <asp:Label ID="lblLegnedDetail" runat="server" resourcekey="lblLegend" /></h6>
                <div class="dtlItem">
                    <img alt="" id="Img1" runat="server" src="~~/images/edit.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblEdit" runat="server" Text='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;

                    <img alt="" id="Img9" runat="server" src="~/images/delete.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="litDel" runat="server" Text='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />
                    <br />


                    <img alt="" id="Img6" runat="server" src="~/desktopmodules/crossclassified/images/up.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="litUpload" runat="server" Text='<%#Localization.GetString("imgViewUpload_Client",LocalResourceFile)%>' />
                    <br />

                    <img alt="" id="Img7" runat="server" src="~/desktopmodules/crossclassified/images/watch.png" />&nbsp;=&nbsp;
                    <asp:Literal ID="litUpload_Vendor" runat="server" Text='<%#Localization.GetString("imgViewUpload_Vendor",LocalResourceFile)%>' />
                </div>
            </div>
        </td>
    </tr>
</table>
<table align="center" width="100%" class="dnnFormItem" id="tblTicketDetail_List"
    runat="server" visible="false">
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:DataList ID="dlDetail" runat="Server" Width="100%" BackColor="White" BorderColor="#E7E7FF"
                BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <blockquote>
                                    <asp:Image runat="server" Width="48" ID="imgUserGravatar" ImageUrl='<%#GetGravatarUrl(GetMail(Convert.ToString(Eval("UserId"))),"48") %>'
                                        ImageAlign="AbsMiddle"></asp:Image>
                                </blockquote>
                            </td>
                            <td>
                                <%# Eval("Description").ToString().Replace(Microsoft.VisualBasic.Constants.vbCrLf, "<br/>")%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <%# "By  " + Convert.ToString(DataBinder.Eval(Container.DataItem, "UserName"))%>
                                <%# "    on  "+DataBinder.Eval(Container.DataItem,"CreatedDate") %>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <AlternatingItemStyle BackColor="#F7F7F7" Wrap="true" />
                <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Wrap="true" />
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" Wrap="true" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            </asp:DataList>
        </td>
    </tr>
</table>
<table id="tblTicketDetail_Add" cellspacing="0" cellpadding="2" border="0" align="left"
    width="100%" class="dnnFormItem" visible="false" runat="server">
    <tr>
        <td valign="middle" style="width: 150px">
            <dnn:Label ID="plTicketDescription" runat="server" ControlName="txtDescription" />
        </td>
        <td>
            <asp:TextBox ID="txtTicketDescription" runat="server" Width="600px" TextMode="Multiline"
                Rows="15" />
            <asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTicketDescription"
                Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <dnn:CommandButton ID="btnCreateTicket" runat="server" ResourceKey="btnCreateTicket"
                ImageUrl="~/images/add.gif" OnCommand="btnCreateTicket_Click" />
        </td>
    </tr>
</table>

<table id="tblTicketDetail_Upload_Client" cellspacing="0" cellpadding="2" border="0" align="left"
    width="100%" class="dnnFormItem" visible="false" runat="server">
    <tr>
        <td>
            <asp:Label ID="lblUpload" runat="server" CssClass="SubHead" /><br /> <br />
             <asp:Label ID="lblUploadSummary" runat="server" />
            &nbsp; &nbsp; &nbsp; &nbsp;
             <asp:HyperLink ID="hlUpload_Unlimited" runat="server" Text='<%# Localization.GetString("hlUpload_Unlimited", LocalResourceFile) %>'
                Target="_blank" />&nbsp; &nbsp; &nbsp; &nbsp;
               <dnn:CommandButton ID="btnRefeshUpload" runat="server" ResourceKey="btnRefeshUpload" ImageUrl="~/desktopmodules/crossclassified/images/watch.png"
                OnCommand="btnRefeshUpload_Click"  CausesValidation="false" />
           
            <hr style="border: 1px dotted #999999; size: 1" />
          
            <asp:GridView ID="gvUploadList" runat="server" AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" GridLines="Both" BackColor="Gray"
                Width="100%" ForeColor="#333333" DataKeyNames="Id"
                OnRowCommand="gvUploadList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecordes" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblFileName" runat="server" resourcekey="lblFileName">FileName</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFileNameField" runat="server" Text='<%# Eval("FileName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblTitle" runat="server" resourcekey="lblUploadTitle"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTitleField" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblSize" runat="server" resourcekey="lblSize"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSizeField" runat="server"
                                Text='<%#Cross.Modules.CP_Product.Business.LocalUtils.FormatFileSize(Convert.ToString(Eval("FileSize"))) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate">Created Date</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCreatedDateField" runat="server" Text='<%#  Convert.ToDateTime(Eval("CreatedDate")).ToShortDateString() %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif"
                                AlternateText='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblDownload" runat="server" resourcekey="lblDownload" />
                        </HeaderTemplate>
                        <ItemTemplate>
                          <asp:HyperLink ID="hlDownload" runat="server" Text='<%# Localization.GetString("hlDownload", LocalResourceFile) %>'
                                Target="_blank" NavigateUrl='<%#GetUploadFileUrl(Convert.ToString(Eval("Id")),Cross.Modules.CP_Product.Business.LocalUtils.FileUploadFrom_Client) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="CrossGrid" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" HorizontalAlign="Left" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
            <br /> <br />
        </td>
    </tr>
   
    <tr>
        <td>
            <table id="tblUploadRule_1" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">

                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle1" runat="server" ResourceKey="lblUploadRuleTitle1" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle1" runat="server" Text="File 1" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize1" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize1" runat="server" Text="10" ReadOnly="true"></asp:TextBox>MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension1" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension1" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
               
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus1" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload1" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload1" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload1" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
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
            <table id="tblUploadRule_2" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle2" runat="server" ResourceKey="lblUploadRuleTitle2" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle2" runat="server" Text="File 2" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize2" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize2" runat="server" Text="20" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension2" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension2" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
              
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus2" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload2" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload2" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload2" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
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
            <table id="tblUploadRule_3" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">

                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle3" runat="server" ResourceKey="lblUploadRuleTitle3" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle3" runat="server" Text="File 3" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize3" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize3" runat="server" Text="30" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension3" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension3" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
               
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus3" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload3" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload3" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload3" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
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
            <table id="tblUploadRule_4" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle4" runat="server" ResourceKey="lblUploadRuleTitle4" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle4" runat="server" Text="File 4" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize4" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize4" runat="server" Text="40" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension4" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension4" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
               
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus4" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload4" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload4" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload4" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
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
            <table id="tblUploadRule_5" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle5" runat="server" ResourceKey="lblUploadRuleTitle5" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle5" runat="server" Text="File 5" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize5" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize5" runat="server" Text="50" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension5" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension5" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
               
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus5" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload5" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload5" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload5" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
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
            <table id="tblUploadRule_6" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle6" runat="server" ResourceKey="lblUploadRuleTitle6" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle6" runat="server" Text="File 6" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize6" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize6" runat="server" Text="60" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension6" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension6" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
               
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus6" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload6" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload6" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload6" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
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
            <table id="tblUploadRule_7" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">

                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle7" runat="server" ResourceKey="lblUploadRuleTitle7" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle7" runat="server" Text="File 7" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize7" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize7" runat="server" Text="70" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension7" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension7" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
               
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus7" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload7" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload7" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload7" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
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
            <table id="tblUploadRule_8" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle8" runat="server" ResourceKey="lblUploadRuleTitle8" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle8" runat="server" Text="File 8" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize8" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize8" runat="server" Text="80" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension8" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension8" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
               
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus8" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload8" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload8" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload8" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
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
            <table id="tblUploadRule_9" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle9" runat="server" ResourceKey="lblUploadRuleTitle9" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle9" runat="server" Text="File 9" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize9" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize9" runat="server" Text="90" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension9" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension9" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
               
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus9" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload9" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload9" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload9" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
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
            <table id="tblUploadRule_10" cellspacing="0" cellpadding="2" border="0" align="left"
                width="100%" class="dnnFormItem" visible="false" runat="server">
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="lblUploadRuleTitle10" runat="server" ResourceKey="lblUploadRuleTitle10" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadRuleTitle10" runat="server" Text="File 10" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadSize10" runat="server" ResourceKey="lblUploadSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadSize10" runat="server" Text="100" ReadOnly="true"></asp:TextBox>
                        MB
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadExtension10" runat="server" ResourceKey="lblUploadExtension" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUploadExtension10" runat="server" ReadOnly="true"></asp:TextBox>

                    </td>
                </tr>
               
                <tr>
                    <td>
                        <asp:Label ID="lblUploadStatus10" runat="server" ResourceKey="lblUploadStatus" />
                    </td>
                    <td>
                        <asp:Label ID="lblAlreadyUpload10" runat="server" ResourceKey="lblAlreadyUpload" ForeColor="Green" />
                        <asp:Label ID="lblNotUpload10" runat="server" ResourceKey="lblNotUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlUpload10" runat="server" Text='<%# Localization.GetString("hlUpload", LocalResourceFile) %>'
                      Target="_blank" />
                    </td>
                </tr>
              
            </table>
        </td>
    </tr>
</table>

<table id="tblTicketDetail_Upload_Vendor" cellspacing="0" cellpadding="2" border="0" align="left"
    width="100%" class="dnnFormItem" visible="false" runat="server">
    <tr>
        <td>
            <asp:Label ID="lblUpload_Vendor" runat="server" CssClass="SubHead"  ResourceKey="lblUpload_Vendor" />
            <hr style="border: 1px dotted #999999; size: 1" />
        
            <asp:GridView ID="gvUploadList_Vendor" runat="server" AutoGenerateColumns="False" CellPadding="1" CellSpacing="1" GridLines="Both" BackColor="Gray"
                Width="100%" ForeColor="#333333" DataKeyNames="Id">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecordes" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblFileName" runat="server" resourcekey="lblFileName">FileName</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFileNameField" runat="server" Text='<%# Eval("FileName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

               

                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblSize" runat="server" resourcekey="lblSize"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSizeField" runat="server"
                                Text='<%#Cross.Modules.CP_Product.Business.LocalUtils.FormatFileSize(Convert.ToString(Eval("FileSize"))) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate">Created Date</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCreatedDateField" runat="server" Text='<%#  Convert.ToDateTime(Eval("CreatedDate")).ToShortDateString() %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblDownload" runat="server" resourcekey="lblDownload" />
                        </HeaderTemplate>
                        <ItemTemplate>
                             <asp:HyperLink ID="hlDownload" runat="server" Text='<%# Localization.GetString("hlDownload", LocalResourceFile) %>'
                                Target="_blank" NavigateUrl='<%#GetUploadFileUrl(Convert.ToString(Eval("Id")),Cross.Modules.CP_Product.Business.LocalUtils.FileUploadFrom_Vendor) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="CrossGrid" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" HorizontalAlign="Left" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </td>
    </tr>
</table>