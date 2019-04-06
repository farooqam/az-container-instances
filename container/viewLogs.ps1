param (

    [Parameter(Mandatory=$False)]
    [string]
    $ResourceGroupName = "aci-container-registry-demo",

    [Parameter(Mandatory=$False)]
    [string]
    $ContainerName = "aci-tutorial-app"
)

az container logs --resource-group $ResourceGroupName --name $ContainerName