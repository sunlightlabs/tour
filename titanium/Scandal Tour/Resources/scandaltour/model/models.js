/**
 * Base for models, taken/adapted from Tweetanium app
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.models = {
        dbname:'scandal_tour'
    };
    st.models.installed = false;
        
    st.models.install = function() {
        var db = Ti.Database.install('/scandaltour/model/scandal_tour.sqlite3', st.models.dbname);
        db.close();
        joli.connection = new joli.Connection(st.models.dbname);
        joli.models.initialize();
        Ti.API.log('st.models.install', 'Install scandal_tour');
        Ti.App.fireEvent('app:db.installed');
        Ti.App.Properties.setBool('installed', true);
    };
    
})();

Ti.include(
    '/scandaltour/model/Location.js',
    '/scandaltour/model/QuizItem.js'
);

