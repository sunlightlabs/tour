/**
 * Map View
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.ui.createMapView = function(_args) {
        Ti.API.log('createMapView', 'createMapView run with _args.region: ' + _args.region);
        var mapView = Ti.Map.createView({
            region: _args.region,
            userLocation: true,
            regionFit:true,
            mapType: Ti.Map.STANDARD_TYPE
        });
        
        function loadAnnotations() {
            Ti.API.log('MapView', "loadAnnotations()");
            var scandals = st.model.list('Scandal');
            for (var i=0; i < scandals.length; i++) {
                Ti.API.log('MapView.loadAnnotations()', 'scandal[' + i + ']: ' + scandals[i]);
                var annotation = Ti.Map.createAnnotation({
                    latitude: scandals[i].lat,
                    longitude: scandals[i].lon,
                    title: scandals[i].place,
                    subtitle: scandals[i].address,
                    pincolor: Ti.Map.ANNOTATION_RED,
                    animate:true
                });
                mapView.addAnnotation(annotation);
            }
        }
        
        loadAnnotations();
        
        return mapView;
    };
}());