param (

    [Parameter(Mandatory=$True)]
    [string]
    $RegistryName,

    [Parameter(Mandatory=$True)]
    [string]
    $LocalDockerImageName,

    [Parameter(Mandatory=$True)]
    [string]
    $LocalDockerImageTag
)

az acr login --name $RegistryName
$LoginServer = az acr show --name $RegistryName --query loginServer --output tsv

docker tag $LocalDockerImageName $LoginServer/${LocalDockerImageName}:${LocalDockerImageTag}
docker push $LoginServer/${LocalDockerImageName}:${LocalDockerImageTag}

az acr repository show-tags --name $RegistryName --repository ${LocalDockerImageName} --output table