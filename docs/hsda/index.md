```{eval-rst}
.. _hsda:
```

# Human Service Data API Suite (HSDA)

The **Human Service Data API Suite (HSDA)** consist of a set of protocols for accessing, updating, exchanging and synchronizing community resource directory data.

HSDA is one of the Open Referral specifications, and builds on [HSDS](hsds). Open Referral's goal is to enable interoperability among diverse technologies that might use resource directory information to help meet people’s needs.

```{eval-rst}
.. admonition:: When to use HSDA?
    :class: hint
    
    .. markdown::

    HSDA provides a family of OpenAPI specifications that can be used as a blueprint for the design or adaptation of API platforms to provide read or read/write access to information on organizations, services, locations and the details about them.

    The core API protocol can be used by mobile apps, websites and other services to access individual resources, or listings. Providers can also support updates via API if they choose. In conjuction with the search protocol, this provides most of the functionality needed for simple access and exchange of data.

    More complex data synchronization between distributed systems is supported through the additional protocols. 

```

These specifications use the [OpenAPI](https://www.openapis.org/) format. This is widely supported in a range of tools and software libraries. 

The source of the specification is found on GitHub ([openreferral/api-specification](https://github.com/openreferral/api-specification)) and [issues can be raised in the issue tracker here](https://github.com/openreferral/api-specification/issues).

## Overview

HSDA versioning is independent from HSDS. HSDA is currently in version 1.2 

The Human Service Data API specifications consist of a core protocol and associated secondary protocols. 

### Core Protocol

[The core HSDA protocol](hsda-spec) (HSDA) describes read/write functionality for the Open Referral’s Human Services Data Specification (HSDS), including resources for organizations, their locations, and their services. Through the HSDA Full protocol, third-parties can access entire contents of a database with a single call. 

```{eval-rst}
Find the core HSDA protocol `in a YAML file here <../_static/openapi-hsda.yaml>`_.
```

### Secondary Protocols

HSDA v1.2 also includes complementary sets of “microservice” protocols that address specific user needs (as [documented in user personas and use cases](https://docs.google.com/document/d/1aodu4BUDVbUwVD02zlFs0WkCMn3UQEX1VHyI8ej6BCU/edit) generated through our community’s participatory research process). This modular microservice approach enables specific protocols to be developed independently, while working complementarily in concert with each other.

##### Content Protocols

These secondary HSDA specifications facilitate the flow of resource directory data. 

* [HSDA Search](hsda-search): the Search protocol is specifically designed for third-party software developers to enable their tools to query a resource database for specific sets of information.

* [HSDA Taxonomy](hsda-taxonomy): the Taxonomy protocol specifies the use of taxonomic schema for core resources. It can accommodate multiple classification formats.

* [HSDA Bulk](hsda-bulk): the Bulk protocol is specifically designed for database administrators to enable mass transfer of data between systems — with changelogs, scheduling, and other key features.

#### Administration Protocols: 
These secondary specifications facilitate the monitoring, permissioning and associated management of a resource directory API platform. These are **experimental features**, and are subject to ongoing development.

* [HSDA Meta](hsda-meta): the Meta protocol logs all activity across the above protocols. This data about API usage is sometimes known as ‘exhaust,’ or ‘paradata’ — valuable for both technical monitoring as well as research and analysis of community needs.

* [HSDA Management](hsda-management): the Management protocol specifies which users have access to what sections of the database, enabling API providers to have fine-grained control over their traffic.

* [HSDA Validator](hsda-utility): tools for building and validating data schema to help stabilize operations.

* [HSDA Orchestration](hsda-orchestration): the Orchestration protocol facilitates activities across  and between HSDA protocols.


## History

HSDA has been through a number of iterations during development:

* [HSDA v1.1](https://openreferral.github.io/api-specification/v1.1/openapi.yaml) is accessible for reference.

Prior to HSDA, the Ohana API acted as a reference implementation of an early version the Human Services Data Spec, and it was used as one of the inputs to the recent API development process. Systems based on Ohana will need to be updated to follow the new HSDA specifications. 

## Acknowledgments 

The HSDA has been designed by @kinlane, the [API Evangelist](https://apievangelist.com), with guidance from a range of contributors in the Open Referral network. 

The first cycle of HSDA's development was [made possible by support](https://openreferral.org/the-open-referral-api-project/) from the [Digital Impact](https://digitalimpact.org/about/) program at [Stanford's Center for Philanthropy and Civil Society](https://pacscenter.stanford.edu/).


## Components

```{eval-rst}
.. toctree::
   :maxdepth: 2

   hsda
   hsda-search
   hsda-taxonomy
   hsda-bulk
   hsda-orchestration
   hsda-meta
   hsda-management
   hsda-utility

```
