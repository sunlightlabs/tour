(function() {
    describe('queries', function() {
        it('categories should be culled from locations', function() {
            var q = new joli.query().select('location.category').from('location').where('type = ?', 'task');
            expect(q.getQuery()).toBe('select location.category from location where type = "task"');
        });
    });
}());