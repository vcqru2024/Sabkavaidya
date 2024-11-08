var Revindex = Revindex || {};
Revindex.Dnn = Revindex.Dnn || {};
Revindex.Dnn.RevindexStorefront = Revindex.Dnn.RevindexStorefront || {};

jQuery(document).ready(function($)
{
	// BUG: Allow AJAX to work correctly with Google Chrome and Apple Safari
	// http://forums.asp.net/t/1252014.aspx/3/10
	Sys.Browser.WebKit = {};
	if (navigator.userAgent.indexOf('WebKit/') > -1)
	{
		Sys.Browser.agent = Sys.Browser.WebKit;
		Sys.Browser.version = parseFloat(navigator.userAgent.match(/WebKit\/(\d+(\.\d+)?)/)[1]);
		Sys.Browser.name = 'WebKit';
	}

    // Track form changes
    Revindex.Web.FormTracker.ConfirmUnsavedChanges(".rvdsfContentContainer div.dnnForm:not(.rvdsfSearchContainer, .rvdsfListContainer)", Revindex.LocalizedStrings.Message_SaveChangesWarning, ".rvdSaveAction");
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        Revindex.Web.FormTracker.ConfirmUnsavedChanges(".rvdsfContentContainer div.dnnForm:not(.rvdsfSearchContainer, .rvdsfListContainer)", Revindex.LocalizedStrings.Message_SaveChangesWarning, ".rvdSaveAction");
    })

   
    Sys.Application.add_load(function pageLoad(sender, args) {

         // Automatically scroll to visible messages
        if ($("div.alert.rvd-alert-important:visible").length > 0) {
            setTimeout(function () { $('html').animate({ scrollTop: $("div.alert.rvd-alert-important").offset().top - 200 }, 'fast') }, 50)

            $("div.alert.rvd-alert-important").not(".rvd-alert-static").fadeOut(15000)
        }

        Revindex.Web.PersistCollapsible()
    }) 

    // We need this line in addition to the add_load above because the add_load does not
    // get triggered in .NET 4.7 if there is no AJAX update panel.
    if ($("div.alert.rvd-alert-important:visible").length > 0) {
        $('html').animate({ scrollTop: $("div.alert.rvd-alert-important").offset().top - 200 }, 'fast')

        $("div.alert.rvd-alert-important").not(".rvd-alert-static").fadeOut(15000)
    }

    Revindex.Web.PersistCollapsible()
});

Revindex.Dnn.RevindexStorefront.ShowMessage = function (targetContainer, css, htmlMessage) {
    $(targetContainer).attr("class", css).html(htmlMessage).show()

    if ($("div.alert.rvd-alert-important:visible").length > 0) {
        $('html').animate({ scrollTop: $("div.alert.rvd-alert-important").offset().top - 200 }, 'fast')

        $("div.alert.rvd-alert-important").not(".rvd-alert-static").fadeOut(15000)
    }
}