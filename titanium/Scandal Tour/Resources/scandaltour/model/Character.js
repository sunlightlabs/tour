/**
 * Character defines a non-playable character in the game
 * @author dcloud
 * @version $Rev$
 */

(function () {
    st.models.Character = function(_args) {
        function generateCharacter (_args) {
            this.characterImage = _args.characterImage;
            this.characterName = _args.characterName;
            this.role = _args.role;
            this.dialogue = _args.dialogue;
        }
        return new generateCharacter(_args);
    };
    
}());