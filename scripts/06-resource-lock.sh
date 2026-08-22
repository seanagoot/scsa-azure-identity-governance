#!/bin/bash

RESOURCE_GROUP="rg-scsa-backup-krc"
VAULT_NAME="rsv-scsa-backup-krc"
LOCK_NAME="lock-scsa-backup-vault"

az lock create \
  --name "$LOCK_NAME" \
  --lock-type CanNotDelete \
  --resource-group "$RESOURCE_GROUP" \
  --resource-name "$VAULT_NAME" \
  --resource-type Microsoft.RecoveryServices/vaults
