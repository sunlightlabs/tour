/**
 * Defines the view for a quiz question
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.ui.createQuizView = function(_args) {
        var view = st.ui.createLightBox(_args||{});
        var q = _args.question||null;
        var answers = _args.answers||null;
        
        var qLabel = Ti.UI.createLabel(st.combine($$.QuizQuestion, {
            text: q
        }));
        view.content.add(qLabel);
        Ti.API.log('qLabel.height',qLabel.height);
        
        var aOffset = qLabel.height + qLabel.top;
        
        function answerClick (e) {
            Ti.API.log('QuizView click e.source', e.source);
            Ti.API.log('QuizView click e.type', e.type);
            Ti.App.fireEvent('st:QuizGuess', {guess: e.source.text});
        }
        
        for (var i=0; i < answers.length; i++) {
            var aButton = Ti.UI.createView(st.combine($$.QuizAnswer.Button, {
                top: aOffset+ i*$$.QuizAnswer.Button.height + $$.QuizAnswer.Button.spacer*i
            }));
            var aLabel = Ti.UI.createLabel(st.combine($$.QuizAnswer.Label, {
                text: answers[i]
            }));
            aButton.add(aLabel);
            aLabel.addEventListener('click', answerClick);
            view.content.add(aButton);
        }
                
        return view;
    };
}());