<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tree.ascx.cs" Inherits="puresystems.Modules.psArticles.tree" %>
<%@ Register TagPrefix="dnnweb" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<dnnweb:DnnScriptBlock ID="RadScriptBlock1" runat="server">
	<script type="text/javascript">
		function onContextClicking(sender, eventArgs) {
			var id = '<%=ctlContext.ClientID%>';
			var item = eventArgs.get_menuItem();
			var cmd = item.get_value();

			/*get current node to set hash*/
			var nodeValue = eventArgs.get_node().get_value();
			location.hash = "#" + nodeValue;
		}
		function onContextShowing(sender, eventArgs) {
			var node = eventArgs.get_node();
			var menu = eventArgs.get_menu();
			if (node) {
				var a = node.get_attributes();

				//menu.findItemByValue('view').set_visible(a.getAttribute("CanView") == 'True');
				//menu.findItemByValue('edit').set_visible(a.getAttribute("CanEdit") == 'True');
			}
		}
		function OnClientNodeClicked(sender, eventArgs) {
			var nodeValue = eventArgs.get_node().get_value();
			location.hash = "#" + nodeValue;
		}
	</script>
</dnnweb:DnnScriptBlock>
<div class="dnnForm dnnTabsModule dnnClear" id="dnnTabsModule">
	<div class="dnnTreeArea">

        <div class="dnnTreeExpand">
	        <asp:LinkButton ID="cmdExpandTree" runat="server" CommandName="Expand" />
        </div>
        <dnnweb:DnnTreeView ID="ctlPages" cssclass="dnnTreePages" runat="server" AllowNodeEditing="false"
		         OnClientContextMenuShowing="onContextShowing" OnClientContextMenuItemClicking="onContextClicking"
		          OnClientNodeClicked="OnClientNodeClicked" EnableDragAndDropBetweenNodes="false">
                <ContextMenus>                
				        <dnnweb:DnnTreeViewContextMenu ID="ctlContext" runat="server">
					        <Items>                                            
						        <dnnweb:DnnMenuItem Text="Edit" Value="edit" />
					        </Items>
				        </dnnweb:DnnTreeViewContextMenu>               
                </ContextMenus>
        </dnnweb:DnnTreeView>
        <div class="dnnTreeLegend">
			<h3><asp:Label ID="lblLegend" runat="server" resourcekey="lblLegend" /></h3>
			<div class="dtlItem">
				<img runat="server" src="images/Icon_Home.png" alt="" />
				<asp:Literal ID="lblHome" runat="server" />
			</div>
			<div class="dtlItem">
				<img runat="server" src="images/Icon_Everyone.png" alt="" />
				<asp:Literal ID="lblEveryone" runat="server" />
			</div>
			<div class="dtlItem">
				<img runat="server" src="images/Icon_User.png" alt="" />
				<asp:Literal ID="lblRegistered" runat="server" />
			</div>
			<div class="dtlItem">
				<img runat="server" src="images/Icon_UserSecure.png" alt="" />
				<asp:Literal ID="lblSecure" runat="server" />
			</div>
			<div class="dtlItem">
				<img runat="server" src="images/Icon_UserAdmin.png" alt="" />
				<asp:Literal ID="lblAdminOnly" runat="server" />
			</div>
			<div class="dtlItem">
				<img runat="server" src="images/Icon_Hidden.png" alt="" />
				<asp:Literal ID="lblHidden" runat="server" />
			</div>                
			<div class="dtlItem">
				<img runat="server" src="images/Icon_Disabled.png" alt="" />
				<asp:Literal ID="lblDisabled" runat="server" />
			</div>
            <div class="dtlItem">
				<img runat="server" src="images/Icon_Redirect.png" alt="" />
				<asp:Literal ID="lblRedirect" runat="server" />
			</div>
		</div>
    </div>
    <div>
        <div class="tmTabContainer" runat="server" visible="false" id="pnlDetails">
            <div class="dnnClear">
			    <h2><%=LocalizeString("PageCacheHeading1")%></h2>
			    <fieldset>
                    <div class="dnnFormItem">
					    <dnn:Label ID="lblCacheProvider" runat="server" ControlName="cboCacheProvider" ResourceKey="lblCacheProvider"></dnn:Label>
                        <asp:DropDownList ID="cboCacheProvider" runat="server" AutoPostBack="true" DataValueField="Key" DataTextField="Key" />
				    </div>
                    <div id="CacheStatus" runat="server" visible="false" class="dnnFormItem">
					    <dnn:Label ID="lblCacheStatus" runat="server" ResourceKey="CacheStatus"></dnn:Label>
					    <asp:Label ID="lblCachedItemCount" runat="server" />
				    </div>
                    <div id="CacheCmds" runat="server" visible="false" class="dnnFormItem">
                        <dnn:Label ID="Label1" runat="server" ResourceKey="CacheStatus"></dnn:Label>
					    <asp:LinkButton ID="cmdClearPageCache" runat="server" CssClass="dnnSecondaryAction" resourcekey="cmdClearPageCache" />&nbsp;|&nbsp;<asp:LinkButton ID="cmdClearAllPageCache" runat="server" CssClass="dnnSecondaryAction" resourcekey="cmdClearAllPageCache"/>
				    </div>
				    <div  id="CacheDuration" runat="server" visible="false" class="dnnFormItem">
					    <dnn:Label ID="lblPageCacheDuration" runat="server" />
					    <asp:TextBox ID="txtPageCacheDuration" runat="server" CssClass="dnnFormRequired" />
					    <asp:RequiredFieldValidator ID="valName" runat="server" Display="Dynamic" resourcekey="valCacheDuration.Error" ControlToValidate="txtPageCacheDuration" CssClass="dnnFormMessage dnnFormError" ValidationGroup="Page" SetFocusOnError="true" />
				    </div>
                    <div id="CacheIncludeExclude" runat="server" visible="false" class="dnnFormItem">
					<dnn:Label ID="lblCacheIncludeExclude" runat="server" ControlName="rblCacheIncludeExclude" ResourceKey="lblCacheIncludeExclude"></dnn:Label>
					<asp:RadioButtonList ID="rblCacheIncludeExclude" runat="server" AutoPostBack="true" CssClass="dnnFormRadioButtons" RepeatLayout="Flow">
						<asp:ListItem Text="Exclude" Value="0" />
						<asp:ListItem Text="Include" Value="1" />
					</asp:RadioButtonList>
				    </div>        
				    <div id="IncludeVaryBy" runat="server" visible="false" class="dnnFormItem">
					    <dnn:Label ID="lblIncludeVaryBy" runat="server" ControlName="txtIncludeVaryBy" ResourceKey="lblIncludeVaryBy"></dnn:Label>
					    <asp:TextBox ID="txtIncludeVaryBy" runat="server" />
				    </div>        
				    <div id="ExcludeVaryBy" runat="server" visible="false" class="dnnFormItem">
					    <dnn:Label ID="lblExcludeVaryBy" runat="server" ControlName="txtExcludeVaryBy" ResourceKey="lblExcludeVaryBy"></dnn:Label>
					    <asp:TextBox ID="txtExcludeVaryBy" runat="server" />
				    </div>        
				    <div id="MaxVaryByCount" runat="server" visible="false" class="dnnFormItem">
					    <dnn:Label ID="lblMaxVaryByCount" runat="server" ControlName="txtMaxVaryByCount" ResourceKey="lblCacheMaxVaryByCount"></dnn:Label>
					    <asp:TextBox ID="txtMaxVaryByCount" runat="server" />
					    <asp:CompareValidator ID="valMaxVaryByCount" ControlToValidate="txtMaxVaryByCount" Operator="DataTypeCheck" Type="Integer" Runat="server" Display="Dynamic" resourcekey="valCacheTime.ErrorMessage" />
				    </div>
			    </fieldset>
		    </div>
            
            <ul class="dnnActions dnnClear">
	            <li><asp:LinkButton ID="cmdUpdate" runat="server" resourcekey="cmdUpdate" CssClass="dnnPrimaryAction" ValidationGroup="Page" /></li>
                <li><asp:LinkButton ID="cmdCancel" runat="server" resourcekey="cmdCancel" CssClass="dnnSecondaryAction" ValidationGroup="Page" /></li>
            </ul>   		
        </div>
        

    </div>
</div>