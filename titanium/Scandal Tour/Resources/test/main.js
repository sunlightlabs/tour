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
        
        describe('JavaScript VM', function() {
            // https://developer.mozilla.org/en/Core_JavaScript_1.5_Guide/Working_with_Objects#Defining_Getters_and_Setters
            it('does the JavaScript Vm support JavaScript 1.8.1 getters and setters', function() {                
                var o = {
                    a: 7, 
                    get b() {return this.a + 1;}, 
                    set c(x) {this.a = x / 2}
                };
                expect(o.a).toBe(7);
                expect(o.b).toBe(8);
                o.c = 50;
                expect(o.a).toBe(25);
            });
        });

    });
    
})();