Identifiers
===========

```{note}
This page is *non-normative*, which means that it doesn't form part of the standard; if there is any ambiguity, the standard takes precedence. This page may be updated at any time in response to community demand.
```

The HSDS specification contains a lot of identifiers; this guide explains what they're for and what good practice looks like around using them. 

## id fields

Each table in HSDS has an id field; as HSDS is designed to map onto a relational database, it's a way of uniquely identifying every row in a table. For example, a service has an id, which service_at_location refers to as service_id. These IDs generally don't have an external meaning, but are used within the data for tables to reference each other via foreign keys. 

The organization table is a special case; because identifying organizations is a complex area, the standard stipulates that UUIDs must be used so as to prevent the use of external identifiers. This avoids, for example, issues such as companies changing their legal status and causing data quality issues as a result.

