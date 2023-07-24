Profiles Reference
===============

The HSDS Profiles Mechanism provides a method of building upon and adjusting the core HSDS Schema in order to tailor it for specific contexts which may require different or additional validation rules.

## Publish Data Using a HSDS Profile

Publishing HSDS data which is conformant to a profile is very straightforward and does not require many additional steps.

### 1. Implement the Profile-Specific Requirements

Profiles are designed to change the requirements of data published in HSDS. They may add new fields, structures, and/or validation rules which do not appear in [the HSDS Schema](../hsds/schema_reference). In other cases, they may recommend the use of particular taxonomies to ensure interoperability between datasets using the profile, or mandate API endpoints which do not appear in the [HSDS API Reference](../hsds/api_reference).

Publishing data conformant to a HSDS profile therefore means you should ensure that you have understood the requirements of the profile. Profiles should have associated documentation describing their field and validation requirements. You should use these to understand the requirements of the profile and implement your data and APIs accordingly.

If you are publishing HSDS for the first time &mdash; and are also publishing to a profile &mdash; you may also wish to read the HSDS [publication guidance](../hsds/producing_sharing) for support in mapping fields and values.

### 2. Include the Profile URL in your API output

The next step is to describe your data as using the profile via your API output.

The [`/` endpoint](../hsds/api_reference.md#endpoint-details) of the HSDS API Reference includes a response key/value pair for `profile`. You should populate this with the URI to the profile you are using. Profile documentation should clearly state this value to avoid confusion &ndash; if you are unsure which value to use please get in touch with the implementer of the profile.

## Creating a Profile

HSDS Profiles work by either *extending* or *overriding* existing HSDS Schema files:

* Extending &ndash; defining new fields, codelists, taxonomies, API endpoints, and constraints on existing fields
* Overriding &ndash; removing fields and constraints which are defined by the [HSDS Schema Reference](../hsds/schema_reference) or the [HSDS API Reference](../hsds/api_reference)

HSDS is implemented in [JSON Schema](http://json-schema.org/) so you should be somewhat familiar with this to implement any changes to the HSDS schemas. The API specification is implemented in [OpenAPI JSON](https://spec.openapis.org/oas/latest.html#openapi-specification), so familiarity with this is recommended for changes to the HSDS OpenAPI.

The basic workflow of implementing a HSDS Profile is as follows:

* Define your changes to specific [HSDS schema files](https://github.com/openreferral/specification/tree/3.0/schema) or the `openapi.json` file.
* Use [HSDS Schema Tools](https://github.com/openreferral/hsds_schema_tools/tree/main) to generate the compiled schemas and examples, implementing your profile.
* Ensure that your profile is stored at a publicly accessible URL so that tools may fetch it.
* Provide adequate documentation to support people producing data conformant with your profile.

The following sections contain some more detailed guidance on implementing a HSDS profile.

### Detailed Guidance 

The [HSDS Example Profile](https://github.com/openreferral/hsds_example_profile) on Github should be used as a starting point for all profile development because it already contains the requirements for creating a HSDS profile. This guidance continues with providing detailed guidance for using the Example Profile as a template. It assumes a setup with git, Python, and pip available.

#### Step 1: Setup

Clone, fork, or otherwise make a copy of the [HSDS Example Profile](https://github.com/openreferral/hsds_example_profile) to use as a base. This contains the folder structures and requirements files for creating your profile.

You should next set up a Python virtual environment inside the repo, activate it, and finally install the requirements. This will install the [HSDS Schema Tools](https://github.com/openreferral/hsds_schema_tools/tree/main).

```
python3 -m venv .ve    
source .ve/bin/activate
pip install -r requirements.txt
```

#### Step 2: Defining changes to HSDS Schema Files

You define the changes your profile is making to HSDS inside the `profile` directory. The profiles mechanism works by matching files inside this directory with [HSDS schema files](https://github.com/openreferral/specification/tree/3.0/schema) of the same name, and performing a [JSON Merge Patch](https://datatracker.ietf.org/doc/html/rfc7386) to produce a set of compiled schema files representing the complete validation schema of your profile.

The task, therefore, is to implement your desired changes in [JSON Schema](http://json-schema.org/) inside a file corresponding to a HSDS schema file. The concept is very similar to overriding or extending a template or a view in web development.

You should only created files in `profile` which you want to change. You do not need to include files which you want to keep the same in your profile. For example if your profile only changes the `Service` object, then you only need to create `service.json` and not `organization.json` etc.

You should NOT copy the entire schema file from HSDS and make changes. Only write in the changes you need. For example if you were adding a new property `myNewProperty` to `Service`, you would do the following inside `profile/service.json`:

```json
{
  "properties": {
    "myNewProperty": {
      "type": "string",
      "title": "My New Property",
      "Description": "A Description of My New Property, added by my awesome HSDS Profile."
    }
  }
}
```

The reason for this is to ensure that your profile is only changing the parts of the schema file that you need to change. It also keeps things nice and readable for you to maintain your profile.

You can also remove parts of the HSDS schema through the `null` keyword. For example if you wanted to remove `fees` and `fees_description` from `Service` you would include the following in your `profile/service.json`:

```json
{
  "properties": {
    "fees": null,
    "fees_description": null
  }
}
```

You can also remove entire Object ("Tables") from the schema by creating a corresponding file in your profile which *only* contains `null`. For example if you wanted to remove `Metadata` objects, you would create `profile/metadata.json` and it would include only the following line:

```json
null
```

You can also define some default data inside of a `profile/data` directory. For each type of default data you want, create a file inside of this directory with a name corresponding to the schema file. The file should then include a JSON-formatted array where each of the items is conformant to the schema associated with it. For example if you wanted to define some Taxonomy Terms for use with your profile, you should create the file `profile/data/taxonomy_term.json`. This file would then contain a JSON array of `taxonomy_term` items, where each one represents a term in your taxonomy.

#### Step 3: Compiling your schemas

Once you've finished defining your changes to your schema files and/or adding default data, you should compile your schema.

Compiling your schema requires that you provide a URI where your profile will live on the web. This must be publicly accessible, as this is what publishers will use to state they are using your profile and what tooling should use to find the profile schemas for validation. It is sensible to make this a public git repository such as on Github.

You should then run the HSDS Schema Tools script with the `profile-all` command, your profile URI, and the `--clean` option. For example:

```
hsds_schema.py profile-all https://github.com/openreferral/hsds_example_profile --clean
```

This will run the JSON Merge to produce the schemas under the `schema` directory, and compile them into the `schema/compiled` directory. You should commit these files to the repo, and then they are ready to be used.

#### Step 4: Producing your documentation

You should also produce some documentation about your Profile, explaining its application areas and highlighting its requirements. It may also be prudent to provide a summary of changes from the core HSDS Schema.

You can replace the contents of the Example Profile's `README.md` file to produce some lightweight, simple, documentation. Alternatively, you could create a `docs` folder and use [readthedocs](https://readthedocs.org/) or [sphinxdoc](https://www.sphinx-doc.org/en/master/) to generate more in-depth documentation.

### Worked Examples

This section contains some worked examples of common things you may want to do with a Profile.

#### Adding a new field

#### Adding a new API endpoint

#### Removing an existing field

#### Removing an existing table/object
