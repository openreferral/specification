Changelog
=========

[v0.0](https://docs.google.com/document/d/1RwHkuPeG5cztk-gcofuqsXRxWaTYZeHa8mLjC2doCwk/edit?usp=sharing)

No changes.

[v0.1](https://docs.google.com/document/d/18vdB0DUvBfp6UcYQ78KaMmN3Ei2riThJL48V7TTOHHQ/edit?usp=sharing)

* Changes from comment period, workshop comments, and a running [summary of comments](https://docs.google.com/spreadsheets/d/19Sf7DPMooO6edEm8FcIjSv6VeC1Ar55YDBvLTl-S4dE/edit?usp=sharing).
* Directly references [RFC4180](http://tools.ietf.org/html/rfc4180) for CSV formatting

[v0.2](https://docs.google.com/document/d/1z4jSLCoDIqvkKnazZVH_7qP_5HkcgKhnPJLu1mUZBgA/edit?usp=sharing)

* Added related standards
* Aded use cases based on persona
* Reformatted the controlled vocabulary.
* Added a logical model
* Made changes from [comments](https://docs.google.com/spreadsheets/d/19Sf7DPMooO6edEm8FcIjSv6VeC1Ar55YDBvLTl-S4dE/edit?usp=sharing) collected during the second RFC period
* Added Appendix C: Tabular  Data Package description

[v0.3](https://docs.google.com/document/d/1RH89UY7FDndivWNmtQkql4tdRTwYnCZluyu8itp5nTw/edit?usp=sharing)

* Refined logical model to conform to Boyce-Codd third normal form
* Updated datapackage.json to match logical model
* Included enumerations for  entities in datapackage.json
* Added section on NIEM and relation to specification
* Made changes based on reviewer comments.

[v0.4 - v0.7](https://docs.google.com/document/d/1xTqNm3ShgL6vQtknMmkCNJeWapekrLxd1qpEa8WiEIk/edit?usp=sharing)

* Updated data model based on reviewer comments
* Tested logical model by importing data from iCarol database
* Exported data in HSDS format from previous tes
* Added Open Eligibility taxonomic overlay to logical model using Postgres ltree
* Tested OE taxonomy by querying the service_taxonomy to return the related service
* Provided test scripts and example data

[v0.8](https://docs.google.com/document/d/1gmNS4pBvkX4cI2wtH3Qco3uGF4LLTq1OJ0Pb_CLuxlk/edit?usp=sharing)

* Added formatting specification for address, phone, description

[v0.9](https://docs.google.com/document/d/1jbgO92cPAUygQI-0_DtLXrdPQKbPNNIkxDr-3WvdFNE/edit?usp=sharing)

* Changes based on public comments in v0.8 include:
    - revising revising schedule entities and attributes  as recommended,
    - grammatical and punctuation edits,
    - changing SMS attribute to a phone type
    - changed language_line to interpretation_services
* Released on github as a markdown document
* Added a datapackage.json example on github

[v1.0](https://docs.google.com/document/d/1dkipRm_YL3K28oTSG-NFZRMHYiv10ZZJzJlakZglOyc/edit?usp=sharing)

* Final version
* Changed relationship between location and service from 1:n to n:m

[v1.0.1](https://github.com/openreferral/specification/issues?utf8=%E2%9C%93&q=is%3Aissue%20milestone%3A%221.0%20Tidy%20Up%22%20)

* Bug fixes to schema and documentation
* Removed redundant documentation pages

[v1.1.0](https://github.com/openreferral/specification/issues?utf8=%E2%9C%93&q=is%3Aissue%20milestone%3A%221.1%20Release%22%20)

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
