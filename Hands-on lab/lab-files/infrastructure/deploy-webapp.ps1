$studentprefix = "hbs"
$githubAccount = "Your github account name here"
$resourcegroupName = "fabmedical-rg-" + $studentprefix
$webappName = "fabmedical-web-" + $studentprefix

# Deploy Azure Web App
az webapp config container set `
    --docker-registry-server-password $env:GITHUB_TOKEN `
    --docker-registry-server-url https://docker.pkg.github.com `
    --docker-registry-server-user $githubAccount `
    --multicontainer-config-file ./../docker-compose.yml `
    --multicontainer-config-type COMPOSE `
    --name $webappName `
    --resource-group $resourcegroupName
