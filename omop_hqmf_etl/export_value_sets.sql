\ir defaults.sql
set search_path = :valueset_schema;

\copy (select value_set_oid,value_set_name,value_set_version from value_sets) to 'raw/value_sets.csv' with csv header
\copy (select value_set_oid,code,code_system,code_system_name,code_system_version,display_name,black_list,white_list from value_set_entries) to 'raw/value_set_entries.csv' with csv header
\copy (select hqmf_code_system_oid,hqmf_code_system_name,hqmf_code_system_version,omop_vocabulary_id from vocabulary_map) to 'raw/vocabulary_map.csv' with csv header
\copy (select concept_id,concept_name,concept_level,concept_class,vocabulary_id,concept_code,valid_start_date,valid_end_date,invalid_reason from lab_test_observation_types) to 'raw/lab_test_observation_types.csv' with csv header