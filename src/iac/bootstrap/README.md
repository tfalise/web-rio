# Initialiazing terraform for env

## Create global managed identity


## Create bootstrap resource group

az group create --name "rg-webrio-bootstrap" --location westeurope --subscription $env:ARM_SUBSCRIPTION_ID

## Create global tf state storage account

az storage account create –-name $env:TF_STORAGE_NAME –-resource-group "rg-webrio-bootstrap" –-location WestEurope –sku Standard_LRS

## Create env tf state container
$accountKey = az storage account keys list --resource-group "rg-webrio-bootstrap" --account-name $env:TF_STORAGE_NAME --subscription $env:ARM_SUBSCRIPTION_ID --query '[0].value' -o tsv

az storage container create --name $env:TF_STATE_CONTAINER --account-name $env:TF_STORAGE_NAME --subscription $env:ARM_SUBSCRIPTION_ID --account-key $accountKey