# Frequently Asked Questions

This FAQ provides context for the Open Referral Initiative and its Human Services Data Specification (HSDS). You can read more about Open Referral at [https://openreferral.org](https://openreferral.org)


### What is Open Referral?

The Open Referral Initiative is a network of people and organizations working to promote the accessibility of information about health, human, and social services — i.e. _community resource directory data_.

Our **Human Service Data Specification** (AKA ‘the Open Referral format’) is a data exchange format that enables resource directory data to be shared among heterogeneous information systems.

Open Referral’s ecosystem includes a range of open source tools and web applications that facilitate the flow of resource directory information. The **[the Ohana API](https://github.com/codeforamerica/ohana-api)** is an open source ‘reference implementation’ for the Open Referral format, and **[Ohana Web Search](https://github.com/codeforamerica/ohana-web-search)** (for example) is a resource locator website that works with the Ohana API (or compatible APIs). 

More tools are in development by members of Open Referral’s network, members of which are primarily assembled in [our Google Group](https://groups.google.com/forum/#!forum/openreferral).


### Who started Open Referral?

Greg Bloom is the instigator and lead organizer of Open Referral, which emerged from work done in **the DC Open211 project**, and which was first described [Towards a Community Data Commons](http://http://beyondtransparency.org/chapters/part-5/towards-a-community-data-commons/), an essay published in Code for America’s 2013 book *Beyond Transparency*.

Our work was initially co-sponsored by [Code for America](https://www.codeforamerica.org/blog/2014/08/05/open-referral-initiative-a-standard-for-the-safety-net/) and the Ohana Project, with funding from the Knight Foundation.


### Who is the audience for Open Referral?

There are three types of _ultimate_ stakeholders for Open Referral: 1) people in need of help of some kind (**‘help-seekers’**) — and 2) people who are in some kind of position to assist such help-seekers (**‘service providers’**). Another important stakeholder group is comprised of 3) **‘researchers’** — i.e. analysts, as well as policymakers and funders and anyone seeking to understand the patterns of resource allocation in their community.

The **_primary_** users of Open Referral are **people and organizations that aggregate, maintain, and/or deliver community resource directory data** — we simplify this by referring to such stakeholders as *database administrators*. Our objective is to help such database administrators share higher quality resource directory data at lower cost, with the goal of making it easier for people to find such information across a wide array of channels.

Read more about each of these types of users [here in our User Personas documentation](https://docs.google.com/document/d/1XqueBVbRVgR0BVGjDbUdN4suUYfMKm7yJm1f3nRsGtY/edit?usp=drive_web).


### How is this project relevant to me?

Open Referral helps people and organizations grapple with the complex problem of maintaining and publishing reliable information about the health, human, and social services available to people in need.

Most of our work does not involve writing code. We facilitate collaborative action among institutions that have mutual interest in cooperation.

That said, Open Referral is an open network. Anyone is free to use our data specification and tools in pursuit of our shared goals.

If you have resource directory data that you wish to make more available — or if there’s an organization in your community that might make its data more broadly accessible, then you could get to work right away. 

Read more in our Contributors Guide. Reach out to [info@openreferral.org](mailto:info@openreferral.org) to get directly in touch.


### If I maintain a community resource directory — or if I partner with an organization that does — how would I get started?

You can start by testing the viability of our format for your context. That may entail [mapping your database's schema to the Human Services Data Specification](http://docs.openreferral.org/en/latest/producing_sharing/#guidance-on-mapping-fields-and-values).

Once you've mapped your schema to ours, analyze the gaps. (You can ask questions or submit suggestions for improvements to our schema in [our Issues Queue]([https://github.com/openreferral/specification/issues](https://github.com/openreferral/specification/issues)).) 

Then you can write a script to transform your data into this open format.

Finally, you can deploy the Ohana API, load your transformed data in ([loading instructions here](https://github.com/codeforamerica/ohana-api/wiki/Populating-the-Postgres-database-from-the-Human-Services-Data-Specification-(HSDS)-compliant-CSV-files)), and start building new tools that can help people in your community use this data in new ways.

If you have questions about how this might be useful in your community, please reach out to [info@openreferral.org](mailto:info@openreferral.org)

Here are some examples of mapped schema: A comparative analysis of a resource directory from [Evanston]([https://docs.google.com/document/d/1eUoX2Fgl56ekF3ZIZYlOIVpgc6FlrEvqgZbaOqvT79k/edit](https://docs.google.com/document/d/1eUoX2Fgl56ekF3ZIZYlOIVpgc6FlrEvqgZbaOqvT79k/edit)) to an earlier version of HSDS. The [humanitarian service data model]([https://docs.google.com/spreadsheets/d/1bOTdGmHo73t8FOvwt5sfJQD0QugpTtRmWIihOHjKXyA/edit#gid=1867626204](https://docs.google.com/spreadsheets/d/1bOTdGmHo73t8FOvwt5sfJQD0QugpTtRmWIihOHjKXyA/edit#gid=1867626204)) ([more about this project here](https://openreferral.org/introducing-the-humanitarian-service-data-model/)). The [DMV Maternal Mental Health resource guide](https://docs.google.com/spreadsheets/d/1mrjpcoOY_INCeK3bALgylgUtY2YZhhYvQOt85hfPtpc/edit). [Here is an example of a script](https://github.com/BCH-Online-Advocate/Migration-Script) to transform and load data into Ohana, from Boston’s Helpsteps roject.

Read more in our Contributors Guide.


### What if I collect important information that isn't included in the Open Referral specification?

That's ok! The Human Services Data Specification is an extensible format to which additional layers of information can be added. (But we'd like to learn from your experience, so please share these insights!)


### What if your specification requires kinds of information that I don't collect?

The Open Referral format has been developed to require a pretty minimal set of information. If your resource directory doesn’t contain certain required elements, we may need to get creative. Ask in [our Issues queue](https://github.com/openreferral/specification/issues) for clarification and context, and we'll try to answer you promptly.


### What if I need help collecting this data in the first place?

Open Referral is working to build tools to help produce and verify accurate resource directory data. If you’re interested in developing such tools — and/or if you already have experience with such tools — we want to hear from you! Please reach out to [info@openreferral.org](mailto:info@openreferral.org) to discuss.


### Who has adapted this project and can I see examples?

We have [a network of projects around the United States, Canada, and beyond](https://openreferral.org/about/projects/). [See this network map here](http://kumu.io/Bloom/open-referral-network-map).

You can also see deployments of the Ohana API and compatible APIs [here](https://github.com/Code-for-Miami/ohana-api) and [here](http://api.helpsteps.com/api). Some groups have adapted our data specification to their context, such as [the Human Services Data Model](https://openreferral.org/introducing-the-humanitarian-service-data-model/) (in the field of Humanitarian Crisis Response).


### Who do I contact if I need help with this project?

You can contact Greg Bloom ([@greggish](https://github.com/greggish) | [bloom@openreferral.org](mailto:bloom@openreferral.org)), the chief organizing officer for Open Referral.


### What languages is this project in?

Currently Open Referral is in English, though we have at least one Spanish deployment [in Madrid](https://openreferral.org/huertas-de-datos-open-referral-in-madrid/) :)


Oh, do you mean machine language? Our data specification calls for CSV files with a JSON datapackage. Our reference implementation, [the Ohana API](https://github.com/codeforamerica/ohana-api), is in Ruby.


### If I wanted to help with this project, what is the best way to do that?

Get in touch with Greg at [bloom@openreferral.org](mailto:bloom@openreferral.org). You can also start by finding other people in your community who work with information systems that keep track of the health, human, and social services available to people in need.

You could also look through [our Issues queue](https://github.com/openreferral/specification/issues), comment away, and even offer Pull Requests to our documentation with your own documentation of why. It might be a while before we are able to address your issue directly, but your feedback is very welcome as it helps us set our agenda!


### Is the project in active development?

The Human Services Data Specification is entering an upgrade phase of development, under the interim leadership of the [Open Data Services Cooperative](http://opendataservices.coop). [Check out our issues queue](https://github.com/openreferral/specification/issues).

We are seeking sponsorship to support long-term institutional development of Open Referral and our data specification. Please reach out to [info@openreferral.org](mailto:info@openreferral.org) for more information.

### What is the licensing on this project?

Human Services Data Specification v1.0 is now [available as a CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
