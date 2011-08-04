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
                var borderWidth = $$.Button.borderWidth !== 'undefined' ? $$.Button.borderWidth : 0;
                var btnWidth = Math.floor(view.width/numBtns);
                for (var i=0; i < numBtns; i++) {
                    Ti.API.log('st.ui.createButtonBar', 'view.width should be: ' + view.width);
                    Ti.API.log('st.ui.createButtonBar', 'button.width should be: ' + btnWidth);
                    var btn = Ti.UI.createButton(st.combine($$.Button, {
                        title: _args.labels[i],
                        width: btnWidth
                    }));
                    btn.left = i*btnWidth;
                    view.add(btn);
                }
                return view;
            }
        });
        return bar;
    };
    
    st.ui.createToolBar = function(_args) {
        return Ti.UI.createView(st.combine($$.ToolBar, _args));
    };
    
    st.ui.createSpinner = function(_args) {
        var opts = st.combine(st.combine($$.Spinner, _args),{bottom: 0});
        var picker = Ti.UI.createPicker(opts);
        var pickerColumn = Ti.UI.createPickerColumn(st.combine($$.SpinnerColumn, {width: $$.Spinner.width}));
        Ti.API.log('createSpinner', 'opts: ' + JSON.stringify(opts));
        var items = _args.items;
        var rows = [];
        for (var i=0; i < items.length; i++) {
            rows[i] = Ti.UI.createPickerRow(st.combine($$.SpinnerRow, {title: String(items[i])}));
        }
        pickerColumn.rows = rows;
        picker.add(pickerColumn);
        picker.setSelectedRow(0,0, false);
        return picker;
    };
})();

Ti.include(
    '/scandaltour/ui/styles.js',
    '/scandaltour/ui/ApplicationWindow.js',
    '/scandaltour/ui/ScandalDetailsWindow.js',
    '/scandaltour/ui/MapView.js'
);

