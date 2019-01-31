#!/bin/bash

AKS_RESOURCE_GROUP=demo-aks
AKS_CLUSTER_NAME=csucsaaks
ACR_RESOURCE_GROUP=Demos-acr
ACR_NAME=aksdemoreg

# Get the id of the service principal configured for AKS
CLIENT_ID=$(az aks show --resource-group "demo-aks" --name "csucsaaks" --query "servicePrincipalProfile.clientId" --output tsv)
#46718843-f53a-42de-aceb-9061d5709277

# Get the ACR registry resource id
ACR_ID=$(az acr show --name aksdemoreg --resource-group Demos-acr --query "id" --output tsv)
##/subscriptions/3aba1271-ca5f-49e8-9229-2214ec0ac30c/resourceGroups/Demos-acr/providers/Microsoft.ContainerRegistry/registries/aksdemoreg

# Create role assignment
az role assignment create --assignee 46718843-f53a-42de-aceb-9061d5709277 --role acrpull --scope /subscriptions/3aba1271-ca5f-49e8-9229-2214ec0ac30c/resourceGroups/Demos-acr/providers/Microsoft.ContainerRegistry/registries/aksdemoreg