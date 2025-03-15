#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails
rm -f /rails/app/tmp/pids/server.pid

# Wait for database to be ready
until pg_isready -h db -p 5432 -U postgres
do
  echo "Waiting for PostgreSQL to be ready..."
  sleep 2
done

# Create or migrate database
if bundle exec rails db:exists; then
  echo "Database exists, running migrations..."
  bundle exec rails db:migrate
else
  echo "Database doesn't exist, creating and seeding..."
  bundle exec rails db:create db:migrate db:seed
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile)
exec "$@"
