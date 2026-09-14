How to Validate Compliance with HSDS
====================================

Validating compliance with HSDS involves checking your data and your API are conformant with the specification. This ensures that your data can be used in tools and systems which understand HSDS.

Validation is purely structural. It checks that your data is conformant to the appropriate HSDS schema, and if you are providing your data over an API; it checks whether you have provided the necessary endpoints.

Validation does not cover internal data quality. It checks whether the fields exist and are formatted correctly according to the rules of the specification. It cannot check whether the data within those fields is accurate.

Validation is the first step in ensuring that your HSDS data is usable, because if you are structurally conformant to the requirements of HSDS; you will gain access to an ecosystem of tools and methodologies for using that data, and combine your data with that of others to understand the wider picture of human service provision in your context.

## Validating your HSDS Data offline

Validating your HSDS Data offline means that you can check the structure of your data for errors before putting your data or your API online.

This is a good check to perform if you’ve used an offline conversion tool such as the HSDS Transformer to get HSDS data on your computer. It’s also a good check to perform if you are intending to publish a HSDS API, but you want to check that your conversion or data pipeline is working properly as you go.

In order to proceed, you will need the following:

* Some HSDS data you want to validate in JSON format.
* A JSON Schema validator tool. We recommend [check-jsonschema](https://check-jsonschema.readthedocs.io/en/latest/install.html), although [many exist](https://json-schema.org/tools?query=&sortBy=name&sortOrder=ascending&groupBy=toolingTypes&licenses=&languages=&drafts=&toolingTypes=&environments=&showObsolete=false&supportsBowtie=false#validator).

At a high level, all you need to do is to point your JSON Schema validator tool of choice at your HSDS JSON file and also at the appropriate schema for that file.

The HSDS Schemas are all available on Github, and `check-jsonschema` can use these URLs to retrieve the schema for you to validate against.

To derive the appropriate URL for the object you want to validate, navigate to the `schema` directory on the HSDS Specification github repository, select the schema you want to use for validation, and then select the `Raw` button in the Github interface. This will provide the link to the schema file itself.

Examples below, for the `3.3.1` branch of HSDS:

* For **services**, use [this url](https://raw.githubusercontent.com/openreferral/specification/refs/heads/3.3.1/schema/service.json)
* For **organizations**, use [this url](https://raw.githubusercontent.com/openreferral/specification/refs/heads/3.3.2/schema/organization.json)
* For **service\_at\_locations**, use [this url](https://raw.githubusercontent.com/openreferral/specification/refs/heads/3.3.1/schema/service_at_location.json)  
* For **locations**, use [this url](https://raw.githubusercontent.com/openreferral/specification/refs/heads/3.3.1/schema/location.json)
* Etc.

```{admonition} Always use the latest branch of the HSDS Schemas
The above links explicitly use the `3.3.1` branch of schema. HSDS is actively maintained and versioned, which means there may have been MINOR or PATCH releases since this guidance has been written.

Always go to the [official repository](https://github.com/openreferral/specification) to find and use the latest branch of the schemas.
```

Here's an example of using `check-jsonschema` to validate a local file against the HSDS Service schema:

```
check-jsonschema --schemafile "https://raw.githubusercontent.com/openreferral/specification/refs/heads/3.3.1/schema/service.json" my-service.json
```
`check-jsonschema` outputs a validation report detailing the errors in the schema, or a message stating that everything is ok.

If you plan on making your data available over API, then you should check that your API is conformant using other tooling when it is ready. The following section provides instructions for accomplishing this.

## Validating your HSDS API

API validation tells you that your API is conformant to the HSDS API Specification. This means that your API must provide specific endpoints and that those endpoints must return data which is valid against specific HSDS Schemas.

For example, the HSDS API specification states that a conformant API provides a `/services` path which must return a Paginated list of [services](../hsds/schema_reference.md#service). Validating your API therefore means checking that

1. Your API provides a `/services` endpoint which is reachable (a `200` response code)
2. That the data in the response conforms to the `Page` schema containing a list of valid `service.json` objects as defined by HSDS

Currently, the best way to validate your API is conformant with HSDS’ API Specification is to use the Open Referral UK (ORUK) Validator:

* [ORUK Validator (Github)](https://github.com/OpenReferralUK/oruk-validator/)

You can use the ORUK Validator to validate your HSDS API even if you are not trying to conform to the [ORUK Profile](https://openreferraluk.org/). Despite originally being developed for use with the ORUK Profile, the ORUK Validator can be used to validate any HSDS API against a given specification.

The ORUK Validator is open source, and is designed to be hosted on a server although it is straightforward to deploy on a local computer. This means you can install it on your computer for use, or host it on a server you control to use it as part of your infrastructure.

### Installing the ORUK Validator

First, download the ORUK Validator Github repository to your local computer:

```
git clone https://github.com/OpenReferralUK/oruk-validator/
```

Installation is via Docker, so you will need to ensure that you have Docker set up on your machine.

* [https://docs.docker.com/get-started/](https://docs.docker.com/get-started/)

Once you’re set up, enter the `oruk-validator` directory and run the program via `docker compose`:

```
cd oruk-validator 
docker compose up
```

The first time you do this it will take a while to build the image, but subsequent runs will be much faster.

Once docker has activated your containers, you will be able to access the ORUK Validator on port `5000` of your computer. Test it is working by opening a web browser and visiting [`http://localhost:5000`](http://localhost:5000). If you’re greeted with the Swagger page for the ORUK Validator API, then you’ve successfully deployed the ORUK validator on your computer.

### Validating your API

To validate your API with the ORUK Validator, you need to send a web request to the ORUK Validator’s API with the URL of your validator as well as the URL of the Open API file of the profile you’re wanting to conform to.

The canonical URL of the HSDS `openapi.json` file is detailed on the API Reference page of the HSDS Documentation:

* [API Reference](https://docs.openreferral.org/en/latest/hsds/api_reference.html)

Specifically, you will need to send a POST request to the `openreferral/validate` endpoint, with a JSON body that provides details about the validation request. The validation report will be returned in JSON format.

You can check the swagger page for the `POST openreferral/validate` endpoint on your local copy of the ORUK validator to get the full details.

Here is a minimal example, using `curl`, which assumes that your copy of the ORUK Validator is available at [`http://localhost:5000`](https://localhost:5000), and that the API you want to test is publicly available on the internet at [`http://hsds.example.org/`](http://hsds.example.org/):

```
curl -i -H 'Content-Type: application/json' \  
	-d '{"baseUrl": "http://hsds.example.org", "openApiSchema": {"url": "https://raw.githubusercontent.com/openreferral/specification/3.3/schema/openapi.json"}}' \ 
	http://localhost:5000/openreferral/validate
```
