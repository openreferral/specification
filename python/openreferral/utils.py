import os
import json
import csv
import shutil


def build_blank_datapackage_for_database_schemas(datapackage_json_file_path, output_dir_path, id_fields_max_length=250):

    # Read datapackage.json
    with open(datapackage_json_file_path) as fp:
        datapackage = json.load(fp)

    # Edit datapackage.json
    # All ID's and foreign keys need a limit set, or some database engines can't use them in primary keys
    for resource in datapackage['resources']:
        fk_names = [i['fields'] for i in resource['schema'].get('foreignKeys',[])]
        for field in resource['schema']['fields']:
            if field['name'] == resource['schema']['primaryKey'] or field['name'] in fk_names:
                if 'constraints' not in field:
                    field['constraints'] = {}
                field['constraints']['maxLength'] = id_fields_max_length

    # Write datapackage.json
    with open(os.path.join(output_dir_path, "datapackage.json"), "w") as fp:
        json.dump(datapackage, fp, indent=4)

    # Create blank data files for every table
    for table in datapackage.get('resources'):
        with open(os.path.join(output_dir_path, table['path']), 'w', newline='') as fp:
            writer = csv.writer(fp)
            writer.writerows([[i['name'] for i in table['schema']['fields']]])
