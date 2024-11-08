<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DisplayOptions.ascx.cs" Inherits="puresystems.Modules.ContentPro.DisplayOptions" %>
<%@ Register TagPrefix="dnn" TagName="UrlControl" Src="~/controls/UrlControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>


<div class="" id="panels">
    <div id="pnlStepOne" runat="server" class="pspanel pspanel-default">
        <div class="pspanel-heading">
            <asp:Label ID="TemplateArtHeadlbl" CssClass="pslabel" runat="server"></asp:Label>
        </div>
        <div class="pspanel-body">
            <div class="psform-group  rdo-colors psRadio">
                <asp:Label ID="SelectDynamiclbl" runat="server" CssClass="pslabel"></asp:Label><br />
                <asp:RadioButton ID="CArticle" CssClass="psradioVert" runat="server" AutoPostBack="True" OnCheckedChanged="CArticle_CheckedChanged" GroupName="ModuleWork" /><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltipster='{"side":"right"}' title="<%=LocalizeString("helpLetMeChoose.Text")%>" /><br />
                <asp:RadioButton ID="CDynamic" CssClass="psradioVert" runat="server" AutoPostBack="True" OnCheckedChanged="CDynamic_CheckedChanged" GroupName="ModuleWork" /><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltipster='{"side":"right"}' title="<%=LocalizeString("helpDisplayDynamic.Text")%>" /><br />
                <asp:RadioButton ID="CCategoryTag" CssClass="psradioVert" runat="server" AutoPostBack="True" GroupName="ModuleWork" OnCheckedChanged="CCategoryTag_CheckedChanged" /><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltipster='{"side":"right"}' title="<%=LocalizeString("helpDisplayTagCategory.Text")%>" /><br />
                <asp:RadioButton ID="CArchive" CssClass="psradioVert" runat="server" AutoPostBack="True" GroupName="ModuleWork" OnCheckedChanged="CArchive_CheckedChanged" /><img src="<%=ControlPath%>/images/help-icon.png" alt="help" class="cptooltip" data-tooltipster='{"side":"right"}' title="<%=LocalizeString("helpDisplayArchive.Text")%>" /><br />
            </div>
            <div id="selectListArtDiv" runat="server" class="psform-group rdo-colors psRadio">
                <asp:Label ID="SelectModelbl" runat="server" CssClass="pslabel"></asp:Label><br />
                <asp:RadioButton ID="ListMode" CssClass="psradioVert" runat="server" AutoPostBack="True" OnCheckedChanged="ListMode_CheckedChanged" GroupName="ModuleMode" /><br />
                <asp:RadioButton ID="ArticleMode" CssClass="psradioVert" runat="server" AutoPostBack="True" OnCheckedChanged="ArticleMode_CheckedChanged" GroupName="ModuleMode" /><br />
            </div>
            <div id="DDSelectFSetDiv" runat="server" class="psform-group">
                <asp:Label ID="SelectFSetlbl" AssociatedControlID="DDFSetDyn" runat="server" CssClass="pslabel"></asp:Label>
                <asp:DropDownList ID="DDSelectFSet" runat="server" CssClass="psform-control controlWidth" AutoPostBack="True" OnSelectedIndexChanged="DDSelectFSet_SelectedIndexChanged"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="valDDSelectFSet" runat="server" ControlToValidate="DDSelectFSet" resourcekey="valDDSelectFSet.Error" InitialValue="0" CssClass="error-text"></asp:RequiredFieldValidator>
            </div>
            <div id="DDSelectFSetDynDiv" runat="server" class="psform-group">
                <asp:Label ID="SelectFSetDynlbl" AssociatedControlID="DDFSetDyn" runat="server" CssClass="pslabel"></asp:Label>
                <asp:DropDownList ID="DDFSetDyn" runat="server" CssClass="psform-control controlWidth" AutoPostBack="True" OnSelectedIndexChanged="DDFSetDyn_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div id="DDSelectArtDiv" runat="server" class="psform-group">
                <asp:Label ID="SelectArticlelbl" CssClass="pslabel" AssociatedControlID="DDSelectArticle" runat="server" resourcekey="SelectArticle.Text"></asp:Label>
                <asp:DropDownList ID="DDSelectArticle" runat="server" CssClass="psform-control controlWidth"></asp:DropDownList>
            </div>
            <h2 id="AdditionalSettings" class="dnnFormSectionHead"><a href="#">Additional Settings</a></h2>
            <fieldset class="dnnClear">
                <div id="SettingsSection" runat="server">
                    <div id="BootstrapDiv" class="psform-group psRadio" runat="server">
                        <input type="checkbox" id="AddBootstrap" class="js-switch" runat="server" />
                        <asp:Label ID="lblBootstrap" runat="server" AssociatedControlID="AddBootstrap" CssClass="pslabelCheckbox"></asp:Label>
                    </div>
                      <div id="SocialGroupsDiv" class="psform-group psRadio" runat="server">
                        <input type="checkbox" id="SocialGroups" class="js-switch" runat="server" />
                        <asp:Label ID="SocialGroupslbl" runat="server" AssociatedControlID="SocialGroups" CssClass="pslabelCheckbox"></asp:Label>
                    </div>
                    <div id="PagingDiv" class="psform-group psRadio" runat="server">
                        <input type="checkbox" id="PagingCB" class="js-switch" runat="server" />
                        <asp:Label ID="Paginglbl" runat="server" AssociatedControlID="PagingCB" CssClass="pslabelCheckbox"></asp:Label>
                    </div>
                    <div id="ScrollingDiv" class="psform-group psRadio" runat="server">
                        <input type="checkbox" id="ScrollingCB" class="js-switch" runat="server" />
                        <asp:Label ID="Scrollinglbl" runat="server" AssociatedControlID="ScrollingCB" CssClass="pslabelCheckbox"></asp:Label>
                    </div>
                    <div id="SitemapDiv" runat="server" class="psform-group psRadio">
                        <input type="checkbox" id="SitemapCheck" class="js-switch" runat="server" />
                        <asp:Label ID="Sitemaplbl" AssociatedControlID="SitemapCheck" runat="server" CssClass="pslabelCheckbox"></asp:Label>
                    </div>
                    <div id="NumberOfArticles" runat="server" class="psform-group">
                        <asp:Label ID="lblNumberOfArticles" CssClass="pslabel" AssociatedControlID="SitemapCheck" runat="server"></asp:Label>
                        <asp:TextBox ID="NumArttxt" runat="server" CssClass="psform-control controlWidth"></asp:TextBox>
                    </div>
                    <div id="ModuleUrlDiv" runat="server" class="psform-group psRadio">
                        <input type="checkbox" id="ModuleUrlcheck" class="js-switch" runat="server" />
                        <asp:Label ID="ModuleUrllbl" CssClass="pslabelCheckbox" AssociatedControlID="ModuleUrlcheck" runat="server"></asp:Label>
                    </div>
                    <div id="AllowCommentsDiv" class="psform-group psRadio" runat="server">
                        <input type="checkbox" id="AllowCommentscheck" class="js-switch js-check-change AllowCommentscheck" runat="server" />
                        <asp:Label ID="AllowCommentslbl" runat="server" AssociatedControlID="AllowCommentscheck" CssClass="pslabelCheckbox"></asp:Label>
                        <br />
                        <asp:Label ID="AllowCommentsLoginlbl" runat="server"></asp:Label>
                        <asp:DropDownList ID="DDAllowCommentsLogin" CssClass="psform-control controlWidth" runat="server">
                            <asp:ListItem Value="0">None</asp:ListItem>
                            <asp:ListItem Value="1">All</asp:ListItem>
                            <asp:ListItem Value="2" Selected="True">Registered users</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div id="AbsoluteUrlDiv" class="psform-group psRadio" runat="server">
                        <input type="checkbox" id="AbsoluteUrlCheck" class="js-switch js-check-change " runat="server" />
                        <asp:Label ID="AbsoluteUrllbl" runat="server" AssociatedControlID="AbsoluteUrlcheck" CssClass="pslabelCheckbox"></asp:Label>
                    </div>
                    <div id="DivUseMeta" runat="server" class="psform-group psRadio">
                        <input type="checkbox" id="UseMetaCheck" class="js-switch" runat="server" />
                        <asp:Label ID="lblUseMeta" CssClass="pslabelCheckbox" AssociatedControlID="UseMetaCheck" runat="server"></asp:Label>
                    </div>
                    <div id="DivRelated" runat="server" class="psform-group psRadio">
                        <input type="checkbox" id="RelatedCheck" class="js-switch js-check-change RelatedCheck" OnCheckedChanged="RelatedContentCheck_CheckedChanged" runat="server" />
                        <asp:Label ID="Relatedlbl" CssClass="pslabelCheckbox" AssociatedControlID="RelatedCheck" runat="server"></asp:Label>
                    </div>
                    <div id="DivNumRelated" runat="server" class="psform-group psRadio">
                        <asp:Label ID="NumRelatedlbl" CssClass="pslabelCheckbox" AssociatedControlID="NumRelatedtxt" runat="server"></asp:Label>
                        <input type="text" id="NumRelatedtxt" class="psform-control controlWidth" runat="server" />
                        
                    </div>
                </div>
            </fieldset>
            <h2 id="TemplateSettings" class="dnnFormSectionHead"><a href="#">Template Settings</a></h2>
            <fieldset class="dnnClear">
                <div id="DDSelectTemplateDynDiv" runat="server" class="psform-group">
                    <asp:Label ID="SelectTemplateDynlbl" CssClass="pslabel" AssociatedControlID="DDTemplateDyn" runat="server"></asp:Label>
                    <asp:DropDownList ID="DDTemplateDyn" runat="server" CssClass="psform-control controlWidth"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DDTemplateDyn" resourcekey="valSelectTemplate.Error" InitialValue="0" EnableClientScript="true" CssClass="error-text" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div id="DDSelectTemplateDiv" runat="server" class="psform-group">
                    <asp:Label ID="SelectTemplatelbl" CssClass="pslabel" AssociatedControlID="DDSelectTemplate" runat="server"></asp:Label>
                    <asp:DropDownList ID="DDSelectTemplate" runat="server" CssClass="psform-control controlWidth" OnSelectedIndexChanged="DDSelectTemplate_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DDSelectTemplate" resourcekey="valSelectTemplate.Error" InitialValue="0" EnableClientScript="true" CssClass="error-text" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div id="DDSelectTempListDiv" runat="server" class="psform-group">
                    <asp:Label ID="SelectTempListlbl" CssClass="pslabel" AssociatedControlID="DDTemplateList" runat="server"></asp:Label>
                    <asp:DropDownList ID="DDTemplateList" runat="server" CssClass="psform-control controlWidth"></asp:DropDownList>
                </div>
                <div id="DDCatTagDiv" runat="server" class="psform-group">
                    <asp:Label ID="DDCatTaglbl" CssClass="pslabel" AssociatedControlID="DDCatTag" runat="server"></asp:Label>
                    <asp:DropDownList ID="DDCatTag" runat="server" CssClass="psform-control controlWidth" AutoPostBack="True">
                        <asp:ListItem>Category</asp:ListItem>
                        <asp:ListItem>Tag</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div id="DDCatTagFSetDiv" runat="server" class="psform-group">
                    <asp:Label ID="DDCatTagFSetlbl" CssClass="pslabel" AssociatedControlID="DDCatTag" runat="server"></asp:Label>
                    <asp:DropDownList ID="DDCatTagFSet" AutoPostBack="true" runat="server" CssClass="psform-control controlWidth" OnSelectedIndexChanged="DDCatTagFSet_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <div id="DDOrderDiv" runat="server" class="psform-group">
                    <asp:Label ID="OrderFieldlbl" CssClass="pslabel" AssociatedControlID="DDOrderField" runat="server"></asp:Label>
                    <asp:DropDownList ID="DDOrderField" runat="server" CssClass="psform-control controlWidth"></asp:DropDownList>
                    <asp:DropDownList ID="DDOrderFilter" runat="server" CssClass="psform-control controlWidthSmall"></asp:DropDownList>
                </div>
                <div id="OtherTablblDiv" runat="server" class="psform-group psRadio">
                    <asp:CheckBox runat="server" ID="OtherPageCB" AutoPostBack="True" OnCheckedChanged="OtherPage_CheckedChanged1" />
                    <asp:Label ID="SelectSamePage" CssClass="pslabelCheckbox" AssociatedControlID="OtherPageCB" runat="server"></asp:Label>
                </div>
                <div id="OtherTabDiv" runat="server" class="psform-group">
                    <asp:Label ID="DetailsTablbl" CssClass="pslabel" AssociatedControlID="TabID" runat="server" resourcekey="DetailsTablbl"></asp:Label>
                    <asp:DropDownList ID="TabID" runat="server" DataTextField="IndentedTabName" DataValueField="TabId" CssClass="psform-control controlWidth" />
                    <div class="clearfix"></div>                    
                </div>
            </fieldset>
            <h2 id="CategorySettings" class="dnnFormSectionHead"><a href="#">Category Settings</a></h2>
            <fieldset class="dnnClear">
                <asp:Label ID="lblNoCategoriesExist" CssClass="" runat="server" resoucekey="lblNoCategoriesExist.Text" Visible="false"></asp:Label>
                <div id="TreeOneDiv" runat="server" class="psform-group">
                    <asp:Label ID="TreeOnelbl" CssClass="pslabel" runat="server" AssociatedControlID="TreeAlllbl" resourcekey="TreeOnelbl.Text"></asp:Label>
                    <asp:TreeView ID="CategoryOneTreeView" NodeStyle-CssClass="treeNode"
                        RootNodeStyle-CssClass="rootNode"
                        LeafNodeStyle-CssClass="leafNode" runat="server" EnableViewState="true" ShowExpandCollapse="true" ShowLines="false" ExpandDepth="1" OnTreeNodeExpanded="Node_Expand" OnTreeNodeCollapsed="Node_Collapse" NodeStyle-HorizontalPadding="3" PopulateNodesFromClient="false" />
                </div>
                <div id="TreeAllDiv" runat="server" class="psform-group" visible="false">
                    <asp:Label ID="TreeAlllbl" CssClass="pslabel" runat="server" AssociatedControlID="CategoryAllTreeView" resourcekey="TreeAlllbl.Text"></asp:Label>
                    <asp:TreeView ID="CategoryAllTreeView" NodeStyle-CssClass="treeNode"
                        RootNodeStyle-CssClass="rootNode"
                        LeafNodeStyle-CssClass="leafNode" runat="server" EnableViewState="true" ShowExpandCollapse="true" ShowLines="false" ExpandDepth="1" OnTreeNodeExpanded="Node_Expand" OnTreeNodeCollapsed="Node_Collapse" NodeStyle-HorizontalPadding="3" PopulateNodesFromClient="false" />
                </div>
            </fieldset>



            <div class="clearfix"></div>
            <div class="psform-group">
                <asp:LinkButton ID="BFinish" runat="server" OnClick="BFinish_Click" CssClass="psbtn psbtn-primary" CausesValidation="true" />
                <asp:LinkButton ID="RFinish" runat="server" CssClass="psbtn psbtn-default" OnClick="RFinish_Click" CausesValidation="false" />
            </div>
            <div class="psform-group">
                <asp:Label ID="Finishlbl" runat="server" Font-Size="Large"></asp:Label>
            </div>
            <asp:HiddenField ID="H_TabID" runat="server" />
        </div>
    </div>
</div>
<!-- End PanelOne -->

<script runat="server"> 
    void Node_Expand(Object sender, TreeNodeEventArgs e) { e.Node.Expand(); }
    void Node_Collapse(Object sender, TreeNodeEventArgs e) { e.Node.Collapse(); }
</script>
<script type="text/javascript">
    $('#ScrollingCB').change(function () {
        // this will contain a reference to the checkbox   
        if (this.checked) {
            // the checkbox is now checked 
            $('#ScrollingCB').prop('checked', true);
            $('#PagingCB').prop('checked', false);
        } else {
            // the checkbox is now no longer checked
            $('#ScrollingCB').prop('checked', false);
            $('#PagingCB').prop('checked', true);
        }
    });

    jQuery(function ($) {
        var setupModule = function () {
            $('#panels').dnnPanels({
                selected: 0
            });

            var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
            elems.forEach(function (html) {
                var switchery = new Switchery(html);
            });

            var changeCheckbox = document.querySelector('.js-check-change'), changeField = document.querySelector('.js-check-change-field');

            var changeCheckbox2 = document.querySelector('.RelatedCheck'), changeField = document.querySelector('.js-check-change-field');

            if (changeCheckbox != null) {
                changeCheckbox.onchange = function () {
                    if (changeCheckbox.checked) {
                        $("#<%=DDAllowCommentsLogin.ClientID%>").show();
                        $("#<%=AllowCommentsLoginlbl.ClientID%>").show();
                    } else {
                        $("#<%=DDAllowCommentsLogin.ClientID%>").hide();
                        $("#<%=AllowCommentsLoginlbl.ClientID%>").hide();
                    }
                };


            }

            if (changeCheckbox2 != null) {
                changeCheckbox2.onchange = function () {
                    if (changeCheckbox2.checked) {
                        $("#<%=NumRelatedtxt.ClientID%>").show();
                        $("#<%=NumRelatedlbl.ClientID%>").show();
                    } else {
                         $("#<%=NumRelatedtxt.ClientID%>").hide();
                        $("#<%=NumRelatedlbl.ClientID%>").hide();
                    }
                };


            }
            if (changeCheckbox != null) {
                if (changeCheckbox.checked) {
                    $("#<%=DDAllowCommentsLogin.ClientID%>").show();
                    $("#<%=AllowCommentsLoginlbl.ClientID%>").show();
                } else {
                    $("#<%=DDAllowCommentsLogin.ClientID%>").hide();
                    $("#<%=AllowCommentsLoginlbl.ClientID%>").hide();
                }
            }


           <%-- var changeCheckbox = document.querySelector('.js-check-change'), changeField = document.querySelector('.js-check-change-field');

            if (changeCheckbox != null) {
                changeCheckbox.onchange = function () {
                    if (changeCheckbox.checked) {
                        $("#<%=DDAllowCommentsLogin.ClientID%>").show();
                    $("#<%=AllowCommentsLoginlbl.ClientID%>").show();
                } else {
                    $("#<%=DDAllowCommentsLogin.ClientID%>").hide();
                    $("#<%=AllowCommentsLoginlbl.ClientID%>").hide();
                }
            };

            
        }--%>
        };
        setupModule();
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            // note that this will fire when _any_ UpdatePanel is triggered,
            // which may or may not cause an issue
            setupModule();
        });


    });
</script>
