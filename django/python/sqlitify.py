import json, csv, sys, sqlite3

conn = sqlite3.connect('./scandal_tour.sqlite3')
cursor = conn.cursor()

cursor.execute('CREATE TABLE IF NOT EXISTS Scandal (id INTEGER PRIMARY KEY, json TEXT)')
cursor.execute('DELETE FROM Scandal')

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
    cursor.execute('INSERT INTO Scandal (json) VALUES (?)', (json.dumps(obj),))

conn.commit()
cursor.close()