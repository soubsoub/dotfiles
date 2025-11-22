#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <schema> <user>" >&2
    exit 1
fi

SCHEMA="$1"
USER="$2"

mysql -e "REVOKE ALL PRIVILEGES ON \`$SCHEMA\`.* FROM '${USER}'@'%'; FLUSH PRIVILEGES;"
