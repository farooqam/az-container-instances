param (

    [Parameter(Mandatory=$False)]
    [string]
    $ResourceGroupName = "aci-container-registry-demo",

    [Parameter(Mandatory=$True)]
    [string]
    $ContainerName,

    [Parameter(Mandatory=$True)]
    [string]
    $RegistryName,

    [Parameter(Mandatory=$True)]
    [string]
    $ImageName,

    [Parameter(Mandatory=$False)]
    [byte]
    $CpuCount = 1,

    [Parameter(Mandatory=$False)]
    [byte]
    $MemoryGB = 1,

    [Parameter(Mandatory=$False)]
    [string]
    $RegistryUserName,

    [Parameter(Mandatory=$False)]
    [string]
    $RegistryPassword,

    [Parameter(Mandatory=$True)]
    [string]
    $Ports
)

$LoginServer = az acr show --name $RegistryName --query loginServer --output tsv
az container create --resource-group $ResourceGroupName --name $ContainerName --image $LoginServer/$ImageName --cpu $CpuCount --memory $MemoryGB --registry-login-server $LoginServer --registry-username $RegistryUserName --registry-password $RegistryPassword --dns-name-label $ContainerName --ports $Ports

$State = az container show --resource-group $ResourceGroupName --name $ContainerName --query instanceView.state --output tsv

if ($State -ne "Running")
{
    Write-Error "Instance is not running."
    return;
}

az container show --resource-group $ResourceGroupName --name $ContainerName --query ipAddress.fqdn