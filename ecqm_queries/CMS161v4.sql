set search_path = results;

CREATE TABLE results.measure_161_conj_27 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_161_conj_27 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_20.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_20.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_20.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_20.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.526.3.1492'
   WHERE CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
     OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false) AS dc_20
UNION
SELECT dc_21.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_21.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_21.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_21.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.526.3.1496'
   WHERE CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
     OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false) AS dc_21
UNION
SELECT dc_22.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_22.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_22.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_22.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1010'
   WHERE CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
     OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false) AS dc_22
UNION
SELECT dc_23.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_23.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_23.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_23.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.encounter_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
     OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false) AS dc_23
UNION
SELECT dc_24.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_24.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_24.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_24.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.encounter_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1008'
   WHERE CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
     OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false) AS dc_24
UNION
SELECT dc_25.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_25.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_25.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_25.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.526.3.1141'
   WHERE CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
     OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false) AS dc_25
UNION
SELECT dc_26.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_26.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_26.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_26.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_7 ON code_lists_7.code = hqmf_test.encounter_performed.code
   AND code_lists_7.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
     OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false) AS dc_26
;

CREATE INDEX ix_measure_161_conj_27_patient_id ON results.measure_161_conj_27 (patient_id)
;


CREATE TABLE results.measure_161_so_target_22 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT, 
	row_number_15 INTEGER
)


;

INSERT INTO results.measure_161_so_target_22 (patient_id, start_dt, end_dt, audit_key_value, row_number_15)
SELECT results.measure_161_conj_27.patient_id,
       results.measure_161_conj_27.start_dt,
       results.measure_161_conj_27.end_dt,
       results.measure_161_conj_27.audit_key_value,
       CAST(row_number() OVER (PARTITION BY results.measure_161_conj_27.patient_id
                               ORDER BY coalesce(results.measure_161_conj_27.start_dt, results.measure_161_conj_27.end_dt)) AS INTEGER) AS row_number_15
FROM results.measure_161_conj_27
WHERE results.measure_161_conj_27.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
  AND results.measure_161_conj_27.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
;

CREATE INDEX ix_measure_161_so_target_22_patient_id ON results.measure_161_so_target_22 (patient_id)
;


CREATE TABLE results.measure_161_patient_base (
	base_patient_id INTEGER, 
	so_23_audit_key_value BIGINT, 
	so_23_start_dt TIMESTAMP WITHOUT TIME ZONE, 
	so_23_end_dt TIMESTAMP WITHOUT TIME ZONE
)


;

INSERT INTO results.measure_161_patient_base (base_patient_id, so_23_audit_key_value, so_23_start_dt, so_23_end_dt)
SELECT base_patients.patient_id AS base_patient_id,
       so_23.audit_key_value AS so_23_audit_key_value,
       so_23.start_dt AS so_23_start_dt,
       so_23.end_dt AS so_23_end_dt
FROM hqmf_test.patients AS base_patients
LEFT OUTER JOIN
  (SELECT results.measure_161_so_target_22.patient_id AS patient_id,
          results.measure_161_so_target_22.audit_key_value AS audit_key_value,
          results.measure_161_so_target_22.start_dt AS start_dt,
          results.measure_161_so_target_22.end_dt AS end_dt
   FROM results.measure_161_so_target_22) AS so_23 ON so_23.patient_id = base_patients.patient_id
;

CREATE INDEX ix_measure_161_patient_base_patient_id ON results.measure_161_patient_base (base_patient_id)
;

---found pcsection 0
create or replace view results.measure_161_0_all as SELECT results.measure_161_patient_base.base_patient_id,
       results.measure_161_patient_base.so_23_audit_key_value,
       results.measure_161_patient_base.so_23_start_dt,
       results.measure_161_patient_base.so_23_end_dt,

  (SELECT EXISTS
     (SELECT anon_1.hqmf_test_intervention_performed_patient_id,
             anon_1.hqmf_test_intervention_performed_start_dt,
             anon_1.hqmf_test_intervention_performed_end_dt,
             anon_1.hqmf_test_intervention_performed_audit_key_value
      FROM
        (SELECT hqmf_test.intervention_performed.patient_id AS hqmf_test_intervention_performed_patient_id,
                hqmf_test.intervention_performed.start_dt AS hqmf_test_intervention_performed_start_dt,
                hqmf_test.intervention_performed.end_dt AS hqmf_test_intervention_performed_end_dt,
                hqmf_test.intervention_performed.audit_key_value AS hqmf_test_intervention_performed_audit_key_value
         FROM
           (SELECT results.measure_161_so_target_22.patient_id AS patient_id,
                   results.measure_161_so_target_22.audit_key_value AS audit_key_value,
                   results.measure_161_so_target_22.start_dt AS start_dt,
                   results.measure_161_so_target_22.end_dt AS end_dt
            FROM results.measure_161_so_target_22) AS so_23,
              hqmf_test.intervention_performed
         JOIN
         valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.intervention_performed.code
         AND code_lists_1.code_list_id = '2.16.840.1.113883.3.526.3.1484'
         WHERE hqmf_test.intervention_performed.patient_id = results.measure_161_patient_base.base_patient_id
           AND (CAST(hqmf_test.intervention_performed.negation AS BOOLEAN) IS NULL
                OR CAST(hqmf_test.intervention_performed.negation AS BOOLEAN) = false)
           AND hqmf_test.intervention_performed.patient_id = so_23.patient_id
           AND hqmf_test.intervention_performed.start_dt >= results.measure_161_patient_base.so_23_start_dt
           AND hqmf_test.intervention_performed.end_dt <= results.measure_161_patient_base.so_23_end_dt) AS anon_1) AS xists) AS numerator,

  (SELECT (EXISTS
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
                 valuesets.individual_code_map AS individual_code_map_1 ON individual_code_map_1.code = hqmf_test.patient_characteristic_birthdate.code
                 AND individual_code_map_1.code_system_oid = '2.16.840.1.113883.6.1'
                 AND individual_code_map_1.measure_code = '21112-8'
                 WHERE hqmf_test.patient_characteristic_birthdate.patient_id = results.measure_161_patient_base.base_patient_id
                   AND (CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) IS NULL
                        OR CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) = false)
                   AND hqmf_test.patient_characteristic_birthdate.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                   AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 17) AS anon_3))
   AND (EXISTS
          (SELECT anon_4.hqmf_test_diagnosis_active_patient_id,
                  anon_4.hqmf_test_diagnosis_active_start_dt,
                  anon_4.hqmf_test_diagnosis_active_end_dt,
                  anon_4.hqmf_test_diagnosis_active_audit_key_value
           FROM
             (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
                     hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
                     hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
                     hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
              FROM
                (SELECT results.measure_161_so_target_22.patient_id AS patient_id,
                        results.measure_161_so_target_22.audit_key_value AS audit_key_value,
                        results.measure_161_so_target_22.start_dt AS start_dt,
                        results.measure_161_so_target_22.end_dt AS end_dt
                 FROM results.measure_161_so_target_22) AS so_23,
                   hqmf_test.diagnosis_active
              JOIN
              valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
              AND code_lists_2.code_list_id = '2.16.840.1.113883.3.526.3.1491'
              WHERE hqmf_test.diagnosis_active.patient_id = results.measure_161_patient_base.base_patient_id
                AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)
                AND hqmf_test.diagnosis_active.patient_id = so_23.patient_id
                AND hqmf_test.diagnosis_active.start_dt >= results.measure_161_patient_base.so_23_start_dt
                AND hqmf_test.diagnosis_active.start_dt <= results.measure_161_patient_base.so_23_end_dt) AS anon_4)) AS anon_2) AS "initialPopulation"
FROM results.measure_161_patient_base;

CREATE TABLE results.measure_161_0_patient_summary (
	patient_id INTEGER, 
	effective_ipp BOOLEAN, 
	effective_denom BOOLEAN, 
	effective_denex BOOLEAN, 
	effective_numer BOOLEAN, 
	effective_denexcep BOOLEAN
)


;

---window_colname is base_patient_id
INSERT INTO results.measure_161_0_patient_summary (patient_id, effective_ipp, effective_denom, effective_denex, effective_numer, effective_denexcep) SELECT DISTINCT anon_1.patient_id, anon_1.effective_ipp, anon_1.effective_denom, anon_1.effective_denex, anon_1.effective_numer, anon_1.effective_denexcep 
FROM (SELECT base_patient_id AS patient_id, "initialPopulation" AS effective_ipp, "initialPopulation" AS effective_denom, CAST(NULL AS BOOLEAN) AS effective_denex, "initialPopulation" AND numerator AS effective_numer, CAST(NULL AS BOOLEAN) AS effective_denexcep, rank() OVER (PARTITION BY base_patient_id ORDER BY ("initialPopulation" AND numerator) DESC, "initialPopulation" DESC) AS rank 
FROM results.measure_161_0_all 
WHERE "initialPopulation") AS anon_1 
WHERE anon_1.rank = 1
;


CREATE TABLE results.measure_161_0_event_summary (
	event_id INTEGER, 
	effective_ipp BOOLEAN, 
	effective_denom BOOLEAN, 
	effective_denex BOOLEAN, 
	effective_numer BOOLEAN, 
	effective_denexcep BOOLEAN
)


;

---window_colname is so_23_audit_key_value
INSERT INTO results.measure_161_0_event_summary (event_id, effective_ipp, effective_denom, effective_denex, effective_numer, effective_denexcep) SELECT DISTINCT anon_1.event_id, anon_1.effective_ipp, anon_1.effective_denom, anon_1.effective_denex, anon_1.effective_numer, anon_1.effective_denexcep 
FROM (SELECT so_23_audit_key_value AS event_id, "initialPopulation" AS effective_ipp, "initialPopulation" AS effective_denom, CAST(NULL AS BOOLEAN) AS effective_denex, "initialPopulation" AND numerator AS effective_numer, CAST(NULL AS BOOLEAN) AS effective_denexcep, rank() OVER (PARTITION BY so_23_audit_key_value ORDER BY ("initialPopulation" AND numerator) DESC, "initialPopulation" DESC) AS rank 
FROM results.measure_161_0_all 
WHERE "initialPopulation") AS anon_1 
WHERE anon_1.rank = 1
;

