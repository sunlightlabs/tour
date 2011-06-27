var SUNLIGHT = {
    scandals: scandals,    
    id_hash: Sha1.hash(Titanium.Platform.id + CONFIG.secret),    
    locationDetected: false,
    
    IsScandalVisited: function(scandal_hash) {
        return (this.scandals[scandal_hash].visited===true);        
    },
    
    AddScandalAction: function(scandal_hash, action_type) {
        var db = Ti.Database.open('scandal_tour');          
        sql = "INSERT INTO actions (scandal_hash, date, lat, lon, action_type) VALUES ('" + scandal_hash + "', " + ((new Date()).getTime()/1000) + ", 0, 0, '" + action_type + "')";
        var result = db.execute(sql);
        db.close();

        if(action_type=='visit')
            this.scandals[scandal_hash].visited = !(this.scandals[scandal_hash].visited);
    },
    
    RemoveScandalAction: function(scandal_hash, action_type) {
        var db = Ti.Database.open('scandal_tour');          
        sql = "DELETE FROM actions WHERE scandal_hash='" + scandal_hash + "' AND action_type='" + action_type + "'";
        var result = db.execute(sql);
        db.close();    

        if(action_type=='visit')
            SUNLIGHT.scandals[scandal_hash].visited = !(SUNLIGHT.scandals[scandal_hash].visited);
    },
    
    Hash: function(value) {
        return Sha1.hash(this.id_hash + CONFIG.secret + value);        
    },    
    
    SetUser: function(user) {
        Titanium.App.Properties.setInt('ST_user_id', user.user_id);
        Titanium.App.Properties.setString('ST_username', user.name);
        Titanium.App.Properties.setString('ST_password_hash', user.password_hash);
        Titanium.App.Properties.setString('ST_id_hash', user.id_hash);
        Titanium.App.Properties.setInt('ST_points', user.points);
    },
    
    UserExists: function(){
        if (Titanium.App.Properties.hasProperty('ST_user_id')) {
            return (Titanium.App.Properties.getInt('ST_user_id')>0);
        }    
        return false;
    },
    
    GetUser: function() {
        if (this.UserExists()) {
            return {
                user_id: Titanium.App.Properties.getString('ST_user_id'),
                name: Titanium.App.Properties.getString('ST_username'),
                id_hash: Titanium.App.Properties.getString('ST_id_hash'),
                points: Titanium.App.Properties.getPoints('ST_points'),
            };
        } else {
            return {
                user_id: 0,
                name: '',
                id_hash: '',
                points: '',
            };
        }
    },
    
    UpdateLocation: function(coords) {
        Titanium.API.info('updating location');
        this.locationDetected = true;
    	this.longitude = coords.longitude;
    	this.latitude = coords.latitude;
    	this.altitude = coords.altitude;
    	this.heading = coords.heading;
    	this.accuracy = coords.accuracy;
    	this.speed = coords.speed;
    	this.timestamp = coords.timestamp;
    	this.altitudeAccuracy = coords.altitudeAccuracy;        
    },
    
    LocationHasBeenDetected: function() {
        if (typeof(this.locationDetected)===undefined) {
            return false;
        }
        else {
            return this.locationDetected;
        }
    },
    
    DistanceFromCurrentLocation: function(lat1, lon1) {        
        var lat2 = this.latitude;
        var lon2 = this.longitude;
        
        var R = 3958.76; // miles
        var dLat = (lat2-lat1).toRad();
        var dLon = (lon2-lon1).toRad(); 
        var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(lat1.toRad()) * Math.cos(lat2.toRad()) * Math.sin(dLon/2) * Math.sin(dLon/2);
        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
        var d = R * c;
        return d;
    }
    
};

if (typeof(Number.prototype.toRad) === "undefined") {
  Number.prototype.toRad = function() {
    return this * Math.PI / 180;
  }
}

/** Converts radians to numeric (signed) degrees */
if (typeof(Number.prototype.toDeg) === "undefined") {
  Number.prototype.toDeg = function() {
    return this * 180 / Math.PI;
  }
}