from django import forms

from .models import Team

class GameConfigForm(forms.Form):
    TIME_CHOICES = (
        (10,10),
        (17,17),
        (24,24)
    )

    DIVISION_CHOICES = Team.DIVISION_NAME_CHOICES
        

    shot_clock = forms.MultipleChoiceField(
        widget=forms.Select,
        choices=TIME_CHOICES,
        initial=17
    )

    division = forms.MultipleChoiceField(
        widget=forms.CheckboxSelectMultiple,
        choices=DIVISION_CHOICES,
    )