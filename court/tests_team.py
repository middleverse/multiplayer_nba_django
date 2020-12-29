from django.test import TestCase

# Create your tests here.
from .models import Team

class TeamTestCase(TestCase):
    '''
    Testing for Team Model
    '''
    def setUp(self):
        Team.create('TOR')
        Team.create('')

    def test_team_created(self):
        pass

    def test_correct_team_name(self):
        pass

    def test_correct_division_name(self):
        pass

    def test_all_teams_present(self):
        pass



