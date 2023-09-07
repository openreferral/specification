Identifiers
===========

Consistent and good quality identifiers are important to ensure that HSDS data is useful and usable. This page contains a reference for where identifiers are used in HSDS and how they should be formatted.

## `id` fields

Each object in HSDS has an `id` property, which should be unique for each record of that type. For example two different `service` objects will contain different values in the `service/id` property. The `id` field is essential to HSDS as it allows the modelling of relationships between objects. This supports storing HSDS data in a relational database, so that they can dereference it for JSON publication. It also supports the Tabular Datapackage serialization of HSDS, where `id` is used as a primary key for identifying a record and as a foreign key to establish the relationship.

HSDS stipulates that the values in all `id` properties must conform to the *Universally Unique Identifier (UUID)* format. UUID is defined by [RFC 4122](https://datatracker.ietf.org/doc/html/rfc4122).

A number of tools exist to support publishers generating UUIDs:

* [Online UUID Generator](https://www.uuidgenerator.net/) (web)
* [uuidgen](https://www.man7.org/linux/man-pages/man1/uuidgen.1.html) is available in the repos of many GNU/Linux and BSD systems (CLI)
* UUID support was added to MySQL in [version 8.0](https://dev.mysql.com/blog-archive/mysql-8-0-uuid-support/) (database software)
* PostgreSQL provides [UUID functions](https://www.postgresql.org/docs/current/functions-uuid.html) (database software)
* MongoDB provides a [UUID function](https://www.mongodb.com/docs/manual/reference/method/UUID/) (database software)
* [libuuid](https://sourceforge.net/projects/libuuid/files/) is a portable library for C to generate UUIDs (programming library)
* Python3 provides a [uuid object](https://docs.python.org/3/library/uuid.html) (programming library)
* There is a [uuid Crate](https://docs.rs/uuid/latest/uuid/#) available for Rust (programming library)
* There is a [uuid package](https://www.npmjs.com/package/uuid) available for NodeJS via npm (programming library)

There are likely many more suitable for your needs.

## Third-party or External Identifiers
HSDS data can also include information on third-party identifiers, which link HSDS data to records in other datasets or information systems, as well as the real world. For the sake of clarity, HSDS uses `identifer` in column names that refer to third-party identifiers.

### Location Identifiers

Locations in the real world are often identified by a range of different systems, schemes, or catalogues. There are often different schemes used within the same legal or geographic context. Systems exchanging data about services and locations may need to convert between schemes in order to process the data for analysis or other use e.g. rendering it on a map, or supporting filtering for locations near a system user.

In HSDS, the [Location](schema_reference.md#location) object contains properties which should be used to provide an identifier for the location:

* `location/external_identifier` is used to provide an external identifier for a location, drawn from a particular scheme. An example would be `5090701` which is drawn from the UPRN scheme in the UK.
* `location/external_identifier_type` is used to label the scheme from which the location is drawn such as [UPRN](https://www.gov.uk/government/publications/open-standards-for-government/identifying-property-and-street-information) in the UK.

There are many identifier schemes available for location data. The most suitable one for your data will likely depend on what is considered standard for your target legal or geographic scope.

### Organization Identifiers

It is important to reliably and consistently identify organizations for many different use-cases. For HSDS, this means that organizations can be identified properly within a single dataset, between different HSDS datasets, or in combination with other open datasets.

To support this, HSDS provides the [organization_identifier](schema_reference.md#organization_identifier) object to encapsulate third party identifier information about organizations. Each [organization](schema_reference.md#organization) object has an array of `organization_identifier`s because in the real world there is often a 1:many relationship between an organization and its identifiers; an organization may have different legal identifiers in different official registers, or different third parties may provide their own identification scheme for organizations.

According to [org-id.guide](http://docs.org-id.guide/en/latest/terminology/), there are several different types of organization identifier with varying degrees of canonicity:

* **Primary identifiers** are official, often legal, identifiers that unambiguously and directly identify a legal entity. Company registration numbers are usually primary identifiers, since a company usually cannot operate without a company number. Non-profits, charities, and other third-sector organizations usually have equivalent identification numbers.
* **Secondary identifiers** are official identifiers which are assigned to entities for a range of purposes. These may include a tax number or a VAT number (EU and UK), charitable status identifiers in contexts that do not have a primary register for non-profit entities, or even government procurement system identifiers.
* **Third party identifiers** are identifiers drawn from lists that are assembled and maintained independently of the organizations they're identifying. They often assign identifiers to known organizations, but they do not have legal status. The proprietary [D-U-N-S](https://en.wikipedia.org/wiki/Data_Universal_Numbering_System) register maintained by Dun & Bradstreet is an example of a third party identifier.
* **Local identifiers** are the internal system identifiers for organizations and entities within the context of a particular digital or information system, and cannot be expected to hold relevance outside of that system. An example of these would be an internal database identifier for an organization record in a software system or database.

Where possible, HSDS publishers should seek to collect legal or Primary identifiers for organizations and publish these in their HSDS data. If these are not possible to collect for legal or practical reasons, then publishers should fall back on Secondary identifiers if available. If these are not available then Third Party identifiers should be used. Local identifiers may be used when no other identifiers are available.

Where a publisher has collected multiple different organization identifiers for an organization, they should publish each of these to promote interoperability and data analysis across as many different datasets as possible. The exception to this is Local Identifiers, which should be omitted if better identifiers are available.

There are two parts to an organization identifier in HSDS:

1. A **register prefix** identifying the register from which the identifier is drawn. This is stored in the `organization_identifier/identifier_scheme` property. An example of this would be `GB-COH` for the [UK Companies House](http://org-id.guide/list/GB-COH).
2. The **organization id** identifying the organization, drawn from the above register. This is stored in the `organization_identifier/identifier` property. An id number drawn from `GB-COH` may look like `09506232`.

Where possible, publishers should try to draw from schemes represented on [org-id.guide](https://org-id.guide). If these are not available, publishers can [raise an issue](https://github.com/org-id/register/issues) on the org-id.guide Github repository, and may also use the `organization_identifier/identifier_type` property to provide details of the scheme in a human-readable format.

There are other properties defined in `organization_identifier` which are necessary for HSDS' relational model between objects but may provide some confusion in this context:

* `organization_identifier/id` is the UUID for this specific `organization_identifier` object and used for Tabular serializations.
* `organization_identifier/organization_id` is the UUID for the `organization` object which associated with this organization identifier. It should match the `organization/id` property of an `organization` elsewhere in the dataset. It is used for Tabular serializations but is not required in JSON as the `organization_identifier` object should be [dereferenced](serialization.md#dereferencing).


