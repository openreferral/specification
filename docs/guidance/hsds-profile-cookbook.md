HSDS Profile Cookbook
========================

This page provides "recipes" for achieving specific effects with HSDS Profiles. Creating a HSDS Profile involves writing snippets of JSON Schema as patches against the HSDS Schemas. These are then merged with the base HSDS Schemas to create your finished Profile.

For normative documentation on HSDS Profiles, see the [Profiles Reference](https://docs.openreferral.org/en/latest/hsds/profiles.html). For guidance on designing a HSDS Profile see our [dedicated guidance](./creating-profiles). You may also be interested in [how to use the HSDS Profile Wizard to create and maintain a HSDS Profile](./using-hsds-profile-wizard).

Creating HSDS Profiles involves familiarity with JSON Schema and the Open API Specification, so we recommend learning about these technologies before reading the recipes on this page.

* [https://json-schema.org/](https://json-schema.org/)
* [https://spec.openapis.org/oas/latest.html](https://spec.openapis.org/oas/latest.html)

## Adding new schemas

### Creating a new schema file for your Profile

Create a new schema file with a unique name, and it will be treated as a new schema in your Profile i.e. it won’t be used to override existing schemas in HSDS.

In this example we create an `example_new_schema.json` file to use in the Profile:

```json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "My Custom HSDS Schema",
  "description": "An example new schema for a HSDS Profile",
  "type": "object",
  "properties": {
    "id": {
      "title": "Identifier",
      "description": "Identifier for the example object",
      "type": "string",
      "format": "uuid"
    },
    "example_property": {
      "title": "Example Property",
      "description": "An Example Property on a new HSDS Profile Schema",
      "type": "string"
    }
  }
}
```

### Referencing existing HSDS Schemas

In your new schema, you can add relationships to other HSDS schemas by using the `$ref` keyword.

HSDS Schemas all exist at the same level in a directory, so use the name of the schema without any prefixes.

In this example, we make a reference to the `organization.json` schema from inside a new schema:

```json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "My Custom HSDS Schema",
  "description": "An example new schema for a HSDS Profile",
  "type": "object",
  "properties": {
    "id": {
      "title": "Identifier",
      "description": "Identifier for the example object",
      "type": "string",
      "format": "uuid"
    },
    "example_property": {
      "title": "Example Property",
      "description": "An Example Property on a new HSDS Profile Schema",
      "type": "string"
    },
    "organization": {
      "$ref": "organization.json"
    }
  }
}
```


In the same way, you can use `example_new_schema.json` as the value of `$ref` in other schemas in your Profile.

## Modifying existing HSDS Schemas

### Adding new properties (fields) to an existing HSDS Schema

This is likely one of the more common tasks of developing a new Profile. In this example, we'll be defining a new property on the [Service](http://docs.openreferral.org/en/latest/hsds/schema_reference.html#service) schema.

We want to add a new field to the Service schema, to model the date of the last inspection of the service.

Simply define the new property inside the `properties` key in the schema.

Inside `profile/service.json`

```json
{
  "properties": {
    "last_inspected": {
      "type": "string",
      "format": "date",
      "title": "Last Inspected",
      "Description": "The date that this service was last inspected. Must be in the format YYYY-MM-DD"
    }
  }
}
```

### Making properties required in your Profile

You can also make properties in your Profile required. This applies to both new properties added by your Profile, and to existing properties defined in HSDS.

In this example we will be making some properties required inside the Service schema. Specifically, we will be making the `url` property from HSDS required, and also the `last_inspected` property added by a previous example.

In JSON Schema, required properties are described using the `required` keyword. This is an array of strings matching properties in the schema file. The caveat with making properties required in your Profile is that *we do not want to override the existing required array from HSDS* (at least not by accident).

To work around this, we can use a JSON Schema trick by using the `allOf` block ([reference](https://json-schema.org/understanding-json-schema/reference/combining.html#id5)) to create an additional `required` array containing the list of our new required properties.

Inside `profile/service.json`:

```json
{
  "allOf": [
    {
      "required": [
        "url",
        "last_inspected"
      ]
    }
  ]
}
```

### Removing a field from a HSDS schema

To remove properties, simply change their definition to be `null`. This effectively removes the property and its validation rules from your Profile schema.

```json
{
  "properties": {
    "wait_time": null,
    "fees": null
  }
}
```

### Removing a HSDS Schema from your Profile

Removing a schema works by using the `null` keyword to override the entire schema file.

Create a patch file with the name matching the schema you’d like to remove, and enter `null`

```json
null
```

## Modifying the API Specification

### Adding a new endpoint to the API Specification

Another common task of a Profile is to add an endpoint to the HSDS OpenAPI specification. This is very similar to adding a new property to an existing HSDS Schema.

In this example we will be adding a `/organizations_at_location` endpoint.

You simply need to define the path as per the OpenAPI specification underneath the `paths` key:

Inside `profile/openapi.json`

```json
{
  "paths": {
    "/organizations_at_location": {
      "get": {
        "description": "Retrieve a list of organizations operating in a location",
        "summary": "A paginated list of organizations operating in a location",
        "operationId": "getPaginatedListOfOrganizationsByLocation",
        "parameters": [
          {
            "$ref": "#/components/parameters/search"
          },
          {
            "name": "location_id",
            "in": "query",
            "required": false,
            "description": "Search for organizations by a location_id",
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "Retrieve paginated listings of organization that matches the location.",
            "content": {
              "application/json": {
                "schema": {
                  "properties": {
                    "contents": {
                      "type": "array",
                      "items": {
                        "$ref": "https://raw.githubusercontent.com/openreferral/specification/3.0/schema/compiled/organization.json"
                      }
                    }
                  },
                  "allOf": [
                    {
                      "$ref": "#/components/schemas/Page"
                    }
                  ]
                }
              }
            }
          }
        }
      }
    }
  }
}
```

### Adding parameters to an existing API endpoint

In this example, we will add a `location_id` parameter to the `/organizations` endpoint defined in the HSDS API specification.

Inside of `profile/openapi.json`, you can add the parameter to the array of parameters:

```json
{
  "paths": {
    "/organizations": {
      "get": {
        "parameters": [
          {
            "name": "location_id",
            "in": "query",
            "required": false,
            "description": "Search for organizations by a location_id",
            "schema": {
              "type": "string"
            }
          }
        ]
      }
    }
  }
}
```

### Removing an API endpoint from the spec

Use `null` to remove the entire definition of path inside your patch file for the `openapi.json` file:

```json
{
  "paths": {
    "/service_at_locations/{id}": null,
    "/service_at_locations": null
  }
}

```

### Update the referenced schema of an existing endpoint

For the path you want to change the referenced schema for, you need to update the `$ref` value in that path to point to your new schema.

Where this is will differ depending on whether that endpoint returns a single object (e.g. `GET /services/{id}` returns a single service object), or a paginated list of objects (`GET /services` returns a paginated list of services).

In this example, we update the `GET /services` and `POST /services` endpoints to return our profile’s  `service_package.json` schema instead of the default paginated list of schemas. To accomplish this we override the response schema of each method in the path to do the following:

* Remove the `allOf` block with `null`, thus removing the reference to the `Page` schema and the` service_list.json` schema
* Adding a `$ref` value to our own `service_package.json` schema

```json
{
  "paths": {
    "/services": {
      "get": {
        "responses": {
          "200": {
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "https://example.org/schema/service_package.json",
                  "allOf": null
                }
              }
            }
          }
        }
      },
      "post": {
        "responses": {
          "200": {
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "https://example.org/schema/service_package.json",
                  "allOf": null
                }
              }
            }
          }
        }
      }
    }
  }
}
```

## Misc.

These recipes cut across different sections. You can use them when adding your own schemas, modifying existing schemas, or when modifying the API specification for your Profile

### Referencing external (third party) schemas

Since HSDS and HSDS Profiles are implemented in JSON Schema, you can make use of existing third-party schemas in your Profile by referencing them with the `$ref` keyword.

This works the same way as referencing existing HSDS schemas, except that you should be providing the full URI to the third-party schema.

In this example, we override the `funding` array inside the `service.json` schema to contain an array of grants in the [360Giving format](https://www.360giving.org/about/data-standard/):

```json
{
  "properties": {
    "funding": {
      "items": {
        "$ref": "https://raw.githubusercontent.com/ThreeSixtyGiving/standard/1.4.3/schema/360-giving-schema.json"
      }
    }
  }
}
```

This also works in the `openapi.json` file. You can use `$ref` to state that your API will return information according to any JSON schema as long as the schema is resolvable.

In this example, we add a `GET /lineage/{id}` as an endpoint which takes a service `id` as a URL parameter and returns a stream of objects representing [OpenLineage](https://openlineage.io/) events:

```json
{
  "paths": {
    "/lineage/{id}": {
      "get": {
        "responses": {
          "200": {
            "description": "A stream of OpenLineage Run objects describing operations on this data",
            "content": {
              "application/jsonl": {
                "itemSchema": {
                  "$ref": "https://openlineage.io/spec/2-0-2/OpenLineage.json"
                }
              }
            }
          }
        }
      }
    }
  }
}
```
