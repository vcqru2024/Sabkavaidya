<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.UserGeneral_A3File, App_Web_usergeneral_a3file.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register Assembly="System.Web.Silverlight" Namespace="System.Web.UI.SilverlightControls"
    TagPrefix="asp" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnnweb" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>

<style type="text/css">
.CrossGrid th{
  text-align:center;
}
</style>


<script type="text/javascript">
    function CheckAll() {
        if ($(":checkbox[id*='chkAll']").prop("checked") == true) {
            $(":checkbox[id*='chkItem']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem']").prop("checked", false);
        }
    }
    var fileUpload;

    function getFileUpload() {
        if (typeof fileUpload === "undefined") {
            var fileUploadId = '<%= ctlDNNFileUpload.ClientID %>';
            fileUpload = dnn[fileUploadId];
        }
        return fileUpload;
    }

    function uploadFiles() {
        var options = {
            folderPath: '<%= TemporaryUploadFolderPath %>',
            folderPicker: {
                disabled: true,
                initialState: {
                    selectedItem: {
                        key: '<%= TemporaryUploadFolderId %>',
                        value: '<%= TemporaryUploadFolderName %>'
                    }
                }
            }
        };
        var instance = getFileUpload();
        instance.show(options);
        return false;
    }
</script>
<table width="100%" cellpadding="2" cellspacing="2" class="dnnFormItem">
    <tr runat="server" id="trInfo" valign="top">
        <td style="width: 200px">
            <asp:Label ID="lblFileSpace" runat="server"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblFolder" runat="server" resourcekey="lblFolder"></asp:Label>
            <asp:DropDownList ID="ddlFolder" runat="server" DataTextField="Name" DataValueField="Id" Width="200px"
                AutoPostBack="true" OnSelectedIndexChanged="ddlFolder_SelectedIndexChanged">
            </asp:DropDownList>
            <dnn:CommandButton ID="btnUpload" runat="server" ResourceKey="btnUpload" CausesValidation="false" Visible="<%#Settings_Portal.General.EnableSilverlightUpload%>"
                ImageUrl="~/images/add.gif" OnCommand="btnUpload_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;

            <dnn:CommandButton ID="btnUpload_Normal" runat="server" ResourceKey="btnUpload_Normal" CausesValidation="false"
                ImageUrl="~/DesktopModules/CrossClassified/Images/up.gif" OnCommand="btnUpload_Normal_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;

            <dnn:CommandButton ID="btnDeleteSelected" runat="server" ResourceKey="btnDeleteSelected"
                CausesValidation="false" ImageUrl="~/images/delete.gif" OnCommand="btnDeleteSelected_Click"
                OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItems",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnAdminHome" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
    <tr id="trHelp_UploadControl" runat="server" visible="false">
        <td valign="top" align="left" style="width: 100%" colspan="2">
            <dnn:SectionHead ID="secHelp_UploadControl" CssClass="SubHead" runat="server" Section="tblHelp_UploadControl"
                align="left" ResourceKey="secHelp_UploadControl" IncludeRule="True" IsExpanded="false">
            </dnn:SectionHead>
            <table style="width: 100%;" align="left" border="0" cellpadding="5" cellspacing="1"
                 runat="server" id="tblHelp_UploadControl">
                <tr>
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_UploadControl" runat="server" resourcekey="Help_SilverlightUploadControl"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr id="trHelp_UploadFileExtension" runat="server" visible="false">
        <td valign="top" align="left" style="width: 100%" colspan="2">
            <dnn:SectionHead ID="secHelp_UploadFileExtension" CssClass="SubHead" runat="server"
                Section="tblHelp_UploadFileExtension" align="left" ResourceKey="secHelp_UploadFileExtension"
                IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 100%;" align="left" border="0" cellpadding="5" cellspacing="1"
                class="dnnFormMessage dnnFormInfo" runat="server" id="tblHelp_UploadFileExtension">
                <tr>
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_UploadFileExtension" runat="server" resourcekey="lblHelp_UploadFileExtension"></asp:Label><br />
                        <asp:Image runat="server" ID="imgHelp_UploadFileExtension" ImageUrl="~/DesktopModules/CrossClassified/images/Help/UploadFileExtension.jpg" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr runat="server" id="trUpload" valign="top">
        <td colspan="2">
            <table style="width: 100%;" border="0" cellpadding="5" cellspacing="1" class="dnnFormItem">
                <tr>
                    <td>
                        <asp:Label ID="lblFileExtension" runat="server" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadTip" runat="server" resourcekey="lblUploadTip" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblStepUpload" runat="server" resourcekey="lblStepUpload"></asp:Label><br />
                        <asp:Silverlight ID="ctlUpload" runat="server" Height="400px" Source="~/DesktopModules/CrossClassified/Controls/FileUpload.xap"
                            MinimumVersion="2.0.31005.0" Width="600px">
                        </asp:Silverlight>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblStepSynchronize" runat="server" resourcekey="lblStepSynchronize"></asp:Label>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="chkUnzip" runat="server" resourcekey="chkUnzip" TextAlign="Right" />
                        <dnn:CommandButton ID="btnSynchronize" runat="server" ResourceKey="btnSynchronize"
                            CausesValidation="false" ImageUrl="~/images/synchronize.gif" OnCommand="btnSynchronize_Click" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblStepReturn" runat="server" resourcekey="lblStepReturn"></asp:Label><br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <dnn:CommandButton ID="btnReturn" runat="server" ResourceKey="cmdReturn" CausesValidation="false"
                            ImageUrl="~/images/cancel.gif" OnCommand="btnReturn_Click" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr runat="server" id="trUpload_Normal">
        <td colspan="2">
            <table style="width: 100%;" border="0" cellpadding="2" cellspacing="2" class="dnnFormItem">
                <tr>
                    <td>
                        <asp:Label ID="lblFileExtension_Normal" runat="server" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUploadTip_Normal" runat="server" resourcekey="lblUploadTip_Normal" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblStepUpload_Normal" runat="server" resourcekey="lblStepUpload_Normal"></asp:Label>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="lbtnUploadFiles" runat="server" resourcekey="lbtnUploadFiles"
                            CssClass="dnnSecondaryAction" OnClientClick="uploadFiles();return false;">
                        </asp:LinkButton>
                        <dnnweb:DnnFileUpload ID="ctlDNNFileUpload" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblStepSynchronize_Normal" runat="server" resourcekey="lblStepSynchronize"></asp:Label>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="chkUnzip_Normal" runat="server" resourcekey="chkUnzip" TextAlign="Right" />
                        <dnn:CommandButton ID="btnSynchronize_Normal" runat="server" ResourceKey="btnSynchronize"
                            CausesValidation="false" ImageUrl="~/images/synchronize.gif" OnCommand="btnSynchronize_Normal_Click" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblStepReturn_Normal" runat="server" resourcekey="lblStepReturn"></asp:Label><br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <dnn:CommandButton ID="btnReturn_Normal" runat="server" ResourceKey="cmdReturn" CausesValidation="false"
                            ImageUrl="~/images/cancel.gif" OnCommand="btnReturn_Normal_Click" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr runat="server" id="trList" valign="top">
        <td style="width: 200px">
            <asp:TreeView ID="tvFolder" runat="server" ImageSet="XPFileExplorer" NodeIndent="10"
                ExpandDepth="1" OnSelectedNodeChanged="tvFolder_SelectedNodeChanged">
                <ParentNodeStyle Font-Bold="False" />
                <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                    VerticalPadding="0px" />
                <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                    NodeSpacing="0px" VerticalPadding="2px" />
            </asp:TreeView>
        </td>
        <td>
            <table style="width: 100%;" border="0" cellpadding="1" cellspacing="1" class="dnnFormItem">
                <tr>
                    <td>
                        <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                            CellSpacing="1" GridLines="Both" BackColor="Gray" DataKeyNames="Id" ForeColor="#333333"
                            Width="100%" OnRowCommand="gvList_RowCommand">
                            <EmptyDataTemplate>
                                <asp:Label ID="lblNoRecores" Text='<%# Localization.GetString("NoRecords",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                                    runat="server"></asp:Label>
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:TemplateField HeaderText="Id" SortExpression="Id" Visible="false">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblId" runat="server" resourcekey="lblId"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblIdField" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <input type="checkbox" id="chkAll" runat="server" onclick="CheckAll()" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkItem" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FileName" SortExpression="FileName" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblFileName" runat="server" resourcekey="lblFileName"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hlFileNameField" runat="server" Text='<%# Eval("FileName") %>'
                                            NavigateUrl='<%# Eval("A3Url") %>' Target="_blank"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Size" SortExpression="Size" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblSize" runat="server" resourcekey="lblSize"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblSizeField" runat="server" Text='<%# Cross.Modules.CP_Product.Business.LocalUtils.FormatFileSize(Convert.ToString(Eval("Size"))) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="LastModifiedDate" SortExpression="LastModifiedDate"
                                    HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblLastModifiedDate" runat="server" resourcekey="lblLastModifiedDate"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblLastModifiedDateField" runat="server" Text='<%# Eval("LastModifiedDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Url" SortExpression="Url" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblUrl" runat="server" resourcekey="lblUrl"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblUrlField" runat="server" Text='<%# Eval("A3Url") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgDel" runat="server" AlternateText='<%#Localization.GetString("imgDel",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                            ToolTip='<%#Localization.GetString("imgDel",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                            CommandArgument='<%#Eval("Id") %>' CausesValidation="False" CommandName="Del"
                                            ImageUrl="~/images/delete.gif" OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"  CssClass="CrossGrid"/>
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <RowStyle BackColor="#EFF3FB" ForeColor="#333333" />
                            <EditRowStyle BackColor="#999999" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <hr style="border: 1px dotted #999999; size: 1" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <cross:PagingControl ID="ctlPagingControl" runat="server" Mode="PostBack" OnPageChanged="ctlPagingControl_PageChanged" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
