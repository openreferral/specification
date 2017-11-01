Design Principles
=================

The design of  Human Services Data Specification (HSDS) is based on five principles: simplicity, factuality, fidelity, provenance, and accessibility.

The underlying model is _simple_, consisting of four entities and associated properties that support _who_, _what_, _where_, _when_, and _how_ questions. The relationships between the entities are flexible and can model the majority of use cases for human services data. The goal is to build the simplest useful thing.

The data provided in HSDS are _factual_. This means that the information is verifiable and can be reproduced across different systems and applications.

Data _fidelity_ is important. Data reproduced and used across different information systems must retain the same meaning and be represented in a consistent way. Toward this end, HSDS leverages the use of existing standards such as ISO time and date formats.

The format also specifies information about the _provenance_ of the data, as well as a history of changes, in order to provide an authoritative source. The format supports column level metadata for a high degree of granularity.

In order to ensure accessibility, the data must be a machine-readable and -writable format that can also be created, updated and deleted with a basic text editor.



### Related standards

During the development of HSDS, we have charted our course in conscious relation to a range of related standards. These include:

#### AIRS Standards

The [Alliance of Information and Referral Systems](http://airs.org) is an international professional association that provides standards, accreditations and certifications for the information and referral sector. 

AIRS and Open Referral engaged in active dialogue during the development of HSDS, to ensure interoperability across the emerging HSDS and [the AIRS XML schema](https://github.com/airsalliance/airs-xml/blob/v3.1.0/trunk/airs.xsd).

AIRS standards' define expected practices within an information and referral (I&R) program, and promotes best practices to meet the needs of an I&R program's community. According to [AIRS Standards and Quality Indicators for Professional Information and Referral](http://www.airs.org/files/public/AIRS_Standards_7_Final.pdf):

> The Standards address all aspects of an I&R operation. They define the information and referral process in concrete terms; establish criteria for database development; mandate support for community planning activities; incorporate a broad view of collaboration at the local, state or provincial, regional and national levels; include provisions for the socially responsible use of technology; and describe the role of information and referral services in times of disaster.

As described in the AIRS Standards and Quality Indicators publication, the Resource Database Standard:

> The Resource Database standards require that the I&R service develop, maintain, use and disseminate an accurate, up-to-date resource database that contains information about available community resources including details about the services they provide and the conditions under which services are available. The database includes resources that support the inquirer’s right to accurate, consistent, comprehensive and unbiased information and the ability of the I&R service to be a non-partisan, non-ideological and impartial information source for available nonprofit, government and for-profit services that meet the organization’s inclusion/exclusion criteria. The database is maintained by trained resource specialists.

In part through engagement with Open Referral, [AIRS recently adopted an open source license (CC 4.0 BY-SA) for their Style Guide](https://openreferral.org/the-2016-airs-style-guide-newly-open-sourced/).


#### schema.org for Civic Services (W3C)

The [Civic Services schema](https://www.w3.org/wiki/WebSchemas/CivicServices) is a W3C-approved vocabulary, originally proposed by the Google.org Social Impact team in 2013, to extend the Schema.org schemas to better support the description of public civic services.

It is a new vocabulary, similar to the European Commission ISA Core Public Service vocabulary. Its purpose is to improve search engines’ understanding of these services. The schema will provide "*enough information to determine the service, the area covered by the service, and relevant information for using the service*."


#### National Information Exchange Model (NIEM)

NIEM is the National Information Exchange Model. It is an interagency initiative to create a national-level interoperable information sharing and data exchange. The NIEM project began in 2005 as a joint venture between the U.S. Department of Homeland Security (DHS) and the U.S. Department of Justice (DOJ). The NIEM uses both the Global Justice XML Data Model (GJXDM) reference model and the GJXDM XML-based framework and support infrastructure.

NIEM consists of a  collection of data components organized in multiple kinds of XML Schema that are classified into broad categories. Of interest to the Human Services Data  Standard are the NIEM Core Components. There are two types of NIEM Core components:

1. Universal components such as Person, Date, Location etc., that are relevant and understood across all domains
2. Common components such as LocationStateUSPostalServiceCode, LocationStateCanadianProvinceCode etc., that are relevant and understood across two or more domains

The schema for the core components is available from [niem.gov](http://release.niem.gov/niem/niem-core/2.0/niem-core.xsd). Open Referral encourages the establishment of compatibility with NIEM.


### Related Taxonomies

Open Referral recognizes the existence of a diverse array of taxonomies to describe types of services, organizations, and people for whom services are available. Given that such categories are inherently subjective, whereas Open Referral's format is describing only *factual* data, we do not prescribe a specific taxonomy. In the meantime, we recognize the existence of the following taxonomies, and offer guidance for using them in conjunction with HSDS.


#### AIRS/211 Taxonomy

[The AIRS/211 taxonomy](https://www.airs.org/i4a/pages/index.cfm?pageid=3386) is widely used among certified providers of ‘information and referral’ services, as well as some government agencies. The Taxonomy is a hierarchical system that contains more than 9,000 fully-defined terms that cover the complete range of human services. 

The AIRS/211 taxonomy is the intellectual property of 2-1-1 Los Angeles. Licensees can use the taxonomy with data formatted in HSDS.


#### Open Eligibility

[Open Eligibility](http://openeligibility.org/) is a "*simple way to categorize human services and human situations*." It uses common categories for quickly finding human services for people in need, service providers and navigators. It takes a different approach than the AIRS taxonomy by offering up sets of 'tags' that describe _types of services_ and _types of situations_. Open Referral has included [a fork of Open Eligibility in our Github organization](https://github.com/openreferral/openeligibility).


#### National Taxonomy of Exempt Entities (NTEE)

[The NTEE system](http://nccs.urban.org/classification/national-taxonomy-exempt-entities) is used by the IRS and the National Center for Charitable Statistics to classify nonprofit organizations. It is also used by the Foundation Center to classify both grants and grant recipients (typically nonprofits or governments).
