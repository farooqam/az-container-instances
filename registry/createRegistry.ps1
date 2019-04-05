param (

    [Parameter(Mandatory=$False)]
    [string]
    $ResourceGroupName = "aci-container-registry-demo",

    [Parameter(Mandatory=$True)]
    [string]
    $RegistryName,

    [Parameter(Mandatory=$False)]
    [string]
    $Location = "westus2"
)

az group create --name $ResourceGroupName --location $Location
az acr create --resource-group $ResourceGroupName --name $RegistryName --sku Basic --admin-enabled true
az acr show --name $RegistryName --query loginServer --output tsv