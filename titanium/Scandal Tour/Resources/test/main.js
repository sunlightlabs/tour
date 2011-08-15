(function(){
    st.tests.getRandomInt = function(min, max){
      return Math.floor(Math.random() * (max - min + 1)) + min;
    };
    
    // To learn how to write Jasmine tests, please read Jasmine documentation:
    // https://github.com/pivotal/jasmine/wiki
    
     describe('scandaltour', function() {

        describe('Gameplay', function() {
            var shuffledQuiz, sources = [];
            
            beforeEach(function() {
                var obj, person;
                sources = [];
                st.models.QuizItem.truncate();
                for (var i=0; i < 30; i++) {
                    var props = {
                        question: 'What is the answer to question #'+i+'?',
                        answer: 'Correct answer #' + i
                    };
                    var newQuizItem = st.models.QuizItem.newRecord(props);
                    var distractors = [
                        'Steven Segal ' + i,
                        'George W. Bush ' + i,
                        'Barack Obama ' + i,
                        'Tina Fey ' +  i
                    ];
                    newQuizItem.setDistractors(distractors);
                    newQuizItem.save();
                }
                obj = { first_name: 'Polly', last_name: 'Pickpocket' };
                person = new st.models.Character(obj);
                sources.push(person);
                obj = { first_name: 'Sammy', last_name: 'Smartalec' };
                person = new st.models.Character(obj);
                sources.push(person);
                obj = { first_name: 'Robbin', last_name: 'Youblind' };
                person = new st.models.Character(obj);
                sources.push(person);
                obj = { first_name: 'Dewey', last_name: 'Cheatem' };
                person = new st.models.Character(obj);
                sources.push(person);

                shuffledQuiz = st.models.QuizItem.getShuffledQuiz();
                
            });
            
            it('Has 30 questions', function() {
                var allQuizItems = st.models.QuizItem.all();
                expect(allQuizItems).not.toEqual(30);
            });
            
            it('Has randomly ordered quiz', function() {
                var orderedQuiz = st.models.QuizItem.all();
                expect(shuffledQuiz).not.toBeNull();
                expect(shuffledQuiz).not.toEqual(orderedQuiz);
            });
            
            it('has Characters', function() {
                expect(sources).not.toBeNull();
            });
            
            it('Characters ask questions (some should fail)', function() {
                Ti.API.log('Sources.length',sources.length);
                var g;
                for (g=0; g < sources.length; g++) {
                    var srcg = sources[g]; // Workaround Android "too deep recursion" errors in Titanium
                    expect(srcg).toBeDefined();
                    expect(shuffledQuiz).toBeDefined();
                    srcg.quizItem = shuffledQuiz.pop();
                    expect(srcg.quizItem).toBeDefined();
                    var choices = srcg.quizItem.getChoices();
                    var randomNum = st.tests.getRandomInt(0, choices.length-1);
                    var randomAnswer = choices[randomNum];
                    expect(srcg.quizItem.answer).toEqual(randomAnswer);
                    if (srcg.quizItem.answer === randomAnswer) {
                        break;
                    }
                    Ti.API.log('Character "'+ srcg.name+'" asks', srcg.quizItem.question);
                    Ti.API.log('Character choices', choices);
                    Ti.API.log('Character guess', randomAnswer);
                }
                expect(g).toBeLessThan(sources.length);
            });
                        
        });
    
    });
})();