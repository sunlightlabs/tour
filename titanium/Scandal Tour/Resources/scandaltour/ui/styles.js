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
        }),
        backgroundGradient: {
            type:'linear',
            colors:['#111','#444'],
            startPoint:{x:0,y:25},
            endPoint:{x:0,y:50},
            backFillStart:false
        }
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
            // borderRadius: 0,
            // borderWidth: 1,
            borderColor: '#787878',
            backgroundColor: '#AFAFAF',
            backgroundGradient: st.ui.theme.backgroundGradient,
            font: {
                fontSize: 18,
                fontWeight: 'bold'
            }
        },
        
        ButtonBar: {
            backgroundColor: '#AFAFAF',
            // backgroundGradient: st.ui.theme.backgroundGradient,
            width: Ti.Platform.displayCaps.platformWidth,
            height: 25
        },
        
        ToolBar: {
            backgroundColor: '#AFAFAF',
            // backgroundGradient: st.ui.theme.backgroundGradient,
            width: Ti.Platform.displayCaps.platformWidth,
            height: 25
        },
        
        Spinner: {
            useSpinner: true,
            selectionIndicator: true,
            visibleItems: 3,
            left:0,
            right:0,
            bottom: 0,
            width: Ti.Platform.displayCaps.platformWidth
        },
        
        SpinnerColumn: {
            'font-size': 18
        },
        
        SpinnerRow: {
            height: 50,
            textAlign: Titanium.UI.TEXT_ALIGNMENT_CENTER
        },
        
        CharacterText: {
            height: Ti.Platform.displayCaps.platformHeight*0.4,
            bottom: 0,
            backgroundColor: '#EFEFEF',
            color: '#333333',
            textAlign: Titanium.UI.TEXT_ALIGNMENT_LEFT,
            touchEnabled: false,
            focusable: false
        },
        
        stretch: {
            top:0,bottom:0,left:0,right:0
        }
    };
}());

//global shortcut for UI properties, since these get used A LOT. polluting the global
//namespace, but for a good cause (saving keystrokes)
var $$ = st.ui.properties;