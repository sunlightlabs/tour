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
            setDistractors: function(_distractors) {
                var json_str = JSON.stringify(_distractors);
                this.set('distractors', json_str);
            },
            getDistractors: function() {
                var result = JSON.parse(this.distractors);
                return result;
            },
            getChoices: function() {
                var dists = JSON.parse(this.distractors);
                var choices = dists ? dists : [];
                choices.push(this.answer);
                var result = st.control.shuffle(choices);
                return result;
            }
        }
    });
}());