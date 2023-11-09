Mapping Data to HSDS
====================

```{note}
This page is *non-normative*, which means that it doesn't form part of the standard; if there is any ambiguity, the standard takes precedence. This page may be updated at any time in response to community demand.
```

Source data may or may not map directly to the HSDS. Guidelines are listed below to reduce ambiguity.


* Additional data without a corresponding object or properties in HSDS can be incorporated as an additional property. See [Extending HSDS](extending) for guidance, and the [Conformance](conformance) section of the reference for more details. Publishers should document any additional properties or extensions to HSDS so that people can use their data effectively.
* For a given record, if there is no value for a particular property then that property should be omitted in the published JSON data unless the field is *Required* by the standard (see [Schema Reference](schema_reference)). It's preferable to omit a property rather than include an empty value or `null` in JSON. For [Tabular Data Package serializations](serialization.md#tabular-data-package), properties may have a `null` value.
* For Tabular Data Package serializations, if there are no records for a particular type of object then the corresponding CSV file can be omitted entirely. For example if a publication contained no records of [phones](schema_reference.md#phone), then `phones.csv` may be omitted from the publication.
* In some cases an Organization Name may be applicable to each the `organization`, `location`, and/or `service`. In these cases it is acceptable to use the value of the organization name for these records as well, and is up to the discretion of the data producer. These decisions should be documented and provided in an accessible manner so that systems and people using the data understand this decision and context.


