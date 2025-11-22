#!/usr/bin/env bash
mysql -e "GRANT ALL PRIVILEGES ON \`$1\`.* TO '$2'@'%'; FLUSH PRIVILEGES;"
