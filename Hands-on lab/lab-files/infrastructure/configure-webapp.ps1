$studentprefix = "Your 3 letter abbreviation here"
$resourcegroupName = "fabmedical-rg-" + $studentprefix
$cosmosDBName = "fabmedical-cdb-" + $studentprefix
$webappName = "fabmedical-web-" + $studentprefix

# Fetch CosmosDB Mongo connection string
$mongodbConnectionString = `
    $(az cosmosdb keys list `
        --name $cosmosDBName `
        --resource-group $resourcegroupName `
        --type connection-strings `
        --query 'connectionStrings[0].connectionString')

# Configure Web App
az webapp config appsettings set `
    --name $webappName `
    --resource-group $resourcegroupName `
    --settings MONGODB_CONNECTION=$mongodbConnectionString
