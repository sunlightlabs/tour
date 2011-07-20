/**
 * UI namespace for building views. Most views will be in their own files but included here
 * @author dcloud
 * @version $Rev$
 */
(function () {
    st.ui = {};
    
    //shorthand for alert dialog
    st.ui.alert = function(/*String*/ _title, /*String*/ _message) {
        Ti.UI.createAlertDialog({
            title:_title, 
            message:_message,
            buttonNames: ['Okay']
        }).show();
    };
    
    st.ui.createButtonBar = function(_args) {
        var bar = st.os({
            iphone: function() {
                var buttonBar = Ti.UI.createButtonBar(st.combine($$.ButtonBar, _args));
                return buttonBar;
            },
            android: function() {
                var view = Ti.UI.createView(st.combine($$.ButtonBar, _args));
                var numBtns = _args.labels.length;
                for (var i=0; i < numBtns; i++) {
                    Ti.API.log('st.ui.createButtonBar', 'view.width should be: ' + view.width);

                    Ti.API.log('st.ui.createButtonBar', 'button.width should be: ' + (view.width/numBtns));
                    var btn = Ti.UI.createButton(st.combine($$.Button, {
                        title: _args.labels[i],
                        width: view.width/numBtns
                    }));
                    btn.left = i*btn.width + 1;
                    view.add(btn);
                }
                return view;
            }
        });
        return bar;
    };
    
    st.ui.createSpinner = function(_args) {
        var picker = Ti.UI.createPicker(st.combine($$.Spinner, {bottom: 0, width: $$.platformWidth}));
        var items = _args.items;
        var rows = [];
        for (var i=0; i < items.length; i++) {
            rows[i] = Ti.UI.createPickerRow({title: String(items[i])});
            picker.add(rows[i]);
        }
        return picker;
    };
})();

Ti.include(
    '/scandaltour/ui/styles.js',
    '/scandaltour/ui/ApplicationWindow.js',
    '/scandaltour/ui/ScandalDetailsWindow.js',
    '/scandaltour/ui/MapView.js'
);

