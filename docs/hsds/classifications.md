Classifications, Descriptions & Taxonomies
==========================================

HSDS allows any entity to have attributes attached.

For _services_, the _service_taxonomy_ table is used for this.

For all other entities, the _link_taxonomy_ table is used.

## Scope of HSDS

HSDS is focussed on providing information about services; it is not designed to be a taxonomy interchange format. Therefore, the features provided by HSDS are intended to be sufficient for users to transfer enough information about a taxonomy to make the data about services be useful, but no more.

If, in a particular context, it's helpful to transfer more information than HSDS has in scope, then HSDS is extensible, and you're welcome to add additional information beyond the schema.

## Terminology

Classification and description is an area in which terms are used inconsistently across domains and applications. Therefore, we define here certain terms which are used in the standard.

These definitions may be different from those that you'd use in your context, in which case we'd suggest prepending the term "OpenReferral" or "HSDS" to disambiguate. For example, if you'd call an "attribute" a "property", then you might refer to an "HSDS Attribute".

### Vocabulary

A *vocabulary* is the set of words that are used in a language, which may have multiple meanings.

For example, the English language has around 170,000 terms in its vocabulary. The word “crane” can refer to a piece of machinery, a type of bird, or the action of overextending one’s neck in an attempt to see something that is otherwise obscured.

Alternatively a vocabulary of codes might be created for a particular purpose - such as “ES1098” and “87HG42”

### Taxonomy

A *taxonomy* is a structure of terms drawn from a vocabulary which can be used to describe attributes of something.

For example, a taxonomy designed for use in the construction industry, called “construction machinery” might say that a particular piece of machinery is a “crane”, or an “86HG4”

In such a case, to say that a particular machine is a “construction machinery”->”crane” is meaningful.


### Embedded Taxonomy

An *embedded taxonomy* is a taxonomy where the dataset contains the definition of the taxonomy terms used in the data; ie, to find out what a term means, you look within the dataset. It can be a clone of an external taxonomy, if licensing allows.

Data packages using HSDS shouldn't contain any unused taxonomy terms, in particular if providing those terms would result in a package that comprises more taxonomy data than service data.

### External Taxonomy

An *external taxonomy* is where the taxonomy is held outside of the data and  the dataset ships with just references to the taxonomy; ie, to find out authoritatively what a term means, you look elsewhere.

### Taxonomy Term

A *taxonomy term* is a particular instance of a term from a vocabulary which is given a particular meaning by a taxonomy.

For example, a taxonomy term might be “86HG4”, which the taxonomy describes as lifting equipment. It might be a child of “ES1098”, which is heavy machinery.

### Attribute

An *attribute* is some property, fact, or assertion that is made of a thing.

For example, a particular piece of machinery might have some attributes:

* Painted yellow
* Has a government-issued plate declaring it to be ID “JG36QAK” and allowed to be driven on public roads
* Is of type “crane”, from the taxonomy “construction machinery”



