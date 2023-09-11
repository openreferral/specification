Profiles Reference
==================

*This section provides a normative reference for the HSDS Profiles mechanism. If you are looking for guidance on how to use or implement a HSDS Profile, please see the PROFILES GUIDANCE page.*


As an international standard, HSDS provides a common core of defintions and objects for describing health, human, and social services as well as their locations and the organizations that provide them. This allows HSDS to acommodate a wide range of applications and provide value in a variety of use cases.

Being an international standard, however, means that the needs of HSDS publishers and users are often significantly variable across varying contexts. In different geographies, sectors, and scenarios of usage, users may need different information about services, locations, and organizations.

To this end, HSDS provides the following **Profiles Specification**. HSDS Profiles can be specified as a series of changes from the HSDS Specification to address specific or local contexts.

As per the [Conformance](conformance) section, a publication is considered conformant to HSDS if it is conformant to a valid HSDS Profile as specified in this reference.

## Profiles Specification

### Specification format

Profile specifications must be implemented as a set of files which describe modifications to existing HSDS specification files.

In the case of object schemas (e.g. `service.json`, `organization.json`, `phone.json`, etc.), modifications must be implemented so that they produce valid JSON Schema &mdash; i.e. conformant with the [JSON Schema Draft 2020-12 Core/Validation metaschema](https://json-schema.org/specification-links.html#2020-12) &mdash; when merged with the corresponding schema defining an object in HSDS by means of a JSON Merge Patch ([RFC 7386](https://datatracker.ietf.org/doc/html/rfc7386)). For example, a Profile describing a modification to HSDS' [service definition file](https://github.com/openreferral/specification/blob/3.0/schema/service.json) must produce valid JSON Schema when merged with this file via a process conforming to RFC 7386.

In the case of the API specification file (`openapi.json`), modifications must be implemented so that the result of merging them with [the HSDS OpenAPI specification file](https://github.com/openreferral/specification/blob/3.0/schema/openapi.json) produces a result that is conformant to the [OpenAPI 3.1 Specification](https://spec.openapis.org/oas/latest.html#version-3-1-0).

### Profile Versioning

Profiles may choose any versioning scheme that is deemed suitable, but it is recommended to use [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Profiles should be versioned independently of HSDS. For example if *Profile A* is derived from [HSDS 3.0](https://github.com/openreferral/specification/releases/tag/v3.0) then the *Profile A* must not be said to be *Profile A 3.0* unless its own version increments to `3.0` through its own upgrade and governance processes.

Profiles should adapt to upgrades in HSDS, which may be considered as 'upstream' for these purposes, however they may also choose to ignore these upgrades. When a Profile adapts to changes in HSDS, it should update its own version number according to its versioning and governance processes.

```{admonition} Worked Example:

1. A new HSDS Profile, *Profile A* is released. It is based off of *HSDS 3.0*, however its internal version is `1.0` and it uses Semantic Versioning.
2. *Profile A* develops new features independant of HSDS, which are considered MINOR changes to the Profile, and upgrades itself accordingly to version `1.1`.
3. *HSDS 3.1* is released, incorporating some MINOR changes of its own which are considered desirable for *Profile A*. These changes also represent MINOR changes from the perspective of *Profile A*, so after bringing these changes through from *HSDS 3.1*, *Profile A* is now on version `1.2`.
4. Some time later, *HSDS 3.2* is released which adds further MINOR changes to HSDS. These changes respond to similar demands as *Profile A* so implement some comparable features, but in a slightly different way that is mutually incompatible with the features of *Profile A*. *Profile A* is still relevant as it provides additional features and adaptions not represented in *HSDS 3.2*. After engagement with the community, the developers of *Profile A* decide that it would be best to maintain interoperability with HSDS 3.2 and adapt *Profile A* to these changes. They bring through the changes from *HSDS 3.2* which replace some features of *Profile A*, representing a MAJOR change which is not backwards compatible for users of *Profile A 1.2*. *Profile A* is now on version `2.0`, being based on *HSDS 3.2*.

```

### Profile URLs

Profiles must provide a URI ([RFC 3986](https://www.rfc-editor.org/rfc/rfc3986)) which resolves to a canonical resource giving information about the Profile.

When implementing modifications to the [HSDS API Specification file](https://github.com/openreferral/specification/blob/3.0/schema/openapi.json), Profiles should specify that the response object to the `/` API endpoint includes this URI as the value of the `profile` property.

### Permitted Modifications

Profiles are permitted a generous set of operations against the HSDS Specification which enables them to both extend and override it. Overriding may include changing the way properties or validation rules behave or removing them entirely.

#### Extending the HSDS Specification

A Profile may:

* Add new optional or required properties to its specification.
* Add new validation rules to its specification, including making existing HSDS properties 'required' and stipulating patterns or formats for conformance on existing HSDS properties.
* Add new objects to its specification.
* Add new API endpoints to its API specification.
* Recommend or require the use of particular value sets such as taxonomies or enumerations.

#### Overriding the HSDS Specification

A Profile may:

* remove properties and their validation rules from the HSDS specifications by overriding their definitions with `null`.
* remove entire objects from the HSDS Specification by overriding its object schema with `null`.
* remove API endpoints from the API specification by overriding their definitions with `null`.
* override constraints on HSDS properties (e.g. string format requirements) by defining new constraints which will replace those defined in the HSDS Specification.

### Serializing to Tabular Data Packages

Profiles should support serialization to a [Tabular Data Package](https://specs.frictionlessdata.io/tabular-data-package/#specification) format.

This should be done by providing a `datapackage.json` file conformant to the [Frictionless Tabular Data Package schema](https://specs.frictionlessdata.io/schemas/tabular-data-package.json), which describes the serialization of the Profile accurately.

## Reference Implementation

There are two resources which comprise a Reference Implementation of the above specification.

* The [HSDS Schema Tools](https://github.com/openreferral/hsds_schema_tools/tree/main) utility provides a `profile-all` command which will generate Profile schemas from a directory of modifications, performing the merge procedure with the canonical HSDS specification files automatically. It will also generate a `datapackage.json` file for supporting serializing to Tabular Data Packages.
* The [HSDS Example Profile Repository](https://github.com/openreferral/hsds_example_profile) uses the mechanism provided by the HSDS Schema Tools to generate Profile schemas and a `datapackage.json` file, alongside documentation.
