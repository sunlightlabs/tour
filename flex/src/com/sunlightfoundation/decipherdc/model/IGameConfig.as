package com.sunlightfoundation.decipherdc.model
{
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	import com.sunlightfoundation.decipherdc.model.vo.CharacterState;
	
	import mx.collections.ArrayCollection;
	
	public interface IGameConfig
	{
		function get loaded():Boolean;
		
		function get sourceCharacters():ArrayCollection;
		
		function get editorCharacter():Character;

		function editorCharacterState(state:String):CharacterState;

		function sourceCharacterState(state:String):CharacterState;
		
	}
}