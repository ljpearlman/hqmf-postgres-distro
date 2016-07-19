set search_path = results;

CREATE TABLE results.measure_62_var_13 (
	hqmf_test_encounter_performed_patient_id INTEGER, 
	hqmf_test_encounter_performed_start_dt TIMESTAMP WITHOUT TIME ZONE, 
	hqmf_test_encounter_performed_end_dt TIMESTAMP WITHOUT TIME ZONE, 
	hqmf_test_encounter_performed_audit_key_value BIGINT
)


;

INSERT INTO results.measure_62_var_13 (hqmf_test_encounter_performed_patient_id, hqmf_test_encounter_performed_start_dt, hqmf_test_encounter_performed_end_dt, hqmf_test_encounter_performed_audit_key_value)
SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
       hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
       hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
       hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
FROM hqmf_test.encounter_performed
JOIN
valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1047'
WHERE (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
       OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)
  AND hqmf_test.encounter_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
  AND hqmf_test.encounter_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
;

CREATE INDEX ix_measure_62_var_13_patient_id ON results.measure_62_var_13 (hqmf_test_encounter_performed_patient_id)
;


CREATE TABLE results.measure_62_patient_base (
	base_patient_id INTEGER, 
	hqmf_test_encounter_performed_audit_key_value BIGINT, 
	hqmf_test_encounter_performed_start_dt TIMESTAMP WITHOUT TIME ZONE, 
	hqmf_test_encounter_performed_end_dt TIMESTAMP WITHOUT TIME ZONE
)


;

INSERT INTO results.measure_62_patient_base (base_patient_id, hqmf_test_encounter_performed_audit_key_value, hqmf_test_encounter_performed_start_dt, hqmf_test_encounter_performed_end_dt)
SELECT base_patients.patient_id AS base_patient_id,
       results.measure_62_var_13.hqmf_test_encounter_performed_audit_key_value,
       results.measure_62_var_13.hqmf_test_encounter_performed_start_dt,
       results.measure_62_var_13.hqmf_test_encounter_performed_end_dt
FROM hqmf_test.patients AS base_patients
LEFT OUTER JOIN results.measure_62_var_13 ON results.measure_62_var_13.hqmf_test_encounter_performed_patient_id = base_patients.patient_id
;

CREATE INDEX ix_measure_62_patient_base_patient_id ON results.measure_62_patient_base (base_patient_id)
;

---found pcsection 0

CREATE TABLE results.measure_62_conj_17 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_62_conj_17 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_15.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_15.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_15.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_15.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_62_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1047'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_62_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.encounter_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
     AND hqmf_test.encounter_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS dc_15 INTERSECT
SELECT dc_16.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_16.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_16.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_16.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_62_patient_base,

     (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
             hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
             hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
             hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
      FROM hqmf_test.encounter_performed
      JOIN
      valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
      AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1047'
      WHERE (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
             OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)
        AND hqmf_test.encounter_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
        AND hqmf_test.encounter_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS var_13,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1047'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_62_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.encounter_performed.patient_id = var_13.hqmf_test_encounter_performed_patient_id
     AND hqmf_test.encounter_performed.start_dt > var_13.hqmf_test_encounter_performed_end_dt
     AND day_delta(hqmf_test.encounter_performed.start_dt, var_13.hqmf_test_encounter_performed_end_dt) >= 90) AS dc_16
;

CREATE INDEX ix_measure_62_conj_17_patient_id ON results.measure_62_conj_17 (patient_id)
;


CREATE TABLE results.measure_62_conj_20 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_62_conj_20 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_18.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_18.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_18.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_18.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_62_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1047'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_62_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.encounter_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
     AND hqmf_test.encounter_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS dc_18 INTERSECT
SELECT dc_19.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_19.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_19.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_19.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_62_patient_base,

     (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
             hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
             hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
             hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
      FROM hqmf_test.encounter_performed
      JOIN
      valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
      AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1047'
      WHERE (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
             OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)
        AND hqmf_test.encounter_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
        AND hqmf_test.encounter_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS var_13,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1047'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_62_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.encounter_performed.patient_id = var_13.hqmf_test_encounter_performed_patient_id
     AND hqmf_test.encounter_performed.start_dt > var_13.hqmf_test_encounter_performed_end_dt
     AND day_delta(hqmf_test.encounter_performed.start_dt, var_13.hqmf_test_encounter_performed_end_dt) >= 90) AS dc_19
;

CREATE INDEX ix_measure_62_conj_20_patient_id ON results.measure_62_conj_20 (patient_id)
;

create or replace view results.measure_62_0_all as SELECT results.measure_62_patient_base.base_patient_id,
       results.measure_62_patient_base.hqmf_test_encounter_performed_audit_key_value,
       results.measure_62_patient_base.hqmf_test_encounter_performed_start_dt,
       results.measure_62_patient_base.hqmf_test_encounter_performed_end_dt,

  (SELECT (EXISTS
             (SELECT anon_2.hqmf_test_encounter_performed_patient_id,
                     anon_2.hqmf_test_encounter_performed_start_dt,
                     anon_2.hqmf_test_encounter_performed_end_dt,
                     anon_2.hqmf_test_encounter_performed_audit_key_value
              FROM
                (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
                        hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
                        hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
                        hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
                 FROM hqmf_test.encounter_performed
                 JOIN
                 valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
                 AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1047'
                 WHERE (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
                        OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)
                   AND hqmf_test.encounter_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                   AND hqmf_test.encounter_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_2))
   AND (EXISTS
          (SELECT anon_3.hqmf_test_diagnosis_active_patient_id,
                  anon_3.hqmf_test_diagnosis_active_start_dt,
                  anon_3.hqmf_test_diagnosis_active_end_dt,
                  anon_3.hqmf_test_diagnosis_active_audit_key_value
           FROM
             (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
                     hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
                     hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
                     hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
              FROM hqmf_test.diagnosis_active
              JOIN
              valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
              AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.120.12.1003'
              WHERE hqmf_test.diagnosis_active.patient_id = results.measure_62_patient_base.base_patient_id
                AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)
                AND hqmf_test.diagnosis_active.start_dt < CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_3)) AS anon_1) AS "initialPopulation",

  (SELECT EXISTS
     (SELECT anon_4.patient_id,
             anon_4.start_dt,
             anon_4.end_dt,
             anon_4.audit_key_value,
             anon_4.row_number_5
      FROM
        (SELECT results.measure_62_conj_20.patient_id AS patient_id,
                results.measure_62_conj_20.start_dt AS start_dt,
                results.measure_62_conj_20.end_dt AS end_dt,
                results.measure_62_conj_20.audit_key_value AS audit_key_value,
                CAST(row_number() OVER (PARTITION BY results.measure_62_conj_20.patient_id
                                        ORDER BY coalesce(results.measure_62_conj_20.start_dt, results.measure_62_conj_20.end_dt)) AS INTEGER) AS row_number_5
         FROM results.measure_62_conj_20
         WHERE results.measure_62_conj_20.patient_id = results.measure_62_patient_base.base_patient_id) AS anon_4) AS xists) AS numerator
FROM results.measure_62_patient_base;

CREATE TABLE results.measure_62_0_patient_summary (
	patient_id INTEGER, 
	effective_ipp BOOLEAN, 
	effective_denom BOOLEAN, 
	effective_denex BOOLEAN, 
	effective_numer BOOLEAN, 
	effective_denexcep BOOLEAN
)


;

---window_colname is base_patient_id
INSERT INTO results.measure_62_0_patient_summary (patient_id, effective_ipp, effective_denom, effective_denex, effective_numer, effective_denexcep) SELECT DISTINCT anon_1.patient_id, anon_1.effective_ipp, anon_1.effective_denom, anon_1.effective_denex, anon_1.effective_numer, anon_1.effective_denexcep 
FROM (SELECT base_patient_id AS patient_id, "initialPopulation" AS effective_ipp, "initialPopulation" AS effective_denom, CAST(NULL AS BOOLEAN) AS effective_denex, "initialPopulation" AND numerator AS effective_numer, CAST(NULL AS BOOLEAN) AS effective_denexcep, rank() OVER (PARTITION BY base_patient_id ORDER BY ("initialPopulation" AND numerator) DESC, "initialPopulation" DESC) AS rank 
FROM results.measure_62_0_all 
WHERE "initialPopulation") AS anon_1 
WHERE anon_1.rank = 1
;


CREATE TABLE results.measure_62_0_event_summary (
	event_id INTEGER, 
	effective_ipp BOOLEAN, 
	effective_denom BOOLEAN, 
	effective_denex BOOLEAN, 
	effective_numer BOOLEAN, 
	effective_denexcep BOOLEAN
)


;

---window_colname is hqmf_test_encounter_performed_audit_key_value
INSERT INTO results.measure_62_0_event_summary (event_id, effective_ipp, effective_denom, effective_denex, effective_numer, effective_denexcep) SELECT DISTINCT anon_1.event_id, anon_1.effective_ipp, anon_1.effective_denom, anon_1.effective_denex, anon_1.effective_numer, anon_1.effective_denexcep 
FROM (SELECT hqmf_test_encounter_performed_audit_key_value AS event_id, "initialPopulation" AS effective_ipp, "initialPopulation" AS effective_denom, CAST(NULL AS BOOLEAN) AS effective_denex, "initialPopulation" AND numerator AS effective_numer, CAST(NULL AS BOOLEAN) AS effective_denexcep, rank() OVER (PARTITION BY hqmf_test_encounter_performed_audit_key_value ORDER BY ("initialPopulation" AND numerator) DESC, "initialPopulation" DESC) AS rank 
FROM results.measure_62_0_all 
WHERE "initialPopulation") AS anon_1 
WHERE anon_1.rank = 1
;

