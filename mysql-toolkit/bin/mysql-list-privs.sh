#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Usage: $0 <user> [host]"
    exit 1
fi

USER="$1"
HOST="${2:-%}"

mysql -NBe "SHOW GRANTS FOR '${USER}'@'${HOST}';"
