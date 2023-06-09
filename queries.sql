/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.50;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * from animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * from animals;
COMMIT;
SELECT * from animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT cloud1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO cloud1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts < 1;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '1999-12-31' GROUP BY species;

SELECT name FROM animals JOIN owners O ON owner_id = O.id WHERE full_name = 'Melody Pond';
SELECT A.name FROM animals A JOIN species S ON species_id = S.id WHERE S.name = 'Pokemon';
SELECT full_name AS owner, name AS animal FROM animals RIGHT JOIN owners O ON owner_id = O.id;
SELECT S.name, COUNT(*) FROM species S JOIN animals ON  S.id = species_id GROUP BY S.name;
SELECT A.name FROM animals A JOIN owners O ON owner_id = O.id JOIN species S ON species_id = S.id WHERE full_name = 'Jennifer Orwell' AND S.name = 'Digimon';
SELECT name FROM animals JOIN owners O ON owner_id = O.id WHERE full_name = 'Dean Winchester' AND escape_attempts = 0;
SELECT full_name, COUNT(*) AS animal_count FROM owners O JOIN animals ON O.id = owner_id GROUP BY full_name ORDER BY animal_count DESC LIMIT 1;
