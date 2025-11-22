#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <schema> <user>" >&2
    exit 1
fi

# revoke script…
