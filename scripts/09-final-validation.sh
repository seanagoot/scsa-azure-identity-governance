#!/bin/bash

GROUP_NAME="SCSA-Cloud-Readers"
RESOURCE_GROUP="rg-scsa-backup-krc"
VAULT_NAME="rsv-scsa-backup-krc"
ASSIGNMENT_NAME="policy-scsa-require-environment-tag"

GROUP_ID=$(az ad group show \
  --group "$GROUP_NAME" \
  --query id \
  --output tsv)

RG_SCOPE=$(az group show \
  --name "$RESOURCE_GROUP" \
  --query id \
  --output tsv)

ROLE=$(az role assignment list \
  --assignee "$GROUP_ID" \
  --scope "$RG_SCOPE" \
  --query "[0].roleDefinitionName" \
  --output tsv)

echo "RBAC Role: $ROLE"

az group show \
  --name "$RESOURCE_GROUP" \
  --query "{Company:tags.Company,Environment:tags.Environment,ManagedBy:tags.ManagedBy,Project:tags.Project}" \
  --output table

az lock list \
  --resource-group "$RESOURCE_GROUP" \
  --resource-name "$VAULT_NAME" \
  --resource-type Microsoft.RecoveryServices/vaults \
  --query "[].{LockName:name,LockType:level}" \
  --output table

COMPLIANCE=$(az policy state list \
  --resource-group "$RESOURCE_GROUP" \
  --query "[?policyAssignmentName=='$ASSIGNMENT_NAME'] | [0].complianceState" \
  --output tsv)

echo "Policy Compliance: $COMPLIANCE"
