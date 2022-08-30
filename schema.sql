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

/* create vets table */
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),ve
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY (id)
);

/* create many to many relationship with vets and species table using a bridge table */
CREATE TABLE specializations (
    id INT GENERATED ALWAYS AS IDENTITY,
    vet_id INT NOT NULL,
    species_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (vet_id) REFERENCES vets(id) ON DELETE CASCADE,
    FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE
);

/* add a primary key to animal table */
ALTER TABLE animals
ADD PRIMARY KEY (id);

/* create many to many relationship with animal and vet table using a bridge table */
CREATE TABLE visits (
    id INT GENERATED ALWAYS AS IDENTITY,
    animal_id INT NOT NULL,
    vet_id INT NOT NULL,
    date_of_visit DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (vet_id) REFERENCES vets(id) ON DELETE CASCADE,
    FOREIGN KEY (animal_id) REFERENCES animals(id) ON DELETE CASCADE
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Create index on columns that need perfomance tuning
CREATE INDEX animal_id_index on visits(animal_id);
CREATE INDEX vet_id_index on visits(vet_id); 
CREATE INDEX email_id on owners(email);
