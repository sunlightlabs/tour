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
            // var scandals = st.model.list('Scandal');
            // var testLoc = st.model.Location.newRecord({
            //                 description: 'Test model'
            //             });
            //             testLoc.save();
            var all_locations = st.model.Location.all();
            Ti.API.log('createApplicationWindow', "gathered Locations... " + all_locations.length);            
            st.ui.alert('db install', 'App runs with '  + all_locations.length + ' locations');
            var textarea = Ti.UI.createLabel(st.combine($$.CharacterText, {
                text: all_locations[3].description
            }));
            view1.add(textarea);
            Ti.API.log('Ti.Platform.displayCaps.platformHeight', Ti.Platform.displayCaps.platformHeight);
            Ti.API.log('textarea.height', textarea.height);
            
        });
        st.model.install();
        
        var view1 = Titanium.UI.createView({backgroundColor:'#123'});
        win.add(view1);
        
        // var mapView = st.ui.createMapView(st.config.defaults);
        
        // win.add(mapView);
        
        return win;
    };
}());