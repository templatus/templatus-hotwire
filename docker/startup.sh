#! /bin/sh

echo "Starting ..."
echo "Git commit: $COMMIT_VERSION - $COMMIT_TIME"
echo "----------------"

# Wait for Redis
redis_host=$(echo "$REDIS_URL" | awk -F[/:] '{print $4}')
redis_port=$(echo "$REDIS_URL" | awk -F[/:] '{print $5}')
until nc -z -v -w30 "$redis_host" "$redis_port"
do
  echo "Waiting for Redis on $redis_host:$redis_port ..."
  sleep 1
done
echo "Redis is up and running!"

# Wait for PostgreSQL
until nc -z -v -w30 "$DB_HOST" 5432
do
  echo "Waiting for PostgreSQL on $DB_HOST:5432 ..."
  sleep 1
done
echo "PostgreSQL is up and running!"

# Create or migrate database
echo "Preparing database..."
bin/rails db:prepare
echo "Database is ready!"

exec "$@"
