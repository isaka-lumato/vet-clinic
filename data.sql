/* Populate database with sample data. */
INSERT INTO
  animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Agumon', '2020-02-03', 0, true, 10.23),
  ('Pikachu', '2021-01-07', 1, false, 15.04),
  ('Devimon', '2017-05-12', 5, true, 11),
  ('Gabumon', '2018-11-15', 2, true, 8);

-- insterting new animal lists
INSERT INTO
  animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Charmander', '2020-02-08', 0, false, -11),
  ('Plantmon', '2022-11-15', 2, true, -5.7),
  ('Squirtle', '1993-04-02', 3, false, -12.13),
  ('Angemon', '2005-06-12', 1, true, -45),
  ('Boarmon', '2005-06-07', 7, true, 20),
  ('Blossom', '1998-10-13', 3, true, 17);

BEGIN;

UPDATE
  animals
SET
  species = 'unspecified';

ROLLBACK;

BEGIN;

UPDATE
  animals
SET
  species = 'digimon'
WHERE
  name LIKE '%mon';

UPDATE
  animals
SET
  species = 'pokemon'
WHERE
  species IS NULL;

COMMIT;

BEGIN;

DELETE FROM
  animals;

ROLLBACK;

BEGIN;

DELETE FROM
  animals
WHERE
  date_of_birth >= '2022-01-01';

SAVEPOINT SP1;

UPDATE
  animals
SET
  weight_kg = weight_kg *(-1);

ROLLBACK TO SP1;

UPDATE
  animals
SET
  weight_kg = weight_kg *(-1)
WHERE
  weight_kg < 0;

COMMIT;