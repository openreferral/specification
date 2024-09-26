Schema Reference
================

The Human Services Data Specification defines a set of objects and the relationships between them. The HSDS Schema provides the authoritative definition of these objects and their required and optional fields. It is used to validate the structure and format of HSDS data. 

This page provides, for each object in HSDS:

- A reference table of required and optional field names, field descriptions and field formats
- A JSON schema
- Some example data.

For information on how to design API platforms to provide access to HSDS data, see the [API Reference](api_reference).

For information on how to format HSDS data, including how to publish a tabular Data Package of HSDS data, see the [Serialization and Publication Formats](serialization).

## Schema structure

HSDS data is not hierarchichal in the sense that it does not have a single top-level object. Rather, HSDS consists of a set of core objects, with additional information held in separate objects (see [Overview](overview) for more details). For this reason, there is no single HSDS schema, but rather a separate schema for each object. In addition to being provided below, schema files for each object in HSDS are available as [JSON schema](https://json-schema.org/) from the [HSDS GitHub repository](https://github.com/openreferral/specification/tree/3.0/schema).

Compiled schemas and example data, containing all HSDS objects, may be useful to publishers for a number of reasons. A number of compiled schema and example files are available from the [schema](https://github.com/openreferral/specification/tree/3.0/schema) and [examples](https://github.com/openreferral/specification/tree/3.0/examples) directories on the HSDS Github repository.

## Core Objects


### organization

`organization` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/organization/description
```

Each `organization` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/organization
:collapse: funding,contacts,phones,locations,programs,organization_identifiers,attributes,metadata,additional_websites
```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/organization.json
    :jsonpointer:
    :title: organization
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer: /organization
    :title: organization
```
:::

::::

### service

`service` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /description
```

Each `service` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:collapse: phones,schedules,service_areas,service_at_locations,languages,organization,funding,cost_options,program,required_documents,contacts,attributes,metadata,additional_urls
```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/service.json
    :jsonpointer:
    :title: service
```
:::

:::{tab-item} Example

```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer:
    :title: service
```
:::

::::

### location

`location` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/location/description
```

Each `location` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/location
:collapse: languages,addresses,contacts,accessibility,phones,schedules,attributes,metadata

```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/location.json
    :jsonpointer:
    :title: location
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/organization_full.json
    :jsonpointer: /locations
    :title: location
```
:::

::::

### service_at_location

`service_at_location` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/service_at_location/description
```

Each `service_at_location` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/service_at_location
:collapse: contacts,phones,schedules,location,attributes,metadata

```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/service_at_location.json
    :jsonpointer:
    :title: service_at_location
```
:::

:::{tab-item} Example

```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer: /service_at_locations
    :title: service_at_location
```

:::

::::

## Other Objects 

### address

`address` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/address/description
```

Each `address` object has the following fields:

::::{tab-set}

:::{tab-item} Fields

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/address
:collapse: attributes,metadata

```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/address.json
    :jsonpointer:
    :title: address:
```
:::

:::{tab-item} Example

```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer: /service_at_locations/0/location/addresses/0
    :title: address
```
:::

::::


### phone

`phone` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/phone/description
```

Each `phone` object has the following fields:

::::{tab-set}

:::{tab-item} Fields

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/phone
:collapse: languages,attributes,metadata

```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/phone.json
    :jsonpointer:
    :title: phone:
```
:::

:::{tab-item} Example

```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer: /phones
    :title: phone
```
:::

::::


### schedule

`schedule` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/schedule/description
```

Each `schedule` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/schedule
:collapse: attributes,metadata

```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/schedule.json
    :jsonpointer:
    :title: schedule
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer: /schedules
    :title: schedule
```
:::

::::


### service_area

`service_area` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/service_area/description
```

Each `service_area` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/service_area
:collapse: attributes,metadata

```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/service_area.json
    :jsonpointer:
    :title: service_area
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer: /service_areas
    :title: service_area
```
:::

::::

### language

`language` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/language/description
```

Each `language` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/language
:collapse: attributes,metadata

```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/language.json
    :jsonpointer:
    :title: language
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer: /languages
    :title: language
```
:::

::::


### funding

`funding` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/funding/description
```

Each `funding` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/funding
:collapse: attributes,metadata
```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/funding.json
    :jsonpointer:
    :title: funding
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer: /funding
    :title: funding
```
:::

::::

### accessibility

`accessibility` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/accessibility/description
```

Each `accessibility` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/accessibility
:collapse: attributes,metadata
```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/accessibility.json
    :jsonpointer:
    :title: accessibility
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/location.json
    :jsonpointer: /accessibility
    :title: accessibility
```
:::

::::


### cost_option

`cost_option` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/cost_option/description
```

Each `cost_option` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/cost_option
:collapse: attributes,metadata
```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/cost_option.json
    :jsonpointer:
    :title: cost_option
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer: /cost_options
    :title: cost_option
```
:::

::::


### program

`program` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/program/description
```

Each `program` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/program
:collapse: attributes,metadata

```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/program.json
    :jsonpointer:
    :title: program
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer: /program
    :title: program
```
:::

::::


### required_document

`required_document` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/required_document/description
```

Each `required_document` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/required_document
:collapse: attributes,metadata
```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/required_document.json
    :jsonpointer:
    :title: required_document
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer: /required_documents
    :title: required_document
```
:::

::::


### contact

`contact` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/contact/description
```

Each `contact` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/contact
:collapse: phones,attributes,metadata

```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/contact.json
    :jsonpointer:
    :title: contact
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer: /contacts
    :title: contact
```
:::

::::

### organization_identifier

`organization_identifier` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/organization_identifier/description
```

Each `organization_identifier` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/organization_identifier
:collapse: attributes,metadata
```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/organization_identifier.json
    :jsonpointer:
    :title: organization_identifier
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer: /organization/organization_identifiers
    :title: organization_identifier
```
:::

::::


### attribute

`attribute` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/attribute/description
```

Each `attribute` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/attribute
:collapse: taxonomy_term,metadata

```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/attribute.json
    :jsonpointer:
    :title: attribute
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer: /attributes
    :title: attribute
```

:::

::::

### url

`url` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/url/description
```

Each `url` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/url
:collapse: taxonomy_term,metadata

```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/url.json
    :jsonpointer:
    :title: url
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer: /url
    :title: url
```

:::

::::

### metadata

`metadata` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/metadata/description
```

Each `metadata` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/metadata

```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/metadata.json
    :jsonpointer:
    :title: metadata
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer: /metadata
    :title: metadata
```
:::

::::

### meta_table_description

`meta_table_description` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/meta_table_description/description
```

Each `meta_table_description` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/meta_table_description
:collapse: attributes,metadata
```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/meta_table_description.json
    :jsonpointer:
    :title: meta_table_description
```
:::

::::

### taxonomy

`taxonomy` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/taxonomy/description
```

Each `taxonomy` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/taxonomy
:collapse: metadata

```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/taxonomy.json
    :jsonpointer:
    :title: taxonomy
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/taxonomy.json
    :jsonpointer:
    :title: taxonomy
```
:::

::::

### taxonomy_term

`taxonomy_term` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/taxonomy_term/description
```

Each `taxonomy_term` object has the following fields:

::::{tab-set}

:::{tab-item} Fields
```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/taxonomy_term
:collapse: metadata,taxonomy_detail

```
:::

:::{tab-item} Schema
```{eval-rst}
.. jsoninclude:: ../../schema/taxonomy_term.json
    :jsonpointer:
    :title: taxonomy_term
```
:::

:::{tab-item} Example
```{eval-rst}
.. jsoninclude:: ../../examples/taxonomy_term.json
    :jsonpointer:
    :title: taxonomy_term
```
:::

::::
