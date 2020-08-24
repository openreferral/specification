Producing and Sharing Compliant Data
====================================

HSDS uses the Frictionless Data project's [data package specification. ](https://specs.frictionlessdata.io/)

A data package contains a number of CSV files with defined column headings, and a JSON Table Schema file (datapackage.json) that describes their contents.

### CSV Formatting

For ease of data production, Human Services Data Specification specifies that all files are provided in a simple comma-separated value format (.csv).

CSV files should conforms to [RFC4180](http://tools.ietf.org/html/rfc4180). and use the UTF-8 character set.

### Telephone Formatting

HSDS uses [E.164](http://www.itu.int/rec/T-REC-E.164-201011-I/en) number formatting for phone numbers E.164 numbers can have a maximum of fifteen digits and are usually written as follows: [+][country code][subscriber number including area/region code]. Phone numbers can contain delimiters.

### Address Formatting

At the time this document was drafted, a standard addressing format has not been established. ISO 19160  is in the preliminary stages of an addressing standard but has not yet produced a standard. Based on address standards by country from the Universal Postal Union,  the following format will capture the majority of addresses in use globally.

    address_1
    address_2
    address_3
    adderss_4
    city/locality
    state/province/region
    postal code
    country

Because of the variety of addressing systems, every field is composed of alphanumeric characters. The country field uses ISO-3166 alpha 2 codes.

### Description Field Formatting

The description field may include HTML or Markdown tags.

### Guidance on Mapping Fields and Values

Source data may or may not map directly to the HSDS. Guidelines are listed below to reduce ambiguity.

* A null value is acceptable for required fields.
* If there are no values for an entity, the corresponding CSV file can be omitted.
* A data source may have a field that can map to an HSDS field but in many cases are not populated. A null value is acceptable.
* In some cases, such as name, using the organization name for either or both location or service is acceptable. This is up to the discretion of the data producer.
* Mapping a field is at the data producer’s discretion, but it is acceptable for some entities to map to multiple entities, for example an organization, service, or location can have a contact.
* The HSDS is a baseline of data, if the the data producer’s has additional fields or entities that they wish to add, the specification can be extended to incorporate them. The data producer should provide documentation of how the specification has been extended.

### Files & Attributes Summary

The files and their associated attributes are [listed on the reference page](reference.md).


