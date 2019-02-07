
$AKS_RESOURCE_GROUP="demo-aks"
$AKS_CLUSTER_NAME="csucsaaks-us"
$ACR_RESOURCE_GROUP="Demos-acr"
$ACR_NAME="aksdemoreg"

# Get the id of the service principal configured for AKS
$CLIENT_ID=$(az aks show --resource-group $AKS_RESOURCE_GROUP --name $AKS_CLUSTER_NAME --query "servicePrincipalProfile.clientId" --output tsv)
#46718843-f53a-42de-aceb-9061d5709277

# Get the ACR registry resource id
$ACR_ID=$(az acr show --name $ACR_NAME --resource-group $ACR_RESOURCE_GROUP --query "id" --output tsv)
##/subscriptions/3aba1271-ca5f-49e8-9229-2214ec0ac30c/resourceGroups/Demos-acr/providers/Microsoft.ContainerRegistry/registries/aksdemoreg

# Create role assignment
az role assignment create --assignee $CLIENT_ID --role acrpull --scope $ACR_ID


#{
#    "appId": "bc5b5356-890c-4cb9-82c0-7e5748f2eeb3",
#    "displayName": "azure-cli-2019-02-01-22-38-37",
#    "name": "http://azure-cli-2019-02-01-22-38-37",
#    "password": "43867148-5870-40bc-b9c1-b4eb24707a1e",
#    "tenant": "72f988bf-86f1-41af-91ab-2d7cd011db47"
#  }

#az aks create --resource-group demo-aks --name csucsaaks-cli --node-count 1 --service-principal bc5b5356-890c-4cb9-82c0-7e5748f2eeb3 --client-secret 43867148-5870-40bc-b9c1-b4eb24707a1e --generate-ssh-keys