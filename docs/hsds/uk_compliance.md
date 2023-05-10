UK Compliance
=========

## Applicability

This page describes the rules for achieving compliance with the UK profile of LG Inform Plus, as required by most UK organizations that require compliance. The rules described here are in addition to the required endpoints and parameters for UK compliance, which are given in the [API reference](api_reference) page.

Rules apply to the Open Referral Human Services Data Specification (HSDS) with the UK profile applied. This profile defines which fields are needed by a standard UK implementation.

Compliance rules apply purely to Application Programming Interfaces (APIs) because Open Referral is a standard for interchanging data. It does not concern itself with how data is stored.

These compliance rules apply to Open Referral versions 3.0 and above. For compliance with the prior Open Referral UK standard, see the [Open Referral UK API Validation Rules](https://developers.openreferraluk.org/ApiValidation/).

All required and recommended API endpoints (also called “web methods”) are RESTful API GET queries to work over HTTPS.  POST and PUT endpoints are not required but may be provided in some implementations.

The full syntax of API endpoints and responses are given in the [API reference](api_reference) page.


## Compliance rules


### Openness

API endpoints must be publicly open without any need to register or apply API keys. They may be throttled to prevent excessive use and denial of service attacks.

All API endpoints (sometimes called “web methods”) from one publisher’s dataset must have the same API stub, e.g. [https://bristol.openplace.directory/o/ServiceDirectoryService/v2](https://bristol.openplace.directory/o/ServiceDirectoryService/v2) for the Bristol City Council services feed.


### Security

To enable widespread use of APIs, especially by simple HTML/JavaScript applications, all HTTP responses will implement the following Cross-Origin Resource Sharing (CORS) header:

`Access-Control-Allow-Origin: *`


### Open Referral version and profile

A HSDS 3.0 UK application profile is forthcoming. Required endpoints and parameters for UK compliance are provided in the [API reference](api_reference) page.


## Other properties and endpoints

Instances of Open Referral compliant directories may provide further endpoints and query response properties so long as they do not conflict with those in the Open Referral specification. We recommend using a convention to denote local (supplier-specific) properties.

## Changelog

This section contains changes which are specific to the requirements for achieving UK compliance. For a list of changes to the broader HSDS standard, please see the [Changelog](changelog) page.

### v3.0

#### Services

##### Added

* `alert`
* `alternate_name`
* `application_process`
* `assurer_email`
* `attributes` (collection)
* `metadata` (collection)
* `eligibility_description`
* `fees_description`
* `interpretation_services`
* `last_modified`
* `licenses`
* `maximum_age`
* `metadata`
* `minimum_age`
* `wait_time`


##### Removed

* `deliverable_type`
* `eligibilitys` (collection)
* `holiday_schedules` (collection)
* `reviews` (collection)
* `service_taxonomys` (collection)

##### Renamed

* `fundings to funding` (collection)
* `regular_schedules to schedules` (collection)

#### Phones

##### Replaced

* `contact` replaced with `description`

##### Added

* `extension`
* `languages`
* `metadata`
* `type`

#### Contacts

##### Added

* `attributes` (collection)
    * `phones`
    * `program`
    * `required_documents`


##### Removed

* `service`

#### cost_options

##### Added

* `attributes`
* `metadata`
* `currency`

##### Removed

* `linkId`
* `service`

#### language

##### Added

* `attributes`
* `code`
* `name`
* `metadata`
* `note`

##### Removed

* `language`
* `serviceId`

#### organization

##### Added

* `alternate_name`
* `attributes`
* `contacts`
* `email`
* `funding`
* `legal_status`
* `locations`
* `metadata`
* `organization_identifiers`
* `parent_organization_id`
* `phones`
* `programs`
* `tax_id`
* `tax_status`
* `website`
* `year_incorporated`

#### service_areas

##### Added

* `attributes`
* `description`
* `extent_type`
* `metadata`
* `name`

#### service_at_locations

##### Added

* `attributes`
* `contacts`
* `description`
* `location`

#### location

##### Added

* `accessibility`
* `addresses`
* `alternate_name`
* `attributes`
* `contacts`
* `external_identifier`
* `external_identifier_type`
* `languages`
* `location_type`
* `metadata`
* `phones`
* `schedules`
* `transportation`
* `url`
