/**
 * Scandal model
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.model.Scandal = function(_opts) {
        var that = new st.model.Entity('Scandal');
        
        st.mixin(that, _opts);
        
        that.distanceFrom = function(/* Object */ args) {
            var fromLat = args.lat;
            var fromLon = args.lon;

            var R = 3958.76; // miles
            var dLat = (fromLat-that.lat).toRad();
            var dLon = (fromLon-that.lon).toRad(); 
            var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(that.lat.toRad()) * Math.cos(fromLat.toRad()) * Math.sin(dLon/2) * Math.sin(dLon/2);
            var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
            var d = R * c;
            return d;
        };
        
        return that;
    };
}());