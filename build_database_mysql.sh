#!/bin/bash

set -e

# This script assumes you have:
# * Mysql client tools installed
# * The Python libraries in requirements_build_database.in installed
# * A Mysql database server running locally
# * The root password for it is in the environmental variable MYSQL_ROOT_PASSWORD
# * A database called 'test' can be created and used
#
# If you don't have a server running locally, Docker is a good way to do this. Run:
#    docker run -d --name openreferral-database-dump-mysql -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD  --publish 3306:3306/tcp  mysql:8.0


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

# Create a database
echo "CREATE A DATABASE"
mysql -h 127.0.0.1 -P 3306 -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE test"

# Create the schema
echo "CREATE THE SCHEMA"
code="from frictionless import Package
package = Package('tmp_datapackage_for_database_schemas/datapackage.json')
package.publish('mysql://root:$MYSQL_ROOT_PASSWORD@127.0.0.1:3306/test')"
echo -e "$code" | python

# Dump
echo "DUMP THE SCHEMA"
mysqldump -h 127.0.0.1 -P 3306 -u root -p$MYSQL_ROOT_PASSWORD --result-file=database/database_mysql.sql --no-data test

# Remove dumped lines
echo "EDIT THE SCHEMA"
sed -i '/^\-\- Dump completed on/d' database/database_mysql.sql
sed -i '/^\-\- Server version/d' database/database_mysql.sql
sed -i '/^\-\- Host/d' database/database_mysql.sql
sed -i '/^\-\- MySQL dump/d' database/database_mysql.sql
