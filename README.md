# Open Referral

Human Services Data Specification defines a minimal set of data for publishing machine-readable directory information about health, human, and social services; their locations and accessibility details; and the organizations that provide them. Read the [spec here](http://docs.openreferral.org).

A detailed FAQ about the project is [found here](http://docs.openreferral.org/en/latest/faq), and additional information about the Open Referral Initiative is available at [https://openreferral.org](https://openreferral.org)

## License

The Human Services Data Specification and its documentation are [licensed](LICENSE) under the Creative Commons Attribution-ShareAlike (CC BY-SA) license.

We encourage you to use an [open license](http://licenses.opendefinition.org/) for any data you publish using the specification. 

Earlier versions were licensed under CC0.

## Building the documentation

### ReadTheDocs

Any change pushed to the master branch on GitHub will be built and pushed to http://docs.openreferral.org/en/latest/ automatically by readthedocs. Build info is found at https://readthedocs.org/projects/openreferral/builds/

Other branches are not built automatically, but can be configured by admin's of the 'openreferral' project on readthedocs, on this page - https://readthedocs.org/projects/openreferral/versions/

### Building locally

Assuming a unix based system with Python 3 installed:

```
python3 -m venv .ve    
source .ve/bin/activate
pip install -r requirements.txt
cd docs
make dirhtml
```

### Translations

Translations wil be done using this transifex project - https://www.transifex.com/OpenDataServices/open-referral-1-0/

How to push new text up to Transifex:
First, do a local build, then:

```
cd docs
make gettext
sphinx-intl update-txconfig-resources --transifex-project-name open-referral-1-0
```

Then follow the rest of the instructions at https://github.com/open-contracting/standard#translations
