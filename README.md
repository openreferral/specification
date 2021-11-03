# Open Referral

The Open Referral Initiative develops data standards and open platforms that make it easy to share and find information about community resources. Learn more about the initiative at [OpenReferral.org](https://openreferral.org).

## Standards

The Open Referral initiative defines two standards - the Human Services Data Specification and the Human Services Data API. 

Human Services Data Specification defines a minimal set of data for publishing machine-readable directory information about health, human, and social services; their locations and accessibility details; and the organizations that provide them. Read the [spec here](https://docs.openreferral.org).

The [Human Services Data API specification](https://github.com/openreferral/api-specification) builds upon HSDS. 

A detailed FAQ about the project is [found here](http://docs.openreferral.org/en/latest/faq), and additional information about the Open Referral Initiative is available at [https://openreferral.org](https://openreferral.org)

## License

The Human Services Data Specification and its documentation are [licensed](LICENSE) under the Creative Commons Attribution-ShareAlike (CC BY-SA) license.

We encourage you to use an [open license](http://licenses.opendefinition.org/) for any data you publish using the specification. 

Earlier versions were licensed under CC0.

## Building the documentation

### ReadTheDocs

Any change pushed to the master branch on GitHub will be built and pushed to http://docs.openreferral.org/en/latest/ automatically by ReadTheDocs. Build info is found at https://readthedocs.org/projects/openreferral/builds/

Other branches are not built automatically, but can be configured by admins of the 'openreferral' project on ReadTheDocs, on this page - https://readthedocs.org/projects/openreferral/versions/

### Building locally

This assumes a UNIX-based system with Python 3 installed.

You will need graphviz installed. For Ubuntu:

```
apt-get install graphviz libgraphviz-dev
```

Set up an environment and install Python dependencies into it:

```
python3 -m venv .ve    
source .ve/bin/activate
pip install -r requirements.txt
```

Then pull in the submodule for the API documentation. 

```
git submodule init
git submodule update
```

The update command should be re-run whenever there are updates to the `api-specification` repository. 

To build the docs:

```
cd docs
make dirhtml
```

You can also use sphinx-autobuild to have an auto-refreshing local build.

```
pip install sphinx-autobuild
cd docs
sphinx-autobuild . _build
```

## Examples

Examples are included with the documentation and these should match the current datapackage.json. To test:

    pip install frictionless
    python examples/make_datapackages.py
    frictionless validate examples/all_resources/datapackage.json
    frictionless validate examples/simple/datapackage.json

Everytime a new example csv is added or datapackage.json is changed, rerun:

    python examples/make_datapackages.py

Everytime a new example directory is added, please add a line above and in `.github/workflows/test_examples.yml`.

## Database Schemas

These are built automatically from the schema by a GitHub action and checked in for you.

If you want to run the build process locally for any reason, look in the following shell files for help:

    build_database_mysql.sh

