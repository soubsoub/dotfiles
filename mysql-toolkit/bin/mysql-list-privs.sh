#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <user>" >&2
    exit 1
fi

USER="$1"
mysql -NBe "SHOW GRANTS FOR '${USER}'@'%';"
