#!/usr/bin/env python
# encoding: utf-8
"""
data2sqlite.py

Created by Daniel Cloud on 2011-08-09.
Copyright (c) 2011 Sunlight Labs. All rights reserved.
"""

import sys
import argparse
import time
from csv import DictReader
import sqlite3

from geopy import geocoders

class Usage(Exception):
    def __init__(self, msg):
        self.msg = msg


def main(argv=None):
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('csvfile', type=file, help='csv file to parse')
    parser.add_argument('-t', '--type', choices=['task', 'source', 'reward'], required=True, help='Type reflects how location is used in the game')
    args = parser.parse_args()
    
    gc = geocoders.Google()
    
    conn = sqlite3.connect('./scandal_tour.sqlite3')
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()
    cursor.execute('CREATE TABLE IF NOT EXISTS locations (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, address TEXT, link TEXT, latitude DECIMAL, longitude DECIMAL, type TEXT, category TEXT, has_visited BOOLEAN)')
    
    reader = DictReader(args.csvfile)
    for item in reader:
        if item['Place']:
            geodata = None
            if 'Address' in item:
                try:
                    geodata = gc.geocode(item['Address'])
                except Exception, e:
                    geodata = None
            if geodata is not None:
                place, (latitude, longitude) = geodata
                item['latitude'] = latitude
                item['longitude'] = longitude
            else:
                item['latitude'] = None
                item['longitude'] = None
            item['type'] = args.type
            if 'Category' not in item:
                item['Category'] = None
        
            cells = {
                "name": item['Place'],
                "description": item['Description'],
                "address": item['Address'],
                "link": (item['Link'] if 'Link' in item else None),
                "latitude": item['latitude'],
                "longitude": item['longitude'],
                "type": item['type'],
                "category": item['Category'],
                "has_visited": 0
            }

            existing_record = cursor.execute('SELECT * FROM locations WHERE name=:name AND address=:address', cells).fetchone()
        
            if existing_record:
                print 'Existing record: ', existing_record['name']
                cells['id'] = existing_record['id']
                cursor.execute('UPDATE locations SET name=:name, description=:description, address=:address, link=:link, latitude=:latitude, longitude=:longitude, type=:type, category=:category, has_visited=:has_visited WHERE id=:id', cells)
            else:
                print item, '\n'
                cursor.execute('INSERT INTO locations (name, description, address, link, latitude, longitude, type, category, has_visited) VALUES (:name,:description,:address,:link,:latitude,:longitude,:type,:category, :has_visited)', cells)
            conn.commit()
            time.sleep(0.25)
        
    cursor.close()



if __name__ == "__main__":
    sys.exit(main())
