<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.UserGeneral_LocalFileUpload2, App_Web_usergeneral_localfileupload2.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnnweb" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<script type="text/javascript">
    var fileUpload;

    function getFileUpload() {
        if (typeof fileUpload === "undefined") {
            var fileUploadId = '<%= ctlUpload.ClientID %>';
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
    <tr>
        <td style="width: 200px">
            <asp:Label ID="lblFileSpace" runat="server"></asp:Label>
        </td>
        <td>
            <asp:HyperLink runat="server" ID="hlSwitchToSilverlight" ResourceKey="hlSwitchToSilverlight" Visible="<%#Settings_Portal.General.EnableSilverlightUpload%>" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlReturn" ResourceKey="hlReturn" />
        </td>
    </tr>
    <tr id="trHelp_UploadFileExtension" runat="server" visible="false">
        <td valign="top" align="left" style="width: 100%" colspan="2">
            <dnn:SectionHead ID="secHelp_UploadFileExtension" CssClass="SubHead" runat="server"
                Section="tblHelp_UploadFileExtension" align="left" ResourceKey="secHelp_UploadFileExtension"
                IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 100%;" align="left" border="0" cellpadding="5" cellspacing="1"
                runat="server" id="tblHelp_UploadFileExtension">
                <tr>
                    <td colspan="2" class="dnnFormMessage dnnFormInfo">
                        <asp:Label ID="lblHelp_UploadFileExtension" runat="server" resourcekey="lblHelp_UploadFileExtension"></asp:Label><br />
                        <asp:Image runat="server" ID="imgHelp_UploadFileExtension" ImageUrl="~/DesktopModules/CrossClassified/images/Help/UploadFileExtension.jpg" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblFileExtension" runat="server" Style="word-break: break-all" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblUploadTip" runat="server" resourcekey="lblUploadTip" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <br />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblStepUpload" runat="server" resourcekey="lblStepUpload"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="lbtnUploadFiles" runat="server" resourcekey="lbtnUploadFiles"
                CssClass="dnnSecondaryAction" OnClientClick="uploadFiles();return false;">
            </asp:LinkButton>
            <dnnweb:DnnFileUpload ID="ctlUpload" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <br />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblStepSynchronize" runat="server" resourcekey="lblStepSynchronize"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblFolder" runat="server" resourcekey="lblFolder"></asp:Label>
            <asp:DropDownList ID="ddlFolder" runat="server"  Width="300px"/>&nbsp;&nbsp;
            <asp:CheckBox ID="chkUnzip" runat="server" resourcekey="chkUnzip" TextAlign="Right" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnSynchronize" runat="server" ResourceKey="btnSynchronize"
                CssClass="dnnSecondaryAction" CausesValidation="false" ImageUrl="~/images/synchronize.gif"
                OnCommand="btnSynchronize_Click" />
        </td>
    </tr>
</table>
