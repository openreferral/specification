Human Services Data Specification (HSDS)
========================================

**The Human Services Data Specification (HSDS)** is Open Referral's core data exchange format. HSDS is designed to support the publication of open, interoperable community resource directory data.

The [reference documentation](hsds-spec) describes the structure of HSDS data, and provides the authoritative definition of the fields using in HSDS and [HSDA](hsda).

```eval_rst
.. admonition:: When to use HSDS?
    :class: hint

    .. markdown::

    HSDS is designed to support bulk exchange of data between different information and referral systems. It is appropriate to use when you want to export a collection of information about services, the locations where they can be accessed, and the organizations that deliver them.

    HSDS data can then be imported into other systems that support the Open Referral specifications.

    You can also use HSDS as a reference model when designing a data system to store or exchange human service information.

    HSDS has been designed around the core **required** fields to support search and discovery of services, and the **recommend** fields that are useful to a wide range of users. Individual implementations may extend HSDS with their own properties.

    For interactive exchange of data between systems (e.g. fetching individual services, or synchronising data) the Human Services Data API Suite (HSDA) is available.


```


**HSDS pages**

```eval_rst
.. toctree::
   :maxdepth: 2

   :caption: Standard
   about
   reference
   logical_model
   variations_interoperability
   formatting
   changelog
   
   :caption: Guidance

   use_cases
   schedules
   producing_sharing
   sample_data 
   detail_dates 
   classifications
   identifiers
   extending


   ```
