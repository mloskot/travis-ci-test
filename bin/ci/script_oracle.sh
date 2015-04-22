#!/bin/bash

# Load Oracle environment variables so that we could run `sqlplus`.
. /usr/lib/oracle/xe/app/oracle/product/10.2.0/server/bin/oracle_env.sh
echo "ORACLE_HOME=${ORACLE_HOME}"
echo "ORACLE_SID=${ORACLE_SID}"

echo "Connecting using username/password"
echo "SELECT * FROM product_component_version;" | \
sqlplus -S -L travis/travis

echo "Connecting using username/password@XE"
echo "SELECT * FROM product_component_version;" | \
sqlplus -S -L travis/travis@XE
