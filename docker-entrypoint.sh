#!/bin/bash

cd /calendar
python manage.py migrate                  # Apply database migrations

gunicorn -b 0.0.0.0 --log-file=- --access-logfile=- --reload issue_22420.wsgi
