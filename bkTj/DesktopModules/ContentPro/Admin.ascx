<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Admin.ascx.cs" Inherits="puresystems.Modules.ContentPro.Admin" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="FilePickerUploader" Src="~/controls/filepickeruploader.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<%@ Register TagName="label" TagPrefix="dnn" Src="~/controls/labelcontrol.ascx" %>

<asp:HiddenField ID="hdnFSet" runat="server" />
<asp:HiddenField ID="hdnShowInactive" runat="server" />
<asp:HiddenField ID="hdnShowChanges" runat="server" />


<div class="cont">
    <div id="pnlStepOne" runat="server" class="psform-horizontal pspanel pspanel-default">
        <div class="pspanel-heading">
            <asp:Label ID="AdminArtHeadlbl" runat="server" CssClass="pslabel"></asp:Label>
        </div>
        <div class="pspanel-body">
            <div class="psform-group">
                <div class="col-xs-12">
                    <asp:HiddenField ID="H_ID" runat="server" />
                    <asp:GridView ID="DataGrid1" runat="server" CssClass="pstable pstable-striped pstable-bordered pstable-hover" DataKeyNames="FieldSetID" OnRowDeleting="Grid_DeleteCommand" OnRowUpdating="Grid_UpdatingCommand" OnRowEditing="Grid_DesignCommand" OnRowCancelingEdit="Grid_ShowArtCommand"
                        OnRowCommand="DataGrid1_ItemCommand" OnPageIndexChanging="DataGrid1_PageIndexChanged" AutoGenerateColumns="False" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="FieldSetNamelbl" runat="server" Text='<%#Eval("FieldSetName")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <asp:Label ID="Descriptionlbl" runat="server" Text='<%#Eval("FieldSetDescription")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fields">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="Design" CommandName="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Content">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="Show Content" CommandName="Cancel" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' OnClientClick="if (!confirm('Are you sure you want to delete this Content Set?')) return false;" ForeColor="Black"><span class="glyphicon glyphicon-trash IconPaddingLeft" title="Delete"></span></asp:LinkButton>
                                    <asp:LinkButton runat="server" Text="Edit" CommandName="Update" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' ForeColor="Black"><span class="glyphicon glyphicon-pencil IconPaddingLeft" title="Edit"></span></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination-ys" />
                    </asp:GridView>
                </div>
            </div>
            <div class="psform-group">
                <div class="col-xs-12">
                    <asp:LinkButton runat="server" ID="BAdd" ValidationGroup="btnNext" CssClass="psbtn psbtn-primary" OnClick="BAdd_Click"></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="BExitTabID" CssClass="psbtn psbtn-default" OnClick="BExitTabID_Click"><%=LocalizeString("btnExit.Text")%></asp:LinkButton>
                </div>
            </div>
        </div>
    </div>

    <!--close step one-->

    <div id="pnlStepAdd" runat="server" class="pspanel pspanel-default">
        <div class="pspanel-heading">
            <asp:Label ID="NewFSHeadlbl" runat="server" CssClass="pslabel"></asp:Label>
        </div>
        <div class="pspanel-body">
            <div class="psform-group">
                <asp:Label ID="NewFSNamelbl" AssociatedControlID="textName" runat="server" CssClass="pslabel"></asp:Label><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltipster='{"side":"right"}' title="<%=LocalizeString("helpContentSetName.Text")%>" />
                <asp:TextBox ID="textName" runat="server" ValidationGroup="btnNext" CssClass="psform-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" SetFocusOnError="True" ControlToValidate="textName" EnableClientScript="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="psform-group">
                <asp:Label ID="NewFSDesclbl" AssociatedControlID="txtDescription" runat="server" CssClass="pslabel"></asp:Label><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltipster='{"side":"right"}' title="<%=LocalizeString("helpContentSetDesc.Text")%>" />
                <asp:TextBox ID="txtDescription" runat="server" CssClass="psform-control"></asp:TextBox>
            </div>

            <div id="VersionsDiv" runat="server" class="psform-group">
                <asp:Label ID="NumberVersionslbl" AssociatedControlID="txtNumberVersions" runat="server" CssClass="pslabel"><%=LocalizeString("NumberVersionslbl.Text")%></asp:Label><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltipster='{"side":"right"}' title="<%=LocalizeString("helpContentNumberVersions.Text")%>" />
                <asp:TextBox ID="txtNumberVersions" runat="server" CssClass="psform-control"></asp:TextBox>
            </div>
            <div class="psform-group">
                <asp:LinkButton runat="server" ID="BAddFS" CssClass="psbtn psbtn-primary" OnClick="BAddArt_Click"></asp:LinkButton>
                <asp:LinkButton runat="server" ValidationGroup="btnNext" ID="BReturn" CssClass="psbtn psbtn-default" OnClick="BReturn_Click"></asp:LinkButton>
            </div>
        </div>
    </div>
    <!--close step 2(Add) -->

    <div id="pnlStepAddArtN" runat="server" class="psform-horizontal pspanel pspanel-default">
        <div class="pspanel-heading">
            <asp:Label ID="MakeActHeadlbl" runat="server" CssClass="pslabel"></asp:Label>
        </div>
        <div class="pspanel-body">
            <div class="psform-group">
                <div class="col-xs-12">
                    <asp:CheckBox ID="Act" runat="server" TextAlign="Left" />
                </div>
            </div>
            <div class="psform-group">
                <div class="col-xs-12">
                    <asp:LinkButton ID="BRMakeAct" runat="server" CssClass="psbtn psbtn-primary" ValidationGroup="btnNext" OnClick="BRMakeAct_Click" />
                </div>
            </div>
        </div>
    </div>
    <!--close step 2(AddArtN) -->

    <div id="pnlStepDesign" runat="server" class="psform-horizontal pspanel pspanel-default">
        <div class="pspanel-heading">
            <asp:Label ID="DesignHeadlbl" runat="server" CssClass="pslabel"></asp:Label>
        </div>
        <div class="pspanel-body">
            <div class="psform-group">
                <div class="col-xs-12">
                    <asp:HiddenField ID="H_Field" runat="server" />
                    <asp:GridView ID="DGDesign" runat="server" OnRowDataBound="FieldOptions_RowDataBound" CssClass="pstable pstable-striped pstable-bordered pstable-hover DGSortable" DataKeyNames="FieldID" Width="100%" OnRowDeleting="DGDesign_DeleteCommand"
                        OnRowEditing="DGDesign_EditCommand" AutoGenerateColumns="False" OnPageIndexChanging="DGDesign_PageIndexChanged" OnRowCommand="DGDesign_ItemCommand" OnClick="confirmDone()">
                        <Columns>
                            <asp:TemplateField HeaderStyle-Width="50px">
                                <ItemTemplate>
                                    <span class="glyphicon glyphicon-align-justify" title="Drag and drop" style="margin-right: 10px;"></span>
                                    <input type="hidden" class="TypeId" id="TypeId" name="TypeId" runat="server" text=' <%#Eval("FieldId")%>' value='<%#Eval("FieldId")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" CommandName="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'>
                                        <asp:Label ID="FieldNamelbl" runat="server" Text=' <%#Eval("FieldName")%>' />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type">
                                <ItemTemplate>
                                    <asp:Label ID="Typelbl" runat="server" Text=' <%#Eval("TypeName")%>' />
                                    <asp:HiddenField ID="RowTypeID" runat="server" Value=' <%#Eval("TypeID")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Required">
                                <ItemTemplate>
                                    <asp:Label ID="Requiredlbl" runat="server" Text=' <%#(bool)Eval("Required") == true ? "Yes" : "No"%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="AddOptions" Visible="false" runat="server" Text="Add options" OnClick="AddOptions_Click" CommandArgument='<%#Eval("FieldId")%>' ForeColor="Black"><span class="glyphicon glyphicon-plus" title="AddOptions"></span></asp:LinkButton><asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' ForeColor="Black" OnClientClick="if (!confirm('Are you sure you want to delete this field?')) return false;"><span class="glyphicon glyphicon-trash" title="Delete"></span></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination-ys" />
                    </asp:GridView>
                </div>
            </div>
            <div class="psform-group">
                <div class="col-xs-12">
                    <a id="SaveOrder" class="psbtn psbtn-warning SaveOrder" onclick="SaveOrderClick()" class="psbtn psbtn-warning SaveOrder" onclick="SaveOrderClick()">Save Order</a>
                    <img src="<%=ControlPath%>/images/ajax-loader.gif" class='spinner' />
                </div>
            </div>
            <div class="psform-group">
                <div class="col-xs-12">
                    <asp:LinkButton runat="server" ValidationGroup="btnNext" ID="AddField" CssClass="psbtn psbtn-primary" OnClick="AddField_Click"></asp:LinkButton><asp:LinkButton runat="server" ValidationGroup="btnNext" ID="BRDesign" CssClass="psbtn psbtn-default" OnClick="BRDesign_Click"></asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--close step 2(Design) -->
    <div id="pnlStepAddField" runat="server" class="pspanel pspanel-default">
        <div class="pspanel-heading">
            <asp:Label ID="AddFieldHeadlbl" runat="server" CssClass="pslabel"></asp:Label>
        </div>
        <div class="pspanel-body">
            <div class="psform-group">
                <asp:Label ID="AddFieldNamelbl" AssociatedControlID="txtNameAddField" runat="server" CssClass="pslabel"></asp:Label><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltipster='{"side":"right"}' title="<%=LocalizeString("helpFieldName.Text")%>" />
                <asp:TextBox ID="txtNameAddField" runat="server" CssClass="psform-control"></asp:TextBox><asp:CustomValidator ID="CustomValidator1" runat="server"
                    OnServerValidate="TextValidate"
                    ControlToValidate="txtNameAddField"
                    resourcekey="FieldExists.Text"
                    CssClass="error-text"
                    Display="Dynamic"></asp:CustomValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" resourcekey="ReqC.Text" ControlToValidate="txtNameAddField" SetFocusOnError="True" Display="Dynamic" CssClass="error-text"></asp:RequiredFieldValidator>
            </div>
            <div class="psform-group">
                <asp:Label ID="AddFieldTypelbl" AssociatedControlID="DDAddField" runat="server" CssClass="pslabel"></asp:Label><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltipster='{"side":"right"}' title="<%=LocalizeString("helpFieldType.Text")%>" />
                <asp:DropDownList ID="DDAddField" runat="server" CssClass="psform-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="valDDAddField" runat="server" resourcekey="ReqC.Text" ControlToValidate="DDAddField" SetFocusOnError="True" Display="Dynamic" CssClass="error-text" InitialValue="-1"></asp:RequiredFieldValidator>
            </div>
            <div class="psform-group">
                <asp:Label ID="lblMetadata" AssociatedControlID="DDMetadata" runat="server" CssClass="pslabel"></asp:Label><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltipster='{"side":"right"}' title="<%=LocalizeString("helpFieldMetaDataMapping.Text")%>" />
                <asp:DropDownList ID="DDMetadata" runat="server" CssClass="psform-control"></asp:DropDownList>

            </div>
            <div class="psform-group">
                <asp:CheckBox ID="ReqC" CssClass="pslabelRequired" runat="server" TextAlign="Left" />
            </div>
            <div class="psform-group">

                <asp:LinkButton ID="BAddField" runat="server" CssClass="psbtn psbtn-primary" OnClick="BAddField_Click" />
                <asp:LinkButton ID="BRAddField" runat="server" CssClass="psbtn psbtn-default" OnClick="BRAddField_Click" ValidationGroup="btnNext" />

            </div>
        </div>
    </div>
    <!--close step 2(Add Field) -->

    <div id="pnlStepEditField" runat="server" class="pspanel pspanel-default">
        <div class="pspanel-heading">
            <asp:Label ID="EditFieldHeadlbl" runat="server" CssClass="pslabel"></asp:Label>
        </div>
        <div class="pspanel-body">
            <div class="psform-group">
                <asp:Label ID="EditFieldNamelbl" AssociatedControlID="txtEditFieldName" CssClass="pslabel" runat="server"></asp:Label><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltipster='{"side":"right"}' title="<%=LocalizeString("helpFieldName.Text")%>" />
                <asp:TextBox ID="txtEditFieldName" runat="server" CssClass="psform-control">
                </asp:TextBox><asp:CustomValidator ID="CustomValidator2" runat="server"
                    OnServerValidate="TextValidateEdit"
                    ControlToValidate="txtEditFieldName"
                    resourcekey="FieldExists.Text"
                    CssClass="error-text"
                    Display="Dynamic"></asp:CustomValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator3" resourcekey="ReqC.Text" runat="server" ControlToValidate="txtNameAddField" SetFocusOnError="True" Display="Dynamic" CssClass="error-text"></asp:RequiredFieldValidator>
            </div>
            <div class="psform-group">
                <asp:Label ID="EditFieldTypelbl" AssociatedControlID="DDEditField" runat="server" CssClass="pslabel"></asp:Label><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltipster='{"side":"right"}' title="<%=LocalizeString("helpFieldType.Text")%>" />
                <asp:DropDownList ID="DDEditField" runat="server" CssClass="psform-control"></asp:DropDownList>
            </div>
            <div class="psform-group">
                <asp:Label ID="lblMetadataEdit" AssociatedControlID="DDMetadataEdit" runat="server" CssClass="pslabel"></asp:Label><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltipster='{"side":"right"}' title="<%=LocalizeString("helpFieldMetaDataMapping.Text")%>" />
                <asp:DropDownList ID="DDMetadataEdit" runat="server" CssClass="psform-control"></asp:DropDownList>
            </div>
            <div class="psform-group">
                <asp:CheckBox ID="ReqEditC" CssClass="pslabelRequired" runat="server" TextAlign="Left" />
            </div>
            <div class="psform-group">

                <asp:LinkButton runat="server" ValidationGroup="btnNext" ID="BEditField" CssClass="psbtn psbtn-primary" OnClick="BEditField_Click"></asp:LinkButton><asp:LinkButton runat="server" ValidationGroup="btnNext" ID="BREditField" CssClass="psbtn psbtn-default" OnClick="BREditField_Click"></asp:LinkButton>
            </div>
        </div>
    </div>
    <!--close step 2(Edit Field) -->
    <div id="pnlStepShowArticle" runat="server" class="psform-horizontal pspanel pspanel-default">
        <div class="pspanel-heading">
            <asp:Label ID="ArtHeadlbl" runat="server" CssClass="pslabel"></asp:Label>
        </div>
        <div class="pspanel-body">
            <asp:HiddenField ID="H_Count" runat="server" />
            <asp:HiddenField ID="H_Content" runat="server" />
            <div class="psform-group">
                <div class="col-xs-12">
                    <asp:CheckBox ID="ActiveC" runat="server" CssClass="pslabelRequired" TextAlign="Left" OnCheckedChanged="ActiveC_CheckedChanged" AutoPostBack="True" />
                    <asp:CheckBox ID="SortC" runat="server" CssClass="pslabelRequired" TextAlign="Left" AutoPostBack="True" OnCheckedChanged="SortC_CheckedChanged" />
                    <asp:Label CssClass="pslabel" ID="Categorieslbl" runat="server"></asp:Label><select id="DDCategories" class="dropmenuScroll" runat="server">
                    </select>
                    <asp:Button ID="BCategories" runat="server" CssClass="btn btn-default" Text="Submit" OnClick="BCategories_Click" />
                </div>
            </div>
            <div class="psform-group">
                <div class="col-xs-12">
                    <asp:GridView ID="DGArt" runat="server" CssClass="pstable pstable-striped pstable-bordered pstable-hover DGSortableArt" DataKeyNames="ContentID" OnRowUpdating="DGArticle_UpdatingCommand" OnRowDeleting="DGArticle_DeleteCommand" OnRowCancelingEdit="DGArticle_CancelCommand" EnableViewState="true"
                        OnRowEditing="DGArticle_EditCommand" OnRowDataBound="DGArt_OnRowDataBound" Width="100%" AutoGenerateColumns="False" OnRowCommand="DGArticle_RowCommand" AllowPaging="True" PageSize="20" OnPageIndexChanging="DGArt_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField HeaderStyle-Width="50">
                                <ItemTemplate>
                                    <span class="glyphicon glyphicon-align-justify" title="Drag and drop" style="margin-right: 10px;"></span>
                                    <input type="hidden" class="ArtId" id="ContentID" name="ContentID" runat="server" text=' <%#Eval("ContentID")%>' value='<%#Eval("ContentID")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Title">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" CommandName="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'>
                                        <asp:Label ID="Titlelbl" runat="server" Text='<%#Eval("Title")%>' />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Created Date">
                                <ItemTemplate>
                                    <asp:Label ID="CreatedDTlbl" runat="server" Text='<%#Eval("CreatedDT")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Date">
                                <ItemTemplate>
                                    <asp:Label ID="StartDTlbl" runat="server" Text='<%#Eval("StartDT")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="End Date">
                                <ItemTemplate>
                                    <asp:Label ID="EndDTlbl" runat="server" Text='<%#Eval("EndDT")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active">
                                <ItemTemplate>
                                    <asp:Label ID="Activelbl" runat="server" Text='<%# Eval("Active").ToString() == "1"? "Yes" : "No"%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CssClass="action-edit"><span class="glyphicon glyphicon-pencil " title="Edit"></span></asp:LinkButton>&nbsp;&nbsp;&nbsp;
                                    <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CssClass="action-delete" OnClientClick="if (!confirm('Are you sure you want delete?')) return false;"><span class="glyphicon glyphicon-trash red-text" title="Delete"></span></asp:LinkButton>&nbsp;&nbsp;&nbsp;<asp:LinkButton runat="server" Text="Versions" CommandName="Update" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CssClass="action-edit"><span class="glyphicon glyphicon-hdd " title="Versions"></span></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination-ys" />
                    </asp:GridView>
                </div>
            </div>
            <div class="psform-group">
                <div class="col-xs-12">
                    <a id="SaveOrderArt" hidden="true" class="psbtn psbtn-warning SaveOrderArt" onclick="SaveOrderArtClick()">Save Order</a>
                    <img src="<%=ControlPath%>/images/ajax-loader.gif" class='spinner' />
                </div>
            </div>
            <div class="psform-group">
                <div class="col-xs-12">
                    <asp:LinkButton runat="server" ValidationGroup="btnNext" ID="BAddArtN" CssClass="psbtn psbtn-primary" OnClick="BAddArtN_Click"></asp:LinkButton>&nbsp;
                    <asp:LinkButton runat="server" ValidationGroup="btnNext" ID="BRShowArt" CssClass="psbtn psbtn-default" OnClick="BRShowArt_Click"></asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--close step 2(Add Content Type) -->
</div>
<script type="text/javascript">
    $(".SaveOrder").hide();
    $(".SaveOrderArt").hide();


    function SaveOrderClick() {
        $('.spinner').show();
        //save database
        var input = "";
        var array = [];
        var length = $(".DGSortable").find(".TypeId").length;

        for (var i = 0; i < length; i++) {

            var getFieldId = $(".DGSortable").find(".TypeId")[i].value;
            //input = getFieldId;
            array.push(getFieldId);

        }
        input = array;
        $(".SaveOrder").addClass("disabled");
        $.ajax({
            url: '/DesktopModules/ContentPro/API/DragAndDropAPI/SaveOrder',
            type: 'post',
            dataType: "json",
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(input),
            success: function () {
                $('.spinner').hide();
                $(".SaveOrder").hide();
                $(".SaveOrder").removeClass("disabled");
            }
        });

    };

    function SaveOrderArtClick() {
        $('.spinner').show();
        //save database
        var input = "";
        var array = [];
        var length = $(".DGSortableArt").find(".ArtId").length;

        for (var i = 0; i < length; i++) {
            var getFieldId = $(".DGSortableArt").find(".ArtId")[i].value;
            //input = getFieldId;
            array.push(getFieldId);

        }
        input = array;
        $(".SaveOrderArt").addClass("disabled");
        $.ajax({
            url: '/DesktopModules/ContentPro/API/DragAndDropAPI/SaveOrderArt',
            type: 'post',
            dataType: "json",
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(input),
            success: function () {
                $('.spinner').hide();
                $(".SaveOrderArt").hide();
                $(".SaveOrderArt").removeClass("disabled");
            }
        });

    };

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        $('#<%= DDCategories.ClientID %>').multiselect({
            includeSelectAllOption: true,
            enableFiltering: true
        });

        $('#<%= DDCategories.ClientID %>').trigger('change');
        $(".dropdown-toggle").click(function () {
            if ($(".multiselect-container").hasClass("ShowDD").toString() == "true") {
                $(".multiselect-container").addClass("HideDD");
                $(".multiselect-container").removeClass("ShowDD");
            } else {
                $(".multiselect-container").addClass("ShowDD");
                $(".multiselect-container").removeClass("HideDD");
            }
        });
        // re-bind your jQuery events here
        $(".SaveOrder").hide();
        $(".SaveOrderArt").hide();
        $("[id*=DGDesign]").sortable({
            items: 'tr:not(tr:first-child)',
            cursor: 'pointer',
            axis: 'y',
            dropOnEmpty: false,
            start: function (e, ui) {
                ui.item.addClass("selected");

                $(".SaveOrder").show();
            },
            stop: function (e, ui) {
                ui.item.removeClass("selected");

            },
            receive: function (e, ui) {
                $(this).find("tbody").append(ui.item);


            }
        });

        if ($('#<%= SortC.ClientID %>').is(':checked')) {
            $("#<%=DGArt.ClientID%>").sortable({
                items: 'tr:not(tr:first-child)',
                cursor: 'pointer',
                axis: 'y',
                dropOnEmpty: false,
                start: function (e, ui) {
                    ui.item.addClass("selected");

                    $(".SaveOrderArt").show();
                },
                stop: function (e, ui) {
                    ui.item.removeClass("selected");


                },
                receive: function (e, ui) {
                    $(this).find("tbody").append(ui.item);


                }
            });
        }

        $(document).ready(function () {
            $('.cptooltip').tooltipster({
                theme: 'tooltipster-light',
                maxWidth: 300,
                functionInit: function (instance, helper) {

                    var $origin = $(helper.origin),
                        dataOptions = $origin.attr('data-tooltipster');

                    if (dataOptions) {

                        dataOptions = JSON.parse(dataOptions);

                        $.each(dataOptions, function (name, option) {
                            instance.option(name, option);
                        });
                    }
                }
            });
        });

    });

    // re-bind your jQuery events here
    <%--$(".SaveOrderArt").hide();
    //var sortc = $('#<%= SortC.ClientID %>');
    if ($('#<%= SortC.ClientID %>').is(':checked')) {
        $("#<%=DGArt.ClientID%>").sortable({
            items: 'tr:not(tr:first-child)',
            cursor: 'pointer',
            axis: 'y',
            dropOnEmpty: false,
            start: function (e, ui) {
                ui.item.addClass("selected");

                $(".SaveOrderArt").show();
            },
            stop: function (e, ui) {
                ui.item.removeClass("selected");


            },
            receive: function (e, ui) {
                $(this).find("tbody").append(ui.item);


            }
        });
    }--%>

    $(".SaveOrderArt").hide();
    //$("[id*=DGArt]").sortable({
    //    items: 'tr:not(tr:first-child)',
    //    cursor: 'pointer',
    //    axis: 'y',
    //    dropOnEmpty: false,
    //    start: function (e, ui) {
    //        ui.item.addClass("selected");

    //        $(".SaveOrderArt").show();
    //    },
    //    stop: function (e, ui) {
    //        ui.item.removeClass("selected");

    //    },
    //    receive: function (e, ui) {
    //        $(this).find("tbody").append(ui.item);


    //    }
    //});

    $(document).ready(function () {

        $('#<%= DDCategories.ClientID %>').multiselect({
            includeSelectAllOption: true,
            enableFiltering: true
        });
        $('#<%= DDCategories.ClientID %>').trigger('change');
        $(".dropdown-toggle").click(function () {
            if ($(".multiselect-container").hasClass("ShowDD").toString() == "true") {
                $(".multiselect-container").addClass("HideDD");
                $(".multiselect-container").removeClass("ShowDD");
            } else {
                $(".multiselect-container").addClass("ShowDD");
                $(".multiselect-container").removeClass("HideDD");
            }
        });


        $('.cptooltip').tooltipster({
            theme: 'tooltipster-light',
            maxWidth: 300,
            functionInit: function (instance, helper) {

                var $origin = $(helper.origin),
                    dataOptions = $origin.attr('data-tooltipster');

                if (dataOptions) {

                    dataOptions = JSON.parse(dataOptions);

                    $.each(dataOptions, function (name, option) {
                        instance.option(name, option);
                    });
                }
            }
        });


    });



</script>
