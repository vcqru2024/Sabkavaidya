using Cross.Modules.CP_Product.Business;
using DotNetNuke.Services.Localization;
using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
namespace Cross.Modules.CP_Product.View
{
    /// <summary>

    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ListDashboard : CPModuleBase
    {
        char seprator = '|';//分隔符    
        private string FlashScriptName
        {
            get
            {
                return "CrossImageNavigateScript" + ModuleId.ToString();
            }
        }
        public Setting_ListDashboard Settings_ListDashboard;

        override protected void OnInit(EventArgs e)
        {
            Settings_ListDashboard = new Setting_ListDashboard(ModuleId, TabId, ModuleConfiguration.ModuleSettings);
            if (Settings_ListDashboard.General.TypeId == -1)
            {
                Settings_ListDashboard = new Setting_ListDashboard(ModuleId, TabId);
            }
            base.OnInit(e);
        }
        #region Event Handlers
        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Page_Load runs when the control is loaded
        /// </summary>
        /// <remarks>
        /// </remarks>
        /// <history>
        /// </history>
        /// -----------------------------------------------------------------------------
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {

            RegisterSwfObject();
            if (!Page.IsPostBack)
            {
                LocalResourceFile = Localization.GetResourceFile(this, "ListDashborad.ascx");
                BuildNavigateScript();
                DataBind();
            }

        }

        private void BuildNavigateScript()
        {
            List<ProductInfo> list = ProductController.GetFlashImage(Settings_ListDashboard.General.TypeId, GetUserId(), Settings_ListDashboard.General.CategoryList,
                Settings_ListDashboard.General.PlayMode == LocalUtils.Flash_PlayMode_ImageNavigate ? 9 : Settings_ListDashboard.General.Rows, Settings_ListDashboard.General.ShowFeatured,
                Settings_ListDashboard.General.SortField);


            if (list.Count < 1)//没有记录
            {
                return;
            }
            foreach (var item in list)
            {
                LocalizeObject_Product(item);
            }
            int flashHeight = Convert.ToInt32(Settings_ListDashboard.Flash.Height);

            if (Settings_ListDashboard.General.PlayMode == LocalUtils.Flash_PlayMode_ImageNavigate)//仅针对该项flash
            {
                flashHeight = Convert.ToInt32(Settings_ListDashboard.Flash.Height) + Convert.ToInt32(Settings_ListDashboard.Navigate.Navigate_TextHeight);
            }

            string bgColor = Settings_ListDashboard.Flash.BgColor.Replace("0x", "#");
            string flashFile = "";
            switch (Settings_ListDashboard.General.PlayMode)
            {
                case LocalUtils.Flash_PlayMode_ImageNavigate:
                    flashFile = DotNetNuke.Common.Globals.ApplicationPath + "/DesktopModules/CrossClassified/Flash/ImageNavigate_Classical.swf";

                    break;
                case LocalUtils.Flash_PlayMode_ImageNavigate_Integrative:
                    flashFile = DotNetNuke.Common.Globals.ApplicationPath + "/DesktopModules/CrossClassified/Flash/ImageNavigate_Integrative.swf";
                    break;
                case LocalUtils.Flash_PlayMode_ImageNavigate_ButtonFree:
                    flashFile = DotNetNuke.Common.Globals.ApplicationPath + "/DesktopModules/CrossClassified/Flash/ImageNavigate_ButtonFree.swf";
                    break;

                default:
                    flashFile = DotNetNuke.Common.Globals.ApplicationPath + "/DesktopModules/CrossClassified/Flash/ImageNavigate_Classical.swf"; ;
                    break;
            }

            //先置空
            string pics = null;
            string links = null;
            string texts = null;
            int imageLimit = 9;

            if (Settings_ListDashboard.General.PlayMode == LocalUtils.Flash_PlayMode_ImageNavigate)
            {
                imageLimit = 9;
            }
            else
            {
                imageLimit = 200;//搜狐体育和腾讯体育提供的flash并无图片数量限制，在此直接用200代替，估计没有人用这个模块播放200以上的图片
            }
            int maxItem = list.Count > imageLimit ? imageLimit : list.Count;
            for (int i = 0; i < maxItem; i++)
            {
                if (pics != null)
                {
                    pics += seprator.ToString();
                }
                if (links != null)
                {
                    links += seprator.ToString();
                }
                if (texts != null)
                {
                    texts += seprator.ToString();
                }
                string pic = GetRelativeUrlByFileId(list[i].Image);//如果该产品图片在后台被删除，则用缺省图片
                if (pic == "")
                {
                    pic = LocalUtils.DefaultPicture;
                }
                pics += pic;
                links += GetNavigate(list[i].Id, list[i].Name);
                texts += list[i].Name;
            }
            //替换掉"&" 为 "%26",防止链接出错
            pics = pics.Replace("&", "%26");
            links = links.Replace("&", "%26");
            texts = texts.Replace("&", "%26");



            System.Text.StringBuilder sb = new System.Text.StringBuilder();


            //    RegisterSwfObject();
            sb.AppendLine("<script type=\"text/javascript\">");

            sb.AppendFormat("\tvar s{0} = new SWFObject(\"{1}\",\"{2}\",\"{3}\",\"{4}\",\"{5}\");{6}", ModuleId, flashFile, "FlashNavigate" + ModuleId.ToString(), Settings_ListDashboard.Flash.Width, flashHeight, "7", "\r\n");

            //去掉menu
            sb.AppendFormat("   s{0}.addParam(\"menu\",\"false\");{1}", this.ModuleId, "\r\n");

            /*很常见的一个图片轮播Flash，使用之后发现在IE下按F5刷新之后Flash区域就变成一大块背景色，内容轮播出不来了。
            //有趣的是右键点击Flash选择"关于Adobe Flash Player 9 ..."打开 Adobe 的官网之后再按F5刷新，内容又可以正常显示了。
//一点点去掉代码发现是 <param name="scale" value="exactfit"> 这个参数作怪。在 Flash 的脚本里面强制指定了 Stage.scaleMode = "noScale"; 
            //而我的 Flash 代码生成 js 里面缺省把 scale 设成了exactfit 。 似乎这两者之间发生了某些冲突，导致IE下出现这种奇怪的刷新之后就白屏的现象。
            //Firefox下倒是没问题。把参数改成 <param name="scale" value="noScale"> 之后恢复正常。   */
            sb.AppendFormat("   s{0}.addParam(\"scale\",\"noScale\");{1}", this.ModuleId, "\r\n");

            sb.AppendFormat("   s{0}.addParam(\"wmode\",\"{1}\");{2}", this.ModuleId, Settings_ListDashboard.Flash.WMode, "\r\n");
            sb.AppendFormat("   s{0}.addParam(\"allowScriptAccess\",\"sameDomain\");{1}", this.ModuleId, "\r\n");
            sb.AppendFormat("   s{0}.addParam(\"bgcolor\",\"{1}\");{2}", ModuleId, bgColor, "\r\n");

            sb.AppendFormat("   s{0}.addVariable(\"target\",\"{1}\");{2}", ModuleId, Settings_ListDashboard.General.LinkTarget, "\r\n");
            //   playlist
            if (Settings_ListDashboard.General.PlayMode == LocalUtils.Flash_PlayMode_ImageNavigate)
            {
                sb.AppendFormat("   s{0}.addVariable(\"pics\",\"{1}\");{2}", this.ModuleId, pics, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"links\",\"{1}\");{2}", this.ModuleId, links, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"texts\",\"{1}\");{2}", this.ModuleId, texts, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"borderwidth\",\"{1}\");{2}", this.ModuleId, Settings_ListDashboard.Flash.Width, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"borderheight\",\"{1}\");{2}", this.ModuleId, Settings_ListDashboard.Flash.Height, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"textheight\",\"{1}\");{2}", this.ModuleId, Settings_ListDashboard.Navigate.Navigate_TextHeight, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"text_align\",\"{1}\");{2}", this.ModuleId, Settings_ListDashboard.Navigate.Navigate_TextAlign, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"interval_time\",\"{1}\");{2}", this.ModuleId, Settings_ListDashboard.Navigate.Navigate_IntervalTime, "\r\n");
            }

            if (Settings_ListDashboard.General.PlayMode == LocalUtils.Flash_PlayMode_ImageNavigate_Integrative)
            {
                sb.AppendFormat("   s{0}.addVariable(\"imgs\",\"{1}\");{2}", this.ModuleId, pics, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"urls\",\"{1}\");{2}", this.ModuleId, links, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"titles\",\"{1}\");{2}", this.ModuleId, texts, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"pw\",\"{1}\");{2}", this.ModuleId, Settings_ListDashboard.Flash.Width, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"ph\",\"{1}\");{2}", this.ModuleId, Settings_ListDashboard.Flash.Height, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"Times\",\"{1}\");{2}", this.ModuleId, Settings_ListDashboard.NavigateIntegrative.NavigateIntegrative_Speed, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"sizes\",\"{1}\");{2}", this.ModuleId, Settings_ListDashboard.NavigateIntegrative.NavigateIntegrative_TextSize, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"txtcolor\",\"{1}\");{2}", this.ModuleId, Settings_ListDashboard.NavigateIntegrative.NavigateIntegrative_TxtColor, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"btnbg\",\"{1}\");{2}", this.ModuleId, Settings_ListDashboard.NavigateIntegrative.NavigateIntegrative_BtnBg, "\r\n");
            }


            if (Settings_ListDashboard.General.PlayMode == LocalUtils.Flash_PlayMode_ImageNavigate_ButtonFree)
            {
                sb.AppendFormat("   s{0}.addVariable(\"pics\",\"{1}\");{2}", this.ModuleId, pics, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"links\",\"{1}\");{2}", this.ModuleId, links, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"texts\",\"{1}\");{2}", this.ModuleId, texts, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"pic_width\",\"{1}\");{2}", this.ModuleId, Settings_ListDashboard.Flash.Width, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"pic_height\",\"{1}\");{2}", this.ModuleId, Settings_ListDashboard.Flash.Height, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"show_text\",\"{1}\");{2}", this.ModuleId, Settings_ListDashboard.NavigateButtonFree.NavigateButtonFree_Show_Text ? "1" : "0", "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"txtcolor\",\"{1}\");{2}", this.ModuleId,
                    Settings_ListDashboard.NavigateButtonFree.NavigateButtonFree_TxtColor.Replace("0x", ""), "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"bgcolor\",\"{1}\");{2}", this.ModuleId,
                    Settings_ListDashboard.NavigateButtonFree.NavigateButtonFree_BgColor.Replace("0x", ""), "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"button_pos\",\"{1}\");{2}", this.ModuleId,
                   Settings_ListDashboard.NavigateButtonFree.NavigateButtonFree_Button_Pos, "\r\n");
                sb.AppendFormat("   s{0}.addVariable(\"stop_time\",\"{1}\");{2}", this.ModuleId,
                 Settings_ListDashboard.NavigateButtonFree.NavigateButtonFree_Stop_Time, "\r\n");
            }


            sb.AppendFormat("   s{0}.write(\"{1}\");{2}", this.ModuleId, flash.ClientID, "\r\n");

            sb.AppendLine("</script>");

            litFlash.Text = sb.ToString();


        }


        protected string GetNavigate(int productId, string prouctName)
        {
            int detailTabId = GetSubModulePageId_Detail(Settings_ListDashboard.General.DetailTab, Settings_ListDashboard.General.TypeId);

            return GenerateProductDetailUrl(detailTabId, productId.ToString(), prouctName);
        }
        private void RegisterSwfObject()
        {
            if (!this.Page.ClientScript.IsClientScriptBlockRegistered("UltraFlashSwfObject"))
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat("<script type=\"text/javascript\" src=\"{0}/Js/swfobject.js\"></script>{1}",
                    DotNetNuke.Common.Globals.ApplicationPath + "/DesktopModules/CrossClassified", "\r\n");
                this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "UltraFlashSwfObject", sb.ToString(), false);
            }
        }

        #endregion


    }
}

