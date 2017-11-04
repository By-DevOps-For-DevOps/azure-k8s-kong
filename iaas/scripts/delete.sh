#!/usr/bin/env bash

# AUTH
az login --service-principal -u $AZURE_CLIENT_ID --password $AZURE_CLIENT_SECRET --tenant $AZURE_TENANT_ID
az account set --subscription $AZURE_SUBSCRIPTION_ID

# Delete RG
az group delete -n $ENV_NAME -y
