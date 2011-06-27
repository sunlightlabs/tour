import json, csv, sys, sqlite3

conn = sqlite3.connect('./scandal_tour.sqlite3')
cursor = conn.cursor()

cursor.execute('DELETE FROM scandals')
cursor.execute('DELETE FROM actions')

reader = csv.reader(open(sys.argv[1], 'r'))
FIELDS = ('Tip','Place','Address','Scandal','Link','Lat','Lon','Hash')
out = []

for row in reader:
    obj = {}
    for (i,f) in enumerate(row):
        obj[FIELDS[i].lower()] = f.strip()
    out.append(obj)
    
out_dict = {}
for row in out:
    print 'inserting row'
    cursor.execute('INSERT INTO scandals (tip, place, hash, address, scandal, link, lat, lon) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', (row['tip'], row['place'], row['hash'], row['address'], row['scandal'], row['link'], row['lat'], row['lon']))

conn.commit()
cursor.close()