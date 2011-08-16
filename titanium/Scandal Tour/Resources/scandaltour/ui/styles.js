/**
 * Styles defined in the objects to be used throughout app
 * @author dcloud
 * @version $Rev$
 */
(function() {
    var platformWidth = Ti.Platform.displayCaps.platformWidth;
    var platformHeight = Ti.Platform.displayCaps.platformHeight;

    st.ui.theme = {
        textColor: '#000000',
        headerColor: '#A5A4A2',
        blue: '#53979A',
        red: '#F34648',
        fontFamily: st.os({
            iphone: 'Helvetica Neue',
            android: 'Droid Sans'
        }),
        backgroundColor: '#EFE1D6',
        backgroundGradient: {
            type: 'linear',
            colors: ['#111', '#444'],
            startPoint: {
                x: 0,
                y: 25
            },
            endPoint: {
                x: 0,
                y: 50
            },
            backFillStart: false
        }
    };

    st.ui.properties = {
        platformWidth: platformWidth,
        platformHeight: platformHeight,

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
            width: platformWidth,
            height: 25
        },

        ToolBar: {
            backgroundColor: '#AFAFAF',
            // backgroundGradient: st.ui.theme.backgroundGradient,
            width: platformWidth,
            height: 25
        },

        LightBox: {
            mask: {
                backgroundColor: '#000000',
                opacity: 0.4
            },
            overlay: {
                backgroundColor: st.ui.theme.backgroundColor,
                top: 20,
                bottom: 20,
                left: 15,
                right: 15
            }
        },

        QuizAnswer: {
            Label: {
                textAlign: 'left',
                color: st.ui.theme.textColor,
                width: '95%',
                height: 60
            },
            Button: {
                width: '90%',
                height: 60,
                backgroundColor: st.ui.theme.backgroundColor,
                borderColor: '#787878',
                borderWidth: 1.0,
                spacer: 5
            }
        },

        QuizQuestion: {
            textAlign: 'left',
            font: {
                fontSize: 18,
                fontWeight: 'bold'
            },
            color: st.ui.theme.textColor,
            width: '90%',
            height: 80,
            top: 8
        },

        Feedback: {
            Label: {
                font: {
                    fontSize: 24,
                    fontWeight: 'bold'

                },
                color: st.ui.theme.textColor,
                width: '90%'
            }
        },

        View: {
            In: {
                curve: Ti.UI.ANIMATION_CURVE_EASE_IN_OUT,
                center: {
                    x: platformWidth / 2,
                    y: platformHeight / 2
                },
                duration: 400
            },
            Out: {
                curve: Ti.UI.ANIMATION_CURVE_EASE_IN_OUT,
                center: {
                    x: platformWidth / 2,
                    y: platformHeight * 1.5 - 1
                },
                duration: 400
            }
        },

        Spinner: {
            useSpinner: true,
            selectionIndicator: true,
            visibleItems: 3,
            left: 0,
            right: 0,
            bottom: 0,
            width: platformWidth
        },

        SpinnerColumn: {
            'font-size': 18
        },

        SpinnerRow: {
            height: 50,
            textAlign: Titanium.UI.TEXT_ALIGNMENT_CENTER
        },

        CharacterText: {
            height: platformHeight * 0.4,
            bottom: 0,
            backgroundColor: '#EFEFEF',
            color: '#333333',
            textAlign: Titanium.UI.TEXT_ALIGNMENT_LEFT,
            touchEnabled: false,
            focusable: false
        },

        stretch: {
            top: 0,
            bottom: 0,
            left: 0,
            right: 0
        },
        
        fullscreen: {
            width: platformWidth,
            height: platformHeight
        }
    };
}());

//global shortcut for UI properties, since these get used A LOT. polluting the global
//namespace, but for a good cause (saving keystrokes)
var $$ = st.ui.properties;
