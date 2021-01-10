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
        widget=forms.Select(
            attrs={'class': 'form-control'}
        ),
        choices=TIME_CHOICES,
        initial=17,
        required=True,
    )

    division = forms.MultipleChoiceField(
        widget=forms.CheckboxSelectMultiple(
            attrs={'id': 'config-division-list'}
        ),
        choices=DIVISION_CHOICES,
        required=True,
    )