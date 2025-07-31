Codelists Reference
=====================

Some schema and API References fields refer to codelists which help interoperability by standardizing and limiting the possible values of fields.

At this moment in time, the Human Services Data Specification only uses a single codelist: the API Required codelist.

## API Endpoint Requirement
This is used to define codes which are then implemented by the OpenAPI file &mdash; representing the [API Reference](api_reference.md) &mdash; as `Tag` objects and then used to tag particular operations defined in the file as required by the specification or not.

This codelist is the result of a knowledge exchange with [CommonGrants](https://commongrants.org/), who implement a similar system to overcome the challenge of using OpenAPI to encode an API Reference.

```eval_rst
.. csv-table:: 
   :file: ../../schema/codelists/api-endpoint-requirement.csv
   :header-rows: 1
   :widths: auto
```
