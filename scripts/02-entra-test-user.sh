#!/bin/bash

DISPLAY_NAME="SCSA Reader Lab"
USER_PRINCIPAL_NAME="scsa.reader.lab@seanagootgmail.onmicrosoft.com"

# Set a temporary password before running this script.
# Do not store real passwords in GitHub.
TEMP_PASSWORD="<TEMP_PASSWORD>"

az ad user create \
  --display-name "$DISPLAY_NAME" \
  --user-principal-name "$USER_PRINCIPAL_NAME" \
  --password "$TEMP_PASSWORD" \
  --force-change-password-next-sign-in true
