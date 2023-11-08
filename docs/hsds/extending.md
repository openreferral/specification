Extending HSDS
==============

```{note}
This page is *non-normative*, which means that it doesn't form part of the standard; if there is any ambiguity, the standard takes precedence. This page may be updated at any time in response to community demand.
```

Since service provision is local, there may be some fields of data which are important to include but are not a good fit for existing HSDS fields. 

The [Profile mechanism](profiles) is a way to formally extend HSDS with new properties, validation rules, and structures suitable for a local context. Publishers may want to develop a HSDS Profile for a particular geographic or legal boundary, or for a specific conceptual area of service delivery. See [Using Profiles](using_profiles) for more guidance on Profiles including how to publish data to an existing Profile and how to begin implementing a Profile.

In some cases, a publisher may only need to include a small amount of additional data in a HSDS publication. This may not necessitate or justify the effort of developing a formal Profile. As per the [Conformance](conformance) page in the Reference section, a HSDS publication is still conformant even it it includes properties and structures not defined in HSDS or one of its Profiles &ndash; as long as there isn't already a suitable property in HSDS. This means publishers and implementors may simply include new properties to meet their individual or local needs.

At a technical level, the HSDS Schemas permit the inclusion of new properties not defined in the schema itself. This means that data including additional properties will validate against the HSDS Schemas providing that it is otherwise correct.

It is important for additional properties to be documented, so that systems and humans can understand what they mean. Publishers and implementers should provide accessible documentation for any new properties they've added to their HSDS publication.

HSDS can only be improved by participation, so we encourage publishers who've extended the data model either formally through Profiles or informally through additional properties to share their work via our [community forums](https://forum.openreferral.org/).
