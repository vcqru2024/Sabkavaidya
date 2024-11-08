<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserVendor_Auction.ascx.cs"
    Inherits="Cross.Modules.CP_Product.View.UserVendor_Auction" %>
<%@ Register TagPrefix="cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke.WebControls" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web.Deprecated" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="cross" TagName="UserFile" Src="~/DesktopModules/CrossClassified/controls/UserFileSelect.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register Assembly="System.Web.Silverlight" Namespace="System.Web.UI.SilverlightControls"
    TagPrefix="asp" %>
<%@ Register TagPrefix="dnnweb" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>

<style type="text/css">
.CrossGrid th{
  text-align:center;
}
</style>

<script type="text/javascript">
    function checkAll_Product() {
        if ($(":checkbox[id*='chkAll_Product']").prop("checked") == true) {
            $(":checkbox[id*='chkItem_Product']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_Product']").prop("checked", false);
        }
    }

    function checkAll_Download() {
        if ($(":checkbox[id*='chkAll_Download']").prop("checked") == true) {
            $(":checkbox[id*='chkItem_Download']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_Download']").prop("checked", false);a
        }
    }
    function checkAll_Video() {
        if ($(":checkbox[id*='chkAll_Video']").prop("checked") == true) {
            $(":checkbox[id*='chkItem_Video']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_Video']").prop("checked", false);
        }
    }
    function checkAll_Audio() {
        if ($(":checkbox[id*='chkAll_Audio']").prop("checked") == true) {
            $(":checkbox[id*='chkItem_Audio']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_Audio']").prop("checked", false);
        }
    }
    function checkAll_Image() {
        if ($(":checkbox[id*='chkAll_Image']").prop("checked") == true) {
            $(":checkbox[id*='chkItem_Image']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_Image']").prop("checked", false);
        }
    }
    function checkAll_Attachment() {
        if ($(":checkbox[id*='chkAll_Attachment']").prop("checked") == true) {
            $(":checkbox[id*='chkItem_Attachment']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_Attachment']").prop("checked", false);
        }
    }


    function addTag() {
        var tag = document.getElementById("<%=ddlPopularTag.ClientID%>").value;
        var allTag = $(":text[id*='txtTag']").get();
        for (var i = 0; i < allTag.length; i++) {
            if (allTag[i].value == "") {
                allTag[i].value = tag;
                break;
            }
        }
        return false;
    }
    $(function () {
        $("#tabs").tabs();
       // $("#tabs").tabs({ event: "mouseover" });

        $("#tabs").tabs(
         {
             activate: function (event, ui) {
                 //Get or set the active option, after initialization:
                 var currentActive = $("#tabs").tabs("option", "active");
                 //set it to a hidden field
                 $("#<%= hidLastTab.ClientID %>").attr("value", currentActive.toString());
             }
         });

        var currTab = $("#<%= hidLastTab.ClientID %>").val();
        if (!isNaN(parseInt(currTab)))//if current value is number, then parse it as integer
        {
            currTab = parseInt(currTab);
        }

        $("#tabs").tabs({ active: currTab });

    });
     //js upload for software
    var fileUpload;

    function getFileUpload() {
        if (typeof fileUpload === "undefined") {
            var fileUploadId = '<%= ctlUploadJs.ClientID %>';
            fileUpload = dnn[fileUploadId];
        }
        return fileUpload;
    }

    function uploadFiles() {
        var options = {
            folderPath: '<%= TemporaryUploadFolderPath %>',
            folderPicker: {
                disabled: true,
                initialState: {
                    selectedItem: {
                        key: '<%= TemporaryUploadFolderId %>',
                        value: '<%= TemporaryUploadFolderName %>'
                    }
                }
            }
        };
        var instance = getFileUpload();
        instance.show(options);
        return false;
    }
</script>
<asp:HiddenField runat="server" ID="hidLastTab" Value="0" />
<table width="100%" class="dnnFormItem" align="center" runat="server" id="tblButton">
    <tr>
        <td align="center">
            <asp:Label ID="lblProductQuota" runat="server" />&nbsp;
            <asp:Label ID="lblType" runat="server" resourcekey="lblType" />
            <asp:DropDownList ID="ddlType" runat="server" DataTextField="Name" DataValueField="Id" Width="150px"
                AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
            </asp:DropDownList>
            &nbsp;
            <dnn:CommandButton ID="btnAdd" runat="server" ImageUrl="~/images/add.gif" OnCommand="btnAdd_Click"
                CausesValidation="false" Visible="false" />
            &nbsp;
            <dnn:CommandButton ID="btnChooseDownloadFromFile" runat="server" ImageUrl="~/images/epi_save.gif"
                OnCommand="btnChooseDownloadFromFile_Click" CausesValidation="false" ResourceKey="btnChooseDownloadFromFile" />
            &nbsp;
            <dnn:CommandButton ID="btnDeleteSelected" runat="server" ResourceKey="btnDeleteSelected"
                CausesValidation="false" ImageUrl="~/images/delete.gif" OnCommand="btnDeleteSelected_Click"
                OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItems",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
            &nbsp;
            <dnn:CommandButton ID="btnRepublishSelected" runat="server" ResourceKey="btnRepublishSelected"
                CausesValidation="false" ImageUrl="~/DesktopModules/CrossClassified/images/republish.png"
                OnCommand="btnRepublishSelected_Click" OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("RepublishItems",LocalResourceFile)) %>' />
            &nbsp;
            <dnn:CommandButton ID="btnUpdate" runat="server" ResourceKey="cmdUpdate" ImageUrl="~/images/save.gif"
                OnCommand="btnUpdate_Click" Visible="false" />
            &nbsp;
            <dnn:CommandButton ID="btnDelete" runat="server" ResourceKey="cmdDelete" ImageUrl="~/images/delete.gif"
                OnCommand="btnDelete_Click" Visible="false" CausesValidation="false" OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
            &nbsp;
            <dnn:CommandButton ID="btnCancel" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                OnCommand="btnCancel_Click" Visible="false" CausesValidation="false" />
            &nbsp;
            <dnn:CommandButton ID="btnBackToList" runat="server" ResourceKey="btnBackToList"
                CausesValidation="false" Visible="false" ImageUrl="~/DesktopModules/CrossClassified/images/up.gif"
                OnCommand="btnBackToList_Click" />
            &nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnAdminHome" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
</table>
<table width="100%" class="dnnFormItem" align="left" runat="server" id="tblProductList">
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
            <br />
            <asp:Label ID="lblProductCategory" runat="server" resourcekey="lblProductCategory" />
            <asp:DropDownList ID="ddlCategory" runat="server" DataTextField="Name" DataValueField="Id"
                Width="300px">
            </asp:DropDownList>
           
              <asp:Label ID="lblAuctionResult" runat="server" resourcekey="lblAuctionResult" />
            <asp:DropDownList ID="ddlAuctionResult" runat="server" Width="400px">
                <asp:ListItem Value="-1" Selected="True" resourcekey="li_All"></asp:ListItem>
                <asp:ListItem Value="0" resourcekey="li_AuctionResult_InBidding"></asp:ListItem>
                <asp:ListItem Value="1" resourcekey="li_AuctionResult_NoBid"></asp:ListItem>
                <asp:ListItem Value="2" resourcekey="li_AuctionResult_HasBidButReservePriceNotMet"></asp:ListItem>
                <asp:ListItem Value="3" resourcekey="li_AuctionResult_PriceValidForBidderPurchase"></asp:ListItem>
                <asp:ListItem Value="4" resourcekey="li_AuctionResult_SoldOut"></asp:ListItem>
            </asp:DropDownList>
            <br />
             <asp:Label ID="lblProductStatus" runat="server" resourcekey="lblProductStatus" />
            <asp:DropDownList ID="ddlProductStatus" runat="server" Width="150px">
                <asp:ListItem Value="All" Selected="True" resourcekey="li_All"></asp:ListItem>
                <asp:ListItem Value="UnAuthed" resourcekey="li_ProductStatus_UnAuthed"></asp:ListItem>
                <asp:ListItem Value="UnActive" resourcekey="li_ProductStatus_UnActive"></asp:ListItem>
                <asp:ListItem Value="Featured" resourcekey="li_ProductStatus_Featured"></asp:ListItem>
                <asp:ListItem Value="Expired" resourcekey="li_ProductStatus_Expired"></asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblPageSize" runat="server" resourcekey="lblPageSize" />
            <asp:DropDownList ID="ddlPageSize" runat="server" Width="80px">
                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                <asp:ListItem Text="20" Value="20" Selected="True"></asp:ListItem>
                <asp:ListItem Text="30" Value="30"></asp:ListItem>
                <asp:ListItem Text="40" Value="40"></asp:ListItem>
                <asp:ListItem Text="50" Value="50"></asp:ListItem>
                <asp:ListItem Text="60" Value="60"></asp:ListItem>
                <asp:ListItem Text="70" Value="70"></asp:ListItem>
                <asp:ListItem Text="80" Value="80"></asp:ListItem>
                <asp:ListItem Text="90" Value="90"></asp:ListItem>
                <asp:ListItem Text="100" Value="100"></asp:ListItem>
                <asp:ListItem Text="200" Value="200"></asp:ListItem>
                <asp:ListItem Text="500" Value="500"></asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblProductName" runat="server" resourcekey="lblProductName1" />
            <asp:TextBox ID="txtSearch" runat="server" Width="250px"></asp:TextBox>
            <dnn:CommandButton ID="btnSearch" runat="server" CausesValidation="false" ImageUrl="~/images/icon_search_16px.gif"
                ResourceKey="btnSearch" OnCommand="btnSearch_Click" />
        </td>
    </tr>
    <tr align="left">
        <td>
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="Id" OnRowCommand="gvList_RowCommand" OnDataBinding="gvList_DataBinding">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecordes" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAll_Product" runat="server" onclick="checkAll_Product()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItem_Product" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='40' BorderStyle="Solid"
                                BorderWidth="1" BorderColor="DarkGray" ID='imgProduct'  />
                        </ItemTemplate>
                         <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblName" runat="server" resourcekey="lblName">Name</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlProductNameData" runat="server" Text='<%# Eval("Name") %>' ForeColor='<%# GetForeColor(Convert.ToString(Eval("AuctionCheckResult"))) %>'
                                Target="_blank" NavigateUrl='<%#GetProductUrl(Convert.ToString(Eval("Id"))) %>'></asp:HyperLink>

                         
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblStartPrice" runat="server" resourcekey="lblStartPrice"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblStartPriceField" runat="server" Text='<%#Eval("StartPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblReservePrice" runat="server" resourcekey="lblReservePrice"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblReservePriceField" runat="server" Text='<%#Eval("ReservePrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblBuyNowPrice" runat="server" resourcekey="lblBuyNowPrice"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBuyNowPriceField" runat="server" Text='<%#Eval("BuyNowPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblViews" runat="server" resourcekey="lblViews">Views</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblViewsField" runat="server" Text='<%# Eval("Views") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblCurrentBid" runat="server" resourcekey="lblCurrentBid"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCurrentBidField" runat="server" Text='<%#GetCurrentBid(Convert.ToString(Eval("Id"))) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblStockQuantity" runat="server" resourcekey="lblStockQuantity">StockQuantity</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblStockQuantityField" runat="server" Text='<%# Eval("StockQuantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate">Created Date</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCreatedDateField" runat="server" Text='<%#  Convert.ToDateTime(Eval("CreatedDate")).ToShortDateString() %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="right">
                        <HeaderTemplate>
                            <asp:Label ID="lblExpireDate" runat="server" resourcekey="lblExpireDateDate">Expire Date</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblExpireDateField" runat="server" Text='<%#  Eval("ExpireDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAuthed" runat="server" resourcekey="lblAuthed">Authed</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkAuthedField" runat="server" Checked='<%# Eval("Authed") %>'
                                Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblActive" runat="server" resourcekey="lblActive">Active</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkActiveField" runat="server" Checked='<%# Eval("Active") %>'
                                Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblFeatured" runat="server" resourcekey="lblFeatured">Featured</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkFeaturedField" runat="server" Checked='<%# Eval("Featured") %>'
                                Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblExpired" runat="server" resourcekey="lblExpired">Expired</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkExpiredField" runat="server" Checked='<%# Eval("Expired") %>'
                                Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                     <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAuctionCheckResult" runat="server" resourcekey="lblAuctionCheckResult">Result</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAuctionCheckResultField" runat="server" Text='<%#  Eval("AuctionCheckResult") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Select"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />
                            <asp:ImageButton ID="imgCopyAsNew" runat="server" CausesValidation="False" CommandName="Copy"
                                CommandArgument='<%# Eval("Id")%>' AlternateText='<%#Localization.GetString("imgCopyAsNew", LocalResourceFile)%>'
                                ImageUrl="~/images/icon_tabs_16px.gif" ToolTip='<%#Localization.GetString("imgCopyAsNew", LocalResourceFile)%>' />
                            <asp:ImageButton ID="imgToggleAuthed" runat="server" CausesValidation="False" CommandName="Auth"
                                CommandArgument='<%# Eval("Id")%>' Visible="<%#HasManagePermission%>" AlternateText='<%#Localization.GetString("imgToggleAuthed", LocalResourceFile)%>'
                                ImageUrl="~/images/icon_authentication_16px.gif" ToolTip='<%#Localization.GetString("imgToggleAuthed", LocalResourceFile)%>' />
                            <asp:ImageButton ID="imgToggleActive" runat="server" CausesValidation="False" CommandName="Active"
                                CommandArgument='<%# Eval("Id")%>' AlternateText='<%#Localization.GetString("imgToggleActive", LocalResourceFile)%>'
                                ImageUrl="~/images/icon_moduledefinitions_16px.gif" ToolTip='<%#Localization.GetString("imgToggleActive", LocalResourceFile)%>' />
                            <asp:ImageButton ID="imgToggleFeatured" runat="server" CausesValidation="False" CommandName="Featured"
                                CommandArgument='<%# Eval("Id")%>' Visible="<%#HasManagePermission%>" AlternateText='<%#Localization.GetString("imgToggleFeatured", LocalResourceFile)%>'
                                ImageUrl="~/images/icon_dashboard_16px.gif" ToolTip='<%#Localization.GetString("imgToggleFeatured", LocalResourceFile)%>' />
                            <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif" AlternateText='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />

                              <asp:HyperLink ID="hlContentLocalization" Target="_blank" ImageUrl="~/DesktopModules/CrossClassified/images/ml_content_16.gif"
                                Visible="<%#SupportsContentLocalization%>" runat="server" NavigateUrl='<%# EditUrl("ContentLocalize_Product") + "?ProductId=" + Eval("Id").ToString() %>' />
                        
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblRelatedInfo" runat="server" resourcekey="lblRelatedInfo"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgDownload" runat="server" CausesValidation="False" CommandName="Download"
                                Visible="<%#Sellable && IsSoftware%>" CommandArgument='<%# Eval("Id")%>'
                                ToolTip='<%#Localization.GetString("imgDownload",LocalResourceFile)%>' ImageUrl="~/DesktopModules/CrossClassified/images/download.gif"
                                AlternateText='<%#Localization.GetString("imgDownload", LocalResourceFile)%>' />
                            <asp:ImageButton ID="imgAttachment" runat="server" CausesValidation="False" CommandName="Attachment"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgAttachment",LocalResourceFile)%>'
                                ImageUrl="~/DesktopModules/CrossClassified/images/Attachment.gif" AlternateText='<%#Localization.GetString("imgAttachment", LocalResourceFile)%>'
                                Visible="<%#Settings_Portal.Feature.EnableDocument%>" />
                            <asp:ImageButton ID="imgVideo" runat="server" CausesValidation="False" CommandName="Video"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgVideo",LocalResourceFile)%>'
                                ImageUrl="~/DesktopModules/CrossClassified/images/video.gif" AlternateText='<%#Localization.GetString("imgVideo", LocalResourceFile)%>'
                                Visible="<%#Settings_Portal.Feature.EnableVideo%>" />
                            <asp:ImageButton ID="imgAudio" runat="server" CausesValidation="False" CommandName="Audio"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgAudio",LocalResourceFile)%>'
                                ImageUrl="~/DesktopModules/CrossClassified/images/audio.gif" AlternateText='<%#Localization.GetString("imgAudio", LocalResourceFile)%>'
                                Visible="<%#Settings_Portal.Feature.EnableAudio%>" />
                            <asp:ImageButton ID="imgImage" runat="server" CausesValidation="False" CommandName="Image"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgImage",LocalResourceFile)%>'
                                ImageUrl="~/DesktopModules/CrossClassified/images/image.gif" AlternateText='<%#Localization.GetString("imgImage", LocalResourceFile)%>'
                                Visible="<%#Settings_Portal.Feature.EnableImage%>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAuctionInfo" runat="server" resourcekey="lblAuctionInfo"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgBiddingHistory" runat="server" CausesValidation="False" CommandName="BiddingHistory"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgBiddingHistory",LocalResourceFile)%>'
                                ImageUrl="~/DesktopModules/CrossClassified/images/auction16.png" AlternateText='<%#Localization.GetString("imgBiddingHistory", LocalResourceFile)%>' />
                            <asp:ImageButton ID="imgRepublish" runat="server" CausesValidation="False" CommandName="Republish"
                                Visible='<%#IsAuctionExpired(Eval("Id").ToString()) %>' CommandArgument='<%# Eval("Id")%>'
                                ImageUrl="~/DesktopModules/CrossClassified/images/Republish.png" AlternateText='<%#Localization.GetString("imgRepublish", LocalResourceFile)%>'
                                ToolTip='<%#Localization.GetString("imgRepublish", LocalResourceFile)%>' OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("RepublishItem",LocalResourceFile)) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="CrossGrid"/>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr align="left">
        <td>
            <cross:PagingControl ID="ctlPagingControl" runat="server" Mode="PostBack" OnPageChanged="ctlPagingControl_PageChanged">
            </cross:PagingControl>
        </td>
    </tr>
    <tr>
        <td>
            <div class="dnnTreeLegend" id="divLegend" runat="server">
                <h6>
                    <asp:Label ID="lblLegend" runat="server" resourcekey="lblLegend" /></h6>
                <div class="dtlItem">
                    <img alt="" id="Img1" runat="server" src="~/images/edit.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblEdit" runat="server" Text='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img11" runat="server" src="~/images/icon_tabs_16px.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblCopyAsNew" runat="server" Text='<%#Localization.GetString("imgCopyAsNew", LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <%if (HasManagePermission)
                      {%>
                    <img alt="" id="Img3" runat="server" src="~/images/icon_authentication_16px.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblToggleAuthed" runat="server" Text='<%#Localization.GetString("imgToggleAuthed", LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <% } %>
                    <img alt="" id="Img4" runat="server" src="~/images/icon_moduledefinitions_16px.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblToggleActive" runat="server" Text='<%#Localization.GetString("imgToggleActive", LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <%if (HasManagePermission)
                      {%>
                    <img alt="" id="Img6" runat="server" src="~/images/icon_dashboard_16px.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblToggleFeatured" runat="server" Text='<%#Localization.GetString("imgToggleFeatured", LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <% } %>
                    <img alt="" id="Img7" runat="server" src="~/images/delete.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblDelete" runat="server" Text='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    
                      <%if (SupportsContentLocalization)
                      {%>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img2" runat="server" src="~/DesktopModules/CrossClassified/images/ml_content_16.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="Literal8" runat="server" Text='<%#Localization.GetString("imgContentLocalization", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <% } %>

                    <br />
                  
                    <%if (Sellable && (IsSoftware))
                      {%>
                    <img alt="" id="Img5" runat="server" src="~/DesktopModules/CrossClassified/images/download.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblDownload" runat="server" Text='<%#Localization.GetString("imgDownload",LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                  
                    <br />
                    <% } %>
              
                  
                    <%if (Settings_Portal.Feature.EnableDocument)
                      {%>
                    <img alt="" id="Img8" runat="server" src="~/DesktopModules/CrossClassified/images/Attachment.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblAttachment" runat="server" Text='<%#Localization.GetString("imgAttachment",LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <% } %>
                    <%if (Settings_Portal.Feature.EnableVideo)
                      {%>
                    <img alt="" id="Img10" runat="server" src="~/DesktopModules/CrossClassified/images/video.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblVideo" runat="server" Text='<%#Localization.GetString("imgVideo",LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <% } %>
                    <%if (Settings_Portal.Feature.EnableAudio)
                      {%>
                    <img alt="" id="imgAudio" runat="server" src="~/DesktopModules/CrossClassified/images/Audio.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblAudio" runat="server" Text='<%#Localization.GetString("imgAudio",LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <% } %>
                    <%if (Settings_Portal.Feature.EnableImage)
                      {%>
                    <img alt="" id="Img9" runat="server" src="~/DesktopModules/CrossClassified/images/image.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblPhoto" runat="server" Text='<%#Localization.GetString("imgImage",LocalResourceFile)%>' />
                    <% } %>
                    <br />
                   
                    <img alt="" id="Img12" runat="server" src="~/DesktopModules/CrossClassified/images/auction16.png" />&nbsp;=&nbsp;
                    <asp:Literal ID="litBiddingHistory" runat="server" Text='<%#Localization.GetString("imgBiddingHistory",LocalResourceFile)%>' />
                    <br /><br />
                    <img alt="" id="Img13" runat="server" src="~/DesktopModules/CrossClassified/images/republish.png" />&nbsp;=&nbsp;
                    <asp:Literal ID="litRepublish" runat="server" Text='<%#Localization.GetString("imgRepublish",LocalResourceFile)%>' />
                </div>
                <h6>
                  <br />
             
                    <asp:Label ID="Label5" runat="server" resourcekey="lblColorLegend" /></h6>
                <div class="dtlItem">
              
                    <asp:Label ID="lblColor_Black" runat="server" resourcekey="li_AuctionResult_InBidding" ForeColor="Black" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblColor_Red" runat="server" resourcekey="li_AuctionResult_NoBid" ForeColor="Red" />&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Label ID="lblColor_Orange" runat="server" resourcekey="li_AuctionResult_HasBidButReservePriceNotMet" ForeColor="Orange" /><br />

                    <asp:Label ID="lblColor_ForestGreen" runat="server" resourcekey="li_AuctionResult_PriceValidForBidderPurchase" ForeColor="Blue" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblColor_Green" runat="server" resourcekey="li_AuctionResult_SoldOut" ForeColor="Green" />&nbsp;&nbsp;&nbsp;&nbsp;
                   
                    
                </div>
            </div>
        </td>
    </tr>
</table>
<div id="divProductDetail" runat="server">
    <div class="dnnFormItem dnnFormHelp dnnClear">
        <p align="right">
            <span>
                <asp:Image ID="Image7" runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" />
                <%=LocalizeString("RequiredFields")%>
            </span>
        </p>
    </div>
    <div id="tabs" style="width: 100%; overflow:hidden">
        <ul>
            <li><a href="#divBasic"><span>
                <%#Localization.GetString("divBasic", LocalResourceFile)%></span></a> </li>
             <li><a href="#divCategory"><span>
                <%#Localization.GetString("divCategory", LocalResourceFile)%></span></a> </li>

                <%if (CurrentType.AllowLocation)
              {%>
            <li><a href="#divLocation"><span>
                <%#Localization.GetString("divLocation", LocalResourceFile)%></span></a> </li>
            <%} %>

            <%if (CurrentType.AllowGoogleMap)
              {%>
            <li><a href="#divMap"><span>
                <%#Localization.GetString("divMap", LocalResourceFile)%></span></a> </li>
            <%} %>
           
            <li><a href="#divTag"><span>
                <%#Localization.GetString("divTag", LocalResourceFile)%></span></a> </li>
            <%if (HasManagePermission)
              {%>
            <li><a href="#divPermission"><span>
                <%#Localization.GetString("divPermission", LocalResourceFile)%></span></a> </li>
            <%} %>
            <%if (CurrentType.FieldEnable_Summary)
              {%>
            <li><a href="#divSummary"><span>
                <%#Localization.GetString("divSummary", LocalResourceFile)%></span></a> </li>
            <%} %>
            <%if (CurrentType.FieldEnable_Description)
              {%>
            <li><a href="#divDescription"><span>
                <%#Localization.GetString("divDescription", LocalResourceFile)%></span></a>
            </li>
            <%} %>
            <%if (CurrentType.FieldEnable_SpecialOffer)
              {%>
            <li><a href="#divSpecialOffer"><span>
                <%#Localization.GetString("divSpecialOffer", LocalResourceFile)%></span></a>
            </li>
            <%} %>
            <%if (CurrentType.FieldEnable_Delivery && IsGoods)
              {%>
            <li><a href="#divDelivery"><span>
                <%#Localization.GetString("divDelivery", LocalResourceFile)%></span></a> </li>
            <%} %>
            <%if (CurrentType.FieldEnable_License && IsSoftware)
              {%>
            <li><a href="#divLicense"><span>
                <%#Localization.GetString("divLicense", LocalResourceFile)%></span></a> </li>
            <%} %>
            <%if (CurrentType.FieldEnable_Support)
              {%>
            <li><a href="#divSupport"><span>
                <%#Localization.GetString("divSupport", LocalResourceFile)%></span></a> </li>
            <%} %>
            <%if (CurrentType.EnableField1)
              {%>
            <li><a href="#divField1"><span>
                <%#CurrentType.Field1Title%></span></a> </li>
            <%} %>
            <%if (CurrentType.EnableField2)
              {%>
            <li><a href="#divField2"><span>
                <%#CurrentType.Field2Title%></span></a> </li>
            <%} %>
            <%if (CurrentType.EnableField3)
              {%>
            <li><a href="#divField3"><span>
                <%#CurrentType.Field3Title%></span></a> </li>
            <%} %>
            <%if (CurrentType.EnableField4)
              {%>
            <li><a href="#divField4"><span>
                <%#CurrentType.Field4Title%></span></a> </li>
            <%} %>
            <%if (CurrentType.EnableField5)
              {%>
            <li><a href="#divField5"><span>
                <%#CurrentType.Field5Title%></span></a> </li>
            <%} %>
        </ul>
        <div id="divBasic" class="dnnFormItem" style="height: 200%; overflow:hidden">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plName" runat="server" ControlName="txtName"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" Columns="70" runat="server" />
                        <asp:Image ID="Image1" runat="server"
                            ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="varName" runat="server" CssClass="NormalRed" resourcekey="Required"
                            Display="Dynamic" ControlToValidate="txtName">* Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%if (HasManufacturer)
                  {%>
                <tr>
                    <td>
                        <dnn:Label ID="plManufacturer" runat="server" ControlName="ddlManufacturer"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlManufacturer" runat="server" Width="400px" />
                    </td>
                </tr>
                <%} %>
                <%if (CurrentType.FieldEnable_Sku)
                  {%>
                <tr>
                    <td>
                        <dnn:Label ID="plSku" runat="server" ControlName="txtSku"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSku" Columns="30" runat="server" />
                    </td>
                </tr>
                <%} %>
            
                <tr>
                    <td>
                        <dnn:Label ID="plImage" runat="server" ControlName="ctlImage" />
                    </td>
                    <td valign="middle">
                        <cross:UserFile ID="ctlImage" runat="server" FileFilter="jpg,jpeg,jpe,bmp,png" Width="350px" />
                    </td>
                </tr>
              
                <%if (CurrentType.FieldEnable_PreviousVersion)
                  {%>
                <tr>
                    <td>
                        <dnn:Label ID="plPreviousVersion" runat="server" ControlName="ddlPreviousVersion" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPreviousVersion" Width="600px" runat="server" DataTextField="Name"
                            DataValueField="Id" />
                    </td>
                </tr>
                <%} %>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label19" runat="server" resourcekey="Tip_AuctionPrice" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plStartPrice" runat="server" ControlName="txtStartPrice"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStartPrice" width="200px" runat="server" Text="1" />
                    </td>
                </tr>
                  <%if (CurrentType.AuctionType == Convert.ToInt16(Cross.Modules.CP_Auction.Business.AuctionType.English)
                        || CurrentType.AuctionType == Convert.ToInt16(Cross.Modules.CP_Auction.Business.AuctionType.Vickrey))
                  {%>
                <tr>
                    <td>
                        <dnn:Label ID="plBidIncrement" runat="server" ControlName="txtBidIncrement"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBidIncrement" width="200px" runat="server" Text="10" />
                    </td>
                </tr>
                 <%} %>
                <tr>
                    <td>
                        <dnn:Label ID="plReservePrice" runat="server" ControlName="txtReservePrice" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtReservePrice" width="200px" runat="server" Text="0" />
                    </td>
                </tr>
                  <%if (CurrentType.AuctionType != Convert.ToInt16(Cross.Modules.CP_Auction.Business.AuctionType.Second_item))
                  {%>
                <tr>
                    <td>
                        <dnn:Label ID="plBuyNowPrice" runat="server" ControlName="txtBuyNowPrice">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBuyNowPrice" width="200px" runat="server" Text="0" />
                    </td>
                </tr>
                <%} %>
                  <tr>
                    <td colspan="2">
                        <asp:Label ID="Label10" runat="server" resourcekey="Tip_AuctionDate" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plStartDate" runat="server" ControlName="startDatePicker">
                        </dnn:Label>
                    </td>
                    <td>
                       <dnn:dnndatetimepicker ID="startDatePicker" runat="server" width="400px"/>&nbsp;
                      
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plEndDate" runat="server" ControlName="endDatePicker">
                        </dnn:Label>
                    </td>
                    <td>
                       <dnn:dnndatetimepicker ID="endDatePicker" runat="server" width="400px"/>&nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plAuctionDays" runat="server" ControlName="txtAuctionDays"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAuctionDays" runat="server" width="200px" Text="1"></asp:TextBox>
                        <asp:Label ID="lblActionDaysLimit" runat="server" />
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator7" resourcekey="MustBeInteger" ForeColor="Red"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtAuctionDays"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <%if (CurrentType.AllowRecursiveBill)
                  {%>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" resourcekey="Tip_RecursiveBill" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRecursiveBill" runat="server" ControlName="chkRecursiveBill" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chkRecursiveBill" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plBillPeriod" runat="server" ControlName="txtBillPeriod"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBillPeriod" runat="server"  Text="1" Width="50px"></asp:TextBox>
                        <asp:DropDownList ID="ddlBillFrequency" runat="server" Width="100px">
                            <asp:ListItem Value="0" resourcekey="li_BillFrequency_Day"></asp:ListItem>
                            <asp:ListItem Value="1" resourcekey="li_BillFrequency_Week"></asp:ListItem>
                            <asp:ListItem Value="2" resourcekey="li_BillFrequency_Month"></asp:ListItem>
                            <asp:ListItem Value="3" resourcekey="li_BillFrequency_Year"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="^[0-9]*[1-9][0-9]*$" ControlToValidate="txtBillPeriod"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <%} %>
                <%if (CurrentType.AuctionType == Convert.ToInt16(Cross.Modules.CP_Auction.Business.AuctionType.Second_item))
                  {%>
                <tr>
                    <td>
                        <dnn:Label ID="plStockQuantity" runat="server" ControlName="txtStockQuantity"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStockQuantity" runat="server" width="200px" Text="2"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator6" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="^-?\d+$" ControlToValidate="txtStockQuantity"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <%} %>
                <%if (CurrentType.FieldEnable_Weight && IsGoods)
                  {%>
                <tr>
                    <td>
                        <dnn:Label ID="plWeight" runat="server" ControlName="txtWeight"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWeight" width="200px" runat="server" Text="1" /><%#Settings_Portal.Order.WeightSymbol%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plShippingFeeType" runat="server" ControlName="rblShippingFeeType">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblShippingFeeType" runat="server" Width="600px" 
                        AutoPostBack="True" OnSelectedIndexChanged="rblShippingFeeType_SelectedIndexChanged">
                            <asp:ListItem Value="0" resourcekey="li_ShippingFeeType_Default" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="1" resourcekey="li_ShippingFeeType_FixedShippingFee"></asp:ListItem>
                            <asp:ListItem Value="2" resourcekey="li_ShippingFeeType_NoShippingFee"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr runat="server" id="tr_FixedShippingFee">
                    <td>
                        <dnn:Label ID="plFixedShippingFee" runat="server" ControlName="txtFixedShippingFee">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFixedShippingFee" runat="server" width="200px" Text="0"></asp:TextBox>
                    </td>
                </tr>
                <%} %>
                <%if (CurrentType.FieldEnable_PackageFee && Sellable && IsGoods)
                  {%>
                <tr>
                    <td>
                        <dnn:Label ID="plPackageFee" runat="server" ControlName="txtPackageFee"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPackageFee" width="200px" runat="server" Text="0" />
                    </td>
                </tr>
                <%} %>

                 <%if (Sellable && IsGoods)
                  {%>
                <tr>
                    <td>
                        <dnn:Label ID="plShippingProperty" runat="server" ControlName="txtShippingProperty"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtShippingProperty"  Columns="70" runat="server" />
                    </td>
                </tr>
                <%} %>

                <%if (CurrentType.EnableTax)
                  {%>
                <tr>
                    <td>
                        <dnn:Label ID="plTaxRateType" runat="server" ControlName="rblTaxRateType"></dnn:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblTaxRateType" runat="server" Width="600px"  
                        AutoPostBack="True" OnSelectedIndexChanged="rblTaxRateType_SelectedIndexChanged">
                            <asp:ListItem Value="0" resourcekey="li_TaxRateType_Default" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="1" resourcekey="li_TaxRateType_FixedTaxRate"></asp:ListItem>
                            <asp:ListItem Value="2" resourcekey="li_TaxRateType_NoTax"></asp:ListItem>
                            <asp:ListItem Value="3" resourcekey="li_TaxRateType_PriceIncludingTax"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr runat="server" id="tr_FixedTaxRate">
                    <td>
                        <dnn:Label ID="plFixedTaxRate" runat="server" ControlName="txtFixedTaxRate"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFixedTaxRate" runat="server" width="200px" Text="0"></asp:TextBox>%
                    </td>
                </tr>
                <%} %>
                <%if (CurrentType.FieldEnable_LinkUrl)
                  {%>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label2" runat="server" resourcekey="Tip_LinkUrl" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plLinkUrl" runat="server" ControlName="ctlInfo" Text="Link Url"></dnn:Label>
                    </td>
                    <td valign="middle">
                        <dnn:URL ID="ctlLinkUrl" runat="server" Width="400px" ShowLog="False" ShowNone="True"
                            ShowFiles="true" ShowTabs="true" ShowTrack="False"></dnn:URL>
                    </td>
                </tr>
                <%} %>
                <%if (HasManagePermission)
                  {%>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label3" runat="server" resourcekey="Tip_ViewOrder" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOrder" runat="server" ControlName="txtOrder" Text="Order"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOrder" width="200px" runat="server" />
                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plFeatured" runat="server" ControlName="chkFeatured"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFeatured" runat="server" >
                        </asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plAuthed" runat="server" ControlName="chkFeatured"></dnn:Label>
                    </td>
                    <td>
                          <asp:CheckBox ID="chkAuthed" runat="server" 
                            Checked="true"></asp:CheckBox>
                    </td>
                </tr>
                <%} %>
                <tr>
                    <td>
                        <dnn:Label ID="plActive" runat="server" ControlName="chkActive"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkActive" runat="server" 
                            Checked="true"></asp:CheckBox>
                    </td>
                </tr>
            </table>
            <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" class="dnnFormItem">
                <tr>
                    <td colspan="2">
                        <asp:Table ID="tblUserDefinedField" runat="server" summary="Edit User Defined Design Table"
                            Width="100%" Visible="false">
                        </asp:Table>
                    </td>
                </tr>
            </table>
        </div>

          <div id="divCategory" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td>
                        <asp:Label ID="lbl_Tip_SelectCategory" runat="server"  CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TreeView ID="tvCategory" runat="server" ImageSet="XPFileExplorer" NodeIndent="10"
                            PathSeparator="/" ShowCheckBoxes="All" ExpandDepth="-1">
                            <ParentNodeStyle Font-Bold="False" />
                            <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                            <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                VerticalPadding="0px" />
                            <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                NodeSpacing="0px" VerticalPadding="2px" />
                        </asp:TreeView>
                    </td>
                </tr>
            </table>
        </div>

          <%if (CurrentType.AllowLocation)
          {%>
        <div id="divLocation" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label20" runat="server" resourcekey="Tip_Location" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr  runat="server" Visible="<%#UserInfo.IsInRole(PortalSettings.AdministratorRoleName) %>">
                    <td colspan="2">
                        <asp:Label ID="Label26" runat="server" resourcekey="Tip_Location_Hide" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plLocationCountry" runat="server" ControlName="ddlLocationCountry">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLocationCountry" runat="server" AutoPostBack="True" DataTextField="Name"
                            DataValueField="Id" OnSelectedIndexChanged="ddlLocationCountry_SelectedIndexChanged" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plLocationState" runat="server" ControlName="ddlLocationState"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLocationState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLocationState_SelectedIndexChanged" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plLocationCity" runat="server" ControlName="ddlLocationCity"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLocationCity" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLocationCity_SelectedIndexChanged" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plLocationTown" runat="server" ControlName="ddlLocationTown"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLocationTown" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.AllowGoogleMap)
          {%>
        <div id="divMap" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label4" runat="server" resourcekey="Tip_GoogleMap" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr id="Tr1" runat="server" Visible="<%#UserInfo.IsInRole(PortalSettings.AdministratorRoleName) %>">
                    <td colspan="2">
                        <asp:Label ID="Label27" runat="server" resourcekey="Tip_GoogleMap_Hide" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plLatitude" runat="server" ControlName="txtLatitude"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLatitude" Columns="60" runat="server" />
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" resourcekey="MustBeDecimal"
                            runat="server" ValidationExpression="^(-?\d+)(\.\d+)?$" ControlToValidate="txtLatitude" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plLongitude" runat="server" ControlName="txtLongitude"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLongitude" Columns="60" runat="server" />
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="MustBeDecimal"
                            runat="server" ValidationExpression="^(-?\d+)(\.\d+)?$" ControlToValidate="txtLongitude" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plMapTitle" runat="server" ControlName="txtMapTitle"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMapTitle" Columns="60" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Image ID="Image11" runat="server" ImageUrl="~/desktopmodules/CrossClassified/images/GoogleMap_Sample.jpg" /><br />
                        <%=LocalizeString("Tip_GoogleMap_Sample")%>
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
      
        <div id="divTag" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblTagTip" runat="server" resourcekey="lblTagTip" CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="txtTag1" Width="300px" runat="server" Visible="true" /><br />
                        <asp:TextBox ID="txtTag2" Width="300px" runat="server" /><br />
                        <asp:TextBox ID="txtTag3" Width="300px" runat="server" /><br />
                        <asp:TextBox ID="txtTag4" Width="300px" runat="server" /><br />
                        <asp:TextBox ID="txtTag5" Width="300px" runat="server" /><br />
                        <asp:TextBox ID="txtTag6" Width="300px" runat="server" /><br />
                        <asp:TextBox ID="txtTag7" Width="300px" runat="server" /><br />
                        <asp:TextBox ID="txtTag8" Width="300px" runat="server" /><br />
                        <asp:TextBox ID="txtTag9" Width="300px" runat="server" /><br />
                        <asp:TextBox ID="txtTag10" Width="300px" runat="server" />
                    </td>
                </tr>
                <tr align="left">
                    <td style="width: 150px">
                        <dnn:Label ID="plPopularTag" runat="server" ControlName="ddlPopularTag" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPopularTag" runat="server" Width="500px" DataTextField="Tag"
                            DataValueField="Tag">
                        </asp:DropDownList>
                        <asp:LinkButton ID="lbtnAddTag" runat="server" resourcekey="lbtnAddTag" CssClass="CommandButton"
                            OnClientClick="addTag();return false;"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
        <%if (HasManagePermission)
          {%>
        <div id="divPermission" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label6" runat="server" resourcekey="Tip_ManagePermission" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plViewRoles" runat="server" ControlName="cblViewRoles" Text="View Roles">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBoxList ID="cblViewRoles" runat="server"  RepeatColumns="4"
                            CellPadding="2" CellSpacing="2">
                        </asp:CheckBoxList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plDownloadRoles" runat="server" ControlName="cblDownloadRoles"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBoxList ID="cblDownloadRoles" runat="server"  RepeatColumns="4"
                            CellPadding="2" CellSpacing="2" >
                        </asp:CheckBoxList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblPortalDisableComment" runat="server" resourcekey="lblPortalDisableComment"
                            CssClass="NormalRed" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plAllowComment" runat="server" Text="Allow Comment" ControlName="chkAllowComment">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAllowComment" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plCommentRoles" runat="server" Text="Comment Roles" ControlName="cblCommentRoles">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBoxList ID="cblCommentRoles" runat="server"  ResourceKey="chkCommentRoles"
                            RepeatColumns="4" CellPadding="2" CellSpacing="2" >
                        </asp:CheckBoxList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plAutoAuthComment" runat="server" Text="Auto Authorize Comment" ControlName="chkAutoAuthComment">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAutoAuthComment" runat="server"></asp:CheckBox>
                    </td>
                </tr>
            </table>
            <%if (!Sellable)
              {%>
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblPortalDisableRating" runat="server" resourcekey="lblPortalDisableRating"
                            CssClass="NormalRed" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plAllowRating" runat="server" Text="Allow Rating" ControlName="chkAllowRating">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAllowRating" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRatingRoles" runat="server" ControlName="cblRatingRoles" Text="Rating Roles">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBoxList ID="cblRatingRoles" runat="server"  RepeatColumns="4"
                            CellPadding="2" CellSpacing="2" >
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
            <%} %>
        </div>
        <%} %>
        <%if (CurrentType.FieldEnable_Summary)
          {%>
        <div id="divSummary" class="dnnFormItem" style="height: 100%">
            <table id="tblSummary" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" resourcekey="Tip_Summary" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="txtSummary" Width="600px" Height="200px" runat="server" TextMode="MultiLine"  />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.FieldEnable_Description)
          {%>
        <div id="divDescription" class="dnnFormItem" style="height: 100%">
            <table id="tblDescription" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtDescription" Width="100%" Height="600px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.FieldEnable_SpecialOffer)
          {%>
        <div id="divSpecialOffer" class="dnnFormItem" style="height: 100%">
            <table id="tblSpecialOffer" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtSpecialOffer" Width="100%" Height="600px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.FieldEnable_Delivery && IsGoods)
          {%>
        <div id="divDelivery" class="dnnFormItem" style="height: 100%">
            <table id="tblDelivery" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtDelivery" Width="100%" Height="600px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.FieldEnable_License && IsSoftware)
          {%>
        <div id="divLicense" class="dnnFormItem" style="height: 100%">
            <table id="tblLicense" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtLicense" Width="100%" Height="600px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.FieldEnable_Support)
          {%>
        <div id="divSupport" class="dnnFormItem" style="height: 100%">
            <table id="tblSupport" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtSupport" Width="100%" Height="600px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.EnableField1)
          {%>
        <div id="divField1" class="dnnFormItem" style="height: 100%">
            <table id="tblField1" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField1" Width="100%" Height="600px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.EnableField2)
          {%>
        <div id="divField2" class="dnnFormItem" style="height: 100%">
            <table id="tblField2" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField2" Width="100%" Height="600px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.EnableField3)
          {%>
        <div id="divField3" class="dnnFormItem" style="height: 100%">
            <table id="tblField3" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField3" Width="100%" Height="600px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.EnableField4)
          {%>
        <div id="divField4" class="dnnFormItem" style="height: 100%">
            <table id="tblField4" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField4" Width="100%" Height="600px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.EnableField5)
          {%>
        <div id="divField5" class="dnnFormItem" style="height: 100%">
            <table id="tblField5" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField5" Width="100%" Height="600px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
    </div>
    <table width="100%" class="Normal" visible="false">
        <tr>
            <td align="center">
                <dnn:CommandButton ID="btnUpdate1" runat="server" ResourceKey="cmdUpdate" ImageUrl="~/images/save.gif"
                    OnCommand="btnUpdate_Click" Visible="false" />
                &nbsp;&nbsp;
                <dnn:CommandButton ID="btnDelete1" runat="server" ResourceKey="cmdDelete" ImageUrl="~/images/delete.gif"
                    OnCommand="btnDelete_Click" Visible="false" CausesValidation="false" OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
                &nbsp;&nbsp;
                <dnn:CommandButton ID="btnCancel1" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                    OnCommand="btnCancel_Click" Visible="false" CausesValidation="false" />
            </td>
        </tr>
    </table>
</div>
<table id="tblAttachment" cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem" 
    runat="server">
    <tr>
        <td colspan="2">
            <asp:Label ID="lblAttachmentList" runat="server"></asp:Label><br />
            <asp:GridView ID="gvAttachmentList" runat="server" CellPadding="1" CellSpacing="1"
                GridLines="Both" BackColor="Gray" DataKeyNames="Id" Width="100%" AutoGenerateColumns="False"
                OnRowCommand="gvAttachmentList_RowCommand" ForeColor="#333333">
                <RowStyle CssClass="DataGrid_Item" BackColor="#EFF3FB" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    <asp:Label ID="Label1" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server" ></asp:Label>
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle CssClass="CrossGrid" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAll_Attachment" runat="server" onclick="checkAll_Attachment()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItem_Attachment" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="20px" />
                        <HeaderStyle Width="20px" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblFilePath" runat="server" resourcekey="lblFilePath"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFilePathField" runat="server" Text='<%# Bind("FilePath") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgDelete" runat="server" ResourceKey="imgDelete" ImageUrl="~/images/delete.gif"
                                CommandName="Del" CommandArgument='<%#Eval("Id") %>' />
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                        <HeaderStyle Width="100px" HorizontalAlign="Center"  CssClass="CrossGrid"/>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td valign="middle" style="width: 150px">
            <dnn:Label ID="plAttachment" runat="server" ControlName="ctlAttachment"></dnn:Label>
        </td>
        <td>
            <cross:UserFile ID="ctlAttachment" runat="server" Width="400px" />
        </td>
    </tr>
    <tr>
        <td />
        <td>
            <asp:LinkButton ID="btnAddAttachment" runat="server" CssClass="dnnSecondaryAction"
                ResourceKey="btnAddAttachment" CausesValidation="False" OnClick="btnAddAttachment_Click" />
        </td>
    </tr>
</table>
<table width="100%" runat="server" id="tblDownloadList" align="left" class="dnnFormItem">
    <tr>
        <td>
            <asp:Label ID="lblDownloadList" runat="server"></asp:Label><br />
            <asp:GridView ID="gvDownloadList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="Id" OnRowCommand="gvDownloadList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecordes" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAll_Download" runat="server" onclick="checkAll_Download()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItem_Download" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblFileName" runat="server" resourcekey="lblFileName">FileName</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFileNameField" runat="server" Text='<%# Eval("FileName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblSize" runat="server" resourcekey="lblSize"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSizeField" runat="server" Text='<%#Cross.Modules.CP_Product.Business.LocalUtils.FormatFileSize(Convert.ToString(Eval("Size"))) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate">Created Date</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCreatedDateField" runat="server" Text='<%#  Convert.ToDateTime(Eval("CreatedDate")).ToShortDateString() %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif" AlternateText='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="CrossGrid" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" HorizontalAlign="Left" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </td>
    </tr>
</table>
<table id="tblDownloadDetail" cellspacing="0" cellpadding="2" width="100%" border="0"
    align="left" class="dnnFormItem" runat="server">
    <tr>
        <td>
            <asp:Label ID="lblUploadNewFile" runat="server" resourcekey="Tip_UploadNewFile" CssClass="dnnFormMessage dnnFormInfo" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblFileExtension" runat="server" CssClass="dnnFormMessage dnnFormInfo" />
        </td>
    </tr>
   
    <tr>
        <td>
            <asp:Label ID="lblStepUpload" runat="server" resourcekey="lblStepUpload"></asp:Label>
            <br />
            <asp:Silverlight ID="ctlUpload" runat="server" Height="350px" Source="~/DesktopModules/CrossClassified/Controls/FileUpload.xap"
                MinimumVersion="2.0.31005.0" Width="600px">
            </asp:Silverlight>
            <br /> <br />

            <asp:Label ID="lblUploadViaJs" runat="server" resourcekey="lblUploadViaJs"></asp:Label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="lbtnUploadViaJs" runat="server" resourcekey="lbtnUploadViaJs"
                CssClass="dnnSecondaryAction" OnClientClick="uploadFiles();return false;">
            </asp:LinkButton>
            <dnnweb:DnnFileUpload ID="ctlUploadJs" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblStepSynchronize" runat="server" resourcekey="lblStepSynchronize"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <dnn:CommandButton ID="btnSynchronize" runat="server" ResourceKey="btnSynchronize"
                CausesValidation="false" ImageUrl="~/images/synchronize.gif" OnCommand="btnSynchronize_Click" />
        </td>
    </tr>
</table>
<table id="tblAddFromFile" cellspacing="0" cellpadding="2" width="100%" border="0"
    class="dnnFormItem" align="left" runat="server">
   
    <tr>
        <td>
            <asp:Label ID="lblAddFromFile_Step2" runat="server" resourcekey="lblAddFromFile_Step2"></asp:Label><br />
            <dnn:URL ID="ctlDownloadFromFile" runat="server" Required="False" UrlType="F" ShowLog="false"
                ShowNewWindow="false" ShowNone="false" ShowTabs="false" ShowTrack="false" ShowUrls="false"
                ShowFiles="true" ShowUpLoad="false" Width="400px"></dnn:URL>
            <br />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblAddFromFile_Step3" runat="server" resourcekey="lblAddFromFile_Step3"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <dnn:CommandButton ID="btnAddFromFile" runat="server" ResourceKey="btnAddFromFile"
                CausesValidation="false" ImageUrl="~/images/synchronize.gif" OnCommand="btnAddFromFile_Click" />
            <asp:CheckBox ID="chkDeleteFileAfterAdded" runat="server" ResourceKey="chkDeleteFileAfterAdded" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:SectionHead ID="secHelp_AddFromFtp" CssClass="SubHead" runat="server" Section="tblHelp_AddFromFtp"
                align="left" ResourceKey="secHelp_AddFromFtp" IncludeRule="True" IsExpanded="false">
            </dnn:SectionHead>
            <table align="left" border="0" cellpadding="5" cellspacing="1" runat="server" id="tblHelp_AddFromFtp">
                <tr align="left">
                    <td colspan="2">
                        <asp:Label ID="lblAddFromFile" runat="server" resourcekey="Help_AddFromFtp" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table width="100%" class="dnnFormItem" runat="server" id="tblVideoList" align="left">
    <tr>
        <td colspan="2">
            <asp:Label ID="lblVideoList" runat="server"></asp:Label><br />
            <asp:GridView ID="gvVideoList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="Id" OnRowCommand="gvVideoList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecores" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAll_Video" runat="server" onclick="checkAll_Video()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItem_Video" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='40px' BorderStyle="Solid"
                                BorderWidth="1" BorderColor="DarkGray" ID='imgVideo'  />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblTitle" runat="server" resourcekey="lblVideoTitle">Title</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTitleField" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblVideoPath" runat="server" resourcekey="lblVideoPath"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblVideoPathField" runat="server" Text='<%# Server.HtmlEncode(Convert.ToString(Eval("VideoPath"))) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblDuration" runat="server" resourcekey="lblDuration"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDurationField" runat="server" Text='<%#Eval("Duration") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblDescription" runat="server" resourcekey="lblDescription"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDescriptionField" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Select"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />
                            <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif" AlternateText='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
                                <asp:HyperLink ID="hlContentLocalization" Target="_blank" ImageUrl="~/DesktopModules/CrossClassified/images/ml_content_16.gif"
                                Visible="<%#SupportsContentLocalization%>" runat="server" NavigateUrl='<%# EditUrl("ContentLocalize_Misc") + "?Table=Video&ItemId=" + Eval("Id").ToString() %>' />
                  
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" CssClass="CrossGrid" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </td>
    </tr>
    <tr runat="server" id="trVideoFolder" visible="<%#InFileManageRoles%>">
        <td style="width: 150px">
            <dnn:Label ID="plVideoFolder" runat="server" ControlName="ctlVideoFolder" ResourceKey="MyFolder">
            </dnn:Label>
        </td>
        <td>
            <cross:UserFile ID="ctlVideoFolder" FileFilter="mp4,flv" Width="250px" runat="server" />
            <dnn:CommandButton ID="btnAddVideoFolder" runat="server" ImageUrl="~/images/add.gif"
                ResourceKey="btnAddVideoFromFolder" OnCommand="btnAddVideoFolder_Click" CausesValidation="false" />
        </td>
    </tr>
</table>
<table id="tblVideoDetail" cellspacing="0" cellpadding="2" width="100%" border="0"
    class="dnnFormItem" align="left" runat="server">
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plVideoTitle" runat="server" ControlName="txtVideoTitle"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtVideoTitle" Columns="70" runat="server" /><asp:Image ID="Image4"
                runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="NormalRed"
                resourcekey="Required" Display="Dynamic" ControlToValidate="txtVideoTitle">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label8" runat="server" resourcekey="Tip_VideoSource" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plVideoFile" runat="server" ControlName="ctlVideoFile" />
        </td>
        <td>
            <cross:UserFile ID="ctlVideoFile" runat="server" FileFilter="mp4,flv" Width="350px" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plVideoThumbnail" runat="server" ControlName="txtVideoThumbnail">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtVideoThumbnail" Columns="70" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plVideoDuration" runat="server" ControlName="txtVideoDuration"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtVideoDuration" Columns="20" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plVideoDescription" runat="server" ControlName="txtVideoDescription" />
        </td>
        <td>
            <asp:TextBox ID="txtVideoDescription" Columns="70" runat="server" TextMode="MultiLine"
                Height="200px" />
        </td>
    </tr>
</table>
<table width="100%" class="dnnFormItem" runat="server" id="tblAudioList" align="left">
    <tr>
        <td colspan="2">
            <asp:Label ID="lblAudioList" runat="server"></asp:Label><br />
            <asp:GridView ID="gvAudioList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="Id" OnRowCommand="gvAudioList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecores" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAll_Audio" runat="server" onclick="checkAll_Audio()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItem_Audio" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblTitle" runat="server" resourcekey="lblAudioTitle">Title</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTitleField" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblAudioPath" runat="server" resourcekey="lblAudioPath"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAudioPathField" runat="server" Text='<%#Eval("AudioPath") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblDescription" runat="server" resourcekey="lblDescription"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDescriptionField" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Select"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />
                            <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif" AlternateText='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />
                              <asp:HyperLink ID="hlContentLocalization" Target="_blank" ImageUrl="~/DesktopModules/CrossClassified/images/ml_content_16.gif"
                                Visible="<%#SupportsContentLocalization%>" runat="server" NavigateUrl='<%# EditUrl("ContentLocalize_Misc") + "?Table=Audio&ItemId=" + Eval("Id").ToString() %>' />
                  
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" CssClass="CrossGrid" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </td>
    </tr>
    <tr runat="server" id="trAudioFolder" visible="<%#InFileManageRoles%>">
        <td style="width: 150px">
            <dnn:Label ID="plAudioFolder" runat="server" ControlName="ctlAudioFolder" ResourceKey="MyFolder">
            </dnn:Label>
        </td>
        <td>
            <cross:UserFile ID="ctlAudioFolder" FileFilter="mp3" Width="250px" runat="server" />
            <dnn:CommandButton ID="btnAddAudioFolder" runat="server" ImageUrl="~/images/add.gif"
                ResourceKey="btnAddAudioFromFolder" OnCommand="btnAddAudioFolder_Click" CausesValidation="false" />
        </td>
    </tr>
</table>
<table id="tblAudioDetail" cellspacing="0" cellpadding="2" width="100%" border="0"
    class="dnnFormItem" align="left" runat="server">
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plAudioTitle" runat="server" ControlName="txtAudioTitle"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtAudioTitle" Columns="70" runat="server" /><asp:Image ID="Image5"
                runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="NormalRed"
                resourcekey="Required" Display="Dynamic" ControlToValidate="txtAudioTitle">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label9" runat="server" resourcekey="Tip_AudioSource" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plAudioFile" runat="server" ControlName="ctlAudioFile" />
        </td>
        <td>
            <cross:UserFile ID="ctlAudioFile" runat="server" FileFilter="mp3" Width="350px" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plAudioDescription" runat="server" ControlName="txtAudioDescription" />
        </td>
        <td>
            <asp:TextBox ID="txtAudioDescription" Columns="70" runat="server" TextMode="MultiLine"
                Height="200px" />
        </td>
    </tr>
</table>
<table width="100%" class="dnnFormItem" runat="server" id="tblImageList" align="left">
    <tr>
        <td colspan="2">
            <asp:Label ID="lblImageList" runat="server"></asp:Label><br />
            <asp:GridView ID="gvImageList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="Id" OnRowCommand="gvImageList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecores" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAll_Image" runat="server" onclick="checkAll_Image()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItem_Image" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='40px' BorderStyle="Solid"
                                BorderWidth="1" BorderColor="DarkGray" ID='imgImage'  />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblTitle" runat="server" resourcekey="lblImageTitle">Title</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTitleField" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblImagePath" runat="server" resourcekey="lblImagePath"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblImagePathField" runat="server" Text='<%#Eval("ImagePath") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblDescription" runat="server" resourcekey="lblDescription"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDescriptionField" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Select"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>' />
                            <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif" AlternateText='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)%>'
                                OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared)) %>' />

                                    <asp:HyperLink ID="hlContentLocalization" Target="_blank" ImageUrl="~/DesktopModules/CrossClassified/images/ml_content_16.gif"
                                Visible="<%#SupportsContentLocalization%>" runat="server" NavigateUrl='<%# EditUrl("ContentLocalize_Misc") + "?Table=Image&ItemId=" + Eval("Id").ToString() %>' />
                  
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"  CssClass="CrossGrid"/>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </td>
    </tr>
    <tr runat="server" id="trImageFolder" visible="<%#InFileManageRoles%>">
        <td style="width: 150px">
            <dnn:Label ID="plImageFolder" runat="server" ControlName="ctlImageFolder" ResourceKey="MyFolder">
            </dnn:Label>
        </td>
        <td>
            <cross:UserFile ID="ctlImageFolder" FileFilter="jpg,jpe,jpeg,png,bmp" Width="250px"
                runat="server" />
            <dnn:CommandButton ID="btnAddImageFolder" runat="server" ImageUrl="~/images/add.gif"
                ResourceKey="btnAddImageFromFolder" OnCommand="btnAddImageFolder_Click" CausesValidation="false" />
        </td>
    </tr>
</table>
<table id="tblImageDetail" cellspacing="0" cellpadding="2" width="100%" border="0"
    class="dnnFormItem" align="left" runat="server">
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plImageTitle" runat="server" ControlName="txtImageTitle"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtImageTitle" Columns="70" runat="server" /><asp:Image ID="Image6"
                runat="server" ImageUrl="~/DesktopModules/CrossClassified/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" CssClass="NormalRed"
                resourcekey="Required" Display="Dynamic" ControlToValidate="txtImageTitle">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plImageFile" runat="server" ControlName="ctlImageFile" />
        </td>
        <td>
            <cross:UserFile ID="ctlImageFile" runat="server" FileFilter="jpe,jpeg,bmp,png,jpg"
                Width="350px" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plImageDescription" runat="server" ControlName="txtImageDescription" />
        </td>
        <td>
            <asp:TextBox ID="txtImageDescription" Columns="70" runat="server" TextMode="MultiLine"
                Height="200px" />
        </td>
    </tr>
</table>
<table width="100%" runat="server" id="tblBiddingList" align="left" class="dnnFormItem">
    <tr>
        <td>
            <asp:Label ID="lblBiddingList" runat="server"></asp:Label><br />
            <asp:GridView ID="gvBiddingList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="Both" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="Id">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecordes" Text='<%# Localization.GetString("NoRecords", Cross.Modules.CP_Product.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblBidderName" runat="server" resourcekey="lblBidderName">BidderName</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBidderNameField" runat="server" Text='<%# Eval("BidderName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblBid" runat="server" resourcekey="lblBid"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBidField" runat="server" Text='<%#Eval("Bid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblQuantity" runat="server" resourcekey="lblQuantity"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblQuantityField" runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                        <HeaderTemplate>
                            <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate">Created Date</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCreatedDateField" runat="server" Text='<%#  Eval("CreatedDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="CrossGrid" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#EFF3FB" ForeColor="#333333" HorizontalAlign="Left" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </td>
    </tr>
</table>
