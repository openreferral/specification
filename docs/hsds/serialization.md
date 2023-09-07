Serialization and Publication Formats
====================================

The Human Services Data Specification provides a **structured model** and for capturing and sharing machine-readable information about health, human, and social services.

The current canonical version of this data model is provided by a set of JSON Schema files which describe individual objects in terms of their structures, properties, and definitions. These JSON Schema files also describe the relationships between the different objects that make up the HSDS data model. Compliance of data with HSDS should be assessed against these schemas.

Prior to version 3.0 HSDS was defined and exchanged using the [Frictionless Data Package Specification](https://specs.frictionlessdata.io/data-package/). Although the canonical format of HSDS is JSON since version 3.0, there is still support for Data Packages through the [Tabular Data Package](https://specs.frictionlessdata.io/tabular-data-package/#specification) serialization compiled from the canonical JSON schema files. This means that publishers can choose to publish and exchange HSDS data in a Tabular Data Package format.

Other serializations of HSDS (e.g. XML, etc.) are not considered conformant to HSDS.

## JSON

Publishers should consider publishing HSDS in JSON format where possible.

JSON is widely considered a de facto standard for exchanging data on the web. The JSON Schema language provides features to define JSON data models which can be used for validating datasets. The canonical format for HSDS since version 3.0 is JSON, and the canonical schemas are defined in JSON Schema.

The HSDS JSON schemas along with example data are provided in the [Schema Reference](schema_reference).

### Dereferencing

HSDS JSON should be dereferenced when published. JSON data is structured as a tree with data elements nested inside each other.

The canonical HSDS Schemas are modular with multiple schemas each defining a single object. Where there is a relationship between objects, they make use of JSON Schema's `$ref` keyword to refer to another schema. For example, `organization.json` has the property `locations` which is an array of Locations. Locations are defined in `location.json`, so this array refers directly to the `location.json` as the canonical source of the Location data model. Publishers should embed the location data, conformant to the model defined in `location.json`, as an item in the `locations` array.

Publishers may find the [compiled schemas](https://github.com/openreferral/specification/tree/3.0/schema/compiled) useful. These are generated directly from the canonical HSDS JSON schemas and provide a fully de-referenced JSON schema for various representations of the HSDS data model (e.g. a Service-oriented view, an Organization-oriented view). The compiled schemas are not considered canonical themselves, though, and are generated to provide utility to publishers and tools working with HSDS JSON data.

### Serializing HSDS JSON for APIs

There are additional considerations for publishing HSDS JSON through an API.

Due to the nature of HSDS' data model, the canonical HSDS JSON Schemas do not provide an official packaging format for publishing or exchanging multiple records in a single file. To provide this function in HSDS APIs, the [API Reference](api_reference) provides an embedded `Page` schema which is used in several endpoints. `Page` is documented on the [API Reference](api_reference.md#lists)

`Page` is not considered part of the HSDS 3.0 data model, but it is part of the API Reference. Therefore publishers seeking compliance with the HSDS 3.0 API Reference should ensure that they are using this correctly.

## Tabular Data Package

HSDS may also be serialized as a [Tabular Data Package](https://specs.frictionlessdata.io/tabular-data-package/#specification). In this serialization, data is published using a series of CSV files (one per object) and accompanied by a package descriptor in JSON format with the filename `datapackage.json`.

Instead of dereferencing and embedding objects such as in the canonical JSON serialization, each object can refer to others via its `id` property in the appropriate column. This makes `id` behave like a foreign key in this serialization.

We provide an existing package descriptor generated directly from the canonical HSDS JSON Schema files. It is available [here](../../datapackage.json) and contains details of field names and file names for this serialization. Publishers should use this to support their Tabular Data Package serialization rather than develop their own `datapackage.json` file. Examples CSV files are available in the HSDS Github repo [here](https://github.com/openreferral/specification/tree/3.0/examples/csv).

Prior to HSDS 3.0, Tabular Data Packages were the primary publication format for HSDS data.
