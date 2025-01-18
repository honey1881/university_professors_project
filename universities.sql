--adding new column 
ALTER TABLE universities
ADD COLUMN university_shortname text;
--inserting values
INSERT INTO universities
SELECT  DISTINCT university, 
university_city,
university_shortname
FROM university_professors;
--renaming the column ushort to id
ALTER TABLE universities
RENAME COLUMN university_shortname to id;
--adding key constraints + unique
ALTER TABLE universities
ADD CONSTRAINT id_unique unique (id);

ALTER TABLE universities
ADD CONSTRAINT id_Pk PRIMARY KEY (id);

SELECT *
FROM universities;










