/**
 * control for app/game logic. Could have been called main.js
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.control = {};
    
    // Set up game state and store data in persistent store
    function initGame () {
        var q = new joli.query().select('location.category').from('location').where('type = ?', 'task');
        // var missionCategories = joli.
        Ti.App.Properties.setBool('initialized', true);
    }
    
    function startPlaying() {
        Ti.API.log('startPlaying', 'Start the game!');
        /*
            Check game status. Is the user starting for the first time? Are they in a mission or ready to start a new one?
            if not first run and no current misssion
                load new mission / go to Chief
            if not first run and current mission
                load last view?
        */
        st.models.QuizItem.truncate();
        var props = {
            question: 'Who was the first president of the United States?',
            answer: 'George Washington'
        };
        var item = st.models.QuizItem.newRecord(props);
        var distractors = [
            'Steven Segal ###',
            'George W. Bush ###',
            'Barack Obama ###',
            'Tina Fey ###'
        ];
        item.setDistractors(distractors);
        item.save();
        
        st.app.currentQuizItem = item;
        
        var lightBox = st.ui.createQuizView({
            question: props.question,
            answers: item.getChoices()
        });
        st.app.currentQuizView = lightBox;
        
        st.app.mainWindow.backgroundImage = 'images/spaceseed_320.gif';
        st.app.mainWindow.add(lightBox);
    }
    
    function loadNewMission() {
        // Go to the Editor in Chief
    }
    
    function resumeMission() {
        // how to track mission status/progress?
        // at.app.gameState
    }
    
    function quizUser() {
        /**
            Quiz the user by asking a question
            1. Controller creates, opens view (modal window)
            2. User picks an answer (UI event)
            3. Controller callback for event is called. Based on being right/wrong, controller sends you either to FAIL screen or you WIN
         */
         // st.app.mainWindow.add(quizView);
         // st.ui.alert('What is 2 + 2?');
    }
    
    function processQuizGuess (e) {
        Ti.API.log('st:QuizGuess', 'heard quiz guess: "'+e.guess+'"');
        if (e.guess === st.app.currentQuizItem.answer) {
            Ti.API.log('st:QuizGuess', 'correct!!');
            Ti.API.log('st.app.currentQuizItem.id', st.app.currentQuizItem.id);
            Ti.API.log('st.app.currentQuizItem', st.app.currentQuizItem);
            // Close window and move to correct answer state
            st.app.mainWindow.remove(st.app.currentQuizView);
            Ti.App.fireEvent('st:QuizCorrect', {id:st.app.currentQuizItem.id});
        }
    }
    
    st.control.initialize = function() {
        if(!st.tests.enabled) {
            Ti.App.addEventListener('app:db.installed', function(){
                Ti.API.log('app:db.installed', 'control heard installed');
                if(!Ti.App.Properties.getBool('initialized')) {
                    initGame();
                }
                startPlaying();
            });
            st.app.mainWindow = st.ui.createApplicationWindow();
            st.app.mainWindow.open();
        }
        st.models.install();
        Ti.App.addEventListener('st:QuizGuess', processQuizGuess);
    };
    
    // Shuffle taken from: 
    // http://stackoverflow.com/questions/962802/is-it-correct-to-use-javascript-array-sort-method-for-shuffling/962890#962890
    st.control.shuffle = function (array) {
        var tmp, current, top = array.length;

        if(top) while(--top) {
            current = Math.floor(Math.random() * (top + 1));
            tmp = array[current];
            array[current] = array[top];
            array[top] = tmp;
        }

        return array;
    };
    
}());
