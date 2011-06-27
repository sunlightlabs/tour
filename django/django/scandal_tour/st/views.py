from django.http import HttpResponse, HttpResponseBadRequest
from st.models import *
import datetime, json, re
from settings import *
from hashlib import sha1

def _sanitize_input(i):
    RE_SAFE = re.compile(r'[^\w]')
    new_i = RE_SAFE.sub('', i).strip()
    return ((new_i==i), new_i)

def post_photo(request):
    """ Collect an uploaded photo """
    
    if request.POST.has_key('user_id') and request.POST.has_key('filename') and request.FILES.has_key('file'):

        destination = open('%s/uploads/%s.jpg' % (MEDIA_ROOT, request.POST.get('filename', 'unnamed')), 'wb+')
        
        for chunk in request.FILES['file'].chunks():
            destination.write(chunk)
        destination.close()
        
        return HttpResponse(json.dumps({'status': 'success'}), mimetype='text/javascript')

    return HttpResponseBadRequest(json.dumps({'status': 'error', 'message': 'Missing required form fields.'}), mimetype='text/javascript')    


def register_user(request):
    """ Create a new user record """

    # check for input's presence 
    REQUIRED_FIELDS = ('id_hash', 'email', 'name', 'password_hash',)
    missing_fields = []
    for r in REQUIRED_FIELDS:
        if r not in request.POST.keys():
            missing_fields.append(r)
    if len(missing_fields)>0:
        return HttpResponseBadRequest(json.dumps({'status': 'error', 'message': 'Missing required fields: %s.' % (', '.join(missing_fields))}), mimetype='text/javascript')

    # sanitize
    (unchanged1, id_hash) = _sanitize_input(request.POST['id_hash'])
    (unchanged2, name) = _sanitize_input(request.POST['name'])
    (unchanged3, password_hash) = _sanitize_input(request.POST['password_hash'])
    if not (unchanged1 and unchanged2 and unchanged3):
        return HttpResponseBadRequest(json.dumps({'status': 'error', 'message': 'Please only use alphanumeric characters.' % (', '.join(missing_fields))}), mimetype='text/javascript')
    
    # check for duplicate names
    if User.objects.filter(name=name).count()>0:
        return HttpResponse(json.dumps({'status': 'error', 'message': 'A user with that name already exists.'}), mimetype='text/javascript')

    # make the record
    user = User(name=name, id_hash=id_hash, password_hash=password_hash)
    user.save()

    return HttpResponse(json.dumps({'status': 'success', 'message': 'Thanks for registering!', 'user': user.to_dict()}), mimetype='text/javascript')
    
            
def validate_user(request):
    # check for input
    REQUIRED_FIELDS = ('user_id', 'password_hash',)
    missing_fields = []
    for r in REQUIRED_FIELDS:
        if r not in request.GET.keys():
            missing_fields.append(r)
    if len(missing_fields)>0:
        return HttpResponseBadRequest(json.dumps({'status': 'error', 'message': 'Missing required fields: %s.' % (', '.join(missing_fields))}), mimetype='text/javascript')

    # sanitize
    try:
        password_hash = _sanitize_input(request.GET['password_hash'])
        user_id = _sanitize_input(request.GET['user_id'])
    except Exception, e:
        return HttpResponseBadRequest(json.dumps({'status': 'error', 'message': 'Malformed input. Stop fuzzing me.'}), mimetype='text/javascript')
       
    # locate user
    matching_users = User.objects.filter(id=user_id, password_hash=password_hash)
    if matching_users.count()==0:
        return HttpResponse(json.dumps({'status': 'success', 'message': 'User not found.', 'user': None, 'found': False}), mimetype='text/javascript')
    else:
        return HttpResponse(json.dumps({'status': 'success', 'message': 'User found.', 'user': matching_users[0].to_dict(), 'found': True}), mimetype='text/javascript')

# TODO:
# 
# update-check
#

# get-points
# register-user
# register-action
# 
# get-photos
# post-photo

# 
# get-comments
# post-comment
# 
# leaderboard
# 
# index