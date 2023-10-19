Overview and Model
====================

The Human Services Data Specification (HSDS; sometimes referred to as "The Open Referral format") is an exchange format for publishing machine-readable data about health, human, and social services: their locations, and the organizations that provide them. We define "human services" broadly, to include any organizational resource that is made available for a person in need – such as food assistance, job training, child care, etc.

**The primary use case served by HSDS is the provision of human service directory information as "open data," to be consumed by any third-party information system.**

It has features that can be used as the basis of a real-time system. Developers of such systems should ensure that the data that they're using contains enough detail and is updated regularly enough to support that use, particularly around times that there may be variations (such as holidays).  

Government entities, community organizations, and people often face difficulty obtaining timely and correct data about human services. The Human Services Data Specification facilitates the open exchange and use of human service data (often known as "community resource data") among these stakeholders. To that end, this is an interchange format designed to complement – _not replace_ – existing storage formats currently in use.

All organizations that provide services or referrals to services, as well as entities that distribute digital human service directory information, are invited to publish their data in this format, whether they be governments at the local, regional, or national level; civic organizations; software developers; etc.

## HSDS' Model

HSDS defines a set of objects and the relationships between them, in order to model the provision of Human Services.

The nature of Human Services means that HSDS needs to provide a flexible way of modelling the services, organizations providing them, locations, and other attributes of Human Services. A location may have many services operating out of it, a single organization may be responsible for several services, a service may have multiple sources of funding, a single phone number can be used for a service, and organization, and a location.

To this end, HSDS does not have a hierarchical model with a single top-level object. HSDS instead defines a number of objects and the relationships between them. This allows systems and people to exchange and use HSDS data in a manner suited to their use-case. For example, someone may prefer an organization-oriented view whereas others may prefer a location-oriented view.

Each object in HSDS has an `id` property which contains a *uuid* as specified by [RFC 4122](https://datatracker.ietf.org/doc/html/rfc4122). This enables applications to store their data in a normalized database. When exchanging or publishing the data, applications must dereference these to meet the requirements of the HSDS JSON schema.

In tabular serializations of HSDS (see [Serialization & Publication Formats](serialization)) the `id` property can act as a foreign key without the need for dereferencing.


### Core objects

HSDS designates four objects as "core". These are the objects modelling concepts which are central to supporting all of HSDS core use-cases:

1. `organization` &ndash; See [Organization](schema_reference.md#organization). Organizations that provide services.
2. `service` &ndash; See [Service](schema_reference.md#service). The service itself, with descriptions and classifications to allow potential service users to identify services which may meet their needs.
3. `location` &ndash; See [Location](schema_reference.md#location). Locations where services are delivered either physically or virtually (e.g. over the phone or internet).
4. `service_at_location` &ndash; See [Service at Location](schema_reference.md#service_at_location). A link between a `service` and a `location` to record where particular servics are available. This can also be used to override any default `service` or `location` information with information specific to a service at a specific location.

Additional information about organizations, locations, and services is held in separate objects. Full details are available on the [Schema Reference](schema_reference) page.

### Relationships between objects

The relationships between objects in HSDS can be either one-to-one (1:1) or one-to-many (1:many). Some objects may have a relationship with a single core object, or to multiple types of core object.

The canonical source of information about the relationships between HSDS is the JSON Schemas which define each object. These are presented on the [Schema Reference](schema_reference) page. Wherever you see a property with a Type of `Object`, this is a 1:1 relationship between the two objects. Wherever you see a property with a Type of `array[object]`, this is a 1:many relationship between the two objects.

The following table and diagrams are designed to provide an overview of the different relationships between objects. **If there are any conflicts between this and the HSDS Schemas, then the Schemas take precedence**.

#### Table of relationships

```{eval-rst}
.. csv-table::
   :file: ../figures/table-of-relationships.csv
   :header-rows: 1
```

##### Attributes, Metadata, and Taxonomy Terms

HSDS also defines some special objects which have relationships that fall outside of the usual 1:1 and 1:many relationships defined above.

* `attribute` &ndash; see [Attribute](schema_reference.md#attribute). This can be joined to any table other than itself or `metadata` by using its `_link_id` property. It can be linked to `taxonomy_term` using its `taxonomy_term_id` property.
* `metadata` &ndash; see [Metadata](schema_reference.md#metadata). This can be joined to any table other than itself or `attribute` through its `resource_id` property.
* `taxonomy_term` &ndash; see [Taxonomy Term](schema_reference.md#taxonomy_term). This can be joined to `taxonomy` using its `taxonomy_id` property.

#### Entity Relationship Diagram

##### Core Objects only

```{eval-rst}

`[enlarge] <../_images/entity_relationship_diagram_core_tables.svg>`_

.. raw:: html
    :file: ../extras/_images/entity_relationship_diagram_core_tables.svg
    
:download:`[download] <../extras/_images/entity_relationship_diagram_core_tables.svg>`
```

##### Full

<div style="background-color: #77DD77;">

Core objects are shown in green.

</div>

<div style="background-color: #AEC6CF;">

Other objects are shown in blue.

</div>

```{eval-rst}

`[enlarge] <../_images/entity_relationship_diagram.svg>`_

.. raw:: html
    :file: ../extras/_images/entity_relationship_diagram.svg
    
:download:`[download] <../extras/_images/entity_relationship_diagram.svg>`

```
