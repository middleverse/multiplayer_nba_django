import json, random
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

        IMPORTANT: Always call load_divisions() before calling this
        function.
        '''
        
        # CREATE LIST
        # Fetch team id's for use in query filteration
        query_team_id_values = []
        for div in self.divisions:
            teams = Team.objects.filter(division_name=div).all()
            for team in teams:
                query_team_id_values.append(team.id)
        # query DB for questions related to required team(s) 
        question_set = list(Question.objects.filter(reduce(lambda x, y: x | y, [Q(team=team) for team in query_team_id_values])))

        # SHUFFLE LIST
        random.shuffle(question_set)

        return self.serialize_question_set(question_set) 
        
    def serialize_question_set(self, question_set):
        '''
        Returns a readable JSON format list of 
        dicts containing question object data. 
        
        Includes, team_name, question_statement,
        choices (4), answer.

        Assumes answer is already randomized.
        '''
        converted_question_set = []
        for question in question_set:
            question_map = {
                'id': question.id,
                'question': question.question_statement,
                'c_a': question.choice_a,
                'c_b': question.choice_b,
                'c_c': question.choice_c,
                'c_d': question.choice_d,
                'answer': question.answer,
                'team': question.team.team_name
            }
            converted_question_set.append(question_map)   
            print(converted_question_set)     
        return json.dumps(converted_question_set)
