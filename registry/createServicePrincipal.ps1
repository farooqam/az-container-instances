param (

    [Parameter(Mandatory=$True)]
    [string]
    $RegistryName,

    [Parameter(Mandatory=$False)]
    [string]
    $ServicePrincipalName = "acr-service-principal"
)

$RegistryId = az acr show --name $RegistryName --query id --output tsv
$ServicePrincipalPassword = az ad sp create-for-rbac --name http://$ServicePrincipalName --scopes $RegistryId --role acrpull --query password --output tsv
$ServicePrincipalAppId = az ad sp show --id http://$ServicePrincipalName --query appId --output tsv

Write-Output "Service prinicpal ID: $ServicePrincipalAppId"
Write-Output "Service principal password: $ServicePrincipalPassword"