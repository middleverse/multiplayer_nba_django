import json
from channels.generic.websocket import AsyncWebsocketConsumer

from .models import Team, Question

class CourtConsumer(AsyncWebsocketConsumer):
    '''
    Court Consumer
    '''
    my_question = Question.objects.all().first()

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

    async def disconnect(self, close_code):
        await self.channel_layer.group_discard(
            self.court_group_name,
            self.channel_name    
        )

    async def receive(self, text_data):
        text_data_json = json.loads(text_data)

        await self.channel_layer.group_send(
            self.court_group_name, {
                'type': 'court_message',
                'message': 'question',
                'question' : self.my_question.question_statement,
            }
        )   

    async def court_message(self, event):
        message = event['message']

        await self.send(text_data=json.dumps({
            'message': message,
        }))    