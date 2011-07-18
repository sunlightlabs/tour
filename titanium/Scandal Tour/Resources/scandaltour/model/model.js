/**
 * Base for models, taken/adapted from Tweetanium app
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.model = {
        dbname:'scandal_tour'
    };
    
    //Create a persistent entity
    st.model.Entity = function(/*String*/ _class, /*Object*/ _properties) {
        //mixin all properties for the object passed in
        st.mixin(this,_properties);
        
        this._className = _class;
        
        //Create a table for this entity type
        var db = Ti.Database.open(st.model.dbname);
        db.execute('CREATE TABLE IF NOT EXISTS '+_class+' (id INTEGER PRIMARY KEY, json TEXT)');
        db.close();
        
        //save this entity - returns the ID of this entity
        this.save = function() {
            db = Ti.Database.open(st.model.dbname);
            db.execute('INSERT INTO '+this._className+' (json) VALUES (?)',JSON.stringify(this));
            var id = db.lastInsertRowId;
            this.id = id;
            db.close();
            Ti.App.fireEvent('app:entity.saved',{
                className:this._className,
                id:id
            });
            return id;
        };
    };
    
    //helper function to hydrate a JSON graph with class functions
    function hydrate(/*String*/ _className, /*String*/ _json) {
        return (st.model[_className]) ? new st.model[_className](JSON.parse(_json)) : JSON.parse(_json);
    }
    
    //load an entity by the given ID
    st.model.load = function(/*String*/ _className, /*Number*/ _id) {
        var obj = null;
        var db = Ti.Database.open(st.model.dbname);
        
        //be tolerant of entities that don't exist - create a table for them
        db.execute('CREATE TABLE IF NOT EXISTS '+_className+' (id INTEGER PRIMARY KEY, json TEXT)');
        
        var rs = db.execute('SELECT * FROM '+_className+' WHERE id = ?', _id);
        
        if (rs.isValidRow()) {
            var json = rs.fieldByName('json');
            obj = hydrate(_className,json);
            obj.id = rs.fieldByName('id');
        }
        
        rs.close();
        db.close();
        return obj;
    };
    
    //get a list of all entities of the given class
    st.model.list = function(/*String*/ _className) {
        var results = [];
        var db = Ti.Database.open(st.model.dbname);
        
        //be tolerant of entities that don't exist - create a table for them
        db.execute('CREATE TABLE IF NOT EXISTS '+_className+' (id INTEGER PRIMARY KEY, json TEXT)');
        
        var rs = db.execute('SELECT * FROM '+_className);
        
        Ti.API.log('model list', 'got ' + rs.rowCount + ' results from ' + _className);
        
        while (rs.isValidRow()) {
            var json = rs.fieldByName('json');
            
            obj = hydrate(_className,json);
            obj.id = rs.fieldByName('id');
            
            results.push(obj);
            rs.next();
        }
        
        rs.close();
        db.close();
        return results;
    };
    
    st.model.install = function() {
        var db = Ti.Database.install('/scandaltour/model/scandal_tour.sqlite3', st.model.dbname);
        db.close();

        Ti.API.log('st.model.install', 'Install scandal_tour');
        Ti.App.fireEvent('app:db.installed');
    };
    
})();

Ti.include(
    '/scandaltour/model/Scandal.js'
);