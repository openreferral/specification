Logical Model
=============

There are four core tables in HSDS:

1. **organization** - that provide services;
2. **service** - that have descriptions, classifications and other information to allow potential service users to identify those services that can meet their needs;
3. **location** - where services are delivered - either physically, or virtually (over the phone or internet);
4. **service_at_location** - a link table used to record where particular services are available, and to override any default service or location information, with information specific to the service at a specific location.

Additional information about organizations, locations and services is held in separate tables and linked by a foreign key. Some tables only have a single foreign key for a single core table. Others can be linked to multiple core tables. 

The table below indicates the foreign keys that link tables with the core tables in HSDS. Note that other links between non-core tables exist. See the [entity relationship diagram](#entity-relationship-diagram-full-version) below and [reference](reference.md) page for more detail.

```{eval-rst}

+--------------------------------+--------------+---------+----------+---------------------+
| Table                          | organization | service | location | service_at_location |
+================================+==============+=========+==========+=====================+
| program                        | X            |         |          |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| service                        | X            |         |          |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| service_at_location            |              | X       | X        |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| location                       | X            |         |          |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| phone                          | X            | X       | X        | X                   |
+--------------------------------+--------------+---------+----------+---------------------+
| contact                        | X            | X       |          | X                   |
+--------------------------------+--------------+---------+----------+---------------------+
| address                        |              |         | X        |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| schedule                       |              | X       | X        | X                   |
+--------------------------------+--------------+---------+----------+---------------------+
| funding                        | X            | X       |          |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| service_taxonomy               |              | X       |          |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| eligibility                    |              | X       |          |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| service_area                   |              | X       |          |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| required_document              |              | X       |          |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| language                       |              | X       | X        |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| accessibility                  |              |         | X        |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| cost_option                    |              | X       |          |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| organization_identifier        | X            |         |          |                     |
+--------------------------------+--------------+---------+----------+---------------------+

```

When a single row contains multiple foreign keys, these must be interpreted as 'or' relationships. For example, a phone number applies to the service OR the organization OR the service_at_location. 

The following tables do not have a foreign key for any of the core tables:

- **attribute** can be joined to any table other than itself or **metadata** using `_link_id`, and to **taxonomy_term** using `taxonomy_term_id`.
- **taxonomy_term** can be joined to **taxonomy** using `taxonomy_id`.
- **metadata** can be joined with any table other than itself or **attribute** using `resource_id`.

## Entity Relationship Diagram

```{eval-rst}

`[enlarge] <../_images/entity_relationship_diagram_core_tables.svg>`_

.. raw:: html
    :file: ../extras/_images/entity_relationship_diagram_core_tables.svg
    
```

## Entity Relationship Diagram (Full version)

<div style="background-color: #77DD77;">

Core tables are shown in green.

</div>

<div style="background-color: #AEC6CF;">

Other tables are shown in blue.

</div>

```{eval-rst}

`[enlarge] <../_images/entity_relationship_diagram.svg>`_

.. raw:: html
    :file: ../extras/_images/entity_relationship_diagram.svg
    
```
