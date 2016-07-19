\ir defaults.sql
set search_path = :vocab_schema;

\copy relationship_extras(relationship_id,relationship_name,is_hierarchical,defines_ancestry,reverse_relationship) from 'raw/relationship_extras.csv' with csv header
\copy vocabulary_extras(vocabulary_id,vocabulary_name) from 'raw/vocabulary_extras.csv' with csv header
