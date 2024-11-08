<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FirstPage.ascx.cs" Inherits="puresystems.Modules.ContentPro.FirstPage" %>
<%@ Register TagPrefix="dnn" TagName="FilePickerUploader" Src="~/controls/filepickeruploader.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<%@ Register TagPrefix="dnn" TagName="UrlControl" Src="~/controls/URLControl.ascx" %>


<asp:HiddenField ID="hdnFieldSetId" runat="server" />
<asp:HiddenField ID="hdnType" runat="server" />
<asp:HiddenField ID="hdnPass" runat="server" />
<asp:HiddenField ID="hdnFieldSetName" runat="server" />

<div id="pnlStepOne" runat="server" class="psform-horizontal pspanel pspanel-default psAdmin">
    <div class="pspanel-heading"><%=LocalizeString("WelcomeTitle")%></div>
    <dnn:TextEditor ID="FixEditor" runat="server" Height="500" Width="430" Visible="false" />
    <div class="pspanel-body">
        <div class="row">
            <div class="col-xs-12">
                <p class="psalert psalert-warning" style="margin: 20px 0 30px 0; font-weight: bold;"><%=LocalizeString("WelcomeText1")%></p>
            </div>
        </div>
        <div>
            <ul class="pslist-group" style="margin-left: 0;">
                <li class="pslist-group-item">
                    <asp:LinkButton ID="BBlog" runat="server" CssClass="psbtn psbtn-primary psbtn-medium pspull-right" OnClick="BBlog_Click" />
                    <h4 class="pslist-group-item-heading"><%=LocalizeString("Bloglbl")%></h4>
                    <p class="pslist-group-item-text pstext-muted"><%=LocalizeString("lblBlogIntro")%></p>
                </li>

                <li class="pslist-group-item">
                    <asp:LinkButton ID="BArticle" runat="server" CssClass="psbtn psbtn-primary psbtn-medium pspull-right" OnClick="BArticle_Click" />
                    <h4 class="pslist-group-item-heading"><%=LocalizeString("Articlelbl")%></h4>
                    <p class="pslist-group-item-text pstext-muted"><%=LocalizeString("lblArticleIntro")%></p>
                </li>

                <li class="pslist-group-item">
                    <asp:LinkButton ID="btnGallery" runat="server" CssClass="psbtn psbtn-primary psbtn-medium pspull-right" OnClick="btnGallery_Click" resourcekey="btnGallery.Text" ToolTip='<%#LocalizeString("lblGo")%>' />
                    <h4 class="pslist-group-item-heading"><%=LocalizeString("lblGallery")%></h4>
                    <p class="pslist-group-item-text pstext-muted"><%=LocalizeString("lblGalleryIntro")%></p>
                </li>

                <li class="pslist-group-item">
                    <asp:LinkButton ID="btnSimpleSlider" runat="server" CssClass="psbtn psbtn-primary psbtn-medium pspull-right" OnClick="btnSimpleSlider_Click" resourcekey="btnSimpleSlder.Text" ToolTip='<%#LocalizeString("lblGo")%>' />
                    <h4 class="pslist-group-item-heading"><%=LocalizeString("lblSimpleSlider")%></h4>
                    <p class="pslist-group-item-text pstext-muted"><%=LocalizeString("lblSimpleSliderIntro")%></p>
                </li>

            </ul>
        </div>

        <table class="pstable pstable-bordered" runat="server" visible="false">
            <tbody>
                <tr runat="server" visible="false">
                    <td>
                        <asp:Label ID="Newslbl" CssClass="pslabel" runat="server" AssociatedControlID="BNews"></asp:Label></td>
                    <td>
                        <asp:LinkButton ID="BNews" runat="server" CssClass="psbtn psbtn-primary" OnClick="BNews_Click" /></td>
                </tr>
                <tr runat="server" visible="false">
                    <td>
                        <asp:Label ID="Eventlbl" CssClass="pslabel" runat="server" AssociatedControlID="BEvent"></asp:Label></td>
                    <td>
                        <asp:LinkButton ID="BEvent" runat="server" CssClass="psbtn psbtn-primary" OnClick="BEvent_Click" /></td>
                </tr>
                <tr runat="server" visible="false">
                    <td>
                        <asp:Label ID="FPImportlbl" CssClass="pslabel" runat="server" AssociatedControlID="FPImport"></asp:Label></td>
                    <td>
                        <asp:LinkButton ID="FPImport" runat="server" CssClass="psbtn psbtn-primary" OnClick="FPImport_Click" /></td>
                </tr>
            </tbody>
        </table>
        <div class="row" style="margin-bottom: 30px;">
            <div class="col-xs-12">
                <div><%=LocalizeString("WelcomeText3")%></div>
            </div>
        </div>
        <div class="row" style="margin-bottom: 30px;">
            <div class="col-xs-12">
                <asp:LinkButton ID="BDisplaySetttings" runat="server" CssClass="psbtn psbtn-info" resourcekey="BDisplaySetttings.Text" OnClick="BDisplaySetttings_Click" />
                <asp:LinkButton ID="btnCancel" runat="server" CssClass="psbtn psbtn-default" resourcekey="btnCancel.Text" OnClick="btnCancel_Click" />
            </div>
        </div>
    </div>
</div>
<!-- FirstTime -->
<div id="pnlStepFieldSet" runat="server" class="Normal configPanel pspanel pspanel-default psAdmin">
    <div class="pspanel-heading"><%=LocalizeString("WelcomeTitle")%></div>
    <div class="pspanel-body">
        <div class="form-group">
            <asp:Label ID="CreatinFSlbl" runat="server"></asp:Label>
        </div>
        <asp:HiddenField ID="H_Type" runat="server" />

        <div class="form-group">
            <asp:Label ID="NameFSlbl" CssClass="" runat="server" AssociatedControlID="txtFieldSetName"></asp:Label>
            <asp:TextBox ID="txtFieldSetName" runat="server" CssClass="psform-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="valFieldSetName" runat="server" resourcekey="valRequired.Text" ValidationGroup="FieldSetName" ControlToValidate="txtFieldSetName" Display="Dynamic" CssClass="fieldReq"></asp:RequiredFieldValidator>
        </div>

        <asp:LinkButton ID="BNextFieldSet" runat="server" CssClass="psbtn psbtn-primary" OnClick="BNextFieldSet_Click" CausesValidation="true" ValidationGroup="FieldSetName" />
    </div>
</div>
<!-- Div FieldSet -->
<div id="pnlStepCategories" runat="server" class="Normal configPanel form-horizontal pspanel pspanel-default psAdmin">
    <div class="pspanel-heading"><%=LocalizeString("WelcomeTitle")%></div>
    <div class="pspanel-body">
        <div class="form-group">
            <div class="col-xs-12">
                <asp:Label ID="CatFSlbl" CssClass="pslabel" runat="server"></asp:Label>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-2   rdo-colors">
                <asp:RadioButtonList ID="RBCat" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" >
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="col-xs-10">
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-2">
                <asp:Label ID="FirstCatNamelbl" CssClass="pslabel" AssociatedControlID="txtCategoryName" runat="server"></asp:Label>
            </div>
            <div class="col-xs-10">
                <asp:TextBox ID="txtCategoryName" runat="server" CssClass="psform-control"></asp:TextBox>
            </div>
            <asp:HiddenField ID="H_FSet" runat="server" />
        </div>
        <div class="form-group">
            <div class="col-xs-2">
                <asp:Label ID="FirstParentlbl" CssClass="pslabel" runat="server" AssociatedControlID="DDAddCategory"></asp:Label>
            </div>
            <div class="col-xs-10">
                <asp:DropDownList ID="DDAddCategory" runat="server" CssClass="psform-control"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-12">
                <asp:LinkButton ID="BAddCategory" runat="server" CssClass="psbtn psbtn-default" OnClick="BAddCategory_Click" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-12">
                <asp:LinkButton ID="BNextCategories" runat="server" CssClass="psbtn psbtn-primary" OnClick="BNextCategories_Click" />
            </div>
        </div>
    </div>
</div>
<!-- Div Categories -->
<div id="pnlStepAddArt" runat="server" class="Normal configPanel form-horizontal pspanel pspanel-default psAdmin">
    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("FieldSetID")%>' />
    <asp:HiddenField ID="H_ModuleID" runat="server" />
    <div class="pspanel-heading"><%=LocalizeString("WelcomeTitle")%></div>
    <div class="pspanel-body">

        <%--<div class="form-group">
            <div class="col-xs-12">
                <asp:LinkButton ID="AddArticle" runat="server" text='<%=LocalizeString("AddArticle")%>' CssClass="psbtn psbtn-default" OnClick="AddArticle_Click" />
            </div>
        </div>--%>
        <div class="form-group">
            <div class="col-xs-12">
                <p><%=LocalizeString("FirstPageNextDisplayOptions")%></p>
                <asp:LinkButton ID="BNextShow" runat="server" CssClass="psbtn psbtn-primary" OnClick="BNextShow_Click" />
            </div>
        </div>
    </div>
</div>
<!-- Div Articles -->
<div id="pnlStepShow" runat="server" class="Normal configPanel form-horizontal pspanel pspanel-default psAdmin">
    <div class="pspanel-heading"><%=LocalizeString("WelcomeTitle")%></div>
    <div class="pspanel-body">
        <div class="form-group">
            <div class="col-xs-12">
                <asp:Label ID="Modelbl" CssClass="pslabel" runat="server"></asp:Label>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-2">
                <asp:RadioButtonList ID="RBListArt" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RBListArt_SelectedIndexChanged" RepeatDirection="Horizontal">
                    <asp:ListItem>List</asp:ListItem>
                    <asp:ListItem>Article</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="col-xs-10">
            </div>
        </div>
        <asp:HiddenField ID="H_Name" runat="server" />
        <div class="form-group">
            <div class="col-xs-2">
                <asp:Label ID="selectTemplatelbl" CssClass="pslabel" AssociatedControlID="DDTemplate" runat="server"></asp:Label>
            </div>
            <div class="col-xs-2">
                <asp:DropDownList ID="DDTemplate" runat="server" CssClass="psform-control"></asp:DropDownList>
            </div>
            <div class="col-xs-8">
                <asp:LinkButton ID="BSelectTemplate" runat="server" CssClass="psbtn psbtn-default" OnClick="BSelectTemplate_Click" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-2">
                <asp:Label ID="SelectTempListlbl" CssClass="pslabel" AssociatedControlID="DDTemplateList" runat="server"></asp:Label>
            </div>
            <div class="col-xs-10">
                <asp:DropDownList ID="DDTemplateList" runat="server" CssClass="psform-control"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-3">
                <asp:Label ID="TreeOnelbl" CssClass="pslabel" runat="server"></asp:Label>
            </div>
            <div class="col-xs-9">
                <asp:Label ID="TreeAlllbl" CssClass="pslabel" runat="server"></asp:Label>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-2">
                <asp:Label ID="SelectSamePage" CssClass="pslabel" AssociatedControlID="SamePage" runat="server"></asp:Label>
            </div>
            <div class="col-xs-2">
                <asp:CheckBox ID="SamePage" runat="server" TextAlign="Left" AutoPostBack="True" OnCheckedChanged="SamePage_CheckedChanged" />
            </div>
            <div class="col-xs-8">
                <asp:CheckBox ID="OtherPage" runat="server" TextAlign="Left" AutoPostBack="True" OnCheckedChanged="OtherPage_CheckedChanged" />
            </div>
        </div>
        <br />
        <div class="form-group">
            <div class="col-xs-2">
                <asp:Label ID="SelectTabID" CssClass="pslabel" AssociatedControlID="TabID" runat="server"></asp:Label>
                <asp:HiddenField ID="H_TabID" runat="server" />
            </div>
            <div class="col-xs-10">
                <dnn:UrlControl ID="TabID" runat="server" ShowFiles="false" ShowNone="false" ShowTabs="true" ShowUrls="false" ShowLog="false" ShowTrack="false" Required="false" ShowUpLoad="false" ShowNewWindow="false" ShowImages="false" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-2">
                <asp:Label ID="SelectArticlelbl" CssClass="pslabel" AssociatedControlID="DDSelectArticle" runat="server"></asp:Label>
            </div>
            <div class="col-xs-10">
                <asp:DropDownList ID="DDSelectArticle" runat="server" CssClass="psform-control"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-12">
                <asp:LinkButton ID="BFinish" runat="server" CssClass="psbtn psbtn-default" OnClick="BFinish_Click" />
            </div>
        </div>
    </div>
</div>
<!-- Div Show -->

<script>
    var prm = Sys.WebForms.PageRequestManager.getInstance();

    // prm.add_endRequest(function () {
    // re-bind your jQuery events here

    //   $('#txtDateStart.ClientID').datetimepicker({
    //      formatTime: 'H:i',
    //      formatDate: 'd.m.Y'


    // });

    //  $('#txtDateEnd.ClientID %>').datetimepicker({
    //      formatTime: 'H:i',
    //       formatDate: 'd.m.Y'
    //    });

    // });
</script>
