Design Principles
=================

The design of  Human Services Data Specification is based on five principles: simplicity, factual, fidelity, provenance, and accessibility.

The underlying model is simple, consisting of four entities and associated properties that support who, what, where and when questions. The relationships between the entities are flexible and can model the majority of use cases for human services data. The goal is to build the simplest useful thing.

The data provided in the Human Services Data Specification are factual. This means that the information is verifiable and can be reproduced across different systems and applications.

Data fidelity is important. Data reproduced and used across different information systems must retain the same meaning and be represented in a consistent way. Implementing fidelity leverages the use of existing standards such as ISO time and date formats.

The standard must include information about the provenance of the data as well as a history of changes in order to provide an authoritative source. The standard supports column level metadata for a high degree of granularity.

The data must be a machine readable and writable format that can be created, updated and deleted with a basic text editor.

### Current Human Services Data Specification Capabilities

Version 1.0 of the specification supports:

* Provisioning the minimum amount of data needed to implement a service for search and discovery of human services provided by organizations
* Machine readable format that can be imported directly into a relational database or viewed and edited using commonly available software such as a spreadsheet or a text editor
* A common data exchange format between different information and referral systems.


### Related standards

During the development of HSDS we have had reference to a range of related standards. These include:

#### AIRS Standards

The AIRS Standards defines expected practices within an information and referral (I&R) program and best practices to meet the needs of their community. According to [AIRS Standards and Quality Indicators for Professional Information and Referra](http://www.airs.org/files/public/AIRS_Standards_7_Final.pdf)l:

"The Standards address all aspects of an I&R operation. They define the information and referral process in concrete terms; establish criteria for database development; mandate support for community planning activities; incorporate a broad view of collaboration at the local, state or provincial, regional and national levels; include provisions for the socially responsible use of technology; and describe the role of information and referral services in times of disaster. “

The Resource Database Standard of the AIRS Standards is pertinent to the Human Services Data Specification. As described in the AIRS Standards and Quality Indicators publication, the Resource Database Standard:

"The Resource Database standards require that the I&R service develop, maintain, use and disseminate an accurate, up-to-date resource database that contains information about available community resources including details about the services they provide and the conditions under which services are available. The database includes resources that support the inquirer’s right to accurate, consistent, comprehensive and unbiased information and the ability of the I&R service to be a non-partisan, non-ideological and impartial information source for available nonprofit, government and for-profit services that meet the organization’s inclusion/exclusion criteria. The database is maintained by trained resource specialists."

#### schema.org for Public Civic Services

[Public Civil Services](http://www.w3.org/wiki/images/0/03/Services_for_schema.org_%28DRAFT_2013-06-27%29.pdf) is a [W3C proposal](http://www.w3.org/wiki/WebSchemas/CivicServices) by the Google.org Social Impact team that extends the Schema.org schemas to better support the description of public civic services.

It is a new vocabulary, similar to the European Commission ISA Core Public Service vocabulary. Its purpose is to improve search engines’ understanding of these services. The schema will provide "*enough information to determine the service, the area covered by the service, and relevant information for using the service*."

#### Open Eligibility

[Open Eligibility](http://openeligibility.org/) is a "*simple way to categorize human services and human situations*." It uses common categories for quickly finding human services for people in need, service providers and navigators. It takes a different approach than the AIRS standards by grouping similar services and repeatedly and empirically testing the categories. Open Eligibility explains their taxonomy as:

> "Every provider administers at least one program. Every program provides at least one client-facing service. And every service is represented with a service tag. Our taxonomy is a categorization of those service tags."

#### National Information Exchange Model (NIEM)

NIEM is the National Information Exchange Model. It is an interagency initiative to create a national-level interoperable information sharing and data exchange. The NIEM project began in 2005 as a joint venture between the U.S. Department of Homeland Security (DHS) and the U.S. Department of Justice (DOJ). The NIEM uses both the Global Justice XML Data Model (GJXDM) reference model and the GJXDM XML-based framework and support infrastructure.

NIEM consists of a  collection of data components organized in multiple kinds of XML Schema that are classified into broad categories. Of interest to the Human Services Data  Standard are the NIEM Core Components. There are two types of NIEM Core components:

1. Universal components such as Person, Date, Location etc., that are relevant and understood across all domains
2. Common components such as LocationStateUSPostalServiceCode, LocationStateCanadianProvinceCode etc., that are relevant and understood across two or more domains

The schema for the core components is available from [niem.gov](http://release.niem.gov/niem/niem-core/2.0/niem-core.xsd).
