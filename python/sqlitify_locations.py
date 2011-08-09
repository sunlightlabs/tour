import json, csv, sys, sqlite3

conn = sqlite3.connect('./scandal_tour.sqlite3')
cursor = conn.cursor()

cursor.execute('CREATE TABLE IF NOT EXISTS locations (id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT, address TEXT, link TEXT, latitude DECIMAL, longitude DECIMAL, has_visited BOOLEAN)')
cursor.execute('DELETE FROM locations')

jdata = json.load(open(sys.argv[1], 'r'))

# reader = csv.reader(open(sys.argv[1], 'r'))
# FIELDS = ('Tip','Place','Address','Scandal','Link','Lat','Lon','Hash')
out = []

# for row in reader:
#     obj = {}
#     for (i,f) in enumerate(row):
#         obj[FIELDS[i].lower()] = f.strip()
#     out.append(obj)
    
out_dict = {}
for obj in jdata:
    print 'inserting row'
    cursor.execute('INSERT INTO locations (description, address, link, latitude, longitude, has_visited) VALUES (?,?,?,?,?, 0)', (obj['tip'],obj['address'],obj['link'],obj['latitude'],obj['longitude']))

conn.commit()
cursor.close()