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
