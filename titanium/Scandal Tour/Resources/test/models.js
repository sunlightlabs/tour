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
          expect(joli.models.get('quizitems')).toBe(st.model.QuizItem);
          // expect(joli.models.get('city')).not.toBe(models.human);
        });
        
        it('joli.models.has()', function() {
          expect(joli.models.has('locations')).toBeTruthy();
          expect(joli.models.has('quizitems')).toBeTruthy();
          expect(joli.models.has('inexistant_model')).toBeFalsy();
        });

        describe('Location', function() {
            it('Location should have distanceFrom func', function() {
                var loc = st.model.Location.findOneById(getRandomInt(1,10));
                expect(loc).toBeDefined();
                expect(loc.distanceFrom).toBeDefined();
                expect(st.config.defaults.region).toBeDefined();
                var region = st.config.defaults.region;
                expect(loc.distanceFrom(region)).toBeLessThan(20);
            });
        });
        
        describe('QuizItem', function() {
            // st.model.QuizItem.truncate();
            var item, distractors;
            
            beforeEach(function() {
                item = st.model.QuizItem.newRecord({
                    question: 'Who was the first president of the United States',
                    answer: 'George Washington'
                });
                distractors = [
                    'Steven Segal',
                    'George W. Bush',
                    'Barack Obama',
                    'Tina Fey'
                ];
                item.setDistractors(distractors);
            });
            
            
            it('stores distractors as JSON', function() {
                expect(item.distractors).not.toBeNull();
                expect(item.distractors).not.toEqual(distractors);
                var decodedArr = JSON.parse(item.distractors);
                expect(decodedArr).toEqual(distractors);
                item.save();
            });
            
            it('retrieves distractors array', function() {
                var retrievedArr = item.getDistractors();
                expect(retrievedArr).toEqual(distractors);
            });
        });

    });
}());