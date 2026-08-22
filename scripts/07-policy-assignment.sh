#!/bin/bash

RESOURCE_GROUP="rg-scsa-backup-krc"
ASSIGNMENT_NAME="policy-scsa-require-environment-tag"

az provider register \
  --namespace Microsoft.PolicyInsights

POLICY_NAME=$(az policy definition list \
  --query "[?displayName=='Require a tag on resources'].name | [0]" \
  --output tsv)

RG_SCOPE=$(az group show \
  --name "$RESOURCE_GROUP" \
  --query id \
  --output tsv)

az policy assignment create \
  --name "$ASSIGNMENT_NAME" \
  --display-name "SCSA Require Environment Tag" \
  --policy "$POLICY_NAME" \
  --scope "$RG_SCOPE" \
  --params '{"tagName":{"value":"Environment"}}' \
  --enforcement-mode DoNotEnforce
