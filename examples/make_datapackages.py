#
# This script makes datapackge.json files suitable for checking examples against and writes them to each examples directory.
#
# You can then validate them:
#
#    python examples/make_datapackages.py
#    pip install frictionless
#    frictionless validate examples/all_resources/datapackage.json
#    frictionless validate examples/simple/datapackage.json
#        ... etc
#
# Reason we have to do this and we can't just use the original datapackage.json:
#
# If a single data file does not exist the validator crashes out and will then not validate the data files that do exist.
# So we make a new datapackage.json that contains only the definitions for the files that do exist.
# (If the validator carried on and validated the rest anyway that would not be needed,
#   but I can't see a way to make this validator do that)
#

import json
import os
from glob import glob

EXAMPLES_DIR = os.path.dirname(os.path.realpath(__file__))
ORIGINAL_DATAPACKAGE = os.path.join(EXAMPLES_DIR,'..','datapackage.json')

def make_for_example(directory):
    # Get source data package
    with open(ORIGINAL_DATAPACKAGE) as fp:
        datapackage = json.load(fp)

    # Get data files for this example
    data_files_that_exist = [os.path.split(i)[1] for i in glob(directory+"/*.csv")]

    # Include only resources for data files that exist
    datapackage['resources'] = [i for i in datapackage['resources'] if i['path'] in data_files_that_exist]

    # Include only foreign keys for resources that exist
    resources_that_exist= [i['name'] for i in datapackage['resources']]
    for resource in datapackage['resources']:
        fks = [i for i in resource['schema'].get('foreignKeys', []) if i['reference']['resource'] in resources_that_exist]
        if fks:
            resource['schema']['foreignKeys'] = fks
        elif 'foreignKeys' in resource['schema']:
            del resource['schema']['foreignKeys']

    # Write new data package
    with open(os.path.join(directory, "datapackage.json"), "w") as fp:
        json.dump(datapackage, fp, indent=4)



if __name__ == "__main__":
    for dir in glob(EXAMPLES_DIR+"/*/"):
        make_for_example(dir)

