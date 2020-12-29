from django.contrib import admin

# Register your models here.
from .models import Team, Question

class TeamAdmin(admin.ModelAdmin):
    model = Team

class QuestionAdmin(admin.ModelAdmin):
    model = Question

admin.site.register(Team, TeamAdmin)
admin.site.register(Question, QuestionAdmin)
