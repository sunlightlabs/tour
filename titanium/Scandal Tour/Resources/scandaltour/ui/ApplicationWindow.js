/**
 * View for the main Application window
 * @author dcloud
 * @version $Rev$
 */

(function() {
    var platformWidth = Ti.Platform.displayCaps.platformWidth;
    
    st.ui.createApplicationWindow = function(_args) {
        var win = Ti.UI.createWindow({
            exitOnClose: true
        });
        
        var mapView = st.ui.createMapView(st.config.defaults.region);
        
        win.add(mapView);
        
        return win;
    };
}());