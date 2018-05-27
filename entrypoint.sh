#!/bin/bash

# we're going to pause to give the DB container time to cleanly come up
sleep 20

# migrate the db
bundle exec rake db:migrate

# start the app server
bundle exec puma