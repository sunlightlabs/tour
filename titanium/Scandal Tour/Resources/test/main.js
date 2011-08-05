(function(){
    
    // To learn how to write Jasmine tests, please read Jasmine documentation:
    // https://github.com/pivotal/jasmine/wiki
    
     describe('scandaltour', function() {

        it('should fail half of the tests and pass half', function() {
            expect('po' + 'ker').toBe('poker');
            expect('po' + 'ker').toBe('another thing');
            expect(12 + 12).toBe(24);
            expect(12 + 12).toBe(12);
        });
        
/*
        it('can connect the database', function() {
            var db = Ti.Database.open(st.model.dbname);
            
            
        });
*/

    });
    
})();