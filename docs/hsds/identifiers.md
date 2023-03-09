Identifiers
===========

```{note}
This page is *non-normative*, which means that it doesn't form part of the standard; if there is any ambiguity, the standard takes precedence. This page may be updated at any time in response to community demand.
```

The HSDS specification contains a lot of identifiers; this guide explains what they are for and what good practice looks like around using them. 

## `id` fields

Each table in HSDS has an `id` field; as HSDS is designed to map onto a relational database, an `id` is a way of uniquely identifying every row in a table. For example, a `service` has an `id`, which `service_at_location` refers to as `service_id`. These IDs generally don't have an external meaning, but are used within the data for tables to reference each other via foreign keys. 

The standard stipulates that universally unique identifiers (UUIDs) must be used for all `id` fields and foreign keys. A number of web-based and command line tools are available to generate UUIDs, for example [Online UUID Generator](https://www.uuidgenerator.net/).

## Third-party identifiers
HSDS data can also include information on third-party identifiers, which link organizations or locations to the real world. For the sake of clarity, HSDS uses `identifer` in column names that refer to third-party identifiers.

To illustrate with an example: The `organization_identifier` table is used to capture information about third-party identifiers for organizations. This table has both `id` and `identifier` fields. `id` used to define the **row** in the `organization_identifier` table, while `identifier` is used to describe the value of the third-party identifier itself.