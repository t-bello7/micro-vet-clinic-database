/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth >= '2016/01/01' AND date_of_birth < '2019/12/30';
SELECT name FROM animals WHERE neutered = 't' AND  escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg < 10.5;
SELECT * FROM animals WHERE neutered = 't';
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


/* Update species column to be unspecified in a transaction then rollback changes*/
BEGIN TRANSACTION;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

/* If name ends with mon update species to digimon else update species to pokemon  then commit*/
BEGIN TRANSACTION;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon%';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

COMMIT;

/* Delete all the records in the animal table then rollback transaction  */
BEGIN TRANSACTION;
DELETE 
FROM animals
WHERE id IS NOT NULL;
ROLLBACK;

/* update records while creating savepoints */
BEGIN TRANSACTION;
SELECT * from animals WHERE date_of_birth > '1/1/2022';
DELETE 
FROM animals
WHERE date_of_birth > '1/1/2022';
SAVEPOINT dobsavepoint;
SELECT * from animals;
UPDATE animals
SET weight_kg = weight_kg * (-1);
ROLLBACK TO dobsavepoint;
UPDATE animals
SET weight_kg = weight_kg * (-1)
WHERE weight_kg < 0;
COMMIT;

/* Query for how many animals are there */
SELECT COUNT(id) from animals;  
/* Query for how many animals never tried to escape */
SELECT COUNT(escape_attempts) from animals WHERE escape_attempts = 0;  
/* Query for the average weight of animals */
SELECT AVG(weight_kg) from animals;
/* Query for Who escapes the most, neutered or not neutered animals? */
SELECT neutered, MAX(escape_attempts) from animals GROUP BY neutered; 
/* Query for the minimum and maximum weight of each type of animal? */
SELECT species, MAX(weight_kg), MIN(weight_kg) from animals GROUP BY species;
/* Query for average number of escape attempts per animal type of those born between 1990 and 2000 */
SELECT species,date_of_birth, AVG(escape_attempts) from animals GROUP BY species, date_of_birth HAVING date_of_birth BETWEEN '1/1/1990' and '1/1/2000';


/* Query for  What animals belong to Melody Pond? */
SELECT name AS animal_name, full_name FROM animals A JOIN owners O ON A.owner_id = O.id WHERE full_name = 'Melody Pond';
/* Query for  List of all animals that are pokemon (their type is Pokemon). */
SELECT A.name AS animal_name, S.name AS species_name FROM animals A JOIN species S ON A.species_id = S.id WHERE S.name = 'Pokemon';
/* Query for  List all owners and their animals, remember to include those that don't own any animal. */
SELECT name AS animal_name, full_name FROM animals A RIGHT JOIN owners O ON A.owner_id = O.id;
/* Query for  How many animals are there per species? */
SELECT COUNT(A.name), S.name FROM animals A JOIN species S ON  A.species_id = S.id GROUP BY S.name;
/* Query for  List all Digimon owned by Jennifer Orwell. */
SELECT S.name AS animal_name, full_name FROM animals A JOIN owners O ON A.owner_id = O.id JOIN species S ON A.species_id = S.id WHERE full_name = 'Jennifer Orwell' AND S.name = 'Digimon';
/* Query for  List all animals owned by Dean Winchester that haven't tried to escape. */
SELECT name AS animal_name, full_name, escape_attempts FROM animals A JOIN owners O ON A.owner_id = O.id WHERE A.escape_attempts = 0 and full_name = 'Dean Winchester';
/* Query for  Who owns the most animals? */
SELECT  full_name, COUNT(full_name) AS number FROM animals A JOIN owners O ON A.owner_id = O.id GROUP BY full_name ORDER BY number DESC LIMIT 1;

