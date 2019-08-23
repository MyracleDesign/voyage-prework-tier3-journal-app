Write-Host "Deploy Server"
git subtree push --prefix server digital-journal-api master

Write-Host "It could be that this needs to be executed on heroku"
heroku run /app/dart-sdk/bin/pub global run aqueduct:aqueduct auth add-client --id com.myracledesign.flutter_web_digital_journal --secret flutter-digital-journal-secret --connect \$DATABASE_URL --app digital-journal-api

Write-Host "Startup Client..."
git subtree push --prefix client digital-journal-client master
