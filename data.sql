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

-- inserting values of owners
insert into
  owners (full_name, age)
values
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker ', 38);

  insert into
  species(name)
values
('Pokemon'),
('Digimon');
update
  animals
set
  species_id = 2
where
  name like '%mon';

update
  animals
set
  species_id = 1
where
  species_id is null;

update
  animals
set
  owner_id =(
    select
      id
    from
      owners
    where
      full_name = 'Sam Smith'
  )
where
  name = 'Agumon';

update
  animals
set
  owner_id =(
    select
      id
    from
      owners
    where
      full_name = 'Jennifer Orwell'
  )
where
  name = 'Gabumon'
  or name = 'Pikachu';

update
  animals
set
  owner_id =(
    select
      id
    from
      owners
    where
      full_name = 'Bob'
  )
where
  name = 'Devimon'
  or name = 'Plantmon';

update
  animals
set
  owner_id =(
    select
      id
    from
      owners
    where
      full_name = 'Melody Pond'
  )
where
  name = 'Charmander'
  or name = 'Squirtle'
  or name = 'Blossom';

update
  animals
set
  owner_id =(
    select
      id
    from
      owners
    where
      full_name = 'Dean Winchester'
  )
where
  name = 'Angemon'
  or name = 'Boarmon';

  -- insert vet data to vet table
  INSERT INTO
  vets (name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');

  -- insert data into specialization convinient with the other tables
  INSERT INTO
  specializations (vets_id, species_id)
VALUES
  (1, 1),
    (2, 2),
  (2, 1),
  (3, 2);

  -- insert visit table data
  INSERT INTO
  visits (vets_id, animals_id, visit_date)
VALUES
  (
    1,
(
      SELECT
        id
      from
        animals
      where
        name = 'Agumon'
    ),
    '2020-05-24'
  ),
  (
    3,
(
      SELECT
        id
      from
        animals
      where
        name = 'Agumon'
    ),
    '2020-07-22'
  ),
  (
    4,
(
      SELECT
        id
      from
        animals
      where
        name = 'Gabumon'
    ),
    '2021-02-02'
  ),
  (
    2,
(
      SELECT
        id
      from
        animals
      where
        name = 'Pikachu'
    ),
    '2020-01-05'
  ),
  (
    2,
(
      SELECT
        id
      from
        animals
      where
        name = 'Pikachu'
    ),
    '2020-03-08'
  ),
  (
    2,
(
      SELECT
        id
      from
        animals
      where
        name = 'Pikachu'
    ),
    '2020-05-14'
  ),
  (
    3,
(
      SELECT
        id
      from
        animals
      where
        name = 'Devimon'
    ),
    '2021-05-04'
  ),
  (
    4,
(
      SELECT
        id
      from
        animals
      where
        name = 'Charmander'
    ),
    '2021-02-24'
  ),
  (
    2,
(
      SELECT
        id
      from
        animals
      where
        name = 'Plantmon'
    ),
    '2019-12-21'
  ),
  (
    1,
(
      SELECT
        id
      from
        animals
      where
        name = 'Plantmon'
    ),
    '2020-08-10'
  ),
  (
    2,
(
      SELECT
        id
      from
        animals
      where
        name = 'Plantmon'
    ),
    '2021-04-07'
  ),
  (
    3,
(
      SELECT
        id
      from
        animals
      where
        name = 'Squirtle'
    ),
    '2019-09-29'
  ),
  (
    4,
(
      SELECT
        id
      from
        animals
      where
        name = 'Angemon'
    ),
    '2020-10-03'
  ),
  (
    4,
(
      SELECT
        id
      from
        animals
      where
        name = 'Angemon'
    ),
    '2020-11-04'
  ),
  (
    2,
(
      SELECT
        id
      from
        animals
      where
        name = 'Boarmon'
    ),
    '2019-01-24'
  ),
  (
    2,
(
      SELECT
        id
      from
        animals
      where
        name = 'Boarmon'
    ),
    '2019-05-15'
  ),
  (
    2,
(
      SELECT
        id
      from
        animals
      where
        name = 'Boarmon'
    ),
    '2020-02-27'
  ),
  (
    2,
(
      SELECT
        id
      from
        animals
      where
        name = 'Boarmon'
    ),
    '2020-08-03'
  ),
  (
    3,
(
      SELECT
        id
      from
        animals
      where
        name = 'Blossom'
    ),
    '2020-05-24'
  ),
  (
    1,
(
      SELECT
        id
      from
        animals
      where
        name = 'Blossom'
    ),
    '2021-01-11'
  );

  INSERT INTO
  visits (animals_id, vets_id, visit_date)
SELECT
  *
FROM
  (
    SELECT
      id
    FROM
      animals
  ) animal_ids,
  (
    SELECT
      id
    FROM
      vets
  ) vets_ids,
  generate_series('1980-01-01' :: timestamp, '2021-01-01', '4 hours') visit_timestamp;

  insert into
  owners (full_name, email)
select
  'Owner ' || generate_series(1, 2500000),
  'owner_' || generate_series(1, 2500000) || '@mail.com';

  --  BEFORE CHANGES (indices) 
EXPLAIN ANALYZE
SELECT
  COUNT(*)
FROM
  visits
where
  animals_id = 4;

/* 1787 ms */
EXPLAIN ANALYZE
SELECT
  *
FROM
  visits
where
  vets_id = 2;

/* 600ms */
EXPLAIN ANALYZE
SELECT
  *
FROM
  owners
where
  email = 'owner_18327@mail.com';

/* 3000+ms */
-- after changes
EXPLAIN ANALYZE
SELECT
  COUNT(*)
FROM
  visits
where
  animals_id = 4;

/* 786ms */
EXPLAIN ANALYZE
SELECT
  *
FROM
  visits
where
  vets_id = 2;

/* 843ms */
EXPLAIN ANALYZE
SELECT
  *
FROM
  owners
where
  email = 'owner_18327@mail.com';

/* 0.076 ms */