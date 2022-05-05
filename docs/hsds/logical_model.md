Logical Model
=============

There are four core tables in HSDS:

1. **organization** - that provide services;
2. **service** - that have descriptions, classifications and other information to allow potential service users to identify those services that can meet their needs;
3. **location** - where services are delivered - either physically, or virtually (over the phone or Internet);
4. **service_at_location** - a link table used to record where particular services are available, and to over-ride any default service or location information, with information specific to the service at a specific location.

Additional information about organizations, locations and services is held in separate tables and linked by a foreign key. Some tables only have a single foreign key for a single core table. Others can be linked to different core tables. 

The table below indicates the foreign keys that exist. 

```{eval-rst}

+--------------------------------+--------------+---------+----------+---------------------+
| Table                          | organization | service | location | service_at_location |
+================================+==============+=========+==========+=====================+
| program                        | X            |         |          |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| service                        | X            |         |          |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| service_attribute              |              | X       |          |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| service_at_location            |              | X       | X        |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| location                       | X            |         |          |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| phone*                         | X            | X       | X        | X                   |
+--------------------------------+--------------+---------+----------+---------------------+
| contact                        | X            | X       |          | X                   |
+--------------------------------+--------------+---------+----------+---------------------+
| physical_address               |              |         | X        |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| postal_address                 |              |         | X        |                     |
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
| payment_accepted               |              | X       |          |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| language                       |              | X       | X        |                     |
+--------------------------------+--------------+---------+----------+---------------------+
| accessibility_for_disabilities |              |         | X        |                     |
+--------------------------------+--------------+---------+----------+---------------------+

```

*Phone can also be linked to **contact**. 

When a single row contains multiple foreign keys, these must be interpreted as 'OR' relationships. 

E.g. a phone number applies to the service OR the organisation OR the service_at_location. 

## ER Diagram

```{eval-rst}

`[enlarge] <../../_images/entity_relationship_diagram_core_tables.svg>`_

.. raw:: html
    :file: ../extras/_images/entity_relationship_diagram_core_tables.svg
    
```

## ER Diagram (Full version)

<div style="background-color: #77DD77;">

Core tables are shown in green.

</div>

<div style="background-color: #AEC6CF;">

Other tables are shown in blue.

</div>

```{eval-rst}

`[enlarge] <../../_images/entity_relationship_diagram.svg>`_

.. raw:: html
    :file: ../extras/_images/entity_relationship_diagram.svg
    
```
