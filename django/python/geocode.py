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
    
    numcol = 5 if len(row) >= 5 else len(row)
    
    newrow = [row[r] for r in range(numcol)]
    for r in range(5-numcol):
        newrow.append('null')
        
    if result is not None:
        place, (lat, lng) = result
        # while len(row)<max_row_length:
        #     row.append('')
        newrow.append(lat)
        newrow.append(lng)
        newrow.append(hashlib.md5("%s%s" % (lat, lng)).hexdigest())
        writer.writerow(newrow)
