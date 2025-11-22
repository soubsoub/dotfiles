#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]; then
    echo "Usage: $0 <schema> <user> [host]"
    exit 1
fi

SCHEMA="$1"
USER="$2"
HOST="${3:-%}"

mysql <<EOF
REVOKE ALL PRIVILEGES ON \`${SCHEMA}\`.* FROM '${USER}'@'${HOST}';
FLUSH PRIVILEGES;
EOF

echo "Revoked privileges on ${SCHEMA} for ${USER}@${HOST}"
