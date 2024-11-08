<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GalleryControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.GalleryControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="SaveLinkButton" />
            <asp:PostBackTrigger ControlID="SaveAndBackLinkButton" />
            <asp:PostBackTrigger ControlID="MultipleGalleryFileUploadLinkButton" />
        </Triggers>
        <ContentTemplate>
            <asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
            <asp:MultiView ID="ContentMultiView" runat="server">
                <asp:View ID="ListView" runat="server">
                    <div class="rvdsfListContainer">
                        <div class="row rvdsf-actionbar-container">
                            <div class="col-sm-6">
                                <asp:HyperLink ID="ExportViewHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportViewLink") %></asp:HyperLink>
                                <asp:HyperLink ID="ExportAllHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportAllLink") %></asp:HyperLink>
                                <asp:HyperLink ID="ImportHyperLink" runat="server" CssClass="btn btn-link rvdImportAction" ><em class="glyphicon glyphicon-import fa fas fa-download"></em> <%= LocalizeString("ImportLink") %></asp:HyperLink>
                            </div>
                            <div class="col-sm-6 text-sm-right">
                                <asp:LinkButton ID="MultipleGalleryFileUploadLinkButton" runat="server" OnClick="MultipleGalleryFileUploadLinkButton_Click" CausesValidation="False" style="visibility: hidden"></asp:LinkButton>
                                <span class="rvdsf-dropfileupload-container" ondragover="$(this).addClass('drag-over')" ondragleave="$(this).removeClass('drag-over')">
                                    <asp:FileUpload ID="MultipleGalleryFileUpload" runat="server" onchange="__doPostBack($('a[id$=MultipleGalleryFileUploadLinkButton]').attr('id').replace(/_/g, '$'), '')" AllowMultiple="True" />
                                </span>                                
                                <asp:HyperLink  ID="AddHyperLink" resourcekey="AddHyperLink" runat="server"  CssClass="btn btn-primary rvdAddNewAction" />
                            </div>
                        </div>
                        <asp:Panel ID="GalleryPanel" runat="server"></asp:Panel> 
                        <asp:LinkButton ID="DeleteGalleryLinkButton" runat="server" OnClick="DeleteGalleryLinkButton_Click" Text="Delete" style="display:none"/>
                        <asp:LinkButton ID="MoveGalleryLinkButton" runat="server" OnClick="MoveGalleryLinkButton_Click" Text="Move" style="display:none"/>
                        <asp:HiddenField ID="SourceGalleryIDHiddenField" runat="server" />
                        <asp:HiddenField ID="TargetGalleryIDHiddenField" runat="server" />
                        <asp:HiddenField ID="GalleryPositionHiddenField" runat="server" />
                        <script>
                            Sys.Application.add_load(function () {
                                $("#<%= GalleryPanel.ClientID %>").kendoGrid({
                                    columns: [
                                        { field: "", width: "5%", template: '<a href="#: Administration.TabUrl #"><img src="#: ThumbnailUrl #" /></a>' },
                                        { field: "MediaType", width: "10%", title: "<%= Localization.GetString("MediaType.Header", this.LocalResourceFile) %>" },
                                        { field: "Width", width: "5%", title: "<%= Localization.GetString("Width.Header", this.LocalResourceFile) %>" },
                                        { field: "Height", width: "5%", title: "<%= Localization.GetString("Height.Header", this.LocalResourceFile) %>" },
                                        { field: "AlternateText", title: "<%= Localization.GetString("AlternateText.Header", this.LocalResourceFile) %>" },
                                        { field: "", <% if (this.ModuleSecurity.CanEditControl) { %> template: '<a href=""><em class="glyphicon glyphicon-remove fa fas fa-trash" onclick="event.stopPropagation(); $(\'\\#<%= SourceGalleryIDHiddenField.ClientID.Replace("$", "_") %>\').val(\'#= GalleryID #\'); if (Revindex.Web.ConfirmDelete()) __doPostBack(\'<%= DeleteGalleryLinkButton.UniqueID %>\', \'\'); return false;"></em></a>', <% } %> width: "5%" },
                                        { field: "", <% if (this.ModuleSecurity.CanEditControl) { %> template: '<em class="glyphicon glyphicon-option-vertical fa fas fa-ellipsis-v" style="cursor: move"></em>', <% } %> width: "5%" },
                                    ],
                                    editable: false,
                                    dataSource: new kendo.data.DataSource({
                                        data: $("#<%= GalleryPanel.ClientID %>").data("source"),
                                        schema: {
                                            model: {
                                                id: "GalleryID",
                                                fields: {
                                                    Format: { type: "string" },
                                                    MediatType: { type: "string" },
                                                    Width: { type: "number" },
                                                    Height: { type: "number" },
                                                    AlternateText: { type: "string" },
                                                }
                                            }
                                        },

                                    }),
                                    dataBound: function (e) {
                                        var grid = this
                                        // Make row clickable
                                        grid.table.find("tbody > tr").each(function () {
                                            var $tr = $(this)
                                            $tr.css("cursor", "pointer")
                                            $tr.on("click", function () { location.href = $tr.find("td > a")[0].href })
                                            $tr.find("td > span.k-icon").on("click", function () { event.stopPropagation() })
                                        })

                                        // Make row sortable
                                        grid.table.kendoSortable({
                                            filter: ">tbody >tr",
                                            hint: function (element) {
                                                var table = $('<table class="k-grid k-widget"></table>');

                                                // Append the dragged element
                                                table.append(element.clone());
                                                table.css("opacity", 0.7);

                                                return table;
                                            },
                                            cursor: "move",
                                            placeholder: function (element) {
                                                return $('<tr colspan="7" class="placeholder"></tr>');
                                            },
                                            change: function (e) {

                                                var sourceItem = grid.dataSource.getByUid(e.item.data("uid"));
                                                var targetItem = grid.dataSource.options.data[e.newIndex]

                                                $("#<%= SourceGalleryIDHiddenField.ClientID.Replace("$", "_") %>").val(sourceItem.GalleryID)
                                                $("#<%= TargetGalleryIDHiddenField.ClientID.Replace("$", "_") %>").val(targetItem.GalleryID)
                                                $("#<%= GalleryPositionHiddenField.ClientID.Replace("$", "_") %>").val(e.oldIndex > e.newIndex ? "before" : "after")
                                                __doPostBack("<%= MoveGalleryLinkButton.UniqueID %>", "")
                                            }
                                        });
                                    },
                                    scrollable: false,
                                })
                            })
                        </script>
                    </div>
                </asp:View>
                <asp:View ID="DetailsView" runat="server">
                    <uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
                    <h2><%= LocalizeString("GalleryHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label ID="GalleryIDLabel" runat="server" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
                    <div class="row rvdsf-actionbar-container">
                        <div class="col-sm-6">
							<button ID="ViewFormatsButton" runat="server" type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><em class="glyphicon glyphicon-text-size fa fas fa-expand"></em> <%= LocalizeString("ViewFormatsLink") %> <span class="caret"></span></button>
							<ul class="dropdown-menu">
							<li><asp:HyperLink  ID="EditDetailedFormatHyperLink" resourcekey="EditDetailedFormatHyperLink" runat="server"  /></li>
							<li><asp:HyperLink  ID="EditDisplayFormatHyperLink" resourcekey="EditDisplayFormatHyperLink" runat="server"  /></li>
							<li><asp:HyperLink  ID="EditThumbnailFormatHyperLink" resourcekey="EditThumbnailFormatHyperLink" runat="server"  /></li>
							</ul>
                        </div>
                        <div class="col-sm-6 text-sm-right">
                            
							
                            
                        </div>
                    </div>
                        <hr />
                        <div>
                            <fieldset>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="GalleryLabelControl" runat="server" />
                                    <asp:Panel ID="GalleryImagePanel" runat="server" CssClass="rvdsfGalleryPreviewContainer">
                                        <asp:Image ID="GalleryImage" runat="server" />
                                        <video id="GalleryVideo" runat="server" controls width="445" style="display: none"/>
                                        <canvas id="GalleryCanvas" runat="server" style="display:none"></canvas>
                                        <asp:HiddenField ID="GalleryPreviewHiddenField" runat="server" />
                                    </asp:Panel>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="FileUploadLabelControl" runat="server" />
                                    <asp:RegularExpressionValidator ID="FileUploadRegularExpressionValidator" runat="server" ControlToValidate="GalleryFileUpload" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression=".+\.(gif|GIF|jpg|JPG|jpeg|JPEG|png|PNG|mp4|MP4|webm|WEBM)$" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                    <span class="rvdsf-dropfileupload-container" ondragover="$(this).addClass('drag-over')" ondragleave="$(this).removeClass('drag-over')">
                                        <asp:FileUpload ID="GalleryFileUpload" runat="server" onchange="rvdsfReadFile(this)" />
                                    </span>
                                    <script>
                                    function rvdsfReadFile(input) {

                                        // Reset
                                        $('#<%= GalleryImage.ClientID %>').attr('src', '');
                                        $('#<%= GalleryVideo.ClientID %>').attr('src', '');
                                        $('#<%= GalleryVideo.ClientID %>').css('display', 'none');
                                        $('#<%= WidthLabel.ClientID %>').text('0')
                                        $('#<%= WidthHiddenField.ClientID %>').val('0')
                                        $('#<%= HeightLabel.ClientID %>').text('0')
                                        $('#<%= HeightHiddenField.ClientID %>').val('0')

                                        if (input.files && input.files[0]) {
                                            
                                            if (input.files[0].type.startsWith("image/")) {

                                                // File is image type
                                                var reader = new FileReader();
                                                reader.onload = function (e) {
                                                    // Show image preview
                                                    var img = document.getElementById('<%= GalleryImage.ClientID %>')
                                                    img.onload = function () {
                                                        $('#<%= WidthLabel.ClientID %>').text(this.width)
                                                        $('#<%= WidthHiddenField.ClientID %>').val(this.width)
                                                        $('#<%= HeightLabel.ClientID %>').text(this.height)
                                                        $('#<%= HeightHiddenField.ClientID %>').val(this.height)
                                                    }
                                                    img.src = e.target.result
                                                }
                                                reader.readAsDataURL(input.files[0]);
                                            }
                                            else if (input.files[0].type.startsWith("video/")) {

                                                // File is video type
                                                //const video = document.createElement('video')
                                                var video = document.getElementById('<%= GalleryVideo.ClientID %>')
                                                video.addEventListener('loadedmetadata', event => {
                                                    // Get video resolution
                                                    $('#<%= WidthLabel.ClientID %>').text(video.videoWidth)
                                                    $('#<%= WidthHiddenField.ClientID %>').val(video.videoWidth)
                                                    $('#<%= HeightLabel.ClientID %>').text(video.videoHeight)
                                                    $('#<%= HeightHiddenField.ClientID %>').val(video.videoHeight)
                                                    video.style = "display: block";

                                                    // Need delay before we can draw to canvas
                                                    setTimeout(rvdsfRenderCanvas, 1000)
                                                })
                                                video.src = URL.createObjectURL(input.files[0])
                                            }
                                        }
                                    }

                                    function rvdsfRenderCanvas() {
                                        var video = document.getElementById('<%= GalleryVideo.ClientID %>')
                                        var canvas = document.getElementById('<%= GalleryCanvas.ClientID %>');
                                        canvas.width = video.videoWidth
                                        canvas.height = video.videoHeight

                                        var ctx = canvas.getContext('2d')
                                        ctx.drawImage(video, 0, 0, canvas.width, canvas.height, 0, 0, video.videoWidth, video.videoHeight);

                                        // Draw play button. Choose a character from here
                                        // https://www.w3schools.com/charsets/ref_utf_geometric.asp
                                        var fontSize = 160
                                        ctx.fillStyle = "white";
                                        ctx.textAlign = "center";
                                        ctx.font = "900 " + fontSize + 'px Arial';
                                        ctx.fillText(String.fromCharCode(9655), (canvas.width / 2), (canvas.height / 2) + (fontSize / 3));

                                        $('#<%= GalleryPreviewHiddenField.ClientID %>').val(canvas.toDataURL("image/png").replace('data:image/png;base64,', ''))
                                    }
                                    </script>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="ResolutionLabelControl" runat="server" />
                                    <asp:Label ID="WidthLabel" runat="server"></asp:Label> x <asp:Label ID="HeightLabel" runat="server"></asp:Label> <asp:Label ID="FormatLabel" runat="server"></asp:Label> 
                                    <asp:HiddenField ID="WidthHiddenField" runat="server" />
                                    <asp:HiddenField ID="HeightHiddenField" runat="server" />
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="AlternateTextLabelControl" runat="server" />
                                    <asp:TextBox ID="AlternateTextTextBox" runat="server" MaxLength="100"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="DisplayOrderLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DisplayOrderTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="DisplayOrderRangeValidator" runat="server" ControlToValidate="DisplayOrderTextBox" MinimumValue="-2147483648" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			                        <asp:TextBox ID="DisplayOrderTextBox" runat="server" value="1000" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="FormatLabelControl" runat="server" />
                                    <asp:CheckBoxList ID="FormatCheckBoxList" runat="server" CssClass="rvdFormCheckBoxes" RepeatDirection="Horizontal" RepeatLayout="Flow" ></asp:CheckBoxList>
                                </div>
                            </fieldset>
                            <div class="row rvdsf-footerbar-container">
                                <div class="col-sm-6">
                                    <asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CssClass="btn btn-default btn-light" OnClick="DeleteLinkButton_Click" OnClientClick="return Revindex.Web.ConfirmDelete()" resourcekey="DeleteLinkButton"></asp:LinkButton>
                                    <asp:LinkButton ID="DeleteSetLinkButton" runat="server" CausesValidation="false" CssClass="btn btn-default btn-light" OnClick="DeleteSetLinkButton_Click" OnClientClick="return Revindex.Web.ConfirmDelete()" resourcekey="DeleteSetLinkButton"></asp:LinkButton>
                                </div>
                                <div class="col-sm-6 text-sm-right">
                                    <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
                                    <asp:LinkButton ID="SaveLinkButton" runat="server" CssClass="btn btn-primary rvdSaveAction" OnClick="SaveLinkButton_Click" resourcekey="SaveLinkButton" ValidationGroup="DetailsViewControl" />
                                    <asp:LinkButton ID="SaveAndBackLinkButton" runat="server" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" OnClick="SaveLinkButton_Click" resourcekey="SaveAndBackLinkButton" ValidationGroup="DetailsViewControl" />
                                </div>
                            </div>
                        </div>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
