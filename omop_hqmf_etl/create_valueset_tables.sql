\ir defaults.sql

create schema :valueset_schema;
set search_path = :valueset_schema;

create table value_sets (
    value_set_oid text primary key,
    value_set_name text not null,
    value_set_version text not null
);

comment on table value_sets is 'Value set names (from standard value set definitions)';

create table value_set_entries (
    value_set_entry_id serial primary key,
    value_set_oid text not null references value_sets(value_set_oid),
    code text not null,
    code_system text not null,
    code_system_name text not null,
    code_system_version text,
    display_name text,
    black_list text,
    white_list text,
    unique(value_set_oid, code_system, code)
);

create index value_set_entries_value_set_oid on value_set_entries(value_set_oid);
create index value_set_entries_code on value_set_entries(code);
create index value_set_entries_code_system_name_version_code on value_set_entries(code_system_name, code_system_version, code);
create index value_set_entries_code_system_version_code on value_set_entries(code_system, code_system_version, code);
create index value_set_entries_code_system_value_set_code on value_set_entries(code_system, value_set_oid, code);
cluster value_set_entries using value_set_entries_code_system_value_set_code;

comment on table value_set_entries is 'Value set entries (from standard value set definitions)';

create table vocabulary_map (
  hqmf_code_system_oid text not null,
  hqmf_code_system_name text not null,
  hqmf_code_system_version text,
  omop_vocabulary_id integer
);

create index vocabulary_map_hqmf_idx on vocabulary_map(hqmf_code_system_oid, hqmf_code_system_version);

comment on table vocabulary_map is 'Mapping of NLM value set OIDs to OMOP vocabulary IDs';
comment on column vocabulary_map.hqmf_code_system_oid is 'Code system OID; corresponds to the code_system column of value_set_entries';
comment on column vocabulary_map.hqmf_code_system_name is 'Code system name; used for display purposes only';
comment on column vocabulary_map.omop_vocabulary_id is 'OMOP vocabulary id';

create view unique_code_systems as select distinct code_system, code_system_name, code_system_version from value_set_entries;

create table lab_test_observation_types (
  concept_id integer not null primary key,
  concept_name text not null,
  concept_level integer not null,
  concept_class text not null,
  vocabulary_id integer not null,
  concept_code text not null,
  valid_start_date date,
  valid_end_date date,
  invalid_reason char(1)
  );

create view individual_code_map as
select
   '2.16.840.1.113883.6.1'::text code_system_oid,
   'LOINC'::text code_system,
   concept_code data_code,
   concept_code measure_code,
   concept_id code
   from :vocab_schema.concept
   where vocabulary_id = :loinc_vocabulary_id
union
select
   '2.16.840.1.113762.1.4.1'::text code_system_oid,
   'Administrative Sex'::text code_system,
   concept_code data_code,
   concept_code measure_code,
   concept_id code
   from :vocab_schema.concept
   where vocabulary_id = :administrative_sex_vocabulary_id
union
select
   '2.16.840.1.113883.6.96'::text code_system_oid,
   'SNOMED-CT'::text code_system,
   concept_code data_code,
   concept_code measure_code,
   concept_id code
   from :vocab_schema.concept
   where vocabulary_id = :snomed_vocabulary_id   
;

create or replace function ydm_to_date(numeric(4,0), numeric(2,0), numeric(2,0)) returns date as $$
DECLARE
   i_year alias for $1;
   i_month alias for $2;
   i_day alias for $3;
BEGIN
   if ((i_year is null) or (i_month is null) or (i_day is null)) then
      return null;
   end if;
   return cast (
      (cast (i_year as char(4)) || '-' ||
       cast (i_month as char(2)) || '-' ||
       cast (i_day as char(2))) as date);
END
$$
LANGUAGE 'plpgsql' immutable;
