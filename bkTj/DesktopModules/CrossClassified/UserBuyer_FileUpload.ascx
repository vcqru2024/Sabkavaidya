<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.UserBuyer_FileUpload, App_Web_userbuyer_fileupload.ascx.87459c53" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnnweb" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>

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
        <td align="center">
            <a onclick="window.opener=null" href="javascript:window.close()">
                <img alt="" id="Img10" runat="server" src="~/DesktopModules/CrossClassified/images/delete.gif" />
                <asp:Label ID="lblClosePage" runat="server" ResourceKey="lblClosePage" />
            </a>
        </td>
    </tr>

    <tr>
        <td>
            <asp:Label ID="lblUploadTip" runat="server" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td>
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
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblStepSynchronize" runat="server" resourcekey="lblStepSynchronize"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <dnn:CommandButton ID="btnSynchronize" runat="server" ResourceKey="btnSynchronize"
                CssClass="dnnSecondaryAction" CausesValidation="false" ImageUrl="~/images/synchronize.gif"
                OnCommand="btnSynchronize_Click" />
        </td>
    </tr>
</table>
