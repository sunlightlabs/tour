from django.conf.urls.defaults import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^post-photo/$', 'scandal_tour.st.views.post_photo', name='post_photo'),    
    url(r'^register-user/$', 'scandal_tour.st.views.register_user', name='register_user'),
    url(r'^validate-user/$', 'scandal_tour.st.views.validate_user', name='validate_user'),
        
    # url(r'^scandal_tour/', include('scandal_tour.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)
