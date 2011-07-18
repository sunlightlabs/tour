/**
 * Map View
 * @author dcloud
 * @version $Rev$
 */

 /*
     http://developer.android.com/guide/topics/location/obtaining-user-location.html#MockData
     Open ddms and telnet into device based on port
     geo fix -77.04293799999999 38.906972
 */

(function() {
    st.ui.createMapView = function(_args) {
        Ti.API.log('createMapView', 'createMapView run with _args.region: ' + _args.region);
        
        var mapViewContainer = Ti.UI.createView({top:0,bottom:0,left:0,right:0});
        
        Titanium.Geolocation.purpose = 'Find scandals near you!';
        
        var mapView = Ti.Map.createView({
            bottom: 30,
            region: _args.region,
            userLocation: true,
            regionFit:true,
            mapType: Ti.Map.STANDARD_TYPE
        });
        
        var buttonBar = Ti.UI.createButtonBar({
            labels:['1', '5', '10'],
            backgroundColor:'#72AADF',
            // style: Titanium.UI.iPhone.SystemButtonStyle.BAR,
            height: 30,
            bottom: 0
        });
        
        function loadAnnotations() {
            Ti.API.log('MapView', "loadAnnotations()");
            var scandals = st.model.list('Scandal');
            for (var i=0; i < scandals.length; i++) {
                // Ti.API.log('MapView.loadAnnotations()', 'scandal[' + i + ']: ' + scandals[i]);
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
        
        function getCurrentLocation() {
            Ti.API.log('MapView', 'getCurrentLocation');
            Ti.Geolocation.getCurrentPosition(function(e) {
                if (!e.success || e.error)
                {
                    st.ui.alert('Gelocation Error', JSON.stringify(e.error));
                    return;
                }
                var userAnnotation = Ti.Map.createAnnotation({
                    latitude: e.coords.latitude,
                    longitude: e.coords.longitude,
                    title: 'Your Current Location',
                    pincolor: Ti.Map.ANNOTATION_PURPLE,
                    animate: false
                });
                mapView.addAnnotation(userAnnotation);
                Ti.API.log('MapView', 'Gelocation Updated: ' + e.coords.latitude + ',' + e.coords.longitude);                
            });
        }
        
        loadAnnotations();
        getCurrentLocation();
        
        mapViewContainer.add(mapView);
        mapViewContainer.add(buttonBar);
        return mapViewContainer;
    };
}());