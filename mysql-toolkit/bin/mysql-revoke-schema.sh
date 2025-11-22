#!/usr/bin/env bash
mysql -e "REVOKE ALL PRIVILEGES ON \`$1\`.* FROM '$2'@'%'; FLUSH PRIVILEGES;"
