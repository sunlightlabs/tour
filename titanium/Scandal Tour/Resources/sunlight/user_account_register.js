(function(){

    var win = Titanium.UI.currentWindow;       

    Titanium.include('../sunlight/config.js');    

    Titanium.API.info('running user_account_register.js');

    function RegisterUser() {
        var win = Titanium.UI.currentWindow;                           

        if (win.password_field.value!==win.password_confirm_field.value) {
            Titanium.UI.createAlertDialog({title:'Password Mismatch', message:'The values you entered in the password fields don\'t match.'}).show();
            return;
        }                       
      
        win.actInd.show();  
               
        var xhr = Titanium.Network.createHTTPClient();        
        xhr.onerror = function(e)
        {
            Titanium.UI.createAlertDialog({title:'Error', message:e.error}).show();
            Titanium.API.info('IN ERROR ' + e.error);

            win.actInd.hide();            
            Ti.UI.currentWindow.close(); 
        };
        xhr.setTimeout(20000);
        xhr.onload = function(e)
        {
            // turn off activity indicator            
            win.actInd.hide();
            
            var response = JSON.parse(this.responseText);
            
            if (response.status==='error') {
                Titanium.UI.createAlertDialog({title:'Error', message:response.message}).show();                
            }
            else if (response.status==='success') {
                
                Titanium.UI.currentWindow.SUNLIGHT.SetUser(response.user);
                
                Titanium.UI.createAlertDialog({title:'Account Created', message:response.message}).show();                                
                Ti.UI.currentWindow.close();
            }
        };
        xhr.onsendstream = function(e)
        {
            Titanium.API.info('ONSENDSTREAM - PROGRESS: ' + e.progress);
        };
        // open the client
        xhr.open('POST', 'http://' + CONFIG.server + '/register-user/');

        // send the data
        xhr.send({id_hash: Titanium.UI.currentWindow.SUNLIGHT.Hash(''), password_hash: Titanium.UI.currentWindow.SUNLIGHT.Hash(password_field.value), email: Titanium.UI.currentWindow.email_field.value, name: Titanium.UI.currentWindow.name_field.value});        
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
    Titanium.UI.currentWindow.name_field = name_field;
    containing_view.add(name_field);

    // email          
    var email_field = Titanium.UI.createTextField({
    	color:'#336699',
    	left:10,
    	height: 30,
    	width:300,
    	clearOnEdit: true,        
    	hintText:'Email',	
    	keyboardType: Titanium.UI.KEYBOARD_EMAIL,
    	autocapitalization: Titanium.UI.TEXT_AUTOCAPITALIZATION_NONE,
    	keyboardType:Titanium.UI.KEYBOARD_DEFAULT,
    	returnKeyType:Titanium.UI.RETURNKEY_DEFAULT,
    	borderStyle:Titanium.UI.INPUT_BORDERSTYLE_ROUNDED
    });
    email_field.addEventListener('return', function()
    {
    	email_field.blur();
    });
    Titanium.UI.currentWindow.email_field = email_field;
    containing_view.add(email_field);

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
    Titanium.UI.currentWindow.password_field = password_field;
    containing_view.add(password_field);

    // password
    var password_confirm_field = Titanium.UI.createTextField({
    	color:'#336699',
    	left:10,
    	autocapitalization: Titanium.UI.TEXT_AUTOCAPITALIZATION_NONE,
    	top:20,        	
    	height: 30,
    	width:300,
    	hintText:'Confirm Password',
    	passwordMask: true,
    	clearOnEdit: true,        	
    	keyboardType:Titanium.UI.KEYBOARD_DEFAULT,
    	returnKeyType:Titanium.UI.RETURNKEY_DEFAULT,
    	borderStyle:Titanium.UI.INPUT_BORDERSTYLE_ROUNDED
    });
    password_confirm_field.addEventListener('return', function()
    {
    	password_confirm_field.blur();
    });
    Titanium.UI.currentWindow.password_confirm_field = password_confirm_field;
    containing_view.add(password_confirm_field);

    // register button
    var register_button = Titanium.UI.createButton({height:40, width: 200, top: 20, title: 'Create Account' });        
    register_button.addEventListener('click', function(){
        RegisterUser();
    });
    containing_view.add(register_button);


    var actInd = Titanium.UI.createActivityIndicator({ 
        style: Ti.UI.iPhone.ActivityIndicatorStyle.BIG
    });
    containing_view.add(actInd);        
    Titanium.UI.currentWindow.actInd = actInd;

    Titanium.UI.currentWindow.add(containing_view);
    
})();