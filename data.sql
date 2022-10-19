/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon',  TO_DATE('03/02/2020', 'DD/MM/YYYY'), 0, TRUE, 10.23 );
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', TO_DATE('15/11/2018', 'DD/MM/YYYY'), 2, TRUE, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', TO_DATE('07/01/2021', 'DD/MM/YYYY'), 1, FALSE, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', TO_DATE('12/05/2017', 'DD/MM/YYYY'), 5, TRUE, 11 );


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

/*Insert many to many related data */
/* Vet data */
INSERT INTO vets (name, age, date_of_graduation) VALUES 
('William Tatcher', 45, TO_DATE('23/04/2000', 'DD/MM/YYYY')),
('Maisy Smith', 26, TO_DATE('17/01/2019', 'DD/MM/YYYY')),
('Stephanie Mendez', 64, TO_DATE('04/05/1981', 'DD/MM/YYYY')),
('Jack Harkness', 38, TO_DATE('08/06/2008', 'DD/MM/YYYY'));

/* Insert data into Bridge table (specialization) for vets and species data  */
INSERT INTO specializations (vet_id, species_id) VALUES 
(1, 1),
(3, 1),
(3, 2),
(4, 2);

/* Insert data into bridge table (visits) for animals and vets*/
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES
(1, 1, TO_DATE('24/05/2020', 'DD/MM/YYYY')),
(1, 3, TO_DATE('22/07/2020', 'DD/MM/YYYY')),
(2, 4, TO_DATE('2/2/2021', 'DD/MM/YYYY')),
(3, 2, TO_DATE('05/01/2020', 'DD/MM/YYYY')),
(3, 2, TO_DATE('08/05/2020', 'DD/MM/YYYY')),
(3, 2, TO_DATE('14/05/2020', 'DD/MM/YYYY')),
(4, 3, TO_DATE('4/05/2021', 'DD/MM/YYYY')),
(5, 4, TO_DATE('24/02/2021', 'DD/MM/YYYY')),
(6, 2, TO_DATE('21/12/2019', 'DD/MM/YYYY')),
(6, 1, TO_DATE('10/08/2020', 'DD/MM/YYYY')),
(6, 2, TO_DATE('07/05/2021', 'DD/MM/YYYY')),
(7, 2, TO_DATE('29/09/2019', 'DD/MM/YYYY')),
(8, 3, TO_DATE('03/10/2020', 'DD/MM/YYYY')),
(8, 4, TO_DATE('04/11/2020', 'DD/MM/YYYY')),
(9, 2, TO_DATE('24/01/2019', 'DD/MM/YYYY')),
(9, 2, TO_DATE('15/05/2019', 'DD/MM/YYYY')),
(9, 2, TO_DATE('27/02/2020', 'DD/MM/YYYY')),
(9, 2, TO_DATE('03/08/2020', 'DD/MM/YYYY')),
(10, 3, TO_DATE('24/05/2020', 'DD/MM/YYYY')),
(10, 1, TO_DATE('11/01/2021', 'DD/MM/YYYY'));


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';