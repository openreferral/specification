UK Compliance
=========


## Applicability

This page describes the rules for achieving compliance with the UK profile of LG Inform Plus, as required by most UK organisations that require compliance.

Rules apply to the Open Referral Human Services Data Specification (HSDS) with the UK profile applied. This profile defines which fields are needed by a standard UK implementation.

Compliance rules apply purely to Application Programming Interfaces (APIs) because Open Referral is a standard for interchanging data. It does not concern itself with how data is stored.

These compliance rules apply to Open Referral versions 3.0 and above. For compliance with the prior Open ReferraL UK standard, see [Open Referral UK API Validation Rules](https://developers.openreferraluk.org/ApiValidation/).

All required and recommended API endpoints (also called “web methods”) are RESTful API GET queries to work over HTTPS.  POST and PUT endpoints are not required but may be provided in some implementations.

The full syntax of API endpoints and responses, and information on required endpoints and parameters for UK compliance, are given in the [API reference](api_reference) page.


## Compliance rules


### Openness

API endpoints must be publicly open without any need to register or apply API keys. They may be throttled to prevent excessive use and denial of service attacks.

All API endpoints (sometimes called “web methods”) from one publisher’s dataset must have the same API stub, e.g. [https://bristol.openplace.directory/o/ServiceDirectoryService/v2](https://bristol.openplace.directory/o/ServiceDirectoryService/v2) for the Bristol City Council services feed.


### Security

To enable widespread use of APIs, especially by simple HTML/JavaScript applications, all HTTP responses will implement the following Cross-Origin Resource Sharing (CORS) header:

`Access-Control-Allow-Origin: *`


### Open Referral version and profile

A HSDS 3.0 UK application profile is forthcoming. Required endpoints and parameters for UK compliance are provided in the [API reference](api_reference) page.



### Lists

Web endpoints that return lists of entities, such as services returned by a `/services` endpoint must be paginated.

The header returned must include these properties:

- `"total_items"`: the total number of entities (e.g. services) returned
- `"total_pages"`: the total number of pages
- `"page_number"`: the number of the current page
- `"size"`: the number of entities in aq page
- `"first_page"`: a Boolean value indicating if this is the first page
- `"last_page"`: a Boolean value indicating if this is the last page
- `"empty"`: a Boolean value indicating if there is an empty result set

After the header, a lists endpoint will contain an array of its main entities (e.g. services). The array will normally contain all direct properties of each item but need not contain arrays of child entities (e.g. service contacts).


## 3. Other properties and endpoints

Instances of Open Referral compliant directories may provide further endpoints and query response properties so long as they don’t conflict with those in the Open Referral specification. We recommend using a convention to denote local (supplier-specific) properties.