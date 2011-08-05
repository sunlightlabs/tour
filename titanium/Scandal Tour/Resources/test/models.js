(function() {

    // Testing purposes
     function getRandomInt(min, max)
     {
       return Math.floor(Math.random() * (max - min + 1)) + min;
     }


    // Cribbed from joli.js-demo
    describe('st.models', function() {
        
        it('st.model defined', function() {
            expect(st.model).toBeDefined();
            expect(st.model.Location).toBeDefined();
        });
        
        it('joli.models defined', function() {
            expect(joli).toBeDefined();
            expect(joli.models).toBeDefined();
        });
        
        it('joli.models.get()', function() {
          expect(joli.models.get('locations')).toBe(st.model.Location);
          // expect(joli.models.get('city')).not.toBe(models.human);
        });
        
        it('joli.models.has()', function() {
          expect(joli.models.has('locations')).toBeTruthy();
          expect(joli.models.has('inexistant_model')).toBeFalsy();
        });

        it('Location model should have distanceFrom func', function() {
            var loc = st.model.Location.findOneById(getRandomInt(1,10));
            expect(loc).toBeDefined();
            expect(loc.distanceFrom).toBeDefined();
        });


/*
        it('should be able to calculate distanceFrom', function() {
            var test_loc = st.model.Location.findOneById(getRandomInt(1,10));
            expect(test_loc).toBeDefined();
            expect(st.config.defaults.region).toBeDefined();
            var region = st.config.defaults.region;
            expect(test_loc.distanceFrom(region)).toBeTruthy();
        });
*/


    });
}());