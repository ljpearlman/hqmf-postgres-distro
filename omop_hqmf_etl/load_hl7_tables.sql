\ir defaults.sql

set search_path = :valueset_schema;


create table hl7_template_xref (
  template_id text,
  template_name text
);

\copy hl7_template_xref (template_id, template_name) from 'raw/hl7_template_xref.csv' with csv header