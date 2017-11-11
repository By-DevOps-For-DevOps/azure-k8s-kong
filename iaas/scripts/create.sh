#!/usr/bin/env bash

set -x -e

WHITELISTED_IP=$(curl https://ifconfig.co)

# AUTH
az login --service-principal -u ${AZURE_CLIENT_ID} --password ${AZURE_CLIENT_SECRET} --tenant ${AZURE_TENANT_ID}
az account set --subscription ${AZURE_SUBSCRIPTION_ID}

# RESOURCEGROUP
az group create --name ${ENV_NAME} --location ${AZURE_LOCATION}

# VAULT
az keyvault create --name ${ENV_NAME} --resource-group ${ENV_NAME} --location ${AZURE_LOCATION} --enabled-for-template-deployment true

# SSH private/public key (without prompt)
ssh-keygen -t rsa -b 2048 -f ${ENV_NAME}.pem -q -P "" -C "AZ-key"

az keyvault secret set --vault-name ${ENV_NAME} --name "VM-ADMIN-PUBLIC-KEY" -f "${ENV_NAME}.pem.pub"
az keyvault secret set --vault-name ${ENV_NAME} --name 'VM-ADMIN-PRIVATE-KEY' -f "${ENV_NAME}.pem"


###################### K8S #####################################
az aks create -g ${ENV_NAME} -n ${K8S_CLUSTER_NAME} --agent-count ${K8S_AGENT_COUNT} --generate-ssh-keys
#--agent-vm-size 'Standard_D3_v2' \
#--kubernetes-version '1.8.1'

az aks install-cli
az aks get-credentials -g ${ENV_NAME} -n ${K8S_CLUSTER_NAME}
kubectl get nodes

