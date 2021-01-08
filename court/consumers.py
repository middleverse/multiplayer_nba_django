import json, asyncio
from channels.db import database_sync_to_async
from asgiref.sync import sync_to_async
from channels.generic.websocket import AsyncWebsocketConsumer

from .models import Team, Question
from .question_manager import QuestionManager

class CourtConsumer(AsyncWebsocketConsumer):
    '''
    Court Consumer
    '''        
    async def connect(self):
        self.court_id = self.scope['url_route']['kwargs']['court_id'] # room name provided in scope by the router
        self.court_group_name = 'court_%s' % self.court_id

        # add channel instance to group
        await self.channel_layer.group_add(
            self.court_group_name, 
            self.channel_name # scope variable
        )

        await self.accept()

        # TODO : Player icon popup here
        await self.channel_layer.group_send(
            self.court_group_name, {
                'type': 'arrival_message',
                'message': 'Another player joined!',
            }
        )   

    async def disconnect(self, close_code):
        group_message = {
            'type': 'player_disconnected_message',
            'message': self.channel_name,
        }
        
        await self.channel_layer.group_send(
            self.court_group_name, group_message
        )   

        await self.channel_layer.group_discard(
            self.court_group_name,
            self.channel_name,    
        )

    # RECIEVE MESSAGE

    async def receive(self, text_data):
        json_data = json.loads(text_data)
        message_type = json_data['message_type']    
        group_message = {'type': 'message_unbound'}

        # CREATE COURT - sent by captain
        if message_type == 'create_court':
            self.captain = self.channel_name

        # CREATE GAME - sent by captain
        elif message_type == 'create_game': 
            # change state from create_game to       
            # load the questions from db
            # client goes to lobby
            # send all channels list of questions
            division = json_data['division']
            shot_clock = json_data['shot_clock']
            question_set = {}
            question_set = await sync_to_async(self.get_questions)(division)
            group_message = {
                'type': 'created_game_message',
                'message': {
                    'question_set': question_set,
                    'shot_clock': json_data['shot_clock'],
                    'division': json_data['division'],
                }
            }

        # LOAD CONFIG - sent by player
        elif message_type == 'load_game_config':
            group_message = {
                'type': 'captain_send_game_config_message',
                'message': 'player requestion game config',
            }

        # SENT GAME CONFIG - sent by captain
        elif message_type == 'sent_game_config':
            division = json_data['division']
            shot_clock = json_data['shot_clock']
            question_set = json_data['question_set']
            group_message = {
                'type': 'player_load_lobby_message',
                'message': {
                    'shot_clock': shot_clock,
                    'division': division,
                    'question_set': question_set,
                }
            }

        # START GAME - sent by captain
        elif message_type == 'start_game':
            group_message = {
                'type': 'start_game_message',
                'message': 'start round'
            }
        
        # PLAYER ANSWERS (END OF ROUND) - sent by any
        elif message_type == 'player_answer':
            group_message = {
                'type': 'player_answer_posted_message',
                'message': 'a player answered!'
            }

        elif message_type == 'tell_player_load_next_question':
            group_message = {
                'type': 'load_next_question_message',
                'message': 'load q'
            }

        await self.channel_layer.group_send(
            self.court_group_name, group_message
        )   

    def get_questions(self, divisions):
        '''
        Returns a JSON String containing
        a list of Questions
        '''
        q_manager = QuestionManager()
        q_manager.load_divisions(divisions)
        question_set_json = q_manager.get_questions()
        return question_set_json


    # GROUP MESSAGE HANDLERS

    async def arrival_message(self, event):
        await self.send(text_data=json.dumps({
            'message': event['type'],
            'text' : event['message'],
        }))

    async def created_game_message(self, event):
        await self.send(text_data=json.dumps({
            'message': event['type'],
            'text' : event['message'],
        }))

    async def captain_send_game_config_message(self, event):
        await self.send(text_data=json.dumps({
            'message': event['type'],
            'text' : event['message'],
        }))    
    
    async def player_load_lobby_message(self, event):
        await self.send(text_data=json.dumps({
            'message': event['type'],
            'text' : event['message'],
        }))

    async def start_game_message(self, event):
        await self.send(text_data=json.dumps({
            'message': event['type'],
            'text' : event['message'],
    }))

    async def player_answer_posted_message(self, event):
        await self.send(text_data=json.dumps({
            'message': event['type'],
            'text' : event['message'],
    }))

    async def load_next_question_message(self, event):
        await self.send(text_data=json.dumps({
            'message': event['type'],
            'text' : event['message'],
    }))

    async def message_unbound(self, event): 
        print('Message Unbound')

    