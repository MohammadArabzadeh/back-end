#!/bin/sh

# Activate the virtual environment
source .env/bin/activate

# Run your Python application
exec python manage.py runserver 0.0.0.0:8000