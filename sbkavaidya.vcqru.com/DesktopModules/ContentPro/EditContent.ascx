<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditContent.ascx.cs" Inherits="puresystems.Modules.ContentPro.EditContent" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="FilePickerUploader" Src="~/controls/filepickeruploader.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>


<div id="pnlStepOne" runat="server" class="Normal configPanel form-horizontal pspanel pspanel-default">
    <div class="pspanel-heading">
        <asp:Label ID="EditArtHeadlbl"  CssClass="pslabel" runat="server"></asp:Label></div>
    <div class="pspanel-body">


        <div class="form-group">

            <div class="col-xs-2">

                <asp:Label ID="Catlbl" AssociatedControlID="TreeView1" runat="server" CssClass="pslabel"></asp:Label>
            </div>
            <div class="col-xs-10">
                <asp:TreeView ID="TreeView1" runat="server" EnableViewState="true" />
            </div>

        </div>

        <br />
        <div class="form-group">

            <div class="col-xs-12">
                <asp:HiddenField ID="H_FieldSetID" runat="server" />
            </div>

        </div>

        <br />
        <div class="form-group">

            <div class="col-xs-12">

                <asp:Label ID="urllbl" AssociatedControlID="txtUrlName" runat="server" CssClass="pslabel"></asp:Label>
                <br />
                <asp:TextBox ID="txtUrlName" runat="server" AutoPostBack="False" CssClass="psform-control" Width="90%"></asp:TextBox>


            </div>
        </div>

        <br />

        <div class="form-group">

            <div class="col-xs-2">

                <asp:Label runat="server" ID="startdtlbl"  CssClass="pslabel" AssociatedControlID="txtDateStart" />
                 <asp:TextBox ID="txtDateStart" runat="server" ></asp:TextBox> 

            </div>
            <div class="col-xs-2">
                <asp:Label runat="server" ID="enddtlbl"  CssClass="pslabel" AssociatedControlID="txtDateEnd" />

                <asp:TextBox ID="txtDateEnd" runat="server" ></asp:TextBox> 

            </div>
            <div class="col-xs-2">
            </div>
        </div>


        <div class="form-group">
            <div class="col-xs-12">

                <asp:HiddenField ID="H_FSet" runat="server" Value='<%# Eval("FieldSetID")%>' />
                <asp:HiddenField ID="H_ModuleID" runat="server" />

                <asp:PlaceHolder ID="PHArticle" runat="server"></asp:PlaceHolder>


            </div>

        </div>

        <br />
        <div class="form-group">
            <div class="col-xs-12">

                <dnn:TextEditor ID="txtprobe" runat="server" Height="400" Width="500" Visible="false" />
            </div>

        </div>

        <br />
        <div class="form-group">

            <div class="col-xs-12">
                <asp:LinkButton ID="BAddArt" runat="server" OnClick="BAddArt_Click" CssClass="psbtn psbtn-primary" />

                <asp:LinkButton ID="BRAddArticle" runat="server" CssClass="psbtn psbtn-default" ValidationGroup="btnNext" OnClick="BRAddArticle_Click" />
            </div>

        </div>



    </div>
</div>
<!--close step 2(Edit Article) -->
<link href="/desktopmodules/ContentPro/includes/DateTimePicker/jquery.datetimepicker.min.css" rel="stylesheet" type="text/css" />
<asp:HiddenField ID="DateTimeFormat" runat="server" />
<script>
  
    $(document).ready(function () {
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
       
             $('#<%= txtDateStart.ClientID %>').datetimepicker({
                 format: '<%= DateTimeFormat.Value %>',
                 formatTime: 'HH:mm'
             
   
    });
    
       $('#<%= txtDateEnd.ClientID %>').datetimepicker({
           format: '<%= DateTimeFormat.Value %>',
           formatTime: 'HH:mm'
             });
   
        $('.txtDate').each(function (i, obj) {
            $('#'+obj.id).datetimepicker({
                format: '<%= DateTimeFormat.Value %>',
                formatTime: 'HH:mm'
            });
        });
    });
    </script>