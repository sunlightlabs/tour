package com.sunlightfoundation.decipherdc.app
{
    import com.sunlightfoundation.decipherdc.controller.*;
    import com.sunlightfoundation.decipherdc.controller.bootstrap.ConfigureDatabaseCommand;
    import com.sunlightfoundation.decipherdc.controller.events.*;
    import com.sunlightfoundation.decipherdc.events.*;
    import com.sunlightfoundation.decipherdc.model.LocationListModel;
    import com.sunlightfoundation.decipherdc.service.*;
    import com.sunlightfoundation.decipherdc.service.events.DatabaseReadyEvent;
    import com.sunlightfoundation.decipherdc.view.*;
    
    import org.robotlegs.base.CommandMap;
    import org.robotlegs.mvcs.Context;
    
    import spark.components.ViewNavigatorApplication;
    
    public class ApplicationContext extends Context
    {
        
        override public function startup():void
        {
			mediatorMap.mapView(DecipherDC, ApplicationMediator);
			mediatorMap.createMediator(contextView);
			
            commandMap.mapEvent(ConfigureDatabaseEvent.CONFIGURE, ConfigureDatabaseCommand);
            commandMap.mapEvent(DatabaseReadyEvent.READY, LoadGameCommand);
			commandMap.mapEvent(LocationsLoadedEvent.LOADED, StartGameCommand);
			//commandMap.mapEvent(CharacterViewEvent.SHOW, ShowCharacterViewCommand, CharacterViewEvent);
            
            injector.mapSingletonOf(ILocationService, SQLLocationService);
            
          	injector.mapSingleton(LocationListModel);
			
			mediatorMap.mapView(CharacterView, CharacterViewMediator);
			mediatorMap.mapView(QuizView, QuizViewMediator);
            
            dispatchEvent(new ConfigureDatabaseEvent());
        }
    }
}