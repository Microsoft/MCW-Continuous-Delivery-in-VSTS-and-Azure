$studentsuffix = "your abbreviated name"
$resourcegroupName = "fabmedical-rg-" + $studentsuffix
$location1 = "westeurope"
$appInsights = "fabmedicalai-" + $studentsuffix

az extension add --name application-insights

$instrumentationKey = $(az monitor app-insights component create `
    --app $appInsights `
    --location $location1 `
    --kind web `
    --resource-group $resourcegroupName `
    --application-type web `
    --retention-time 120 `
    --query instrumentationKey)

Write-Host "AI Instrumentation Key=$instrumentationKey"