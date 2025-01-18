--inserting values from university_professors
INSERT INTO professors
SELECT DISTINCT firstname,lastname,university_shortname
FROM university_professors;
--altering adding constraints
ALTER TABLE professors
ALTER COLUMN university_shortname
TYPE CHAR(3);
ALTER TABLE professors
ALTER COLUMN firstname 
TYPE varchar(16)
USING SUBSTRING (firstname FROM 1 FOR 16);

ALTER TABLE professors
ALTER COLUMN firstname
SET NOT NULL;

ALTER TABLE professors
ALTER COLUMN lastname
SET NOT NULL;

SELECT COUNT(DISTINCT(firstname,lastname))
FROM professors;

ALTER TABLE professors
ADD COLUMN id serial;

ALTER TABLE professors
ADD CONSTRAINT professor_PK PRIMARY KEY(id);

/*UPDATE professor
SET id=CONCAT(firstname,lastname) */

ALTER TABLE professors
RENAME COLUMN university_shortname TO university_id;

ALTER TABLE professors
ADD CONSTRAINT professors_fkey FOREIGN KEY ( university_id) REFERENCES universities (id);

SELECT * 
FROM professors;

