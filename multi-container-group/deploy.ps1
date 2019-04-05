param (

    [Parameter(Mandatory=$True)]
    [string]
    $ResourceGroupName,

    [Parameter(Mandatory=$True)]
    [string]
    $Location,

    [Parameter(Mandatory=$True)]
    [string]
    $DeploymentFileName,

    [Parameter(Mandatory=$True)]
    [string]
    $ContainerGroupName
)

az login
az group create --name $ResourceGroupName --location $Location
az container create --resource-group $ResourceGroupName --file $DeploymentFileName

az container show --resource-group $ResourceGroupName --name $ContainerGroupName --output table

