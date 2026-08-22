#!/bin/bash

GROUP_NAME="SCSA-Cloud-Readers"
MAIL_NICKNAME="SCSACloudReaders"

az ad group create \
  --display-name "$GROUP_NAME" \
  --mail-nickname "$MAIL_NICKNAME"
