import json
from functools import reduce
from itertools import chain
from django.db.models.query import QuerySet
from django.db.models import Q


from .models import Question, Team


class QuestionManager():
    '''
    Helper class that provides access to QuerySet of questions
    based on teams provided, in JSON format.
    Consumed by Consumer
    '''
    
    def __init__(self):
        self.divisions = None
        

    def load_divisions(self, divisions):
        '''
        Excpects a list of strings with valid division names.
        '''
        self.divisions = divisions 

    def get_questions(self):
        '''
        Returns a list of all question objects that are 
        included in currently loaded divisions.

        Always call load_divisions() before calling this
        function.
        '''
        
        # Create a list of id's of all teams 
        # included in the specified divisions
        query_team_id_values = []
        for div in self.divisions:
            teams = Team.objects.filter(division_name=div).all()
            for team in teams:
                query_team_id_values.append(team.id)

        # query the DB for questions by providing
        # above list of ids
        question_set = Question.objects.filter(reduce(lambda x, y: x | y, [Q(team=t) for t in query_team_id_values]))
        print('LAMBDA QS: ' + str(question_set.first().question_statement))                   
        
        return self.serialize_question_set(question_set) 
        
    def serialize_question_set(self, question_sets):
        # for qs in question_sets:
            # for each question in this qs
        # print(question_sets)
        # print(question_set[0][0].get_serialized()) 
        
        return 1
