#!/bin/bash

set -e

# This script assumes you have:
# * Postgres client tools installed
#      Ubuntu: sudo apt-get install -y postgresql-client libpq-dev
# * The Python libraries in requirements_build_database.in installed
# * A Postgres database server running locally
# * The postgres user password for it is in the environmental variable POSTGRESQL_PASSWORD
# * A database called 'test' can be created and used
#
# If you don't have a server running locally, Docker is a good way to do this. Run:
#    docker run -d --name openreferral-database-dump-postgresql -e POSTGRES_PASSWORD=$POSTGRESQL_PASSWORD --publish 5432:5432/tcp postgres:12
# Make sure the version of the server matches the version of the client libraries you have installed, or pg_dump will fail.

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
PGPASSWORD=$POSTGRESQL_PASSWORD psql -h 127.0.0.1 -p 5432 -U postgres -w -c "CREATE DATABASE test"

# Create the schema
echo "CREATE THE SCHEMA"
code="from frictionless import Package
package = Package('tmp_datapackage_for_database_schemas/datapackage.json')
package.to_sql('postgresql://postgres:$POSTGRESQL_PASSWORD@127.0.0.1:5432/test')"
echo -e "$code" | python

# Dump
echo "DUMP THE SCHEMA"
PGPASSWORD=$POSTGRESQL_PASSWORD pg_dump -h 127.0.0.1 -p 5432 -U postgres --no-password -f database/database_postgresql.sql --schema-only test

# Remove dumped lines
echo "EDIT THE SCHEMA"
sed -i '/^\-\- Dumped by /d' database/database_postgresql.sql
sed -i '/^\-\- Dumped from /d' database/database_postgresql.sql
