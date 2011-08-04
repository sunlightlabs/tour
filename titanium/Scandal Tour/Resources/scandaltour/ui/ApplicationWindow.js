/**
 * View for the main Application window
 * @author dcloud
 * @version $Rev$
 */

(function() {
    var platformWidth = Ti.Platform.displayCaps.platformWidth;
    
    st.ui.createApplicationWindow = function(_args) {
        Ti.API.log('createApplicationWindow', "createApplicationWindow run");
        var win = Ti.UI.createWindow({
            navBarHidden: true,
            exitOnClose: true
        });
        
        
        Ti.App.addEventListener('app:db.installed', function(){
            var scandals = st.model.list('Scandal');
            Ti.API.log('createApplicationWindow', "gathered Scandals... " + scandals.length);            
            
        });
        st.model.install();
        
        var mapView = st.ui.createMapView(st.config.defaults);
        
        win.add(mapView);
        
        return win;
    };
}());