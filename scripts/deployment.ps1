Write-Host "Deploy Server"
git subtree push --prefix server digital-journal-api master

Write-Host "Startup Client..."
git subtree push --prefix client digital-journal-client master