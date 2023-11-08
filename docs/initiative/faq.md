Strategic Questions 
======================

## What’s the problem you are trying to address? 
See our Strategic Overview [here](https://openreferral.org/about/strategic-overview/). 

## What’s the opportunity that Open Referral presents?
See our Strategic Overview [here](https://openreferral.org/about/strategic-overview/). 

## What do we mean by Referral? What is ‘information and referral’?
Broadly speaking, when people in need seek resources that can help them meet their needs, they may likely interact with an intermediary – a social worker, healthcare provider, librarian, etc – who can ‘refer’ the help-seeker to another service provider. Community resource information can help enable such referrals. Resource information is comprised of data about health, human, and social services available to people in need — which organizations provide these services, and how they can be accessed. 

Some services are provided by non-profit organizations, and other civic or cultural groups. Others are provided by local, state, even federal governments. All of these entities share information about their resources in different ways.
‘Information and referral’ refers to the field in which information about services is aggregated in community resource directories, and delivered (via referral) to people seeking help. 

[The Alliance of Information and Referral Systems (AIRS)](http://www.airs.org) is an accrediting agency that certifies ‘information and referral’ providers throughout North America. AIRS promotes official standards for ‘information and referral’ services, ranging from operational standards to data standards. AIRS has collaborated with the Open Referral Initiative from its inception, and in 2018 AIRS [formally endorsed our protocols as industry standards for interoperable resource data exchange.](https://openreferral.org/airs-recommends-open-referral-for-resource-database-interoperability/)

You can learn more about the industry of Information-and-Referral, and Open Referral’s work within it, [in this paper here](https://bitly.com/CUPChapter).

## Who are your users? 
The primary users of HSDS are people who manage resource directory information systems. Of course, these users are themselves intermediaries, working to meet the needs of other users. So let’s back up to look at the big picture. 

We’ve identified four primary types of use that are relevant to this domain. [Read more here for full personas and user stories](index.md#types-of-use-and-user-personas).

- **Seeking help** (service users, clients, etc)
- **Providing help** (service providers, i.e. anyone helping someone find information about services)
- **Administering data** (anyone engaged in working with community resource data and the technical systems that use it)
- **Research** (anyone trying to analyze resource data to better understand the allocation of resources in a community).
- 
Obviously, **‘help seekers’ are the ultimate stakeholders**, and we should consider our work first and foremost from their perspective. Aside from this premise, we do not prioritize one stakeholder’s needs above another. Through these distinct perspectives, we set the parameters of our research, design, and evaluation. Our format (and the associated tools) should meet all of their needs.

We believe that **the most immediate and urgent objective is to improve the capacities of all kinds of service providers to make effective referrals with accurate information.** One of our core hypotheses is that if/when an ‘open system’ meets the needs of the service providers in its community, those service providers will play a critical role in maintaining the accuracy of its information. 

Yet we also recognize that an increasingly common 'use case' is an individual searching the web. Surely we want to improve people’s ability to find this information themselves. Of course, even given success in this regard, we assume there still will remain a need for trained referral specialists — especially for complex situations in which people have complicated needs, etc.

Finally, **when it comes to actually adopting and using open data standards and platforms, we recognize that the primary type of use for our data standards is data administration.** In other words, our format and tools must be readily usable by anyone who updates this information and manages the technology that stores and delivers it to anyone who might benefit from it. 

## What do we mean by Open Data?
**Open means 'free,' as in 'free speech.** We are all entitled to it by fundamental right.

**Open means accessible.** We have "open access" to things like roads and libraries -- these are public goods, and anyone is able to use them. Likewise for our computer technology: open data can be accessed and used not just in one system, but any capable system.

**Open does NOT necessarily mean 'anything goes.** Books have to be returned to the library, and in good condition. Roads have speed limits. You can’t yell ‘fire’ in a crowded theater. Etc.  

**Open does NOT necessarily mean 'free' as in without cost.** Some roads have tolls; all roads need to be maintained. For something to exist in an open state, a lot of energy and resources must go into keeping it so. Those resources must come from somewhere (and, in the case of resource directory data, we don’t assume they will automagically crowdsource themselves). 

**Open’ can mean many things, but at its core, ‘open data’ entails:**

- **Accessibility:** open data is accessible as a “[machine-readable](http://okfn.org/opendata/glossary/)” resource, meaning it can be ingested and displayed by computer programs, and presumably downloadable over the internet. (There can be reasonable reproduction costs associated with certain kinds of access to open data.)
  
- **Reuse and Redistribution:** open data is provided under terms that permit reuse and redistribution, including the intermixing with other datasets (although open data can be licensed to prohibit changes or to require documentation of changes). There should be no discrimination against fields of endeavor or against persons or groups (although open data can be published with ‘dual licenses’ that specify different conditions for different uses).
- 
- **Openness entails a state of possibility.** When it comes to public information, data becomes more valuable when more people use it. (Conversely, resource data is less valuable when fewer people use it.) When it’s easy to access and use resource data by any means, it becomes easier for more people to do more things with the data, and as more people do more things with the data, feedback on the quality of the data increases, data about the use of the data can be collected and analyzed — and the maintainers of the data become more critical to the entire ecosystem.
- 
Open Referral’s core question is about how resource data can be sustainably maintained as an openly accessible public good.

## What do we mean by ‘open platforms’? 
A ‘platform’ is an ambiguous term that could mean a lot of different things — here we use it to refer to a system that connects producers and consumers, enabling them to interact with each other.  Platforms enable data to be accessed and used in all kinds of ways, including – when a platform is ‘open’ – uses by external systems which can be ‘built upon’ the platform, many of which would not or could not be provided by the platform operators themselves.

**By ‘open platform,’ we specifically mean three things:** 
- A system that facilitates the management, publication, and access of open data
  
- A system powered by technology that is freely available through open licenses
  
- A system in which interoperability and integration are the primary design objectives

**What’s an API?**
An API is an “application programming interface” which provides instructions for computer programs to interact with a database. 

For example, you can get a forecast from the National Weather Service by going to [Weather.Gov](http://www.weather.gov/). But [the NWS also offers a web service](http://graphical.weather.gov/xml/) (known as an ‘Application Programming Interface’, or API) that allows external applications to access the NWS database in real-time. This enables developers to build [applications that connect to the NWS ‘platform’](http://www.programmableweb.com/api/noaa-national-weather-service-nws) in order to seamlessly provide public weather data to [skiiers](http://www.programmableweb.com/mashup/blizzalert), [photographers](http://www.programmableweb.com/mashup/getoutcast), [rainbow chasers](http://www.programmableweb.com/mashup/omg-rainbows), etc. (See [this segment from John Oliver’s Last Week Tonight about the National Weather Service](https://www.youtube.com/watch?v=qMGn9T37eR8) and the importance of open platforms for public information.)

## What do we mean by ‘standards’? Why are standards important?
By standards, we refer to common ways of doing things. In the case of data standards, that means an agreed-upon set of terms and relationships that **define** and **structure** information, so that it can be readily **transferred** between systems.

With such common agreements, different technologies can ‘speak’ to each other — making it easier to integrate systems, and develop, redeploy, and scale new tools. 

For resource directory information providers, the development of standards means that **resource data can be published once and accessed simultaneously in many ways.** That’s how the internet became the World Wide Web. 

Standardizing data across places and institutions also makes it easier to analyze and evaluate data, which makes it easier to understand patterns and trends — including, in the case of community resource data, the health of communities and the effectiveness of our safety net.

Furthermore, the process of developing standards helps to bring stakeholders together. By building a community among users, producers, and service providers, we can accelerate the process of learning and innovation towards our shared vision of helping people and improving the health of communities.

With increasing adoption of open standards for resource directory data, we anticipate: 

- **Decreased cost of data production** (as data produced once can circulate through many systems)
- **Improved quality of data** (as more use generates more user feedback)
- **Improved findability of data** through web search and an ecosystem of tools and applications; Decreased cost and improved quality of new and redeployed tools (websites, applications, etc).
- **Improved quality of referral services** (as patterns of resource allocation shift from maintaining data to delivering data)
- **Meaningful use of resource data for research purposes**, such as community health assessment, and policy-making and resource allocation.
- **Healthier people and more resilient communities.**

## Aren’t there other standards for human service directory information?
The short answer is no – Open Referral’s Human Service Data Specifications are the industry standard for resource directory information exchange. 

In the United States, this is a result of [the Alliance of Information and Referral System’s endorsement of HSDS](https://openreferral.org/airs-recommends-open-referral-for-resource-database-interoperability/) as one of their standards for the industry of Information and Referral; in the United Kingdom, [this has been established by the national government’s standards body](https://openreferral.org/uk-government-endorses-open-referral-uk/).

There are of course other existing standards that are relevant to this domain, such as:

- The [W3C’s civic services schema](http://www.w3.org/wiki/WebSchemas/CivicServices), proposed to [the W3C](http://www.w3.org/wiki/WebSchemas/CivicServices) through [Schema.org](http://blog.schema.org/2013/08/vocabulary-for-describing-civic-services.html)
- The human services domain of [the National Information Exchange Model (NIEM)](https://www.acf.hhs.gov/nhsia-definition)
- [FHIR’s Healthcare Service Resources](http://build.fhir.org/ig/HL7/VhDir/StructureDefinition-vhdir-healthcareservice.html)
- 
Fortunately, HSDS is designed to be an interchange format – which means it can enable interoperability across domains by translation into other standards. For instance, [we have translated HSDS into the schema.org markup for legal aid services])https://openreferral.org/improving-access-to-legal-aid-by-improving-search-results-with-schema-org/); and we have also developed implementation guidance for querying HSDS data in FHIR. 

Do you have another standard in mind that seems relevant to this work? [Post in our forum about i])https://forum.openreferral.org/)t and let’s discuss!

## Have you seen this [XKCD cartoon](https://xkcd.com/927/) about Universal Standards? Aren’t standards futile?
Why yes we have seen that cartoon, many times, thanks– but no, it doesn’t show that efforts to develop standards are futile. To the contrary! We encourage skeptics of standards to take a closer read. 

The XKCD cartoon identifies a collective action problem, which is only further entrenched by each unilateral effort to solve the problem by competing to ‘beat' all other standards. Collective action problems can be solved, however, by cooperation! If a new standard is designed to enable interoperability among other standards – voila! We can have many different but compatible standards.

Open Referral takes this cooperative approach. It may seem less heroic, but it’s more effective. Instead of one standard that ‘beats’ them all, [HSDS is now an industry standard](https://openreferral.org/airs-recommends-open-referral-for-resource-database-interoperability/) for resource directory data exchange – the only such standard for exchange, but one designed to enable cooperation across any system using any other relevant standard for any other purpose. One way to think of it is as an ‘interlingua’ – a tool for translation. By creating capacities for translation, we don’t have to solve everyone’s use case! We just make it easier for different actors using systems with different standards to work together, so anyone can have a range of compatible options for developing a solution to their own use case.

## What makes you think you know the right solution?

Well, we don’t yet know the right solution! We’re just not going to wait around any longer for it to be figured out. So we’re taking action. 

**Essentially, we are asking: how should this data be open?**

This is a wicked problem that requires a lot of different people working together to learn about possible solutions. We believe that the best ways to address wicked problems tend to emerge from the insight and creativity of those who directly experience the problems. So our prerogative is to promote the perspectives and involvement of the true stakeholders — people who have experience seeking help from services, service providers themselves, data administrators at community-based organizations, community health researchers, etc. They’re the ones who will be best able to recognize what viable solutions really look like.

## Is this really such a hard problem? Can’t AI just take care of it? What about the blockchain???
Many of us, at one point or another, were hopeful that technology would provide quick fixes to systemic problems. Those hopes haven't panned out. It turns out that some problems are so tricky that they can only really be fixed by lots of people working together over time. As cool as advances of AI are, we don’t actually have any reason to believe that this dynamic will change any time soon.

To be more specific, the community resource directory problem is a supply-side problem – there is not a reliable supply of accurate information about services – which means AI tools are uniquely ill-suited for solving the problem, because their quality is directly dependent upon the quality of the data they are supplied. 

AI can’t solve this problem because the root of the problem is in an array of perverse incentives and disincentives across the health, human, and social service sectors. For instance, many providers of health, human, and social services just don't have strong incentives to be found by more clients! This means their information just might not be out there on the internet – not in a sufficiently detailed and up-to-date form that technical wizardry like web scrapers and chatbots might need to generate reliable results. Ultimately, if we want to have reliable information about these services over time, human beings need to talk to each other. Open Referral is working to make sure that technology can facilitate and enhance these human interactions – rather than pretend like we can eliminate the need for it, which might ultimately get in the way or even cause harm. 

## Why can’t you just get organizations to update their information themselves?

There are a number of factors that limit the reliability of organizations as sources of information about their own services:

- **Organizations might not designate the responsibility for managing all of this information to any single person.** A single organization might offer many services through various programs at multiple locations. And these are often stressed environments with limited technical capacity and overburdened staff.  It can be hard for organizations to keep track of all of their own services!

- **Organizations sometimes submit information about services that is vague or not entirely accurate.** When updating their own records, organizations’ staff sometimes submit information that is composed to promote their organization in general, yet not precisely describe the information about services that is needed. This tends to yield information that is not useful to someone who is looking for a service. 

- **Organizations are asked to update their information so many times in so many different community resource directories** that they get confused or frustrated. 

- **Keeping this information up to date just isn’t a high priority** when organizations already have more clients coming through its doors than they can handle.

As a result, we assume that organizations’ self-reported updates should be considered one input among many in the effort to produce and maintain accurate data about services.

## Why don’t government or funders require this data as a condition of funding?

Governments and funders do typically require their grantees to report various kinds of data, but it’s generally non-standardized and not specifically about services themselves. 

As Open Referral has been adopted by more institutions, governments and funders have begun mandating the supply of directory information as a condition of funding. We would be glad to discuss examples of this and offer suggestions for how this approach can be strategically pursued in your community.

## How can something that’s free for anyone to use be sustainably maintained? 

Great question! To find answers to this question, we need more opportunities to ask it. In Open Referral, we ask: how should this data be open? 

If resource data is to be published in bulk for free, can premium real-time access via API require a fee? If the market won’t fully cover costs of its production in this way, should the government subsidize its production? Etc. We have outlined various models for answering this question in [this whitepaper here](https://docs.google.com/document/d/1KZmhplFcYRXdQw6QgyTpBsMMAvkzgBM30DonyR-dOQc/edit).

## Aren’t call centers important for people who might not be able to use a computer, etc?

Of course they are! 

We think it’s important for this information to be accessible to a whole ecosystem of services, and for the foreseeable future, call centers will be an essential component of a healthy ecosystem. That’s why it’s important for us to develop standards and open data that can be shared throughout that ecosystem, so that different organizations can use the same data in different ways to meet the needs of different people.

## Shouldn’t we have a Yelp for Social Services? Why aren’t you trying to build that?

Lots of people are trying to build Yelp-type applications for social services. That’s not Open Referral’s role. There’s a range of reasons why:

First, information about human services is a lot more complex, variable, and sensitive than restaurant data – and unlike restaurateurs, many human service providers might not see the benefit of being listed in a Yelp for Social Services. This is a problem that simply doesn’t correspond with conventional supply-and-demand market dynamics that make Yelp possible. (Note that many restaurateurs don’t like Yelp either but they have no choice but to be listed there because it has come to dominate restaurant searches.)

Second, we want this information available in many channels and applications – including Yelp itself! Plus Foursquare, Google Places, Facebook, etc! Yet even these wouldn’t meet the needs of every user in every situation. Resource directory data should be itself a public good, freely ‘remixable’ by anyone, not trapped within any one company’s interface.

There are a range of other reasons why we don’t think this problem has one simple ‘Yelp for Social Services’ answer. Check out [this talk](https://openreferral.org/talking-open-referral-at-stanfords-data-on-purpose/) for more insights, and email info@openreferral.org to discuss further.

## What about the problem of service taxonomies?
Open Referral recognizes the existence of a [diverse array of taxonomies](http://docs.openreferral.org/en/latest/design_principles/#related-taxonomies) that are used to describe types of services, organizations, and people for whom services are available. Given that such categories are inherently subjective – whereas Open Referral’s Human Services Data Specification only describes factual data – we do not prescribe a specific taxonomy.

[0ur data format specifies methods with which an implementer can use any taxonomy](http://docs.openreferral.org/en/latest/hsds/classifications.html?highlight=taxonomye/#service_taxonomy) with their directory dataset – even multiple taxonomies for use in the same directory.

Several prominent taxonomies, such as the 2-1-1 LA Taxonomy, are prohibited from public use by intellectual property claims. This poses barriers to the accessibility of community resource data. We are committed to seek solutions that can sustainably and responsibly remove barriers to the widespread use of these important classification tools.

We’d welcome opportunities to discuss the prospect of “opening up” any given proprietary service taxonomy, as we believe such a taxonomy could be more widely used, more easily maintained, and more financially sustainable by becoming open access infrastructure. Please reach to our network via our [Community Forum](https://forum.openreferral.org/) or [Slack channel](https://openreferral.org/get-involved/join-our-slack-team/) to discuss.

## What about the 211 taxonomy?

Good question. What about it?!

The Open Referral Initiative intends to establish interoperability and open exchange between different kinds of systems. This entails building on what is currently in use. At the same time, it also entails moving beyond barriers to accessibility of community resource data.  
The 2-1-1 taxonomy is widely used among certified providers of ‘information and referral’ services, as well as some government agencies. For some purposes, it is a very valuable tool for precisely categorizing types of services. For many organizations and most users of community resource data, however, it is a significant barrier for at least two reasons — first, it is a proprietary artifact, and second, it is difficult to use without technical training.

We hold **open questions** about how the field might move beyond such barriers. Because 2-1-1 Taxonomy is such a valuable knowledge resource for the sectors of health, human, and social services – and because its true value only grows with the number of users – we believe it should be freely accessible for anyone to use. 

How would the maintenance of such a resource possibly be sustained as a public good, given that it requires resources to maintain? We think that’s a great question. We should ask it, and seek answers! What do you think? [Let’s talk](mailto:info@openreferral.org) :)

## Is Open Referral ‘scraping’ 2-1-1 data?
No. Open Referral is not a database or a platform. We help other organizations evolve their resource databases into open platforms. 

For what it’s worth, we reject the idea that community resource data can or should be treated like private property. It is public information, and organizations that do business with it should be recouping the costs of maintaining it by helping other organizations add value to it, thereby capturing some of that value. It’s a much more strategic and sustainable business model than trying to sell public information. [See a report from Miami Open211 about how this might work](https://openreferral.org/miami-open211-developing-new-business-models-for-resource-data-as-a-service/).

We do recognize that there are some resource directory projects out there that are scraping 2-1-1s data. (Some of these projects are non-profit, or all-volunteer, or even for-profit.) Scraping this data from websites is usually technically easy, and [it’s legally okay too](https://reason.com/2019/09/09/scraping-a-public-website-doesnt-violate-the-cfaa-ninth-circuit-mostly-holds/). We disapprove of this, mostly because it makes it harder to have constructive conversations about the real problem — which is that this data is not currently “open” for machine-readable re-use. We also believe that if community resource directory data were openly accessible in a machine-readable format, ‘scraping’ would be pointless. Instead, people would use such data from its source, in ways from which the source can and should benefit.

## Can I load my data into Open Referral? Can I get data from Open Referral?

No, Open Referral is not a database or a platform. We help facilitate cooperation among organizations that do have databases or platforms – so that they can share data effectively. Some members of our network may build tools that enable sharing of data across their network – [like the Open Referral UK developer tools](https://developers.openreferraluk.org/) page – but we are not directly responsible for those tools or the content that might be managed within them. You can use our [documentation][..index.md] and [tooling](https://github.com/openreferral) to transform your data into a standard format and deploy your own platform!

## Is Open Referral trying to build a national database of services?

No. We recognize that this is a local problem that should entail local solutions. That’s why we’ve developed an open data standard, which can be used by any community to find locally-appropriate methods of data sharing.

## If you’re going to build a new system, who will maintain the data?

Please note that Open Referral is not a platform and we do not collect or distribute resource data ourselves. Our primary objective is to help communities answer this question for themselves. We’d be glad to help you answer that question for your community. 

## Is Open Referral a Community Information Exchange?

We are not! The idea of a Community Information Exchange sounds great, but as we understand it, a CIE is infrastructure that facilitates the exchange of clients' personal information among health and human service providers. This is outside of our scope: Open Referral focuses specifically on information about service providers themselves – public information about organizations, not sensitive private information about people.

That said, we do have opinions about how communities might go about designing the process of Community Information Exchange infrastructure development. Feel free to reach out and talk about it! 

## Will Open Referral work with this or that vendor’s resource referral software that some organizations in our community are using?

Potentially yes! As an open standards and infrastructure initiative, Open Referral is platform-agnostic. We want to see a world in which there are many platforms that can all interoperate, so that people and organizations in communities can effectively and responsibly interact with each other across organizational and technological boundaries. If there's a platform in your community, they might already use Open Referral to publish or consume resource data from other partners. If they don't, maybe they should :)

Reach out to explore more opportunities.


# Organisation and Process Questions

## What is Open Referral?
The Open Referral Initiative is a network of people and organizations working to promote the accessibility of information about health, human, and social services — i.e. community resource directory data. The Open Referral community is primarily assembled in [our Forum](https://forum.openreferral.org/). We also use a [Slack team](https://openreferral.org/get-involved/join-our-slack-team/) for chat.

Open Referral’s primary product is the [Human Service Data Specification (HSDS, AKA ‘the Open Referral format’)](../hsds/overview) – a set of data exchange protocols that enables resource directory data to be shared among heterogeneous information systems. These artifacts are freely accessible and adaptable by anyone (in accordance with our stated [principles and values](index.md#values-and-principles)).

Open Referral’s ecosystem also includes a range of open source tools and web applications that facilitate the flow of resource directory information. See [examples of these tools and apps here](https://openreferral.org/about/technology-overview/). 

The Open Referral Initiative has a 501c3 fiscal sponsor: [Aspiration](http://aspirationtech.org). Aspiration receives any charitable/philanthropic funding that is granted to Open Referral, and holds the (open source) license to our intellectual property.

Our leadership also has an LLC – Open Referral Consulting Services – that is available to provide consulting support for strategically related projects. [Learn more about our consulting work here](https://docs.google.com/document/d/1Ag1LBspPALVOpuIYZc1WAk65qzzeeiSkOo705rl7Tf8/edit).

## Who leads the Open Referral Initiative?
The founder and lead organizer of Open Referral is Greg Bloom. Bloom oversees the management of this website (hi!) and the associated communications channels, and also coordinates core Open Referral activities. You can [see Greg's story here](https://openreferral.org/talking-open-referral-at-stanfords-data-on-purpose/). Greg’s leadership in this project emerged from his work on the DC Open211 project, and which was first described [Towards a Community Data Commons](http://http//beyondtransparency.org/chapters/part-5/towards-a-community-data-commons/), an essay published in Code for America’s 2013 book Beyond Transparency.

During cycles of technical development of our core protocols, Greg deputizes technical leadership (such as the [Open Data Services Cooperative](https://opendataservices.coop/)) —  empowering these technical specialists to develop proposals that are subjected to review by the community.

Beyond these responsibilities, Greg's powers are facilitative – he is here to ask questions, seek clarification, make connections, and help share information among members of our network.

Various tasks in this network are taken on at various times by members who feel motivated to lead in particular directions. Would you like to help with a particular objective? Reach out to info@openreferral.org 

## How are decisions made? 

[Learn more here in our project documentation](index.md#governance-and-participation). Our governance model is structured around three activities: 1) a semi-regular Assembly (ie video call) open to all participants [see an archive of these videos [here](https://www.youtube.com/channel/UCtbojLVi_ti_MWyGD2-AM4A)], where announcements are shared and feedback is received; 2) convenings of diverse stakeholders in Open Referral workshops, where we deliberate on difficult issues and set priorities; and 3) ad hoc ‘workgroups’ consisting of leaders with a varied set of perspectives and experiences, which develop proposals for review and approval by the community at large. 

Of all the feedback received from many different contributors, we assign priority to the perspectives of the lead stakeholders of our pilot projects. This feedback is submitted to Open Referral's deputized technical leads, who ultimately make proposals, implement decisions, and document outcomes about our specifications. Through this process, stakeholders, workgroup members, or technical leads can also propose methods for future review and decision-making – subject to consent of the group.

We develop proposals through a kind of **‘advice process’**: before we do things, we ask for advice from those who will be impacted by a given decision, as well as those who are experts on the relevant subject. We synthesize their input and circulate among a wide variety of participants, giving prerogative to our primary stakeholders (i.e. help seekers, service providers, researchers, and database administrators). These processes happen both at the ‘global’ level of Open Referral overall, and at the local level of pilot projects that implement these data exchange protocols — with decisions made at the most locally appropriate level. (One way to describe this is **‘polycentricity’** — [read more about what we mean by that here](https://www.openreferral.org/toward-seamless-information-referral-polycentric-experiment/).)

 When it comes to making decisions for the Initiative as a whole, our simple rule of thumb is [rough consensus and running code](http://en.wikipedia.org/wiki/Rough_consensus). We do things that 1) demonstrably work, and which 2) none of our community members find to be outright objectionable.
 
## How is Open Referral’s work sustained?
As an open network, much of Open Referral’s activity is driven by voluntary contributions from participants (individuals and organizations) who share our vision, use our specs and tools, and contribute back to the community. 

We also recognize that, often, people need to get paid in order to reliably get things done.

Occasionally, Open Referral receives grants and other charitable contributions – or we partner with organizations who do – to fund our core operations. These grants are received and managed by [Aspiration](http://aspirationtech.org/), our 501c3 fiscal sponsor. 

Our leadership sometimes offers consulting support to our partners through an an LLC – under Open Referral Consulting Services. These services vary depending on the needs of our partners, from advisory support to workshop facilitation to project design and implementation; one way or another, our partnerships involve facilitation of standardized resource data exchanges and the development of public information infrastructure. 

We also help local stakeholders develop their own fundraising efforts to build capacity for development and implementation of local strategies.

Do you have questions about our budgeting, or ideas about how to build more capacity for our work? Reach out to info@openreferral.org

## How do you balance the interests of a consulting service with the prerogatives of leadership in this community?

We are committed to working on projects that are aligned with the values of Open Referral, and which are strategically relevant to our mission. We prioritize partnerships that yield open source outputs that can be re-used by any members of our network. We also clearly indicate when we are working in formal partnership with an organization, and promote transparency to whatever extent possible and appropriate.

[Read more about our approach to partnership development here](https://docs.google.com/document/d/1Ag1LBspPALVOpuIYZc1WAk65qzzeeiSkOo705rl7Tf8/edit).

## What is the difference between Open Referral and Open211?

Open Referral is both the name of [this community of practice](http://groups.google.com/forum/#!forum/openreferral), and also the shorthand name of [our format for community resource data](https://github.com/openreferral/specification)(which is technically known as the Human Services Data Specification). 

Open211 is a name that has been used by various groups and organizations in various contexts over the years. Some 2-1-1 providers have ‘Open211’ APIs, some groups have built themselves [Open211 apps](http://maxogden.com/open211.html‎), but we are not necessarily affiliated with them. Sometimes, Open Referral supports local 2-1-1s in projects that they’ve described as “Open211,” but Open Referral claims no ownership thereof. 

## Who do I contact if I need help with this project?
You can contact Greg Bloom (@greggish | bloom@openreferral.org), the founder and lead organizer of Open Referral. Alternatively, you can reach out to our network via our [Community Forum](https://forum.openreferral.org/) or [Slack channel](https://openreferral.org/get-involved/join-our-slack-team/).

## What if I need help collecting this data in the first place?

Open Referral is working to build tools that can help people produce and verify accurate resource directory data. For the most part, we don’t host these tools ourselves – but we can help you deploy, customize, and leverage them to achieve your goals.

For instance, you might be able to quickly get set up with a free resource database by [deploying the Open Referral Airtable template](https://openreferral.org/delivering-open-referral-solutions-with-airtable/). You might also deploy one of the open source content management systems in our ecosystem (like [ORServices](https://sarapis.org/human-services/orservices/)). We also have helped communities develop open source policies and procedures (like the DC Community Resource Information Exchange’s [style guide](https://docs.google.com/document/d/1fGz4etL3mN7lEqqgE57XBWM1C6JRoywR/edit?usp=share_link&ouid=104531125124834239733&rtpof=true&sd=true) and [verification process](https://docs.google.com/document/d/1xMWIPtcfmNDkuYLztT5xdSKzZteZW8CV5M7qiYcyeYI/edit#heading=h.pfttcs9har0v) documents) which you are free to copy and adapt. 

If you’re interested in deploying or helping to develop such tools, we want to hear from you! Please reach out to our network via our [Community Forum](https://forum.openreferral.org/) or [Slack channel](https://openreferral.org/get-involved/join-our-slack-team/)to discuss.

## If I maintain a community resource directory — or if I partner with an organization that does — how would I get started?

You can start by testing the viability of our format for your context. That may entail mapping your database's schema to [the Human Services Data Specification’s schema](../hsds/schema_reference)
Once you've mapped your schema to ours, analyze the gaps. (You can ask questions or submit suggestions for improvements to our schema in our [Issues Queue](https://github.com/openreferral/specification/issues). (Read more in [our Contributors Guide](https://github.com/openreferral/specification/blob/master/CONTRIBUTING.md)).

Then you can write a script to transform your data into this open format. We can likely help you with this process.

Finally, you can publish your now-standardized resource data and work with others in your community to help them use it in new, beneficial ways. If helpful for this purpose, you can deploy an open source resource database (like [ORServices](https://sarapis.org/human-services/orservices/)), load your transformed data in, and start building new tools that can help people in your community use this data in new ways.

If you have questions about how this work in your community, please reach out to info@openreferral.org

## What is a pilot project?

Open Referral is led by local pilot projects in which stakeholders take action towards establishing accessible, interoperable and reliable community resource directory data.  Pilots commit to using Open Referral’s specifications and tools to exchange resource directory data among institutions — and in return, their feedback is prioritized in shaping the iteration of our data model, tools, and processes. One way or another, the goals of pilot projects typically involve short-term demonstration of the feasibility and value of  standardized, open resource  data exchange, and also development of strategies for long-term sustainability thereof.

## How can my community become a pilot project? 

Pilot projects usually start with a champion. This is likely someone who is motivated to rally other stakeholders in a community around an effort to solve this problem. We expect such a champion might emerge from a local government, a community anchor institution, a local referral provider, etc. 

A fully-formed pilot project should include some combination of government, community anchor, and referral provider. It should have investment, and ideally active engagement, from local funding institutions that invest in safety net services. And a pilot should establish capacity for coordination that stands among these different institutional stakeholders — enabling each organization to identify and address its own needs, while facilitating a conversation about the collective interests in the community.

Are you interested in getting started in your community? Reach out to info@openreferral.org

## How can I help? 
This is an open source initiative, by which we mean that anyone can freely participate in it and even adapt any of our content for their own purposes. There are lots of ways that you might be able to get involved. For example...

**Programmers, data scientists, and other technical people...**
Check out [our Github repo](http://github.com/openreferral), join our [Slack](https://openreferral.org/get-involved/join-our-slack-team/) or [technical section of our forum](https://forum.openreferral.org/c/technical/7). Ask questions — if we don’t know the answers, help us figure them out!

If you live in the area of one of our pilot projects, you can be very helpful indeed. If you don’t live nearby a pilot project that’s already underway, you might be able to help start one yourself. Start by asking people who work in human services in your area about how directory information is currently managed in your community, and how you might help… 

**Information-and-referral providers...**
Read through our data specification, ask any questions that come to mind — and if we don’t know the answers, help us figure them out. Make suggestions for ways to improve the spec.

Even more importantly, identify your own needs: what do you want to see happen? In a world where community resource directory data could flow among systems, where would you want to see if flow? It can be quite valuable to simply scope out an actionable ‘use case’ (some specific action that would benefit some specific set of users). 

**“I work in health, human, and/or social services.”**
You may be one of our most important kinds of participants. Our work only succeeds if it can help you better serve your clients. You can help us identify, scope, and implement a ‘use case,’ in which we facilitate an open data exchange that can improve the deliverability of your services and/or services in your community. Help us get there.

**“I don’t code, I’m just a citizen and I want to help!”**

There is LOTS of work to be done by people who don’t code! First, read through our [documentation](index.md), and ask us questions about anything that’s unclear. Then, for example, you might start learning about how information about services gets collected in your community. Talk to the people who are already producing resource directories; see if they’re interested in finding new ways to produce and/or use this information. If so, write a summary of how they do their work and what they say that they need. 

**NOTE:** The most powerful way to help may be to find and build relationships with a group of people who have all of the above experiences. If you can **form a team in your community** consisting of some combination of civic technologists, service providers, with support from local government and/or funders, we will help you launch a pilot Open Referral project!

## My question isn’t here. How can I ask it?

We’d love to hear from you!  you can reach out to us via our [Community Forum](https://forum.openreferral.org/), [Slack](https://openreferral.org/get-involved/join-our-slack-team/) or email info@openreferral.org 
