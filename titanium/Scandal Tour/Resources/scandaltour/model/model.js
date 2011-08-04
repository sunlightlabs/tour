/**
 * Base for models, taken/adapted from Tweetanium app
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.model = {
        dbname:'scandal_tour'
    };
    st.model.installed = false;
        
    st.model.install = function() {
        var db = Ti.Database.install('/scandaltour/model/scandal_tour.sqlite3', st.model.dbname);
        db.close();
        joli.connection = new joli.Connection(st.model.dbname);
        joli.models.initialize();
        Ti.API.log('st.model.install', 'Install scandal_tour');
        Ti.App.fireEvent('app:db.installed');
        Ti.App.Properties.setBool('installed', true);
    };
    
})();

Ti.include(
    '/scandaltour/model/Location.js'
);

