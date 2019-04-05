param (

    [Parameter(Mandatory=$False)]
    [string]
    $ResourceGroupName = "aci-container-groups-demo",

    [Parameter(Mandatory=$False)]
    [string]
    $Location = "westus2",

    [Parameter(Mandatory=$False)]
    [string]
    $DeploymentFileName = "deploy-aci.yaml",

    [Parameter(Mandatory=$False)]
    [string]
    $ContainerGroupName = "myContainerGroup"
)

az group create --name $ResourceGroupName --location $Location
az container create --resource-group $ResourceGroupName --file $DeploymentFileName
az container show --resource-group $ResourceGroupName --name $ContainerGroupName --output table
