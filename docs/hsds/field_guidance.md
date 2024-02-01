Field and Object Guidance
=========================

```{note}
This content is *informative*, which means that it doesn't form part of the standard; if there is any ambiguity, the standard takes precedence. This page may be updated at any time in response to community demand.
```

This page contains guidance on various topics specific to the properties and structures within HSDS.

## Names and Descriptions
Locations, Services and Organizations each have `name`, `alternate_name`, and `description` properties that can contain free text.

`name` and `alternate_name` should only ever include plain text, without formatting.

`description` may include HTML elements or [Markdown](https://en.wikipedia.org/wiki/Markdown), with special characters escaped or encoded. 

Consuming applications should be aware of this and behave appropriately in accordance with their aims. This may involve stripping HTML tags, rendering (or not rendering) Markdown, or simply storing the contents as-is.

Publishers should be aware that consuming applications may wish to extract a 'short description' from the `description` field, and may do so by looking for the first full sentence or first line-break.

## Schedules

[schedules](schema_reference.md#schedule) contain information about when a service is available. They can be linked to [service](schema_reference.md#service), [location](schema_reference.md#location), and [service_at_location](schema_reference.md#service_at_location).

Each schedule entry contains the following information:

 * Its identifier
 * Any affiliated `service`, `location`, or `service_at_location` objects (JSON) or their ids (Tabular Data Packages)
 * The opening times that are referred to
 * Validity of the data expressed as a time period
 * iCal RRULE-style fields that describe how often the opening times repeat. 

### Opening Times

`opens_at` and `closes_at` fields are straightforward ISO 8601 times; for example "10:00Z". They should include timezone information.

The `description` field should be a human-readable description of the opening hours, but shouldn't add any more information, such as exceptions.

### Validity

The `valid_from` and `valid_to` fields are ISO 8601 date-times that indicate the period for which the data should be considered valid. For example, if an organisation that collects data on local services carries out checks once a year, then setting `valid_to` to 1 year after `valid_from` would be appropriate. This helps ensure that older data can be identified.

### Recurrence

The rest of the fields in the `schedule` are based on [RRULEs](https://icalendar.org/iCalendar-RFC-5545/3-3-10-recurrence-rule.html) from the [iCal standard](https://tools.ietf.org/html/rfc5545) in order to express the way in which the opening times repeat. RRULES are very expressive, and are familiar to many people, as they're widely used in calendar software.

HSDS doesn't contain all of the nuance of RRULE, and the schema doesn't check that your RRULEs are valid. This documentation provides only basic guidance on RRULE; please consult the iCal documentation for in-depth explanations.

There are several key properties for expressing RRULEs in HSDS:
* A `dtstart` (starting date-time); when the instance in the rule starts
* A `freq` (frequency); the unit of the recurrence; e.g. days, weeks, months
* A `byday`, `byweekno`,`bymonthday`,`byyearday`; the value of the recurrence; e.g. 5

Together, these allow events to be expressed in the form "The first instance is on the 8th of August 2020, and it then happens every 2 weeks".

There's also an `until` field, which gives an end point to the recurrence. This might be appropriate to use when describing a service that's only available for a season.

### Exceptional Schedules

It's common for a service to operate different hours over a certain period - such as a holiday. 

If the service is offering additional opening hours to their regular hours, then a second entry can be added, with `valid_from` and `valid_to` set to indicate the limited range of dates that the additional hours apply for.

If the service is changing its hours, then set the `valid_to` value to the last day that the regular schedule is in operation, and add new entries for the service's exceptional opening hours.

### 24h opening 

HSDS doesn't have a way to model this explicitly. If a service operates 24 hours a day, setting the `opens_at` and `closes_at` to `00:00` and `23:59` is a strong signal to any data users that the opening hours are known and 24h. 

### Worked Example

In this example we look at the schedule data of a service which is available from 0900 to 1200 and 1500 to 1700, Monday to Thursday, every week. They know that they'll change to a Christmas schedule in mid-December, so the schedule will be valid until then. 

During the year, they decide to open on the first Saturday of each month from July until November. So, they add another schedule.

```{eval-rst}

.. tab-set::
   .. tab-item:: JSON

      .. jsoninclude:: ../figures/field-guidance/schedules/services.json
         :jsonpointer:
	 :expand: services,schedules
	 :title: services.json

   .. tab-item:: Tabular Data Package

      .. tab-set:: 
         .. tab-item:: services.csv
	    
	    .. csv-table::
	       :file: ../figures/field-guidance/schedules/services.csv
	       :header-rows: 1

	 .. tab-item:: schedules.csv

	    .. csv-table::
	       :file: ../figures/field-guidance/schedules/schedules.csv
	       :header-rows: 1
```


In the first two `schedule` objects the non-iCal fields `valid_from` and `valid_to` have been provided to signify that this is the period that these opening hours are valid for. Consuming systems may infer from this that as the `valid_to` date approaches, they should seek to find out what future opening hours are for the service; they shouldn't necessarily infer that a service has ended &ndash; just that they don't have any more opening time information. This is in contrast to defining the service's opening hours by use of the `until` iCal field, which explicitly defines the end of a recurring event, and therefore a consuming system may infer that the service is no longer available after that time. 

The final `schedule` object in the array omits the `valid_from` and `valid_to`because the RRULE is limited by its nature and it specifies when the series of events starts and ends.

## Classifications, Attributes, and Taxonomies

HSDS is focused on providing information about services; it is not designed to be a taxonomy interchange format. Therefore, the features provided by HSDS are intended to be sufficient for users to transfer enough information about a taxonomy to make the data about services be useful. They are not intended to replace or stand in for existing taxonomy and classification system datasets, which should be defined externally.

HSDS provides a way to flexibly attach attributes including classifications and taxonomies to various types of object.

### Terminology

Classification and description is an area in which terms are used inconsistently across domains and applications. Therefore, we define here certain terms which are used in the standard.

These definitions may be different from those that you'd use in your context, in which case we'd suggest prepending the term "OpenReferral" or "HSDS" to disambiguate. For example, if you'd call an "attribute" a "property", then you might refer to an "HSDS Attribute".

#### Vocabulary

A *vocabulary* is the set of words that are used in a language, which may have multiple meanings.

For example, the English language has around 170,000 terms in its vocabulary. The word “crane” can refer to a piece of machinery, a type of bird, or the action of overextending one’s neck in an attempt to see something that is otherwise obscured.

Alternatively a vocabulary of codes might be created for a particular purpose - such as “ES1098” and “87HG42”

#### Taxonomy

A *taxonomy* is a structure of terms drawn from a vocabulary which can be used to describe attributes of something.

For example, a taxonomy designed for use in the construction industry, called “construction machinery” might say that a particular piece of machinery is a “crane”, or an “86HG4”

In such a case, to say that a particular machine is a “construction machinery”->”crane” is meaningful.


#### Embedded Taxonomy

An *embedded taxonomy* is a taxonomy where the dataset contains the definition of the taxonomy terms used in the data; ie, to find out what a term means, you look within the dataset. It can be a clone of an external taxonomy, if licensing allows.

Data packages using HSDS shouldn't contain any unused taxonomy terms, in particular if providing those terms would result in a package that comprises more taxonomy data than service data.

#### External Taxonomy

An *external taxonomy* is where the taxonomy is held outside of the data and  the dataset ships with just references to the taxonomy; ie, to find out authoritatively what a term means, you look elsewhere.

#### Taxonomy Term

A *taxonomy term* is a particular instance of a term from a vocabulary which is given a particular meaning by a taxonomy.

For example, a taxonomy term might be “86HG4”, which the taxonomy describes as lifting equipment. It might be a child of “ES1098”, which is heavy machinery.

#### Attribute

An *attribute* is some property, fact, or assertion that is made of a thing.

For example, a particular piece of machinery might have some attributes:

* Painted yellow
* Has a government-issued plate declaring it to be ID “JG36QAK” and allowed to be driven on public roads
* Is of type “crane”, from the taxonomy “construction machinery”

Attributes in HSDS are asserted by applying a taxonomy term to an object. 

### Applying data to objects

HSDS provides several objects which store this data:

* `attribute` &ndash; see [Attribute](schema_reference.md#attribute), a object representing a link between a `service` and one or more classifications that describe the nature of the service provided.
* `taxonomy_term` &ndash; see [Taxonomy Term](schema_reference.md#taxonomy_term), an object representing a single term within the taxonomy.
* `taxonomy` &ndash; see [Taxonomy](schema_reference.md#taxonomy), an object representing an entire taxonomy from which individual `taxonomy_term`s are taken.

An `attribute` is a catch-all holder which can be used to apply either a `taxonomy_term` to an object, or an arbitrary value via the `value` property if the attribute is not derived from a taxonomy. Most objects in HSDS have an `attributes` property, which is an array containing `attribute` objects. To attach an `attribute` to another object (e.g. a `service`) then simply include it in this array. 

A `taxonomy_term` specifically models a term drawn from a taxonomy. It has a `code` property which represents the term identifier as used in the taxonomy, as well as a `name` (required) for the term itself and a `description` (required) which should be used to provide a human-readable description of the term. Some taxonomies are hierarchical, so there's also an option to include a `parent_id` for another `taxonomy_term`. In the official JSON serialization, the entire `taxonomy` object from which the term is drawn can be included in the `taxonomy_detail` object whereas `taxonomy_id` refers to the `id` property of the `taxonomy` object elsewhere in the HSDS dataset (useful for Tabular Datapackages). The `taxonomy_term` object is designed to be included via an `attribute` object underneath an object's `attributes` array.

A `taxonomy` object is a simple object describing a taxonomy. It must have a `name` which describes the taxonomy, as well as a `description` which provides a human-readable description of the taxonomy. There are also spaces for a `uri` which is desirable. In an ideal world, the value of `taxonomy/uri` would resolve to a URI which provides either a canonical reference to the taxonomy or a canonical machine-readable serialization of the taxonomy.

### Worked Example

The following examples demonstrates how attributes and taxonomies look in practice.

The example will define two services:

* A "Kitten Time" service which is a workplace service designed to reduce stress
* A "Puppy Time" service which is also a workplace service, designed to reduce stress

It will then define some taxonomy terms:

* "stress", which is drawn from a fictional *Health Service Taxonomy* taxonomy
* "WORKPLACE", which is drawn from a separate fictional taxonomy called *Service Location Descriptor Taxonomy*

::::{tab-set}

:::{tab-item} JSON
```{eval-rst} 
.. jsoninclude:: ../figures/field-guidance/attributes/service.json
   :jsonpointer:
   :expand: services,attributes
   :title: service.json
```

:::

:::{tab-item} Tabular Data Package

```{eval-rst}

.. tab-set::
   .. tab-item:: services.csv
          
       .. csv-table:: 
   	  :file: ../figures/field-guidance/attributes/services.csv
   	  :header-rows: 1

   .. tab-item:: taxonomies.csv
       
       .. csv-table::
          :file: ../figures/field-guidance/attributes/taxonomies.csv
	  :header-rows: 1

   .. tab-item:: taxonomy_terms.csv
  	 
       .. csv-table::
          :file: ../figures/field-guidance/attributes/taxonomy_terms.csv
	  :header-rows: 1

   .. tab-item:: attributes.csv
  	 
       .. csv-table::
          :file: ../figures/field-guidance/attributes/attributes.csv
	  :header-rows: 1

```
:::

::::

Please note that the above example omits a number of fields for the sake of brevity, some of which may be required by the HSDS Schemas.

## Metadata

HSDS also provides a general-purpose [Metadata](schema_reference.md#metadata) object which allows publishers to include a record of changes associated with individual records. Aside from the Metadata object itself, every object defined by HSDS has a `metadata` property which can hold an array of metadata objects.

It's intended that each Metadata object represents a single change, so therefore multiple metadata objects may be added at once when different things have changed in a record. For this reason as well, most of the fields within each `metadata` object are required.

### Worked Example

In this example, a service is provided and then various elements of it are updated in the record over time.

Note that many fields have been omitted for brevity, some of which may be required by the HSDS Schemas.

```{eval-rst}

.. tab-set::
   .. tab-item:: JSON

     .. jsoninclude:: ../figures/field-guidance/metadata/service.json
        :jsonpointer:
	:expand: services,metadata
	:title: service.json

   .. tab-item:: Tabular Data Package
     
     .. tab-set::
        .. tab-item:: services.csv
	   
	   .. csv-table::
	      :file: ../figures/field-guidance/metadata/services.csv
	      :header-rows: 1
	
	.. tab-item:: metadata.csv
	   
	   .. csv-table::
	      :file: ../figures/field-guidance/metadata/metadata.csv
	      :header-rows: 1
```
