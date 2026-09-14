Creating Profiles
======================

```{admonition} This content is not normative
This page is not a normative part of the Standard. If there is any ambiguity, the normative [Profile Reference](../hsds/profiles) takes precedence.
```

In HSDS, a Profile is a derivative of the specification which has been tailored to meet specific needs. HSDS is an international standard and while it has been designed to accommodate as many use cases as possible, different contexts have different needs. These contexts could be national or geographic, sector-specific, or simply different scenarios of use.

The [Profiles Reference](../hsds/profiles) page outlines the formal definition of Profiles in HSDS, however a summary is that a Profile is a self-contained derivative of HSDS which is achieved through outlining a series of changes to HSDS to achieve an end result.

In this way, a Profile can benefit from many of the shared models and tools in the Open Referral ecosystem while adapting the specification to local problems and use-cases.

## Overview of steps to create a Profile

Creating a HSDS Profile is a multi-faceted and multi-disciplinary process.

We advise following a step-wise process to give you the greatest chance of success:

* **Plan:** what need does your Profile address and who will you work with?
* **Design:** what changes will you need to make to HSDS to meet your needs?
* **Implement:** Actually encoding the changes into a Profile
* **Publish:** Make the profile publicly accessible so people and tools can use it
* **Maintain:** Govern your Profile appropriately, and fix any technical issues that emerge

The following sections of this guidance go deeper into each step.

## Plan your Profile

The first step of creating an effective HSDS Profile is to plan it. You need to consider what problems your Profile solves, who will benefit from your Profile existing, and who will be responsible for the design and creation of your Profile.

### What problem does your Profile address?

You should first outline exactly why you want to create a HSDS Profile. The best way to do this is to frame it as the answer to a problem that you perceived.

This could be that HSDS is not tailored enough to your local context; there might be additional regulation which requires more fields than HSDS accounts for, or places stricter requirements on data quality.

Key questions which support you framing your Profile:

* Who is the target audience for your Profile? Is it a particular geographic context, or something else?
* Why does this need to be a Profile of HSDS? Are there specific shortcomings of HSDS that you want to overcome? If so, what are they?

### Build your team

Depending on the scale of your Profile and your goals, you may need to build a team around you.

Designing, implementing, and maintaining an effective HSDS Profile will involve the following key skills:

* Domain expertise in relevant fields (healthcare, public health, governance and transparency, etc): to drive and inform decisions about your Profile
* User Research: to engage with people’s needs and translate these into insights for your Profile design
* API Design: to design an API which meets the requirements of your users and applications.
* Data Modelling: to model the new concepts your Profile introduces in an effective and usable way
* JSON Schema and Open API Specification: the implementation technologies of HSDS, to encode your Profile in machine-readable formats
* Technical writing and documentation: to document your Profile and write guidance on how to engage with it
* Data and Standard Governance: to design and drive effective governance of your Profile, as well as any data you will be collecting centrally
* (possibly) Software development: to design and implement any Profile-specific tooling for your team and community

### How does your Profile sit in relation to other parts of your initiative

It may be that creating a HSDS Profile is something you’re doing as part of a wider initiative for change in your local context.

In these cases it is useful to outline how your Profile sits in relation to that wider initiative. This will help contextualise your Profile and your initiative for yourselves and your future community.

Key considerations:

* Does your initiative already have a web presence? Will your material (including technical reference) sit underneath that or in a separate part of the internet?
* How will people discover your Profile?
* Is there any public material you want to produce to describe this e.g. diagrams, infographics, etc.

## Design your Profile

Designing your Profile involves describing \-- at a high level \-- how your Profile will meet the needs you have outlined earlier.

### Outline the changes to HSDS you need to make, against a stated need

The first thing to do is to outline the changes you want to make to HSDS and to clearly state why you want to make these changes.

Key things to consider here are:

* Do you disagree with the way HSDS has modelled something? How? How will you change that in your Profile?
* What new features are you adding to your Profile? Will those features involve new schemas, or changes to existing schemas?
* Do you need to place stricter requirements on validation than in HSDS? Where? Why is this important?
* Are you making changes to the API specification to support your other changes?

### Outline your documentation needs

Profiles of HSDS are essentially self-contained miniature standards. This means you will need to think about how to document your Profile.

Key considerations:

* What type of documentation will you need to produce?
* Who is the documentation aimed at?

### Outline any additional tools or materials you need

HSDS has a growing ecosystem of tools and materials, many of which are general purpose and usable across different Profiles. However, because each Profile is different and has specific needs; you may need to plan to develop your own tooling or materials to meet specific goals.

* Do you need to produce any mapping templates to help users map existing data to your Profile?
* Will you host a dedicated validator, or lean on community tooling?
* Would your Profile benefit from any dedicated tooling given your local context? E.g.
* Automated conversion from legacy industry formats
* Registries of publishers/feeds which conform to your Profile
* Monitoring and data quality assessment for meeting national or regulatory standards

## Implement your Profile

After you’ve designed your Profile, it’s time to implement it.

HSDS is defined by JSON Schema files, and the Profiles specification defines a Profile as *“a set of files which describe modifications to existing HSDS Specification files”*.

This means that, at a technical level, a Profile consists of a set of JSON Schema files which, when merged with the base HSDS schemas via [JSON Merge Patch](https://www.ietf.org/ietf-ftp/rfc/inline-errata/rfc7386.html), produce conformant JSON Schemas files (or in the case of the Open API definition, a conformant Open API Specification file).

This is possible to do by hand, but we strongly recommend that you make use of some community tooling the [HSDS Profile Wizard](./using-hsds-profile-wizard) to support you implementing and maintaining your Profile. We have written dedicated guidance on setting up and using the HSDS Profile Wizard.

If you need support achieving specific effects in your Profile (e.g. adding new properties to an existing HSDS Schema), check out the [HSDS Profile Cookbook](./hsds-profile-cookbook) which contains how-tos for specific effects.

We also recommend that you write your documentation as part of your implementation step. For this, we have found that [Sphinx](https://www.sphinx-doc.org/), with some plugins is simple and suitable for writing and maintaining documentation of this type:

* [sphinxcontrib-opendataservices-jsonschema](https://docs.opendataservices.coop/projects/sphinxcontrib-opendataservices-jsonschema/en/latest/) provides useful features for rendering JSON Schemas in documentation
* [sphinxcontrib-openapi](https://pypi.org/project/sphinxcontrib-openapi/) provides useful features for rendering OpenAPI specification files in documentation.

## Publish your Profile

Once your Profile is implemented, it’s time to publish it.

### Make your schemas accessible on the internet

The first step will be to make the Profile schemas themselves publicly available. If you’ve been using a service like Github to develop your Profile, this is as simple as making the repository public.

Another option is to use a website you control to host the canonical copies of your schema files. This has the benefit of giving you full control over the canonical URLs of your Profiles schemas, but may require some more complex “plumbing” to perpetuate changes onto your infrastructure.

However you do it, your Profile schemas need to be accessible over the internet. This is so that tools like validators can retrieve them for validating data against your Profile schemas.

### Ensure you have documentation

It is strongly recommended to have some documentation to accompany your Profile. Depending on your community of users and their needs, this could consist of a few pages of normative reference material or it could provide a full suite of guidance, templates, and examples to guide different types of users and implementors.

Key things to consider here are:

* Who is the intended audience of your Profile?
* What different types of documentation do they need?
* Will these all live on the same documentation site? Or on separate sites?
* How will you delineate this documentation?
* What technical documentation best practices are you going to use?
* [https://diataxis.fr/](https://diataxis.fr/)
* [https://developers.google.com/tech-writing](https://developers.google.com/tech-writing) 
* Is your documentation going to be governed/versioned like your Profile (see [Govern and Maintain your Profile](./#govern-and-maintain-your-profile))
* Do you have a particular toolkit in mind for writing and publishing your documentation?

For example, HSDS’ documentation is aimed at a mixture of technical and non-technical audiences. Changes to normative reference material are considered version updates to the specification. Therefore, we strive for a clear delineation between the normative reference material in the “Reference” section, and “Implementation Guidance” which is not considered normative. We write and maintain our documentation in the same repository as the canonical JSON schemas, and we use [sphinxdoc](https://www.sphinx-doc.org/) to produce our documentation website which is hosted on [Read The Docs](https://about.readthedocs.com/).

### Make an announcement in the forum

Once you’ve published your Profile and everything is available online, you should announce your Profile in the Open Referral Community forum.

This is a great space to get some initial congratulations for your hard work, and to get people talking about your Profile.

## Govern and Maintain your Profile

Once your Profile has been published, it will need maintenance and governance to stay relevant and useful to the people who make use of it.

### What is your Profile’s governance structure?

The first thing to establish is your governance structure. In smaller Profiles which are only making a few changes, this might be very straightforward. In larger Profiles which are more complex, this might require more thinking through.

Key questions to answer here are:

* What is the governing body of your Profile?
* Is that governing body a legally registered organisation or something else?
* Is membership of the governing body open to all? In what ways?
* How will this governing body make binding decisions about your Profile?

For example, HSDS is governed by a Standing Technical Committee made up of members of the Open Referral community. This Committee has a [Charter](https://docs.google.com/document/d/1QBn5dqYIrrGwHKF_kwWVi_52ZWVa4UiVvVjctYlYXwo/edit?usp=sharing), which defines its policies and procedures which include membership. It also defines how decisions are made within the committee. The role of the Technical Committee is then enshrined in the [governing document](../about/specification-governance) of HSDS.

### Where and how will people be able to engage with you in feedback loops?

You will likely want to establish feedback loops with the people using your Profile. This may include developers building software for your Profile and data users who are using data which has been produced according to your Profile.

Key questions:

* Is there a public issue tracking system for your Profile?
* How will “non-technical” people contact you for questions about your Profile?
* Do you have a contact point for your Profile?
* Where and how will you do outreach regarding your Profile?

For example, HSDS has [a public forum](https://forum.openreferral.org/) for all types of engagement, and a [public issue tracker on Github](https://github.com/openreferral/specification/issues) for explicitly technical input such as bug reports or feature suggestions. There is also a newsletter, and we encourage people to email [info@openreferral.org](mailto:info@openreferral.org) with their questions.

### Define your relationship with upstream HSDS

In software engineering, “upstream” means the project from which yours is derived. Your Profile is derived from HSDS, so HSDS itself is considered “upstream”.

HSDS has its own governance processes and rhythms which result in changes to the specification. As the owner and maintainer of your Profile; you get to choose how you engage with these changes.

You are also encouraged to share lessons learned from your Profile implementation. Whether that’s sharing new ways to model data, feeding back on which HSDS structures need further thought, or clarifying certain decisions you’ve made.

Key questions to answer here:

* Will you make it a policy to incorporate all upstream changes into your Profile unless there is a direct conflict?
* What happens if there is a direct conflict?
* Will you choose to “lock in” to a specific version of HSDS, and ignore all other changes to upstream after this?
* Will you keep the broader Open Referral community abreast of knowledge you’ve gained through developing and deploying your Profile?
* Will you suggest changes to upstream HSDS to encapsulate some of your Profile’s changes at a higher level?

For example, the Open Referral UK Profile was originally a “fork” of HSDS 2.1, but shared its lessons and changes with the wider community. As a result, many of these changes made their way into HSDS 3.0, and Open Referral UK was re-implemented as a Profile of HSDS. It is currently based on HSDS 3.0, but may update in the future to make use of some newer features of HSDS which have been released in the interim.

### Version your Profile

With a functioning governance process and regular engagement with the community (both the wider Open Referral community and your own), it is likely that your Profile will change and update to accommodate the new lessons you’ve learned and the growing needs of your users.

Therefore, you should decide how to version your Profile to encapsulate the changes to your Profile.

There are many versioning schemes to choose from. Two popular ones are *Semantic Versioning* and *Calendar Versioning*:

* [Semantic Versioning](https://semver.org/)
* [Calendar Versioning](https://calver.org/)

HSDS uses Semantic versioning (see our [releases](https://github.com/openreferral/specification/releases) page on Github) while JSON Schema, the specification used to then define HSDS’ models, uses calendar versioning (see the [list of drafts](https://json-schema.org/specification-links) on their website).
