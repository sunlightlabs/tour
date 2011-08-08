/**
 * control for app/game logic. Could have been called main.js
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.control = {};
    
    function startPlaying() {
        Ti.API.log('startPlaying', 'Start the game!');
        /*
            Check game status. Is the user starting for the first time? Are they in a mission or ready to start a new one?
            if not first run and no current misssion
                load new mission / go to Chief
            if not first run and current mission
                load last view?
        */

    }
    
    function loadNewMission() {
        // Go to the Editor in Chief
    }
    
    function resumeMission() {
        // how to track mission status/progress?
        // at.app.gameState
    }
    
    st.control.initialize = function() {
        Ti.App.addEventListener('app:db.installed', function(){
            Ti.API.log('app:db.installed', 'control heard installed');
            startPlaying();
        });
        if(!st.tests.enabled) {
            st.app.mainWindow = st.ui.createApplicationWindow();
            st.app.mainWindow.open();
        }
        st.models.install();
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
