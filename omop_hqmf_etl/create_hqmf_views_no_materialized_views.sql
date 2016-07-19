\ir defaults.sql
\i defaults.sql

\set birthdate_concept_id 3022007

create schema :hqmf_schema;
set search_path = :hqmf_schema, :omop_hqmf_additions_schema, :omop_schema, :omop_mapping_schema, :vocab_schema;

create type hqmf_omop_audit as (
   type_name text,
   key_value integer
);

create type qds_generic_event as (
   patient_id integer,
   start_dt timestamp,
   end_dt timestamp,
   audit_key_type text,
   audit_key_value bigint
);

create or replace view patients as select
   person_id as patient_id,
   NULL::timestamp as start_dt,
   NULL::timestamp as end_dt,
   NULL::integer as code,
   NULL::text as status,
   NULL::integer as negation,
   NULL::text as value,
   'person'::text as audit_key_type,
   person_id as audit_key_value
from person;

create or replace function unmapped_value(text) returns text as $$
DECLARE
   input_string alias for $1;
BEGIN
   return('unmapped value: '::text || input_string);
END
$$
LANGUAGE 'plpgsql' immutable;

create or replace function unmapped_numeric_value(text) returns numeric as $$
DECLARE
   input_string alias for $1;
BEGIN
   return(NULL::numeric);
END
$$
LANGUAGE 'plpgsql' immutable;

-- What we need is a code set that includes procedure/diagnosis codes that
-- indicate encounters; then we could take just that subset. But we don't
-- have that, so we'll make a huge table of all procedures and
-- all encounters.
create table encounter as select
   p.person_id as patient_id,
   p.visit_start_timestamp as start_dt,
   p.visit_end_timestamp as end_dt,
   p.procedure_concept_id as code,
   NULL::text as status,
   NULL::integer as negation,
   NULL::text as value,
   'procedure_occurrence'::text as audit_key_type,
   p.procedure_occurrence_id as audit_key_value,
   p.place_of_service_concept_id as FACILITY_LOCATION
from visit_procedure_view p
union all select
  v.person_id as patient_id,
  v.condition_start_timestamp as start_dt,
  v.condition_end_timestamp as end_dt,
  v.condition_concept_id as code,
  'active' as status,
  NULL::integer as negation,
  NULL::text as value,
  'condition_occurrence'::text as audit_key_type,
  v.condition_occurrence_id as audit_key_value,
  v.place_of_service_concept_id as FACILITY_LOCATION 
from visit_condition_view v;

create index encounter_patient_idx on encounter(patient_id);
create index encounter_start_dt_idx on encounter(start_dt);
create index encounter_end_dt_idx on encounter(end_dt);
create index encounter_code_idx on encounter(code);
cluster encounter using encounter_patient_idx;
analyze encounter;


create or replace view drug_view as select
  d.*,
  m.*
  from drug_exposure d left join med_status_map m on d.drug_type_concept_id = m.omop_concept_id;

create or replace view medication_view as select
  person_id as patient_id,
-- Uncomment if you've extended OMOP with start/end timestamp fields
--  drug_exposure_start_timestamp as start_dt,
--  drug_exposure_end_timestamp as end_dt,
-- Otherwise, use these:
  drug_exposure_start_date as start_dt,
  drug_exposure_end_date as end_dt,
  drug_concept_id as code,
  hqmf_status as status,
  NULL::integer as negation,
  NULL::text as value,
  'drug_exposure'::text as audit_key_type,
  drug_exposure_id as audit_key_value,
  days_supply * interval '1 day' as CUMULATIVE_MEDICATION_DURATION
from drug_view;

create or replace view medication_active as select * from medication_view where status = 'active';
create or replace view medication_administered as select * from medication_view where status = 'administered';
create or replace view medication_dispensed as select * from medication_view where status = 'dispensed';
create or replace view medication_order as select * from medication_view where status = 'ordered';

create or replace view diagnosis_view as select
  person_id as patient_id,
  condition_start_timestamp as start_dt,
  condition_end_timestamp as end_dt,
  condition_concept_id as code,
  'active'::text as status,
  NULL::integer as negation,
  NULL::text as value,
  'condition_occurrence'::text as audit_key_type,
  condition_occurrence_id as audit_key_value,
-- Severity is not modeled in OMOP. But it might be in the source data.
  NULL::integer as severity,					     
  unmapped_numeric_value('ORDINAL') as ordinal
from condition_occurrence;

create or replace view diagnosis_active as select * from diagnosis_view where status = 'active';
create or replace view diagnosis_inactive as select * from diagnosis_view where status = 'inactive';
create or replace view diagnosis_resolved as select * from diagnosis_view where status = 'resolved';

create or replace view procedure_view as select
  person_id as patient_id,
-- Uncomment if you've extended OMOP with start/end timestamp fields
--  procedure_timestamp as start_dt,
--  procedure_timestamp as end_dt,
-- Otherwise, use these:
  procedure_date as start_dt,
  procedure_date as end_dt,
  procedure_concept_id as code,
  'performed'::text as status,
  NULL::integer as negation,
  NULL::numeric as value,
  'procedure_occurrence'::text as audit_key_type,
  procedure_occurrence_id as audit_key_value,
  unmapped_numeric_value('REASON') as reason
from procedure_occurrence
-- Uncomment if you've extended OMOP with a table for procedures with negative statuses
-- union select
--   person_id as patient_id,
--   procedure_timestamp as start_dt,
--   procedure_timestamp as end_dt,
--   procedure_concept_id as code,
--   procedure_status as status,
--   NULL::integer as negation,
--   NULL::numeric as value,
--   'procedure_occurrence'::text as audit_key_type,
--   procedure_occurrence_id as audit_key_value,
--   unmapped_numeric_value('REASON') as reason
-- from non_performed_procedures
;

create table procedure_performed as select * from procedure_view where status in ('performed', 'null')
  union select patient_id, start_dt, end_dt, code, status, negation, null, audit_key_type, audit_key_value, unmapped_numeric_value('REASON') as reason from diagnosis_view;
create index procedure_performed_patient_idx on procedure_performed(patient_id);
create index procedure_performed_start_dt_idx on procedure_performed(start_dt);
create index procedure_performed_end_dt_idx on procedure_performed(end_dt);
create index procedure_performed_code_idx on procedure_performed(code);
cluster procedure_performed using procedure_performed_patient_idx;
analyze procedure_performed;


create or replace view diagnostic_study_performed as select * from procedure_view where status in ('performed', 'null');
create or replace view device_applied as select * from procedure_view where status in ('performed', 'null');
create or replace view communication as select * from procedure_view;

create table laboratory_test as select
  person_id as patient_id,
  observation_timestamp as start_dt,
  observation_timestamp as end_dt,
  observation_concept_id as code,
  NULL::text as status,
  NULL::integer as negation,
  case
    when observation_type_concept_id = :lab_observation_concept_code_concept_id
         then value_as_concept_id
    when observation_type_concept_id = :lab_observation_text_concept_id
         and value_as_number is null and value_as_concept_id is null
         and value_as_string is not null
         then (select concept_id from concept where concept_code = :lab_observation_unmapped_text_name)
    else coalesce(value_as_concept_id, value_as_number::numeric)
    end as value,
    'observation'::text as audit_key_type,
    observation_id as audit_key_value
from observation_view where value_as_number is not null or value_as_concept_id is not null
     or observation_type_concept_id in (select concept_id from lab_test_observation_types)
union select patient_id, start_dt, end_dt, code, status, negation, value, audit_key_type, audit_key_value from diagnostic_study_performed;

create index laboratory_test_patient_idx on laboratory_test(patient_id);
create index laboratory_test_start_dt_idx on laboratory_test(start_dt);
create index laboratory_test_end_dt_idx on laboratory_test(end_dt);
create index laboratory_test_code_idx on laboratory_test(code);
cluster laboratory_test using laboratory_test_patient_idx;
analyze laboratory_test;

create or replace view physical_exam as select * from laboratory_test;
create or replace view procedure_result as select * from laboratory_test;

create table diagnostic_study_result as select * from laboratory_test
union select patient_id, start_dt, end_dt, code, status, negation, null as value, audit_key_type, audit_key_value
from diagnosis_view;

create index diagnostic_study_result_patient_idx on diagnostic_study_result(patient_id);
create index diagnostic_study_result_start_dt_idx on diagnostic_study_result(start_dt);
create index diagnostic_study_result_end_dt_idx on diagnostic_study_result(end_dt);
create index diagnostic_study_result_code_idx on diagnostic_study_result(code);
cluster diagnostic_study_result using diagnostic_study_result_patient_idx;
analyze diagnostic_study_result;


create or replace view allergy as select
  person_id as patient_id,
  observation_timestamp as start_dt,
  null::timestamp as end_dt,
  observation_concept_id as code,
  NULL::text as status,
  NULL::integer as negation,
  null::numeric as value,
  'observation'::text as audit_key_type,
  observation_id as audit_key_value
from observation_view;

create or replace view device_intolerance as select * from allergy;
create or replace view procedure_intolerance as select * from allergy;

create or replace view risk_category_assessment as select * from procedure_view;

create table individual_characteristic as select
   person_id as patient_id,
   ydm_to_date(year_of_birth, month_of_birth, day_of_birth)::timestamp as start_dt,
   NULL::timestamp as end_dt,
   :birthdate_concept_id as code,
   NULL::text as status,
   NULL::integer as negation,
   NULL::text as value,
   'person'::text as audit_key_type,
   person_id as audit_key_value
from person
union select
   p.person_id as patient_id,
   ydm_to_date(p.year_of_birth, p.month_of_birth, p.day_of_birth)::timestamp as start_dt,
   NULL::timestamp as end_dt,
   p.gender_concept_id as code,
   NULL::text as status,
   NULL::integer as negation,
   c.concept_code as value,
   'person'::text as audit_key_type,
   person_id as audit_key_value
from person p join concept c on c.concept_id = p.gender_concept_id
union select
   person_id as patient_id,
   death_date::timestamp as start_dt,
   null::timestamp as end_dt,
   death_type_concept_id as code,
   null::text as status,
   null::integer as  negation,
   null::text as value,
   'death'::text as audit_key_type,
   person_id as audit_key_value
from death
union select distinct
   person_id as patient_id,
   condition_start_timestamp as start_dt,
   null::timestamp as end_dt,
   c.condition_concept_id as code,
   'active' as status,
   null::integer as negation,
   null::text as value,
   'condition_occurrence'::text as audit_key_type,
   condition_occurrence_id as audit_key_value
from condition_occurrence c join code_lists l on l.code = c.condition_concept_id
join value_sets vs on vs.value_set_oid = l.code_list_id
where vs.value_set_name ilike '%tobacco%' or vs.value_set_name ilike '%smok%';

create index individual_characteristic_patient_idx on individual_characteristic(patient_id);
create index individual_characteristic_start_dt_idx on individual_characteristic(start_dt);
create index individual_characteristic_end_dt_idx on individual_characteristic(end_dt);
create index individual_characteristic_code_idx on individual_characteristic(code);
cluster individual_characteristic using individual_characteristic_patient_idx;
analyze individual_characteristic;


-- kludge until data model is revamped
create view encounter_performed as select * from encounter ;
create view patient_characteristic_payer as select * from individual_characteristic;
create view patient_characteristic_gender as select * from individual_characteristic;
create view patient_characteristic_ethnicity as select * from individual_characteristic;
create view patient_characteristic_race as select * from individual_characteristic;
create view patient_characteristic_birthdate as select * from individual_characteristic;
create view patient_characteristic_expired as select * from individual_characteristic;
create view physical_exam_performed as select * from physical_exam;
create view procedure_ordered as select * from procedure_performed where status = 'ordered';
create view intervention_ordered as select * from procedure_ordered;
create view intervention_performed as select * from procedure_performed;
create view medication_ordered as select * from medication_order;
create view laboratory_test_performed as select * from laboratory_test;
create view medication_intolerance as select * from allergy;
create view medication_allergy as select * from allergy;
create view laboratory_test_ordered as select * from laboratory_test;
create view patient_characteristic as select * from individual_characteristic;
create view functional_status_result as select * from procedure_result;
create view diagnostic_study_ordered as select * from laboratory_test_ordered;

create view patient_characteristic_sex as select * from individual_characteristic;
create view diagnostic_study_order as select * from laboratory_test_ordered;

create view laboratory_test_order as select * from laboratory_test;
create view diagnosis_family_history as select * from diagnosis_active where false;
create view procedure_order as select * from procedure_performed where status = 'ordered';
create view patient_characteristic_clinical_trial_participant as select * from individual_characteristic;
create view functional_status_performed as select * from procedure_performed;
