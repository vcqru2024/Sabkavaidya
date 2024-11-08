jQuery(function ($) {
    var setupTooltips = function () {
        try {
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
        }
        catch (err) {

        }
        
    };

    setupTooltips();
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        // note that this will fire when _any_ UpdatePanel is triggered,
        // which may or may not cause an issue
        setupTooltips();
    });
});