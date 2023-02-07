```{eval-rst}
.. _hsds-spec:
```

HSDS Reference
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


```{eval-rst}
.. jsontableschemainclude:: ../datapackage.json
```
 
