#!/bin/bash
VERSION=$(grep "^version:" snapcraft.yaml| grep -o "[0-9]*\.[0-9]*\.[0-9]*")
NEXT="$(echo $VERSION| awk -F. '{print $1"."$2}')".$(( $(echo $VERSION| awk -F. '{print $3}') + 1 ))
echo "Building version $NEXT"
sed -i "s/version: .*/version: '$NEXT'/" snapcraft.yaml
#snapcraft clean ibdfw -s pull
snapcraft
rm -rf parts/ prime/ stage/
