--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: address_address_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.address_address_type_enum AS ENUM (
    'physical',
    'postal',
    'virtual'
);


ALTER TYPE public.address_address_type_enum OWNER TO postgres;

--
-- Name: location_location_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.location_location_type_enum AS ENUM (
    'physical',
    'postal',
    'virtual'
);


ALTER TYPE public.location_location_type_enum OWNER TO postgres;

--
-- Name: schedule_freq_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.schedule_freq_enum AS ENUM (
    'WEEKLY',
    'MONTHLY'
);


ALTER TYPE public.schedule_freq_enum OWNER TO postgres;

--
-- Name: schedule_wkst_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.schedule_wkst_enum AS ENUM (
    'MO',
    'TU',
    'WE',
    'TH',
    'FR',
    'SA',
    'SU'
);


ALTER TYPE public.schedule_wkst_enum OWNER TO postgres;

--
-- Name: service_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.service_status_enum AS ENUM (
    'active',
    'inactive',
    'defunct',
    'temporarily closed'
);


ALTER TYPE public.service_status_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accessibility; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accessibility (
    id character varying(250) NOT NULL,
    location_id character varying(250),
    description text,
    details text,
    url text
);


ALTER TABLE public.accessibility OWNER TO postgres;

--
-- Name: COLUMN accessibility.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.accessibility.id IS 'The identifier for this accessibility information. Each entry must have a unique identifier.';


--
-- Name: COLUMN accessibility.location_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.accessibility.location_id IS 'The identifier for the location of the accessibility provision.';


--
-- Name: COLUMN accessibility.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.accessibility.description IS 'A free text description of the assistance or infrastructure that facilitates access to clients with disabilities.';


--
-- Name: COLUMN accessibility.details; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.accessibility.details IS 'Any further details relating to the relevant accessibility arrangements at this location.';


--
-- Name: COLUMN accessibility.url; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.accessibility.url IS 'The URL of a page giving more information about the accessibility of the location.';


--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id character varying(250) NOT NULL,
    location_id character varying(250),
    attention text,
    address_1 text NOT NULL,
    address_2 text,
    city text NOT NULL,
    region text,
    state_province text NOT NULL,
    postal_code text NOT NULL,
    country text NOT NULL,
    address_type public.address_address_type_enum NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: COLUMN address.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.address.id IS 'The identifier of the postal address. Each postal address must have a unique identifier.';


--
-- Name: COLUMN address.location_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.address.location_id IS 'The identifier of the location for this postal address.';


--
-- Name: COLUMN address.attention; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.address.attention IS 'The name of the person or entity whose attention should be sought at the location. These are often included as a "care of" component of an address.';


--
-- Name: COLUMN address.address_1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.address.address_1 IS 'The first line(s) of the address, including office, building number and street.';


--
-- Name: COLUMN address.address_2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.address.address_2 IS 'A second (additional) line of address information.';


--
-- Name: COLUMN address.city; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.address.city IS 'The city in which the address is located.';


--
-- Name: COLUMN address.region; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.address.region IS 'The region in which the address is located (optional).';


--
-- Name: COLUMN address.state_province; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.address.state_province IS 'The state or province in which the address is located.';


--
-- Name: COLUMN address.postal_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.address.postal_code IS 'The postal code for the address.';


--
-- Name: COLUMN address.country; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.address.country IS 'The country in which the address is located. This should be given as an ISO 3361-1 country code (two letter abbreviation).';


--
-- Name: COLUMN address.address_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.address.address_type IS 'The type of address which may be `physical`, `postal`, or `virtual`.';


--
-- Name: attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attribute (
    id character varying(250) NOT NULL,
    link_id text NOT NULL,
    taxonomy_term_id character varying(250) NOT NULL,
    link_type text,
    link_entity text NOT NULL,
    value text
);


ALTER TABLE public.attribute OWNER TO postgres;

--
-- Name: COLUMN attribute.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.attribute.id IS 'The identifier of the attribute entry. Each attribute entry should have a unique identifier.';


--
-- Name: COLUMN attribute.link_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.attribute.link_id IS 'The identifier of the entity to which this taxonomy term applies.';


--
-- Name: COLUMN attribute.taxonomy_term_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.attribute.taxonomy_term_id IS 'The identifier of this taxonomy term from the taxonomy table.';


--
-- Name: COLUMN attribute.link_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.attribute.link_type IS 'A code taken from an enumerated open codelist to indicate what the taxonomy term describes, e.g. the service eligibility or intended audience.';


--
-- Name: COLUMN attribute.link_entity; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.attribute.link_entity IS 'The table of the Link Identifier.';


--
-- Name: COLUMN attribute.value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.attribute.value IS 'The value (if any) of an attribute.';


--
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact (
    id character varying(250) NOT NULL,
    organization_id character varying(250),
    service_id character varying(250),
    service_at_location_id character varying(250),
    location_id character varying(250),
    name text,
    title text,
    department text,
    email text
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- Name: COLUMN contact.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.contact.id IS 'The identifier for the contact. Each contact must have a unique identifier.';


--
-- Name: COLUMN contact.organization_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.contact.organization_id IS 'The identifier of the organization for which this is a contact.';


--
-- Name: COLUMN contact.service_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.contact.service_id IS 'The identifier of the service for which this is a contact.';


--
-- Name: COLUMN contact.service_at_location_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.contact.service_at_location_id IS 'The identifier of the ‘service at location’ entry, when this contact is specific to a service in a particular location.';


--
-- Name: COLUMN contact.location_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.contact.location_id IS 'The identifier for the location of the contact.';


--
-- Name: COLUMN contact.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.contact.name IS 'The name of the contact.';


--
-- Name: COLUMN contact.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.contact.title IS 'The job title of the contact.';


--
-- Name: COLUMN contact.department; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.contact.department IS 'The department that the contact is a part of.';


--
-- Name: COLUMN contact.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.contact.email IS 'The email address of the contact.';


--
-- Name: cost_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cost_option (
    id character varying(250) NOT NULL,
    service_id character varying(250) NOT NULL,
    valid_from date,
    valid_to date,
    option text,
    currency text,
    amount numeric,
    amount_description text
);


ALTER TABLE public.cost_option OWNER TO postgres;

--
-- Name: COLUMN cost_option.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cost_option.id IS 'The identifier for the cost option. Each entry must have a unique identifier';


--
-- Name: COLUMN cost_option.service_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cost_option.service_id IS 'The identifier of the services for which the entry describes the cost.';


--
-- Name: COLUMN cost_option.valid_from; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cost_option.valid_from IS 'The date when this price is valid from.';


--
-- Name: COLUMN cost_option.valid_to; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cost_option.valid_to IS 'The date when this price is valid to.';


--
-- Name: COLUMN cost_option.option; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cost_option.option IS 'Conditions associated with the cost option.';


--
-- Name: COLUMN cost_option.currency; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cost_option.currency IS 'The 3 letter currency code of this cost option (expected to be gbp by Open Referral UK).';


--
-- Name: COLUMN cost_option.amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cost_option.amount IS 'The cost of the option, expressed as an amount.';


--
-- Name: COLUMN cost_option.amount_description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cost_option.amount_description IS 'Specific details qualifying the cost amount.';


--
-- Name: funding; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funding (
    id character varying(250) NOT NULL,
    organization_id character varying(250),
    service_id character varying(250),
    source text
);


ALTER TABLE public.funding OWNER TO postgres;

--
-- Name: COLUMN funding.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funding.id IS 'The identifier for the funding. Each entry must have a unique identifier.';


--
-- Name: COLUMN funding.organization_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funding.organization_id IS 'The identifier of the organization in receipt of this funding.';


--
-- Name: COLUMN funding.service_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funding.service_id IS 'The identifier of the service in receipt of this funding.';


--
-- Name: COLUMN funding.source; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funding.source IS 'A free text description of the source of funds for this organization or service.';


--
-- Name: language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.language (
    id character varying(250) NOT NULL,
    service_id character varying(250),
    location_id character varying(250),
    phone_id character varying(250),
    name text,
    code text,
    note text
);


ALTER TABLE public.language OWNER TO postgres;

--
-- Name: COLUMN language.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.language.id IS 'The identifier for the language. Each entry must have a unique identifier.';


--
-- Name: COLUMN language.service_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.language.service_id IS 'The identifier of the service for which the entry describes the languages in which services are delivered.';


--
-- Name: COLUMN language.location_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.language.location_id IS 'The identifier of the location for which the entry describes the languages in which services are delivered.';


--
-- Name: COLUMN language.phone_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.language.phone_id IS 'The identifier of the phone for which the entry describes the languages in which services delivered.';


--
-- Name: COLUMN language.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.language.name IS 'The name of the language in which the service is delivered.';


--
-- Name: COLUMN language.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.language.code IS 'The ISO 639-1 or ISO 639-3 code for the language.';


--
-- Name: COLUMN language.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.language.note IS 'A free text description of any additional context or services provided for this language.';


--
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
    id character varying(250) NOT NULL,
    location_type public.location_location_type_enum NOT NULL,
    url text,
    organization_id character varying(250),
    name text,
    alternate_name text,
    description text,
    transportation text,
    latitude numeric,
    longitude numeric,
    external_identifier text,
    external_identifier_type text
);


ALTER TABLE public.location OWNER TO postgres;

--
-- Name: COLUMN location.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.location.id IS 'The identifier of the location. Each location must have a unique identifier.';


--
-- Name: COLUMN location.location_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.location.location_type IS 'The type of location, which may be either `physical`, `postal`, or `virtual`.';


--
-- Name: COLUMN location.url; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.location.url IS 'If location_type is virtual, then this field represents the URL of a virtual location.';


--
-- Name: COLUMN location.organization_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.location.organization_id IS 'The organization identifier for a location. This is the organization that is responsible for maintaining information about this location. The identifier of the organization should be given here. Details of the services the organization delivers at this location should be provided in the services_at_location table.';


--
-- Name: COLUMN location.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.location.name IS 'The name of the location.';


--
-- Name: COLUMN location.alternate_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.location.alternate_name IS 'An (optional) alternative name of the location.';


--
-- Name: COLUMN location.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.location.description IS 'A free text description of the location.';


--
-- Name: COLUMN location.transportation; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.location.transportation IS 'A free text description of the access to public or private transportation to and from the location.';


--
-- Name: COLUMN location.latitude; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.location.latitude IS 'The latitude of the location expressed in decimal degrees in WGS84 datum.';


--
-- Name: COLUMN location.longitude; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.location.longitude IS 'The longitude of the location expressed in decimal degrees in WGS84 datum.';


--
-- Name: COLUMN location.external_identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.location.external_identifier IS 'A third party identifier for the location, which can be drawn from other services e.g. UK UPRN.';


--
-- Name: COLUMN location.external_identifier_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.location.external_identifier_type IS 'The scheme used for the location''s external_identifier e.g. UK UPRN.';


--
-- Name: meta_table_description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.meta_table_description (
    id character varying(250) NOT NULL,
    name text,
    language text,
    character_set text
);


ALTER TABLE public.meta_table_description OWNER TO postgres;

--
-- Name: COLUMN meta_table_description.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.meta_table_description.id IS 'The identifier for the metadata description. Each entry must have a unique identifier.';


--
-- Name: COLUMN meta_table_description.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.meta_table_description.name IS 'The name for the metadata description.';


--
-- Name: COLUMN meta_table_description.language; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.meta_table_description.language IS 'The ISO 639-1 or ISO 639-3 code for the language of the metadata description.';


--
-- Name: COLUMN meta_table_description.character_set; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.meta_table_description.character_set IS 'The character set of the metadata description.';


--
-- Name: metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metadata (
    id character varying(250) NOT NULL,
    resource_id text NOT NULL,
    resource_type text NOT NULL,
    last_action_date date NOT NULL,
    last_action_type text NOT NULL,
    field_name text NOT NULL,
    previous_value text NOT NULL,
    replacement_value text NOT NULL,
    updated_by text NOT NULL
);


ALTER TABLE public.metadata OWNER TO postgres;

--
-- Name: COLUMN metadata.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metadata.id IS 'The identifier for this metadata. Each entry must have a unique identifier.';


--
-- Name: COLUMN metadata.resource_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metadata.resource_id IS 'The identifier of the resource (service, program, location, address, or contact) that this metadata describes.';


--
-- Name: COLUMN metadata.resource_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metadata.resource_type IS 'The type of entity being referenced.';


--
-- Name: COLUMN metadata.last_action_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metadata.last_action_date IS 'The date when data was changed.';


--
-- Name: COLUMN metadata.last_action_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metadata.last_action_type IS 'The kind of change made to the data.';


--
-- Name: COLUMN metadata.field_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metadata.field_name IS 'The name of field that has been modified.';


--
-- Name: COLUMN metadata.previous_value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metadata.previous_value IS 'The previous value of the field that has been modified.';


--
-- Name: COLUMN metadata.replacement_value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metadata.replacement_value IS 'The new value of the field that has been modified.';


--
-- Name: COLUMN metadata.updated_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metadata.updated_by IS 'The name of the person who modified the field.';


--
-- Name: organization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organization (
    id character varying(250) NOT NULL,
    name text NOT NULL,
    alternate_name text,
    description text NOT NULL,
    email text,
    website text,
    tax_status text,
    tax_id text,
    year_incorporated numeric,
    legal_status text,
    logo text,
    uri text,
    parent_organization_id text
);


ALTER TABLE public.organization OWNER TO postgres;

--
-- Name: COLUMN organization.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization.id IS 'The identifier for the organization. Each organization must have a unique identifier.';


--
-- Name: COLUMN organization.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization.name IS 'The official or public name of the organization.';


--
-- Name: COLUMN organization.alternate_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization.alternate_name IS 'An (optional) alternative or commonly used name for the organization.';


--
-- Name: COLUMN organization.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization.description IS 'A free text description containing a brief summary about the organization. It can contain markup such as HTML or Markdown.';


--
-- Name: COLUMN organization.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization.email IS 'The contact e-mail address for the organization.';


--
-- Name: COLUMN organization.website; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization.website IS 'The URL (website address) of the organization.';


--
-- Name: COLUMN organization.tax_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization.tax_status IS 'DEPRECATED: Government assigned tax designation for tax-exempt organizations.';


--
-- Name: COLUMN organization.tax_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization.tax_id IS 'DEPRECATED: A government issued identifier used for the purpose of tax administration.';


--
-- Name: COLUMN organization.year_incorporated; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization.year_incorporated IS 'The year in which the organization was legally formed.';


--
-- Name: COLUMN organization.legal_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization.legal_status IS 'The legal conditions that an organization is operating under.';


--
-- Name: COLUMN organization.logo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization.logo IS 'A URL to an image associated with the organization which can be presented alongside its name.';


--
-- Name: COLUMN organization.uri; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization.uri IS 'A persistent identifier to uniquely identify the organization such as those provided by Open Corporates or some other relevant URI provider. This is not for listing the website of the organization: that can be done through the website field of the Organization.';


--
-- Name: COLUMN organization.parent_organization_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization.parent_organization_id IS 'The identifier of the organization''s parent organization.';


--
-- Name: organization_identifier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organization_identifier (
    id character varying(250) NOT NULL,
    organization_id character varying(250) NOT NULL,
    identifier_scheme text,
    identifier_type text NOT NULL,
    identifier text NOT NULL
);


ALTER TABLE public.organization_identifier OWNER TO postgres;

--
-- Name: COLUMN organization_identifier.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization_identifier.id IS 'The identifier for this organization identifier entry. Each entry must have a unique identifier.';


--
-- Name: COLUMN organization_identifier.organization_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization_identifier.organization_id IS 'The identifier of the organization. This should match the uuid of an organization object.';


--
-- Name: COLUMN organization_identifier.identifier_scheme; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization_identifier.identifier_scheme IS 'The scheme of the third party identifier, according to http://org-id.guide/.';


--
-- Name: COLUMN organization_identifier.identifier_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization_identifier.identifier_type IS 'A human-readable equivalent of the identifier_scheme. This may be used in cases where org-id.guide does not list an appropriate identifier scheme.';


--
-- Name: COLUMN organization_identifier.identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organization_identifier.identifier IS 'The third-party identifier value.';


--
-- Name: phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phone (
    id character varying(250) NOT NULL,
    location_id character varying(250),
    service_id character varying(250),
    organization_id character varying(250),
    contact_id character varying(250),
    service_at_location_id character varying(250),
    number text NOT NULL,
    extension numeric,
    type text,
    description text
);


ALTER TABLE public.phone OWNER TO postgres;

--
-- Name: COLUMN phone.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.phone.id IS 'The identifier for the phone number. Each entry must have a unique identifier.';


--
-- Name: COLUMN phone.location_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.phone.location_id IS 'The identifier of the location where this phone number is located.';


--
-- Name: COLUMN phone.service_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.phone.service_id IS 'The identifier of the service for which this is the phone number.';


--
-- Name: COLUMN phone.organization_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.phone.organization_id IS 'The identifier of the organization for which this is the phone number.';


--
-- Name: COLUMN phone.contact_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.phone.contact_id IS 'The identifier of the contact for which this is the phone number.';


--
-- Name: COLUMN phone.service_at_location_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.phone.service_at_location_id IS 'The identifier of the ‘service at location’ table entry, when this phone number is specific to a service in a particular location.';


--
-- Name: COLUMN phone.number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.phone.number IS 'The phone number.';


--
-- Name: COLUMN phone.extension; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.phone.extension IS 'The extension of the phone number.';


--
-- Name: COLUMN phone.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.phone.type IS 'Indicates the type of phone service, drawing from the RFC6350 list of types (text (for SMS), voice, fax, cell, video, pager, textphone).';


--
-- Name: COLUMN phone.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.phone.description IS 'A free text description providing extra information about the phone service';


--
-- Name: program; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.program (
    id character varying(250) NOT NULL,
    organization_id character varying(250) NOT NULL,
    name text NOT NULL,
    alternate_name text,
    description text NOT NULL
);


ALTER TABLE public.program OWNER TO postgres;

--
-- Name: COLUMN program.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.program.id IS 'The identifier for the program. Each program must have a unique identifier.';


--
-- Name: COLUMN program.organization_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.program.organization_id IS 'The identifier for the organization which the program belongs to. Each program must belong to a single organization, and the identifier for that organization should be given here.';


--
-- Name: COLUMN program.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.program.name IS 'The name of the program.';


--
-- Name: COLUMN program.alternate_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.program.alternate_name IS 'The (optional) alternative name for the program.';


--
-- Name: COLUMN program.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.program.description IS 'A free text description of the program';


--
-- Name: required_document; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.required_document (
    id character varying(250) NOT NULL,
    service_id character varying(250),
    document text,
    uri text
);


ALTER TABLE public.required_document OWNER TO postgres;

--
-- Name: COLUMN required_document.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.required_document.id IS 'The identifier for the document. Each document must have a unique identifier.';


--
-- Name: COLUMN required_document.service_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.required_document.service_id IS 'The identifier of the service for which this entry describes the required document.';


--
-- Name: COLUMN required_document.document; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.required_document.document IS 'A free text description of the document required to apply for or receive the service.';


--
-- Name: COLUMN required_document.uri; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.required_document.uri IS 'A web link to the document.';


--
-- Name: schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedule (
    id character varying(250) NOT NULL,
    service_id character varying(250),
    location_id character varying(250),
    service_at_location_id character varying(250),
    valid_from date,
    valid_to date,
    dtstart date,
    timezone numeric,
    until date,
    count numeric,
    wkst public.schedule_wkst_enum,
    freq public.schedule_freq_enum,
    "interval" numeric,
    byday text,
    byweekno text,
    bymonthday text,
    byyearday text,
    description text,
    opens_at time without time zone,
    closes_at time without time zone,
    schedule_link text,
    attending_type text,
    notes text
);


ALTER TABLE public.schedule OWNER TO postgres;

--
-- Name: COLUMN schedule.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.id IS 'The identifier for the schedule. Each entry must have a unique identifier.';


--
-- Name: COLUMN schedule.service_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.service_id IS 'The identifier of the service for which this is the regular schedule';


--
-- Name: COLUMN schedule.location_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.location_id IS 'The identifier of the location for which this is the regular schedule';


--
-- Name: COLUMN schedule.service_at_location_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.service_at_location_id IS 'The identifier of the ‘service at location’ table entry, when this schedule is specific to a service in a particular location.';


--
-- Name: COLUMN schedule.valid_from; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.valid_from IS 'The date from which the schedule information is valid. It must be in the ISO 8601 format of YYYY-MM-DD,';


--
-- Name: COLUMN schedule.valid_to; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.valid_to IS 'The last date on which the schedule information is valid. It must be in the ISO 8601 format of YYYY-MM-DD.';


--
-- Name: COLUMN schedule.dtstart; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.dtstart IS 'iCal - The date of the first event is the schedule. Necessary when using the ‘interval’ feature, optional otherwise.';


--
-- Name: COLUMN schedule.timezone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.timezone IS 'The timezone that all dates are expressed as, expressed as a UTC offset. Dates are assumed to be UTC otherwise.';


--
-- Name: COLUMN schedule.until; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.until IS 'iCal - The date of the last occurrence of the recurring event.';


--
-- Name: COLUMN schedule.count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.count IS 'iCal - The number of times that the event occurs. Use this instead of ‘until’, if appropriate.';


--
-- Name: COLUMN schedule.wkst; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.wkst IS 'iCal - The two-letter code for the day on which the week starts: `MO`, `TU`, `WE`, `TH`, `FR`, `FR`, `SA`, `SU`';


--
-- Name: COLUMN schedule.freq; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.freq IS 'iCal - How often the frequency repeats. Values can be `WEEKLY` or `MONTHLY`';


--
-- Name: COLUMN schedule."interval"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule."interval" IS 'iCal - How often the frequency repeats. For example, and Interval of 2 for a WEEKLY Frequency would represent fortnightly.';


--
-- Name: COLUMN schedule.byday; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.byday IS 'iCal - Comma separated days of the week. Where freq is MONTHLY each part can be preceded by a positive or negative integer to represent which occurrence in a month; e.g. 2MO is the second Monday in a month. -1FR is the last Friday';


--
-- Name: COLUMN schedule.byweekno; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.byweekno IS 'iCal - Comma separated numeric weeks of the year, where freq is WEEKLY. Can be negative to represent weeks before the end of the year; e.g. -5 is the 5th to last week in a year.';


--
-- Name: COLUMN schedule.bymonthday; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.bymonthday IS 'iCal - Comma separated numeric days of the month, where frequency is MONTHLY. Can be negative to represent days before the end of the month; e.g. -5 is the 5th to last day in a month.';


--
-- Name: COLUMN schedule.byyearday; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.byyearday IS 'iCal - Comma separated numeric days of the month, where frequency is YEARLY. Can be negative to represent days before the end of the year; e.g. -1 is the last day in a year.';


--
-- Name: COLUMN schedule.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.description IS 'A free text description of the availability of the service.';


--
-- Name: COLUMN schedule.opens_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.opens_at IS 'The time when a service or location opens. This should use HH:MM format and should include timezone information, either adding the suffix ‘Z’ when the date is in UTC, or including an offset from UTC (e.g. 09:00-05:00 for 9am EST.)';


--
-- Name: COLUMN schedule.closes_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.closes_at IS 'The time when a service or location closes. This should use HH:MM format and should include timezone information, either adding the suffix ‘Z’ when the date is in UTC, or including an offset from UTC (e.g. 09:00-05:00 for 9am EST.).';


--
-- Name: COLUMN schedule.schedule_link; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.schedule_link IS 'URL of a link for the schedule which may show each individual session and may provide a booking facility.';


--
-- Name: COLUMN schedule.attending_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.attending_type IS 'A free text description of how to attend this service.';


--
-- Name: COLUMN schedule.notes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.schedule.notes IS 'Free text notes on the schedule.';


--
-- Name: service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service (
    id character varying(250) NOT NULL,
    organization_id character varying(250) NOT NULL,
    program_id character varying(250),
    name text NOT NULL,
    alternate_name text,
    description text,
    url text,
    email text,
    status public.service_status_enum NOT NULL,
    interpretation_services text,
    application_process text,
    fees_description text,
    wait_time text,
    fees text,
    accreditations text,
    eligibility_description text,
    minimum_age numeric,
    maximum_age numeric,
    assured_date date,
    assurer_email text,
    licenses text,
    alert text,
    last_modified timestamp without time zone
);


ALTER TABLE public.service OWNER TO postgres;

--
-- Name: COLUMN service.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.id IS 'The identifier for the service. Each service must have a unique identifier.';


--
-- Name: COLUMN service.organization_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.organization_id IS 'The identifier of the organization that provides this service.';


--
-- Name: COLUMN service.program_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.program_id IS 'The identifier of the program this service is delivered under.';


--
-- Name: COLUMN service.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.name IS 'The official or public name of the service.';


--
-- Name: COLUMN service.alternate_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.alternate_name IS 'An (optional) alternative name for this service.';


--
-- Name: COLUMN service.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.description IS 'A free text description of the service.';


--
-- Name: COLUMN service.url; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.url IS 'URL of the service';


--
-- Name: COLUMN service.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.email IS 'An email address which can be used to contact the service provider.';


--
-- Name: COLUMN service.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.status IS 'The current status of the service which can be active, inactive, defunct, or temporarily closed.';


--
-- Name: COLUMN service.interpretation_services; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.interpretation_services IS 'A free text description of any interpretation services available for accessing this service.';


--
-- Name: COLUMN service.application_process; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.application_process IS 'A free text description of the steps needed to access this service.';


--
-- Name: COLUMN service.fees_description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.fees_description IS 'A free text description of any charges for service users to access this service.';


--
-- Name: COLUMN service.wait_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.wait_time IS 'DEPRECATED: The time a client may expect to wait before receiving a service.';


--
-- Name: COLUMN service.fees; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.fees IS 'DEPRECATED: Details of any charges for service users to access this service.';


--
-- Name: COLUMN service.accreditations; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.accreditations IS 'A free text description of any accreditations. Accreditation is the formal evaluation of an organization or program against best practice standards set by an accrediting organization.';


--
-- Name: COLUMN service.eligibility_description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.eligibility_description IS 'A free text description of the type of person for whom this service is intended.';


--
-- Name: COLUMN service.minimum_age; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.minimum_age IS 'The minimum age of a person required to meet this eligibility requirement.';


--
-- Name: COLUMN service.maximum_age; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.maximum_age IS 'The maximum age of a person required to meet this eligibility requirement.';


--
-- Name: COLUMN service.assured_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.assured_date IS 'The date that the information about the service was last checked.';


--
-- Name: COLUMN service.assurer_email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.assurer_email IS 'The contact e-mail address for the person or organization which last assured the service.';


--
-- Name: COLUMN service.licenses; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.licenses IS 'DEPRECATED: An organization may have a license issued by a government entity to operate legally. A list of any such licenses can be provided here.';


--
-- Name: COLUMN service.alert; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.alert IS 'A description of any short term alerts concerning the service.';


--
-- Name: COLUMN service.last_modified; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.last_modified IS 'The datetime when the service, or any related information about the service, has changed. Should have millisecond accuracy.';


--
-- Name: service_area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_area (
    id character varying(250) NOT NULL,
    service_id character varying(250),
    name text,
    description text,
    extent text,
    extent_type text,
    uri text
);


ALTER TABLE public.service_area OWNER TO postgres;

--
-- Name: COLUMN service_area.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_area.id IS 'The identifier for the service area. Each service area must have a unique identifier.';


--
-- Name: COLUMN service_area.service_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_area.service_id IS 'The identifier of the service for which this entry describes the service area';


--
-- Name: COLUMN service_area.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_area.name IS 'A free text geographic area where a service is available.';


--
-- Name: COLUMN service_area.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_area.description IS 'A more detailed free text description of this service area. Used to provide any additional information that cannot be communicated using the structured area and geometry fields.';


--
-- Name: COLUMN service_area.extent; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_area.extent IS 'A definition of the polygon defining the area.';


--
-- Name: COLUMN service_area.extent_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_area.extent_type IS 'The format of the extent field  populated from an enum of  "geojson", "topojson",  "kml",and (for legacy systems or early state during transformation) "text".';


--
-- Name: COLUMN service_area.uri; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_area.uri IS 'A URI which acts as a persistent identifier to identify an area.';


--
-- Name: service_at_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_at_location (
    id character varying(250) NOT NULL,
    service_id character varying(250) NOT NULL,
    location_id character varying(250) NOT NULL,
    description text
);


ALTER TABLE public.service_at_location OWNER TO postgres;

--
-- Name: COLUMN service_at_location.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_at_location.id IS 'The identifier of the service at location entry. Each entry must have a unique identifier.';


--
-- Name: COLUMN service_at_location.service_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_at_location.service_id IS 'The identifier of the service at a given location.';


--
-- Name: COLUMN service_at_location.location_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_at_location.location_id IS 'The identifier of the location where this service operates.';


--
-- Name: COLUMN service_at_location.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_at_location.description IS 'A free text description of the service at this specific location.';


--
-- Name: taxonomy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taxonomy (
    id character varying(250) NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    uri text,
    version text
);


ALTER TABLE public.taxonomy OWNER TO postgres;

--
-- Name: COLUMN taxonomy.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.taxonomy.id IS 'The identifier of the taxonomy. Each entry must have a unique identifier';


--
-- Name: COLUMN taxonomy.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.taxonomy.name IS 'The name of the taxonomy from which terms are sourced.';


--
-- Name: COLUMN taxonomy.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.taxonomy.description IS 'A free text description of the taxonomy.';


--
-- Name: COLUMN taxonomy.uri; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.taxonomy.uri IS 'The URI of the taxonomy.';


--
-- Name: COLUMN taxonomy.version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.taxonomy.version IS 'The version of the taxonomy.';


--
-- Name: taxonomy_term; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taxonomy_term (
    id character varying(250) NOT NULL,
    code text,
    name text NOT NULL,
    description text NOT NULL,
    parent_id text,
    taxonomy text,
    language text,
    taxonomy_id character varying(250),
    term_uri text
);


ALTER TABLE public.taxonomy_term OWNER TO postgres;

--
-- Name: COLUMN taxonomy_term.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.taxonomy_term.id IS 'The identifier for this taxonomy term. Each taxonomy term must have a unique identifier, within the scope of the dataset.';


--
-- Name: COLUMN taxonomy_term.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.taxonomy_term.code IS 'The term identfier as used in the taxonomy. This and the taxonomy_id combined define the term.';


--
-- Name: COLUMN taxonomy_term.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.taxonomy_term.name IS 'The taxonomy term itself.';


--
-- Name: COLUMN taxonomy_term.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.taxonomy_term.description IS 'A free text description of the term.';


--
-- Name: COLUMN taxonomy_term.parent_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.taxonomy_term.parent_id IS 'If this is a child term in a hierarchical taxonomy, give the identifier of the parent category. For top-level categories, this is not required.';


--
-- Name: COLUMN taxonomy_term.taxonomy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.taxonomy_term.taxonomy IS 'If this is an established taxonomy, a free text description of which taxonomy is in use. If possible, provide a URI.';


--
-- Name: COLUMN taxonomy_term.language; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.taxonomy_term.language IS 'An ISO 639-1, or ISO 639-2 [language code](available at http://www.loc.gov/standards/iso639-2/php/code_list.php) to represent the language of the term. The three-letter codes from ISO 639-2 provide greater accuracy when describing variants of languages, which may be relevant to particular communities.';


--
-- Name: COLUMN taxonomy_term.taxonomy_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.taxonomy_term.taxonomy_id IS 'The identifier of the taxonomy containing the term.';


--
-- Name: COLUMN taxonomy_term.term_uri; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.taxonomy_term.term_uri IS 'URI of the term.';


--
-- Name: url; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.url (
    id character varying(250) NOT NULL,
    label text,
    url text NOT NULL,
    organization_id character varying(250),
    service_id character varying(250)
);


ALTER TABLE public.url OWNER TO postgres;

--
-- Name: COLUMN url.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.url.id IS 'The identifier for the URL object. Each URL must have a unique identifier.';


--
-- Name: COLUMN url.label; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.url.label IS 'The human-readable label for this url e.g. “Twitter” or “Website”.';


--
-- Name: COLUMN url.url; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.url.url IS 'The URL for this URL object. This must be formatted as a valid URI.';


--
-- Name: COLUMN url.organization_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.url.organization_id IS 'The identifier for the organization associated with this URL object';


--
-- Name: COLUMN url.service_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.url.service_id IS 'The identifier for the service associated with this URL object';


--
-- Name: accessibility accessibility_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accessibility
    ADD CONSTRAINT accessibility_pkey PRIMARY KEY (id);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: attribute attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT attribute_pkey PRIMARY KEY (id);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: cost_option cost_option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_option
    ADD CONSTRAINT cost_option_pkey PRIMARY KEY (id);


--
-- Name: funding funding_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funding
    ADD CONSTRAINT funding_pkey PRIMARY KEY (id);


--
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: meta_table_description meta_table_description_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meta_table_description
    ADD CONSTRAINT meta_table_description_pkey PRIMARY KEY (id);


--
-- Name: metadata metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (id);


--
-- Name: organization_identifier organization_identifier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization_identifier
    ADD CONSTRAINT organization_identifier_pkey PRIMARY KEY (id);


--
-- Name: organization organization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (id);


--
-- Name: phone phone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_pkey PRIMARY KEY (id);


--
-- Name: program program_organization_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_organization_id_key UNIQUE (organization_id);


--
-- Name: program program_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_pkey PRIMARY KEY (id);


--
-- Name: required_document required_document_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_document
    ADD CONSTRAINT required_document_pkey PRIMARY KEY (id);


--
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- Name: service_area service_area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_area
    ADD CONSTRAINT service_area_pkey PRIMARY KEY (id);


--
-- Name: service_at_location service_at_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_at_location
    ADD CONSTRAINT service_at_location_pkey PRIMARY KEY (id);


--
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- Name: taxonomy taxonomy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxonomy
    ADD CONSTRAINT taxonomy_pkey PRIMARY KEY (id);


--
-- Name: taxonomy_term taxonomy_term_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxonomy_term
    ADD CONSTRAINT taxonomy_term_code_key UNIQUE (code);


--
-- Name: taxonomy_term taxonomy_term_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxonomy_term
    ADD CONSTRAINT taxonomy_term_pkey PRIMARY KEY (id);


--
-- Name: url url_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_pkey PRIMARY KEY (id);


--
-- Name: accessibility accessibility_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accessibility
    ADD CONSTRAINT accessibility_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: address address_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: attribute attribute_taxonomy_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT attribute_taxonomy_term_id_fkey FOREIGN KEY (taxonomy_term_id) REFERENCES public.taxonomy_term(id);


--
-- Name: contact contact_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: contact contact_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: contact contact_service_at_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_service_at_location_id_fkey FOREIGN KEY (service_at_location_id) REFERENCES public.service_at_location(id);


--
-- Name: contact contact_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: cost_option cost_option_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_option
    ADD CONSTRAINT cost_option_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: funding funding_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funding
    ADD CONSTRAINT funding_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: funding funding_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funding
    ADD CONSTRAINT funding_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: language language_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: language language_phone_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_phone_id_fkey FOREIGN KEY (phone_id) REFERENCES public.phone(id);


--
-- Name: language language_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: location location_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: organization_identifier organization_identifier_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization_identifier
    ADD CONSTRAINT organization_identifier_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: phone phone_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contact(id);


--
-- Name: phone phone_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: phone phone_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: phone phone_service_at_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_service_at_location_id_fkey FOREIGN KEY (service_at_location_id) REFERENCES public.service_at_location(id);


--
-- Name: phone phone_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: program program_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: required_document required_document_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_document
    ADD CONSTRAINT required_document_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: schedule schedule_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: schedule schedule_service_at_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_service_at_location_id_fkey FOREIGN KEY (service_at_location_id) REFERENCES public.service_at_location(id);


--
-- Name: schedule schedule_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: service_area service_area_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_area
    ADD CONSTRAINT service_area_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: service_at_location service_at_location_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_at_location
    ADD CONSTRAINT service_at_location_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: service_at_location service_at_location_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_at_location
    ADD CONSTRAINT service_at_location_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: service service_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: service service_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.program(id);


--
-- Name: taxonomy_term taxonomy_term_taxonomy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxonomy_term
    ADD CONSTRAINT taxonomy_term_taxonomy_id_fkey FOREIGN KEY (taxonomy_id) REFERENCES public.taxonomy(id);


--
-- Name: url url_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: url url_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- PostgreSQL database dump complete
--

