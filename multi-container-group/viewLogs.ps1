param (

    [Parameter(Mandatory=$False)]
    [string]
    $ResourceGroupName = "aci-container-groups-demo",

    [Parameter(Mandatory=$True)]
    [string]
    $ContainerGroupName = "myContainerGroup",

    [Parameter(Mandatory=$False)]
    [string]
    $ContainerName = "aci-tutorial-app"
)

az container logs --resource-group $ResourceGroupName --name $ContainerGroupName --container-name $ContainerName