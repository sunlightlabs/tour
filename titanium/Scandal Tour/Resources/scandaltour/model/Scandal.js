/**
 * Scandal model
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.model.Scandal = function(_opts) {
        var that = new st.model.Entity('Scandal');
        
        st.mixin(that, _opts);
        
        return that;
    };
}());