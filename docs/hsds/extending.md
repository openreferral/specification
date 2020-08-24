Extending HSDS
==============

HSDS provides a common core for describing services, and includes a range of common fields, many of which are optional.

However, service provision is usually local, and so in a particular context there's likely to be fields that aren't relevant, and information that's important but isn't included in HSDS.

HSDS doesn't have a formal extension mechanism, but does suggest several patterns in which communities wanting to share information among themselves can use HSDS as a starting point

## Patterns

### Constrain

Using the "constrain" pattern, a community can decide on certain fields or tables to not use at all.

### Extend

Using the "extend" pattern, a community can decide on a common approach to including information that the schema doesn't accomodate.

If a community chooses to extend the standard, then we encourage them to share their work with the wider OpenReferral community so that others facing similar issues can learn from them and provide feedback.


### Constrain & Extend

The "constrain & extend" pattern combines the two previous patterns.


## Principles

When extending, implementations should try to follow the design of HSDS as closely as possible.
