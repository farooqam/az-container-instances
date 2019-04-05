param (

    [Parameter(Mandatory=$False)]
    [string]
    $ResourceGroupName = "aci-container-groups-demo"
)

az group delete --name $ResourceGroupName --yes