Specification Governance
=========================

_Approved in Spring 2024_

## Terms and Definitions

**The Human Services Data Standard (HSDS)** is a data exchange format for publishing machine-readable information about health, human, and social services: their locations, and the organizations that provide them. We define “human services” broadly, to include any organizational resource that is made available for a person in need – such as food assistance, job training, child care, etc. Anyone can propose changes to HSDS, through the project’s Github queue or Community Forum. HSDS is licensed as [CC BY SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.en)  

**Open Referral** is an unincorporated community of practice that facilitates the maintenance and development of free, open source resources for stakeholders around the world. One of those resources is the Human Service Data Standard (HSDS). 

**Lead Organizer:** Open Referral is led by its founder and lead organizer, Greg Bloom. The lead organizer designs and facilitates Open Referral activities, manages community networks, oversees management of website and communications channels, represents Open Referral to public and philanthropic sectors, and raises funding to support development. They also liaise about strategic and fiscal matters with Open Referral’s US-based nonprofit fiscal sponsor, Aspiration.

**Fiscal Sponsor:** [Aspiration](https://aspirationtech.org/) (a 501c3 nonprofit) is the fiscal sponsor of the Open Referral Initiative. This means that Aspiration receives and administers Open Referral’s intellectual property and financial assets (including grants, donations, revenue from service contracts for specification development). These assets are held in a restricted fund that operates under the direction of Open Referral’s lead organizer. (The Lead Organizer or fiscal sponsor can terminate this fiscal sponsor agreement in the event that the project can no longer operate, or in the event that the Lead Organizer designates a Successor organization that can legally receive and administer the project’s assets.) Aspiration also provides mentorship to Open Referral’s leadership, and sometimes co-designs and facilitates events for the Open Referral community. 

**Technical Steward:** Through funds administered by Aspiration, under the direction of the lead organizer, the Open Referral Initiative funds the work of a technical steward. The technical steward codifies changes to HSDS. It does this by maintaining HSDS and related repositories in Github, co-developing and managing technical backlog, and co-facilitating technical meetings. The technical steward reports to the lead organizer. The technical steward is currently [the Open Data Services Cooperative](https://opendataservices.coop/).

**Technical Committee:** The Technical Committee is a standing group that assesses and prioritizes among any and all proposed changes to HSDS. The Committee consists of people with a track record of contributing input to the HSDS development process, and a commitment to upholding Open Referral’s [mission, values, and principles](https://openreferral.org/about/our-values-and-principles/). The Committee advises the Lead Organizer and Fiscal Sponsor on matters pertaining to governance of the initiative, and issues binding recommendations to the Technical Steward on matters pertaining to HSDS. More detail follows below. 

## Stewardship and Governance

Open Referral is an open community of practice – anyone who shares [our vision and values](https://openreferral.org/about/our-values-and-principles/) is welcome. Our network (which includes human service referral providers, government officials, academics, vendors, community leaders, etc) is primarily assembled in our [Community Forum](https://forum.openreferral.org/). Though we are an international initiative, our subject matter is primarily local and therefore much of the work in our initiative is done locally. This means our decision-making processes are distributed – from global (as an open community of practice, developing a common standard, collateral materials, open source tools, etc) to local (as a set of place-based pilot projects led by stakeholders in a given geographical region) and sectoral (with projects in specific subdomains like legal aid, etc). We operate iteratively, with regular opportunities to reflect, change, and grow.

**Open Referral's core team facilitates alignment and supports activities across the Open Referral network.**

At a ‘global’ level, Open Referral's core team consists of technical and institutional leadership. Core team members a) set the agenda for public discussions; b) oversee accountable administration of any grant funding or other resources in the Open Referral Initiative’s control; and c) make decisions in any instances in which the community cannot reach rough consensus. For each development cycle, Open Referral's lead organizer (Greg Bloom) designates a lead technical steward to serve in the Core Team.

### A standing Technical Committee oversees development of the Human Service Data Specifications.

*Updated Spring 2024.* The Human Service Data Specifications – Open Referral's core technical product – are developed through transparent, consensus-based cycles that are facilitated by Open Referral's core leadership, governed by a standing Technical Committee, and codified by the designated technical steward.

Technical committee members document and prioritize prospective changes to HSDS and help the technical stewards maintain a backlog of issues for further discussion. Committee members attend regular, open meetings with the Lead Organizer and Technical Steward where updates to HSDS are discussed. They also participate in discussion on the Open Referral Forums and HSDS Github repositories. 

The committee consists of people with a track record of contributing input to the HSDS development process, and who are committed to upholding Open Referral’s mission, values, and principles.

The committee also can advise Open Referral’s Lead Organizer on issues related to the Open Referral community at large, and can make recommendations as to investments in development of tools and other tech that can support adoption and use of HSDS.

#### As of Spring 2024, the Open Referral Technical Committee is in formation

Upon formation of this body, the body will manage itself – beginning by writing a charter that establishes: how people are added/removed, how decisions will be made, how the body can be dissolved, etc. This can be authored by the founding members and reviewed by the technical steward, and must be approved by the lead organizer and fiscal sponsor. 

### The process for requesting changes to HSDS is open to anyone.

Input on Open Referral's specifications and materials can be shared through several channels: our [Github queue](https://github.com/openreferral/specification/issues), our [Community Forum](https://forum.openreferral.org/), and occasional community Assemblies. The Technical Steward is responsible for receiving and synthesizing such input from across channels for review by the Technical Committee. The Technical Committee members are empowered to propose specific changes to the specifications; proposed changes that are met with rough consensus (i.e. most support and nobody objects) are acknowledged in the Forum advanced to the Technical Steward for codification. Upon receiving all outputs from the Technical Committee, the Technical Steward develops a fully specified proposal for a version upgrade, which is shared with the community for a Request for Comment period (usually of about two weeks). The Technical Steward receives any additional input through this period, and can call for additional meetings of the Technical Committee to seek consensus on additional changes as necessary.

In any instance in which consensus cannot be reached (which has almost never happened in Open Referral's history) the Core Leadership reserves the right to make a direct decision – documenting the nature of the disagreement, the reasons for the decision, and the criteria by which the decision can be re-evaluated in the future. Upon achieving consent from the community for a proposed upgrade, the technical steward will implement the version change in machine and human readable formats with guidance documentation.

You can read more about governance of the Open Referral Initiative overall [on our website](https://openreferral.org/about/organizational-overview/governance-and-participation/). Further details about governance of the specification follow below:

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
