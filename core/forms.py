from django import forms
from court.models import Court
from django.core.exceptions import ValidationError

class CourtIdForm(forms.Form):
    court_id = forms.CharField(max_length=4)
    
    # TODO: check if id is correct
    # def clean(self):
    #     cleaned_data = super().clean()
    #     court_id = cleaned_data.get('court_id')
    #     if Court.objects.filter(court_id=court_id).exists() is False:
    #         raise ValidationError('No court with this ID exists')
    #     else:
    #         if len(Court.objects.get(court_id=court_id).get_current_player_list()) > 3:
    #             raise ValidationError('Court is at full capacity.')
