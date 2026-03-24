#!/bin/bash
if [ "$SKIP_MIGRATIONS" = "true" ] && [ -f "/rails/storage/.initialized" ]; then
  echo "Skipping database migrations as per SKIP_MIGRATIONS=true."
else
  # Database wait logic
  if [ -n "$POSTGRES_HOST" ]; then
    echo "Waiting for database at $POSTGRES_HOST..."
    for i in {1..30}; do
      if curl -s "http://$POSTGRES_HOST:$POSTGRES_PORT" > /dev/null; then break; fi # Simple port check
      sleep 3
    done
  fi
  bundle exec rails db:prepare
  touch /rails/storage/.initialized
fi
