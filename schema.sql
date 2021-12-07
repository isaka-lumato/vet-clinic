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