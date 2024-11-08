<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Template.ascx.cs" Inherits="puresystems.Modules.ContentPro.Template" %>

<div id="pnlStepOne" runat="server" class="psform-horizontal pspanel pspanel-default">
    <div class="pspanel-heading">
        <div class="pspanel-title">
            <asp:Label ID="TemplateHeadlbl" runat="server"></asp:Label>
        </div>
    </div>
    <div class="pspanel-body">
        <div class="psform-group">
            <div class="col-xs-2">
                <asp:Label ID="FilterFSetlbl" CssClass="pslabel" runat="server"></asp:Label>
            </div>
            <div class="col-xs-10">
                <asp:DropDownList ID="DDFilterFSet" CssClass="psform-control" runat="server" OnSelectedIndexChanged="DDFilterFSet_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            </div>
        </div>
        <div class="psform-group">
            <div class="col-xs-12" aria-multiline="False">
                <asp:HiddenField ID="H_ID" runat="server" />
                <asp:GridView ID="DGTemplates" runat="server" CssClass="pstable pstable-striped pstable-bordered pstable-hover" DataKeyNames="TemplateID" OnRowDeleting="DGTemplates_DeleteCommand" OnRowEditing="DGTemplates_EditCommand" Width="100%" AutoGenerateColumns="False" OnRowCommand="DGTemplates_ItemCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="TemplateName">
                            <ItemTemplate>
                                <asp:Label CssClass="psDGAlign" ID="TemplateNamelbl" runat="server" Text='<%#Eval("TemplateName")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FieldSetName">
                            <ItemTemplate>
                                <asp:Label ID="FieldSetNamelbl" runat="server" Text='<%#Eval("FieldSetName")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CreatedDate">
                            <ItemTemplate>
                                <asp:Label ID="CreatedNamelbl" runat="server" Text='<%#Eval("CreatedDT")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" Text="Design" CommandName="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                                <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' OnClientClick="if (!confirm('Are you sure you want delete this template?')) return false;" ForeColor="Black"><span class="glyphicon glyphicon-trash" title="Delete"></span></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="psform-group">
            <div class="col-xs-12">
                &nbsp;<asp:LinkButton runat="server" ValidationGroup="btnNext" ID="BAddTemplate" CssClass="psbtn psbtn-primary" OnClick="BAddTemplate_Click"></asp:LinkButton>
                <asp:LinkButton runat="server" ValidationGroup="btnNext" ID="BReturnAddTemplate" CssClass="psbtn psbtn-default" OnClick="BReturnAddTemplate_Click"></asp:LinkButton>
            </div>
        </div>
    </div>
</div>
<!-- Close Panel 1(Main) -->


<div id="pnlStepAddTemplate" runat="server" class="pspanel pspanel-default">
    <div class="pspanel-heading">
        <div class="pspanel-title">
            <asp:Label ID="AddTemplatesHeadlbl" runat="server"></asp:Label>
        </div>
    </div>
    <div class="pspanel-body">
        <div class="psform-group">
            <asp:Label ID="AddTName" AssociatedControlID="txtAddTName" runat="server" CssClass="pslabel"></asp:Label>
            <asp:TextBox ID="txtAddTName" runat="server" CssClass="psform-control"></asp:TextBox>
            <asp:RequiredFieldValidator resourcekey="Required.Text" SetFocusOnError="True" runat="server" ControlToValidate="txtAddTName" EnableClientScript="True" CssClass="error-text" ValidationGroup="btnNext"></asp:RequiredFieldValidator>
        </div>
        <div class="psform-group">
            <asp:Label ID="lblTemplateType" AssociatedControlID="ddlTemplateType" runat="server" CssClass="pslabel" resourcekey="lblTemplateType"></asp:Label><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltip-content="#tooltip_content_helpTemplateTypes" data-tooltipster='{"side":"right"}' />
            <asp:DropDownList ID="ddlTemplateType" runat="server" CssClass="psform-control" OnSelectedIndexChanged="ddlTemplateType_SelectedIndexChanged">
                <asp:ListItem Value="0">Please select</asp:ListItem>
                <asp:ListItem Value="1">Article</asp:ListItem>
                <asp:ListItem Value="2">List</asp:ListItem>
                <asp:ListItem Value="3">Category/Tag List</asp:ListItem>
                <asp:ListItem Value="4">Archive List</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator resourcekey="Required.Text" SetFocusOnError="True" runat="server" ControlToValidate="ddlTemplateType" EnableClientScript="True" CssClass="error-text" ValidationGroup="btnNext" InitialValue="0"></asp:RequiredFieldValidator>


            <%--<div class="col-xs-2">
                <asp:Label ID="SelectModelbl" runat="server" CssClass="pslabel"></asp:Label>
            </div>
            <div class="col-xs-2">
                <asp:CheckBox ID="ArticleMode" runat="server" TextAlign="Left" Font-Size="Medium" OnCheckedChanged="ArticleMode_CheckedChanged" AutoPostBack="True" />
            </div>
            <div class="col-xs-2">
                <asp:CheckBox ID="ListMode" runat="server" TextAlign="Left" Font-Size="Medium" OnCheckedChanged="ListMode_CheckedChanged" AutoPostBack="True" />
            </div>
            <div class="col-xs-2">
                <asp:CheckBox ID="CatTagMode" runat="server" TextAlign="Left" Font-Size="Medium" AutoPostBack="True" OnCheckedChanged="CatTagMode_CheckedChanged" />
            </div>
            <div class="col-xs-4">
                <asp:CheckBox ID="ArchiveMode" runat="server" TextAlign="Left" Font-Size="Medium" AutoPostBack="True" OnCheckedChanged="ArchiveMode_CheckedChanged" />
            </div>--%>
        </div>
        <div class="psform-group">
            <asp:Label ID="AddTFieldSet" AssociatedControlID="DDAddTFieldSet" runat="server" CssClass="pslabel"></asp:Label>
            <asp:DropDownList ID="DDAddTFieldSet" runat="server" CssClass="psform-control"></asp:DropDownList>
            <asp:RequiredFieldValidator resourcekey="Required.Text" SetFocusOnError="True" runat="server" ControlToValidate="DDAddTFieldSet" EnableClientScript="True" CssClass="error-text" ValidationGroup="btnNext" InitialValue="0"></asp:RequiredFieldValidator>
        </div>
        <div class="psform-group">
            <asp:LinkButton ID="BAddTemplates" runat="server" CssClass="psbtn psbtn-primary" ValidationGroup="btnNext" OnClick="BAddTemplates_Click" />
            <asp:LinkButton ID="BRAddTemplate" runat="server" CssClass="psbtn psbtn-default" OnClick="BRAddTemplate_Click" CausesValidation="false" />
        </div>
    </div>
</div>
<!-- Clase Panel 2(Add TEmplate) -->
<div id="pnlStepDesignTemplate" runat="server" class="psform-horizontal pspanel pspanel-default">
    <div class="pspanel-heading">
        <div class="pspanel-title">
            <asp:Label ID="DesignTemplatesHeadlbl" runat="server"></asp:Label>
        </div>
    </div>
    <div class="pspanel-body">
        <div class="psform-group">
            <div class="col-xs-12">
                <asp:TextBox runat="server" ID="textarea" Width="100%" Height="400" TextMode="MultiLine" CssClass="my_codemirror_html"></asp:TextBox>
            </div>
        </div>
        <div class="psform-group">
            <div class="col-xs-12">
                <asp:LinkButton ID="BEditTemplate" runat="server" CssClass="psbtn psbtn-primary" ValidationGroup="btnNext" OnClick="BEditTemplate_Click" OnClientClick="updateTextArea();" />
                <asp:LinkButton ID="BREditTemplate" runat="server" CssClass="psbtn psbtn-default" ValidationGroup="btnNext" OnClick="BREditTemplate_Click" />
            </div>
        </div>
        <div class="psform-group">
            <div class="col-xs-12">
                <div class="dnnForm">
                    <h2 class="psArticles_dnnFormSectionHead" runat="server" id="HelpTemplateh2">
                        <asp:Label ID="HelpTemplatesHeadlbl" CssClass="pslabel" runat="server"></asp:Label>
                    </h2>
                </div>
            </div>
        </div>
        <div class="psform-group">
            <div class="col-xs-2">
                <asp:Label ID="HelpTemplateNamelbl" runat="server" CssClass="pslabel"></asp:Label>
            </div>
            <div class="col-xs-10">
                <asp:Label ID="HelpCTemplatelbl" runat="server" CssClass=""></asp:Label>
            </div>
        </div>
        <div class="psform-group">
            <div class="col-xs-2">
                <asp:Label ID="HelpTemplateLocationlbl" runat="server" CssClass="pslabel"></asp:Label>
            </div>
            <div class="col-xs-10">
                <asp:Label ID="HelpCTemplateLocationlbl" runat="server" CssClass=""></asp:Label>
            </div>
        </div>
        <%--<div class="psform-group">
            <div class="col-xs-12">
                <asp:Label ID="HelpTemplateTokenslbl" runat="server" CssClass="pslabel"></asp:Label>
            </div>
        </div>--%>
        <div class="Noform-group psform-group">
            <div class="col-xs-12">
                <asp:Label ID="Modellbl" runat="server" CssClass="pslabel"></asp:Label>
                <asp:GridView ID="DGContent" runat="server" CssClass="pstable pstable-bordered " AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Content">
                            <ItemTemplate>
                                <%#"@Model.Content."+RS(Eval("FieldName").ToString())%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FieldName">
                            <ItemTemplate>
                                <%#Eval("FieldName")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="Noform-group psform-group">
            <div class="col-xs-12">
                <asp:Label ID="Itemlbl" runat="server" CssClass="pslabel"></asp:Label>
                <asp:GridView ID="DGItemRazor" runat="server" CssClass="pstable pstable-bordered " AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Content">
                            <ItemTemplate>
                                <%#"@Item.Content."+RS(Eval("FieldName").ToString())%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FieldName">
                            <ItemTemplate>
                                <%#Eval("FieldName")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <!--
        <div class="psform-group">


            <div class="col-xs-12">
                <asp:Label ID="Helplbl" runat="server" CssClass="pslabel"></asp:Label>
            </div>

        </div>
        <br />
      
        <div class="psform-group">


            <div class="col-xs-5">
                <asp:Label ID="Urllbl" runat="server"></asp:Label>
            </div>
            <div class="col-xs-1">
                <asp:Label ID="Label1" runat="server" Text=" | " CssClass="pslabel"></asp:Label>
            </div>
            <div class="col-xs-6">
                <asp:Label ID="UrlExplain" runat="server" CssClass="pslabel"></asp:Label>
            </div>


        </div>
     -->



        <div class="pspanel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="pspanel pspanel-default">
                <div class="pspanel-heading" role="tab" id="headingOne">
                    <div class="pspanel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne"><%=LocalizeString("ExampleTemplatelbl.Text")%></a>
                    </div>
                </div>
                <div id="collapseOne" class="pspanel-collapse pscollapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="pspanel-body">
                        <asp:Label ID="TemplateDefault2" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>


    </div>

</div>
<!-- Clase Panel 3(Design TEmplate) -->

<div class="tooltip_templates">
    <span id="tooltip_content_helpTemplateTypes">
        <%=LocalizeString("helpTemplateTypes.Text")%>
    </span>
</div>


<script>
    var editor;

    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        // note that this will fire when _any_ UpdatePanel is triggered,
        // which may or may not cause an issue
        var mixedMode = {
            name: "htmlmixed",
            scriptTypes: [{
                matches: /\/x-handlebars-template|\/x-mustache/i,
                mode: null
            },
                          {
                              matches: /(text|application)\/(x-)?vb(a|script)/i,
                              mode: "vbscript"
                          }]
        };

        
        $('.my_codemirror_html').each(function (index, elem) {
            editor = CodeMirror.fromTextArea(elem, {
                lineNumbers: true,
                mode: mixedMode,
                selectionPointer: true
            });
            editor.setSize('auto', 600);
        });

        
    });

    function updateTextArea() {
        editor.save();
    }
</script>
