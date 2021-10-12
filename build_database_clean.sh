#!/bin/bash

set -e

# temp dir
rm tmp_datapackage_for_database_schemas/datapackage.json | true
rm tmp_datapackage_for_database_schemas/*.csv | true

# Docker
docker stop openreferral-database-dump-mysql | true
docker rm openreferral-database-dump-mysql | true
docker network rm openreferral-database-dump-mysql | true

