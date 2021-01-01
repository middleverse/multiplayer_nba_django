from django import forms

class CourtIdForm(forms.Form):
    court_id = forms.CharField(max_length=4)
    
    # TODO: check if id is correct
    
