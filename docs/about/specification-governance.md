Specification Governance
=========================

Open Referral is the steward of HSDS. Open Referral's role is to facilitate and oversee appropriate maintenance and development of HSDS to ensure that it meets the needs of its users.

Open Referral develops HSDS through facilitating transparent and consensus-based cycles which result in agreed upon technical changes to the specification.

## Versioning and Upgrade Process

When there is sufficient need and resources, Open Referral announces a development cycle, initiates a Technical Working Group, and elicits contributions from the community to set the agenda. The Technical Working Group works alongside the Technical Steward &mdash; an appointed member of the Open Referral Core Team &mdash; through various channels to provide input and synthesize specific proposed changes to the specification. The Technical Steward then takes all proposed changes that have *rough consensus* (i.e. proposals with no objections and which most people support) and codifies them into a proposal for a version upgrade which is shared with the community with a Request for Comment.

The Technical Steward receives additional input from the community during this period which may result in more meetings of the Technical Working Group if it becomes necessary to seek additional consensus. Upon achieving consent from the community around a proposed upgrade, the Technical Steward implements the changes to the specification, documentation, and guidance.

### Versions

HSDS uses [Semantic Versioning](https://semver.org/) to distinguish between different versions of the standard in the format of `MAJOR.MINOR.PATCH`.

* MAJOR versions introduce backwards compatible changes
* MINOR versions introduce new features or functionality in a backwards compatible manner
* PATCH versions make backwards-compatible bugfixes

If a change is backwards compatible it means that data published using an earlier version still meets the requirements of the standard. For example data published using HSDS version `3.0` would be compatible with HSDS version `3.1`. Similarly, tools operating using HSDS `3.1` should not encounter problems with HSDS `3.0` data.

If a change is not backwards compatible it may mean that data published using an earlier version will no longer meet the requirements. Not all HSDS publications use all parts of the standard, so it is possible that some data may still be conformant to a newer MAJOR version but it is not guaranteed.

You can see a list of all the version upgrades in HSDS by reviewing our [changelog](../hsds/changelog)

