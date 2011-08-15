(function() {

    // Cribbed from joli.js-demo
    describe('st.models', function() {
        
        it('st.models defined', function() {
            expect(st.models).toBeDefined();
            expect(st.models.Location).toBeDefined();
        });
        
        it('joli.models defined', function() {
            expect(joli).toBeDefined();
            expect(joli.models).toBeDefined();
        });
        
        it('joli.models.get()', function() {
          expect(joli.models.get('locations')).toBe(st.models.Location);
          expect(joli.models.get('quizitems')).toBe(st.models.QuizItem);
          // expect(joli.models.get('city')).not.toBe(models.human);
        });
        
        it('joli.models.has()', function() {
          expect(joli.models.has('locations')).toBeTruthy();
          expect(joli.models.has('quizitems')).toBeTruthy();
          expect(joli.models.has('inexistant_model')).toBeFalsy();
        });

    });
    
    describe('Location class', function() {
        it('Location should have id, name', function() {
            var randId = st.tests.getRandomInt(1,10);
            var loc = st.models.Location.findOneById(randId);
            expect(loc).toBeDefined();
            expect(loc.id).toBeDefined();
            expect(loc.id).not.toBeNull();
            expect(loc.name).toBeDefined();
            expect(loc.name).not.toBeNull();
        });
        
        it('Location should have distanceFrom func', function() {
            var randId = st.tests.getRandomInt(1,10);
            var loc = st.models.Location.findOneById(randId);
            expect(loc).toBeDefined();
            expect(loc.distanceFrom).toBeDefined();
            expect(st.config.defaults.region).toBeDefined();
            var region = st.config.defaults.region;
            var dFrom = loc.distanceFrom(region);
            expect(dFrom).toBeLessThan(20);
        });
    });
    
    describe('Character class', function() {
        var character;
        
        beforeEach(function() {
            var randId = st.tests.getRandomInt(1,10);
            var loc = st.models.Location.findOneById(randId);
            var character_obj = {
                first_name: 'Timmy',
                last_name: 'Ball',
                location: loc
            };
            character = new st.models.Character(character_obj);
        });
        
        it('Character can return name', function() {
            expect(character.name).toBeDefined();
        });
    });
    
    describe('QuizItem class', function() {
        // st.models.QuizItem.truncate();
        var item, distractors;
        
        beforeEach(function() {
            st.models.QuizItem.truncate();
            var props = {
                question: 'Who was the first president of the United States?',
                answer: 'George Washington'
            };
            item = st.models.QuizItem.newRecord(props);
            distractors = [
                'Steven Segal ###',
                'George W. Bush ###',
                'Barack Obama ###',
                'Tina Fey ###'
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
        
        it('getChoices properly', function() {
            var choices = item.getChoices();
            expect(choices).not.toBeNull();
            distractors.push(item.answer);
            expect(choices).not.toEqual(distractors);
        });
        
        it('evaluates right/wrong answers', function() {
            expect(item.answer).toBe('George Washington');
            expect(item.answer === 'George Washington').toBeTruthy();
            expect(item.answer).not.toBe('Tina Fey');
        });
    });

}());