<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddOptions.ascx.cs" Inherits="puresystems.Modules.ContentPro.AddOptions" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="FilePickerUploader" Src="~/controls/filepickeruploader.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<div id="OptionsDiv" class="psform-horizontal pspanel pspanel-default">
                     <div class="pspanel-heading">
            <asp:Label ID="FieldOptionslbl" runat="server" CssClass="pslabel"><%=LocalizeString("FieldOptionslbl.Text")%></asp:Label>
        </div>
        <div class="pspanel-body">
             <div class="psform-group">
                <div class="col-xs-12">
                      <asp:LinkButton runat="server" ID="AddFieldOption" CssClass="psbtn psbtn-default" OnClick="AddFieldOption_Click"  ><%=LocalizeString("AddFieldOption.Text")%></asp:LinkButton><br />
                     <br /><asp:Label ID="NoResultslbl" Visible="false" runat="server" CssClass="pslabel"></asp:Label>
                    <input id="H_FieldID" runat="server" type="hidden" />
                   <input id="H_Index" type="hidden" />
                         <asp:GridView ID="DGFieldOptions" runat="server" CssClass="pstable pstable-striped pstable-bordered pstable-hover" DataKeyNames="FieldOptionsID" OnRowDeleting="DGFieldOptions_DeleteCommand" OnRowEditing="DGFieldOptions_DesignCommand"
                        OnRowCommand="DGFieldOptions_ItemCommand" OnPageIndexChanging="DGFieldOptions_PageIndexChanged" AutoGenerateColumns="False" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="Text">
                                <ItemTemplate>
                                    <asp:Label ID="Textlbl" runat="server" Text='<%#Eval("Text")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Value">
                                <ItemTemplate>
                                    <asp:Label ID="Valuelbl" runat="server" Text='<%#Eval("Value")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                     <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' OnClientClick="if (!confirm('Are you sure you want to delete this Field Option?')) return false;" ForeColor="Black"><span class="glyphicon glyphicon-trash" title="Delete"></span></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination-ys" />
                    </asp:GridView>
                    </div>
                 </div>
            <div class="psform-group">
                <div class="col-xs-12">
                    <asp:LinkButton runat="server" ID="BExitTabID" CssClass="psbtn psbtn-default" OnClick="BExitTabID_Click" ><%=LocalizeString("btnExit.Text")%></asp:LinkButton>
                </div>
            </div>
            </div>

     <div id="pnlStepAdd" runat="server" class="pspanel pspanel-default">
        <div class="pspanel-heading">
            <asp:Label ID="Headlbl" runat="server" CssClass="pslabel"></asp:Label>
        </div>
        <div class="pspanel-body">
            <div class="psform-group">
                <asp:Label ID="FOTextlbl" AssociatedControlID="FOText" runat="server" CssClass="pslabel"><%=LocalizeString("FOTextlbl.Text")%></asp:Label>
                <asp:TextBox ID="FOText" runat="server" ValidationGroup="btnNext" CssClass="psform-control"></asp:TextBox>
                </div>
            <div class="psform-group">
                <asp:Label ID="FOValuelbl" AssociatedControlID="FOValue" runat="server" CssClass="pslabel"><%=LocalizeString("FOValuelbl.Text")%></asp:Label>
                <asp:TextBox ID="FOValue" runat="server" CssClass="psform-control"></asp:TextBox>
            </div>
            <div class="psform-group">
                <asp:LinkButton runat="server" ID="BAddFO" CssClass="psbtn psbtn-primary" OnClick="BAddFO_Click"><%=LocalizeString("BAddFO.Text")%></asp:LinkButton>
                <asp:LinkButton runat="server" ValidationGroup="btnNext" ID="BCancel" CssClass="psbtn psbtn-default" OnClick="BCancel_Click" ><%=LocalizeString("BCancel.Text")%></asp:LinkButton>
            </div>
        </div>
     
</div>
        <div id="SuccessAlert" visible="false" runat="server" class="alert alert-success">
  <strong>Success!</strong> Option added!.
             </div>
    </div>
    <!--close step 2(Add) -->
           </div>