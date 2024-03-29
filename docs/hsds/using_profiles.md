Using Profiles
=============================

```{note}
This page is *non-normative*, which means that it doesn't form part of the standard; if there is any ambiguity, the standard takes precedence. This page may be updated at any time in response to community demand.
```
As an international standard, HSDS provides a common core of defintions and objects for describing health, human, and social services as well as their locations and the organizations that provide them. This allows HSDS to acommodate a wide range of applications and provide value in a variety of use cases.

Being an international standard, however, means that the needs of HSDS publishers and users are often significantly variable across varying contexts. In different geographies, sectors, and scenarios of usage, users may need different information about services, locations, and organizations.

To this end, HSDS provides the [Profiles mechanism](profiles) which allows the community to create a *HSDS Profile* address specific or local contexts.

Profiles may do the following:

* extend HSDS by:
  * adding new optional or mandatory fields
  * adding new validation rules (including making optional fields 'required')
  * adding new structures
  * adding new API endpoints to the API specification
  * recommending the use of particular value sets such as taxonomies or enumerations.
* overriding or removing parts of HSDS†:
  * remove fields and their validation rules
  * remove entire schemas/Tables/Objects
  * remove API endpoints from the API specification

† *This is generally done because not all parts of the HSDS schemas may be relevant to a Profile's use-cases and context. This doesn't prevent a publisher from publishing this data but tooling should treat this as 'additional' data from the perspective of the Profile and ignore it for the purposes of validation and quality checks*

Profiles are generally developed and maintained by third parties to satisfy particular requirements for their context. These could arise from a community need, legal structures, taxonomy requirements, or other affordances of service provision specific to that context. In general, Profiles should provide robust documentation allowing a publisher or data user to understand its rules and structures both independantly and in comparison to the core HSDS schema.

```{admonition} Profiles are not Extensions
While Profiles may be used to extend the functionality of HSDS, they should not be mistaken as modular or re-usable "Extensions". The Profiles mechanism differs from that of an Extensions mechanism in other standards; as such, a given dataset may only implement a single Profile.
```

## Existing HSDS Profiles

You are encouraged to use existing profiles to publish HSDS data when suitable. This is a very straightforward process.

1. **Ensure that you have implemented the Profile-specific requirements.** You should check the requirements of the Profile that you are publishing against and ensure that your data conforms to these. Do you have all the minumum required fields? Are all of your fields in the correct format?
2. **Declare that you are using the Profile via your API output.** The [`/` endpoint](../hsds/api_reference.md#endpoint-details) of the HSDS API Reference includes a response key/value pair for `profile`. You should populate this with the URI to the profile you are using. Profile documentation should clearly state this value to avoid confusion &ndash; if you are unsure which value to use please get in touch with the implementer of the profile.

* [The Open Referral UK Profile](https://docs.openreferraluk.org/en/latest/)

## Developing a new Profile

If the core HSDS standard or an existing Profile does not adequately meet the needs of your context, you may wish to develop a new Profile to provide the standardization and meaning that you and other publishers in your context will need to produce good quality HSDS data.

Creating a new HSDS Profile is an involved but straightforward process:

1. **Engage and Discuss** with the community about which problems you're trying to solve and how best to address them. This may include people in the [wider Open Referral community](https://forum.openreferral.org/) and other implementors in your context who may want to contribute directly to your profile. Speaking to people who have implemented other HSDS Profiles may help you with thinking through common challenges when developing a new Profile.
2. **Develop and Document** the Profile. All new Profiles should use the [Example Profile repository](https://github.com/openreferral/hsds_example_profile) as a starting point because it contains all of the tools required to generate your final Profile schemas as well as a basic documentation site. The Example Profile contains technical guidance and examples on creating a profile inside its README file. You may want to expand upon the basic documentation generated by the tools in the repository.
3. **Share and Support** your new Profile! Make an announcement on the [HSDS forums](https://forum.openreferral.org/) and start producing data conforming to your Profile. If others are using your Profile, you may want to collaborate with them to plan changes to the Profile or answer questions by expanding your documentation.

Under-the-hood, Profiles should conform to the [HSDS Profile Reference](profiles). The best way to do this is by using the [Example Profile Repository](https://github.com/openreferral/hsds_example_profile) as a base since it is part of the Profiles reference implementation.
