--inserting values from university_professors
INSERT INTO organizations
SELECT DISTINCT organization,organization_sector
FROM university_professors;
--altering table for adding constraint
ALTER TABLE organizations
ADD CONSTRAINT organization_unique unique (organization);
ALTER TABLE organizations
RENAME COLUMN organization to id;
ALTER TABLE organizations
ADD CONSTRAINT organization_Pk PRIMARY KEY (id);

SELECT *
FROM organizations;
