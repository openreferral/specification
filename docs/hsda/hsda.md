```eval_rst
.. _hsda-spec:
```

# HSDA

The core HSDA protocol is defined by [openapi-hsda.yaml](../../_static/openapi-hsda.yaml). The details below show the available methods and responses. 

You can also [explore this using our OpenAPI viewer](../../_static/swagger/?url=../openapi-hsda.yaml). 

```eval_rst
.. admonition:: General principles
    :class: hint

    .. markdown::

    * Applications should always support GET, but may choose whether or not to support POST. PUT and DELETE requests;
    * Each resource is named after a table in HSDS, and field names and definitions follow HSDS definitions;
    * Most resources have a /complete/ version which should be populated with content from linked tables to provide consumers with access to contextually relevant data;

```

```eval_rst
.. openapi:: ../../api-specification/_data/api-commons/openapi-hsda.yaml

```
