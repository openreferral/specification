Specification Governance
=========================

TODO intro text here

## Stewardship and Governance

Open Referral is the steward of HSDS. Open Referral's role is to facilitate and oversee appropriate maintenance and development of HSDS to ensure that it meets the needs of its users. Open Referral develops HSDS through facilitating transparent and consensus-based cycles which result in agreed upon technical changes to the specification.

Open Referral operates at multiple levels: globally, locally, and sectorally. At a global level, Open Referral has a Core Team consisting of technical and institutional leadership and a Lead Organizer (Greg Bloom). During development cycles, the lead organizer designates at least a lead Technical Steward to serve in the Core Team.

You can read more about Open Referral's Governance [on our website](https://openreferral.org/about/organizational-overview/governance-and-participation/).

## Versioning and Upgrade Process

Distinct [branches](https://github.com/openreferral/specification/branches) of the specification will be maintained in the official [Specification Repository](https://github.com/openreferral/specification) for each version of the standard.

Branches can be in one of two distinct states:

* **Development** &ndash; indicated by a `-dev` suffix e.g. `3.1-dev`. This branch is not yet released and both schema and documentation in it should be considered unstable and experimental.
* **Live** &ndash; indicated by the lack of a suffix e.g `3.1`. This branch has been released and should be considered stable. Some documentation may be updated on a live branch, but no changes to the schema can be made.

HSDS uses [Semantic Versioning](https://semver.org/) to distinguish between different versions of the standard in the format of `MAJOR.MINOR.PATCH`.

* MAJOR versions introduce backwards compatible changes
* MINOR versions introduce new features or functionality in a backwards compatible manner
* PATCH versions make backwards-compatible bugfixes

If a change is backwards compatible it means that data published using an earlier version still meets the requirements of the standard. For example data published using HSDS version `3.0` would be compatible with HSDS version `3.1`. Accordingly, tools operating using HSDS `3.1` should not encounter problems with HSDS `3.0` data.

If a change is not backwards compatible it may mean that data published using an earlier version will no longer meet the requirements. Not all HSDS publications use all parts of the standard, so it is possible that some data may still be conformant to a newer MAJOR version but it is not guaranteed.

You can see a list of all the version upgrades in HSDS by reviewing our [changelog](../hsds/changelog)

## Revision Process

Releasing a new version of HSDS involves a number of stages and processes which are outlined in the flowchart below. The following sections also give some more detail for each process.

![](../figures/governance/hsds-revision-process.png)

### MAJOR and MINOR Version Upgrades

When there is sufficient need and resources, Open Referral announces a development cycle, initiates a Technical Working Group, and elicits contributions from the community to set the agenda. The Technical Working Group works alongside the Technical Steward through various channels to provide input and synthesize specific proposed changes to the specification. The Technical Steward then takes all proposed changes that have *rough consensus* (i.e. proposals with no objections and which most people support) and codifies them into a proposal for a version upgrade which is shared with the community with a Request for Comment.

The Technical Steward receives additional input from the community during this period which may result in more meetings of the Technical Working Group if it becomes necessary to seek additional consensus. Upon achieving consent from the community around a proposed upgrade, the Technical Steward implements the changes to the specification, documentation, and guidance.

The Technical Steward is expected to work "in the open" on the implementation. This is generally done via a new development branch representing the new version of the specification e.g. `3.0-dev`. The Technical Steward works to implement the new features and documentation in this branch and requests a review from the Technical Working Group when it is ready. The Technical Working Group may then raise any questions, concerns, and challenges which may result in changes to the work and a further round of review.

Once the Technical Working Group has approved the work, the Technical Steward may then change the development branch into a live one (e.g. `3.0-dev` becoming `3.0`) and then making the new live branch into the default branch of the specification Github repository.

### PATCH Version Upgrades

In recognition of the low-impact nature of a PATCH version, the the Technical Steward may implement a bugfix in a development branch (e.g. `3.0.1-dev`) and then notify the community via the Open Referral Forum, with the rest of the Core Team also notified by email.

If there are no objections within one week of the notification then the PATCH is considered approved and the Technical Steward may change the development branch into a new live branch and make it into the default branch of the specification Github repository.

### Deprecation Policy

If a term (a definition or field) is scheduled to be renamed or removed from the specification as a result of the revision process, the next MINOR release of the specification must deprecate the term within the schema, and the following MAJOR release must rename or remove the term from the schema, making the term obsolete. Implementations may use deprecated terms, but will receive warnings from validation tools. Implementations may not use obsolete terms, and will receive errors from validation tools.

## Governance of Documentation

This documentation website consists of normative content (the prescriptive parts of HSDS) as well as content which is not considered normative (the informative or descriptive parts of the docs).

Normative content is considered part of the specification, so is subject to the same governance and versioning process as the specification. Whenever a normative part of the documentation changes, there will be a new version number. In most cases this will consist of PATCH level changes, since documentation may be changed to satisfy the need for greater clarity or to correct clerical errors. At this time, all content inside the *HSDS Reference* section is considered normative content and thus subject to the revision process.

Content which is informative and thus not normative is not subjected to the revision process, and may be updated at any time without triggering a version upgrade. This mostly consists of descriptive and informative guidance in the *HSDS Implementation Guidance* and *About* sections.
