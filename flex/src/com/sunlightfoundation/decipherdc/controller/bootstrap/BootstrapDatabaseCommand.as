package com.sunlightfoundation.decipherdc.controller.bootstrap
{
	import com.probertson.data.SQLRunner;
	import com.sunlightfoundation.decipherdc.service.events.DatabaseEvent;
	
	import flash.filesystem.File;
	
	import org.robotlegs.mvcs.Command;
	
	public class BootstrapDatabaseCommand extends Command
	{
		private static const DB_FILE_NAME:String = "scandal_tour.sqlite3";
		
		override public function execute():void
		{
			var dbFile:File = File.applicationStorageDirectory.resolvePath(DB_FILE_NAME);
			
			var dbImport:File = File.applicationDirectory.resolvePath("data/"+DB_FILE_NAME);
			
			if(!dbFile.exists){
				trace("DB doesn't exist! Create it!");
				dbImport.copyTo(dbFile);
			}
			var sqlRunner:SQLRunner = new SQLRunner(dbFile);
			
			injector.mapValue(SQLRunner, sqlRunner);
			
			dispatch(new DatabaseEvent(DatabaseEvent.READY));
		}

	}
}