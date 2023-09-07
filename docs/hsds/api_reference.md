API Reference
=============

The API reference provides an [OpenAPI](https://www.openapis.org/) specification that can be used as a blueprint for the design or adaptation of API platforms to provide read or read/write access to information on organizations, services, locations and the details about them. The API protocol  provides most of the functionality needed for simple access and exchange of data.

 
```{eval-rst}
Along with this reference, there is `a swagger ui version of the API <../openapi.html>`_
```

The source of the specification is found on [GitHub](https://github.com/openreferral/specification/tree/3.0/schema/openapi.json) and [issues can be raised in the issue tracker](https://github.com/openreferral/specification/issues).

## Lists

Web endpoints that return lists of entities, such as services returned by a `/services` endpoint must be paginated. To this end, the HSDS API reference defines the `Page` schema:

```{jsonschema} ../../schema/openapi.json
:pointer: /components/schemas/Page
```

This should act as a header to all responses containing a list. Responses should include all the properties from `Page`, as well as a `contents` property. `contents` is an array containing a list of the appropriate objects (e.g. Services).

Each item in `contents` will normally contain all its direct properties, but do not need to contain arrays of child entities (e.g. Service Contacts). This is to prevent response data becoming unreasonably large.

Please see the included example responses to see this in practice.

## Query Parameters and Filters

Many API endpoints defined in this API reference contain query parameters allowing users to filter results by various dimensions. For example, calls to the `/services` endpoint can include a  `modified_after` query parameter to only include results modified on or after the supplied value.

Query parameters are *cumulative* in their effect, behaving as a boolean `AND` where the results fulfill the conditions of all supplied query parameters. For example, the following query will produce results which match `taxonomy_id=XXX` AND `organization_id=YYY`:

```
/services?taxonomy_id=XXX&organization_id=YYY
```

All APIs wishing to comply with this specification must ensure that query parameters are cumulative in their effect.

## Metadata

In HSDS each object has an optional `metadata` field containing a [metadata object](schema_reference.md#metadata). Since an API response may contain a list of many objects &mdash; each with their own nested objects &mdash; this could result in a large quantity of metadata in the response.

It should be noted that the `metadata` field in each object is optional, and API implementors should consider what is an appropriate level of metadata to include in each response based on their use-case.

## Endpoint details

This section contains details of each API endpoint. Each section presents an endpoint defined by the API and presents a technical reference for that endpoint including query parameters, status codes, and compliance rules for HSDS and Open Referral UK.

### The `/` endpoint

::::{tab-set}

:::{tab-item} Details

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
      /
   :encoding: utf-8
```
:::

:::{tab-item} Example Response

```{eval-rst}
.. jsoninclude:: ../../examples/base.json
    :jsonpointer:
    :title: base
```
:::

::::

```{admonition} The following compliance rules apply to this endpoint
- **Required by HSDS?** Yes
- **Required by Open Referral UK?** Yes
```

#### Response details

This API response will return a JSON object containing the following key/value pairs:

* `version` (String) &ndash; HSDS version of this API.
* `profile` (URI) &ndash; The identifier for the HSDS profile used by this API. This should be a URL which resolves to a location where the information on the HSDS profile of this API may be found.
* `openapi_url` (URI) &ndash; URL of the openapi JSON file which defines this API.

### The `/services/{id}` endpoint

::::{tab-set}

:::{tab-item} Details

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
      /services/{id}
   :encoding: utf-8
```
:::

:::{tab-item} Example Response

```{eval-rst}
.. jsoninclude:: ../../examples/service_full.json
    :jsonpointer:
    :title: service
```
:::

::::

```{admonition} The following compliance rules apply to this endpoint
- **Required by HSDS?** Yes
- **Required by Open Referral UK?** Yes
```

#### Response details

This API response will return [service](schema_reference.md#service) data.

### The `/services` endpoint

::::{tab-set}

:::{tab-item} Details

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
      /services
   :encoding: utf-8
```
:::

:::{tab-item} Example Response

```{eval-rst}
.. jsoninclude:: ../../examples/service_list.json
    :jsonpointer:
    :title: service_list
```
:::

::::

```{admonition} The following compliance rules apply to this endpoint
- **Required by HSDS?** Yes
- **Required by Open Referral UK?** Yes
- **Required parameters for Open Referral UK** page
```
#### Response details

This API response will return [service](schema_reference.md#service) data.

### The `/taxonomies/{id}` endpoint

::::{tab-set}

:::{tab-item} Details

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
      /taxonomies/{id}
   :encoding: utf-8
```
:::

:::{tab-item} Example Response

```{eval-rst}
.. jsoninclude:: ../../examples/taxonomy.json
    :jsonpointer:
    :title: taxonomy
```
:::

::::

```{admonition} The following compliance rules apply to this endpoint
- **Required by HSDS?** No
- **Required by Open Referral UK?** Yes
```

#### Response details

This API response will return [taxonomy](schema_reference.md#taxonomy) data.

### The `/taxonomies` endpoint

::::{tab-set}

:::{tab-item} Details

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
     /taxonomies
   :encoding: utf-8
```
:::

:::{tab-item} Example Response

```{eval-rst}
.. jsoninclude:: ../../examples/taxonomy_list.json
    :jsonpointer:
    :title: taxonomy_list
```
:::

::::

```{admonition} The following compliance rules apply to this endpoint
- **Required by HSDS?** No
- **Required by Open Referral UK?** Yes
- **Required parameters for Open Referral UK** page
```
#### Response details

This API response will return [taxonomy](schema_reference.md#taxonomy) data.

### The `/taxonomy_terms/{id}` endpoint

::::{tab-set}

:::{tab-item} Details

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
     /taxonomy_terms/{id}
   :encoding: utf-8
```
:::

:::{tab-item} Example Response

```{eval-rst}
.. jsoninclude:: ../../examples/taxonomy_term.json
    :jsonpointer:
    :title: taxonomy_term
```
:::

::::

```{admonition} The following compliance rules apply to this endpoint
- **Required by HSDS?** No
- **Required by Open Referral UK?** No
```

#### Response details

This API response will return [taxonomy terms](schema_reference.md#taxonomy_term) data.

### The `/taxonomy_terms` endpoint

::::{tab-set}

:::{tab-item} Details

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
     /taxonomy_terms
   :encoding: utf-8
```
:::

:::{tab-item} Example Response

```{eval-rst}
.. jsoninclude:: ../../examples/taxonomy_term_list.json
    :jsonpointer:
    :title: taxonomy_term_list
```
:::

::::

```{admonition} The following compliance rules apply to this endpoint
- **Required by HSDS?** No
- **Required by Open Referral UK?** No
- **Required parameters for Open Referral UK** page
```

#### Response details

This API response will return [taxonomy terms](schema_reference.md#taxonomy_term) data.

### The `/organizations/{id}` endpoint

::::{tab-set}

:::{tab-item} Details

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
     /organizations/{id}
   :encoding: utf-8
```
:::

:::{tab-item} Example Response

```{eval-rst}
.. jsoninclude:: ../../examples/organization_full.json
    :jsonpointer:
    :title: organization
```
:::

::::

```{admonition} The following compliance rules apply to this endpoint
- **Required by HSDS?** No
- **Required by Open Referral UK?** No
```

#### Response details

This API response will return [organization](schema_reference.md#organization) data.

### The `/organizations` endpoint

::::{tab-set}

:::{tab-item} Details

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
     /organizations
   :encoding: utf-8
```
:::

:::{tab-item} Example Response

```{eval-rst}
.. jsoninclude:: ../../examples/organization_list.json
    :jsonpointer:
    :title: organization_list
```
:::

::::

```{admonition} The following compliance rules apply to this endpoint
- **Required by HSDS?** No
- **Required by Open Referral UK?** No
- **Required parameters for Open Referral UK** page
```

#### Response details

This API response will return [organization](schema_reference.md#organization) data.

### The `/service_at_locations/{id}` endpoint

::::{tab-set}

:::{tab-item} Details

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
     /service_at_locations/{id}
   :encoding: utf-8
```
:::

:::{tab-item} Example Response

```{eval-rst}
.. jsoninclude:: ../../examples/service_at_location_full.json
    :jsonpointer:
    :title: service_at_location
```
:::

::::

```{admonition} The following compliance rules apply to this endpoint
- **Required by HSDS?** No
- **Required by Open Referral UK?** Yes
```

#### Response details

This API response will return [service at location](schema_reference.md#service_at_location) data.

### The `/service_at_locations` endpoint

::::{tab-set}

:::{tab-item} Details

```{eval-rst}
.. openapi:: ../../schema/openapi.json
   :paths:
     /service_at_locations
   :encoding: utf-8
```
:::

:::{tab-item} Example Response

```{eval-rst}
.. jsoninclude:: ../../examples/service_at_location_list.json
    :jsonpointer:
    :title: service_at_location_list
```
:::

::::

```{admonition} The following compliance rules apply to this endpoint
- **Required by HSDS?** No
- **Required by Open Referral UK?** Yes
- **Required parameters for Open Referral UK** page

```

#### Response details

This API response will return [service at location](schema_reference.md#service_at_location) data.
