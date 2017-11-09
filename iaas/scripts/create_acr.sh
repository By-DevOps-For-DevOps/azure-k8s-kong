#!/usr/bin/env bash

az acr create --resource-group ${ENV_NAME} --name ${ENV_NAME//-/} --sku ${AZURE_CONTAINER_REGISTRY_SKU}