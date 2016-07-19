-- The name of the schema that has your vanilla OMOP vocabulary tables (vocabulary, concept, etc.):
\set omop_vocab_schema vocabulary

-- The name of the schema we will create to include vocabulary additions
\set vocab_schema vocabulary_plus

-- The name of the schema that holds your OMOP data tables (person, visit_occurence, etc.):
\set omop_schema omop_test

-- The HQMF database user. This user should have the ability to create new schemas, plus read-only
-- access to your OMOP data and vocabulary tables.
\set hqmfuser hqmfuser

-- The name of the database (used in a "GRANT CREATE ON DATABASE :database TO :hqmfuser")
\set database hqmf

-- The name of the existing PERSON table primary key index, if any (leave this at "person_pk" if your
-- PERSON table doesn't yet have a primary key)
\set person_primary_key_index person_pk

-- The name of the schema we will create to hold HQMF value set mappings
\set valueset_schema valuesets

-- The name of the schema that we will create to hold the HQMF version of your data
\set hqmf_schema hqmf_test

-- The name of the schema that will create to hold data in a format halfway between OMOP and HQMF.
\set omop_hqmf_additions_schema omop_hqmf_additions_test

-- We will define custom concepts with concept IDs starting
-- with hqmf_concept_id_start_value. If you define your own
-- custom concept IDs, change this to something high enough
-- that our concept ids will be guaranteed not to conflict
-- with yours.
\set hqmf_concept_id_start_value 1002000000

-- You probably shouldn't change anything below this line.

\set base_vocab_schema :omop_vocab_schema
\set hqmf_value_set_vocabulary_name '''hqmf value sets'''
\set hqmf_value_set_vocabulary_id 40000
\set hqmf_value_set_concept_class '''value set'''
\set hqmf_value_set_concept_level 2
\set hqmf_value_set_default_start_date '''1970-01-01'''
\set hqmf_relationship_default_start_date '''1970-01-01'''
\set lab_observation_numeric_concept_id 38000277
\set lab_observation_text_concept_id 38000278
\set lab_observation_concept_code_concept_id 38000279
\set lab_observation_recorded_from_ehr_concept_id 38000280
\set lab_observation_recorded_from_ehr_with_text_concept_id 38000281
\set icd9_overflow_vocabulary_name_1 '''hqmf_overflow_ICD-9-CM__5'''
\set icd9_overflow_vocabulary_name_2 '''hqmf_overflow_ICD-9-CM__6'''
\set icd9_cm_vocabulary_id 2
\set icd9_proc_vocabulary_id 3
\set icd9_overflow_vocabulary_1 40101
\set icd9_overflow_vocabulary_2 40110
\set cpt_vocabulary_id 4
\set hcpcs_vocabulary_id 5
\set snomed_vocabulary_id 1
\set relationship_subsumes 10
\set relationship_medra_to_snomed 125
\set relationship_indication_to_snomed 247
\set lab_observation_unmapped_text_name '''Unmapped text result'''
\set hqmf_miscellaneous_vocabulary_id 40113
\set hqmf_miscellaneous_vocabulary_name '''HQMF miscellaneous concepts'''
\set value_set_member_relationship_id 1000
\set value_set_member_relationship_name '''in value set (HQMF)'''
\set value_set_member_relationship_id_mapped 1001
\set value_set_member_relationship_name_mapped '''mapped value in value set (HQMF)'''
\set hqmf_overflow_concept_level 1
\set hqmf_overflow_concept_class '''hqmf mapped overflow concept'''
\set omop_mapping_schema :valueset_schema
\set loinc_vocabulary_id 6
\set administrative_sex_vocabulary_id 12
\set cvx_vocabulary_id 40127

