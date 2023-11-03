#!/bin/bash
# This is the shell script for running app, server, and migrations via Django.

# Activate the virtual environment
source ./myenv/bin/activate

if [ "$1" = "run" ]; then
    if [ -z "$2" ]; then # incomplete
        python manage.py runserver && 
        cd frontend/app &&
        npm run dev &&
        cd .. && cd ..
    elif [ "$2" = "server" ]; then  # ./ks run server
        python manage.py runserver
    elif [ "$2" = "app" ]; then  # ./ks run app
        cd frontend/app && npm run dev && cd .. && cd ..
    else
        echo "Unknown subcommand: $2"
    fi
elif [ "$1" = "migrate" ] || [ "$1" = "makemigrations" ]; then
    python manage.py "$1"
else
    echo "Unknown command: $1"
fi
