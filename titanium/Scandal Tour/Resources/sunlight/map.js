(function(){
    
    var annotations = new Array();
	if (typeof Titanium.UI.currentWindow.SUNLIGHT.scandals !== 'undefined') {
		Ti.API.log('info scandals count',(typeof Titanium.UI.currentWindow.SUNLIGHT.scandals.length));
		
	}
	else {
		Ti.API.log('info scandals undefined', "scandales undefined");
	}
    for(var scandal_hash in Titanium.UI.currentWindow.SUNLIGHT.scandals) {
        var scandal = Titanium.UI.currentWindow.SUNLIGHT.scandals[scandal_hash];
        annotations.push(Titanium.Map.createAnnotation({
            latitude: scandal.lat,
            longitude: scandal.lon,
            title: scandal.place,
            subtitle: scandal.scandal,
            pincolor: (Titanium.UI.currentWindow.SUNLIGHT.IsScandalVisited(scandal_hash) ? Titanium.Map.ANNOTATION_GREEN : Titanium.Map.ANNOTATION_RED),
            animate:true,
            leftButton: '../images/appcelerator_small.png',
            rightButton: Titanium.UI.iPhone.SystemButton.DISCLOSURE,
            
            // custom attributes that are passed into event objects
            url: '../sunlight/scandal.js',             
            scandal: scandal,
            scandal_hash: scandal_hash
        }));
    }
    

    var mapview = Titanium.Map.createView({
        mapType: Titanium.Map.STANDARD_TYPE,
        region: {latitude:38.9044889, longitude:-77.0401211, 
                latitudeDelta:0.01, longitudeDelta:0.01},
        animate:true,
        regionFit:true,
        userLocation:true,
        annotations: annotations
    });

    mapview.addEventListener('click',function(evt)
    {
        // map event properties 
        var title = evt.title;
        var clickSource = evt.clicksource;

        if ((clickSource==='rightButton') || (clickSource==='title')) {
                        
    		var win = Titanium.UI.createWindow({
    			url: evt.annotation.url,
    			title: evt.annotation.title,
    			navBarHidden: false,
    			scandal: evt.annotation.scandal,
    			scandal_hash: evt.annotation.scandal_hash,
    			annotation: evt.annotation,
    			SUNLIGHT: Titanium.UI.currentWindow.SUNLIGHT
    		});
    		Titanium.UI.currentTab.open(win,{animated:true});
        }

    });

    // add map view to the window
    Titanium.UI.currentWindow.add(mapview);
    
})();

