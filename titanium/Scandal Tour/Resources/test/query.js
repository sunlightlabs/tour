(function() {
    describe('queries', function() {
        it('categories should be culled from locations', function() {
            var q = new joli.query().select('distinct category').from('locations').where('category <> "NULL"');
            expect(q.getQuery()).toBe('select distinct category from locations where category <> "NULL"');
            var results = q.execute();
            var categories = [];
            joli.each(results, function(item, key) {
                categories.push(item.category);
                Ti.API.log('queries categories item.category', item.category);
                Ti.API.log('queries categories key', key);
            });
            Ti.API.log('queries categories', categories);
            expect(categories.length).not.toBe(0);
        });
        
        it('there should be source, reward, and task type locations', function() {
            var q = new joli.query().select().from('locations').where('type = ?', 'source');
            var sources = q.execute();
            expect(sources.length).not.toBe(0);
        });
    });
}());