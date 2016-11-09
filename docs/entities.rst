Entities
========

+------------------------------------+-------------------------+
| Entity                             | Attributes              |
+====================================+=========================+
| organization                       | id                      |
|                                    | name                    |
|                                    | alternate\_name         |
|                                    | description             |
|                                    | email                   |
|                                    | url                     |
|                                    | tax\_status             |
|                                    | tax\_id                 |
|                                    | year\_incorporated      |
+------------------------------------+-------------------------+
| program                            | id                      |
|                                    | organization\_id        |
|                                    | name                    |
|                                    | alternate\_name         |
+------------------------------------+-------------------------+
| service                            | id                      |
|                                    | organization\_id        |
|                                    | program\_id             |
|                                    | location\_id            |
|                                    | name                    |
|                                    | alternate\_name         |
|                                    | description             |
|                                    | url                     |
|                                    | email                   |
|                                    | status                  |
|                                    | application\_process    |
|                                    | wait\_time              |
+------------------------------------+-------------------------+
| service\_at\_location              | id                      |
|                                    | service\_id             |
|                                    | location\_id            |
|                                    | url                     |
|                                    | email                   |
+------------------------------------+-------------------------+
| location                           | id                      |
|                                    | organization\_id        |
|                                    | name                    |
|                                    | alternate\_name         |
|                                    | transportation          |
|                                    | latitude                |
|                                    | longitude               |
|                                    | description             |
+------------------------------------+-------------------------+
| phone                              | id                      |
|                                    | service\_id             |
|                                    | organization\_id        |
|                                    | contact\_id             |
|                                    | number                  |
|                                    | extension               |
|                                    | type                    |
|                                    | department              |
|                                    | country\_prefix         |
+------------------------------------+-------------------------+
| contact                            | id                      |
|                                    | organization\_id        |
|                                    | service\_id             |
|                                    | name                    |
|                                    | title                   |
|                                    | department              |
|                                    | email                   |
+------------------------------------+-------------------------+
| physical\_address                  | id                      |
|                                    | location\_id            |
|                                    | attention               |
|                                    | address\_1              |
|                                    | address\_2              |
|                                    | address\_3              |
|                                    | address\_4              |
|                                    | city                    |
|                                    | state\_province         |
|                                    | postal\_code            |
|                                    | country                 |
+------------------------------------+-------------------------+
| postal\_address                    | id                      |
|                                    | location\_id            |
|                                    | attention               |
|                                    | address\_1              |
|                                    | address\_2              |
|                                    | address\_3              |
|                                    | address\_4              |
|                                    | city                    |
|                                    | state\_province         |
|                                    | postal\_code            |
|                                    | country                 |
+------------------------------------+-------------------------+
| regular\_schedule                  | id                      |
|                                    | service\_id             |
|                                    | location                |
|                                    | weekday                 |
|                                    | opens\_at               |
|                                    | closes\_at              |
+------------------------------------+-------------------------+
| holiday\_schedule                  | id                      |
|                                    | service\_id             |
|                                    | location\_id            |
|                                    | opens\_at               |
|                                    | closes\_at              |
|                                    | closed                  |
|                                    | start\_date             |
|                                    | end\_date               |
+------------------------------------+-------------------------+
| metadata                           | id                      |
|                                    | resource\_id            |
|                                    | last\_action\_date      |
|                                    | last\_action\_type      |
|                                    | field\_name             |
|                                    | previous\_value         |
|                                    | replacement\_value      |
|                                    | updated\_by             |
+------------------------------------+-------------------------+
| accreditation                      | id                      |
|                                    | organization\_id        |
|                                    | accreditation           |
+------------------------------------+-------------------------+
| license                            | id                      |
|                                    | organization\_id        |
|                                    | license                 |
+------------------------------------+-------------------------+
| funding                            | id                      |
|                                    | organization\_id        |
|                                    | service                 |
|                                    | source                  |
+------------------------------------+-------------------------+
| eligibility                        | id                      |
|                                    | service\_id             |
|                                    | eligibility             |
+------------------------------------+-------------------------+
| service\_area                      | id                      |
|                                    | service\_id             |
|                                    | service\_area           |
+------------------------------------+-------------------------+
| required\_document                 | id                      |
|                                    | service\_id             |
|                                    | document                |
+------------------------------------+-------------------------+
| fee                                | id                      |
|                                    | service\_id             |
|                                    | fee                     |
+------------------------------------+-------------------------+
| payment\_accepted                  | id                      |
|                                    | service\_id             |
|                                    | payment                 |
+------------------------------------+-------------------------+
| interpretation\_services           | id                      |
|                                    | service\_id             |
|                                    | language                |
+------------------------------------+-------------------------+
| language                           | id                      |
|                                    | service\_id             |
|                                    | location\_id            |
|                                    | language                |
+------------------------------------+-------------------------+
| accessibility\_for\_disabilities   | id                      |
|                                    | location\_id            |
|                                    | accessibility           |
+------------------------------------+-------------------------+
| meta\_table\_description           | id                      |
|                                    | name                    |
|                                    | language                |
|                                    | character\_set          |
+------------------------------------+-------------------------+
