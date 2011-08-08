/**
 * QuizItem describes a Question related Answers as a single unit
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.models.QuizItem = new joli.model({
        table: 'quizitems',
        columns: {
            id:                 'INTEGER PRIMARY KEY AUTOINCREMENT',
            question:           'TEXT',
            answer:             'TEXT',
            distractors:        'TEXT' //  unlimited number of distractors stored as JSON
        },
        methods: {
            getShuffledQuiz: function() {
                var quizItems = st.models.QuizItem.all();
                quizItems = st.control.shuffle(quizItems);
                return quizItems;
            }
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
            getChoices: function() {
                var dists = this.distractors ? this.distractors : '[]';
                var choices = JSON.parse(dists);
                choices.push(this.answer);
                choices = st.control.shuffle(choices);
                return choices;
            }
        }
    });
}());