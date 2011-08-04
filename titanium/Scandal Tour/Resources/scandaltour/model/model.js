/**
 * Base for models, taken/adapted from Tweetanium app
 * @author dcloud
 * @version $Rev$
 */

/*
    TODO Figure out schema for sqlite db where our stuff will be installed from. May use joli.models.initialize() for models that don't already have tables?
*/

(function() {
    st.model = {
        dbname:'scandal_tour'
    };
    st.model.installed = false;
    var db = Ti.Database.install('/scandaltour/model/scandal_tour.sqlite3', st.model.dbname);
    db.close();
    joli.connection = new joli.Connection(st.model.dbname);
        
    st.model.install = function() {
        joli.models.initialize();
        Ti.API.log('st.model.install', 'Install scandal_tour');
        Ti.App.fireEvent('app:db.installed');
    };
    
})();

Ti.include(
    '/scandaltour/model/Location.js'
);

