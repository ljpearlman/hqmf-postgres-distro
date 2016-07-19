\ir defaults.sql

create schema :omop_hqmf_additions_schema;

set search_path = :omop_hqmf_additions_schema, :omop_schema, :omop_mapping_schema, :vocab_schema;

-- Terrible hacks

create or replace view :omop_hqmf_additions_schema.visit_occurrence as
   select visit_occurrence_id,
          person_id,
          visit_start_date,
          coalesce(visit_end_date, visit_start_date) visit_end_date,
          place_of_service_concept_id,
          care_site_id,
          place_of_service_source_value,
-- Uncomment if you've extended OMOP with start/end timestamp fields
--          visit_start_timestamp,
--          coalesce(visit_end_timestamp, visit_start_timestamp) visit_end_timestamp
-- Otherwise, use these:
          visit_start_date::timestamp visit_start_timestamp,
          coalesce(visit_end_date::timestamp, visit_start_date::timestamp) visit_end_timestamp
   from :omop_schema.visit_occurrence
   where visit_end_date is null or visit_end_date >= visit_start_date;

create or replace view :omop_hqmf_additions_schema.drug_exposure as
   select *
   from :omop_schema.drug_exposure
   where drug_exposure_end_date is null or drug_exposure_end_date >= drug_exposure_start_date;

create table icd9_map as
  select concept_code, min(concept_id) concept_id from concept
  where vocabulary_id = :icd9_cm_vocabulary_id
        and valid_start_date < now() and valid_end_date > now()
        and invalid_reason is null
  group by concept_code;

alter table icd9_map add primary key(concept_code);

insert into icd9_map (concept_code, concept_id) 
  select c.concept_code, min(c.concept_id) from concept c
  where c.vocabulary_id = :icd9_proc_vocabulary_id
        and c.valid_start_date < now() and c.valid_end_date > now()
        and c.invalid_reason is null
        and not exists (select 1 from icd9_map m where m.concept_code = c.concept_code)
  group by c.concept_code;

insert into icd9_map (concept_code, concept_id) 
  select c.concept_code, min(c.concept_id) from concept c
  where c.vocabulary_id in (:icd9_overflow_vocabulary_1, :icd9_overflow_vocabulary_2)
        and c.valid_start_date < now() and c.valid_end_date > now()
        and c.invalid_reason is null
        and not exists (select 1 from icd9_map m where m.concept_code = c.concept_code)
  group by c.concept_code;

create table :omop_hqmf_additions_schema.condition_occurrence as
  select o.condition_occurrence_id,
  o.person_id,
  case
    when m.concept_id is not null then m.concept_id
    else o.condition_concept_id
  end condition_concept_id,
  o.condition_start_date,
  o.condition_end_date,
  o.condition_type_concept_id,
  o.stop_reason,
  o.associated_provider_id,
  o.visit_occurrence_id,
  o.condition_source_value,
-- Uncomment if you have a condition_source_description field
--  o.condition_source_description,
-- Uncomment if you have actual timestamps
--  o.condition_start_timestamp,
--  o.condition_end_timestamp
-- Otherwise, use these:
  o.condition_start_date::timestamp as condition_start_timestamp,
  o.condition_end_date::timestamp as condition_end_timestamp
  from :omop_schema.condition_occurrence o
  left join icd9_map m on m.concept_code = o.condition_source_value;

create index co_person_id_visit_occurrence_id_co_id_idx 
   on condition_occurrence(person_id, visit_occurrence_id, condition_occurrence_id);
cluster condition_occurrence using co_person_id_visit_occurrence_id_co_id_idx;

create view observation_view as select
   observation_id,
   person_id,
   observation_concept_id,
   observation_date,
   observation_time,
   value_as_number,
   value_as_string,
   case
     when value_as_concept_id is null and value_as_number is null and value_as_string is not null then -1
     else value_as_concept_id
   end value_as_concept_id,
   unit_concept_id,
   range_low,
   range_high,
   observation_type_concept_id,
   associated_provider_id,
   visit_occurrence_id,
   relevant_condition_concept_id,
   observation_source_value,
-- Uncomment if you have this field  
--   units_source_value,
   (observation_date + observation_time) observation_timestamp,
   null::text status
   from observation
-- Uncomment the rest of this if you've extended OMOP to include a table of negative observations
-- union select
--    observation_id,
--    person_id,
--    observation_concept_id,
--    observation_date,
--    observation_time,
--    value_as_number,
--    value_as_string,
--    case
--      when value_as_concept_id is null and value_as_number is null and value_as_string is not null then -1
--      else value_as_concept_id
--    end value_as_concept_id,
--    unit_concept_id,
--    range_low,
--    range_high,
--    observation_type_concept_id,
--    associated_provider_id,
--    visit_occurrence_id,
--    relevant_condition_concept_id,
--    observation_source_value,
--    units_source_value,
--    provenance_id,
--    (observation_date + observation_time) observation_timestamp,
--    status
--    from unobserved_observations
;

create materialized view visit_condition_view as select
  v.*,
  c.condition_occurrence_id,
  c.person_id condition_person_id,
  c.condition_concept_id,
  c.condition_start_date,
  c.condition_end_date,
  c.condition_type_concept_id,
  c.stop_reason,
  c.associated_provider_id,
  c.condition_source_value,
-- Uncomment if you have this field
--  c.condition_source_description,
  c.condition_start_timestamp,
  c.condition_end_timestamp
from visit_occurrence v join condition_occurrence c on v.visit_occurrence_id = c.visit_occurrence_id
where c.condition_end_date is null or c.condition_end_date >= c.condition_start_date;

create index visit_condition_visit_idx on visit_condition_view(visit_occurrence_id);
create index visit_condition_start_timestamp_idx on visit_condition_view(visit_start_timestamp);
create index visit_condition_end_timestamp_idx on visit_condition_view(visit_end_timestamp);
create index visit_condition_person_idx on visit_condition_view(person_id);
create index visit_condition_person_visit_idx on visit_condition_view(person_id, visit_occurrence_id);
create index visit_condition_condition_idx on visit_condition_view(condition_concept_id);
cluster visit_condition_view using visit_condition_person_visit_idx;
analyze visit_condition_view;

create materialized view visit_procedure_view as select
  v.visit_occurrence_id,
  v.person_id,
  v.visit_start_date,
  v.visit_end_date,
  v.place_of_service_concept_id,
  v.care_site_id,
  v.place_of_service_source_value,
  v.visit_start_timestamp,
  v.visit_end_timestamp,
  p.procedure_concept_id,
-- Uncomment if you've extended OMOP with start/end timestamp fields
--  p.procedure_timestamp,
-- Otherwise, use this:
  p.procedure_date::timestamp procedure_timestamp,
  p.procedure_type_concept_id,
  p.associated_provider_id,
  p.relevant_condition_concept_id,
  p.procedure_source_value,
  p.procedure_occurrence_id
from procedure_occurrence p join visit_occurrence v on v.visit_occurrence_id = p.visit_occurrence_id;

create index visit_procedure_visit_idx on visit_procedure_view(visit_occurrence_id);
create index visit_procedure_start_timestamp_idx on visit_procedure_view(visit_start_timestamp);
create index visit_procedure_end_timestamp_idx on visit_procedure_view(visit_end_timestamp);
create index visit_procedure_person_idx on visit_procedure_view(person_id);
create index visit_procedure_person_visit_idx on visit_procedure_view(person_id, visit_occurrence_id);
create index visit_procedure_procedure_idx on visit_procedure_view(procedure_concept_id);
cluster visit_procedure_view using visit_procedure_person_visit_idx;
analyze visit_procedure_view;

create index condition_occurrence_condition_idx on condition_occurrence(condition_concept_id);
create index condition_occurrence_start_timestamp_idx on condition_occurrence(condition_start_timestamp);
create index condition_occurrence_end_timestamp_idx on condition_occurrence(condition_end_timestamp);

analyze condition_occurrence;
