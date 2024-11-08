<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Category.ascx.cs" Inherits="puresystems.Modules.ContentPro.Category" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>

<div id="pnlStepOne" runat="server" class="Normal psform-horizontal pspanel pspanel-default">
    <div class="panel-heading">
        <asp:Label ID="AdminCatHeadlbl" CssClass="pslabel" runat="server"></asp:Label>
    </div>
    <div class="pspanel-body">
        <asp:HiddenField ID="hndCatID" runat="server" />
        <asp:HiddenField ID="H_ParentCatID" runat="server" />
        <%--<div class="row">
            <div class="col-xs-12">
                <asp:LinkButton ID="BAddParent" runat="server" CssClass="psbtn psbtn-default" OnClick="BAddParent_Click" />
            </div>
        </div>--%>
        <%--<div class="row">
            <div class="col-xs-12">
                <asp:DropDownList ID="DDFSetTree" runat="server" Width="150" AutoPostBack="True" OnSelectedIndexChanged="DDFSetTree_SelectedIndexChanged" CssClass="psform-control"></asp:DropDownList>
            </div>
        </div>--%>
       
        <div class="row">
            <div class="col-xs-3">
                <div class="psform-group">
                    <div class="col-xs-12">
                        <asp:DropDownList ID="DDTagCat" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDTagCat_SelectedIndexChanged1">
                        </asp:DropDownList>
                    </div>
                </div>
                <asp:Label ID="Label2" runat="server" Text="Label" CssClass="pslabel"></asp:Label>
                <asp:TreeView ID="TreeView1" runat="server" NodeStyle-CssClass="treeNode"
                    RootNodeStyle-CssClass="rootNode"
                    LeafNodeStyle-CssClass="leafNode" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowLines="True" ShowCheckBoxes="None">
                    <LeafNodeStyle CssClass="leafNode"></LeafNodeStyle>
                    <NodeStyle CssClass="treeNode"></NodeStyle>
                    <RootNodeStyle CssClass="rootNode"></RootNodeStyle>
                </asp:TreeView>
            </div>

            <div class="col-xs-9">
                <asp:PlaceHolder ID="Categoryprogress" runat="server">
                    <div class="alert alert-success alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <strong><%=LocalizeString("SaveSuccess.Text")%></strong>
                    </div>
                </asp:PlaceHolder>
                <div class="psform-group">
                    <div class="col-xs-12">
                        <asp:Label ID="AddNewCatlbl" runat="server" CssClass="pslabel"></asp:Label>
                    </div>
                </div>
                <div class="psform-group">
                    <div class="col-xs-3">
                        <asp:Label ID="AddCatNamelbl" runat="server" CssClass="pslabel"></asp:Label>
                    </div>
                    <div class="col-xs-9">
                        <asp:TextBox ID="txtAdd" runat="server" CssClass="psform-control" OnTextChanged="txtAddChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="txtAddRV"
                            ControlToValidate="txtAdd"
                            Display="Static"
                            ErrorMessage="* Required"
                            ForeColor="Red" SetFocusOnError="true"
                            runat="server" />
                    </div>
                </div>
                <div class="psform-group">
                    <div class="col-xs-3">
                        <asp:Label ID="lblCatDescription" runat="server" CssClass="pslabel"></asp:Label>
                    </div>
                    <div class="col-xs-9">
                        <asp:TextBox ID="txtCatDescription" runat="server" CssClass="psform-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
                    </div>
                </div>

                <%-- <div class="psform-group">
                    <div class="col-xs-3">
                        <asp:Label ID="AddCatFSlbl" runat="server" CssClass="pslabel"></asp:Label>
                    </div>
                    <div class="col-xs-9">
                        <asp:DropDownList ID="DDFSet" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDFSet_SelectedIndexChanged" CssClass="psform-control"></asp:DropDownList>
                    </div>
                </div>--%>
                <div class="psform-group">
                    <div class="col-xs-3">
                        <asp:Label ID="AddCatParentlbl" runat="server" CssClass="pslabel"></asp:Label>
                    </div>
                    <div class="col-xs-9">
                        <asp:DropDownList ID="ParentDDL" runat="server" CssClass="psform-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="psform-group" runat="server" id="IsTag">
                    <div class="col-xs-3">
                        <asp:Label ID="IsTaglbl" runat="server" CssClass="pslabel"></asp:Label>
                    </div>
                    <div class="col-xs-9">
                        <asp:CheckBox ID="IsTagchck" runat="server" AutoPostBack="True" OnCheckedChanged="IsTagchck_CheckedChanged1" />
                    </div>
                </div>
                <div class="psform-group">
                    <div class="col-xs-3">
                        <asp:Label ID="PublicCatTaglbl" runat="server" CssClass="pslabel"></asp:Label>
                    </div>
                    <div class="col-xs-9">
                        <asp:CheckBox ID="PublicCatTagChck" runat="server" />
                    </div>
                </div>
                <div class="psform-group">
                    <div class="col-xs-3">
                        <asp:Label ID="CatUrllbl" runat="server" CssClass="pslabel"></asp:Label>
                    </div>
                    <div class="col-xs-9">
                        <asp:TextBox ID="CatUrltxt" runat="server" CssClass="psform-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            ControlToValidate="CatUrltxt"
                            Display="Static"
                            ErrorMessage="* Required"
                            ForeColor="Red" SetFocusOnError="true"
                            runat="server" />
                    </div>
                </div>

                <div class="psform-group">
                    <div class="col-xs-12">
                        <asp:LinkButton ID="BAddNew" runat="server" CssClass="psbtn psbtn-primary" OnClick="BAddNew_Click" CausesValidation="true" />
                        <asp:LinkButton ID="CancelCat" runat="server" CssClass="psbtn psbtn-default" OnClick="CancelCat_Click" CausesValidation="false" />
                        <asp:LinkButton ID="DeleteCat" runat="server" CssClass="psbtn psbtn-danger" OnClick="DeleteCat_Click" OnClientClick="if (!confirm('Are you sure you want to delete this Category?')) return false;" CausesValidation="false" />
                    </div>
                </div>
                <div class="psform-group">
                    <div class="col-xs-12">
                        <asp:LinkButton ID="Exitbtn" runat="server" CssClass="psbtn psbtn-default" OnClick="Exitbtn_Click" CausesValidation="false" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("#<%= txtAdd.ClientID %>").blur(function () {

        var str = this.value.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-');
        $("#<%= CatUrltxt.ClientID %>").val(str);

          });
            $(document).ready(function () {

                $("#<%= txtAdd.ClientID %>").blur(function () {

            var str = this.value.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-');
            $("#<%= CatUrltxt.ClientID %>").val(str);

            });
    });
</script>
