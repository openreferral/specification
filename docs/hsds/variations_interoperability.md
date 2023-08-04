Profiles, Variations, and Interoperability
=============================

As an international standard, HSDS provides a common core of defintions and objects for describing health, human, and social services as well as their locations and the organizations that provide them. This allows HSDS to acommodate a wide range of applications and provide value in a variety of use cases.

Being an international standard, however, means that the needs of HSDS publishers and users are often significantly variable across varying contexts. In different geographies, sectors, and scenarios of usage, users may need different information about services, locations, and organizations.

To this end, HSDS makes several provisions to ensure that the standard can be effectively adapted for use in a given context. The first of these is the *HSDS Profiles* mechanism, by which people can collaboratively build upon HSDS as a base in ways that further shape the standard for a particulat purpose. HSDS also offers flexibility for publishing data using a simplified structure in some cases.


## HSDS Profiles

The HSDS Profiles mechanism provides a method of building upon and tailoring the core HSDS Schema in order to adapt it for specific contexts which may require different or additional validation rules.

Profiles may declare new optional or mandatory fields, make existing optional fields mandatory, introduce new validation rules or new structures, or declare new API endpoints in addition to those on the [HSDS API Reference](api_reference).

Conversely, Profiles may also remove or override some parts of the HSDS Schema which are not relevant to them. (This will not prevent a publisher from publishing such excluded data, but it may not be validated by tooling used by that Profile, as it is technically additional data from the Profile's perspective.)

Profiles may also recommend the use of particular value sets (taxonomies, enumerations, etc) to ensure semantic interoperability among datasets that use the Profile.

Profiles are generally developed and maintained by third parties to satisfy particular requirements for their context. These could arise from a community need, legal structures, taxonomy requirements, or other affordances of service provision specific to that context. In general, Profiles should provide robust documentation allowing a publisher or data user to understand its rules and structures both independantly and in comparison to the core HSDS schema.

NB: while Profiles may be used to extend the functionality of HSDS, they should not be used to create modular or re-usable "Extensions". The Profiles mechanism differs from that of an Extensions mechanism in other standards; as such, a given dataset may only implement a *single* Profile.

### Publish data using an existing HSDS Profile

You are encouraged to use existing profiles to publish HSDS data when suitable. This is a very straightforward process.

1. **Ensure that you have implemented the Profile-specific requirements.** You should check the requirements of the Profile that you are publishing against and ensure that your data conforms to these. Do you have all the minumum required fields? Are all of your fields in the correct format?
2. **Declare that you are using the Profile via your API output.** The [`/` endpoint](../hsds/api_reference.md#endpoint-details) of the HSDS API Reference includes a response key/value pair for `profile`. You should populate this with the URI to the profile you are using. Profile documentation should clearly state this value to avoid confusion &ndash; if you are unsure which value to use please get in touch with the implementer of the profile.

Existing Profiles that are likely of interest:

* [UK Profile](uk_compliance)

### Developing a new Profile

If the core HSDS standard or an existing Profile does not adequately meet the needs of your context, you may wish to develop a new Profile to provide the standardization and meaning that you and other publishers in your context will need to produce good quality HSDS data.

Creating a new HSDS Profile is an involved but straightforward process:

1. **Engage and Discuss** with the community about which problems you're trying to solve and how best to address them. This may include people in the [wider Open Referral community](https://forum.openreferral.org/) and other implementors in your context who may want to contribute directly to your profile. Speaking to people who have implemented other HSDS Profiles may help you with thinking through some aspects of Profiles.
2. **Develop and Document** the Profile. All new Profile should use the [Example Profile repository](https://github.com/openreferral/hsds_example_profile) as a starting point because it contains all of the tools required to generate your final Profile schemas as well as a basic documentation site. The Example Profile contains technical guidance and examples on creating a profile inside its README file. You may want to expand upon the basic documentation generated by the tools in the repository.
3. **Share and Support** your new Profile! Make an announcement on the [HSDS forums](https://forum.openreferral.org/) and start producing data conforming to your Profile. If others are using your Profile, you may want to collaborate with them to plan changes to the Profile or answer questions by expanding your documentation.

## Tables-to-fields Transformation

As noted in the introduction to this page, the standard permits certain adaptations of the schema. This makes it easier to publish some datasets which are less complex &ndash; but this results in interoperability considerations.

If there is a situation where there is at most a 1:1 relationship in a particular system between items in two tables, where those items would be linked by IDs, then the standard permits that those tables be merged. Column must should be retained, however.

If the system in question is part of a wider ecosystem, then the community around that ecosystem should agree on a common approach to interoperability around HSDS. For example &ndash;  agreeing on a common set of tables, or agreeing that standard HSDS should be available for interchange purposes.

For example, if all ‘service’ entries have at most one fee entry, then you can just add a ‘fee’ column to the ‘service’ table.
