(function() {

    Titanium.include('../sunlight/config.js');

    function ForgetUser() {
        var u = Titanium.UI.currentWindow.SUNLIGHT.GetUser();
        u.user_id = 0;
        Titanium.UI.currentWindow.SUNLIGHT.SetUser(u);
    }

    var win = Titanium.UI.currentWindow;

    Titanium.UI.setBackgroundColor('#fff');

    function SetupWindow() {
            
        // if the window's already been set up, pull it apart
        if (Titanium.UI.currentWindow.containing_view!==undefined)
            Titanium.UI.currentWindow.remove(Titanium.UI.currentWindow.containing_view);
      
        // no user! force them to login or create an account
        if (!Titanium.UI.currentWindow.SUNLIGHT.UserExists()) {

            var containing_view = Titanium.UI.createView({height:'auto', top: 10, left: 0, layout:'vertical', backgroundColor:'#fff'});        

            // login button
            var login_button = Titanium.UI.createButton({ height:40, width: 200, title: 'Login' });
            login_button.addEventListener('click', function(){
                var login_window = Titanium.UI.createWindow({backgroundColor: '#fff', url: '../sunlight/user_account_login.js', SUNLIGHT: Titanium.UI.currentWindow.SUNLIGHT})
            	login_window.open({modal:true,modalTransitionStyle:Ti.UI.iPhone.MODAL_TRANSITION_STYLE_COVER_VERTICAL,modalStyle:Ti.UI.iPhone.MODAL_PRESENTATION_FULLSCREEN,navBarHidden:true});
            });
            containing_view.add(login_button);


            // register button
            var register_button = Titanium.UI.createButton({height:40, width: 200, top: 10, title: 'Create Account' });        
            register_button.addEventListener('click', function(){
                var register_window = Titanium.UI.createWindow({backgroundColor: '#fff', url: '../sunlight/user_account_register.js', SUNLIGHT: Titanium.UI.currentWindow.SUNLIGHT})
            	register_window.open({modal:true,modalTransitionStyle:Ti.UI.iPhone.MODAL_TRANSITION_STYLE_COVER_VERTICAL,modalStyle:Ti.UI.iPhone.MODAL_PRESENTATION_FULLSCREEN,navBarHidden:true});
            });
            containing_view.add(register_button);

            Titanium.UI.currentWindow.add(containing_view);
            Titanium.UI.currentWindow.containing_view = containing_view;        
        }
        
        // else user exists, display points
        else {
            var containing_view = Titanium.UI.createView({height:'auto', top: 10, left: 0, layout:'vertical', backgroundColor:'#fff'});        
            
            var win = Titanium.UI.currentWindow;                            

            var xhr = Titanium.Network.createHTTPClient();        
            xhr.onerror = function(e)
            {
                Titanium.UI.createAlertDialog({title:'Error', message:e.error}).show();
                Titanium.API.info('IN ERROR ' + e.error);
            };
            xhr.setTimeout(20000);
            xhr.onload = function(e)
            {        
                var response = JSON.parse(this.responseText);

                if (response.status==='error') {
                    Titanium.UI.createAlertDialog({title:'Error', message:response.message}).show();                                    
                }
                else if (response.status==='success') {
                    if (!response.found) {
                        ForgetUser();
                        SetupWindow();
                    }
                    else {
                        Titanium.UI.currentWindow.SUNLIGHT.SetUser(response.user);
                        var points_label = Titanium.UI.createLabel({ text: response.user.points + " points"});
                        containing_view.add(points_label);
                        
                        // logout button
                        var logout_button = Titanium.UI.createButton({height:40, width: 200, top: 10, title: 'Logout' });        
                        logout_button.addEventListener('click', function(){
                            ForgetUser();
                            SetupWindow();       
                        });
                        containing_view.add(logout_button);                        

                        Titanium.UI.currentWindow.add(containing_view);
                        Titanium.UI.currentWindow.containing_view = containing_view;                        
                    }
                }
            };
            xhr.onsendstream = function(e)
            {
                Titanium.API.info('ONSENDSTREAM - PROGRESS: ' + e.progress);
            };
            // open the client
            xhr.open('GET', 'http://' + CONFIG.server + '/validate-user/?password_hash=123&id_hash=abc');

            // send the data
            var user = Titanium.UI.currentWindow.SUNLIGHT.GetUser();
            xhr.send({id_hash: user.id_hash, password_hash: user.password_hash});
        }    
    }
    
    Titanium.UI.currentWindow.addEventListener('focus', function(){ SetupWindow(); });


        
})();