#!/bin/bash
set -eux

function cleanup {
    rm tmp_schema_with_additional_properties_false_everywhere.json
}

trap cleanup EXIT

function validate {
    compiletojsonschema --set-additional-properties-false-everywhere schema/$schema.json > tmp_schema_with_additional_properties_false_everywhere.json
    check-jsonschema examples/$example.json --schemafile tmp_schema_with_additional_properties_false_everywhere.json
}

# example=base schema= validate
example=location schema=location validate
example=organization_full schema=compiled/organization validate
example=service_at_location_full schema=compiled/service_at_location validate
example=service_full schema=compiled/service validate
# tabular
example=taxonomy schema=taxonomy validate
example=taxonomy_term schema=taxonomy_term validate
