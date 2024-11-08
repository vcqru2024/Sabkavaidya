<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Versions.ascx.cs" Inherits="PureSystems.Modules.ContentPro.Versions" %>


<div class="cont">
    <div id="pnlStepViewVersions" runat="server" class="psform-horizontal pspanel pspanel-default">
        <div class="pspanel-heading">
            <asp:Label ID="VersionsHeadlbl" runat="server" CssClass="pslabel"></asp:Label>
        </div>
        <div class="pspanel-body">
            <div class="psform-group">
                <div class="col-xs-12">
                    <asp:HiddenField ID="H_ID" runat="server" />
                    <asp:HiddenField ID="H_FSet" runat="server" />
                    <asp:Label ID="TitleNumVersionslbl" runat="server" CssClass="pslabel"></asp:Label><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltipster='{"side":"right"}' title="<%=LocalizeString("TitleNumVersionsHelp.Text")%>" />
                    <asp:Label ID="NumVersionslbl" runat="server" CssClass="pslabel"></asp:Label>
                    <br /><br />
                     <div id="SuccessAlert" visible="false" runat="server" class="alert alert-success">
  <strong>Done!</strong> RollBack success!.
                         <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
             </div>
                     <div id="DeleteAlert" visible="false" runat="server" class="alert alert-success">
  <strong>Done!</strong> Version deleted!.
                         <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
             </div>
                    <asp:GridView ID="DGVersions" runat="server" CssClass="pstable pstable-striped pstable-bordered pstable-hover" DataKeyNames="VersionID" OnRowDeleting="DGVersions_DeleteCommand" OnRowUpdating="DGVersions_UpdatingCommand" OnRowEditing="DGVersions_DesignCommand"
                        OnRowCommand="DGVersions_ItemCommand" OnPageIndexChanging="DGVersions_PageIndexChanged" AutoGenerateColumns="False" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="Versions">
                                <ItemTemplate>
                                    <asp:Label ID="Versionlbl" runat="server" Text='<%# Eval("VersionNum") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Title">
                                <ItemTemplate>
                                    <asp:Label ID="Titlelbl" runat="server" Text='<%#Eval("Title")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date">
                                <ItemTemplate>
                                    <asp:Label ID="Datelbl" runat="server" Text='<%#Eval("LastModifiedDT")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="User">
                                <ItemTemplate>
                                    <asp:Label ID="Userlbl" runat="server" Text='<%# UserController.GetUserById(Convert.ToInt32(Eval("PortalID")),Convert.ToInt32(Eval("LastModifiedBy"))).DisplayName %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="State">
                                <ItemTemplate>
                                    <asp:Label ID="Activelbl" runat="server" Text='<%# Eval("Active").ToString() == "1"? "Published" : "Unpublished"%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' OnClientClick="if (!confirm('Are you sure you want to delete this version?')) return false;" class="action-delete"><span class="glyphicon glyphicon-trash IconPaddingLeft" title="Delete"></span></asp:LinkButton>
                                    <asp:LinkButton runat="server" Text="Preview" CommandName="Update" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' ForeColor="Black"><span class="glyphicon glyphicon-eye-open IconPaddingLeft" title="Preview"></span></asp:LinkButton>
                                    <asp:LinkButton runat="server" Text="Rollback" CommandName="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' OnClientClick="if (!confirm('Are you sure you want to rollback this version?')) return false;" ForeColor="Black"><span class="glyphicon glyphicon-refresh IconPaddingLeft" title="Rollback"></span></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination-ys" />
                    </asp:GridView>
                </div>
            </div>
            <div class="psform-group">
                <div class="col-xs-12">
                    <asp:LinkButton runat="server" ID="BRExit" CssClass="psbtn psbtn-default" OnClick="BRExit_Click"></asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--close step one-->
    <div id="pnlStepPreview" runat="server" class="psform-horizontal pspanel pspanel-default">
        <div class="pspanel-heading">
            <asp:Label ID="PreviewHeadlbl" runat="server" CssClass="pslabel"></asp:Label>
        </div>
        <div class="pspanel-body">
            <div class="psform-group">
                <div class="col-xs-12">
                    <asp:PlaceHolder ID="PHPreview" runat="server"></asp:PlaceHolder>
                </div>
            </div>
            <div class="psform-group">
                <div class="col-xs-12">
                    <asp:LinkButton runat="server" ID="BRPreview" CssClass="psbtn psbtn-default" OnClick="BRPreview_Click"></asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--close step preview-->
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#SuccessAlert').hide();
        $('#DeleteAlert').hide();
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
