#!/usr/bin/env bash
mysql -NBe "SHOW GRANTS FOR '$1'@'%';"
