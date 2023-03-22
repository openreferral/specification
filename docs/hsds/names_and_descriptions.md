Names and Descriptions
==============

Locations, Services and Organizations all have `name` and `description` field that can contain free text. 

A `name` and `alternate_name` field should only ever include plain text, without formatting.

A `description` field may include HTML elements or [Markdown](https://en.wikipedia.org/wiki/Markdown), with special characters escaped or encoded. 

Consuming applications that expect plain-text only should strip HTML tags  from these fields. 

Publishers should also be aware that some applications may wish to extract a 'short description' from the `description` field, and may do so by looking for the first full sentence, or first line-break. 

