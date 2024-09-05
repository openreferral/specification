Database Schemas
=================

```{note}
This page is *non-normative*, which means that it doesn't form part of the standard; if there is any ambiguity, the standard takes precedence. This page may be updated at any time in response to community demand.
```

HSDS is an exchange format designed to standardise the format for outputting machine-readable data about human services. Therefore systems which output HSDS are not expected to maintain a particular internal database or storage schema. As long as your published data matches HSDS &ndash; you can design your systems to operate however you wish.

This being established, we provide some pre-rolled database schemas in order to support people and organizations bootstrapping systems which will work with HSDS data. We provide these in the form of `.sql` query files which &mdash; when executed in an appropriate environment &mdash; will generate database schemas with tables useful for storing and retrieving HSDS data. We geneate these files directly from the HSDS schema files, so they update as we release new versions of the specification.

You can find the latest version of these files in the `/database` directory of the HSDS Specification Github repository. We provide versions for each SQL and PostgreSQL format databases. The files for HSDS version 3.1 are linked below:

* [Database schemas for HSDS 3.1](https://github.com/openreferral/specification/tree/3.1/database)
