/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon',  TO_DATE('03/02/2020', 'DD/MM/YYYY'), 0, TRUE, 10.23 );
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', TO_DATE('15/11/2018', 'DD/MM/YYYY'), 2, TRUE, 8.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', TO_DATE('07/01/2021', 'DD/MM/YYYY'), 1, FALSE, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', TO_DATE('12/05/2017', 'DD/MM/YYYY'), 5, TRUE, 11.0);


/* Insert new data */
INSERT INTO animals ( name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES 
('Charmander', TO_DATE('08/02/2020','DD/MM/YYYY'), -11, FALSE, 0),
('Plantmon', TO_DATE('15/11/2021', 'DD/MM/YYYY'), -5.7, TRUE, 2),
('Squirtle', TO_DATE('02/04/1993', 'DD/MM/YYYY'), -12.13, FALSE, 3),
('Angemon', TO_DATE('12/06/2005', 'DD/MM/YYYY'), -45, TRUE, 1),
('Boarmon', TO_DATE('7/06/2005', 'DD/MM/YYYY'), 20.4, TRUE, 7), 
('Blossom', TO_DATE('13/10/1998', 'DD/MM/YYYY'), 17, TRUE, 3),
('Ditto', TO_DATE('14/05/2022', 'DD/MM/YYYY'), 22, TRUE, 4);

/* add data to owners table */
INSERT INTO owners (full_name, age) VALUES 
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker' , 38);

/*add data to species table */
INSERT INTO species (name) VALUES
('Pokemon'),
('Digimon');

/* If name ends with mon update species_id to digimon value id in the species table
 else update species_id to pokemon value id in the species table */
UPDATE animals
SET species_id = 1
WHERE name LIKE '%mon%';

UPDATE animals
SET species_id = 2
WHERE species_id IS NULL;

/* Update owner_id to the id of owners in owners table */
UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals 
SET owner_id = 2
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
set owner_id = 3
WHERE name = 'Devimon' or name = 'Plantmon';

UPDATE animals
set owner_id = 4
WHERE name = 'Charmander' or name = 'Squirtle' or name = 'Blossom';

UPDATE animals 
set owner_id = 5 
WHERE name = 'Angemon' or name = 'Boarmon';