Common Vocabulary
=================

THIS PAGE HAS BEEN DEPRECATED. FOR THE SCHEMA'S VOCABULARY, REFER TO [THE HSDS REFERENCE TABLES](https://github.com/openreferral/specification/blob/master/docs/reference.md).


The Human Services Data Specification seeks to establish a common vocabulary among information and referral (I&R) practitioners. The vocabulary reflects the simple model of four required entities: Organizations, Locations, Services, and Metadata. An optional entity is Programs, which is available for organizations that use Programs for grouping Services.  Entities have attendant properties and some properties are complex and have multiple attributes. For example addresses are comprised of several pieces of information..

The relationship between organizations as the primary entity and services and locations as subordinate entities is loosely coupled in recognition that service providers may organize the data in different ways and that human services continue to evolve. For example, some services such as virtual support groups or informational websites may not have a physical location.

<table>
  <tr>
    <th>Term</th>
    <th>Description</th>
    <th>Example</th>
    <th>Required,
Recommended or Optional</th>
  </tr>
  <tr>
    <td>Accessibility for Disabilities</td>
    <td>Description of assistance or infrastructure that facilitate access to clients with disabilities.</td>
    <td>wheelchair</td>
    <td>recommended</td>
  </tr>
  <tr>
    <td>Accreditation</td>
    <td>Accreditation is the formal evaluation of an organization or program against best practice standards set by an accrediting organization.</td>
    <td>Child and Youth Development Program</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Alternate Name</td>
    <td>Alternative or commonly used name for an organization, program, service, or location.</td>
    <td>MSWC Pre-Natal Program</td>
    <td>recommended</td>
  </tr>
  <tr>
    <td>Application Process</td>
    <td>The steps needed to access the service.</td>
    <td>Call for appointment with counselor.</td>
    <td>recommended</td>
  </tr>
  <tr>
    <td>Attention</td>
    <td>An address can have an 'Attention' label to specify the recipient.</td>
    <td>Joshua Fisher</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>City</td>
    <td>The city where the Organization, Service or Location resides.</td>
    <td>Redwood City</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Closes At </td>
    <td>Time when a service or location is closed</td>
    <td>2013-11-05T13:15:30Z</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Closed</td>
    <td>Indicates if a service or location is closed during a public holiday</td>
    <td>true</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Contact</td>
    <td>A person associated with an organization or service.</td>
    <td>April Smith</td>
    <td>recommended</td>
  </tr>
  <tr>
    <td>Country</td>
    <td>The country where the Organization, Service or Location is located. Uses ISO 3361-1 country codes (two letter abbreviations)</td>
    <td>US</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Country Code Prefix</td>
    <td>The country code prefix of the phone.</td>
    <td>19</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Last Action Date</td>
    <td>The date when information was created,updated, or deleted</td>
    <td>2013-11-05T13:15:30Z</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Department</td>
    <td>The department that the contact works in.</td>
    <td>Human Resources</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Description</td>
    <td>A brief summary about the organization, location or service. It can contain markup such as HTML or Markdown.
</td>
    <td>Haven for Hope assists homeless individuals find housing and employment.</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Required Document</td>
    <td>Document required to apply for or receive  service.</td>
    <td>Government issued identification card</td>
    <td>optional
</td>
  </tr>
  <tr>
    <td>Eligibility</td>
    <td>Rules or guidelines that determine who can receive the service.</td>
    <td>teen</td>
    <td>recommended</td>
  </tr>
  <tr>
    <td>Email</td>
    <td>Email for organization or service</td>
    <td>info@havenforhope.org</td>
    <td>recommended</td>
  </tr>
  <tr>
    <td>End Date</td>
    <td>The last day that a service or location is closed during a public or private holiday</td>
    <td>2013-11-05T</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Extension</td>
    <td>Phone extension </td>
    <td>210</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Fee</td>
    <td>A listing of the costs of services.</td>
    <td>free - school immunization</td>
    <td>recommended</td>
  </tr>
  <tr>
    <td>Field Name</td>
    <td>Name of field modified</td>
    <td>license</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Funding</td>
    <td>Source of funds for organization or service</td>
    <td>Philanthropic Ventures</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Regular Schedule</td>
    <td>Time and days when the service is available to the public. </td>
    <td>2013-11-05T13:15:30Z</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Holiday Schedule</td>
    <td>Time and days when the service is available to the public during public holidays or other events</td>
    <td>2013-11-05T13:15:30Z</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Id</td>
    <td>Each organization, address, contact, phone and metadata record has a unique identifier.</td>
    <td>BEC0BA53-4A24-400F-8F05-A24831D54618</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Interpretation Service</td>
    <td>AA phone translation service at a service provider. Languages are listed as ISO639-1 codes.</td>
    <td>es</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Language</td>
    <td>Languages, other than English, in which the service is delivered. Languages are listed as ISO639-1 codes.</td>
    <td>es</td>
    <td>recommended</td>
  </tr>
  <tr>
    <td>Last Action Timestamp</td>
    <td>Timestamp when data was changed.</td>
    <td>2013-11-05T13:15:30Z</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Last Action Type</td>
    <td>The kind of change made to the data create,update, delete</td>
    <td>delete</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Latitude</td>
    <td>Y coordinate of location expressed in decimal degrees in WGS84 datum.</td>
    <td>-93.35556</td>
    <td>recommended</td>
  </tr>
  <tr>
    <td>Legal Status</td>
    <td>The legal status defines the conditions that an organization is operating under; e.g. non-profit, private corporation or a government organization.</td>
    <td>non-profit</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>License</td>
    <td>An organization may have a license issued by a government entity to operate legally.</td>
    <td>food handler license</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Location Id</td>
    <td>Each service can include a location referenced by a Location.Id</td>
    <td>1CB7893F-86A1-49FD-9193-87C233E2ADB2</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Longitude</td>
    <td>X coordinate of location expressed in decimal degrees in WGS84 datum. </td>
    <td>recommended</td>
    <td>recommended</td>
  </tr>
  <tr>
    <td>Opens At </td>
    <td>Time when a service or location is open</td>
    <td>2013-11-05T13:15:30Z</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Physical Address</td>
    <td>A physical address describes the location of a service or organization.</td>
    <td>1510 South Hackberry
San Antonio, TX 78210</td>
    <td>recommended</td>
  </tr>
  <tr>
    <td>Postal Address</td>
    <td>A postal address describes where a service or organization receives mail.</td>
    <td>1510 South Hackberry
San Antonio, TX 78210</td>
    <td>recommended</td>
  </tr>
  <tr>
    <td>Payment Accepted</td>
    <td>The kind of payment accepted for a service.</td>
    <td>Medicare</td>
    <td>recommended</td>
  </tr>
  <tr>
    <td>Name</td>
    <td>The official or public name of the organization, service, program, location, or contact</td>
    <td>Haven for Hope</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Replacement  Value</td>
    <td>The replacement value</td>
    <td>Happy House</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Organization Id</td>
    <td>The organization.Id is the unique identifier for an organization</td>
    <td>BEC0BA53-4A24-400F-8F05-A24831D54618</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Contact Id</td>
    <td>contact.Id is the unique identifier for a contact</td>
    <td>388BD194-5731-4D66-B8FC-F48A84DDD1FC</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Phone</td>
    <td>The phone number used to contact an organization, service, or location.</td>
    <td>210-512-3345</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Postal Code</td>
    <td>The postal code that the Organization, Service or Location resides. Zip+4 is optional in the US.</td>
    <td>99043</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Previous  Value</td>
    <td>The value that has been updated</td>
    <td>Happy Shining House</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Resource Id</td>
    <td>Each service, program. location, address, or contact will have a unique identifier. Unique ids are UUIDs.</td>
    <td>8BBE1753-97EF-4683-BB93-CA7A32D59A58</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Service Area</td>
    <td>The geographic area where a service is available.</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>Service Id</td>
    <td>The service.id is the unique identifier for a service</td>
    <td>8BBE1753-97EF-4683-BB93-CA7A32D59A58</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Start Date</td>
    <td>The first day that a service or location is closed during a public or private holiday</td>
    <td>2013-11-01</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Source</td>
    <td>Source of funding</td>
    <td>Private Foundation Grant</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>State/Province</td>
    <td>The state (or province) that the Organization, Service or Location resides. Uses ISO 3361-2 state codes (two letter abbreviations), for example in the US and Canada</td>
    <td>CA</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Status</td>
    <td>The current status of the service.</td>
    <td>active</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Address_1</td>
    <td>This property contains the street number, prefix, street name, and suffix.</td>
    <td>2022 S. Palmetto Ave</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Address_2</td>
    <td>This property contains additional address information such as the suite.</td>
    <td>Suite 201</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Address_3</td>
    <td>This property contains additional address information.</td>
    <td></td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Address_4</td>
    <td>This property contains additional address information.</td>
    <td></td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Tax Id</td>
    <td>The tax.id is a government issued identifier used for the purpose of tax administration.</td>
    <td>12-3456789</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Taxonomy id</td>
    <td>Taxonomy terms related to a service</td>
    <td></td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Tax Status</td>
    <td>Government assigned tax designation. for tax-exempt organ</td>
    <td>charitable tax exempt organization</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Title</td>
    <td>Title of the contact.</td>
    <td>Director</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Transportation</td>
    <td>Access to public or private transportation to and from the location.</td>
    <td>Bus 20 stop at corner of Hackberry and Pine.</td>
    <td>recommended</td>
  </tr>
  <tr>
    <td>Updated By</td>
    <td>The name of the person who updated a value </td>
    <td>Johnson Henry</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Previous Value</td>
    <td>The previous value of a field that has been updated</td>
    <td>Center for Children</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Wait time</td>
    <td>Time a client may expect to wait before receiving a service.</td>
    <td>1 hour</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>URL</td>
    <td>URL of the organization or a service</td>
    <td>htttp://havenforhope.org/</td>
    <td>optional</td>
  </tr>
  <tr>
    <td>Weekday</td>
    <td>Day of the week that service or location is open.</td>
    <td>Monday</td>
    <td>required</td>
  </tr>
  <tr>
    <td>Year Incorporated</td>
    <td>Date when organization was legally formed as a corporation.</td>
    <td>1970</td>
    <td>optional</td>
  </tr>
</table>
