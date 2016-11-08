Entities
========

+------------------------------------+-------------------------+
| Entity                             | Attributes              |
+====================================+=========================+
| organization                       | id                      |
|                                    |  name                   |
|                                    |  alternate\_name        |
|                                    |  description            |
|                                    |  email                  |
|                                    |  url                    |
|                                    |  tax\_status            |
|                                    |  tax\_id                |
|                                    |  year\_incorporated     |
+------------------------------------+-------------------------+
| program                            | id                      |
|                                    |  organization\_id       |
|                                    |  name                   |
|                                    |  alternate\_name        |
+------------------------------------+-------------------------+
| service                            | id                      |
|                                    |  organization\_id       |
|                                    |  program\_id            |
|                                    |  location\_id           |
|                                    |  name                   |
|                                    |  alternate\_name        |
|                                    |  description            |
|                                    |  url                    |
|                                    |  email                  |
|                                    |  status                 |
|                                    |  application\_process   |
|                                    |  wait\_time             |
+------------------------------------+-------------------------+
| service\_at\_location              | id                      |
|                                    |  service\_id            |
|                                    |  location\_id           |
|                                    |  url                    |
|                                    |  email                  |
+------------------------------------+-------------------------+
| location                           | id                      |
|                                    |  organization\_id       |
|                                    |  name                   |
|                                    |  alternate\_name        |
|                                    |  transportation         |
|                                    |  latitude               |
|                                    |  longitude              |
|                                    |  description            |
+------------------------------------+-------------------------+
| phone                              | id                      |
|                                    |  service\_id            |
|                                    |  organization\_id       |
|                                    |  contact\_id            |
|                                    |  number                 |
|                                    |  extension              |
|                                    |  type                   |
|                                    |  department             |
|                                    |  country\_prefix        |
+------------------------------------+-------------------------+
| contact                            | id                      |
|                                    |  organization\_id       |
|                                    |  service\_id            |
|                                    |  name                   |
|                                    |  title                  |
|                                    |  department             |
|                                    |  email                  |
+------------------------------------+-------------------------+
| physical\_address                  | id                      |
|                                    |  location\_id           |
|                                    |  attention              |
|                                    |  address\_1             |
|                                    |  address\_2             |
|                                    |  address\_3             |
|                                    |  address\_4             |
|                                    |  city                   |
|                                    |  state\_province        |
|                                    |  postal\_code           |
|                                    |  country                |
+------------------------------------+-------------------------+
| postal\_address                    | id                      |
|                                    |  location\_id           |
|                                    |  attention              |
|                                    |  address\_1             |
|                                    |  address\_2             |
|                                    |  address\_3             |
|                                    |  address\_4             |
|                                    |  city                   |
|                                    |  state\_province        |
|                                    |  postal\_code           |
|                                    |  country                |
+------------------------------------+-------------------------+
| regular\_schedule                  | id                      |
|                                    |  service\_id            |
|                                    |  location               |
|                                    |  weekday                |
|                                    |  opens\_at              |
|                                    |  closes\_at             |
+------------------------------------+-------------------------+
| holiday\_schedule                  | id                      |
|                                    |  service\_id            |
|                                    |  location\_id           |
|                                    |  opens\_at              |
|                                    |  closes\_at             |
|                                    |  closed                 |
|                                    |  start\_date            |
|                                    |  end\_date              |
+------------------------------------+-------------------------+
| metadata                           | id                      |
|                                    |  resource\_id           |
|                                    |  last\_action\_date     |
|                                    |  last\_action\_type     |
|                                    |  field\_name            |
|                                    |  previous\_value        |
|                                    |  replacement\_value     |
|                                    |  updated\_by            |
+------------------------------------+-------------------------+
| accreditation                      | id                      |
|                                    |  organization\_id       |
|                                    |  accreditation          |
+------------------------------------+-------------------------+
| license                            | id                      |
|                                    |  organization\_id       |
|                                    |  license                |
+------------------------------------+-------------------------+
| funding                            | id                      |
|                                    |  organization\_id       |
|                                    |  service                |
|                                    |  source                 |
+------------------------------------+-------------------------+
| eligibility                        | id                      |
|                                    |  service\_id            |
|                                    |  eligibility            |
+------------------------------------+-------------------------+
| service\_area                      | id                      |
|                                    |  service\_id            |
|                                    |  service\_area          |
+------------------------------------+-------------------------+
| required\_document                 | id                      |
|                                    |  service\_id            |
|                                    |  document               |
+------------------------------------+-------------------------+
| fee                                | id                      |
|                                    |  service\_id            |
|                                    |  fee                    |
+------------------------------------+-------------------------+
| payment\_accepted                  | id                      |
|                                    |  service\_id            |
|                                    |  payment                |
+------------------------------------+-------------------------+
| interpretation\_services           | id                      |
|                                    |  service\_id            |
|                                    |  language               |
+------------------------------------+-------------------------+
| language                           | id                      |
|                                    |  service\_id            |
|                                    |  location\_id           |
|                                    |  language               |
+------------------------------------+-------------------------+
| accessibility\_for\_disabilities   | id                      |
|                                    |  location\_id           |
|                                    |  accessibility          |
+------------------------------------+-------------------------+
| meta\_table\_description           | id                      |
|                                    |  name                   |
|                                    |  language               |
|                                    |  character\_set         |
+------------------------------------+-------------------------+

***


## Appendix C

<a name="package"/>
### Tabular Data Package

The data will be in CSV formatted files with one CSV file per entity. This is the minimum requirement for distributing data.  The recommended format for distributing data is the [Tabular Data Package](http://data.okfn.org/doc/tabular-data-package) which is composed of the data in CSV files and a metadata file, called datapackage.json, that stores the schema in a JSON file using the [Data Package format](http://data.okfn.org/doc/data-package).

A CSV file is required for each entity in the logical model. The files and their associated attributes are listed below.

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
