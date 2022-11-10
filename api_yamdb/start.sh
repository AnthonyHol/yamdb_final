#!/bin/bash
python3 manage.py makemigrations api
python3 manage.py migrate
python3 manage.py collectstatic --no-input
gunicorn api_yamdb.wsgi:application --bind 0:8000
