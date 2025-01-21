#! /bin/sh

echo "Starting ..."
echo "Git commit: $COMMIT_VERSION - $COMMIT_TIME"
echo "----------------"

# If running the rails server then create or migrate existing database
if [ "${*}" == "./bin/rails server" ]; then
  echo "Preparing database..."
  ./bin/rails db:prepare
  echo "Database is ready!"
fi

exec "${@}"
