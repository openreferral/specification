Producing and Sharing Compliant Data
====================================

HSDS uses the Frictionless Data project's [Data Package specification.](https://specs.frictionlessdata.io/)

A Data Package contains a number of CSV files with defined column headings, and a JSON Table Schema file (datapackage.json) that describes their contents.

### CSV Formatting

For ease of data production, Human Services Data Specification specifies that all files must be provided in a simple comma-separated value format (.csv).

CSV files must conform to [RFC4180](http://tools.ietf.org/html/rfc4180) and use the UTF-8 character set.

### Telephone Formatting

HSDS uses [E.164](http://www.itu.int/rec/T-REC-E.164-201011-I/en) number formatting for phone numbers E.164 numbers can have a maximum of fifteen digits and are usually written as follows: [+][country code][subscriber number including area/region code]. Phone numbers can contain delimiters.

### Address Formatting

At the time this document was drafted, a standard addressing format has not been established. ISO 19160 provides a standard for addressing, but isn't in common use. Based on address standards by country from the Universal Postal Union, the following format will capture the majority of addresses in use globally:

    address_1
    address_2
    address_3
    address_4
    city/locality
    state/province/region
    postal code
    country

Because of the variety of addressing systems, every field is composed of alphanumeric characters. The country field uses ISO-3166 alpha 2 codes.

### Description Field Formatting

The description field may include HTML or Markdown tags.