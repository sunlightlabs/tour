/**
 * Scandal model
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.models.Location = new joli.model({
        table: 'locations',
        columns: {
            id: 'INTEGER PRIMARY KEY AUTOINCREMENT',
            description: 'TEXT',
            address: 'TEXT',
            link: 'TEXT',
            latitude: 'FLOAT',
            longitude: 'FLOAT',
            has_visited: 'INTEGER'
        },
        objectMethods: {
            distanceFrom: function(comparison_location) {
                var fromLat = comparison_location.latitude;
                var fromLon = comparison_location.longitude;

                var R = 3958.76; // miles
                var dLat = (fromLat-this.latitude).toRad();
                var dLon = (fromLon-this.longitude).toRad(); 
                var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(this.latitude.toRad()) * Math.cos(fromLat.toRad()) * Math.sin(dLon/2) * Math.sin(dLon/2);
                var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
                var d = R * c;
                return d;
            }
        }
    });
        
}());