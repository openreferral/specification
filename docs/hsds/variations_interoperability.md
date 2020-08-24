Variations & Interoperability
=============================

Like any standard, HSDS attempts to accomodation a wide range of applications, providing value to each application.

To this end, certain adaptations of the schema are permitted within the standard, and this results in interoperability considerations that must be considered when making design decisions for a particular system.

## Tables-to-fields Transformation

If there is a situation where there is at most a 1:1 relationship in a particular system between items in two tables, where those items would be linked by IDs, then it is permitted within the standard for those tables to be merged. Column names should be retained.

If the system in question is part of a wider ecosystem, then the community around that ecosystem should agree on a common approach to interoperability around HSDS. For example - agreeing on a common set of tables, or agreeing that standard HSDS should be available for interchange purposes.

For example, if all ‘service’ entries have at most one fee entry, then you can just add a ‘fee’ column to the ‘service’ table.



