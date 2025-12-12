#!/bin/sh

# Wait for Postgres to be ready
# We can use a simple wait loop effectively since 'depends_on' in docker-compose 
# only waits for the container to start, not for the DB to be ready for connections.

echo "Waiting for database to be ready..."
# Loop until we can connect to the database (basic check)
# Using nc (netcat) which is usually available in alpine images
until nc -z -v -w30 db 5432
do
  echo "Waiting for database connection..."
  sleep 5
done

echo "Database is up - executing command"

# Run migrations
echo "Running migrations..."
npx prisma migrate deploy

# Run seeds
echo "Seeding database..."
npx prisma db seed

# Start the application
echo "Starting application..."
npm run start:prod
