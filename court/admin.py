from django.contrib import admin

# Register your models here.
from .models import Team

class TeamAdmin(admin.ModelAdmin):
    model = Team

admin.site.register(Team, TeamAdmin)