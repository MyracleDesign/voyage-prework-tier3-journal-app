release: /app/dart-sdk/bin/pub global run aqueduct:aqueduct db upgrade --connect $DATABASE_URL
api: /app/dart-sdk/bin/pub global run server/aqueduct:aqueduct serve --port $PORT --config-path heroku.yaml
web: /app/dart-sdk/bin/pub global run client/webdev serve
