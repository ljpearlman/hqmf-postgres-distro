This directory includes ETL (from OMOP) code and queries generated by hqmf2sql.

To prepare and run eCQM queries:

1. Create value set entries in your database (see the file omop_hqmf_etl/README for detailed step-by-step directions).

2. Create the schema "results" (where your results will be placed) and create a few date-related helper functions:

From within psql:
  `hqmf=> create schema results;`

Then:
  `psql -f omop_hqmf_etl/create_date_funcs.sql`

3  Run each of the SQL queries in the ecqm_queries directory. These assume that your QDM and results schemas were created with the default name (hqmf_test and results, respectively); i.e., that you didn't change them in step 1 above. The results will be stored in tables with names like results.measure_164_0_patient_summary.

This is all prototype code that has undergone some preliminary testing.
