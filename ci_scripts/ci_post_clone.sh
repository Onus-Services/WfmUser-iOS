#!/bin/bash

echo "Downloading HERE SDK from GitHub Releases..."

DOWNLOAD_URL="https://github.com/Onus-Services/WfmUser-iOS/releases/download/0.0.0.1/heresdk.zip"
DESTINATION="ThirdParty/HERESDK"

# ZIP dosyasını indir
curl -L -o heresdk.zip "$DOWNLOAD_URL"

# ZIP geçerliliğini kontrol et
if unzip -t heresdk.zip >/dev/null 2>&1; then
  echo "Extracting HERE SDK to $DESTINATION ..."
  mkdir -p "$DESTINATION"
  unzip -o heresdk.zip -d "$DESTINATION"
  echo "HERE SDK ready."
else
  echo "Error: heresdk.zip is not a valid zip file!"
fi
