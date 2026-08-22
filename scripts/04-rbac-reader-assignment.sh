#!/bin/bash

GROUP_NAME="SCSA-Cloud-Readers"
RESOURCE_GROUP="rg-scsa-backup-krc"

GROUP_ID=$(az ad group show \
  --group "$GROUP_NAME" \
  --query id \
  --output tsv)

RG_SCOPE=$(az group show \
  --name "$RESOURCE_GROUP" \
  --query id \
  --output tsv)

az role assignment create \
  --assignee-object-id "$GROUP_ID" \
  --assignee-principal-type Group \
  --role "Reader" \
  --scope "$RG_SCOPE"
