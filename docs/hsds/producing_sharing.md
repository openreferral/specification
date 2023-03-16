Publication Guidance
====================

```{note}
This page is *non-normative*, which means that it doesn't form part of the standard; if there is any ambiguity, the standard takes precedence. This page may be updated at any time in response to community demand.
```

## Guidance on Mapping Fields and Values

Source data may or may not map directly to the HSDS. Guidelines are listed below to reduce ambiguity.

* A null value is acceptable for required fields.
* If there are no values for an entity, the corresponding CSV file can be omitted.
* A data source may have a field that can map to an HSDS field but in many cases are not populated. A null value is acceptable.
* In some cases, such as name, using the organization name for either or both location or service is acceptable. This is up to the discretion of the data producer.
* Mapping a field is at the data producer’s discretion, but it is acceptable for some entities to map to multiple entities, for example an organization, service, or location can have a contact.
* The HSDS is a baseline of data elements; if the data producer has additional fields or entities that they wish to add, the specification can be extended to incorporate them. The data producer should provide documentation that explains how the specification has been extended.

## Files & Attributes Summary

The files and their associated attributes are [listed on the schema reference page](schema_reference.md).

## Sharing Your Changes

If the additional information that you're providing is of use to a wider community, then it may be helpful to share details with others. See the [Extending HSDS](extending.md) for information on how to do that. 
