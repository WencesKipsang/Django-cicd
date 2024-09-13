
from django.contrib import admin
from django.urls import path, include
from cicd import urls as you

urlpatterns = [
    path('frs-jenkins2/admin/', admin.site.urls),
    path('frs-jenkins2/cicd/', include(you)),
]
