(function() {

    Titanium.include('../sunlight/config.js');    
    Titanium.include('../sunlight/geolocation.js');    

    function UpdateDistanceLabel() {
        Titanium.API.info('running UpdateDistanceLabel()');
        if (Titanium.UI.currentWindow.SUNLIGHT.LocationHasBeenDetected()) {
            var scandal = Titanium.UI.currentWindow.scandal;
            var distance = Titanium.UI.currentWindow.SUNLIGHT.DistanceFromCurrentLocation(scandal.lat, scandal.lon)
            var text = 'You are ' + distance + ' from this location. Move closer to activate point-earning opportunities!';
            Titanium.UI.currentWindow.distance_label.text = text;
        }
        else {
            Titanium.API.info('no lat/lon available from system yet ' + Titanium.UI.currentWindow.SUNLIGHT.latitude + ' ###');            
        }

        setTimeout(function() { UpdateDistanceLabel(); }, 250);        
    }

    function UploadPhoto(filename) {
                
        var win = Titanium.UI.currentWindow;
        if (win.ind_container===undefined) {
            var ind_container = Titanium.UI.createView({
                borderRadius:10,
                opacity: 0.8,
                backgroundColor:'#000',
                width:300,
                height:90,
                center: {x: '50%', y: '50%'},
            });

            var ind = Titanium.UI.createProgressBar({
                width:250,
                height:50,
                min:0,
                max:1,
                value:0,
                top:10,
                message:'Uploading Image',
                font:{fontSize:14, fontWeight:'bold'},
                color:'#fff'
            });
            ind_container.add(ind);               
            win.add(ind_container);        
            ind.show();
            
            win.ind_container = ind_container;
        }
        else {
            win.ind_container.show();
        }
        
		var imageFile = Titanium.Filesystem.getFile(filename);
        if (!imageFile.exists()) {
            alert('File ' + filename + ' does not exist');
            return;            
        }        
        var image = imageFile.read();
        
		var xhr = Titanium.Network.createHTTPClient();
        
		xhr.onerror = function(e)
		{
			Titanium.UI.createAlertDialog({title:'Error', message:e.error}).show();
			Titanium.API.info('IN ERROR ' + e.error);
			win.ind_container.hide();			
		};
		xhr.setTimeout(20000);
		xhr.onload = function(e)
		{
            // Titanium.UI.createAlertDialog({title:'Success', message:'status code ' + this.status}).show();
            Titanium.UI.createAlertDialog({title:'Success', message:'Thanks! Your photo has been uploaded.'}).show();
			Titanium.API.info('IN ONLOAD ' + this.status + ' readyState ' + this.readyState);
            Titanium.API.info('received: ' + this.responseText);
			win.ind_container.hide();
		};
		xhr.onsendstream = function(e)
		{
            ind.value = e.progress;
			Titanium.API.info('ONSENDSTREAM - PROGRESS: ' + e.progress);
		};
		// open the client
		xhr.open('POST', 'http://' + CONFIG.server + '/post-photo/');

		// send the data
		xhr.send({file:image, filename:filename, password:'sanford1000', message:'check me out'});        
    }

    var REMOVE_STRING = 'Remove Your Visit';
    var ADD_STRING = 'Checkin at this Location';

    var win = Titanium.UI.currentWindow;
    var scandal = Titanium.UI.currentWindow.scandal;
    var scandal_hash = Titanium.UI.currentWindow.scandal_hash;

    Titanium.UI.setBackgroundColor('#fff');

    var containing_view = Titanium.UI.createView({height:'auto', top: 0, left: 10, width: 280, layout:'vertical', backgroundColor:'#fff'});            

    // tip text
    var text_label = Titanium.UI.createLabel({
    	text: scandal.tip,
    	font:{fontSize:12},
        top: 10,      
        width: 280,
    	height:'auto'
    });
    Titanium.UI.currentWindow.text_label = text_label;
    containing_view.add(text_label);


    // distance label
    var distance_label = Titanium.UI.createLabel({
        text: scandal.tip,
    	font:{fontSize:12},
        top: 10,      
        width: 280,
        text: '',
        color: '#888800',
    	height:'auto'
    });
    Titanium.UI.currentWindow.distance_label = distance_label;
    containing_view.add(distance_label);

    // checkin button
    var checkin_button = Titanium.UI.createButton({ height:40, top: 10, width:200 });
    if(!Titanium.UI.currentWindow.SUNLIGHT.IsScandalVisited(scandal_hash)) {
        checkin_button.title = ADD_STRING;
    }
    else {
        checkin_button.title = REMOVE_STRING;
    }

    checkin_button.addEventListener('click', function() {
        if(!Titanium.UI.currentWindow.SUNLIGHT.IsScandalVisited(scandal_hash)) {
            checkin_button.title = REMOVE_STRING;
            Titanium.UI.currentWindow.SUNLIGHT.AddScandalAction(scandal_hash, 'visit');
            setTimeout(function(){ win.annotation.pincolor = Titanium.Map.ANNOTATION_GREEN; }, 200);
        }
        else {    
            checkin_button.title = ADD_STRING;
            Titanium.UI.currentWindow.SUNLIGHT.RemoveScandalAction(scandal_hash, 'visit');
            setTimeout(function(){ win.annotation.pincolor = Titanium.Map.ANNOTATION_RED; }, 200);
        }
    });
    
    containing_view.add(checkin_button);
    win.checkin_button = checkin_button;
    
    // test upload button
    var upload_button = Titanium.UI.createButton({ height:40, width:200, top: 10, title: 'Test Upload'});
    upload_button.addEventListener('click', function() {
        UploadPhoto('test.jpg');     
    });
    Titanium.UI.currentWindow.upload_button = upload_button;
    containing_view.add(upload_button);
    
    
    // camera button
    var camera_button = Titanium.UI.createButton({ height:40, width:200, top: 10, title: 'Take Photo'});
    camera_button.addEventListener('click', function() {
        var win = Titanium.UI.currentWindow;
        Titanium.Media.showCamera({

        	success:function(event) {
        		var cropRect = event.cropRect;
        		var image = event.media;
        		var filename = Titanium.UI.currentWindow.SUNLIGHT.Hash((new Date()).getTime()/1000);
                alert(filename);

        		var f = Titanium.Filesystem.getFile(Titanium.Filesystem.applicationDataDirectory, filename);
        		f.write(image);
                
                UploadPhoto(filename);
        	},
        	cancel:function() {

        	},
        	error:function(error) {
        		// create alert
        		var a = Titanium.UI.createAlertDialog({title:'Camera'});

        		// set message
        		if (error.code == Titanium.Media.NO_CAMERA) {
        			a.setMessage('Device does not have video recording capabilities');
        		}
        		else {
        			a.setMessage('Unexpected error: ' + error.code);
        		}
        		// show alert
        		a.show();
        	},
        	allowEditing: false,
        	saveToPhotoGallery: true,
        	autohide: true
        });
        
    });
    Titanium.UI.currentWindow.camera_button = camera_button;
    containing_view.add(camera_button);
    
    // begin callbacks to update the label
    setTimeout(function() { UpdateDistanceLabel(); }, 250);
    
    Titanium.UI.currentWindow.add(containing_view);
        
})();