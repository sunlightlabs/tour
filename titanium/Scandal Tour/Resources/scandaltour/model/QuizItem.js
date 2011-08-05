/**
 * QuizItem describes a Question related Answers as a single unit
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.model.QuizItem = new joli.model({
        table: 'quizitems',
        columns: {
            id:                 'INTEGER PRIMARY KEY AUTOINCREMENT',
            question:           'TEXT',
            answer:             'TEXT',
            distractors:        'TEXT' //  unlimited number of distractors stored as JSON
        },
        objectMethods: {
            setDistractors: function(distractors) {
                var json_str = JSON.stringify(distractors);
                this.distractors = json_str;
            },
            getDistractors: function() {
                var result = JSON.parse(this.distractors);
                Ti.API.log('QuizItem', 'distractors: ' + this.distractors);
                Ti.API.log('QuizItem', 'result: ' + result);
                return result;
            },
            getAnswers: function() {
                answers = [this.question];
                distractorArray = JSON.parse(this.distractors);
                // st.control.shuffle
                return answers;
            }
        }
    });
}());