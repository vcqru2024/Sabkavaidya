<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddContent.ascx.cs" Inherits="puresystems.Modules.ContentPro.AddContent" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="FilePickerUploader" Src="~/controls/filepickeruploader.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>

<asp:HiddenField ID="hdnType" runat="server" />
<div id="pnlStepOne" runat="server" class="Normal configPanel psform-horizontal pspanel pspanel-default">
    <asp:HiddenField ID="H_FSet" runat="server" Value='<%# Eval("FieldSetID")%>' />
    <asp:HiddenField ID="H_ModuleID" runat="server" />
    <asp:HiddenField ID="hdnSortOrder" runat="server" />
    <asp:HiddenField ID="ContentId" runat="server" Value="" />
    <asp:HiddenField ID="DateCreated" runat="server" Value="" />
    <asp:HiddenField ID="CreatedBy" runat="server" Value="" />
    <div class="pspanel-heading">
        <asp:Label ID="AddArtHeadlbl" CssClass="pslabel" runat="server"></asp:Label>
    </div>
    <div class="pspanel-body">
        <div class="psform-group">

            <div class="col-xs-12">
                <div class="row">
                    <div class="col-xs-5">
                        <div id="CategoriesListCon" runat="server">
                            <asp:Label ID="Catlbl" CssClass="pslabel" AssociatedControlID="TreeView1" runat="server"></asp:Label>
                            <div class="categoryCOn">
                                <asp:TreeView ID="TreeView1" runat="server" NodeStyle-CssClass="treeNode"
                                    RootNodeStyle-CssClass="rootNode"
                                    LeafNodeStyle-CssClass="leafNode" EnableViewState="true" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" />
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-5" id="SocialDiv" runat="server">
                        <asp:Label ID="SocialGlbl" CssClass="pslabel" runat="server"></asp:Label>
                        <div class="categoryCOn">
                            <asp:TreeView ID="TreeSocialRoles" runat="server" NodeStyle-CssClass="treeNode"
                                RootNodeStyle-CssClass="rootNode"
                                LeafNodeStyle-CssClass="leafNode" EnableViewState="true" OnSelectedNodeChanged="TreeSocialRoles_SelectedNodeChanged" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="psform-group">
            <div class="col-xs-12">
                <asp:Label ID="Titlelbl" runat="server" AssociatedControlID="Titletxt" CssClass="pslabel"></asp:Label>
                <asp:TextBox ID="Titletxt" runat="server" CssClass="psform-control" AutoPostBack="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqTitle" runat="server" ControlToValidate="Titletxt" resourcekey="reqTitle" ValidationGroup="psForm" CssClass="psValField" SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="psform-group">
            <div class="col-xs-3">
                <asp:Label ID="startdtlbl" runat="server" CssClass="pslabel" AssociatedControlID="txtDateStart" />
                <asp:TextBox ID="txtDateStart" runat="server" CssClass="psform-control txtDate"></asp:TextBox>
            </div>
            <div class="col-xs-3">
                <asp:Label ID="enddtlbl" runat="server" CssClass="pslabel" AssociatedControlID="txtDateEnd" />
                <asp:TextBox ID="txtDateEnd" runat="server" CssClass="psform-control txtDate"></asp:TextBox>
            </div>
        </div>
        <div class="psform-group">
            <div class="col-xs-12">
                <asp:PlaceHolder ID="PHArticle" runat="server"></asp:PlaceHolder>
            </div>
        </div>
        <div id="ActiveDiv" class="psform-group chck" runat="server">
            <input type="checkbox" id="CActiveAdd" class="js-switch" runat="server" />
            <asp:Literal ID="CActiveLabel" runat="server"></asp:Literal>
        </div>
        <div class="psform-group">
            <div class="col-xs-12">
                <asp:Label ID="urllbl" runat="server" AssociatedControlID="txtUrlName" CssClass="pslabel"></asp:Label>
                <asp:TextBox ID="txtUrlName" runat="server" CssClass="psform-control" AutoPostBack="False"></asp:TextBox>
            </div>
        </div>
        <div class="psform-group">
            <div class="col-xs-12">
                <asp:Label ID="taglbl" runat="server" AssociatedControlID="txtUrlName" CssClass="pslabel"></asp:Label>
                <asp:ListBox ID="DDtags" runat="server" SelectionMode="Multiple" CssClass="chosen-select" Width="590"></asp:ListBox>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">Metadata</div>
            <div class="panel-body">
                <div class="psform-group">
                    <div class="col-xs-12">
                        <asp:Label ID="lblMetadataTitle" runat="server" CssClass="pslabel"></asp:Label>
                        <asp:TextBox ID="txtMetadataTitle" runat="server" CssClass="psform-control" AutoPostBack="False"></asp:TextBox>
                    </div>
                </div>
                <div class="psform-group">
                    <div class="col-xs-12">
                        <asp:Label ID="lblMetadataDescription" runat="server" CssClass="pslabel"></asp:Label>
                        <asp:TextBox ID="txtMetadataDescription" TextMode="multiline" Columns="50" Rows="5" runat="server" CssClass="psform-control" AutoPostBack="False"></asp:TextBox>
                    </div>
                </div>
                <div class="psform-group">
                    <div class="col-xs-12">
                        <asp:Label ID="lblMetadataKeywords" runat="server" CssClass="pslabel"></asp:Label>
                        <asp:TextBox ID="txtMetadataKeywords" runat="server" CssClass="psform-control" AutoPostBack="False"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">Advanced</div>
            <div class="panel-body">
                <div class="psform-group">
                    <div class="col-xs-12">
                        <asp:Label ID="lblRedirectURL" runat="server" CssClass="pslabel" resourcekey="lblRedirectURL.Text"></asp:Label><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltipster='{"side":"right"}' title="<%=LocalizeString("helpRedirectURL.Text")%>" />
                        <asp:TextBox ID="txtRedirectURL" runat="server" CssClass="psform-control" AutoPostBack="False"></asp:TextBox>
                    </div>
                </div>
                <div class="psform-group">
                    <div class="col-xs-12">
                        <asp:Label ID="lblCanonicalURL" runat="server" CssClass="pslabel" resourcekey="lblCanonicalURL.Text"></asp:Label><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltipster='{"side":"right"}' title="<%=LocalizeString("helpCanonicalURL.Text")%>" />
                        <asp:TextBox ID="txtCanonicalURL" runat="server" CssClass="psform-control" AutoPostBack="False"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>

        <div class="psform-group">
            <div class="col-xs-12">
                <asp:LinkButton ID="BAddArt" runat="server" CssClass="psbtn psbtn-primary" OnClick="BAddArt_Click" ValidationGroup="psForm" CausesValidation="true" />
                <asp:LinkButton ID="BRAddArticle" runat="server" CssClass="psbtn psbtn-default" OnClick="BRAddArticle_Click" CausesValidation="False" />
            </div>
        </div>


    </div>
</div>
<!--close step 2(Add Article) -->
<asp:HiddenField ID="AddEdit" runat="server" />
<asp:HiddenField ID="DateTimeFormat" runat="server" />
<script>

    $(document).ready(function () {


        var config = {
            '.chosen-select': {},
            '.chosen-select-deselect': { allow_single_deselect: true },
            '.chosen-select-no-single': { disable_search_threshold: 10 },
            '.chosen-select-no-results': { no_results_text: 'Oops, nothing found!' },
            '.chosen-select-width': { width: "95%" }
        }
        for (var selector in config) {
            $(selector).chosen(config[selector]);
        }

        var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));

        elems.forEach(function (html) {
            var switchery = new Switchery(html);
            /*  if (!switchery.isChecked()) {
                  alert("checked");
                  switchery.setPosition(false);
              }else{
                  alert("not checked");
                  switchery.setPosition(true);
          }*/
        });


        if ("<%= AddEdit.Value %>" == "Add") {
            $("#<%= Titletxt.ClientID %>").blur(function () {
                $("#<%= txtMetadataTitle.ClientID %>").val(this.value);
                var str = this.value.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-');
                $("#<%= txtUrlName.ClientID %>").val(str);

            });
        }
        if ("<%= AddEdit.Value %>" == "Edit") {
            $("#<%= Titletxt.ClientID %>").blur(function () {
                $("#<%= txtMetadataTitle.ClientID %>").val(this.value);
                var str = this.value.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-');
                $("#<%= txtUrlName.ClientID %>").val(str);

            });
        }


        $.datetimepicker.setDateFormatter({
            parseDate: function (date, format) {
                var d = moment(date, format);
                return d.isValid() ? d.toDate() : false;
            },

            formatDate: function (date, format) {
                return moment(date).format(format);
            }
        });
        // re-bind your jQuery events here

       <%-- $('#<%= txtDateStart.ClientID %>').datetimepicker({
            format: '<%= DateTimeFormat.Value %>',
            formatTime: 'HH:mm'
        });



        $('#<%= txtDateEnd.ClientID %>').datetimepicker({
            format: '<%= DateTimeFormat.Value %>',
            formatTime: 'HH:mm'
        });--%>


        $('.txtDate').each(function (i, obj) {
            if ($('#' + obj.id).value != '') {
                $('#' + obj.id).datetimepicker({
                    format: '<%= DateTimeFormat.Value %>',
                    formatTime: 'HH:mm'
                });

            }
        });
    });
</script>
