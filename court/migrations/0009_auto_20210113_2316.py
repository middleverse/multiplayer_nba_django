# Generated by Django 3.1.4 on 2021-01-13 23:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('court', '0008_auto_20210113_0134'),
    ]

    operations = [
        migrations.AlterField(
            model_name='question',
            name='team',
            field=models.TextField(default='ZZZ', max_length=3),
        ),
    ]