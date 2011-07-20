/**
 * Styles defined in the objects to be used throughout app
 * @author dcloud
 * @version $Rev$
 */
(function() {
    st.ui.theme = {
        textColor: '#000000',
        headerColor: '#333333',
        fontFamily: st.os({
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
        
        Button: {
            height: 25,
            width: 100,
            color: '#000000',
            backgroundColor: '#FF0000',
            font: {
                fontSize: 18,
                fontWeight: 'bold'
            }
        },
        
        ButtonBar: {
            backgroundColor: '#FF0000',
            borderRadius: 0
        },
        
        Spinner: {
            userSpinner: true,
            visibleItems: 3
        },
        
        stretch: {
            top:0,bottom:0,left:0,right:0
        }
    };
}());

//global shortcut for UI properties, since these get used A LOT. polluting the global
//namespace, but for a good cause (saving keystrokes)
var $$ = st.ui.properties;