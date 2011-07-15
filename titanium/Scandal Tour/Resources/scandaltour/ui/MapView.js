/**
 * Map View
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.ui.createMapView = function(_args) {
        var mapView = Ti.Map.createView({
            region: _args.location,
            userLocation: true,
            regionFit:true,
            mapType: (_args.mapType !== null ? _args.mapType : Ti.Map.STANDARD_TYPE)
            
        });
        
        return mapView;
    };
}());