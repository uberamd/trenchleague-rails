[![Build Status](https://drone.stevem.io/api/badges/uberamd/trenchleague-rails/status.svg)](https://drone.stevem.io/uberamd/trenchleague-rails)

# Development Environment Setup

## Docker

A Docker Compose file is included to make it easy to get a development 
environment up and running with minimal friction. It could be used to 
host a production instance of this webapp too, with some minor adjustments 
to some environment variables.

### Requirements

Ensure you have:

1. Docker installed
1. Docker Compose installed

### Starting

1. Clone down this repository to your system
1. From the directory where the code exists, run a `docker-compose up --build`
1. When you are done you can do Control-C to stop the containers
1. Do a `docker-compose down` to remove the stopped containers

Note: You can also run a `docker-compose up -d --build` to start all of
the containers in the background.

### Services

Name | Internal Port | Host Port | Description
--- | :---: | :---: | ---
db | 5432 | 15432 | PostgreSQL Database
cache | 6379 | n/a | Redis Session Cache
minio | 9000 | 9000 | S3 API for storing team logos
createbuckets | n/a | n/a | Minio bucket creation script (required for first run)
webapp | 3000 | 3000 | Rails application

### Environment Variables

#### Service: db

Name | Default | Description
--- | --- | ---
POSTGRES_USER | tl_dev | PostgreSQL User to create on startup
POSTGRES_DB | tl_dev | PostgreSQL DB to create on startup
POSTGRES_PASSWORD | password | Password for `POSTGRES_USER`

#### Service: minio

Name | Default | Description
--- | --- | ---
MINIO_ACCESS_KEY | public | Public bucket access key
MINIO_SECRET_KEY | privatepass | Secret bucket access key

#### Service: webapp

Name | Default | Description
--- | --- | ---
DB_USER | tl_dev | PostgreSQL DB Username
DB_PASS | password | PostgreSQL DB Password
DB_HOST | db | PostgreSQL DB Hostname (service name in our case)
DB_PORT | 5432 | PostgreSQL Port
RAILS_ENV | development | Rails environment to run as, do NOT use Development on public-facing places
SMTP_DOMAIN | example.com | Domain to send emails on behalf of (for gmail SMTP)
SMTP_USERNAME | user | SMTP User to authenticate as
SMTP_PASSWORD | password | Password for SMTP user
AWS_S3_BUCKET_NAME | tl_dev | Bucket to store logos in
AWS_ACCESS_KEY | public | S3/Minio Public key
AWS_SECRET_KEY | privatepass | S3/Minio Secret key

# Questions/Support

Create an issue if you're in need of assistance.
