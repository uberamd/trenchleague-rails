[![Build Status](https://drone.stevem.io/api/badges/uberamd/trenchleague-rails/status.svg)](https://drone.stevem.io/uberamd/trenchleague-rails)

# Development Environment Setup

## Ubuntu

Perform a `bundle install`. You will need the following packages on your 
system for this to succeed:

* libpq-dev

This was developed using Ruby 2.4.1 and Rails 5.1

## Docker

A docker compose file is included for creating the postgres database 
server. It is available on localhost:15432, credentials for development 
can be found in config/database.yml

To use simply execute a `docker-compose up`

