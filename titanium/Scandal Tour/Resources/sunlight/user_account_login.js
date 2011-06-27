(function(){

    function RegisterUser(username, password) {
                       
        var win = Titanium.UI.currentWindow;
           
        var xhr = Titanium.Network.createHTTPClient();        
        xhr.onerror = function(e)
        {
            Titanium.UI.createAlertDialog({title:'Error', message:e.error}).show();
            Titanium.API.info('IN ERROR ' + e.error);
            win.ind_container.hide();           
        };
        xhr.setTimeout(20000);
        xhr.onload = function(e)
        {
            Titanium.UI.createAlertDialog({title:'Success', message:'Thanks! Your photo has been uploaded.'}).show();
            Titanium.API.info('IN ONLOAD ' + this.status + ' readyState ' + this.readyState);
            win.ind_container.hide();
        };
        xhr.onsendstream = function(e)
        {
            Titanium.API.info('ONSENDSTREAM - PROGRESS: ' + e.progress);
        };
        // open the client
        xhr.open('POST', 'http://' + CONFIG.server + '/verify-user/');

        // send the data
        xhr.send({file:image, filename:filename, password:'sanford1000', message:'check me out'});        
    }

    var containing_view = Titanium.UI.createView({height:'auto', top: 10, left: 0, layout:'vertical', backgroundColor:'#fff'});            

    // name          
    var name_field = Titanium.UI.createTextField({
    	color:'#336699',
    	left:10,
    	height: 30,
    	width:300,
    	clearOnEdit: true,        
    	hintText:'Username',	
    	autocapitalization: Titanium.UI.TEXT_AUTOCAPITALIZATION_NONE,
    	keyboardType:Titanium.UI.KEYBOARD_DEFAULT,
    	returnKeyType:Titanium.UI.RETURNKEY_DEFAULT,
    	borderStyle:Titanium.UI.INPUT_BORDERSTYLE_ROUNDED
    });
    name_field.addEventListener('return', function()
    {
    	name_field.blur();
    });
    containing_view.add(name_field);


    // password
    var password_field = Titanium.UI.createTextField({
    	color:'#336699',
    	left:10,
    	autocapitalization: Titanium.UI.TEXT_AUTOCAPITALIZATION_NONE,
    	top:20,        	
    	height: 30,
    	width:300,
    	hintText:'Password',
    	passwordMask: true,
    	clearOnEdit: true,        	
    	keyboardType:Titanium.UI.KEYBOARD_DEFAULT,
    	returnKeyType:Titanium.UI.RETURNKEY_DEFAULT,
    	borderStyle:Titanium.UI.INPUT_BORDERSTYLE_ROUNDED
    });
    password_field.addEventListener('return', function()
    {
    	password_field.blur();
    });
    containing_view.add(password_field);    


    // login button
    var login_button = Titanium.UI.createButton({height:40, width: 200, top: 20, title: 'Login' });        
    login_button.addEventListener('click', function(){
        Ti.UI.currentWindow.close();
    });
    containing_view.add(login_button);


    Titanium.UI.currentWindow.add(containing_view);
    
})();