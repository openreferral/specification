API Reference
=============

The API reference provides an [OpenAPI](https://www.openapis.org/) specification that can be used as a blueprint for the design or adaptation of API platforms to provide read or read/write access to information on organizations, services, locations and the details about them. The API protocol  provides most of the functionality needed for simple access and exchange of data.

The source of the specification is found on [GitHub](https://github.com/openreferral/specification/tree/3.0-dev/schema/openapi.json) and [issues can be raised in the issue tracker](https://github.com/openreferral/specification/issues).

## Lists

Web endpoints that return lists of entities, such as services returned by a `/services` endpoint must be paginated.

The header returned must include these properties:

- `"total_items"`: the total number of entities (e.g. services) returned
- `"total_pages"`: the total number of pages
- `"page_number"`: the number of the current page
- `"size"`: the number of entities in aq page
- `"first_page"`: a Boolean value indicating if this is the first page
- `"last_page"`: a Boolean value indicating if this is the last page
- `"empty"`: a Boolean value indicating if there is an empty result set

After the header, a lists endpoint will contain an array of its main entities (e.g. services). The array will normally contain all direct properties of each item but need not contain arrays of child entities (e.g. service contacts).


## Endpoint details

This section contains details of each API endpoint. Each section presents an endpoint defined by the API and presents a technical reference for that endpoint including query parameters, status codes, and compliance rules for HSDS and Open Referral UK.

### The `/` endpoint

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
      /
   :encoding: utf-8
```

```{eval-rst}
.. admonition::
   The following compliance rules apply to this endpoint:
   
   * **Required by HSDS?** Yes
   * **Required by Open Referral UK?** Yes
   * **Required parameters for Open Referral UK** page

```

### The `/services/{id}` endpoint

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
      /services/{id}
   :encoding: utf-8
```

```{eval-rst}
.. admonition::
   The following compliance rules apply to this endpoint:
   
   * **Required by HSDS?** Yes
   * **Required by Open Referral UK?** Yes

```

#### Response details

This API response will return [service](schema_reference.md#service) data.

### The `/services` endpoint

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
      /services
   :encoding: utf-8
```

```{eval-rst}
.. admonition::
   The following compliance rules apply to this endpoint:
   
   * **Required by HSDS?** Yes
   * **Required by Open Referral UK?** Yes
   * **Required parameters for Open Referral UK** page

```
#### Response details

This API response will return [service](schema_reference.md#service) data.

### The `/taxonomies/{id}` endpoint

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
      /taxonomies/{id}
   :encoding: utf-8
```

```{eval-rst}
.. admonition::
   The following compliance rules apply to this endpoint:
   
   * **Required by HSDS?** No
   * **Required by Open Referral UK?** Yes

```

#### Response details

This API response will return [taxonomy](schema_reference.md#taxonomy) data.

### The `/taxonomies` endpoint

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
     /taxonomies
   :encoding: utf-8
```

```{eval-rst}
.. admonition::
   The following compliance rules apply to this endpoint:
   
   * **Required by HSDS?** No
   * **Required by Open Referral UK?** Yes
   * **Required parameters for Open Referral UK** page

```
#### Response details

This API response will return [taxonomy](schema_reference.md#taxonomy) data.

### The `/taxonomy_terms/{id}` endpoint

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
     /taxonomy_terms/{id}
   :encoding: utf-8
```

```{eval-rst}
.. admonition::
   The following compliance rules apply to this endpoint:
   
   * **Required by HSDS?** No
   * **Required by Open Referral UK?** No

```

#### Response details

#### Response details

This API response will return [taxonomy terms](schema_reference.md#taxonomy_term) data.

### The `/taxonomy_terms` endpoint

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
     /taxonomy_terms
   :encoding: utf-8
```

```{eval-rst}
.. admonition::
   The following compliance rules apply to this endpoint:
   
   * **Required by HSDS?** No
   * **Required by Open Referral UK?** No
   * **Required parameters for Open Referral UK** page

```

#### Response details

This API response will return [taxonomy terms](schema_reference.md#taxonomy_term) data.

### The `/organizations/{id}` endpoint

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
     /organizations/{id}
   :encoding: utf-8
```

```{eval-rst}
.. admonition::
   The following compliance rules apply to this endpoint:
   
   * **Required by HSDS?** No
   * **Required by Open Referral UK?** No

```

#### Response details

This API response will return [organization](schema_reference.md#organization) data.

### The `/organizations` endpoint

* **Required by HSDS?** No
* **Required by Open Referral UK?** No

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
     /organizations
   :encoding: utf-8
```

```{eval-rst}
.. admonition::
   The following compliance rules apply to this endpoint:
   
   * **Required by HSDS?** No
   * **Required by Open Referral UK?** No
   * **Required parameters for Open Referral UK** page

```

#### Response details

This API response will return [organization](schema_reference.md#organization) data.

### The `/service_at_locations/{id}` endpoint

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
     /service_at_locations/{id}
   :encoding: utf-8
```

```{eval-rst}
.. admonition::
   The following compliance rules apply to this endpoint:
   
   * **Required by HSDS?** No
   * **Required by Open Referral UK?** Yes

```

#### Response details

This API response will return [service at location](schema_reference.md#service_at_location) data.

### The `/service_at_locations` endpoint

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
     /service_at_locations
   :encoding: utf-8
```
```{eval-rst}
.. admonition::
   The following compliance rules apply to this endpoint:
   
   * **Required by HSDS?** No
   * **Required by Open Referral UK?** Yes
   * **Required parameters for Open Referral UK** page

```

#### Response details

This API response will return [service at location](schema_reference.md#service_at_location) data.