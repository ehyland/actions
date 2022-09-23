#!/bin/bash

set -euxo pipefail

cd "$(dirname $0)/.."

LATEST=$(curl https://api.github.com/repos/docker/compose/releases/latest | yq '.tag_name')
VERSION_2_RX='^v2\.[0-9]+\.[0-9]+$'

echo "Latest is ${LATEST}"


if [[ "$LATEST" =~ $VERSION_2_RX ]]; then
  echo "$LATEST" > "./VERSION"
else
  echo "Skipping update as latest does not match ${VERSION_2_RX}"
fi

