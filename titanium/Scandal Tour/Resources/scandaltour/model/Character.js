/**
 * Character defines a non-playable character in the game
 * @author dcloud
 * @version $Rev$
 */

(function () {
    st.models.Character = function(_options) {
        this.fname = _options.first_name;
        this.lname = _options.last_name;
        this.role = _options.role;
        this.location = _options.location;
    };
    
    st.models.Character.prototype = {
        get name(){
            return this.fname + ' ' + this.lname;
        }
    }
}());