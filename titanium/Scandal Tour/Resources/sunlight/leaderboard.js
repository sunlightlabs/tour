(function() {

    var win = Titanium.UI.currentWindow;

    var leaderboard_label = Titanium.UI.createLabel({
    	color:'#999',
    	text:'Leaderboard goes here',
    	font:{fontSize:20,fontFamily:'Helvetica Neue'},
    	textAlign:'center',
    	width:'auto'
    });
    
    win.add(leaderboard_label);
        
})();