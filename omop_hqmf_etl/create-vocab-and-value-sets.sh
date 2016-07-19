#!/bin/sh
usage="Usage: $0 [psql_options] ..."

cd `dirname $0`

psql -f create_vocabulary_plus.sql $*
psql -f tune_vocabulary_plus.sql $*
psql -f import_vocabulary_plus.sql $*
psql -f create_valueset_tables.sql $*
psql -f import_value_sets.sql $*
psql -f add_to_omop_vocabulary.sql $*
psql -f create_valueset_omop_mappings.sql $*
psql -f load_hl7_tables.sql $*

