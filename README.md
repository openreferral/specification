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

Assuming a UNIX-based system with Python 3 installed, set up an environment:

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
