<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Import.ascx.cs" Inherits="PureSystems.Modules.ContentPro.Import" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="FilePickerUploader" Src="~/controls/filepickeruploader.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<div id="pnlStepOne" runat="server" class="Normal psform-horizontal pspanel pspanel-default">
    <div class="pspanel-heading"><%=LocalizeString("pnlStepOne")%></div>
    <div class="pspanel-body">
        <label id="DDModulelbl" runat="server" class="pslabel"></label>
        <asp:DropDownList ID="DDModule" runat="server" class="psform-control" AutoPostBack="True" OnSelectedIndexChanged="DDModule_SelectedIndexChanged"></asp:DropDownList>
        <label id="Existslbl" runat="server" class="pslabel"></label>
        <br /> 
        <dnn:FilePickerUploader runat="server" ID="DnnFilePicker" />
        <div id="FilePickerDiv" runat="server">
             <asp:PlaceHolder ID="PHFilePicker" runat="server"></asp:PlaceHolder>
        </div>
        <div id="DDDnnArticlesDiv" runat="server">
             <label id="lblDnnArticles" runat="server" class="pslabel"></label>
               <asp:DropDownList ID="DDDnnArticles" runat="server" class="psform-control" AutoPostBack="False" ></asp:DropDownList>
        <br />
             <label id="lblFSetNAme" runat="server" class="pslabel"></label>
            <asp:TextBox ID="FSetNametxt" runat="server" class="psform-control"></asp:TextBox>
        </div>
        <br />
        <asp:LinkButton runat="server" ID="BNext" CssClass="psbtn psbtn-primary" OnClick="Next_Click"><%=LocalizeString("NextImport")%></asp:LinkButton>
        <asp:LinkButton runat="server" ID="BCancel" CssClass="psbtn psbtn-default" OnClick="Cancel_Click"><%=LocalizeString("CancelImport")%></asp:LinkButton>
    </div>
</div>
<asp:HiddenField ID="H_FileName" runat="server" />
<div id="pnlStepImport" runat="server" class="Normal psform-horizontal pspanel pspanel-default">
    <div class="pspanel-heading"><%=LocalizeString("pnlStepImport")%></div>
    <div class="pspanel-body">
        <h4>
            <label id="ImportInfo" cssclass="pslabel" runat="server"></label>
        </h4>
        <asp:LinkButton runat="server" ID="BImport" CssClass="psbtn psbtn-primary" OnClick="BImport_Click"><%=LocalizeString("BImport")%></asp:LinkButton>
        <asp:LinkButton runat="server" ID="BCancelImport" CssClass="psbtn psbtn-default" OnClick="Cancel_Click"><%=LocalizeString("CancelImport")%></asp:LinkButton>
    </div>
</div>
