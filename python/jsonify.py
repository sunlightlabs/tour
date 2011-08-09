import json, csv, sys

reader = csv.reader(open(sys.argv[1], 'r'))
FIELDS = ('Tip','Place','Address','Scandal','Link','Lat','Lon','Hash')
out = []

for row in reader:
    obj = {}
    for (i,f) in enumerate(row):
        obj[FIELDS[i].lower()] = f.strip()
        if FIELDS[i].lower() in ('lat', 'lon'):
            obj[FIELDS[i].lower()] = float(f.strip())
    out.append(obj)
    
# out_dict = {}
# for row in out:
#     out_dict[row['hash']] = row
#     del out_dict[row['hash']]['hash']
    
sys.stdout.write(json.dumps(out))