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
-- Name: metadata_resource_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.metadata_resource_type_enum AS ENUM (
    'organization',
    'program',
    'service',
    'service_attribute',
    'other_attribute',
    'service_at_location',
    'location',
    'phone',
    'contact',
    'schedule',
    'funding',
    'eligibility',
    'service_area',
    'accessibility_for_disabilities',
    'taxonomy_term'
);


--
-- Name: other_attribute_link_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.other_attribute_link_type_enum AS ENUM (
    'organization',
    'program',
    'service',
    'service_at_location',
    'location',
    'phone',
    'contact',
    'physical_address',
    'postal_address',
    'schedule',
    'funding',
    'eligibility',
    'service_area',
    'required_document',
    'payment_accepted',
    'language',
    'accessibility_for_disabilities'
);


--
-- Name: phone_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.phone_type_enum AS ENUM (
    'text',
    'voice',
    'fax',
    'cell',
    'video',
    'pager',
    'textphone'
);


--
-- Name: schedule_freq_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.schedule_freq_enum AS ENUM (
    'DAILY',
    'WEEKLY',
    'MONTHLY',
    'YEARLY'
);


--
-- Name: service_status_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.service_status_enum AS ENUM (
    'active',
    'inactive',
    'defunct',
    'temporarily closed'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accessibility_for_disabilities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accessibility_for_disabilities (
    id text NOT NULL,
    location_id text,
    accessibility text,
    details text,
    CONSTRAINT accessibility_for_disabilities_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT accessibility_for_disabilities_location_id_check CHECK ((length(location_id) <= 250))
);


--
-- Name: COLUMN accessibility_for_disabilities.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.accessibility_for_disabilities.id IS 'Each entry must have a unique identifier';


--
-- Name: COLUMN accessibility_for_disabilities.location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.accessibility_for_disabilities.location_id IS 'The identifier of the location for which the entry describes the accessibility provision';


--
-- Name: COLUMN accessibility_for_disabilities.accessibility; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.accessibility_for_disabilities.accessibility IS 'Description of assistance or infrastructure that facilitate access to clients with disabilities.';


--
-- Name: COLUMN accessibility_for_disabilities.details; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.accessibility_for_disabilities.details IS 'Any further details relating to the relevant accessibility arrangements at this location. E.g. whether advance notice is required to use an accessibility facility.';


--
-- Name: contact; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contact (
    id text NOT NULL,
    organization_id text,
    service_id text,
    service_at_location_id text,
    name text,
    title text,
    department text,
    email text,
    CONSTRAINT contact_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT contact_organization_id_check CHECK ((length(organization_id) <= 250)),
    CONSTRAINT contact_service_at_location_id_check CHECK ((length(service_at_location_id) <= 250)),
    CONSTRAINT contact_service_id_check CHECK ((length(service_id) <= 250))
);


--
-- Name: COLUMN contact.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.id IS 'Each contact must have a unique identifier';


--
-- Name: COLUMN contact.organization_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.organization_id IS 'The identifier of the organization for which this is a contact';


--
-- Name: COLUMN contact.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.service_id IS 'The identifier of the service for which this is a contact';


--
-- Name: COLUMN contact.service_at_location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.service_at_location_id IS 'The identifier of the ''service at location'' table entry, when this contact is specific to a service in a particular location.';


--
-- Name: COLUMN contact.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.name IS 'The name of the person';


--
-- Name: COLUMN contact.title; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.title IS 'The job title of the person';


--
-- Name: COLUMN contact.department; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.department IS 'The department that the person is part of';


--
-- Name: COLUMN contact.email; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.email IS 'The email address of the person';


--
-- Name: eligibility; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eligibility (
    id text NOT NULL,
    service_id text,
    CONSTRAINT eligibility_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT eligibility_service_id_check CHECK ((length(service_id) <= 250))
);


--
-- Name: COLUMN eligibility.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.eligibility.id IS 'Each entry must have a unique identifier';


--
-- Name: COLUMN eligibility.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.eligibility.service_id IS 'The identifier of the service for which this entry describes the eligibility criteria';


--
-- Name: funding; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.funding (
    id text NOT NULL,
    organization_id text,
    service_id text,
    source text,
    CONSTRAINT funding_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT funding_organization_id_check CHECK ((length(organization_id) <= 250)),
    CONSTRAINT funding_service_id_check CHECK ((length(service_id) <= 250))
);


--
-- Name: COLUMN funding.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.funding.id IS 'Each entry must have a unique identifier';


--
-- Name: COLUMN funding.organization_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.funding.organization_id IS 'The identifier of the organization in receipt of this funding.';


--
-- Name: COLUMN funding.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.funding.service_id IS 'The identifier of the service in receipt of this funding';


--
-- Name: COLUMN funding.source; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.funding.source IS 'A free text description of the source of funds for this organization or service.';


--
-- Name: language; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.language (
    id text NOT NULL,
    service_id text,
    location_id text,
    language text,
    CONSTRAINT language_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT language_location_id_check CHECK ((length(location_id) <= 250)),
    CONSTRAINT language_service_id_check CHECK ((length(service_id) <= 250))
);


--
-- Name: COLUMN language.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.language.id IS 'Each language must have a unique identifier';


--
-- Name: COLUMN language.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.language.service_id IS 'The identifier of the service for which the entry describes the languages in which services are delivered';


--
-- Name: COLUMN language.location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.language.location_id IS 'The identifier of the location for which the entry describes the languages in which services are delivered';


--
-- Name: COLUMN language.language; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.language.language IS 'Languages, other than English, in which the service is delivered. Languages are listed as ISO639-1 codes.';


--
-- Name: location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.location (
    id text NOT NULL,
    organization_id text,
    name text,
    alternate_name text,
    description text,
    transportation text,
    latitude numeric,
    longitude numeric,
    CONSTRAINT location_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT location_organization_id_check CHECK ((length(organization_id) <= 250))
);


--
-- Name: COLUMN location.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.id IS 'Each location must have a unique identifier';


--
-- Name: COLUMN location.organization_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.organization_id IS 'Each location entry should be linked to a single organization. This is the organization that is responsible for maintaining information about this location. The identifier of the organization should be given here. Details of the services the organization delivers at this location should be provided in the services_at_location table.';


--
-- Name: COLUMN location.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.name IS 'The name of the location';


--
-- Name: COLUMN location.alternate_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.alternate_name IS 'An alternative name for the location';


--
-- Name: COLUMN location.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.description IS 'A description of this location.';


--
-- Name: COLUMN location.transportation; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.transportation IS 'A description of the access to public or private transportation to and from the location.';


--
-- Name: COLUMN location.latitude; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.latitude IS 'Y coordinate of location expressed in decimal degrees in WGS84 datum.';


--
-- Name: COLUMN location.longitude; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.longitude IS 'X coordinate of location expressed in decimal degrees in WGS84 datum.';


--
-- Name: meta_table_description; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meta_table_description (
    id text NOT NULL,
    name text,
    language text,
    character_set text,
    CONSTRAINT meta_table_description_id_check CHECK ((length(id) <= 250))
);


--
-- Name: COLUMN meta_table_description.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.meta_table_description.id IS 'Each entry must have a unique identifier';


--
-- Name: metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.metadata (
    id text NOT NULL,
    resource_id text NOT NULL,
    resource_type public.metadata_resource_type_enum NOT NULL,
    last_action_date timestamp without time zone NOT NULL,
    last_action_type text NOT NULL,
    field_name text NOT NULL,
    previous_value text NOT NULL,
    replacement_value text NOT NULL,
    updated_by text NOT NULL,
    CONSTRAINT metadata_id_check CHECK ((length(id) <= 250))
);


--
-- Name: COLUMN metadata.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.id IS 'Each entry must have a unique identifier';


--
-- Name: COLUMN metadata.resource_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.resource_id IS 'Each service, program. location, address, or contact will have a unique identifier.';


--
-- Name: COLUMN metadata.resource_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.resource_type IS 'The type of entity being referenced';


--
-- Name: COLUMN metadata.last_action_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.last_action_date IS 'The date when data was changed.';


--
-- Name: COLUMN metadata.last_action_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.last_action_type IS 'The kind of change made to the data; eg create, update, delete';


--
-- Name: COLUMN metadata.field_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.field_name IS 'The name of field that has been modified';


--
-- Name: COLUMN metadata.previous_value; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.previous_value IS 'The previous value of a field that has been updated';


--
-- Name: COLUMN metadata.replacement_value; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.replacement_value IS 'The new value of a field that has been updated';


--
-- Name: COLUMN metadata.updated_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.updated_by IS 'The name of the person who updated a value';


--
-- Name: organization; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization (
    id text NOT NULL,
    name text NOT NULL,
    alternate_name text,
    description text NOT NULL,
    email text,
    url text,
    tax_status text,
    tax_id text,
    year_incorporated date,
    legal_status text,
    CONSTRAINT organization_id_check CHECK ((length(id) <= 250))
);


--
-- Name: COLUMN organization.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.id IS 'Each organization must have a unique identifier.';


--
-- Name: COLUMN organization.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.name IS 'The official or public name of the organization.';


--
-- Name: COLUMN organization.alternate_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.alternate_name IS 'Alternative or commonly used name for the organization.';


--
-- Name: COLUMN organization.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.description IS 'A brief summary about the organization. It can contain markup such as HTML or Markdown.';


--
-- Name: COLUMN organization.email; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.email IS 'The contact e-mail address for the organization.';


--
-- Name: COLUMN organization.url; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.url IS 'The URL (website address) of the organization.';


--
-- Name: COLUMN organization.tax_status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.tax_status IS 'Government assigned tax designation for tax-exempt organizations.';


--
-- Name: COLUMN organization.tax_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.tax_id IS 'A government issued identifier used for the purpose of tax administration.';


--
-- Name: COLUMN organization.year_incorporated; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.year_incorporated IS 'The year in which the organization was legally formed.';


--
-- Name: COLUMN organization.legal_status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.legal_status IS 'The legal status defines the conditions that an organization is operating under; e.g. non-profit, private corporation or a government organization.';


--
-- Name: other_attribute; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.other_attribute (
    id text NOT NULL,
    link_id text NOT NULL,
    link_type public.other_attribute_link_type_enum NOT NULL,
    taxonomy_term_id text,
    CONSTRAINT other_attribute_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT other_attribute_taxonomy_term_id_check CHECK ((length(taxonomy_term_id) <= 250))
);


--
-- Name: COLUMN other_attribute.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.other_attribute.id IS 'Each other_attribute entry should have a unique identifier.';


--
-- Name: COLUMN other_attribute.link_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.other_attribute.link_id IS 'The identifier of the entity to which this taxonomy term applies.';


--
-- Name: COLUMN other_attribute.link_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.other_attribute.link_type IS 'The identifier of the entity to which this taxonomy term applies.';


--
-- Name: COLUMN other_attribute.taxonomy_term_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.other_attribute.taxonomy_term_id IS 'The identifier of this taxonomy term from the taxonomy table.';


--
-- Name: payment_accepted; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment_accepted (
    id text NOT NULL,
    service_id text,
    payment text,
    CONSTRAINT payment_accepted_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT payment_accepted_service_id_check CHECK ((length(service_id) <= 250))
);


--
-- Name: COLUMN payment_accepted.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.payment_accepted.id IS 'Each entry must have a unique identifier';


--
-- Name: COLUMN payment_accepted.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.payment_accepted.service_id IS 'The identifier of the services for which the entry describes the accepted payment methods';


--
-- Name: COLUMN payment_accepted.payment; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.payment_accepted.payment IS 'The methods of payment accepted for the service';


--
-- Name: phone; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.phone (
    id text NOT NULL,
    location_id text,
    service_id text,
    organization_id text,
    contact_id text,
    service_at_location_id text,
    number text NOT NULL,
    extension numeric,
    type public.phone_type_enum,
    language text,
    description text,
    department text,
    CONSTRAINT phone_contact_id_check CHECK ((length(contact_id) <= 250)),
    CONSTRAINT phone_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT phone_location_id_check CHECK ((length(location_id) <= 250)),
    CONSTRAINT phone_organization_id_check CHECK ((length(organization_id) <= 250)),
    CONSTRAINT phone_service_at_location_id_check CHECK ((length(service_at_location_id) <= 250)),
    CONSTRAINT phone_service_id_check CHECK ((length(service_id) <= 250))
);


--
-- Name: COLUMN phone.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.id IS 'Each entry must have a unique identifier';


--
-- Name: COLUMN phone.location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.location_id IS 'The identifier of the location where this phone number is located';


--
-- Name: COLUMN phone.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.service_id IS 'The identifier of the service for which this is the phone number';


--
-- Name: COLUMN phone.organization_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.organization_id IS 'The identifier of the organization for which this is the phone number';


--
-- Name: COLUMN phone.contact_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.contact_id IS 'The identifier of the contact for which this is the phone number';


--
-- Name: COLUMN phone.service_at_location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.service_at_location_id IS 'The identifier of the ''service at location'' table entry, when this phone number is specific to a service in a particular location.';


--
-- Name: COLUMN phone.number; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.number IS 'The phone number';


--
-- Name: COLUMN phone.extension; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.extension IS 'The extension of the phone number';


--
-- Name: COLUMN phone.type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.type IS 'Indicates the type of phone service, drawing from the RFC6350 list of types (text (for SMS), voice, fax, cell, video, pager, textphone).';


--
-- Name: COLUMN phone.language; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.language IS 'A comma separated list of ISO 639-1, or ISO 639-2 [language codes](available at http://www.loc.gov/standards/iso639-2/php/code_list.php) to represent the languages available from this phone service. The three-letter codes from ISO 639-2 provide greater accuracy when describing variants of languages, which may be relevant to particular communities.';


--
-- Name: COLUMN phone.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.description IS 'A description providing extra information about the phone service (e.g. any special arrangements for accessing, or details of availability at particular times.';


--
-- Name: COLUMN phone.department; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.department IS '(Deprecated) The department for which this is the phone number. This field is deprecated and will be removed in a future version of HSDS.';


--
-- Name: physical_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.physical_address (
    id text NOT NULL,
    location_id text,
    attention text,
    address_1 text NOT NULL,
    address_2 text,
    address_3 text,
    address_4 text,
    city text NOT NULL,
    region text,
    state_province text NOT NULL,
    postal_code text NOT NULL,
    country text NOT NULL,
    CONSTRAINT physical_address_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT physical_address_location_id_check CHECK ((length(location_id) <= 250))
);


--
-- Name: COLUMN physical_address.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.physical_address.id IS 'Each physical address must have a unique identifier.';


--
-- Name: COLUMN physical_address.location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.physical_address.location_id IS 'The identifier of the location for which this is the address.';


--
-- Name: COLUMN physical_address.attention; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.physical_address.attention IS 'The person or entity whose attention should be sought at the location (Often included as ''care of'' component of an address.)';


--
-- Name: COLUMN physical_address.address_1; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.physical_address.address_1 IS 'The first line(s) of the address, including office, building number and street.';


--
-- Name: COLUMN physical_address.address_2; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.physical_address.address_2 IS '(Deprecated) A second (additional) line of address information. (This field is deprecated: we recommend including all address information before ''city'' as a comma or newline separated list in address_1. There is no guarantee that systems will read this line of address information.)';


--
-- Name: COLUMN physical_address.address_3; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.physical_address.address_3 IS '(Deprecated) A third (additional) line of address information. (This field is deprecated: we recommend including all address information before ''city'' as a comma or newline separated list in address_1. There is no guarantee that systems will read this line of address information.)';


--
-- Name: COLUMN physical_address.address_4; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.physical_address.address_4 IS '(Deprecated) The fourth (additional) line of address information. (This field is deprecated: we recommend including all address information before ''city'' as a comma or newline separated list in address_1. There is no guarantee that systems will read this line of address information.)';


--
-- Name: COLUMN physical_address.city; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.physical_address.city IS 'The city in which the address is located.';


--
-- Name: COLUMN physical_address.region; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.physical_address.region IS 'The region in which the address is located (optional).';


--
-- Name: COLUMN physical_address.state_province; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.physical_address.state_province IS 'The state or province in which the address is located.';


--
-- Name: COLUMN physical_address.postal_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.physical_address.postal_code IS 'The postal code for the address.';


--
-- Name: COLUMN physical_address.country; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.physical_address.country IS 'The country in which the address is located. This should be given as an ISO 3361-1 country code (two letter abbreviation).';


--
-- Name: postal_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.postal_address (
    id text NOT NULL,
    location_id text,
    attention text,
    address_1 text NOT NULL,
    address_2 text,
    address_3 text,
    address_4 text,
    city text NOT NULL,
    region text,
    state_province text NOT NULL,
    postal_code text NOT NULL,
    country text NOT NULL,
    CONSTRAINT postal_address_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT postal_address_location_id_check CHECK ((length(location_id) <= 250))
);


--
-- Name: COLUMN postal_address.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.postal_address.id IS 'Each postal address must have a unique identifier';


--
-- Name: COLUMN postal_address.location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.postal_address.location_id IS 'The identifier of the location for which this is the postal address.';


--
-- Name: COLUMN postal_address.attention; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.postal_address.attention IS 'The person or entity whose attention should be sought at the location (Often included as ''care of'' component of an address.)';


--
-- Name: COLUMN postal_address.address_1; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.postal_address.address_1 IS 'The first line(s) of the address, including office, building number and street.';


--
-- Name: COLUMN postal_address.address_2; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.postal_address.address_2 IS '(Deprecated) A second (additional) line of address information. (This field is deprecated: we recommend including all address information before ''city'' as a comma or newline separated list in address_1. There is no guarantee that systems will read this line of address information.)';


--
-- Name: COLUMN postal_address.address_3; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.postal_address.address_3 IS '(Deprecated) A third (additional) line of address information. (This field is deprecated: we recommend including all address information before ''city'' as a comma or newline separated list in address_1. There is no guarantee that systems will read this line of address information.)';


--
-- Name: COLUMN postal_address.address_4; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.postal_address.address_4 IS '(Deprecated) The fourth (additional) line of address information. (This field is deprecated: we recommend including all address information before ''city'' as a comma or newline separated list in address_1. There is no guarantee that systems will read this line of address information.)';


--
-- Name: COLUMN postal_address.city; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.postal_address.city IS 'The city in which the address is located.';


--
-- Name: COLUMN postal_address.region; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.postal_address.region IS 'The region in which the address is located (optional).';


--
-- Name: COLUMN postal_address.state_province; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.postal_address.state_province IS 'The state or province in which the address is located.';


--
-- Name: COLUMN postal_address.postal_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.postal_address.postal_code IS 'The postal code for the address.';


--
-- Name: COLUMN postal_address.country; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.postal_address.country IS 'The country in which the address is located. This should be given as an ISO 3361-1 country code (two letter abbreviation)';


--
-- Name: program; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.program (
    id text NOT NULL,
    organization_id text NOT NULL,
    name text NOT NULL,
    alternate_name text,
    CONSTRAINT program_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT program_organization_id_check CHECK ((length(organization_id) <= 250))
);


--
-- Name: COLUMN program.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.program.id IS 'Each program must have a unique identifier.';


--
-- Name: COLUMN program.organization_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.program.organization_id IS 'Each program must belong to a single organization. The identifier of the organization should be given here.';


--
-- Name: COLUMN program.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.program.name IS 'The name of the program';


--
-- Name: COLUMN program.alternate_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.program.alternate_name IS 'An alternative name for the program';


--
-- Name: required_document; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.required_document (
    id text NOT NULL,
    service_id text,
    document text,
    CONSTRAINT required_document_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT required_document_service_id_check CHECK ((length(service_id) <= 250))
);


--
-- Name: COLUMN required_document.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.required_document.id IS 'Each document must have a unique identifier';


--
-- Name: COLUMN required_document.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.required_document.service_id IS 'The identifier of the service for which this entry describes the required document';


--
-- Name: COLUMN required_document.document; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.required_document.document IS 'The document required to apply for or receive the service. e.g. ''Government-issued ID'', ''EU Passport''';


--
-- Name: schedule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schedule (
    id text NOT NULL,
    service_id text,
    location_id text,
    service_at_location_id text,
    valid_from date,
    valid_to date,
    dtstart date,
    timezone numeric,
    until date,
    count date,
    wkst date,
    freq public.schedule_freq_enum,
    "interval" numeric,
    byday text,
    byweekno text,
    bymonthday numeric,
    byyearday numeric,
    description text,
    opens_at time without time zone,
    closes_at time without time zone,
    CONSTRAINT schedule_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT schedule_location_id_check CHECK ((length(location_id) <= 250)),
    CONSTRAINT schedule_service_at_location_id_check CHECK ((length(service_at_location_id) <= 250)),
    CONSTRAINT schedule_service_id_check CHECK ((length(service_id) <= 250))
);


--
-- Name: COLUMN schedule.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.id IS 'Each entry must have a unique identifier';


--
-- Name: COLUMN schedule.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.service_id IS 'The identifier of the service for which this is the regular schedule';


--
-- Name: COLUMN schedule.location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.location_id IS 'The identifier of the location for which this is the regular schedule';


--
-- Name: COLUMN schedule.service_at_location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.service_at_location_id IS 'The identifier of the ''service at location'' table entry, when this schedule is specific to a service in a particular location.';


--
-- Name: COLUMN schedule.valid_from; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.valid_from IS 'The date from which the schedule information is valid.';


--
-- Name: COLUMN schedule.valid_to; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.valid_to IS 'The last date on which the schedule information is valid.';


--
-- Name: COLUMN schedule.dtstart; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.dtstart IS 'iCal - The date of the first event is the schedule. Necessary when using the ''interval'' feature, optional otherwise.';


--
-- Name: COLUMN schedule.timezone; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.timezone IS 'The timezone that all dates are expressed as, expressed as a UTC offset. Dates are assumed to be UTC otherwise.';


--
-- Name: COLUMN schedule.until; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.until IS 'iCal - The date of the last occurence of the recurring event.';


--
-- Name: COLUMN schedule.count; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.count IS 'iCal - The number of times that the event occurs. Use this instead of ''until'', if appropriate.';


--
-- Name: COLUMN schedule.wkst; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.wkst IS 'iCal - The day on which the week starts, eg MO.';


--
-- Name: COLUMN schedule.freq; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.freq IS 'iCal - How often the frequency repeats. E.g. Frequency use one of WEEKLY or MONTHLY.';


--
-- Name: COLUMN schedule."interval"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule."interval" IS 'iCal - How often the frequency repeats. E.g. Interval 2 for Frequency WEEKLY gives Fortnightly';


--
-- Name: COLUMN schedule.byday; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.byday IS 'iCal - Comma seperated days of the week. E.g. SU,MO,TU,WE,TH,FR,SA. Where freq is MONTHLY each part can be preceded by a positive or negative integer to represent which occurrence in a month; e.g. 2MO is the second Monday in a month. -1FR is the last Friday';


--
-- Name: COLUMN schedule.byweekno; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.byweekno IS 'iCal - Comma seperated numeric weeks of the year if freq is WEEKLY. Can be negative to represent weeks before the end of the year; e.g. -5 is the 5th to last week in a year.';


--
-- Name: COLUMN schedule.bymonthday; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.bymonthday IS 'iCal - Comma separated numeric days of the month if frequency is MONTHLY. Can be negative to represent days before the end of the month; e.g. -5 is the 5th to last day in a month.';


--
-- Name: COLUMN schedule.byyearday; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.byyearday IS 'iCal - Comma separated numeric days of the month if frequency is YEARLY. Can be negative to represent days before the end of the year; e.g. -1 is the last day in a year.';


--
-- Name: COLUMN schedule.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.description IS 'Human readable description of the availability of the service.';


--
-- Name: COLUMN schedule.opens_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.opens_at IS 'The time when a service or location opens. This should use HH:MM format and should include timezone information, either adding the suffix ''Z'' when the date is in UTC, or including an offset from UTC (e.g. 09:00-05:00 for 9am EST.)';


--
-- Name: COLUMN schedule.closes_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.closes_at IS 'The time when a service or location closes. This should use HH:MM format and should include timezone information, either adding the suffix ''Z'' when the date is in UTC, or including an offset from UTC (e.g. 09:00-05:00 for 9am EST.)';


--
-- Name: service; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service (
    id text NOT NULL,
    organization_id text NOT NULL,
    program_id text,
    name text NOT NULL,
    alternate_name text,
    description text,
    url text,
    email text,
    status public.service_status_enum NOT NULL,
    interpretation_services text,
    application_process text,
    wait_time text,
    fees text,
    accreditations text,
    licenses text,
    CONSTRAINT service_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT service_organization_id_check CHECK ((length(organization_id) <= 250)),
    CONSTRAINT service_program_id_check CHECK ((length(program_id) <= 250))
);


--
-- Name: COLUMN service.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.id IS 'Each service must have a unique identifier.';


--
-- Name: COLUMN service.organization_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.organization_id IS 'The identifier of the organization that provides this service.';


--
-- Name: COLUMN service.program_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.program_id IS 'The identifier of the program this service is delivered under.';


--
-- Name: COLUMN service.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.name IS 'The official or public name of the service.';


--
-- Name: COLUMN service.alternate_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.alternate_name IS 'Alternative or commonly used name for a service.';


--
-- Name: COLUMN service.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.description IS 'A description of the service.';


--
-- Name: COLUMN service.url; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.url IS 'URL of the service';


--
-- Name: COLUMN service.email; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.email IS 'Email address for the service';


--
-- Name: COLUMN service.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.status IS 'The current status of the service.';


--
-- Name: COLUMN service.interpretation_services; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.interpretation_services IS 'A description of any interpretation services available for accessing this service.';


--
-- Name: COLUMN service.application_process; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.application_process IS 'The steps needed to access the service.';


--
-- Name: COLUMN service.wait_time; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.wait_time IS 'Time a client may expect to wait before receiving a service.';


--
-- Name: COLUMN service.fees; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.fees IS 'Details of any charges for service users to access this service.';


--
-- Name: COLUMN service.accreditations; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.accreditations IS 'Details of any accreditations. Accreditation is the formal evaluation of an organization or program against best practice standards set by an accrediting organization.';


--
-- Name: COLUMN service.licenses; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.licenses IS 'An organization may have a license issued by a government entity to operate legally. A list of any such licenses can be provided here.';


--
-- Name: service_area; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_area (
    id text NOT NULL,
    service_id text,
    service_area text,
    description text,
    CONSTRAINT service_area_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT service_area_service_id_check CHECK ((length(service_id) <= 250))
);


--
-- Name: COLUMN service_area.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_area.id IS 'Each service area must have a unique identifier';


--
-- Name: COLUMN service_area.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_area.service_id IS 'The identifier of the service for which this entry describes the service area';


--
-- Name: COLUMN service_area.service_area; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_area.service_area IS 'The geographic area where a service is available. This is a free-text description, and so may be precise or indefinite as necessary.';


--
-- Name: COLUMN service_area.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_area.description IS 'A more detailed description of this service area. Used to provide any additional information that cannot be communicated using the structured area and geometry fields.';


--
-- Name: service_at_location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_at_location (
    id text NOT NULL,
    service_id text NOT NULL,
    location_id text NOT NULL,
    description text,
    CONSTRAINT service_at_location_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT service_at_location_location_id_check CHECK ((length(location_id) <= 250)),
    CONSTRAINT service_at_location_service_id_check CHECK ((length(service_id) <= 250))
);


--
-- Name: COLUMN service_at_location.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_at_location.id IS 'Each entry must have a unique identifier.';


--
-- Name: COLUMN service_at_location.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_at_location.service_id IS 'The identifier of the service at a given location.';


--
-- Name: COLUMN service_at_location.location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_at_location.location_id IS 'The identifier of the location where this service operates.';


--
-- Name: COLUMN service_at_location.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_at_location.description IS 'Any additional information that should be displayed to users about the service at this specific location.';


--
-- Name: service_attribute; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_attribute (
    id text NOT NULL,
    service_id text NOT NULL,
    taxonomy_term_id text,
    CONSTRAINT service_attribute_id_check CHECK ((length(id) <= 250)),
    CONSTRAINT service_attribute_service_id_check CHECK ((length(service_id) <= 250)),
    CONSTRAINT service_attribute_taxonomy_term_id_check CHECK ((length(taxonomy_term_id) <= 250))
);


--
-- Name: COLUMN service_attribute.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_attribute.id IS 'Each service_attribute entry should have a unique identifier.';


--
-- Name: COLUMN service_attribute.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_attribute.service_id IS 'The identifier of the service to which this taxonomy term applies.';


--
-- Name: COLUMN service_attribute.taxonomy_term_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_attribute.taxonomy_term_id IS 'The identifier of this taxonomy term from the taxonomy table.';


--
-- Name: taxonomy_term; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taxonomy_term (
    id text NOT NULL,
    term text NOT NULL,
    description text NOT NULL,
    parent_id text,
    taxonomy text,
    language text,
    CONSTRAINT taxonomy_term_id_check CHECK ((length(id) <= 250))
);


--
-- Name: COLUMN taxonomy_term.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy_term.id IS 'Each taxonomy term must have a unique identifier, within the scope of the dataset';


--
-- Name: COLUMN taxonomy_term.term; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy_term.term IS 'The taxonomy term itself.';


--
-- Name: COLUMN taxonomy_term.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy_term.description IS 'What the term means';


--
-- Name: COLUMN taxonomy_term.parent_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy_term.parent_id IS 'If this is a child term in a hierarchical taxonomy, give the identifier of the parent category. For top-level categories, this should be left blank.';


--
-- Name: COLUMN taxonomy_term.taxonomy; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy_term.taxonomy IS 'If this is an established taxonomy, detail which taxonomy is in use. For example, AIRS or Open Eligibility. If possible, provide a URI.';


--
-- Name: COLUMN taxonomy_term.language; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy_term.language IS 'An ISO 639-1, or ISO 639-2 [language code](available at http://www.loc.gov/standards/iso639-2/php/code_list.php) to represent the language of the term. The three-letter codes from ISO 639-2 provide greater accuracy when describing variants of languages, which may be relevant to particular communities.';


--
-- Name: accessibility_for_disabilities accessibility_for_disabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accessibility_for_disabilities
    ADD CONSTRAINT accessibility_for_disabilities_pkey PRIMARY KEY (id);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: eligibility eligibility_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eligibility
    ADD CONSTRAINT eligibility_pkey PRIMARY KEY (id);


--
-- Name: funding funding_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.funding
    ADD CONSTRAINT funding_pkey PRIMARY KEY (id);


--
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: meta_table_description meta_table_description_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meta_table_description
    ADD CONSTRAINT meta_table_description_pkey PRIMARY KEY (id);


--
-- Name: metadata metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (id);


--
-- Name: metadata metadata_resource_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_resource_id_key UNIQUE (resource_id);


--
-- Name: metadata metadata_resource_type_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_resource_type_key UNIQUE (resource_type);


--
-- Name: organization organization_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (id);


--
-- Name: other_attribute other_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.other_attribute
    ADD CONSTRAINT other_attribute_pkey PRIMARY KEY (id);


--
-- Name: payment_accepted payment_accepted_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_accepted
    ADD CONSTRAINT payment_accepted_pkey PRIMARY KEY (id);


--
-- Name: phone phone_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_pkey PRIMARY KEY (id);


--
-- Name: physical_address physical_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.physical_address
    ADD CONSTRAINT physical_address_pkey PRIMARY KEY (id);


--
-- Name: postal_address postal_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postal_address
    ADD CONSTRAINT postal_address_pkey PRIMARY KEY (id);


--
-- Name: program program_organization_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_organization_id_key UNIQUE (organization_id);


--
-- Name: program program_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_pkey PRIMARY KEY (id);


--
-- Name: required_document required_document_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.required_document
    ADD CONSTRAINT required_document_pkey PRIMARY KEY (id);


--
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- Name: service_area service_area_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_area
    ADD CONSTRAINT service_area_pkey PRIMARY KEY (id);


--
-- Name: service_at_location service_at_location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_at_location
    ADD CONSTRAINT service_at_location_pkey PRIMARY KEY (id);


--
-- Name: service_attribute service_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_attribute
    ADD CONSTRAINT service_attribute_pkey PRIMARY KEY (id);


--
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- Name: taxonomy_term taxonomy_term_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxonomy_term
    ADD CONSTRAINT taxonomy_term_pkey PRIMARY KEY (id);


--
-- Name: accessibility_for_disabilities accessibility_for_disabilities_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accessibility_for_disabilities
    ADD CONSTRAINT accessibility_for_disabilities_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: contact contact_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: contact contact_service_at_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_service_at_location_id_fkey FOREIGN KEY (service_at_location_id) REFERENCES public.service_at_location(id);


--
-- Name: contact contact_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: eligibility eligibility_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eligibility
    ADD CONSTRAINT eligibility_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: funding funding_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.funding
    ADD CONSTRAINT funding_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: funding funding_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.funding
    ADD CONSTRAINT funding_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: language language_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: language language_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: location location_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: other_attribute other_attribute_taxonomy_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.other_attribute
    ADD CONSTRAINT other_attribute_taxonomy_term_id_fkey FOREIGN KEY (taxonomy_term_id) REFERENCES public.taxonomy_term(id);


--
-- Name: payment_accepted payment_accepted_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_accepted
    ADD CONSTRAINT payment_accepted_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: phone phone_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contact(id);


--
-- Name: phone phone_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: phone phone_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: phone phone_service_at_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_service_at_location_id_fkey FOREIGN KEY (service_at_location_id) REFERENCES public.service_at_location(id);


--
-- Name: phone phone_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: physical_address physical_address_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.physical_address
    ADD CONSTRAINT physical_address_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: postal_address postal_address_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postal_address
    ADD CONSTRAINT postal_address_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: program program_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: required_document required_document_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.required_document
    ADD CONSTRAINT required_document_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: schedule schedule_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: schedule schedule_service_at_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_service_at_location_id_fkey FOREIGN KEY (service_at_location_id) REFERENCES public.service_at_location(id);


--
-- Name: schedule schedule_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: service_area service_area_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_area
    ADD CONSTRAINT service_area_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: service_at_location service_at_location_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_at_location
    ADD CONSTRAINT service_at_location_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: service_at_location service_at_location_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_at_location
    ADD CONSTRAINT service_at_location_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: service_attribute service_attribute_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_attribute
    ADD CONSTRAINT service_attribute_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: service_attribute service_attribute_taxonomy_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_attribute
    ADD CONSTRAINT service_attribute_taxonomy_term_id_fkey FOREIGN KEY (taxonomy_term_id) REFERENCES public.taxonomy_term(id);


--
-- Name: service service_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: service service_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.program(id);


--
-- PostgreSQL database dump complete
--

