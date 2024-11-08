using Cross.Modules.CP_Product.Business;
using DotNetNuke.Common;
using DotNetNuke.Services.Localization;
using System;
using System.Collections.Generic;

namespace Cross.Modules.CP_Product.View
{
    public partial class Archive : CPModuleBase
    {
        public DateTime ProductDate
        {
            get
            {
                if (ViewState["ProductDate"] == null)
                {
                    return DateTime.UtcNow;
                }
                else
                {
                    return (DateTime)ViewState["ProductDate"];
                }
            }
            set
            {
                ViewState["ProductDate"] = value;
            }
        }
        public Setting_Archive Settings_Archive;

        override protected void OnInit(EventArgs e)
        {
            Settings_Archive = new Setting_Archive(ModuleId, TabId, ModuleConfiguration.ModuleSettings);
            if (Settings_Archive.General.TypeId == -1)
            {
                Settings_Archive = new Setting_Archive(ModuleId, TabId);
            }
            base.OnInit(e);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            this.LocalResourceFile = Localization.GetResourceFile(this, "Archive.ascx");

            if (!IsPostBack)
            {
                BindCalendar();
                dlArchiveMonths.DataSource = ArchiveMonthsController.GetProductMonths(Settings_Archive.General.TypeId);
                dlArchiveMonths.DataBind();

            }

        }


        private void BindCalendar()
        {
            calMonth.SelectedDates.Clear();

            List<ArchiveDaysInfo> listDays = ArchiveDaysController.GetProductDaysForMonth(Settings_Archive.General.TypeId, ProductDate, GetUserId());

            foreach (ArchiveDaysInfo day in listDays)
            {
                calMonth.SelectedDates.Add(day.AddedDate);
            }
            calMonth.VisibleDate = ProductDate;
        }

        protected void dlArchiveMonths_ItemDataBound(object sender, System.Web.UI.WebControls.DataListItemEventArgs e)
        {
            System.Web.UI.WebControls.HyperLink lnkMonthYear;
            System.Web.UI.WebControls.HyperLink lnkProductRSS;
            lnkMonthYear = ((System.Web.UI.WebControls.HyperLink)(e.Item.FindControl("lnkMonthYear")));
            lnkProductRSS = ((System.Web.UI.WebControls.HyperLink)(e.Item.FindControl("lnkProductRSS")));

            lnkProductRSS.Visible = Settings_Archive.General.DisplayRss;

            ArchiveMonthsInfo objMonth = (ArchiveMonthsInfo)e.Item.DataItem;

            lnkMonthYear.Text = Cross.Modules.CP_Product.Business.LocalUtils.FormatDate(objMonth.AddedDate, BasePage.PageCulture.Name, "y", 0, false);
            lnkMonthYear.Target = Settings_Archive.General.Target;

            int tab = GetSubModulePageId_List(Settings_Archive.General.ProductListPage, Settings_Archive.General.TypeId);

            string parm = "ProductDate=" + objMonth.AddedDate.ToString("yyyy-MM-dd") + "&DateType=month&ProductTypeId=" + Settings_Archive.General.TypeId.ToString();
            
            lnkMonthYear.NavigateUrl = Globals.NavigateURL(tab, "", parm);

            //rss.aspx need to add tabid, to avoid cross domain attack detection.
            lnkProductRSS.NavigateUrl = FullDomainName + "/DesktopModules/CrossClassified/ProductRss.aspx?" + parm + "&tabid=" + TabId.ToString();

        }
        

        protected void calMonth_VisibleMonthChanged(object sender, System.Web.UI.WebControls.MonthChangedEventArgs e)
        {

            ProductDate = e.NewDate;
            BindCalendar();
        }
        protected void calMonth_SelectionChanged(object sender, EventArgs e)
        {
            string newDate = calMonth.SelectedDate.ToString("yyyy-MM-dd");
            int tab = GetSubModulePageId_List(Settings_Archive.General.ProductListPage,Settings_Archive.General.TypeId);

            string url = Globals.NavigateURL(tab, "", "ProductDate=" + newDate + "&DateType=day&ProductTypeId=" + Settings_Archive.General.TypeId.ToString());
            if (Settings_Archive.General.Target == "_self")//设置为本窗口打开
            {
                Response.Redirect(url, true);
            }
            else
            {
                Response.Write("<script>window.open('" + url + "','_blank')</script>");//设置为新窗口打开
            }
        }
    }
}

