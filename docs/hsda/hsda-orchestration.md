```eval_rst
.. _hsda-orchestration:
```
# HSDA Orchestration

The HSDA orchestration protocol is defined by [openapi-hsda-orchestration.yaml](../static/openapi-hsda-orchestration.yaml). The details below show the available methods and responses. 

This is a HSDA sevice specifically intended to manage orchestration around HSDA operations, enabling the system to become a two-way street, pushing data outside individual implementations. The system uses webhooks, and events to understand changes made to the HSDA system, and the data stored within.

You can also [explore this using our OpenAPI viewer](../../_static/swagger/?url=../openapi-hsda-orchestration.yaml). 

```eval_rst
.. warning::
    
    This is an experimental feature. Feedback is welcome to shape its further development.

```

```eval_rst
.. openapi:: ../../api-specification/_data/api-commons/openapi-hsda-orchestration.yaml
```
