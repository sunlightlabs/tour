/**
 * UI namespace for building views. Most views will be in their own files but included here
 * @author dcloud
 * @version $Rev$
 */
(function () {
    st.ui = {};
    
    //shorthand for alert dialog
    st.ui.alert = function(/*String*/ _title, /*String*/ _message) {
        Ti.UI.createAlertDialog({
            title:_title, 
            message:_message
        }).show();
    };
})();

Ti.include(
    '/scandaltour/ui/ApplicationWindow.js',
    '/scandaltour/ui/MapView.js'
);

