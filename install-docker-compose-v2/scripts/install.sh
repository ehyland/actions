#!/bin/bash

set -euxo pipefail

cd "$(dirname $0)/.."

VERSION="$(cat ./VERSION)"
INSTALL_PATH="$HOME/.local/bin/docker-compose"
DOWNLOAD_URL="https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m)"

# create bin dir
mkdir -p "$(dirname $INSTALL_PATH)" || true

# download
curl -fsSL "$DOWNLOAD_URL" -o "$INSTALL_PATH"

# fix perms
chmod +x "$INSTALL_PATH"