/**
 * Defines the qv for a quiz question
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.ui.createQuizView = function(_args) {
        var qv = st.ui.createLightBox(_args||{});
        var q = _args.question||'';
        var answers = _args.answers||null;
        
        var qLabel = Ti.UI.createLabel(st.combine($$.QuizQuestion, {
            text: q
        }));
        qv.content.layout = 'vertical';
        qv.content.add(qLabel);
        
        function answerClick (e) {
            Ti.API.log('QuizView click e.source', e.source);
            Ti.API.log('QuizView click e.type', e.type);
            Ti.App.fireEvent('st.ui.QuizView:QuizGuess', {guess: e.source.text});
        }
        
        for (var i=0; i < answers.length; i++) {
            var aButton = Ti.UI.createView(st.combine($$.QuizAnswer.Button, {
                top: $$.QuizAnswer.Button.spacer
            }));
            var aLabel = Ti.UI.createLabel(st.combine($$.QuizAnswer.Label, {
                text: answers[i]
            }));
            aButton.add(aLabel);
            aLabel.addEventListener('click', answerClick);
            qv.content.add(aButton);
        }
                
        return qv;
    };
}());