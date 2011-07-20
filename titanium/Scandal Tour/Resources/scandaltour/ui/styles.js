/**
 * Styles defined in the objects to be used throughout app
 * @author dcloud
 * @version $Rev$
 */
(function() {
    st.ui.theme = {
        textColor: '#000000',
        headerColor: '#333333',
        fontFamily: tt.os({
            iphone: 'Helvetica Neue',
            android: 'Droid Sans'
        })
    };
    
    st.ui.properties = {
        platformWidth: Ti.Platform.displayCaps.platformWidth,
        platformHeight: Ti.Platform.displayCaps.platformHeight,
        
        Label: {
            color: st.ui.theme.textColor,
            font: {
                fontFamily: st.ui.theme.fontFamily,
                fontSize: 12
            },
            height: 'auto'
        },
        
        stretch: {
            top:0,bottom:0,left:0,right:0
        }
    };
}());

//global shortcut for UI properties, since these get used A LOT. polluting the global
//namespace, but for a good cause (saving keystrokes)
var $$ = tt.ui.properties;