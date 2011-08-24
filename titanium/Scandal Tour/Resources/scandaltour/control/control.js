/**
 * control for app/game logic. Could have been called main.js
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.control = {};
    
    // Set up game state and store data in persistent store
    function initGame () {
        Ti.API.log('initGame', 'Set up game');
        
        var q = new joli.query().select().from('locations').where('type = ?', 'task');
        var tasks_result = q.execute();
        var categories = _.uniq(_.compact(_.pluck(tasks_result, 'category')));
        
        var tasks = st.control.shuffle(tasks_result);
        var task_sequence = _.pluck(tasks, 'id');
        Ti.App.Properties.setList('tasks', task_sequence);
        Ti.API.log('initGame task_sequence', task_sequence.toString());
        
        Ti.API.log('initGame tasks_result.length', tasks_result.length);
        Ti.App.Properties.setInt('totalTasks', tasks_result.length);
        for (var i=0; i < categories.length; i++) {
            Ti.API.log('initGame category', categories[i]);
        }
        Ti.App.Properties.setList('categories', categories);
        // Ti.App.Properties.setBool('initialized', true);
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
        loadNewMission();

    }
    
    function getNextTask () {
        var task_list = Ti.App.Properties.getList('tasks', []);
        var task_id = _.first(task_list.splice(0,1));
        Ti.App.Properties.setList('tasks', task_list);
        Ti.App.Properties.setInt('task_id', task_id);
        return task_id;
    }
    
    function loadCharacter(_args) {
        var charView = st.ui.createCharacterView(st.combine(_args, {
            center: $$.Slide.Out.center
        }));
        return charView;
    }
    
    function loadChief(_args) {
        var args = {
            characterImage: 'images/jjj.jpg', 
            characterName: 'Editor in Chief',
            dialogue: _args.dialogue
        };
        var character = st.models.Character(args);
        Ti.API.log('loadChief character', character);
        return loadCharacter({
            character: character,
            locationImage: 'images/spaceseed_320.gif',
            actionType: 'selectSource',
            actionLabel: 'Find a source'
        });
    }
    
    function selectSource () {
        // present user with list of source-characters
        Ti.API.log('selectSource', st.app.tmpCharacters[0].characterName);
        var dialogue = _.sprintf("Sorry, do I know you? Yeah, I'm %(characterName)s. What's it to you? Listen, I am a very educated person and I have people to see and things to do and all that.\n\nLocavore +1 vice qui cillum. Anim williamsburg 8-bit ea et 3 wolf moon ullamco vero, farm-to-table fixie fap PBR iphone cliche. Minim stumptown enim PBR quinoa, nesciunt dolore ea labore DIY. Nihil brooklyn portland american apparel keytar. Brunch lomo laboris, veniam aesthetic shoreditch cardigan cupidatat aute hoodie anim. Nulla ex leggings, lo-fi cosby sweater duis single-origin coffee quinoa vinyl williamsburg occaecat enim beard mcsweeney's art party. Fap retro minim, fugiat helvetica irony sustainable high life master cleanse mollit viral banksy etsy locavore eiusmod.\n\n Incididunt sed cosby sweater, consequat pariatur esse et homo single-origin coffee artisan voluptate sunt. Pitchfork next level DIY cosby sweater, consectetur farm-to-table quinoa single-origin coffee tempor blog keffiyeh reprehenderit eiusmod. Non consectetur aute you probably haven't heard of them id. Ex locavore hoodie, thundercats VHS four loko minim odio mustache et pitchfork aesthetic dolor. Organic id gluten-free incididunt. Echo park minim officia lomo, cosby sweater pitchfork blog. Nostrud placeat vero voluptate.", {
            characterName: st.app.tmpCharacters[0].characterName
        });
        st.app.tmpCharacters[0].dialogue = dialogue;
        st.ui.slideOut(st.app.currentView, {}, function() {
            st.app.mainWindow.remove(st.app.currentView);
            st.app.currentView = loadCharacter({
                character: st.app.tmpCharacters[0],
                locationImage: '',
                actionType: 'quiz',
                actionLabel: 'Answer question.'
            });
            st.app.mainWindow.add(st.app.currentView);
            st.ui.slideIn(st.app.currentView, {
                delay: 500
            });            
        });
    }
    
    function loadNewMission() {
        // get a task id from tasks
        var task_id = getNextTask();
        var task_list = Ti.App.Properties.getList('tasks', []);
        Ti.API.log('loadNewMission task_list', task_list.toString());
        Ti.App.Properties.setInt('currentTaskId', task_id);
        var task = st.models.Location.findOneById(task_id);
        
        // Go to the Editor in Chief
        var taskText =  _.sprintf("We are investigating %(category)s. I think %(name)s may be spending gobs of money, but I need you to find out! Here's my list of sources. Go pump them for information!", {
            category:(task.category||'something').toLowerCase(),
            name:task.name||'someone'
        });
        st.app.currentView = loadChief({
            dialogue: taskText 
        });
        st.app.mainWindow.add(st.app.currentView);
        st.ui.slideIn(st.app.currentView, {
            delay: 500
        });
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
         
         // Ti.API.log('quizUser', 'create quizView next');
         var quizView = st.ui.createQuizView(st.combine($$.Fade.Out, {
             question: props.question,
             answers: item.getChoices()
         }));
         
         st.app.currentOverlay = quizView;
         st.app.mainWindow.add(quizView);

         st.ui.fadeIn(quizView);
         
    }
    
    function processQuizGuess(e) {
        Ti.API.log('st:QuizGuess', 'heard quiz guess: "'+e.guess+'"');
        var feedbackView = null;
        Ti.API.log('st.app.currentQuizItem.id', st.app.currentQuizItem.id);
        if (e.guess === st.app.currentQuizItem.answer) {
            Ti.API.log('st:QuizGuess', 'correct!!');

            feedBackView = st.ui.createFeedbackView(st.combine($$.Fade.Out, {
                feedbackText: 'Congratulations, that is correct!'
            }));
            // Ti.App.fireEvent('st:QuizCorrect', {id:st.app.currentQuizItem.id});
        }
        else {
            Ti.API.log('st:QuizGuess', 'wrong!!');
            feedBackView = st.ui.createFeedbackView(st.combine($$.Fade.Out, {
                feedbackText: "Sorry, sport, that's not right"
            }));
            var taskQueue = Ti.App.Properties.getList('tasks', null);
            var taskId = Ti.App.Properties.getInt('currentTaskId', null);
            taskQueue.push(taskId);
            Ti.App.Properties.setList('tasks', taskQueue);            
            // Ti.App.fireEvent('st:QuizWrong', {id:st.app.currentQuizItem.id});
        }
        // Close overlay and move to feedback state
        st.ui.fadeOut(st.app.currentOverlay, {}, function(e) {
            Ti.API.log('control processQuizGuess', 'currentOverlay faded out');
            st.app.mainWindow.remove(st.app.currentOverlay);
            st.app.mainWindow.add(feedBackView);
            st.app.currentOverlay = feedBackView;
            st.ui.fadeIn(st.app.currentOverlay, {
                delay: 500
            });
        });
        
    }
    
    function onDatabaseInstalled (e) {
        Ti.API.log('app:db.installed', 'control heard installed');
        if(!Ti.App.Properties.getBool('initialized')) {
            initGame();
        }
        startPlaying();
    }
    
    st.control.initialize = function() {
        if(!st.tests.enabled) {
            Ti.App.addEventListener('app:db.installed', onDatabaseInstalled);
            st.app.mainWindow = st.ui.createApplicationWindow();
            st.app.mainWindow.open();
        }
        st.models.install();
        addEventListeners();
    };
    
    function addEventListeners() {
        Ti.App.addEventListener('st:QuizGuess', processQuizGuess);
        Ti.App.addEventListener('st:AskQuestion', function (e){
            Ti.API.log('control', 'Heard st:AskQuestion from ' + e);
            quizUser();
        });
        Ti.App.addEventListener('st:feedbackClick', function callback(e){
            Ti.API.log('control', 'Heard st:feedbackClick');
            st.ui.fadeOut(st.app.currentOverlay);
            st.ui.slideOut(st.app.currentView, { duration: 400}, function(e) {
                st.app.mainWindow.remove(st.app.currentView);
                var task_list = Ti.App.Properties.getList('tasks', []);
                var totalTasks = Ti.App.Properties.getInt('totalTasks', 0);
                var pctProgress = 1-task_list.length/Ti.App.Properties.getInt('totalTasks', 0);
                Ti.API.log('st:feedbackClick task_list.length', task_list.length);
                Ti.API.log('st:feedbackClick totalTasks', totalTasks);
                Ti.API.log('st:feedbackClick game progress', pctProgress);
                loadNewMission();                
            });
        });
    }
    
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
    
    st.control.introspect = function(obj, objName) {
        // var propList = "";
        for (var propName in obj) {
            if (propName !== "undefined") {
                // propList += (propName + ", ");
                Ti.API.log(objName+'.'+propName+': ', obj[propName]);
            }
        }
    };
    
}());
