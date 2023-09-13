API Reference
=============

In addition to the [HSDS Schemas](schema_reference), HSDS provides an API Reference to support standardising how systems provide read or read/write access to information on organizations, services, locations, and the details about them. This specification provides most of the functionality needed for simple access and exchange of data, and systems are encouraged to use it as a blueprint for implementing their own API platforms.

Unlike with the HSDS Schemas where we can provide canonical JSON Schema representations of the model, we are unaware of a comparable technology for specifying API compliance with this specification. We do provide a canonical reference formatted as [OpenAPI specification](https://www.openapis.org) which can be taken and used as a starting point. However, OpenAPI is designed for *describing individual APIs* rather than specifying the requirements for arbitrary API conformant to the specification. It also does not support describing the intended behavior for systems handing requests with multiple filter parameters.

To overcome this limitation, the API specification on this page uses the key words "MUST", "REQUIRED" and "OPTIONAL" in accordance with [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119) to describe whether each endpoint is required by the API Specification. This is used alongside the details of the canonical OpenAPI formatted reference file to measure compliance with the API Specification.

The current canonical HSDS API specification in OpenAPI 3.1 format is available at the following URL: [https://raw.githubusercontent.com/openreferral/specification/3.0/schema/openapi.json](https://raw.githubusercontent.com/openreferral/specification/3.0/schema/openapi.json)

For those more familiar with tools such as SwaggerUI, we provide [a Swagger UI representation](../extras/openapi.html). Readers should note that due to incompatibilities between Swagger UI and OpenAPI 3.1, the file powering the Swagger UI representation is compiled from the canonical HSDS API specification file. Therefore if there are any conflicts between the Swagger UI representation and the specification defined on this API Reference page, then *this specification takes precedence*.

If there are errors or omissions in this API specification, you are encouraged to raise issues on [on the issue tracker](https://github.com/openreferral/specification/issues).

## Lists and Pagination

API endpoints that return lists of entities, such as services returned by a `/services` endpoint MUST be paginated. To support this, the HSDS API reference defines the `Page` schema:

```{jsonschema} ../../schema/openapi.json
:pointer: /components/schemas/Page
```

This acts as a header to all responses containing a list. Ideally, Responses will include all the properties from `Page`, as well as a `contents` property. `contents` is an array containing a list of the appropriate objects (e.g. Services).

Each item in `contents` will normally contain all its direct properties, but do not need to contain arrays of child entities (e.g. Service Contacts). This is to prevent response data becoming unreasonably large.

Please see the included example responses to see this in practice.

## Query Parameters and Filters

Many API endpoints defined in this API reference contain query parameters allowing users to filter results by various dimensions. For example, calls to the `/services` endpoint can include a  `modified_after` query parameter to only include results modified on or after the supplied value.

Query parameters are *cumulative* in their effect, behaving as a boolean `AND` where the results fulfill the conditions of all supplied query parameters. For example, the following query will produce results which match `taxonomy_id=XXX` AND `organization_id=YYY`:

```
/services?taxonomy_id=XXX&organization_id=YYY
```

All APIs wishing to comply with this specification MUST ensure that query parameters are cumulative in their effect.

## Metadata

In HSDS each object has non-required `metadata` field containing a [metadata object](schema_reference.md#metadata). Since some API responses can contain a list of many objects &mdash; each with their own nested objects &mdash; this could result in a large quantity of metadata in the response.

Therefore we wish to be explicit that including the `metadata` property in each object is OPTIONAL, and API implementors are responsible for considering what is an appropriate level of metadata to include in each response based on their use-case.

## Endpoint details

This section contains details of each API endpoint. Each section presents an endpoint defined by the API and presents a technical reference for that endpoint including query parameters, status codes, and compliance rules for HSDS.

### The `/` endpoint

This endpoint is REQUIRED for conforming APIs.

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

#### Response details

This API response will return a JSON object containing the following key/value pairs:

* `version` (String) &ndash; HSDS version of this API.
* `profile` (URI) &ndash; The identifier for the HSDS profile used by this API. This MUST be a URL which resolves to a location where the information on the HSDS profile of this API is be found.
* `openapi_url` (URI) &ndash; URL of the openapi JSON file which defines this API.

### The `/services/{id}` endpoint

This endpoint is REQUIRED for conforming APIs.

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

#### Response details

This API response will return [service](schema_reference.md#service) data.

### The `/services` endpoint

This endpoint is REQUIRED for conforming APIs.

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
```
#### Response details

This API response will return [service](schema_reference.md#service) data.

### The `/taxonomies/{id}` endpoint

This endpoint is OPTIONAL for conforming APIs.

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

#### Response details

This API response will return [taxonomy](schema_reference.md#taxonomy) data.

### The `/taxonomies` endpoint

This endpoint is OPTIONAL for conforming APIs.

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

#### Response details

This API response will return [taxonomy](schema_reference.md#taxonomy) data.

### The `/taxonomy_terms/{id}` endpoint

This endpoint is OPTIONAL for conforming APIs.

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

#### Response details

This API response will return [taxonomy terms](schema_reference.md#taxonomy_term) data.

### The `/taxonomy_terms` endpoint

This endpoint is OPTIONAL for conforming APIs.

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

#### Response details

This API response will return [taxonomy terms](schema_reference.md#taxonomy_term) data.

### The `/organizations/{id}` endpoint

This endpoint is OPTIONAL for conforming APIs.

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

#### Response details

This API response will return [organization](schema_reference.md#organization) data.

### The `/organizations` endpoint

This endpoint is OPTIONAL for conforming APIs.

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

#### Response details

This API response will return [organization](schema_reference.md#organization) data.

### The `/service_at_locations/{id}` endpoint

This endpoint is OPTIONAL for conforming APIs.

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

#### Response details

This API response will return [service at location](schema_reference.md#service_at_location) data.

### The `/service_at_locations` endpoint

This endpoint is OPTIONAL for conforming APIs.

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

#### Response details

This API response will return [service at location](schema_reference.md#service_at_location) data.
