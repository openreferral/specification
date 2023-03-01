Schedules
=========

```{note}
This page is *non-normative*, which means that it doesn't form part of the standard; if there is any ambiguity, the standard takes precedence. This page may be updated at any time in response to community demand.
```


The ```schedules``` table contains information about when a service is available. 

Each schedule entry comprises three pieces of information:

 * An ID for the row
 * The opening times that are referred to
 * iCal RRULE-style fields that describe how often the opening times repeat. 

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


## Exceptional schedules

It's common for a service to operate different hours over a certain period - such as a holiday. 

If the service is offering additional opening hours to their regular hours, then a second entry can be added, with ```valid_from``` and ```valid_to``` set to indicate the limited range of dates that the additional hours apply for.

If the service is changing its hours, then set the ```valid_to``` value to the last day that the regular schedule is in operation, and add new entries for the service's exceptional opening hours.

## 24h opening 

HSDS doesn't have a way to model this explicitly. If a service operates 24 hours a day, setting the ```opens_at``` and ```closes_at``` to ```00:00``` and ```23:59``` is a strong signal to any data users that the opening hours are known and 24h. 

## Worked Example

In this example, we'll describe a service with ID ```35``` that's available from 9-12 and 3-5, Monday to Thursday, every week. They know that they'll change to a Christmas schedule in mid-December, so the schedule will be valid until then. 

Note: Only relevant fields are shown, for clarity. 

```{eval-rst}

+------+------------+------------+------------+----------+---------------+-------------------------------+----------+-----------+
| id   | service_id | valid_from | valid_to   | freq     | byday         | description                   | opens_at | closes_at |
+======+============+============+============+==========+====+==========+===============================+==========+===========+
| 1098 | 35         | 2020-04-01 | 2020-12-20 | "WEEKLY" | "MO,TU,WE,TH" | "Monday to Thursday, 9-12 am" | "09:00"  | "12:00"   |
+------+------------+------------+------------+----------+---------------+-------------------------------+----------+-----------+
| 1099 | 35         | 2020-04-01 | 2020-12-20 | "WEEKLY" | "MO,TU,WE,TH" | "Monday to Thursday, 3-5 pm"  | "15:00"  | "17:00"   |
+------+------------+------------+------------+----------+---------------+-------------------------------+----------+-----------+
```

Note that in this case, the non-iCal fields valid_from and valid_to have been provided to signify that this is the period that these opening hours are valid for. Consuming systems may infer from this that as the valid_to date approaches, they should seek to find out what future opening hours are for the service; they shouldn't necessarily infer that a service has ended - just that they don't have any more opening time information. This is in contrast to defining the service's opening hours by use of the ```until``` iCal field, which explicitly defines the end of a recurring event, and therefore a consuming system may infer that the service is no longer available after that time. 

During the year, they decide to open on the first Saturday of each month from July until November. So, they add another row:

```{eval-rst}

+------+------------+------------+------------+------------+------------+-----------+---------------+------------------------------------------------------+----------+-----------+
| id   | service_id | valid_from | valid_to   | dtstart    | until      | freq      | byday         | description                                          | opens_at | closes_at |
+======+============+============+============+============+============+===========+===============+======================================================+==========+===========+
| 5435 | 35         | null       | null       | 2020-07-04 | 2020-11-07 | "MONTHLY" | "1SA"         | "First Saturday of the month from July-Nov, 9am-5pm" | "09:00"  | "17:00"   |
+------+------------+------------+------------+------------+------------+-----------+---------------+------------------------------------------------------+----------+-----------+
```

Note that in this case the valid_from and valid_to dates aren't supplied, because the RRULE is limited by its nature; it specifies when the series of events starts and ends.
