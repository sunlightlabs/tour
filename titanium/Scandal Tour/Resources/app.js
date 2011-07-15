/**
 * app.js is launching point for our app
 * @author dcloud
 * @version $Rev$
 */

Ti.include('/scandaltour/scandaltour.js');

st.app.mainWindow = st.ui.createApplicationWindow();
st.app.mainWindow.open();