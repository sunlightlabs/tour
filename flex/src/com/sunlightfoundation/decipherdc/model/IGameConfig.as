package com.sunlightfoundation.decipherdc.model
{
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	
	public interface IGameConfig
	{
		function get loaded():Boolean;
		
		function get sourceCharacters():Vector.<Character>;
		
		function get editorCharacter():Character;
		
	}
}