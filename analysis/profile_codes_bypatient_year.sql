set search_path = analysis_all, omop_all, valuesets;

create table measure_period (
   start_date date,
   end_date date
);

insert into measure_period(start_date, end_date) values ('01-01-2015', '12-31-2015');

create table code_patient_frequency (
  concept_id integer,
  source_code text,
  unique_patients integer,
  source_table text
);

create table procedure_patient_frequency as
select procedure_concept_id, procedure_source_value, count(distinct(person_id)) unique_patients
from procedure_occurrence
join measure_period
on procedure_date >= measure_period.start_date and procedure_date <= measure_period.end_date
group by procedure_concept_id, procedure_source_value;

create index on procedure_patient_frequency(procedure_concept_id);

insert into code_patient_frequency (concept_id, source_code, unique_patients, source_table)
  select procedure_concept_id, procedure_source_value, unique_patients, 'procedure_occurrence' from procedure_patient_frequency;

create table condition_patient_frequency as
select condition_concept_id, condition_source_value, count(distinct(person_id)) unique_patients
from condition_occurrence
join measure_period
on condition_start_date >= measure_period.start_date and condition_start_date <= measure_period.end_date
group by condition_concept_id, condition_source_value;

create index on condition_patient_frequency(condition_concept_id);

insert into code_patient_frequency (concept_id, source_code, unique_patients, source_table)
  select condition_concept_id, condition_source_value, unique_patients, 'condition_occurrence' from condition_patient_frequency;

create table drug_patient_frequency as
select drug_concept_id, drug_source_value, count(distinct(person_id)) unique_patients
from drug_exposure
join measure_period
on drug_exposure_start_date >= measure_period.start_date and drug_exposure_start_date <= measure_period.end_date
group by drug_concept_id, drug_source_value;

create index on drug_patient_frequency(drug_concept_id);

insert into code_patient_frequency (concept_id, source_code, unique_patients, source_table)
  select drug_concept_id, drug_source_value, unique_patients, 'drug_exposure' from drug_patient_frequency;

create table observation_patient_frequency as
select observation_concept_id, observation_source_value, count(distinct(person_id)) unique_patients
from observation
join measure_period
on observation_date >= measure_period.start_date and observation_date <= measure_period.end_date
group by observation_concept_id, observation_source_value;

create index on observation_patient_frequency(observation_concept_id);

insert into code_patient_frequency (concept_id, source_code, unique_patients, source_table)
  select observation_concept_id, observation_source_value, unique_patients, 'observation' from observation_patient_frequency;


