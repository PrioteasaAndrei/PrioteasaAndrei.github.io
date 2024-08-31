#!/bin/bash

CONFIG_FILE=_config.yml 

/bin/bash -c "rm -f Gemfile.lock && exec jekyll serve --watch --port=8080 --host=0.0.0.0 --livereload --verbose --trace --force_polling"&

# last exxecuted command pid
jekyll_pid=$!

# Start the Flask server in the background
export FLASK_APP=/srv/backend/app.py
. /srv/backend/venv/bin/activate
flask run --host=0.0.0.0 --port=5000 &
flask_pid=$!

# Function to handle termination signals
function terminate {
    echo "Terminating Jekyll and Flask servers..."
    kill -KILL $jekyll_pid
    kill -KILL $flask_pid
    exit 0
}

# Trap termination signals
trap terminate SIGTERM SIGINT


while true; do

  inotifywait -q -e modify,move,create,delete $CONFIG_FILE

  if [ $? -eq 0 ]; then
 
    echo "Change detected to $CONFIG_FILE, restarting Jekyll"

    kill -KILL $jekyll_pid

    /bin/bash -c "rm -f Gemfile.lock && exec jekyll serve --watch --port=8080 --host=0.0.0.0 --livereload --verbose --trace --force_polling"&
    jekyll_pid=$!

  fi

done
