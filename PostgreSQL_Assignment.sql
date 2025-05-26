-- Active: 1747760324707@@127.0.0.1@5432@wildlifeconservation

-- table creation quires for wildlife conservation database
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
)

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(100) NOT NULL
)

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(255) NOT NULL,
    notes VARCHAR(500)
)

--relationships between tables
SELECT * FROM sightings
JOIN rangers ON sightings.ranger_id = rangers.ranger_id
JOIN species ON sightings.species_id = species.species_id;

-- problem one 
INSERT INTO rangers (name, region) VALUES
('Derek Fox', 'Coastal Plains')


-- problem two
SELECT count(DISTINCT common_name) 
FROM species

-- problem three
SELECT * FROM sightings
WHERE location LIKE '%Pass%'


-- problem four
SELECT name, count(ranger_id) AS total_sightings FROM sightings
JOIN rangers USING(ranger_id)
GROUP BY name


-- problem five
SELECT name AS common_name FROM sightings
FULL JOIN rangers USING(ranger_id)
WHERE species_id IS NULL
 

-- problem six
SELECT common_name, sighting_time, name  FROM sightings 
JOIN rangers USING(ranger_id) 
JOIN species USING(species_id)
ORDER BY sighting_time DESC
LIMIT 2


-- problem seven
SELECT * FROM species;

UPDATE species
SET conservation_status = 'Historic'
WHERE extract(YEAR FROM discovery_date) < '1800';

-- problem eight

ALTER TABLE sightings
ADD COLUMN time_of_day VARCHAR(50);
UPDATE sightings
SET time_of_day = 'Morning'
WHERE EXTRACT(HOUR FROM sighting_time) < 12;
UPDATE sightings
SET time_of_day = 'Afternoon'
WHERE EXTRACT(HOUR FROM sighting_time) >= 12 AND EXTRACT(HOUR FROM sighting_time) < 17;
UPDATE sightings
SET time_of_day = 'Evening'
WHERE EXTRACT(HOUR FROM sighting_time) >= 17;

-- problem nine


DELETE FROM (SELECT species_id, ranger_id  FROM sightings 
FULL JOIN rangers USING(ranger_id) 
FULL JOIN species USING(species_id) )AS p
WHERE p.species_id IS NULL AND p.ranger_id IS NULL;


DELETE FROM rangers WHERE ranger_id IN
( SELECT ranger_id FROM rangers
FULL JOIN sightings USING(ranger_id)
WHERE sightings.sighting_id IS NULL
AND sightings.species_id IS NULL);

