/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);


/* Add species column to animals */
ALTER TABLE animals
ADD COLUMN species VARCHAR(100);


CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100),
    age INT,
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY (id)
);

/* drop species column in animal table */
ALTER TABLE animals
DROP COLUMN species;

/* add species id column to animal table */
ALTER TABLE animals
ADD COLUMN species_id INT;

/* add owner id column to animal table */
ALTER TABLE animals
ADD COLUMN owner_id INT;

/* make species id a foreign key to species table */
ALTER TABLE animals
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species(id);

/* make owner id a foreign key to owners table */
ALTER TABLE animals
ADD CONSTRAINT fk_owners
FOREIGN KEY (owner_id)
REFERENCES owners(id);