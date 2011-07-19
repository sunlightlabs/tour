/**
 * Window to view details for a Scandal Annotation
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.ui.createScandalDetailsWindow = function(_args) {
        Ti.API.log('createScandalDetailsWindow', 'annotation.data: ' + JSON.stringify(_args.annotation.data));
        var scandal = _args.annotation.data;
        var annotationWindow = Ti.UI.createWindow({
            // modal: true,
            title: scandal.title,
            backgroundColor: '#FFF',
            navBarHidden: true,
            scandal: scandal,
            scandal_hash: scandal.hash
        });
        
        var tipLabel = Ti.UI.createLabel({
            editable: false,
            text: scandal.tip,
            width: 'auto',
            height: 'auto',
            top: 100,
            backgroundColor: '#FFF',
            color: '#333'
            
        });
        
        var backButton = Ti.UI.createButton({
            title: 'Back',
            bottom: 10,
            width: 100,
            height: 40
        });
        backButton.addEventListener('click', function(e) {
            if (e.source === backButton) annotationWindow.close();
        });
        
        
        annotationWindow.add(tipLabel);
        annotationWindow.add(backButton);
        
        return annotationWindow;
    };
}());