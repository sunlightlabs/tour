(function() {
    function RecordPosition(e) {
	    if (e.error)
            return;

        Titanium.API.info('updating position ' + e.coords.longitude);

        Titanium.UI.currentWindow.SUNLIGHT.UpdateLocation(e.coords);
        
        Titanium.API.info('location detected: ' + Titanium.UI.currentWindow.SUNLIGHT.LocationHasBeenDetected());
    }

    Titanium.Geolocation.purpose = 'display your location';
    Titanium.Geolocation.distanceFilter = 10; // set the granularity of the location event 
    Titanium.Geolocation.getCurrentPosition(RecordPosition);
    Titanium.Geolocation.addEventListener('location', RecordPosition);
})();