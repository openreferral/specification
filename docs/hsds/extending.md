Extending HSDS
==============

```{note}
This page is *non-normative*, which means that it doesn't form part of the standard; if there is any ambiguity, the standard takes precedence. This page may be updated at any time in response to community demand.
```

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

If a field exists that's close to one that you need, then it's better to use it and describe how it's used in your documentation.

## Engaging the Community

The Open Referral community includes many people who've used HSDS in a range of contexts, from developing national ecosystems for sharing data, to deploying simple systems for use in low-tech community environments. They're always happen to share their experience. 

## Sharing Your Work

The Open Referral initiative is based on open sharing of ideas, code and data, because this leads to better quality work and more useful systems through interoperability. If you're able to share your changes to HSDS with the community, you can expect helpful feedback, and can contribute to improving the standard. 

It's good practice to create a schema to reflect your data when extending or constraining the standard, so that you can continue to validate data and describe your data to potential users. We recommend creating a [JSON Merge Patch](https://tools.ietf.org/html/rfc7386) to share your work with the wider OR community, so that the changes are clear. There's some [helpful Python tooling](https://github.com/OpenDataServices/json-merge-patch) to help with this. 

## Developing the Standard

Extending the standard is a way to try out potential changes to the standard, so extensions play an important part in preparing for future releases. 


