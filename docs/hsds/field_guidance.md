Field and Object Guidance
=========================

```{note}
This page is *non-normative*, which means that it doesn't form part of the standard; if there is any ambiguity, the standard takes precedence. This page may be updated at any time in response to community demand.
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
.. jsoninclude:: ../figures/service-schedule-example.json
    :jsonpointer:
    :expand: schedules
```

Please that this example of a `service` object has been simplified and some properties have been omitted.

In the first two `schedule` objects the non-iCal fields `valid_from` and `valid_to` have been provided to signify that this is the period that these opening hours are valid for. Consuming systems may infer from this that as the `valid_to` date approaches, they should seek to find out what future opening hours are for the service; they shouldn't necessarily infer that a service has ended &ndash; just that they don't have any more opening time information. This is in contrast to defining the service's opening hours by use of the `until` iCal field, which explicitly defines the end of a recurring event, and therefore a consuming system may infer that the service is no longer available after that time. 

The final `schedule` object in the array omits the `valid_from` and `valid_to`because the RRULE is limited by its nature and it specifies when the series of events starts and ends.

## Classifications, Attributes, and Taxonomies
