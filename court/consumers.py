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
    # QUESTION_SET = Question.objects.all().first()

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

    def get_questions(self, divisions):
        #  TODO: should ask question manager for questions
        q_manager = QuestionManager()
        q_manager.load_divisions(divisions)
        question_set_json = q_manager.get_questions()
        # return q_manager.get_questions()
        # print(question_set_json)
        return question_set_json

    async def disconnect(self, close_code):
        await self.channel_layer.group_discard(
            self.court_group_name,
            self.channel_name,    
        )

    async def receive(self, text_data):
        json_data = json.loads(text_data)
        message_type = json_data['message_type']    
        group_message = {}
        # TODO: Segment all message types into respective "sends"
        # Assign Captain (sort of admin user)
        if message_type == 'create_court':
            self.captain = self.channel_name    
        elif message_type == 'create_game':
            self.captain = self.channel_name
            division = json_data['division']
            # load the questions from db
            # client goes to lobby
            # send all channels list of questions
            divs = json_data['division']
            print('data:' + text_data)
            # question_set = {}
            question_set = await sync_to_async(self.get_questions)(division)
            group_message = {
                'type': 'create_game_message',
                'message': {
                    'question_set': question_set,
                    'shot_clock': json_data['shot_clock'],
                    'division': json_data['division']
                }
            }
        # await asyncio.sleep(3)

        await self.channel_layer.group_send(
            self.court_group_name, group_message
        )   

    async def arrival_message(self, event):
        await self.send(text_data=json.dumps({
            'message': event['type'],
            'text' : event['message'],
        }))

    async def create_game_message(self, event):
        await self.send(text_data=json.dumps({
            'message': event['type'],
            'text' : event['message'],
        }))