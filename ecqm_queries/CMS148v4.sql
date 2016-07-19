set search_path = results;

CREATE TABLE results.measure_148_var_16 (
	hqmf_test_encounter_performed_patient_id INTEGER, 
	hqmf_test_encounter_performed_start_dt TIMESTAMP WITHOUT TIME ZONE, 
	hqmf_test_encounter_performed_end_dt TIMESTAMP WITHOUT TIME ZONE, 
	hqmf_test_encounter_performed_audit_key_value BIGINT, 
	row_number_1 INTEGER
)


;

INSERT INTO results.measure_148_var_16 (hqmf_test_encounter_performed_patient_id, hqmf_test_encounter_performed_start_dt, hqmf_test_encounter_performed_end_dt, hqmf_test_encounter_performed_audit_key_value, row_number_1)
SELECT ordinal_1.hqmf_test_encounter_performed_patient_id,
       ordinal_1.hqmf_test_encounter_performed_start_dt,
       ordinal_1.hqmf_test_encounter_performed_end_dt,
       ordinal_1.hqmf_test_encounter_performed_audit_key_value,
       ordinal_1.row_number_1
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value,
          CAST(row_number() OVER (PARTITION BY hqmf_test.encounter_performed.patient_id
                                  ORDER BY coalesce(hqmf_test.encounter_performed.start_dt, hqmf_test.encounter_performed.end_dt) DESC) AS INTEGER) AS row_number_1
   FROM hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.103.12.1012'
   WHERE (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.encounter_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
     AND hqmf_test.encounter_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS ordinal_1
WHERE ordinal_1.row_number_1 = 1
;

CREATE INDEX ix_measure_148_var_16_patient_id ON results.measure_148_var_16 (hqmf_test_encounter_performed_patient_id)
;


CREATE TABLE results.measure_148_patient_base (
	base_patient_id INTEGER, 
	hqmf_test_encounter_performed_audit_key_value BIGINT, 
	hqmf_test_encounter_performed_start_dt TIMESTAMP WITHOUT TIME ZONE, 
	hqmf_test_encounter_performed_end_dt TIMESTAMP WITHOUT TIME ZONE
)


;

INSERT INTO results.measure_148_patient_base (base_patient_id, hqmf_test_encounter_performed_audit_key_value, hqmf_test_encounter_performed_start_dt, hqmf_test_encounter_performed_end_dt)
SELECT base_patients.patient_id AS base_patient_id,
       results.measure_148_var_16.hqmf_test_encounter_performed_audit_key_value,
       results.measure_148_var_16.hqmf_test_encounter_performed_start_dt,
       results.measure_148_var_16.hqmf_test_encounter_performed_end_dt
FROM hqmf_test.patients AS base_patients
LEFT OUTER JOIN results.measure_148_var_16 ON results.measure_148_var_16.hqmf_test_encounter_performed_patient_id = base_patients.patient_id
;

CREATE INDEX ix_measure_148_patient_base_patient_id ON results.measure_148_patient_base (base_patient_id)
;

---found pcsection 0
create or replace view results.measure_148_0_all as SELECT results.measure_148_patient_base.base_patient_id,
       results.measure_148_patient_base.hqmf_test_encounter_performed_audit_key_value,
       results.measure_148_patient_base.hqmf_test_encounter_performed_start_dt,
       results.measure_148_patient_base.hqmf_test_encounter_performed_end_dt,

  (SELECT (EXISTS
             (SELECT anon_2.hqmf_test_patient_characteristic_birthdate_patient_id,
                     anon_2.hqmf_test_patient_characteristic_birthdate_start_dt,
                     anon_2.hqmf_test_patient_characteristic_birthdate_end_dt,
                     anon_2.hqmf_test_patient_characteristic_birthdate_audit_key_valu_1
              FROM
                (SELECT hqmf_test.patient_characteristic_birthdate.patient_id AS hqmf_test_patient_characteristic_birthdate_patient_id,
                        hqmf_test.patient_characteristic_birthdate.start_dt AS hqmf_test_patient_characteristic_birthdate_start_dt,
                        hqmf_test.patient_characteristic_birthdate.end_dt AS hqmf_test_patient_characteristic_birthdate_end_dt,
                        hqmf_test.patient_characteristic_birthdate.audit_key_value AS hqmf_test_patient_characteristic_birthdate_audit_key_valu_1
                 FROM hqmf_test.patient_characteristic_birthdate
                 JOIN
                 valuesets.individual_code_map AS individual_code_map_1 ON individual_code_map_1.code = hqmf_test.patient_characteristic_birthdate.code
                 AND individual_code_map_1.code_system_oid = '2.16.840.1.113883.6.1'
                 AND individual_code_map_1.measure_code = '21112-8'
                 WHERE hqmf_test.patient_characteristic_birthdate.patient_id = results.measure_148_patient_base.base_patient_id
                   AND (CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) IS NULL
                        OR CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) = false)
                   AND hqmf_test.patient_characteristic_birthdate.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                   AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 5) AS anon_2))
   AND (EXISTS
          (SELECT anon_3.hqmf_test_patient_characteristic_birthdate_patient_id,
                  anon_3.hqmf_test_patient_characteristic_birthdate_start_dt,
                  anon_3.hqmf_test_patient_characteristic_birthdate_end_dt,
                  anon_3.hqmf_test_patient_characteristic_birthdate_audit_key_valu_1
           FROM
             (SELECT hqmf_test.patient_characteristic_birthdate.patient_id AS hqmf_test_patient_characteristic_birthdate_patient_id,
                     hqmf_test.patient_characteristic_birthdate.start_dt AS hqmf_test_patient_characteristic_birthdate_start_dt,
                     hqmf_test.patient_characteristic_birthdate.end_dt AS hqmf_test_patient_characteristic_birthdate_end_dt,
                     hqmf_test.patient_characteristic_birthdate.audit_key_value AS hqmf_test_patient_characteristic_birthdate_audit_key_valu_1
              FROM hqmf_test.patient_characteristic_birthdate
              JOIN
              valuesets.individual_code_map AS individual_code_map_2 ON individual_code_map_2.code = hqmf_test.patient_characteristic_birthdate.code
              AND individual_code_map_2.code_system_oid = '2.16.840.1.113883.6.1'
              AND individual_code_map_2.measure_code = '21112-8'
              WHERE hqmf_test.patient_characteristic_birthdate.patient_id = results.measure_148_patient_base.base_patient_id
                AND (CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) = false)
                AND hqmf_test.patient_characteristic_birthdate.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
                AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) < 17) AS anon_3))
   AND (EXISTS
          (SELECT anon_4.hqmf_test_encounter_performed_patient_id,
                  anon_4.hqmf_test_encounter_performed_start_dt,
                  anon_4.hqmf_test_encounter_performed_end_dt,
                  anon_4.hqmf_test_encounter_performed_audit_key_value
           FROM
             (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
                     hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
                     hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
                     hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
              FROM results.measure_148_var_16,
                   hqmf_test.encounter_performed
              JOIN
              valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
              AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.103.12.1012'
              WHERE hqmf_test.encounter_performed.patient_id = results.measure_148_patient_base.base_patient_id
                AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)
                AND hqmf_test.encounter_performed.patient_id = results.measure_148_var_16.hqmf_test_encounter_performed_patient_id
                AND hqmf_test.encounter_performed.start_dt < results.measure_148_var_16.hqmf_test_encounter_performed_start_dt
                AND month_delta(hqmf_test.encounter_performed.start_dt, results.measure_148_var_16.hqmf_test_encounter_performed_start_dt) >= 12) AS anon_4))
   AND (EXISTS
          (SELECT anon_5.hqmf_test_diagnosis_active_patient_id,
                  anon_5.hqmf_test_diagnosis_active_start_dt,
                  anon_5.hqmf_test_diagnosis_active_end_dt,
                  anon_5.hqmf_test_diagnosis_active_audit_key_value
           FROM
             (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
                     hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
                     hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
                     hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
              FROM results.measure_148_var_16,
                   hqmf_test.diagnosis_active
              JOIN
              valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
              AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.103.12.1001'
              WHERE hqmf_test.diagnosis_active.patient_id = results.measure_148_patient_base.base_patient_id
                AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)
                AND hqmf_test.diagnosis_active.patient_id = results.measure_148_var_16.hqmf_test_encounter_performed_patient_id
                AND (hqmf_test.diagnosis_active.end_dt >= results.measure_148_var_16.hqmf_test_encounter_performed_start_dt
                     AND results.measure_148_var_16.hqmf_test_encounter_performed_end_dt >= hqmf_test.diagnosis_active.start_dt
                     OR hqmf_test.diagnosis_active.start_dt <= results.measure_148_var_16.hqmf_test_encounter_performed_end_dt
                     AND hqmf_test.diagnosis_active.end_dt IS NULL
                     OR results.measure_148_var_16.hqmf_test_encounter_performed_start_dt <= hqmf_test.diagnosis_active.end_dt
                     AND results.measure_148_var_16.hqmf_test_encounter_performed_end_dt IS NULL
                     OR hqmf_test.diagnosis_active.start_dt IS NULL
                     AND hqmf_test.diagnosis_active.end_dt IS NULL)) AS anon_5)) AS anon_1) AS "initialPopulation",

  (SELECT EXISTS
     (SELECT anon_6.hqmf_test_laboratory_test_performed_patient_id,
             anon_6.hqmf_test_laboratory_test_performed_start_dt,
             anon_6.hqmf_test_laboratory_test_performed_end_dt,
             anon_6.hqmf_test_laboratory_test_performed_audit_key_value
      FROM
        (SELECT hqmf_test.laboratory_test_performed.patient_id AS hqmf_test_laboratory_test_performed_patient_id,
                hqmf_test.laboratory_test_performed.start_dt AS hqmf_test_laboratory_test_performed_start_dt,
                hqmf_test.laboratory_test_performed.end_dt AS hqmf_test_laboratory_test_performed_end_dt,
                hqmf_test.laboratory_test_performed.audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value
         FROM hqmf_test.laboratory_test_performed
         JOIN
         valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.laboratory_test_performed.code
         AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.198.12.1013'
         WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_148_patient_base.base_patient_id
           AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
                OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
           AND hqmf_test.laboratory_test_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
           AND hqmf_test.laboratory_test_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
           AND hqmf_test.laboratory_test_performed.value IS NOT NULL) AS anon_6) AS xists) AS numerator
FROM results.measure_148_patient_base;

CREATE TABLE results.measure_148_0_patient_summary (
	patient_id INTEGER, 
	effective_ipp BOOLEAN, 
	effective_denom BOOLEAN, 
	effective_denex BOOLEAN, 
	effective_numer BOOLEAN, 
	effective_denexcep BOOLEAN
)


;

---window_colname is base_patient_id
INSERT INTO results.measure_148_0_patient_summary (patient_id, effective_ipp, effective_denom, effective_denex, effective_numer, effective_denexcep) SELECT DISTINCT anon_1.patient_id, anon_1.effective_ipp, anon_1.effective_denom, anon_1.effective_denex, anon_1.effective_numer, anon_1.effective_denexcep 
FROM (SELECT base_patient_id AS patient_id, "initialPopulation" AS effective_ipp, "initialPopulation" AS effective_denom, CAST(NULL AS BOOLEAN) AS effective_denex, "initialPopulation" AND numerator AS effective_numer, CAST(NULL AS BOOLEAN) AS effective_denexcep, rank() OVER (PARTITION BY base_patient_id ORDER BY ("initialPopulation" AND numerator) DESC, "initialPopulation" DESC) AS rank 
FROM results.measure_148_0_all 
WHERE "initialPopulation") AS anon_1 
WHERE anon_1.rank = 1
;


CREATE TABLE results.measure_148_0_event_summary (
	event_id INTEGER, 
	effective_ipp BOOLEAN, 
	effective_denom BOOLEAN, 
	effective_denex BOOLEAN, 
	effective_numer BOOLEAN, 
	effective_denexcep BOOLEAN
)


;

---window_colname is hqmf_test_encounter_performed_audit_key_value
INSERT INTO results.measure_148_0_event_summary (event_id, effective_ipp, effective_denom, effective_denex, effective_numer, effective_denexcep) SELECT DISTINCT anon_1.event_id, anon_1.effective_ipp, anon_1.effective_denom, anon_1.effective_denex, anon_1.effective_numer, anon_1.effective_denexcep 
FROM (SELECT hqmf_test_encounter_performed_audit_key_value AS event_id, "initialPopulation" AS effective_ipp, "initialPopulation" AS effective_denom, CAST(NULL AS BOOLEAN) AS effective_denex, "initialPopulation" AND numerator AS effective_numer, CAST(NULL AS BOOLEAN) AS effective_denexcep, rank() OVER (PARTITION BY hqmf_test_encounter_performed_audit_key_value ORDER BY ("initialPopulation" AND numerator) DESC, "initialPopulation" DESC) AS rank 
FROM results.measure_148_0_all 
WHERE "initialPopulation") AS anon_1 
WHERE anon_1.rank = 1
;

