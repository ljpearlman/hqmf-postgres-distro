\ir defaults.sql
set search_path = :vocab_schema;


\copy (select relationship_id,relationship_name,is_hierarchical,defines_ancestry,reverse_relationship from relationship_extras) to 'raw/relationship_extras.csv' with csv header
\copy (select vocabulary_id,vocabulary_name from vocabulary_extras) to 'raw/vocabulary_extras.csv' with csv header
\copy (select concept_id,concept_name,concept_level,concept_class,vocabulary_id,concept_code,valid_start_date,valid_end_date,invalid_reason from concept_extras) to 'raw/concept_extras.csv' with csv header
