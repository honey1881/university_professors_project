-- inserting values in to table
INSERT INTO affiliations
SELECT DISTINCT
firstname ,
lastname ,
university_shortname ,
function ,
organization 
FROM university_professors;
--droping column university_shortname
ALTER TABLE affiliations
DROP COLUMN university_shortname;
--adding column referencing from professors
ALTER TABLE affiliations
ADD COLUMN professor_id INTEGER REFERENCES professors(id);

ALTER TABLE affiliations
RENAME organization to organization_id;

--Adding foreign key on organization_id
ALTER TABLE affiliations
ADD CONSTRAINT affiliations_organization_fkey FOREIGN KEY (organization_id) REFERENCES organizations (id);


-- Set professor_id to professors.id where firstname, lastname correspond to rows in professors
UPDATE affiliations
SET professor_id = professors.id
FROM professors
WHERE affiliations.firstname = professors.firstname 
AND affiliations.lastname = professors.lastname;

SELECT * FROM affiliations
LIMIT 10;

-- AFTER REFERENCES we drop our firstname and lastname to remove deduncy
ALTER TABLE affiliations
DROP COLUMN firstname;

ALTER TABLE affiliations
DROP COLUMN lastname;

-- Drop the right foreign key constraint
ALTER TABLE affiliations
DROP CONSTRAINT affiliations_organization_fkey;


-- Add a new foreign key constraint from affiliations to organizations which cascades deletion
ALTER TABLE affiliations
Add CONSTRAINT affiliations_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES organizations (id) 
ON DELETE CASCADE;
SELECT *
FROM affiliations;

