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
        st.app.mainWindow = st.ui.createApplicationWindow();
        st.app.mainWindow.open();
        st.model.install();
    };
    
}());
