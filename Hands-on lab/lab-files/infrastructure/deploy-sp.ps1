$studentprefix ="your abbreviation here"
$resourcegroupName = "fabmedical-rg-" + $studentprefix

$id = $(az group show `
    --name $resourcegroupName `
    --query id)

az ad sp create-for-rbac `
    --name "fabmedical-$studentprefix" `
    --sdk-auth `
    --role contributor `
    --scopes $id
