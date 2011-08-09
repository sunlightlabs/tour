(function(){
    if (st.tests.enabled) {
        Ti.include('/test/lib/jasmine-1.0.2.js');
        Ti.include('/test/lib/jasmine-titanium.js');
        
        // Include all the test files
        Ti.include('/test/main.js');
        Ti.include('/test/models.js');
        Ti.include('/test/query.js');
        
        jasmine.getEnv().addReporter(new jasmine.TitaniumReporter());
        jasmine.getEnv().execute();
    }
})();