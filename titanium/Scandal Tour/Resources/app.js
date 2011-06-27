// this sets the background color of the master UIView (when there are no windows/tab groups on it)
Titanium.UI.setBackgroundColor('#000');

Titanium.include('sunlight/sha1.js');
Titanium.include('sunlight/config.js');

var db = Ti.Database.install('./scandal_tour.sqlite3','scandal_tour');  

// load scandals
var rows = db.execute('SELECT * FROM scandals');
scandals = {}
while (rows.isValidRow()) {  
    scandals[rows.fieldByName('hash')] = {
      tip: rows.fieldByName('tip'),
      place: rows.fieldByName('place'),
      hash: rows.fieldByName('hash'),
      address: rows.fieldByName('address'),
      lat: rows.fieldByName('lat'),
      lon: rows.fieldByName('lon'),
      link: rows.fieldByName('link'),
      scandal: rows.fieldByName('scandal'),
      image: rows.fieldByName('image'),
      visited: false,
    };
    rows.next();  
};

// load visited
rows = db.execute("SELECT * FROM actions WHERE action_type='visit'");
while (rows.isValidRow()) {
    var sh = rows.fieldByName('scandal_hash');
    if (scandals[sh]!==undefined) {
        scandals[sh].visited = true;
    }
    rows.next();
}
db.close();

// sunlight global object
Titanium.include('sunlight/sunlight_functions.js');


// create tab group
var tabGroup = Titanium.UI.createTabGroup();

var map_win = Titanium.UI.createWindow({
    url:'sunlight/map.js',
    titleid:'map_win_title',
    title: 'Map',
    navBarHidden: true,
    SUNLIGHT: SUNLIGHT,
});
var map_tab = Titanium.UI.createTab({  
    icon: 'images/icons/103-map.png',
    title:'Map',
    window: map_win
});


//
// create account tab
//
var user_win = Titanium.UI.createWindow({  
    title:'Account',
    url:'sunlight/user_account.js',    
    backgroundColor:'#fff',
    SUNLIGHT: SUNLIGHT
});
var user_tab = Titanium.UI.createTab({  
    icon:'images/icons/111-user.png',
    title:'Account',
    window: user_win
});


//
// create leaderboard tab
//
var leaderboard_win = Titanium.UI.createWindow({  
    title:'Leaderboard',
    url:'sunlight/leaderboard.js',
    backgroundColor:'#fff',
    SUNLIGHT: SUNLIGHT
});
var leaderboard_tab = Titanium.UI.createTab({  
    icon:'images/icons/139-flags.png',
    title:'Leaderboard',
    window:leaderboard_win
});


//
//  add tabs
//
tabGroup.addTab(map_tab);  
tabGroup.addTab(user_tab);  
tabGroup.addTab(leaderboard_tab);  

if(SUNLIGHT.UserExists()) {
    tabGroup.setActiveTab(map_tab);
}
else {
    tabGroup.setActiveTab(user_tab);
}

// open tab group
tabGroup.open();
