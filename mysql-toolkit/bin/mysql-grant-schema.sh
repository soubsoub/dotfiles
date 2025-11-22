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
GRANT ALL PRIVILEGES ON \`${SCHEMA}\`.* TO '${USER}'@'${HOST}';
FLUSH PRIVILEGES;
EOF

echo "Granted ALL PRIVILEGES on ${SCHEMA} to ${USER}@${HOST}"
