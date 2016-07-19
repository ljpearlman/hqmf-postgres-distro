set search_path = analysis_all, omop_all, valuesets;

create table value_set_frequency (
  value_set_oid text,
  occurrences integer,
  source_table text
);

create table code_frequency (
  concept_id integer,
  occurrences integer,
  source_table text
);

create table procedure_frequency as
select procedure_concept_id, procedure_source_value, count(*) occurrences
from procedure_occurrence
group by procedure_concept_id, procedure_source_value;

create index on procedure_frequency(procedure_concept_id);

insert into code_frequency (concept_id, occurrences, source_table)
  select procedure_concept_id, occurrences, 'procedure_occurrence' from procedure_frequency;

insert into value_set_frequency
  select c.code_list_id,
  sum(f.occurrences),
  'procedure_occurrence'
from procedure_frequency f join code_lists c on f.procedure_concept_id = c.code
group by c.code_list_id;

create table condition_frequency as
select condition_concept_id, condition_source_value, count(*) occurrences
from condition_occurrence
group by condition_concept_id, condition_source_value;

create index on condition_frequency(condition_concept_id);

insert into code_frequency (concept_id, occurrences, source_table)
  select condition_concept_id, occurrences, 'condition_occurrence' from condition_frequency;

insert into value_set_frequency
  select c.code_list_id,
  sum(f.occurrences),
  'condition_occurrence'
from condition_frequency f join code_lists c on f.condition_concept_id = c.code
group by c.code_list_id;;

create table drug_frequency as
select drug_concept_id, drug_source_value, count(*) occurrences
from drug_exposure
group by drug_concept_id, drug_source_value;

create index on drug_frequency(drug_concept_id);

insert into code_frequency (concept_id, occurrences, source_table)
  select drug_concept_id, occurrences, 'drug_exposure' from drug_frequency;

insert into value_set_frequency
  select c.code_list_id,
  sum(f.occurrences),
  'drug_exposure'
from drug_frequency f join code_lists c on f.drug_concept_id = c.code
group by c.code_list_id;

create table observation_frequency as
select observation_concept_id, observation_source_value, count(*) occurrences
from observation
group by observation_concept_id, observation_source_value;

create index on observation_frequency(observation_concept_id);

insert into code_frequency (concept_id, occurrences, source_table)
  select observation_concept_id, occurrences, 'observation' from observation_frequency;

insert into value_set_frequency
  select c.code_list_id,
  sum(f.occurrences),
  'observation'
from observation_frequency f join code_lists c on f.observation_concept_id = c.code
group by c.code_list_id;
  
create or replace view value_set_summary as
  select v.value_set_oid, v.value_set_name, coalesce(sum(f.occurrences), 0) occurrences
  from value_sets v
  left join value_set_frequency f on f.value_set_oid = v.value_set_oid
  group by v.value_set_oid;
