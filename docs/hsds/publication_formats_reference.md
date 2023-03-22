Publication Formats Reference
=============================

This page describes the rules for publishing formats in relation to HSDS data. 

For information on the objects and fields that make up HSDS, see the [Schema Reference](schema_reference). 

For information on how to design API platforms to provide access to HSDS data, se the [API Reference](api_reference).

## JSON

HSDS data should be published in JSON format. JSON is the de facto standard for exchanging data on the web, and the canonical HSDS schemas are in JSON format. JSON schema objects and example data in JSON format are provided on the [Schema Reference](schema_reference) page.

## Tabular Data Package

HSDS data may also be serialized as a [Tabular Data Package](http://specs.frictionlessdata.io/tabular-data-package/) consisting of CSV files for each of the objects required. These CSV files are accompanied by  a [package descriptor (datapackage.json)](http://specs.frictionlessdata.io/tabular-data-package/#specification) to include any additional fields and metadata from the data publisher. To produce a package descriptor in HSDS format you can use the  [HSDS datapackage specification](../../datapackage.json) which is compiled from the canonical JSON schema files. 

For versions of HSDS < 0.3, the tabular data package was the primary publication format for HSDS data.
