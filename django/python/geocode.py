from geopy import geocoders  
import csv, sys, hashlib

max_row_length = 0
f = open(sys.argv[1], 'r')
reader = csv.reader(f)
for row in reader:
    max_row_length = max(max_row_length, len(row))
f.close()

writer = csv.writer(sys.stdout)
reader = csv.reader(open(sys.argv[1], 'r'))
reader.next()

us = geocoders.Google()  

for row in reader:
    try:
        result = us.geocode(row[2])  
    except:
        continue
        
    if result is not None:
        place, (lat, lng) = result
        while len(row)<max_row_length:
            row.append('')
        row.append(lat)
        row.append(lng)
        row.append(hashlib.md5("%s%s" % (lat, lng)).hexdigest())
        writer.writerow(row)
