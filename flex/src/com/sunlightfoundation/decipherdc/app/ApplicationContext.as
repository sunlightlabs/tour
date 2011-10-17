package com.sunlightfoundation.decipherdc.app
{
    import com.sunlightfoundation.decipherdc.controller.InitializeGameCommand;
    import com.sunlightfoundation.decipherdc.controller.bootstrap.BootstrapAppStartup;
    import com.sunlightfoundation.decipherdc.view.*;
    
    import org.robotlegs.base.CommandMap;
    import org.robotlegs.base.ContextEvent;
    import org.robotlegs.mvcs.Context;
    
    import spark.components.Application;
    
    public class ApplicationContext extends Context
    {
        
        override public function startup():void
        {
			mediatorMap.mapView(DecipherDC, ApplicationMediator);
			mediatorMap.createMediator(contextView);
			
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, BootstrapAppStartup, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, InitializeGameCommand, ContextEvent, true);
            
			mediatorMap.mapView(CharacterView, CharacterViewMediator);
			mediatorMap.mapView(QuizView, QuizViewMediator);
            
           super.startup();
        }
    }
}