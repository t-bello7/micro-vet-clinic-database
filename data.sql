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
('Ditto', TO_DATE('14/05/2022', 'DD/MM/YYYY'), 22, TRUE, 4)
;


