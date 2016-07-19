Before starting: Create a database with OMOP data.

SECTION 1: PRELIMINARIES

Step 0 (optional): The tune_omop.sql file creates some indexes and does some clustering that at one point
seemed to make things go faster. If you want to, look it over and run some or all of it.

Note: tune_omop.sql tries to cluster the person table using its primary key index. 

Step 1: Edit the defaults.sql file to set values for variables (user names, schema names, etc.) that will
be used in the rest of the sql scripts.

:hqmfuser - the user you create to run hqmf stuff

:omop_schema - your omop schema

:omop_vocab_schema - the schema with all the OMOP vocabulary tables

:database - the database where all this stuff lives

:person_primary_key_index - the name of the existing primary key on your PERSON table. You can find it with something like:

hqmf=# \d omop_test.person
                  Table "omop_test.person"
         Column         |         Type          | Modifiers 
------------------------+-----------------------+-----------
 person_id              | integer               | not null
 gender_concept_id      | integer               | 
   ...
Indexes:
    "person_pk" PRIMARY KEY, btree (person_id)

If you don't have a primary key on your PERSON table, create one ("alter table person add primary key (person_id)").

You probably want to leave the rest of the settings as they are, but here are two more of interest:

:vocab_schema - the "vocabulary plus" schema. This contains additions
to the OMOP vocabulary (e.g., :vocab_plus.concept_extras has concept
codes for ICD-9 tables, and views that can be used as replacement for
the OMOP vocabulary tables (e.g., the concept view is the union of the
vanilla OMOP concept table and the concept_extras table).

:valueset_schema - the schema for HQMF value sets. This includes the table
that maps value set IDs to OMOP concept IDs.


Step 2: Create the HQMF user. This user will be able to read your OMOP
data and create schemas in your database:

psql -f create_hqmf_user.sql mydb

SECTION 2: CREATE VOCABULARY AND CODE SET TABLES

These steps create a bunch of database artifacts that represent codes
and value set mappings. You need to do this once at the beginning, and
again if you add or change value set definitions.

If you're feeling brave and impatient, then instead of running all the
individual sql scripts here, you can run:

   ./create-vocab-and-value-sets.sh -U hqmfuser mydb

where hqmfuser is the database user you created earlier, and mydb is
your database. Everything on the command line just gets passed as
arguments to psql, so you can put additional psql options there if you
want.

and skip everything from here until "SECTION 3: ETL YOUR ACTUAL DATA"

Step 3: Create the "vocabulary plus" schema (this is referred to as
:vocab_plus in all the scripts; we usually name it
vocabulary_plus). This schema extends the OMOP vocabulary tables. For
each table in the OMOP vocabulary schema, vocabulary_plus has an
"extras" table, which will include additions to the schema, and a view
that can be used in place of the original table in queries. For
example, there's a concept_extras table with custom concepts for ICD-9
codes (the standard OMOP vocabulary doesn't define these), and a
concept view that's the union of vocabulary_plus.concept_extras and
vocabulary.concept.

Note: depending on how you created your 4.5 vocabulary, you may or may not have drug_approval
and drug_strength tables. If you don't have them, you'll see some errors like:

  psql:create_vocabulary_plus.sql:10: ERROR:  relation "vocabulary.drug_approval" does not exist
  LINE 1: create table drug_approval_extras (like vocabulary.drug_appr...
                                                ^
which you can safely ignore.

psql -f create_vocabulary_plus.sql -U hqmfuser mydb
psql -f tune_vocabulary_plus.sql -U hqmfuser mydb
psql -f import_vocabulary_plus.sql -U hqmfuser mydb

Step 4: create the value set schema, which will contain the tables mapping concept ids to the
value sets that contain them. It also creates concept_extras entries for any codes (e.g., ICD-9 codes)
that don't have entries in the standard OMOP concept tables:

psql -f create_valueset_tables.sql -U hqmfuser mydb
psql -f import_value_sets.sql -U hqmfuser mydb
psql -f add_to_omop_vocabulary.sql -U hqmfuser mydb
psql -f create_valueset_omop_mappings.sql -U hqmfuser mydb
psql -f load_hl7_tables.sql -U hqmfuser mydb


SECTION 3: ETL YOUR ACTUAL DATA

This next bunch will create a schema (:hqmf_schema) for the HQMF-format
version of your data, and another (:omop_hqmf_additions_schema) for
data that's sort of halfway between OMOP and HQMF:

psql -f create_omop_views.sql -U hqmfuser mydb
psql -f create_hqmf_views.sql -U hqmfuser mydb

