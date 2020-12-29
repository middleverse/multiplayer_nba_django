from django.db import models

# Create your models here.
class Team(models.Model):
    '''
    Represents an NBA Team,
    attributes: team name, division name
    
    NOTE: Create a Team object using Team.create('TEAM_ACRONYM')
          Do not use Team.objects.create() function  
    '''

    ATLANTIC_DIV    = ['BKN', 'PHI', 'BOS', 'TOR', 'NYK']
    CENTRAL_DIV     = ['IND', 'CLE', 'MIL', 'DET', 'CHI']
    SOUTHEAST_DIV   = ['ORL', 'ATL', 'MIA', 'WAS', 'CHA']
    NORTHWEST_DIV   = ['UTA', 'MIN', 'OKC', 'POR', 'DEN']
    PACIFIC_DIV     = ['LAC', 'PHX', 'SAC', 'LAL', 'GSW']
    SOUTHWEST_DIV   = ['SAS', 'NOP', 'HOU', 'MEM', 'DAL']
    OTHER_DIV       = ['ZZZ']

    DIVISION_NAME_CHOICES = [
        ('ATLANTIC',    'ATLANTIC Division'),
        ('CENTRAL',     'CENTRAL Division'),
        ('SOUTHEAST',   'SOUTHEAST Division'),
        ('NORTHWEST',   'NORTHWEST Division'),
        ('PACIFIC',     'PACIFIC Division'),
        ('SOUTHWEST',   'SOUTHWEST Division'),
        ('OTHER',       'OTHER Division'),
    ]

    TEAM_NAME_CHOICES = {
        'ATL':	'Atlanta Hawks',
        'BKN':	'Brooklyn Nets',
        'BOS':	'Boston Celtics',
        'CHA':	'Charlotte Hornets',
        'CHI':	'Chicago Bulls',
        'CLE':	'Cleveland Cavaliers',
        'DAL':	'Dallas Mavericks',
        'DEN':	'Denver Nuggets',
        'DET':	'Detroit Pistons',
        'GSW':	'Golden State Warriors',
        'HOU':	'Houston Rockets',
        'IND':	'Indiana Pacers',
        'LAC':	'Los Angeles Clippers',
        'LAL':	'Los Angeles Lakers',
        'MEM':	'Memphis Grizzlies',
        'MIA':	'Miami Heat',
        'MIL':	'Milwaukee Bucks',
        'MIN':	'Minnesota Timberwolves',
        'NOP':	'New Orleans Pelicans',
        'NYK':	'New York Knicks',
        'OKC':	'Oklahoma City Thunder',
        'ORL':	'Orlando Magic',
        'PHI':	'Philadelphia 76ers',
        'PHX':	'Phoenix Suns',
        'POR':	'Portland Trail Blazers',
        'SAC':	'Sacramento Kings',
        'SAS':	'San Antonio Spurs',
        'TOR':	'Toronto Raptors',
        'UTA':	'Utah Jazz',
        'WAS':	'Washington Wizards',
        'ZZZ':  'Other'
    }

    team_name = models.CharField(max_length=3, null=False, blank=False)
    
    division_name = models.CharField(
        max_length=10, 
        null=False, 
        choices=DIVISION_NAME_CHOICES,
        default='NNN'
    )

    @classmethod
    def create(self, team_name):
        '''
        Use this method to create object.
        '''
        try:
            if self.TEAM_NAME_CHOICES[team_name] == None:
                raise KeyError
        except KeyError:
            print(f'{team_name} is not a valid team name. Please try again.')
            return

        team = self(team_name=team_name)
        team.set_division()
        return team

    def set_division(self):
        if self.team_name in self.ATLANTIC_DIV:
            self.division_name = 'ATLANTIC'
        elif self.team_name in self.CENTRAL_DIV:
            self.division_name = 'CENTRAL'
        elif self.team_name in self.SOUTHEAST_DIV:
            self.division_name = 'SOUTHEAST'
        elif self.team_name in self.NORTHWEST_DIV:
            self.division_name = 'NORTHWEST'
        elif self.team_name in self.PACIFIC_DIV:
            self.division_name = 'PACIFIC'
        elif self.team_name in self.SOUTHWEST_DIV:
            self.division_name = 'SOUTHWEST'
        elif self.team_name in self.OTHER_DIV:
            self.division_name = 'OTHER'


class Question(models.Model):
    '''
    Represents a question statement,
    each question has 4 choices,
    each question is based on a Team.
    '''
    team = models.ForeignKey(Team, null=True, on_delete=models.SET_NULL)
    question_statement = models.TextField(null=False)
    choice_a = models.CharField(max_length=75)
    choice_b = models.CharField(max_length=75)
    choice_c = models.CharField(max_length=75)
    choice_d = models.CharField(max_length=75)
    answer = models.CharField(max_length=1)

    # NOTE: added requried tags if needed