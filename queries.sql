/*Queries that provide answers to the questions from all projects.*/
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