# About Open Referral’s Human Service Data API Suite

**The Human Service Data API Suite (HSDA)** consist of a set of protocols for “resource directory data,” i.e. information about the accessibility of health, human, and social services. (Specifically, these protocols describe the management of information about organizations, the services they provide, and the locations at which they can be accessed, along with associated subresources.) 

In this context, human services are broadly defined as any organizational resource available to people in need — food assistance, legal aid, job training, etc. 

HSDA’s goal is to enable interoperability among diverse technologies that might use resource directory information to help meet people’s needs.

The HSDA is produced by [the Open Referral Initiative](https://openreferral.org), and is based on the schema articulated by Open Referral’s [Human Service Data Specification](https://github.com/openreferral/specification), an interchange format for bulk publishing of resource directory data. 

These specifications use the [OpenAPI](https://www.openapis.org/) format. This enables them to be be freely used as ‘blueprints’ for the design and deployment of API-driven platforms, and also as tools to translate pre-existing APIs into this common format. 

## HSDA is currently in version 1.2 
The Human Service Data API specifications consist of a core protocol and associated secondary protocols. 

### The Core HSDA Protocol

[The core HSDA protocol](hsda-spec) (HSDA) describes read/write functionality for the Open Referral’s Human Services Data Specification (HSDS), including resources for organizations, their locations, and their services. Through the HSDA Full protocol, third-parties can access entire contents of a database with a single call.

### Secondary HSDA Protocols

HSDA v1.2 also includes complementary sets of “microservice” protocols that address specific user needs (as [documented in user personas and use cases](https://docs.google.com/document/d/1XqueBVbRVgR0BVGjDbUdN4suUYfMKm7yJm1f3nRsGtY/edit#heading=h.ukhvby684u5x) generated through our community’s participatory research process). This modular microservice approach enables specific protocols to be developed independently, while working complementarily in concert with each other.

#### HSDA Content Protocols
These secondary HSDA specifications facilitate the flow of resource directory data.

* [HSDA Search](hsda-seach): the Search protocol is specifically designed for third-party software developers to enable their tools to query a resource database for specific sets of information.

* [HSDA Bulk](hsda-bulk): the Bulk protocol is specifically designed for database administrators to enable mass transfer of data between systems — with changelogs, scheduling, and other key features.

* [HSDA Taxonomy](hsda-taxonomy): the Taxonomy protocol specifies the use of taxonomic schema for core resources. It can accommodate multiple classification formats.

#### HSDA Administration Protocols: 
These secondary specifications facilitate the monitoring, permissioning and associated management of a resource directory API platform.

* [HSDA Meta](hsda-meta): the Meta protocol logs all activity across the above protocols. This data about API usage is sometimes known as ‘exhaust,’ or ‘paradata’ — valuable for both technical monitoring as well as research and analysis of community needs.

* [HSDA Management](hsda-management): the Management protocol specifies which users have access to what sections of the database, enabling API providers to have fine-grained control over their traffic.

* [HSDA Validator](hsda-utility): tools for building and validating data schema to help stabilize operations.

* [HSDA Orchestration](hsda-orchestration): the Orchestration protocol facilitates activities across  and between HSDA protocols.


### The Open Referral Developer Portal 
[The Open Referral Developer Portal](http://developer.open.referral.adopta.agency/) serves as both fully-functional documentation of the HSDA suite and redeployable code that can serve as a developer portal for any resource referral platform. 

## Learn more and get involved

To learn more about this work, visit [the website for Open Referral](https://openreferral.org/).

To ask questions or offer suggestions about HSDA, [submit an issue using the Github repository for this project](https://github.com/openreferral/api-specification/issues). 

To learn more about the data schema behind HSDA, visit [the Human Services Data Specification (HSDS) documentation](https://docs.openreferral.org/hsds/).

## Previous HSDA iterations 
[HSDA v1.1](https://openreferral.github.io/api-specification/hsda-v1.1/)


## License

The Human Service Data API Suite and associated materials are open source materials, licensed under [Creative Commons 4.0 By-Attribution Share-Alike](https://creativecommons.org/licenses/by-sa/4.0/).


```eval_rst
.. toctree::
   :maxdepth: 2

   hsda
   hsda-search
   hsda-bulk
   hsda-taxonomy
   hsda-orchestration
   hsda-meta
   hsda-management
   hsda-utility

```
