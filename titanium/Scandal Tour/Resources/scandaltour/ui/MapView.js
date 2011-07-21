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
        
        function loadAnnotations() {
            Ti.API.log('MapView', "loadAnnotations()");
            var scandals = st.model.list('Scandal');
            for (var i=0; i < scandals.length; i++) {
                var annotation = Ti.Map.createAnnotation({
                    latitude: scandals[i].lat,
                    longitude: scandals[i].lon,
                    title: scandals[i].place,
                    subtitle: scandals[i].address,
                    data: scandals[i],
                    pincolor: Ti.Map.ANNOTATION_RED,
                    animate:true,
                    rightButton: st.os({
                        android: './images/icons/103-map.png',
                        iphone: Titanium.UI.iPhone.SystemButton.DISCLOSURE
                    }),
                    leftButton: './images/icons/103-map.png'
                });
                mapView.addAnnotation(annotation);
            }
            mapView.addEventListener('click', function(e) {
                var title = e.title;
                var clickSource = e.clicksource;
                Ti.API.log('mapView click', 'e: ' + e);
                if ((clickSource==='rightButton') || (clickSource==='title')) {
                    var w = st.ui.createScandalDetailsWindow(e);
                    w.open();
                }
            });
        }
        
        function getCurrentLocation() {
            Ti.API.log('MapView', 'getCurrentLocation');
            if (Ti.Geolocation.locationServicesEnabled === false) {
                st.ui.alert('Gelocation not enabled', "We cannot find your current position.");
            }
            else
            {
                Ti.Geolocation.getCurrentPosition(function(e) {
                    if (!e.success || e.error)
                    {
                        st.ui.alert('Geolocation Error', JSON.stringify(e.error.message));
                    }
                    else 
                    {
                        var userAnnotation = Ti.Map.createAnnotation({
                            latitude: e.coords.latitude,
                            longitude: e.coords.longitude,
                            title: 'Your Current Location',
                            pincolor: Ti.Map.ANNOTATION_PURPLE,
                            animate: false//,
                            // rightButton: st.os({
                            //     android: null,
                            //     iphone: Titanium.UI.iPhone.SystemButton.DISCLOSURE
                            // })
                        });
                        mapView.addAnnotation(userAnnotation);
                        Ti.API.log('MapView', 'Gelocation Updated: ' + e.coords.latitude + ',' + e.coords.longitude);                    
                    }
                });
            }
        }
        
        loadAnnotations();
        getCurrentLocation();            
        mapViewContainer.add(mapView);
        
        var spinner = st.ui.createSpinner({
            items: ['0.25', '0.5', '2', '10', '20']
        });
        spinner.addEventListener('change', function(e) {
            Ti.API.log('MapView', 'Spinner change');
        });
        mapViewContainer.add(spinner);

        return mapViewContainer;
    };
}());
