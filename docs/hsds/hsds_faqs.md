HSDS FAQs
==========
## What is the Human Service Data Specification (HSDS)?
AKA 'the Open Referral format,' the HSDS is a data interchange format that enables resource directory data to be published in bulk for use by many heterogeneous systems. HSDS provides a common vocabulary for information about services, the organizations that provide them, and the locations where they can be accessed. HSDS is essentially an interlingua — in other words, it’s a common language that can be used by anyone to enable community resource directories to ’talk’ to each other. [See the data specification in Github](https://github.com/OpenReferral/specification)

## Why did we develop the Human Services Data Specification?
We believe that development of an open, standardized format is a necessary step in a process of reducing the costs of producing directory data, increasing the quality of such data, and promoting its re-use in valuable ways.

We expect that adoption of HSDS will make it easier to find, use, and evaluate information about services. As a result, more people will access services and service providers will be better able to address complex needs; people will live happier and healthier lives; decision-makers will be better informed about the needs of their communities; and ultimately communities will become more resilient.

## How did we develop the HSDS?
The Open Referral initiative used multiple methods of research and development to establish this data specification.

First, leaders of our pilot projects worked with stakeholders in their communities to develop a series of ‘user profiles’ that described the needs and behaviors of specific users.

Then, at our Open Referral workshop in the summer of 2014, we compiled a set of ‘user personas’ that each describe one of four broad categories of use: seeking help, providing help, analyzing data, and administering data. [Read here for the set of user personas](../initiative/index.md#types-of-use-and-user-personas) developed through activities such as [the Open Referral workshop.](https://docs.google.com/document/d/1kivG6TTw1LKhJRAQHeqH7fTIxZZaDojXRRBYEd_ltWw/edit)

With this set of insights, we drafted an initial version of the specification that was then reviewed through several rounds of community feedback. During this time, members of our diverse network debated, clarified, and expanded the contents.

Finally, we conducted initial tests of HSDS by using it to transform resource directory databases from pilot projects around the country.

## Who is the HSDS for?
The primary users of HSDS are data administrators (who are responsible for managing systems that strive to meet the needs of other users). [Read our user personas here.](../initiative/index.md#types-of-use-and-user-personas)

We define ‘data administrator’ broadly: while some data admins will be sophisticated managers of enterprise-grade referral systems, the vast majority of people who produce resource directory data are working with simpler technology such as Access, Excel, or even Word. Our goal is for HSDS to be usable by both the 2-1-1 resource data specialist and the IT volunteer who is helping out the neighborhood food pantry.

## What is in the HSDS?
First, HSDS identifies a vocabulary of terms that describe what a service is, the institution that provides it, where the service can be accessed, and how to access it. These terms are designated as ‘required’ (meaning they must be included for data to be compliant) or ‘optional.’ The spec provides instructions for formatting these terms, with examples.

On a more technical level, HSDS also includes a [logical model](serialization) that diagrams the relationships between these terms.

Finally, HSDS provides guidance for structuring and packaging data so that it can be published on the web and/or exchanged between systems. See our [Github].(https://github.com/codeforamerica/openreferral/specification)

## What’s not in the HSDS?
HSDS does not attempt to describe every type of information that might be relevant to people working with resource directory data. We have attempted to maintain a strict focus on specifying only relevant factual attributes that are shared by most services. That means we excluded many kinds of information that are unique to specific kinds of services (such as the accreditation of child care providers, or the availability of beds in a shelter).

HSDS also does not specify a taxonomy of types of services and types of personal attributes that determine eligibility for various types of services. Many such taxonomies already exist, so HSDS merely provides instructions for how to overlay a taxonomy of the user’s choosing. By default, information systems that use HSDS can use the open source [Open Eligibility taxonomy](http://openeligibility.org/)(. (Expect future cycles of the Open Referral initiative to take on these issues more directly; however, for now we are merely looking to learn from the different ways in which various users address these common problems.)

Finally, HSDS does not specify any information regarding how referrals actually get made (i.e. setting appointments, following up, etc) or feedback regarding the quality of those services. These kinds of information are critically important, but inherently so variable and context-dependent that we don’t think it’s feasible or appropriate to specify them at this point in time.

That said, this model can and should be extended! Users can expand HSDS to meet their own needs, in their own systems. Groups of stakeholders from particular service domains (such as legal aid) or geographies (such as the UK) can develop extended ‘profiles’ that are tailored to their situation. In future iterations of the Open Referral process, extensions created and documented by members of our community can then be considered for inclusion as part of the core specs.

## What is the format of HSDS? Why JSON? 
Version 3.0 of HSDS has established JSON as the primary standard format. (The initial versions of HSDS used the CSV format, with multiple tables wrapped by a JSON datapackage.) This change brings many benefits to the standard, which are detailed [here](https://docs.google.com/document/d/1oUSI4NLvdKG3Eb1TyFq_VOaAuhSoMg9zRUnmgltTMAg/edit#) alongside a discussion of risks and mitigations of those risks.

The decision to change the primary format to JSON was the result of a participatory decision-making process, involving stakeholders from across our network, led by a volunteer working group and implemented by Open Data Service Cooperative.

In the following sections we summarize some of the key motivations for the decision, which are taken from the above document:

**General:** 
JSON (using JSON Schema for validation) is a vastly more commonly used interchange format than datapackages, so we can benefit from a much greater range of tooling and expertise to make HSDS better to use in almost all aspects.

**Use Case Specific:**

Service lookup: enabling users to query an HSDS data source to find a service and act on the information:
- We can standardise the output of APIs to the new JSON format and we can develop API specifications around them; meaning they will be kept in sync with the core HSDS specification.
- It is not really possible to do these queries in just the Tabular Datapackage format.

Alignment of multiple datasets: to enable resource data federation, 
 matching/synthesizing/syncing multiple sources of HSDS:

- Having JSON output formats that align across publishers would make data federation/syncing feasible.
- Easier to write extension/profiling tooling for JSON Schema as some already exist.
- The JSON outputs could not just be through APIs, but also with bulk JSON versions, making federation/syncing feasible outside API use.
- This is tricky to do if only the Tabular Datapackage format was allowed, as federation/syncing relational database structures, with different schemas, has no feasible automated solutions.

Analyzing and improving resource data quality:
- JSON Schema can provide more/better/clearer validation results.
- JSON has better tooling for doing additional checks beyond the validation rules.
- Much more tooling available for building validators.
- More/better tooling available for documentation generation.

Editing individual records:
When updated using JSON representations a single API endpoint can be used to update a service and all related fields; not just a table at a time. 

Bulk Data Transfer:
- JSON is commonly used as a bulk interchange format.  Standardising the representation would mean these tools could be reused when dealing with a lot of data.

The outdated JSON Tables (CSV) representation is an important artefact for many HSDS users, and so will be maintained: we automatically generate a JSON Table Schema from a JSON Schema, so we expect that the shift will not cause any issues for any implementations that expect the datapackage from deprecated HSDS versions.

## How have the Human Service Data API protocols evolved? 
In 2017, Open Referral developed a set of API protocols [known as the Human Service Data API Suite (HSDA)](https://openreferral.org/meet-the-human-service-data-api-protocols/) which corresponded with a now-deprecated version of HSDS (1.1). 

With HSDS 3.0, we have consolidated these API protocols into the main specifications themselves – to simplify our products and promote an API-forward strategy. The primary format for HSDS is now JSON Schema, which can aid implementers in deploying or standardizing their own APIs for resource directory data access and exchange. 

## How does Open Referral handle eligibility criteria?
Good question. [Our schema has a field for `eligibility_description` of a `service.`](schema_reference.md#service) Beyond that, we don't currently specify a standardized method for structuring eligibility criteria. The kinds of eligibility rules are so variable and often complex and nuanced that we have not tried to develop a standardized set of them. (Expect future cycles of the Open Referral initiative to take on these issues more directly; however, for now we are merely looking to learn from the different ways in which various users address these common problems.)

## What if the Human Service Data Specification requires kinds of information that I don't collect?
The Open Referral format has been developed to require a pretty minimal set of information. If your resource directory doesn’t contain certain required elements, we may need to get creative. Ask in [our Issues queue](https://github.com/openreferral/specification/issues) or [our Forum](https://forum.openreferral.org/) for clarification and context, and we'll try to answer you promptly.

## What if I collect important information that isn't included in the Human Service Data specification?

That’s Ok! The Human Services Data Specification allows extensions – i.e. custom fields that can include information that is important for your use case(s) but not defined in the standard itself. The only trade-off is that – since the specification doesn’t know about your fields – any HSDS validation and quality-checking tools will be unable to validate your additional fields.

If you need a significant number of extensions in order to capture information that is not included in the core specification, you might want to consider developing a [HSDS Profile](profiles). This will allow you to define and document  your important fields in the Profile, allowing others to see them and allowing tools to validate them. We’d also love to learn from your experience, so please get in touch and share your thoughts on your information and HSDS.

## What languages is this project in?
Currently Open Referral is in English, though we would welcome opportunities to support language localisation.

## Who has adopted these specifications and can I see examples?
We have a [network of projects around the United States, Canada, and beyond](https://openreferral.org/about/projects/). The best way to learn about various implementations is by [browsing our blog](https://openreferral.org/category/blog), where we share stories from the community. 

Some domain-specific groups have adapted our data specification to their context, such as [Open Referral UK](http://openreferraluk.org/), and [the Human Services Data Model](https://openreferral.org/introducing-the-humanitarian-service-data-model/) (in the field of Humanitarian Crisis Response).

Oh, do you mean machine language? Our data specification calls is expressed in JSON schema, though we also support for a datapackage of CSV files. Our primary reference implementation, [ORServices](https://github.com/sarapis/orservices), is in Laravel.

## Is the project in active development?
The Human Services Data Specification under the interim leadership of the [Open Data Services Co-operative](http://opendataservices.coop/). We conducted a major upgrade cycle in 2022-23; minor upgrades may be in progress. [Check out our issues queue](https://github.com/openreferral/specification/issues).

We are seeking sponsorship to support long-term institutional development of Open Referral and our data specification. Please reach out to info@openreferral.org for more information.

## What is the licensing on this project?
The [Human Services Data Specification](https://github.com/openreferral/specification/blob/master/LICENSE) is now available as [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
  
