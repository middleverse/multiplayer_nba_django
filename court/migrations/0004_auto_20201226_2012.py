# Generated by Django 3.1.4 on 2020-12-26 20:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('court', '0003_auto_20201226_1526'),
    ]

    operations = [
        migrations.AlterField(
            model_name='team',
            name='team_name',
            field=models.CharField(max_length=3),
        ),
    ]
