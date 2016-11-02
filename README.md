# Open Referral

Human Services Data Specification defines a minimal set of data for publishing machine-readable directory information about health, human, and social services; their locations and accessibility details; and the organizations that provide them. Read the [spec here](Human%20Services%20Data%20Specification%20%20v1.0.md).

Information about the Open Referral Initiative is available at [https://openreferral.org](https://openreferral.org)

## License

The Human Services Data Specification and it's documentation are [licensed](LICENSE) under the Creative Commons Attribution-ShareAlike (CC BY-SA) license.

We encourage you to use an [open license](http://licenses.opendefinition.org/) for any data you publish using the specification. 

Earlier versions were licensed under CC0.



## Build the docs locally

Assuming a unix based system with Python 3 installed:

```
python3 -m venv .ve    
source .ve/bin/activate
cd docs
make dirhtml
```


