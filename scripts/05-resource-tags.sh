#!/bin/bash

RESOURCE_GROUP="rg-scsa-backup-krc"

az group update \
  --name "$RESOURCE_GROUP" \
  --set tags.Company=SCSA \
        tags.Environment=Lab \
        tags.ManagedBy=CloudOps \
        tags.Project=Project6
