<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ModerateComments.ascx.cs" Inherits="PureSystems.Modules.ContentPro.ModerateComments" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="FilePickerUploader" Src="~/controls/filepickeruploader.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>

<script type="text/javascript" src="/DesktopModules/ContentPro/includes/DragAndDrop/jquery-ui.js"></script>
<script type="text/javascript" src="/DesktopModules/ContentPro/json2.js"></script>

<div id="pnlStepOne" runat="server" class="psform-horizontal pspanel pspanel-default">
    <div class="pspanel-heading">
        <asp:Label ID="ModerateCommentslbl" runat="server" CssClass="pslabel"></asp:Label>
    </div>
    <div class="pspanel-body">
        <div class="psform-group">
            <div class="col-xs-12">
                <asp:Label ID="FieldSetCommentslbl" CssClass="pslabel" runat="server"><%=LocalizeString("FieldSetCommentslbl.Text")%></asp:Label>
                <asp:DropDownList ID="DDFieldSetComments" runat="server" CssClass="psform-controlComments psform-control" AutoPostBack="True" OnSelectedIndexChanged="DDFieldSetComments_SelectedIndexChanged"></asp:DropDownList>
            </div>
        </div>
        <div class="psform-group">
            <div class="col-xs-12">
                <asp:Label ID="TitleCommentslbl" CssClass="pslabel" runat="server"><%=LocalizeString("TitleCommentslbl.Text")%></asp:Label><asp:DropDownList ID="DDTitleComments" runat="server" CssClass="psform-controlComments psform-control">
                    <asp:ListItem>Author</asp:ListItem>
                    <asp:ListItem>Title</asp:ListItem>
                    <asp:ListItem>Comment</asp:ListItem>
                </asp:DropDownList><asp:HiddenField ID="H_FSet" runat="server" />
                <asp:TextBox ID="Commentstxt" ToolTip="Search by comment" CssClass="psform-controlCommentstxt psform-control" runat="server"></asp:TextBox><asp:Button ID="BSearchComment" CssClass="psform-controlCommentsBtn psbtn psbtn-primary" runat="server" OnClick="BSearchComment_Click" />
            </div>
        </div>
        <div class="psform-group">
            <div class="col-xs-12">
                <asp:HiddenField ID="H_ID" runat="server" />
                <asp:GridView ID="DGModerateComment" runat="server" CssClass="pstable pstable-bordered pstable-striped pstable-hover" DataKeyNames="CommentID" OnRowEditing="Grid_DesignCommand"
                    OnRowCommand="DataGrid1_ItemCommand" OnRowDeleting="Grid_DeleteCommand" OnPageIndexChanging="DataGrid1_PageIndexChanged" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Author">
                            <ItemTemplate>
                                <asp:Label ID="Authorlbl" runat="server" Text='<%#Eval("Author")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Title - Comment">
                            <ItemTemplate>
                                <%#Eval("Title").ToString().Length>25 ? (Eval("Title") as string).Substring(0,25) : Eval("Title") %>... - <%#Eval("Comment").ToString().Length>150 ? (Eval("Comment") as string).Substring(0,150) : Eval("Comment")%>'...
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Approved">
                            <ItemTemplate>
                                <asp:CheckBox ID="fdsfs" CssClass="ApprovedChechbox" Text='<%#Eval("CommentID")%>' runat="server" AutoPostBack="True" Checked='<%#Eval("Approved")%>' OnCheckedChanged="CheckBox1_CheckedChanged" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <div class="divicon">
                                    <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CssClass="action-edit"><span class="psglyphiconl glyphicon glyphicon-pencil" title="Edit"></span></asp:LinkButton>
                                    <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' OnClientClick="if (!confirm('Are you sure you want to delete this comment?')) return false;" CssClass="action-delete"><span class="psglyphiconr glyphicon glyphicon-trash" title="Delete"></span></asp:LinkButton>
                                </div>
                            </ItemTemplate>
                            <ControlStyle Width="50px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
         <asp:LinkButton runat="server" ID="btnExit" CssClass="psbtn psbtn-primary" OnClick="btnExit_Click"><%=LocalizeString("btnExit.Text")%></asp:LinkButton>
    </div>
</div>
<div id="pnlStepEdit" runat="server" class="psform-horizontal pspanel pspanel-default">
    <div class="pspanel-heading">
        <asp:Label ID="EditModerateCommentslbl" runat="server" CssClass="pslabel"></asp:Label>
    </div>
    <div class="pspanel-body">
        <div class="row">
            <div class="col-xs-12">
                <asp:Label ID="Editlbl" runat="server" CssClass="pslabel"></asp:Label>
                <textarea id="CommentArea" class="psform-control" runat="server" cols="20" rows="5"></textarea>
                <asp:Label ID="EmailEdit" runat="server" CssClass="pslabel"></asp:Label>
                <asp:Label ID="EmailEditlbl" runat="server" CssClass="pslabelDisplayBlock"></asp:Label>
                <asp:Label ID="WebsiteEdit" runat="server" CssClass="pslabel"></asp:Label>
                <asp:Label ID="WebsiteEditlbl" runat="server" CssClass="pslabelDisplayBlock"></asp:Label>
                <asp:Label ID="IPEdit" runat="server" CssClass="pslabel"></asp:Label>
                <asp:Label ID="IPEditlbl" runat="server" CssClass="pslabelDisplayBlock"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <asp:LinkButton runat="server" ID="BEdit" CssClass="psbtn psbtn-primary" OnClick="BEdit_Click"><%=LocalizeString("btnEdit.Text")%></asp:LinkButton>
                <asp:LinkButton runat="server" ID="BREdit" CssClass="psbtn psbtn-default" OnClick="BREdit_Click"><%=LocalizeString("btnCancel.Text")%></asp:LinkButton>
            </div>
        </div>
    </div>
</div>
