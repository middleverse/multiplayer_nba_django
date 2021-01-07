# Generated by Django 3.1.4 on 2021-01-07 17:41

import court.models
import django.contrib.postgres.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('court', '0006_court'),
    ]

    operations = [
        migrations.AddField(
            model_name='court',
            name='available_id',
            field=django.contrib.postgres.fields.ArrayField(base_field=models.IntegerField(), default=court.models.default_available_id_list, size=None),
        ),
        migrations.AddField(
            model_name='court',
            name='current_player_list',
            field=django.contrib.postgres.fields.ArrayField(base_field=models.IntegerField(), default=court.models.default_current_player_list, size=None),
        ),
    ]
