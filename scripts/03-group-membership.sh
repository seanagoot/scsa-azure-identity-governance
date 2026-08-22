#!/bin/bash

GROUP_NAME="SCSA-Cloud-Readers"
USER_PRINCIPAL_NAME="scsa.reader.lab@seanagootgmail.onmicrosoft.com"

GROUP_ID=$(az ad group show \
  --group "$GROUP_NAME" \
  --query id \
  --output tsv)

USER_ID=$(az ad user show \
  --id "$USER_PRINCIPAL_NAME" \
  --query id \
  --output tsv)

az ad group member add \
  --group "$GROUP_ID" \
  --member-id "$USER_ID"
