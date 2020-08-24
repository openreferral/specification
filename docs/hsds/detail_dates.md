In Detail: Opening Dates & Times in HSDS
========================================

In HSDS, services have opening times, and those opening times recur according to a schedule. These schedules are held in the _schedules_ table.

## Fields

The fields divide into three groups:

### Opening Times

The _opens_at_ and _closes_at_ fields are straightforward ISO 8601 times; for example "10:00".

The _description_ field should be a human-readable description of the opening hours, but shouldn't add any more information, such as exceptions.

### Validity

The _valid_from_ and _valid_to_ fields are ISO 8601 date-times that indicate the period for which the data should be considered valid. For example, if an organisation that collects data on local services carries out checks once a year, then setting _valid_to_ to 1 year after _valid_from_ would be appropriate. This helps ensure that older data can be identified.

### Recurrence

The rest of the fields in the _schedules_ table are based on [RRULEs](https://icalendar.org/iCalendar-RFC-5545/3-3-10-recurrence-rule.html) from the [iCal standard](https://tools.ietf.org/html/rfc5545) in order to express the way in which the opening times repeat. RRULES are very expressive, and are familiar to many people, as they're widely used in calendar software.

HSDS doesn't contain all of the nuance of RRULE, and the schema doesn't check that your RRULEs are valid. This documentation provides only basic guidance on RRULE; please consult the iCal documentation for in-depth explanations.

An RRULE has three key components:
* A _dtstart_ (starting date-time); when the instance in the rule starts
* A _freq_ (frequency); the unit of the recurrence; e.g. days, weeks, months
* A _byX_ (by X); the value of the recurrence; e.g. 5

Together, these allow events to be expressed in the form "The first instance is on the 8th of August 2020, and it then happens every 2 weeks". For most services that have a

There's also an _until_ field, which gives an end point to the recurrence. This might be appropriate to use when describing a service that's only available for a season.

## Exceptions

It's common for services to have exceptions - for example, around holidays. These should be represented in the data by having multiple entries, each covering the relevant period.

Note that overlapping entries will be interpreted as additions to the schedule, not replacements. So, if a service offers extra opening hours during a period, then adding an extra entry is appropriate.



#### This page is *non-normative*, which means that it doesn't form part of the standard; if there is any ambiguity, the standard takes precedence. This page may be updated at any time in response to community demand.
