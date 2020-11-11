Schedules
=========

The ```schedules``` table contains information about when a service is available. 

Each schedule entry comprises three pieces of information:

 * An ID for the row
 * The opening times that are referred to
 * An iCal RRULE-style that describes how often the opening times repeat. 


## Exceptional schedules

It's common for a service to operate different hours over a certain period - such as a holiday. 

If the service is offering additional opening hours to their regular hours, then a second entry can be added, with ```valid_from``` and ```valid_to``` set to indicate the limited range of dates that the additional hours apply for.

If the service is changing its hours, then set the ```valid_to``` value to the last day that the regular schedule is in operation, and add new entries for the service's exceptional opening hours.

## 24h opening 

HSDS doesn't have a way to model this explicitly. If a service operates 24 hours a day, setting the ```opens_at``` and ```closes_at``` to ```00:00``` and ```23:59``` is a strong signal to any data users that the opening hours are known and 24h. 

#### This page is *non-normative*, which means that it doesn't form part of the standard; if there is any ambiguity, the standard takes precedence. This page may be updated at any time in response to community demand.
