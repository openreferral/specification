Logical Model
=============

There are four core tables in HSDS:

1. **organization** - that provide services;
2. **service** - that have descriptions, classifications and other information to allow potential service users to identify those services that can meet their needs;
3. **location** - where services are delivered - either physically, or virtually (over the phone or Internet);
4. **service_at_location** - a link table used to record where particular services are available, and to over-ride any default service or location information, with information specific to the service at a specific location.

Additional information about organisations, locations and services is held in separate tables and linked by a foreign key. Some tables only have a single foreign key for a single core table. Others can be linked to different core tables. 

The table below indicates the foreign keys that exist. 

<table class="docutils">
    <thead>
        <tr>
            <th class="head">Table</th>
            <th class="head">organization</th>
            <th class="head">service</th>
            <th class="head">location</th>
            <th class="head">service_at_location</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>programs</td>
            <td>X</td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>funding</td>
            <td>X</td>
            <td>X</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>service_taxonomy</td>
            <td></td>
            <td>X</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>phone*</td>
            <td>X</td>
            <td>X</td>
            <td>X</td>
            <td>X</td>
        </tr>
        <tr>
            <td>contact</td>
            <td>X</td>
            <td>X</td>
            <td></td>
            <td>X</td>
        </tr>
        <tr>
            <td>regular_schedule</td>
            <td></td>
            <td>X</td>
            <td>X</td>
            <td>X</td>
        </tr>
        <tr>
            <td>holiday_schedule</td>
            <td></td>
            <td>X</td>
            <td>X</td>
            <td>X</td>
        </tr>
        <tr>
            <td>eligibility</td>
            <td></td>
            <td>X</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>service_area</td>
            <td></td>
            <td>X</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>required_document</td>
            <td></td>
            <td>X</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>payment_accepted</td>
            <td></td>
            <td>X</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>language</td>
            <td></td>
            <td>X</td>
            <td>X</td>
            <td></td>
        </tr>
        <tr>
            <td>physical_address</td>
            <td></td>
            <td></td>
            <td>X</td>
            <td></td>
        </tr>
        <tr>
            <td>postal_address</td>
            <td></td>
            <td></td>
            <td>X</td>
            <td></td>
        </tr>
        <tr>
            <td>accessibility_for_disabilities</td>
            <td></td>
            <td></td>
            <td>X</td>
            <td></td>
        </tr>
    </tbody>
</table>

*Phone can also be linked to **contact**. 

When a single row contains multiple foreign keys, these will be interpreted as 'OR' relationships. 

E.g. a phone number applies to the service OR the organisation OR the service_at_location. 

## ER Diagram for HSDS v 1.1 
![ER Diagram HSDS v1.1](assets/hsds_er_diagram_v1.1.png)
