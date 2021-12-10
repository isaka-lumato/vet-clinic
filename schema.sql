/* Database schema to keep the structure of entire database. */
create table animals (
    id integer GENERATED ALWAYS AS IDENTITY,
    name varchar,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg real,
    primary key(id)
);

-- add new column species
alter table
    animals
add
    species varchar(100);

-- creating table owners
create table owners (
    id int primary key GENERATED ALWAYS as IDENTITY,
    full_name varchar(100),
    age int
);

-- creating table owners
create table species (
    id int primary key GENERATED ALWAYS as IDENTITY,
    name varchar(100)
);

-- modifying animals table
ALTER TABLE
    animals drop species;

ALTER TABLE
    animals
add
    species_id int references species(id);

ALTER TABLE
    animals
add
    owner_id int references owners(id);

-- create vets table
CREATE TABLE vets (
    id SERIAL PRIMARY KEY NOT NULL,
    name varchar(100) NOT NULL,
    age INT,
    date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
    vets_id INT,
    species_id INT,
    CONSTRAINT vets_id FOREIGN KEY(vets_id) REFERENCES vets(id),
    CONSTRAINT species_id FOREIGN KEY(species_id) REFERENCES species(id)
);

CREATE TABLE visits (
    vets_id INT,
    animals_id INT,
    CONSTRAINT vets_id FOREIGN KEY(vets_id) REFERENCES vets(id),
    CONSTRAINT animals_id FOREIGN KEY(animals_id) REFERENCES animals(id)
);

ALTER TABLE
    visits
ADD
    visit_date DATE;

ALTER TABLE
    owners
ADD
    email varchar(120);

CREATE INDEX animals_id ON visits(animals_id);

CREATE INDEX visits_id ON visits(vets_id);

CREATE INDEX owners_mail ON owners(email ASC);