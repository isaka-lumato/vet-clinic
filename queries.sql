-- Queries that provide answers to the questions from all project
select
  *
from
  animals
where
  name like '%mon';

select
  *
from
  animals
where
  date_of_birth between '2016-01-01'
  and '2019-12-31';

select
  *
from
  animals
where
  neutered = true
  and escape_attempts < 3;

select
  date_of_birth
from
  animals
where
  name = 'Agumon'
  or name = 'Pikachu';

select
  name,
  escape_attempts
from
  animals
where
  weight_kg > 10.5;

select
  *
from
  animals
where
  neutered = true;

select
  *
from
  animals
where
  name != 'Gabumon';

select
  *
from
  animals
where
  weight_kg between 10.4
  and 17.3;

select
  count(name)
from
  animals;

select
  count(*)
from
  animals
where
  escape_attempts = 0;

select
  AVG(weight_kg) as SUM
from
  animals;

select
  name
from
  animals
where
  escape_attempts =(
    select
      max(escape_attempts)
    from
      animals
  );

select
  species,
  min(weight_kg) as min,
  max(weight_kg) as max
from
  animals
group by
  species;

select
  species,
  avg(escape_attempts) as AVG
from
  animals
where
  date_of_birth between '1990-01-01'
  and '2000-12-31'
group by
  species;

-- jpining logic
select
  name
from
  animals
  join owners on animals.owner_id = owners.id
  and owners.full_name = 'Melody Pond';

select
  animals.name
from
  animals
  join species on animals.species_id = species.id
  and species.name = 'Pokemon';

select
  animals.name as animal_name,
  owners.full_name as owner
from
  animals
  right join owners on animals.owner_id = owners.id;

select
  count(animals.name) as number,
  species.name
from
  animals
  join species on animals.species_id = species.id
group by
  species.name;

select
  owners.full_name,
  species.name
from
  owners
  join animals on owners.id = animals.owner_id
  join species on species.id = 2
where
  animals.species_id = 2
  and owners.full_name = 'Jennifer Orwell';

select
  animals.name
from
  animals
  join owners on owners.id = animals.owner_id
  and owners.full_name = 'Dean Winchester'
  and animals.escape_attempts = 0;

-- Who owns the most animals
SELECT
  owners.full_name
FROM
  animals
  JOIN owners ON owners.id = animals.owners_id
GROUP BY
  owners.full_name
ORDER BY
  count(name) desc
limit
  1;

-- last seen animals by william
SELECT
  animals.name
FROM
  vets
  JOIN visits ON visits.vets_id = vets.id
  JOIN animals ON visits.animals_id = animals.id
WHERE
  vets.name = 'William Tatcher'
ORDER BY
  visit_date DESC
LIMIT
  1;

-- How many animals did stephanie see 
SELECT
  count(animals.name)
FROM
  vets
  JOIN visits ON visits.vets_id = vets.id
  JOIN animals ON visits.animals_id = animals.id
WHERE
  vets.name = 'Stephanie Mendez';

--  list vets and their speciality (including ones who hasn't
SELECT
  vets.name AS vet_name,
  species.name AS speciality
FROM
  vets
  LEFT JOIN specializations ON vets.id = specializations.vets_id
  LEFT JOIN species ON species.id = specializations.species_id;

--  animals that visisted stephanie between 01/04/2020 and 30/08/200
SELECT
  animals.name
FROM
  vets
  JOIN visits ON visits.vets_id = vets.id
  JOIN animals ON visits.animals_id = animals.id
WHERE
  vets.name = 'Stephanie Mendez'
  AND visits.visit_date BETWEEN '2020-04-01'
  AND '2020-08-30';

--  animal who had the most vists to vet
SELECT
  animals.name
FROM
  animals
  JOIN visits ON animals.id = visits.animals_id
GROUP BY
  animals.name
ORDER BY
  count(animals.name) DESC
LIMIT
  1;

--  first vist to mais
SELECT
  animals.name -- ,visits.visit_da
FROM
  vets
  JOIN visits ON visits.vets_id = vets.id
  JOIN animals ON visits.animals_id = animals.id
WHERE
  vets.name = 'Maisy Smith'
ORDER BY
  visit_date
LIMIT
  1;

--  details on latest visi
SELECT
  visits.visit_date AS latest_visit_date,
  animals.*,
  vets.name,
  vets.age,
  vets.date_of_graduation
FROM
  vets
  JOIN visits ON visits.vets_id = vets.id
  JOIN animals ON visits.animals_id = animals.id
ORDER BY
  visit_date DESC
LIMIT
  1;

--  visists with vet that has no specialit
SELECT
  count(animals.name) as no_spec_visit_count --  , vets.na
FROM
  vets
  JOIN visits ON visits.vets_id = vets.id
  JOIN animals ON visits.animals_id = animals.id
  LEFT JOIN specializations ON specializations.vets_id = vets.id
WHERE
  specializations.species_id IS NULL
GROUP BY
  vets.name;

--  Speciality that Maisy should take considering the amount of vists she h
SELECT
  species.name
FROM
  vets
  JOIN visits ON visits.vets_id = vets.id
  JOIN animals ON visits.animals_id = animals.id
  JOIN species ON animals.species_id = species.id
WHERE
  vets.name = 'Maisy Smith'
GROUP BY
  species.name
ORDER BY
  COUNT(species.name) DESC
LIMIT
  1;

--  analyze before performance optimization (indexing
EXPLAIN ANALYZE
SELECT
  COUNT(*)
FROM
  visits
where
  animals_id = 4;

--  1787m
EXPLAIN ANALYZE
SELECT
  *
FROM
  visits
where
  vets_id = 2;

--  600m
EXPLAIN ANALYZE
SELECT
  *
FROM
  owners
where
  email = 'owner_18327@mail.com';

--  3042 m