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
                'type': 'court_message',
                'message': 'Another player joined!',
            }
        )   

        self.QUESTION_SET = await database_sync_to_async(self.get_next_set_of_questions)()

    def get_next_set_of_questions(self):
        return Question.objects.all().first()

    def get_questions(self, divisions):
        #  TODO: should ask question manager for questions
        q_manager = QuestionManager()
        q_manager.load_divisions(['ATLANTIC'])
        question_set = q_manager.get_questions()
        # return q_manager.get_questions()
        # print(question_set)
        return Question.objects.all().first()

    async def disconnect(self, close_code):
        await self.channel_layer.group_discard(
            self.court_group_name,
            self.channel_name,    
        )

    async def receive(self, text_data):
        json_data = json.loads(text_data)
        message_type = json_data['message_type']
        
        if message_type == 'get_questions':
            # load the questions from db
            # client goes to lobby
            # send all channels list of questions
            # divs = json_data['divisions']
            question_set = await sync_to_async(self.get_questions)(['ATLANTIC'])
            
        # await asyncio.sleep(3)

        await self.channel_layer.group_send(
            self.court_group_name, {
                'type': 'court_message',
                'message' : {
                    'question': question_set.question_statement
                }
            }
        )   

    async def court_message(self, event):
        await self.send(text_data=json.dumps({
            'message': event['type'],
            'text' : event['message'],
        }))