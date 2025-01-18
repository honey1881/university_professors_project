CREATE TABLE professors
(
firstname text,
lastname text,
university_shortname text
);
CREATE TABLE universities
(
university text,
university_city text
);
CREATE TABLE organizations
(
organization text,
organization_sector text
);
CREATE TABLE affiliations
(
firstname text,
lastname text,
university_shortname,
function,
organization text
);

SELECT *
FROM universities;
