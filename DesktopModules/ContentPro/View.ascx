<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="puresystems.Modules.ContentPro.View" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="UrlControl" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>

<asp:LinkButton ID="BAddArtEditMode" runat="server" CssClass="psflatbutton" OnClick="BAddArtEditMode_Click" />
<div id="pnlStepOne" runat="server">
    <div class="row">
        <div class="col-xs-12">
            <asp:LinkButton ID="BConfig" runat="server" CssClass="psflatbutton" OnClick="BConfig_Click" />
        </div>
    </div>
</div>
<div id="pnlStepNormal" runat="server">

    <asp:PlaceHolder ID="PH_Content" runat="server"></asp:PlaceHolder>
    <div id="pnlComments" class="CommentText" runat="server">
        <div class="row">
            <div class="col-xs-12">
                <div class="discuss">
                    <h2><%=LocalizeString("CommentslblHeader")%></h2>
                    <asp:Label ID="lblCommentsJoin" runat="server"> <%=LocalizeString("CommentslblSub")%><a href="#NewCommentLogged"><%=LocalizeString("BNewComment")%></a></asp:Label>
                    <asp:HiddenField ID="userid" runat="server" />
                    <asp:HiddenField ID="Reply" runat="server" />
                    <asp:HiddenField ID="ReplyID" runat="server" />
                    <asp:HiddenField ID="CID" runat="server" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <asp:PlaceHolder ID="PHComments" runat="server"></asp:PlaceHolder>
            </div>
        </div>
    </div>
    <asp:Label ID="lblCommentsMsg" runat="server" resourcekey='CommentsMsg.Text' Visible="false" CssClass="CommentsMsg"></asp:Label>
    <asp:PlaceHolder ID="pnlNewCommentLogged" runat="server">
        <div class="commentsForm">
            <a name="NewCommentLogged"></a>
            <div class="anonDetails">
                <div class="row">
                    <div class="col-xs-12 commentCompose">
                        <p><%=LocalizeString("YourCommentlbl")%></p>
                        <textarea class="form-control pstext-area" rows="5" id="CommentAreaLogged" runat="server"></textarea>
                        <asp:RequiredFieldValidator ID="valComment" runat="server" resourcekey="valComment.Error" ValidationGroup="ContentProComment" ControlToValidate="CommentAreaLogged" CssClass="required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <asp:LinkButton runat="server" ID="BAddCommentLogged" CssClass="flatbutton" OnClick="BAddComment_Click" ValidationGroup="ContentProComment" CausesValidation="true"><%=LocalizeString("BAddComment")%></asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </asp:PlaceHolder>
    <asp:PlaceHolder ID="pnlNewComment" runat="server">
        <div class="commentsForm">
            <a name="NewCommentLogged"></a>
            <div class="anonDetails">
                <div class="row">
                    <div class="col-xs-12">
                        <label id="Nicknamelbl" runat="server" class="pslabel"><%=LocalizeString("Nicknamelbl")%></label>
                        <asp:TextBox ID="Nicknametxt" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valCommentName" runat="server" resourcekey="valCommentName.Error" ValidationGroup="ContentProComment" ControlToValidate="Nicknametxt" CssClass="required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <label id="Emaillbl" runat="server" class="pslabel"><%=LocalizeString("Emaillbl")%></label>
                        <asp:TextBox ID="Emailtxt" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valCommentEmail" runat="server" resourcekey="valCommentEmail.Error" ValidationGroup="ContentProComment" ControlToValidate="Emailtxt" CssClass="required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <label id="YourCommentlbl" runat="server" class="pslabel"><%=LocalizeString("YourCommentlbl")%></label>
                        <textarea class="form-control pstext-area" rows="5" id="CommentArea" runat="server"></textarea>
                        <asp:RequiredFieldValidator ID="valCommentAnon" runat="server" resourcekey="valComment.Error" ValidationGroup="ContentProComment" ControlToValidate="CommentArea" CssClass="required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <asp:LinkButton runat="server" ID="BAddComment" CssClass="flatbutton" OnClick="BAddComment_Click1" ValidationGroup="ContentProComment" CausesValidation="true"><%=LocalizeString("BAddComment")%></asp:LinkButton>
                        <!--  <asp:LinkButton  runat="server" ID="BRAddComment"  CssClass="psblog-btn" OnClick="BRAddCommentLogged_Click"   ><%=LocalizeString("BRAddComment")%></asp:LinkButton></div>
                   -->
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="H_ID" runat="server" />
            <asp:HiddenField ID="H_ModuleID" runat="server" />
            <div id="pnlEditComment" runat="server">
                <div class="row">
                    <div class="col-xs-12">
                        <label id="EditCommentlbl" runat="server" class="pslabel"><%=LocalizeString("EditCommentlbl")%></label>
                        <textarea id="EditCommentArea" class="psform-control" runat="server" cols="20" rows="5"></textarea>
                        <asp:LinkButton runat="server" ID="BEditComment" CssClass="flatbutton" OnClick="BEditComment_Click"><%=LocalizeString("BEditComment")%></asp:LinkButton>
                        <!-- <asp:LinkButton  runat="server" ID="BREditComment"  CssClass="psbtn psbtn-default" OnClick="BREditComment_Click" ><%=LocalizeString("BREditComment")%></asp:LinkButton>             
                           -->
                    </div>
                </div>
            </div>
        </div>
    </asp:PlaceHolder>
    <div id="pnlList" runat="server" class="row Paging">
        <div class="col-xs-12">
            <asp:PlaceHolder ID="pnlFirst" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="pnlPrev" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="pnlPages" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="pnlNext" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="pnlLast" runat="server"></asp:PlaceHolder>
        </div>
    </div>


</div>