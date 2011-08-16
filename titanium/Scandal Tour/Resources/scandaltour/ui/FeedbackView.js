/**
 * View for feeback on quiz responses, etc.
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.ui.createFeedbackView = function(_args) {
        var view = st.ui.createLightBox(_args||{});
        
        var feedbackText = _args.feedbackText||null;
        
        if (feedbackText !== null) {
            var feedbackLabel = Ti.UI.createLabel(st.combine($$.Feedback.Label, {
                text: feedbackText
            }));
            view.content.add(feedbackLabel);
        }
        view.addEventListener('click', function() {
            st.ui.hideView(view);
        });
        
        return view;
    };
}());