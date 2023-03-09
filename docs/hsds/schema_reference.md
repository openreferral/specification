```{eval-rst}
.. _hsds-spec:
```

Schema Reference
==============

The Human Services Data Specification defines a set of objects and the relationships between them.

This page provides the canonical definition of each object and its required or optional fields. It is used to validate the structure and format of HSDS data. Schema files for each object in HSDS are also available as [JSON schema](https://json-schema.org/) from the [HSDS GitHub repository](https://github.com/openreferral/specification/tree/3.0-dev/schema).

HSDS data can also be serialized as a [Tabular Data Package](http://specs.frictionlessdata.io/tabular-data-package/) consisting of CSV files for each of the objects required, and a [package descriptor (datapackage.json)](http://specs.frictionlessdata.io/tabular-data-package/#specification) file adapted from the current [HSDS specification](../../datapackage.json) to include any additional fields and metadata from the data publisher.

## Names and descriptions

Locations, Services and Organizations all have ```name``` and ```description``` field that can contain free text. 

A ```name``` and ```alternate_name``` field should only ever include plain text, without formatting.

A ```description``` field may include HTML elements or [Markdown](https://en.wikipedia.org/wiki/Markdown), with special characters escaped or encoded. 

Consuming applications that expect plain-text only should strip HTML tags  from these fields. 

Publishers should also be aware that some applications may wish to extract a 'short description' from the ```description``` field, and may do so by looking for the first full sentence, or first line-break. 

## Objects and fields

### service

`service` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /description
```

Each `service` object has the following fields:

::::{tab-set}

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:collapse: phones,schedules,service_areas,service_at_locations,languages,organization,funding,cost_options,program,required_documents,contacts,attributes,metadata
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



### phone

`phone` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/phone/description
```

Each `phone` object has the following fields:

::::{tab-set}

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/phone
:collapse: languages,attributes,metadata

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

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/schedule
:collapse: attributes,metadata

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

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/service_area
:collapse: attributes,metadata

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



### service_at_location

`service_at_location` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/service_at_location/description
```

Each `service_at_location` object has the following fields:

::::{tab-set}

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/service_at_location
:collapse: contacts,phones,schedules,location,attributes,metadata

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

### location

`location` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/location/description
```

Each `location` object has the following fields:

::::{tab-set}

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/location
:collapse: languages,addresses,contacts,accessibility,phones,schedules,attributes,metadata

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


### language

`language` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/language/description
```

Each `language` object has the following fields:

::::{tab-set}

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/language
:collapse: attributes,metadata

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


### organization

`organization` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/organization/description
```

Each `organization` object has the following fields:

::::{tab-set}

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/organization
:collapse: funding,contacts,phones,locations,programs,organization_identifiers,attributes,metadata

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


### funding

`funding` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/funding/description
```

Each `funding` object has the following fields:

::::{tab-set}

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/funding
:collapse: attributes,metadata

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


### cost_option

`cost_option` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/cost_option/description
```

Each `cost_option` object has the following fields:

::::{tab-set}

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/cost_option
:collapse: attributes,metadata

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

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/program
:collapse: attributes,metadata

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

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/required_document
:collapse: attributes,metadata

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

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/contact
:collapse: phones,attributes,metadata

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


### attribute

`attribute` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/attribute/description
```

Each `attribute` object has the following fields:

::::{tab-set}

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/attribute
:collapse: taxonomy_term,metadata

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


### metadata

`metadata` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/metadata/description
```

Each `metadata` object has the following fields:

::::{tab-set}

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/metadata

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

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/meta_table_description
:collapse: attributes,metadata

```

:::

:::{tab-item} Example

In development

:::

::::

### taxonomy

`taxonomy` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/taxonomy/description
```

Each `taxonomy` object has the following fields:

::::{tab-set}

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/taxonomy
:collapse: metadata

```

:::

:::{tab-item} Example

In development

:::

::::

### taxonomy_term

`taxonomy_term` is defined as:

```{jsoninclude-quote} ../../schema/compiled/service_with_definitions.json
:jsonpointer: /definitions/taxonomy_term/description
```

Each `taxonomy_term` object has the following fields:

::::{tab-set}

:::{tab-item} Schema

```{jsonschema} ../../schema/compiled/service_with_definitions.json
:pointer: /definitions/taxonomy_term
:collapse: metadata

```

:::

:::{tab-item} Example

In development

:::

::::