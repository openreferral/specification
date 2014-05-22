CREATE TABLE organization (
  organization_id INT PRIMARY KEY NOT NULL,
  organization_name VARCHAR(256) NULL,
  fein VARCHAR(64) NULL,
  aka VARCHAR(256) NULL,
  legal_status VARCHAR(256) NULL,
  year_of_incorporation TIMESTAMP NULL,
  licenses TEXT NULL,
  accreditation TEXT NULL);


CREATE TABLE location (
  location_id INT PRIMARY KEY NOT NULL,
  organization_id INT NULL,
  name VARCHAR(256) NULL,
  aka VARCHAR(256) NULL,
  accessibility TEXT NULL,
  latitude numeric,
  longitude numeric,
  description TEXT NULL,
  location_hours TEXT NULL,
  location_languages TEXT NULL,
  short_desc TEXT NULL,
  transportation TEXT NULL);

CREATE TABLE service (
  service_id INT PRIMARY KEY NOT NULL,
  organization_id INT NULL,
  location_id INT NULL,
  audience TEXT NULL,
  description TEXT NULL,
  eligibility TEXT NULL,
  fees TEXT NULL,
  keywords TEXT NULL,
  how_to_apply TEXT NULL,
  name VARCHAR(255) NULL,
  service_areas TEXT NULL,
  short_desc TEXT NULL,
  urls TEXT NULL,
  service_languages TEXT NULL,
  service_hours TEXT NULL,
  wait VARCHAR(255) NULL,
  method_of_payment TEXT NULL);

CREATE TABLE address (
  address_id BIGSERIAL PRIMARY KEY,
  location_id INT NOT NULL,
  type VARCHAR(255) NULL,
  attention VARCHAR(255) NULL,
  street_1 VARCHAR(255) NULL,
  street_2 VARCHAR(255) NULL,
  city VARCHAR(255) NULL,
  state VARCHAR(255) NULL,
  postal_code VARCHAR(255) NULL,
  country VARCHAR(255) NULL,
  taxonomylevelname VARCHAR(255) NULL);

CREATE TABLE phone (
  phone_id BIGSERIAL PRIMARY KEY,
  location_id INT NOT NULL,
  phone_number VARCHAR(255) NULL,
  phone_extension VARCHAR(255) NULL,
  phone_hours VARCHAR(255) NULL,
  phone_type VARCHAR(255) NULL,
  department VARCHAR(255) NULL,
  country_code VARCHAR(3) NULL);

CREATE TABLE contact (
  contact_id BIGSERIAL PRIMARY KEY,
  location_id INT NOT NULL,
  organization_id INT NULL,
  contact_name VARCHAR(255) NULL,
  contact_title VARCHAR(255) NULL);

CREATE TABLE internet_resource (
  internet_resource_id BIGSERIAL PRIMARY KEY,
  organization_id INT NOT NULL,
  location_location_id INT NOT NULL,
  service_id INT NULL,
  resource VARCHAR(45) NULL,
  resource_type VARCHAR(45) NULL);

CREATE TABLE funding (
  funding_id BIGSERIAL PRIMARY KEY,
  organization_id INT NOT NULL,
  service_id INT NULL,
  source TEXT NULL);
 
-- Converting an iCarol resource table to HSDS tables

INSERT INTO organization(
  organization_id,
  organization_name,
  fein,
  aka,
  legal_status,
  year_of_incorporation,
  licenses,
  accreditation )
SELECT
  resourceagencynum,
  publicname,
  fein,
  alternatename,
  legalstatus,
  to_timestamp(yearincorporated,'YYYY'),
  licenseaccreditation,
  licenseaccreditation
FROM resources
WHERE resources.taxonomylevelname = 'Agency'; 

-- populate location table

INSERT INTO location(
  location_id,
  organization_id,
  name,
  aka,
  accessibility,
  latitude,
  longitude,
  location_hours,
  location_languages,
  transportation
)
SELECT
  resourceagencynum,
  parentagencynum,
  publicname,
  alternatename,
  disabilitiesaccess,
  cast(latitude AS numeric),
  cast(longitude AS numeric),
  hoursofoperation,
  languagesoffered,
  busserviceaccess
FROM resources
WHERE resources.taxonomylevelname = 'Site';


UPDATE location
SET description = resources.agencydescription
FROM resources
WHERE 
  resources.parentagencynum = location.organization_id

SELECT location_id,name,description FROM location;

-- populate program table

INSERT INTO service (
  service_id,
  organization_id,
  eligibility,
  fees,
  keywords,
  how_to_apply,
  name,
  service_areas,
  service_languages,
  service_hours,
  wait
) 
SELECT
  resourceagencynum,
  parentagencynum,
  eligibility,
  feestructuresource,
  taxonomyterm,
  applicationprocess,
  publicname,
  coveragearea,
  languagesoffered,
  hoursofoperation,
  normalwaittime
FROM resources
WHERE resources.taxonomylevelname = 'Program';

UPDATE service
SET description = resources.agencydescription
FROM resources
WHERE 
  resources.parentagencynum = service.organization_id;

SELECT service_id,name,description FROM service;

-- address table

-- physical addresses
INSERT INTO address (
  location_id,
  street_1,
  street_2,
  city,
  state,
  postal_code,
  country,
  taxonomylevelname
) 
SELECT
  resources.resourceagencynum,
  resources.physicaladdress1,
  resources.physicaladdress2,
  resources.physicalcity,
  resources.physicalstateprovince,
  resources.physicalpostalcode,
  resources.physicalcountry,
  resources.taxonomylevelname
FROM resources
WHERE resources.taxonomylevelname = 'Program'
AND (
  resources.physicaladdress1 != '' OR
  resources.physicaladdress2 != '' OR
  resources.physicalcity != '' OR
  resources.physicalstateprovince != '' OR
  resources.physicalpostalcode != '' OR
  resources.physicalcountry != ''
    );

UPDATE address
SET type = 'physical'
FROM resources
WHERE 
    resources.resourceagencynum = address.location_id
    AND
    address.taxonomylevelname = 'Program';


-- mailing
  INSERT INTO address (
    location_id,
    attention,
    street_1,
    street_2,
    city,
    state,
    postal_code,
    country,
    taxonomylevelname
  ) 
  SELECT
    resources.resourceagencynum,
    resources.mailingattentionname,
    resources.mailingaddress1,
    resources.mailingaddress2,
    resources.mailingcity,
    resources.mailingstateprovince,
    resources.mailingpostalcode,
    resources.mailingcountry,
    resources.taxonomylevelname
  FROM resources
  WHERE resources.taxonomylevelname = 'Program'
  AND (
    resources.mailingaddress1 != '' OR
    resources.mailingaddress2 != '' OR
    resources.mailingcity != '' OR
    resources.mailingstateprovince != '' OR
    resources.mailingpostalcode != '' OR
    resources.mailingcountry != ''
      );


UPDATE address SET type = 'mailing'  WHERE type is NULL ;

-- other

INSERT INTO address (
  location_id,
  street_1,
  street_2,
  city,
  state,
  postal_code,
  country,
  taxonomylevelname
) 
SELECT
  resources.resourceagencynum,
  resources.otheraddress1,
  resources.otheraddress2,
  resources.othercity,
  resources.otherstateprovince,
  resources.otherpostalcode,
  resources.othercountry,
  resources.taxonomylevelname
FROM resources
WHERE resources.taxonomylevelname = 'Program'
AND (
  resources.otheraddress1 != '' OR
  resources.otheraddress2 != '' OR
  resources.othercity != '' OR
  resources.otherstateprovince != '' OR
  resources.otherpostalcode != '' OR
  resources.othercountry != ''
    );

UPDATE address SET type = 'other'  WHERE type is NULL ;

-- site address

INSERT INTO address (
  location_id,
  street_1,
  street_2,
  city,
  state,
  postal_code,
  country,
  taxonomylevelname
) 
SELECT
  resources.resourceagencynum,
  resources.physicaladdress1,
  resources.physicaladdress2,
  resources.physicalcity,
  resources.physicalstateprovince,
  resources.physicalpostalcode,
  resources.physicalcountry,
  resources.taxonomylevelname
FROM resources
WHERE resources.taxonomylevelname = 'Site'
AND (
  resources.physicaladdress1 != '' OR
  resources.physicaladdress2 != '' OR
  resources.physicalcity != '' OR
  resources.physicalstateprovince != '' OR
  resources.physicalpostalcode != '' OR
  resources.physicalcountry != ''
    );

UPDATE address SET type = 'physical'  WHERE type is NULL AND address.taxonomylevelname = 'Site';



-- mailing
  INSERT INTO address (
    location_id,
    attention,
    street_1,
    street_2,
    city,
    state,
    postal_code,
    country,
    taxonomylevelname
  ) 
  SELECT
    resources.resourceagencynum,
    resources.mailingattentionname,
    resources.mailingaddress1,
    resources.mailingaddress2,
    resources.mailingcity,
    resources.mailingstateprovince,
    resources.mailingpostalcode,
    resources.mailingcountry,
    resources.taxonomylevelname
  FROM resources
  WHERE resources.taxonomylevelname = 'Site'
  AND (
    resources.mailingaddress1 != '' OR
    resources.mailingaddress2 != '' OR
    resources.mailingcity != '' OR
    resources.mailingstateprovince != '' OR
    resources.mailingpostalcode != '' OR
    resources.mailingcountry != ''
      );


UPDATE address SET type = 'mailing'  WHERE type is NULL AND address.taxonomylevelname = 'Site';

-- other

INSERT INTO address (
  location_id,
  street_1,
  street_2,
  city,
  state,
  postal_code,
  country,
  taxonomylevelname
) 
SELECT
  resources.resourceagencynum,
  resources.otheraddress1,
  resources.otheraddress2,
  resources.othercity,
  resources.otherstateprovince,
  resources.otherpostalcode,
  resources.othercountry,
  resources.taxonomylevelname
FROM resources
WHERE resources.taxonomylevelname = 'Site'
AND (
  resources.otheraddress1 != '' OR
  resources.otheraddress2 != '' OR
  resources.othercity != '' OR
  resources.otherstateprovince != '' OR
  resources.otherpostalcode != '' OR
  resources.othercountry != ''
    );

UPDATE address SET type = 'other'  WHERE type is NULL AND address.taxonomylevelname = 'Site';

-- agency address
INSERT INTO address (
  location_id,
  street_1,
  street_2,
  city,
  state,
  postal_code,
  country,
  taxonomylevelname
) 
SELECT
  resources.resourceagencynum,
  resources.physicaladdress1,
  resources.physicaladdress2,
  resources.physicalcity,
  resources.physicalstateprovince,
  resources.physicalpostalcode,
  resources.physicalcountry,
  resources.taxonomylevelname
FROM resources
WHERE resources.taxonomylevelname = 'Agency'
AND (
  resources.physicaladdress1 != '' OR
  resources.physicaladdress2 != '' OR
  resources.physicalcity != '' OR
  resources.physicalstateprovince != '' OR
  resources.physicalpostalcode != '' OR
  resources.physicalcountry != ''
    );

UPDATE address SET type = 'physical'  WHERE type is NULL AND address.taxonomylevelname = 'Agency';



-- mailing
  INSERT INTO address (
    location_id,
    attention,
    street_1,
    street_2,
    city,
    state,
    postal_code,
    country,
    taxonomylevelname
  ) 
  SELECT
    resources.resourceagencynum,
    resources.mailingattentionname,
    resources.mailingaddress1,
    resources.mailingaddress2,
    resources.mailingcity,
    resources.mailingstateprovince,
    resources.mailingpostalcode,
    resources.mailingcountry,
    resources.taxonomylevelname
  FROM resources
  WHERE resources.taxonomylevelname = 'Agency'
  AND (
    resources.mailingaddress1 != '' OR
    resources.mailingaddress2 != '' OR
    resources.mailingcity != '' OR
    resources.mailingstateprovince != '' OR
    resources.mailingpostalcode != '' OR
    resources.mailingcountry != ''
      );


UPDATE address SET type = 'mailing'  WHERE type is NULL AND address.taxonomylevelname = 'Agency';

-- other

INSERT INTO address (
  location_id,
  street_1,
  street_2,
  city,
  state,
  postal_code,
  country,
  taxonomylevelname
) 
SELECT
  resources.resourceagencynum,
  resources.otheraddress1,
  resources.otheraddress2,
  resources.othercity,
  resources.otherstateprovince,
  resources.otherpostalcode,
  resources.othercountry,
  resources.taxonomylevelname
FROM resources
WHERE resources.taxonomylevelname = 'Agency'
AND (
  resources.otheraddress1 != '' OR
  resources.otheraddress2 != '' OR
  resources.othercity != '' OR
  resources.otherstateprovince != '' OR
  resources.otherpostalcode != '' OR
  resources.othercountry != ''
    );

UPDATE address SET type = 'other'  WHERE type is NULL AND address.taxonomylevelname = 'Agency';

-- populate phone table

INSERT INTO phone (
  location_id,
  phone_number,
  phone_type
  )
SELECT
  resources.resourceagencynum,
  phone1number,
  phone1type
FROM resources
WHERE phone1number IS NOT NULL;

UPDATE phone SET phone_type = 'voice' WHERE phone_type IS NULL;

INSERT INTO phone (
  location_id,
  phone_number,
  phone_type
  )
SELECT
  resources.resourceagencynum,
  phone2number,
  phone2type
FROM resources
WHERE phone2number IS NOT NULL;

UPDATE phone SET phone_type = 'voice' WHERE phone_type IS NULL;

INSERT INTO phone (
  location_id,
  phone_number,
  phone_type
  )
SELECT
  resources.resourceagencynum,
  phone3number,
  phone3type
FROM resources
WHERE phone3number IS NOT NULL;

UPDATE phone SET phone_type = 'voice' WHERE phone_type IS NULL;

INSERT INTO phone (
  location_id,
  phone_number,
  phone_type
  )
SELECT
  resources.resourceagencynum,
  phone4number,
  phone4type
FROM resources
WHERE phone4number IS NOT NULL;

UPDATE phone SET phone_type = 'voice' WHERE phone_type IS NULL;

INSERT INTO phone (
  location_id,
  phone_number,
  phone_type
  )
SELECT
  resources.resourceagencynum,
  phone5number,
  phone5type
FROM resources
WHERE phone5number IS NOT NULL;

UPDATE phone SET phone_type = 'voice' WHERE phone_type IS NULL;

INSERT INTO phone (
  location_id,
  phone_number
  )
SELECT
  resources.resourceagencynum,
  phonefax
FROM resources
WHERE phonefax IS NOT NULL;

UPDATE phone SET phone_type = 'fax' WHERE phone_type IS NULL;

INSERT INTO phone (
  location_id,
  phone_number
  )
SELECT
  resources.resourceagencynum,
  phonetty
FROM resources
WHERE phonetty IS NOT NULL;

UPDATE phone SET phone_type = 'tty' WHERE phone_type IS NULL;

INSERT INTO phone (
  location_id,
  phone_number
  )
SELECT
  resources.resourceagencynum,
  phonetollfree
FROM resources
WHERE phonetollfree IS NOT NULL;

UPDATE phone SET phone_type = 'tollfree' WHERE phone_type IS NULL;

INSERT INTO phone (
  location_id,
  phone_number
  )
SELECT
  resources.resourceagencynum,
  phonenumberhotline
FROM resources
WHERE phonenumberhotline IS NOT NULL;

UPDATE phone SET phone_type = 'hotline' WHERE phone_type IS NULL;

INSERT INTO phone (
  location_id,
  phone_number
  )
SELECT
  resources.resourceagencynum,
  phonenumberbusinessline
FROM resources
WHERE phonenumberbusinessline IS NOT NULL;

UPDATE phone SET phone_type = 'businessline' WHERE phone_type IS NULL;

INSERT INTO phone (
  location_id,
  phone_number
  )
SELECT
  resources.resourceagencynum,
  phonenumberoutofarea
FROM resources
WHERE phonenumberoutofarea IS NOT NULL;

UPDATE phone SET phone_type = 'outofarea' WHERE phone_type IS NULL;

INSERT INTO phone (
  location_id,
  phone_number
  )
SELECT
  resources.resourceagencynum,
  resources.seniorworkerphonenumber
FROM resources
WHERE seniorworkerphonenumber IS NOT NULL;

UPDATE phone SET phone_type = 'seniorworker' WHERE phone_type IS NULL;

INSERT INTO phone (
  location_id,
  phone_number
  )
SELECT
  resources.resourceagencynum,
  resources.maincontactphonenumber
FROM resources
WHERE maincontactphonenumber IS NOT NULL;

UPDATE phone SET phone_type = 'maincontact' WHERE phone_type IS NULL;

-- populate contact

INSERT INTO contact (
  location_id,
  organization_id,
  contact_name,
  contact_title
  )
SELECT
  resources.resourceagencynum,
  resources.parentagencynum,
  resources.maincontactname,
  resources.maincontacttitle
FROM resources
WHERE maincontactname IS NOT NULL;

INSERT INTO contact (
  location_id,
  organization_id,
  contact_name,
  contact_title
  )
SELECT
  resources.resourceagencynum,
  resources.parentagencynum,
  resources.seniorworkername,
  resources.seniorworkertitle
FROM resources
WHERE seniorworkername IS NOT NULL;

-- populate internet resource

INSERT INTO internet_resource (
  organization_id,
  location_location_id,
  resource
  )
SELECT
  resources.parentagencynum,
  resources.resourceagencynum,
  resources.seniorworkeremailaddress
FROM resources
WHERE seniorworkeremailaddress IS NOT NULL;

UPDATE internet_resource SET resource_type = 'email' WHERE resource IS NOT NULL;

INSERT INTO internet_resource (
  organization_id,
  location_location_id,
  resource
  )
SELECT
  resources.parentagencynum,
  resources.resourceagencynum,
  resources.maincontactemailaddress
FROM resources
WHERE maincontactemailaddress IS NOT NULL;

UPDATE internet_resource SET resource_type = 'email' WHERE resource IS NOT NULL;

INSERT INTO internet_resource (
  organization_id,
  location_location_id,
  resource
  )
SELECT
  resources.parentagencynum,
  resources.resourceagencynum,
  resources.emailaddressmain
FROM resources
WHERE emailaddressmain IS NOT NULL;

UPDATE internet_resource SET resource_type = 'email' WHERE resource IS NOT NULL;

INSERT INTO internet_resource (
  organization_id,
  location_location_id,
  resource
  )
SELECT
  resources.parentagencynum,
  resources.resourceagencynum,
  resources.websiteaddress
FROM resources
WHERE websiteaddress IS NOT NULL;

UPDATE internet_resource SET resource_type = 'url' WHERE resource IS NOT NULL;

-- populate funding

INSERT INTO funding (
  organization_id,
  source
  )
SELECT
  resources.resourceagencynum,
  resources.sourceoffunds
FROM resources
WHERE sourceoffunds IS NOT NULL;