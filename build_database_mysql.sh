#!/bin/bash

set -e

# Vars
if [[ -z "${GITHUB_ACTIONS}" ]]; then
  mode="Dev"
  export_file_name='database_mysql.sql'
else
  mode="GHA"
  export_file_name="compare.sql"
fi

# get ready temp dir
echo "READY TEMP DIRECTORY"
mkdir -p tmp_datapackage_for_database_schemas

# make datapackage
echo "MAKE DATAPACKAGE"
code="import os
import sys
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(BASE_DIR,'python'))
import openreferral.utils
openreferral.utils.build_blank_datapackage_for_database_schemas(os.path.join(BASE_DIR, 'datapackage.json'),os.path.join(BASE_DIR, 'tmp_datapackage_for_database_schemas'))"
echo -e "$code" | python

if [[ "$mode" == "Dev" ]]
then

# Create a shared docker network
echo "CREATE DOCKER NETWORK"
docker network create -d bridge openreferral-database-dump-mysql

# Start a Database server
echo "CREATE DATABASE SERVER"
docker run -d --name openreferral-database-dump-mysql -e MYSQL_ROOT_PASSWORD=1234  --publish 13306:3306/tcp -d  \
  --network=openreferral-database-dump-mysql  --network-alias=server \
  --health-cmd="/usr/bin/mysql -h 127.0.0.1 --user=root --password=1234 --execute \"SHOW DATABASES;\"" --health-interval=5s  --health-timeout=5s --health-retries=20 \
    mysql:8.0

# Wait till server has started
echo "WAITING FOR DATABASE SERVER"
until [ "`docker inspect -f {{.State.Health.Status}} openreferral-database-dump-mysql`" == "healthy" ]
do
  sleep 1
done

# Create a database
echo "CREATE A DATABASE"
docker run --rm --network openreferral-database-dump-mysql mysql:8.0 \
  mysql -h server -P 3306 -u root -p1234 -e "CREATE DATABASE test"

# Create the schema
echo "CREATE THE SCHEMA"
code="from frictionless import Package
package = Package('tmp_datapackage_for_database_schemas/datapackage.json')
package.to_sql('mysql://root:1234@127.0.0.1:13306/test')"
echo -e "$code" | python

# Dump
echo "DUMP THE SCHEMA"
docker run --rm --network openreferral-database-dump-mysql  \
  --mount type=bind,source="$(pwd)"/database,target=/database mysql:8.0 \
  mysqldump -h server -P 3306 -u root -p1234 --result-file=/database/$export_file_name --no-data test

else

# Create a database
echo "CREATE A DATABASE"
mysql -h 127.0.0.1 -P 3306 -u root -p1234 -e "CREATE DATABASE test"

# Create the schema
echo "CREATE THE SCHEMA"
code="from frictionless import Package
package = Package('tmp_datapackage_for_database_schemas/datapackage.json')
package.to_sql('mysql://root:1234@127.0.0.1:3306/test')"
echo -e "$code" | python

# Dump
echo "DUMP THE SCHEMA"
mysqldump -h 127.0.0.1 -P 3306 -u root -p1234 --result-file=database/$export_file_name --no-data test

fi

# Remove dumped lines
echo "EDIT THE SCHEMA"
sed -i '/^\-\- Dump completed on/d' database/$export_file_name
sed -i '/^\-\- Server version/d' database/$export_file_name
sed -i '/^\-\- Host/d' database/$export_file_name
sed -i '/^\-\- MySQL dump/d' database/$export_file_name
# https://github.com/openreferral/specification/issues/263
sed -i 's/\Wyear\_incorporated\W date/year\_incorporated INTEGER/'  database/$export_file_name

