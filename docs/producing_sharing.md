Producing and Sharing Compliant Data
====================================

HSDS is a [Frictionless Data Datapackage](http://specs.frictionlessdata.io/data-packages/) specification. A datapackage contains a number of CSV files, and a JSON file (datapackage.json) that describes their contents.

### CSV Formatting

For ease of data production, Human Services Data Specification specifies that all files are provided in a simple comma-separated value format (.csv). The CSV format described herein conforms to [RFC4180](http://tools.ietf.org/html/rfc4180). Text will used the UTF-8 character set.

### Telephone Formatting

HSDS uses[ E.164](http://www.itu.int/rec/T-REC-E.164-201011-I/en) number formatting for phone numbers E.164 numbers can have a maximum of fifteen digits and are usually written as follows: [+][country code][subscriber number including area/region code]. Phone numbers can contain delimiters.

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

The description field may include HTML or MarkDown tags.

### Guidance on Mapping Fields and Values

Source data may or may not map directly to the HSDS. Guidelines are listed below to reduce ambiguity.

* A null value is acceptable for required fields.
* If there are no values for an entity, the corresponding CSV file can be omitted.
* A data source may have a field that can map to an HSDS field but in many cases are not populated. A null value is acceptable.
* In some cases, such as name, using the organization name for either or both location or service is acceptable. This is up to the discretion of the data producer.
* Mapping a field is at the data producer’s discretion, but it is acceptable for some entities to map to multiple entities, for example an organization, service, or location can have a contact.
* The HSDS is a baseline of data, if the the data producer’s has additional fields or entities that they wish to add, the specification can be extended to incorporate them. The data producer should provide documentation of how the specification has been extended.

### Files & Attributes Summary

The files and their associated attributes are listed below.

<table>
  <tr>
    <th>File</th>
    <th>Attributes</th>
    <th>Required/Optional</th>
  </tr>
  <tr>
    <td>organization.csv</td>
    <td>id
name
alternate_name
description
email
url
legal_status
tax_status
tax_id
year_incorporated
</td>
    <td>required</td>
  </tr>
  <tr>
    <td>program.csv</td>
    <td>id
organization_id
name
alternate_name</td>
    <td>required</td>
  </tr>
  <tr>
    <td>service.csv</td>
    <td>id
organization_id
program_id
location_id
name
alternate_name
description
url
email
status
application_process
wait_time</td>
    <td>required</td>
  </tr>
  <tr>
  <tr>
    <td>service_at_location.csv</td>
    <td>id
service_id
location_id
url
email
    </td>
    <td>required</td>
  </tr>
  <tr>
    <td>location.csv</td>
    <td>id
organization_id
name
alternate_name
transportation
latitude
longitude
description</td>
    <td>required</td>
  </tr>
  <tr>
    <td>phone.csv</td>
    <td>id
location_id
service_id
organization_id
contact_id
number
extension
number_type
department
country_prefix</td>
    <td>required</td>
  </tr>
  <tr>
    <td>contact.csv</td>
    <td>id
organization_id
service_id
name
title
department
email</td>
    <td>required</td>
  </tr>
  <tr>
    <td>physical_address.csv</td>
    <td>id
location_id
attention
address_1
address_2
address_3
address_4
city
state_province
postal_code
country</td>
    <td>required</td>
  </tr>
  <tr>
    <td>postal_address.csv</td>
    <td>id
location_id
attention
address_1
address_2
address_3
address_4
city
state_province
postal_code
country</td>
    <td>required</td>
  </tr>
  <tr>
    <td>regular_schedule.csv</td>
    <td>id
service_id
location
weekday
opens_at
closes_at</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>holiday_schedule.csv</td>
    <td>id
service_id
location_id
opens_at
closes_at
closed
start_date
end_date</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>metadata.csv</td>
    <td>id
resource_id
last_action_date
last_action_type
field_name
previous_value
replacement_value
updated_by</td>
    <td>recommended</td>
  </tr>
  <tr>
    <td>accreditation.csv</td>
    <td>id
organization_id
accreditation</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>license.csv</td>
    <td>id
organization_id
license</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>funding.csv</td>
    <td>id
organization_id
service_id
source</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>eligibility.csv</td>
    <td>id
service_id
eligibility</td>
    <td>required</td>
  </tr>
  <tr>
    <td>service_area.csv</td>
    <td>id
service_id
service_area</td>
    <td>required</td>
  </tr>
  <tr>
    <td>required_document.csv</td>
    <td>id
service_id
document</td>
    <td>required</td>
  </tr>
  <tr>
    <td>fee.csv</td>
    <td>id
service_id
fee</td>
    <td>required</td>
  </tr>
  <tr>
    <td>payment_accepted.csv</td>
    <td>id
service_id
payment</td>
    <td>required</td>
  </tr>
  <tr>
    <td>interpretation_services.csv</td>
    <td>id
service_id
language</td>
    <td>required</td>
  </tr>
  <tr>
    <td>language.csv</td>
    <td>id
service_id
location_id
language</td>
    <td>required</td>
  </tr>
  <tr>
    <td>accessibility_for_disabilities.csv</td>
    <td>id
location_id
accessibility</td>
    <td>required</td>
  </tr>
  <tr>
    <td>meta_table_description.csv</td>
    <td>id
name
language
character_set</td>
    <td>optional</td>
  </tr>
</table>
