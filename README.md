# azure-k8s-kong

## Getting Started with AKS

(take from [azure documentation](https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough))
- Configure your `.envrc` (you will need [direnv](https://direnv.net/) to be installed):

```bash
#!/usr/bin/env bash
###################### AZURE ##################################
export AZURE_SUBSCRIPTION_ID="";
export AZURE_TENANT_ID="";
export AZURE_CLIENT_ID="";
export AZURE_CLIENT_SECRET='';
export AZURE_LOCATION="ukwest";
###################### NETWORK #################################
export ENV_NAME=""
###################### K8S #####################################
export K8S_CLUSTER_NAME="kong"
export K8S_AGENT_COUNT=3
```

- Run the folloging command

```bash
➜  azure-k8s-kong git:(master) ./iaas/scripts/create.sh
```