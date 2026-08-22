#!/bin/bash

RESOURCE_GROUP="rg-scsa-backup-krc"
VAULT_NAME="rsv-scsa-backup-krc"
ASSIGNMENT_NAME="policy-scsa-require-environment-tag"

# Trigger policy evaluation
az policy state trigger-scan \
  --resource-group "$RESOURCE_GROUP"

# Check current compliance
az policy state list \
  --resource-group "$RESOURCE_GROUP" \
  --query "[?policyAssignmentName=='$ASSIGNMENT_NAME'].{Resource:resourceId,Compliance:complianceState}" \
  --output table
