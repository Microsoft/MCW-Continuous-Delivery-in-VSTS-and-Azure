$studentprefix = "Your 3 letter abbreviation here"
$resourcegroupName = "fabmedical-rg-" + $studentprefix
$cosmosDBName = "fabmedical-cdb-" + $studentprefix
$webappName = "fabmedical-web-" + $studentprefix
$planName = "fabmedical-plan-" + $studentprefix
$location1 = "westeurope"
$location2 = "northeurope"

# Create resource group
az group create `
    --location $location1 `
    --name $resourcegroupName

# Create CosmosDB database
az cosmosdb create `
    --name $cosmosDBName `
    --resource-group $resourcegroupName `
    --locations regionName=$location1 failoverPriority=0 isZoneRedundant=False `
    --locations regionName=$location2 failoverPriority=1 isZoneRedundant=True `
    --enable-multiple-write-locations `
    --kind MongoDB

# Create Azure App Service Plan
az appservice plan create `
    --name $planName `
    --resource-group $resourcegroupName `
    --sku S1 `
    --is-linux

# Create Azure Web App with NGINX container
az webapp create `
    --resource-group $resourcegroupName `
    --plan $planName `
    --name $webappName `
    --deployment-container-image-name nginx

# Fetch CosmosDB Mongo connection string
$mongodbConnectionString = `
    $(az cosmosdb keys list `
        --name $cosmosDBName `
        --resource-group $resourcegroupName `
        --type connection-strings `
        --query 'connectionStrings[0].connectionString')