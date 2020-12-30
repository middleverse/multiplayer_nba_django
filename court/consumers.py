import json
from channels.generic.websocket import AsyncWebsocketConsumer

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
                'message': 'hello channel!',
            }
        )   

    async def court_message(self, event):
        message = event['message']

        await self.send(text_data=json.dumps({
            'message': message,
        }))    