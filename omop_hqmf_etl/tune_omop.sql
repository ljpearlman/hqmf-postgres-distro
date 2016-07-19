\ir defaults.sql
set search_path = :omop_schema;

cluster person using :person_primary_key_index;
analyze person;

create index visit_occurrence_person_id_visit_occurrence_id_idx on visit_occurrence(person_id, visit_occurrence_id);
cluster visit_occurrence using visit_occurrence_person_id_visit_occurrence_id_idx;
create index visit_occurrence_start_timestamp_idx on visit_occurrence(visit_start_timestamp);
create index visit_occurrence_end_timestamp_idx on visit_occurrence(visit_end_timestamp);
analyze visit_occurrence;

create index drug_exposure_person_id_visit_occurrence_id_idx on drug_exposure(person_id, visit_occurrence_id);
cluster drug_exposure using drug_exposure_person_id_visit_occurrence_id_idx;
create index drug_exposure_start_timestamp_idx on drug_exposure(drug_exposure_start_timestamp);
create index drug_exposure_end_timestamp_idx on drug_exposure(drug_exposure_end_timestamp);
create index drug_exposure_drug_idx on drug_exposure(drug_concept_id);
analyze drug_exposure;

create index procedure_occurrence_person_id_idx on procedure_occurrence(person_id);
create index procedure_occurrence_person_id_visit_occurrence_id_idx on procedure_occurrence(person_id, visit_occurrence_id);
cluster procedure_occurrence using procedure_occurrence_person_id_visit_occurrence_id_idx;
create index procedure_occurrence_procedure_idx on procedure_occurrence(procedure_concept_id);
create index procedure_occurrence_visit_idx on procedure_occurrence(visit_occurrence_id);
analyze procedure_occurrence;

cluster death using death_pk;
analyze death;

create index observation_person_id_idx on observation(person_id);
create index observation_visit_occurrence_id_idx on observation(visit_occurrence_id);
create index observation_person_visit_id_idx on observation(person_id, visit_occurrence_id);
create index observation_observation_concept_id_idx on observation(observation_concept_id);
create index observation_value_as_number_not_null_idx on observation(person_id) where value_as_number is not null;
cluster observation using observation_person_visit_id_idx;
analyze observation;



