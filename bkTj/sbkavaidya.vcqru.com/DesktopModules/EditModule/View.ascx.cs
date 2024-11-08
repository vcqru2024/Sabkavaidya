using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Security;
public partial class DesktopModules_EditModule_View : PortalModuleBase
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public ModuleActionCollection CollectionModuleActions
    {
        get
        {
            ModuleActionCollection Actions = new ModuleActionCollection();
            Actions.Add(this.GetNextActionID(), "Edit", ModuleActionType.ContentOptions, "", "", this.EditUrl("EditSSO"), true, SecurityAccessLevel.Edit, true, false);
            return Actions;
        }
    }   
}