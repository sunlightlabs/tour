from django.db import models
from hashlib import sha1
from settings import *

class User(models.Model):
    """A user of the Scandal Tour app"""
    
    class Admin:
        list_display = ('',)
        search_fields = ('',)

    def __str__(self):
        return self.name
        
    def hash_against_id(self, s):
        return sha1("%s%s%s" % (self.id_hash, SECRET_KEY, s)).hexdigest()
        
    def to_dict(self):
        return {'name': self.name, 'id_hash': self.id_hash, 'password_hash': self.password_hash, 'points': self.points, 'user_id': self.id}
        
    name = models.CharField("Name", blank=False, max_length=100, db_index=True)
    email = models.EmailField("Email", blank=False)
    id_hash = models.CharField("Device ID Hash", blank=True, max_length=100, db_index=True)
    password_hash = models.CharField("Password", blank=True, max_length=100, db_index=True)
    points = models.IntegerField("Points", blank=False, null=True, default=0)

class Scandal(models.Model):
    """An incident in the Scandal Tour app"""
    
    class Admin:
        list_display = ('',)
        search_fields = ('',)

    def __str__(self):
        return self.place

    tip = models.CharField(blank=True, max_length=100)
    place = models.CharField(blank=True, max_length=100)
    scandal_hash = models.CharField(blank=True, max_length=100, db_index=True)
    address = models.CharField(blank=True, max_length=100)
    scandal = models.CharField(blank=True, max_length=100)
    link = models.URLField(blank=True, verify_exists=True)
    lat = models.DecimalField(max_digits=9, decimal_places=7)
    lon = models.DecimalField(max_digits=9, decimal_places=7)
    adult = models.BooleanField(default=False)
    updated = models.DateTimeField(blank=True, auto_now=True)


class Action(models.Model):
    """An action performed by a user"""    
    user = models.ForeignKey(User)
    scandal = models.ForeignKey(Scandal)
    date = models.DateTimeField(blank=True, auto_now_add=True)
    points = models.IntegerField(blank=True, null=True, default=0)
    
    
class Checkin(Action):
    """A checkin from a user about a scandal site"""

    class Admin:
        list_display = ('',)
        search_fields = ('',)

    def __str__(self):
        return "Checkin"

    def save(self, *args, **kwargs):
        self.points = POINTS['checkin']
        super(Checkin, self).save(*args, **kwargs)

    lat = models.DecimalField(max_digits=9, decimal_places=7)
    lon = models.DecimalField(max_digits=9, decimal_places=7)

    
class Comment(Action):
    """A comment posted by a user about a scandal site"""
    
    class Admin:
        list_display = ('',)
        search_fields = ('',)

    def __str__(self):
        return "Comment"

    def save(self, *args, **kwargs):
        self.points = POINTS['comment']
        super(Comment, self).save(*args, **kwargs) # Call the "real" save() method.
        
    comment = models.TextField(blank=False)

    
class Photo(Action):
    """A photo from an event site"""    

    class Admin:
        list_display = ('',)
        search_fields = ('',)

    def __str__(self):
        return "Photo %d" % self.id

    def save(self, *args, **kwargs):
        self.points = POINTS['photo']
        super(Photo, self).save(*args, **kwargs) # Call the "real" save() method.

    photo = models.ImageField("Photo", upload_to="photos", height_field='height', width_field='width')
    width = models.IntegerField(blank=True, null=True)
    height = models.IntegerField(blank=True, null=True)
    

    
