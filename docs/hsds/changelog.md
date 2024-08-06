Changelog
=========

This page provides the list of changes that have been made to the HSDS schema.

## [v3.1](TODO)

TODO: update link to this

### Backwards compatible schema changes


## [v3.0](https://github.com/openreferral/specification/milestone/7)

### Backwards incompatible schema changes

 * `accessibility_for_disabilities` table renamed to `accessibility`
 * `physical_address` and `postal_address` combined and renamed to `address`
 * `service_attribute` and `other_attribute` combined and renamed to `attribute`
 * All `id` fields now have format `uuid`
 * `eligibility` entity removed
 * `payment_accepted` entity removed

### Other schema changes

* For `service`
    * added `alert`
    * added `assured_date` and `assurer_email`
    * added `eligibility_description`
    * added `fees_description`
    * added `last_modified`
    * added `minimum_age` and `maximum_age`
* For `organization`
    * added `logo`
    * added `parent_oranization_id`
    * added `uri`
    * added `website`
* `organization_identifier` entity added
* For `location`
    * added `external_identifier` and `external_identifier_type` fields
    * added `location_type` to express if `physical` or `virtual`
    * added `url` for external source for location information
* `taxonomy` entity added
* `contact` can now have a `location`
* `cost_option` entity added
* For `schedule`
    * added `attending_type`
    * added `notes`
    * added `schedule_link`
* For `service_area`
    * added `extent` and `extent_type`
    * added `uri`
* For `taxonomy_term`
    * added `taxonomy_id` and `taxonomy_detail`
    * added `name`
    * added `code`
    * added `term_uri`
* `phone` can now have a language.
* For `language`
    * added `code` field for ISO language code
    * added `name` and `note` fields
* `description` added to `program`
* `uri` added to `required_document`

### Deprecated fields

* `organization` fields `tax_id` and `tax_status`
* `service` fields `licenses`, `fees` and `wait_time`

### Other changes

* Copy edit of all table and field descriptions;
* Added JSON schemas;
* Updated datapackage.JSON and example data to reflect schema changes;
* Updated reference page to reflect schema changes;
* Updated logical model to reflect schema changes;
* Updated formatting guidance to reflect schema changes;
* Updated identifier guidance to differentiate between internal and third-party identifiers;
* Added reference page on UK compliance;
* Created new API reference and reference page, removed HSDA pages;

## [v2.0.1](https://github.com/openreferral/specification/releases/tag/2.0.1)

* Re-added erroneously removed opens_at and closes_at fields to schedule table;
* Added further guidance on schedules in response to community feedback;
* Added timezone and count RRULE fields to schedule table

## [v2.0](https://docs.google.com/document/d/1N3Vg_ZOXGkWuF8L2rVpLInXpKtfHgRIcIMA-y_7qPqg/edit)

* Renamed service_taxonomy table to service_attribute to apply terms to services;
* Renamed taxonomy table to taxonomy_term;
* Added taxonomy table to describe taxonomies;
* Added other_attribute table to apply terms to non-service objects;
* Renamed regular_schedule table to schedule;
* Changed fields in schedule table to support RRULE-based entries;
* Added non-normative guidance to documentation; 
* Clarified normative pages;
* Added ways for standard to be adapted to particular use-cases;
* Added guidance for extending the standard;
* Improved consistency of constraints in schema;
* Fixed various bugs relating to inconsistencies;
* Added documentation to illustrate classifications and scheduling;
* Added auto-building ERD

## [v1.1.0](https://github.com/openreferral/specification/issues?utf8=%E2%9C%93&q=is%3Aissue%20milestone%3A%221.1%20Release%22%20)

* Updated logical model: providing guidance on handling multiple foreign keys, and clarifying use of service_at_location;
* Removing direct location_id from service so that services should always be connected to locations via the service_at_location table;
* Adding the service_taxonomy table (missing from earlier releases);
* Adding description to service_area;
* Updates to the description of the funding table;
* Updates to the address block to include region, and deprecate additional address fields;
* Moving fees and interpretations into the service table;
* Adding missing accreditations and licenses fields;
* Adding a language field to phone;
* Adding a missing primary key to the taxonomy table;
* Fixing the foreign key on accessibility_for_disabilities;
* Adding format validation for URIs and e-mail addresses to the schema;

## [v1.0.1](https://github.com/openreferral/specification/issues?utf8=%E2%9C%93&q=is%3Aissue%20milestone%3A%221.0%20Tidy%20Up%22%20)

* Bug fixes to schema and documentation
* Removed redundant documentation pages

## [v1.0](https://github.com/openreferral/specification/releases/tag/1.0)

* Final version
* Changed relationship between location and service from 1:n to n:m

## v0.9

* Changes based on public comments in v0.8 include:
    - revising revising schedule entities and attributes  as recommended,
    - grammatical and punctuation edits,
    - changing SMS attribute to a phone type
    - changed language_line to interpretation_services
* Released on github as a markdown document
* Added a datapackage.json example on github

## v0.8

* Added formatting specification for address, phone, description

## v0.4 - v0.7

* Updated data model based on reviewer comments
* Tested logical model by importing data from iCarol database
* Exported data in HSDS format from previous tes
* Added Open Eligibility taxonomic overlay to logical model using Postgres ltree
* Tested OE taxonomy by querying the service_taxonomy to return the related service
* Provided test scripts and example data

## v0.3

* Refined logical model to conform to Boyce-Codd third normal form
* Updated datapackage.json to match logical model
* Included enumerations for  entities in datapackage.json
* Added section on NIEM and relation to specification
* Made changes based on reviewer comments

## v0.2

* Added related standards
* Added use cases based on persona
* Reformatted the controlled vocabulary.
* Added a logical model
* Made changes from [comments](https://docs.google.com/spreadsheets/d/19Sf7DPMooO6edEm8FcIjSv6VeC1Ar55YDBvLTl-S4dE/edit?usp=sharing) collected during the second RFC period
* Added Appendix C: Tabular  Data Package description

## v0.1

* Changes from comment period, workshop comments, and a running [summary of comments](https://docs.google.com/spreadsheets/d/19Sf7DPMooO6edEm8FcIjSv6VeC1Ar55YDBvLTl-S4dE/edit?usp=sharing)
* Directly references [RFC4180](http://tools.ietf.org/html/rfc4180) for CSV formatting

## v0.0

No changes.
