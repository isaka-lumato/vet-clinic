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