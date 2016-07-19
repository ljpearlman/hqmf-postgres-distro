set search_path = results;

CREATE TABLE results.measure_158_conj_23 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_158_conj_23 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_20.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_20.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_20.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_20.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT ordinal_1.hqmf_test_procedure_performed_patient_id AS hqmf_test_procedure_performed_patient_id,
          ordinal_1.hqmf_test_procedure_performed_start_dt AS hqmf_test_procedure_performed_start_dt,
          ordinal_1.hqmf_test_procedure_performed_end_dt AS hqmf_test_procedure_performed_end_dt,
          ordinal_1.hqmf_test_procedure_performed_audit_key_value AS hqmf_test_procedure_performed_audit_key_value,
          ordinal_1.row_number_15 AS row_number_15
   FROM
     (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
             hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
             hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
             hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value,
             CAST(row_number() OVER (PARTITION BY hqmf_test.procedure_performed.patient_id
                                     ORDER BY coalesce(hqmf_test.procedure_performed.start_dt, hqmf_test.procedure_performed.end_dt) DESC) AS INTEGER) AS row_number_15
      FROM hqmf_test.procedure_performed
      JOIN
      valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.procedure_performed.code
      AND code_lists_1.code_list_id = '2.16.840.1.113762.1.4.1078.5'
      WHERE (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
             OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)
        AND hqmf_test.procedure_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
        AND hqmf_test.procedure_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS ordinal_1
   WHERE ordinal_1.row_number_15 = 1) AS dc_20 INTERSECT
SELECT dc_21.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_21.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_21.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_21.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM
     (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
             hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
             hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
             hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
      FROM hqmf_test.diagnosis_active
      JOIN
      valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
      AND code_lists_2.code_list_id = '2.16.840.1.113883.3.67.1.101.1.278'
      WHERE CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
        OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false) AS dc_22,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.procedure_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113762.1.4.1078.5'
   WHERE (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.procedure_performed.patient_id = dc_22.hqmf_test_diagnosis_active_patient_id
     AND (hqmf_test.procedure_performed.end_dt >= dc_22.hqmf_test_diagnosis_active_start_dt
          AND dc_22.hqmf_test_diagnosis_active_end_dt >= hqmf_test.procedure_performed.start_dt
          OR hqmf_test.procedure_performed.start_dt <= dc_22.hqmf_test_diagnosis_active_end_dt
          AND hqmf_test.procedure_performed.end_dt IS NULL
          OR dc_22.hqmf_test_diagnosis_active_start_dt <= hqmf_test.procedure_performed.end_dt
          AND dc_22.hqmf_test_diagnosis_active_end_dt IS NULL
          OR hqmf_test.procedure_performed.start_dt IS NULL
          AND hqmf_test.procedure_performed.end_dt IS NULL)) AS dc_21
;

CREATE INDEX ix_measure_158_conj_23_patient_id ON results.measure_158_conj_23 (patient_id)
;


CREATE TABLE results.measure_158_var_35 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT, 
	row_number_11 INTEGER
)


;

INSERT INTO results.measure_158_var_35 (patient_id, start_dt, end_dt, audit_key_value, row_number_11)
SELECT results.measure_158_conj_23.patient_id,
       results.measure_158_conj_23.start_dt,
       results.measure_158_conj_23.end_dt,
       results.measure_158_conj_23.audit_key_value,
       CAST(row_number() OVER (PARTITION BY results.measure_158_conj_23.patient_id
                               ORDER BY coalesce(results.measure_158_conj_23.start_dt, results.measure_158_conj_23.end_dt)) AS INTEGER) AS row_number_11
FROM results.measure_158_conj_23
;

CREATE INDEX ix_measure_158_var_35_patient_id ON results.measure_158_var_35 (patient_id)
;


CREATE TABLE results.measure_158_patient_base (
	base_patient_id INTEGER, 
	audit_key_value BIGINT, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE
)


;

INSERT INTO results.measure_158_patient_base (base_patient_id, audit_key_value, start_dt, end_dt)
SELECT base_patients.patient_id AS base_patient_id,
       results.measure_158_var_35.audit_key_value,
       results.measure_158_var_35.start_dt,
       results.measure_158_var_35.end_dt
FROM hqmf_test.patients AS base_patients
LEFT OUTER JOIN results.measure_158_var_35 ON results.measure_158_var_35.patient_id = base_patients.patient_id
;

CREATE INDEX ix_measure_158_patient_base_patient_id ON results.measure_158_patient_base (base_patient_id)
;

---found pcsection 0

CREATE TABLE results.measure_158_conj_27 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_158_conj_27 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_24.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_24.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_24.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_24.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT ordinal_1.hqmf_test_procedure_performed_patient_id AS hqmf_test_procedure_performed_patient_id,
          ordinal_1.hqmf_test_procedure_performed_start_dt AS hqmf_test_procedure_performed_start_dt,
          ordinal_1.hqmf_test_procedure_performed_end_dt AS hqmf_test_procedure_performed_end_dt,
          ordinal_1.hqmf_test_procedure_performed_audit_key_value AS hqmf_test_procedure_performed_audit_key_value,
          ordinal_1.row_number_15 AS row_number_15
   FROM
     (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
             hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
             hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
             hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value,
             CAST(row_number() OVER (PARTITION BY hqmf_test.procedure_performed.patient_id
                                     ORDER BY coalesce(hqmf_test.procedure_performed.start_dt, hqmf_test.procedure_performed.end_dt) DESC) AS INTEGER) AS row_number_15
      FROM results.measure_158_patient_base,
           hqmf_test.procedure_performed
      JOIN
      valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.procedure_performed.code
      AND code_lists_1.code_list_id = '2.16.840.1.113762.1.4.1078.5'
      WHERE hqmf_test.procedure_performed.patient_id = results.measure_158_patient_base.base_patient_id
        AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
             OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)
        AND hqmf_test.procedure_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
        AND hqmf_test.procedure_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS ordinal_1
   WHERE ordinal_1.row_number_15 = 1) AS dc_24 INTERSECT
SELECT dc_25.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_25.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_25.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_25.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_158_patient_base,

     (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
             hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
             hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
             hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
      FROM results.measure_158_patient_base,
           hqmf_test.diagnosis_active
      JOIN
      valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
      AND code_lists_2.code_list_id = '2.16.840.1.113883.3.67.1.101.1.278'
      WHERE hqmf_test.diagnosis_active.patient_id = results.measure_158_patient_base.base_patient_id
        AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
             OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_26,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.procedure_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113762.1.4.1078.5'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_158_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.procedure_performed.patient_id = dc_26.hqmf_test_diagnosis_active_patient_id
     AND (hqmf_test.procedure_performed.end_dt >= dc_26.hqmf_test_diagnosis_active_start_dt
          AND dc_26.hqmf_test_diagnosis_active_end_dt >= hqmf_test.procedure_performed.start_dt
          OR hqmf_test.procedure_performed.start_dt <= dc_26.hqmf_test_diagnosis_active_end_dt
          AND hqmf_test.procedure_performed.end_dt IS NULL
          OR dc_26.hqmf_test_diagnosis_active_start_dt <= hqmf_test.procedure_performed.end_dt
          AND dc_26.hqmf_test_diagnosis_active_end_dt IS NULL
          OR hqmf_test.procedure_performed.start_dt IS NULL
          AND hqmf_test.procedure_performed.end_dt IS NULL)) AS dc_25
;

CREATE INDEX ix_measure_158_conj_27_patient_id ON results.measure_158_conj_27 (patient_id)
;


CREATE TABLE results.measure_158_conj_34 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_158_conj_34 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_32.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_32.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_32.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_32.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_158_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.diagnosis_active.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.67.1.101.1.269'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_158_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_32
UNION
SELECT dc_33.hqmf_test_diagnosis_inactive_patient_id AS patient_id,
       dc_33.hqmf_test_diagnosis_inactive_start_dt AS start_dt,
       dc_33.hqmf_test_diagnosis_inactive_end_dt AS end_dt,
       dc_33.hqmf_test_diagnosis_inactive_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_inactive.patient_id AS hqmf_test_diagnosis_inactive_patient_id,
          hqmf_test.diagnosis_inactive.start_dt AS hqmf_test_diagnosis_inactive_start_dt,
          hqmf_test.diagnosis_inactive.end_dt AS hqmf_test_diagnosis_inactive_end_dt,
          hqmf_test.diagnosis_inactive.audit_key_value AS hqmf_test_diagnosis_inactive_audit_key_value
   FROM results.measure_158_patient_base,
        hqmf_test.diagnosis_inactive
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_inactive.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.67.1.101.1.269'
   WHERE hqmf_test.diagnosis_inactive.patient_id = results.measure_158_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_inactive.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_inactive.negation AS BOOLEAN) = false)) AS dc_33
;

CREATE INDEX ix_measure_158_conj_34_patient_id ON results.measure_158_conj_34 (patient_id)
;


CREATE TABLE results.measure_158_conj_37 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_158_conj_37 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_35.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_35.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_35.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_35.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_158_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.diagnosis_active.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.67.1.101.1.269'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_158_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_35
UNION
SELECT dc_36.hqmf_test_diagnosis_inactive_patient_id AS patient_id,
       dc_36.hqmf_test_diagnosis_inactive_start_dt AS start_dt,
       dc_36.hqmf_test_diagnosis_inactive_end_dt AS end_dt,
       dc_36.hqmf_test_diagnosis_inactive_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_inactive.patient_id AS hqmf_test_diagnosis_inactive_patient_id,
          hqmf_test.diagnosis_inactive.start_dt AS hqmf_test_diagnosis_inactive_start_dt,
          hqmf_test.diagnosis_inactive.end_dt AS hqmf_test_diagnosis_inactive_end_dt,
          hqmf_test.diagnosis_inactive.audit_key_value AS hqmf_test_diagnosis_inactive_audit_key_value
   FROM results.measure_158_patient_base,
        hqmf_test.diagnosis_inactive
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_inactive.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.67.1.101.1.269'
   WHERE hqmf_test.diagnosis_inactive.patient_id = results.measure_158_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_inactive.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_inactive.negation AS BOOLEAN) = false)) AS dc_36
;

CREATE INDEX ix_measure_158_conj_37_patient_id ON results.measure_158_conj_37 (patient_id)
;

create or replace view results.measure_158_0_all as SELECT results.measure_158_patient_base.base_patient_id,
       results.measure_158_patient_base.audit_key_value,
       results.measure_158_patient_base.start_dt,
       results.measure_158_patient_base.end_dt,

  (SELECT (EXISTS
             (SELECT anon_2.patient_id,
                     anon_2.start_dt,
                     anon_2.end_dt,
                     anon_2.audit_key_value,
                     anon_2.row_number_11
              FROM
                (SELECT results.measure_158_conj_27.patient_id AS patient_id,
                        results.measure_158_conj_27.start_dt AS start_dt,
                        results.measure_158_conj_27.end_dt AS end_dt,
                        results.measure_158_conj_27.audit_key_value AS audit_key_value,
                        CAST(row_number() OVER (PARTITION BY results.measure_158_conj_27.patient_id
                                                ORDER BY coalesce(results.measure_158_conj_27.start_dt, results.measure_158_conj_27.end_dt)) AS INTEGER) AS row_number_11
                 FROM results.measure_158_conj_27
                 WHERE results.measure_158_conj_27.patient_id = results.measure_158_patient_base.base_patient_id) AS anon_2))
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
              valuesets.individual_code_map AS individual_code_map_1 ON individual_code_map_1.code = hqmf_test.patient_characteristic_birthdate.code
              AND individual_code_map_1.code_system_oid = '2.16.840.1.113883.6.1'
              AND individual_code_map_1.measure_code = '21112-8'
              WHERE hqmf_test.patient_characteristic_birthdate.patient_id = results.measure_158_patient_base.base_patient_id
                AND (CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) = false)
                AND hqmf_test.patient_characteristic_birthdate.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 12) AS anon_3))
   AND (EXISTS
          (SELECT anon_4.hqmf_test_patient_characteristic_sex_patient_id,
                  anon_4.hqmf_test_patient_characteristic_sex_start_dt,
                  anon_4.hqmf_test_patient_characteristic_sex_end_dt,
                  anon_4.hqmf_test_patient_characteristic_sex_audit_key_value
           FROM
             (SELECT hqmf_test.patient_characteristic_sex.patient_id AS hqmf_test_patient_characteristic_sex_patient_id,
                     hqmf_test.patient_characteristic_sex.start_dt AS hqmf_test_patient_characteristic_sex_start_dt,
                     hqmf_test.patient_characteristic_sex.end_dt AS hqmf_test_patient_characteristic_sex_end_dt,
                     hqmf_test.patient_characteristic_sex.audit_key_value AS hqmf_test_patient_characteristic_sex_audit_key_value
              FROM hqmf_test.patient_characteristic_sex
              JOIN
              valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.patient_characteristic_sex.code
              AND code_lists_1.code_list_id = '2.16.840.1.113883.3.560.100.2'
              WHERE hqmf_test.patient_characteristic_sex.patient_id = results.measure_158_patient_base.base_patient_id
                AND (CAST(hqmf_test.patient_characteristic_sex.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.patient_characteristic_sex.negation AS BOOLEAN) = false)) AS anon_4)) AS anon_1) AS "initialPopulation",

  (SELECT EXISTS
     (SELECT anon_5.hqmf_test_laboratory_test_performed_patient_id,
             anon_5.hqmf_test_laboratory_test_performed_start_dt,
             anon_5.hqmf_test_laboratory_test_performed_end_dt,
             anon_5.hqmf_test_laboratory_test_performed_audit_key_value
      FROM
        (SELECT hqmf_test.laboratory_test_performed.patient_id AS hqmf_test_laboratory_test_performed_patient_id,
                hqmf_test.laboratory_test_performed.start_dt AS hqmf_test_laboratory_test_performed_start_dt,
                hqmf_test.laboratory_test_performed.end_dt AS hqmf_test_laboratory_test_performed_end_dt,
                hqmf_test.laboratory_test_performed.audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value
         FROM
           (SELECT results.measure_158_conj_27.patient_id AS patient_id,
                   results.measure_158_conj_27.start_dt AS start_dt,
                   results.measure_158_conj_27.end_dt AS end_dt,
                   results.measure_158_conj_27.audit_key_value AS audit_key_value,
                   CAST(row_number() OVER (PARTITION BY results.measure_158_conj_27.patient_id
                                           ORDER BY coalesce(results.measure_158_conj_27.start_dt, results.measure_158_conj_27.end_dt)) AS INTEGER) AS row_number_11
            FROM results.measure_158_conj_27
            WHERE results.measure_158_conj_27.patient_id = results.measure_158_patient_base.base_patient_id) AS var_35,
              hqmf_test.laboratory_test_performed
         JOIN
         valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.laboratory_test_performed.code
         AND code_lists_2.code_list_id = '2.16.840.1.113883.3.67.1.101.1.279'
         WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_158_patient_base.base_patient_id
           AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
                OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
           AND hqmf_test.laboratory_test_performed.patient_id = var_35.patient_id
           AND hqmf_test.laboratory_test_performed.start_dt < var_35.start_dt
           AND day_delta(hqmf_test.laboratory_test_performed.start_dt, var_35.start_dt) >= 0
           AND day_delta(hqmf_test.laboratory_test_performed.start_dt, var_35.start_dt) <= 280) AS anon_5) AS xists) AS numerator,

  (SELECT EXISTS
     (SELECT anon_6.patient_id,
             anon_6.start_dt,
             anon_6.end_dt,
             anon_6.audit_key_value,
             anon_6.row_number_1
      FROM
        (SELECT results.measure_158_conj_37.patient_id AS patient_id,
                results.measure_158_conj_37.start_dt AS start_dt,
                results.measure_158_conj_37.end_dt AS end_dt,
                results.measure_158_conj_37.audit_key_value AS audit_key_value,
                CAST(row_number() OVER (PARTITION BY results.measure_158_conj_37.patient_id
                                        ORDER BY coalesce(results.measure_158_conj_37.start_dt, results.measure_158_conj_37.end_dt)) AS INTEGER) AS row_number_1
         FROM results.measure_158_conj_37,

           (SELECT results.measure_158_conj_27.patient_id AS patient_id,
                   results.measure_158_conj_27.start_dt AS start_dt,
                   results.measure_158_conj_27.end_dt AS end_dt,
                   results.measure_158_conj_27.audit_key_value AS audit_key_value,
                   CAST(row_number() OVER (PARTITION BY results.measure_158_conj_27.patient_id
                                           ORDER BY coalesce(results.measure_158_conj_27.start_dt, results.measure_158_conj_27.end_dt)) AS INTEGER) AS row_number_11
            FROM results.measure_158_conj_27
            WHERE results.measure_158_conj_27.patient_id = results.measure_158_patient_base.base_patient_id) AS var_35
         WHERE results.measure_158_conj_37.patient_id = results.measure_158_patient_base.base_patient_id
           AND results.measure_158_conj_37.patient_id = var_35.patient_id
           AND results.measure_158_conj_37.start_dt < var_35.start_dt
           AND day_delta(results.measure_158_conj_37.start_dt, var_35.start_dt) >= 0
           AND day_delta(results.measure_158_conj_37.start_dt, var_35.start_dt) <= 365) AS anon_6) AS xists) AS "denominatorExceptions"
FROM results.measure_158_patient_base;

CREATE TABLE results.measure_158_0_patient_summary (
	patient_id INTEGER, 
	effective_ipp BOOLEAN, 
	effective_denom BOOLEAN, 
	effective_denex BOOLEAN, 
	effective_numer BOOLEAN, 
	effective_denexcep BOOLEAN
)


;

---window_colname is base_patient_id
INSERT INTO results.measure_158_0_patient_summary (patient_id, effective_ipp, effective_denom, effective_denex, effective_numer, effective_denexcep) SELECT DISTINCT anon_1.patient_id, anon_1.effective_ipp, anon_1.effective_denom, anon_1.effective_denex, anon_1.effective_numer, anon_1.effective_denexcep 
FROM (SELECT base_patient_id AS patient_id, "initialPopulation" AS effective_ipp, "initialPopulation" AS effective_denom, CAST(NULL AS BOOLEAN) AS effective_denex, "initialPopulation" AND numerator AS effective_numer, CAST(NULL AS BOOLEAN) AS effective_denexcep, rank() OVER (PARTITION BY base_patient_id ORDER BY ("initialPopulation" AND numerator) DESC, "initialPopulation" DESC) AS rank 
FROM results.measure_158_0_all 
WHERE "initialPopulation") AS anon_1 
WHERE anon_1.rank = 1
;


CREATE TABLE results.measure_158_0_event_summary (
	event_id INTEGER, 
	effective_ipp BOOLEAN, 
	effective_denom BOOLEAN, 
	effective_denex BOOLEAN, 
	effective_numer BOOLEAN, 
	effective_denexcep BOOLEAN
)


;

---window_colname is audit_key_value
INSERT INTO results.measure_158_0_event_summary (event_id, effective_ipp, effective_denom, effective_denex, effective_numer, effective_denexcep) SELECT DISTINCT anon_1.event_id, anon_1.effective_ipp, anon_1.effective_denom, anon_1.effective_denex, anon_1.effective_numer, anon_1.effective_denexcep 
FROM (SELECT audit_key_value AS event_id, "initialPopulation" AS effective_ipp, "initialPopulation" AS effective_denom, CAST(NULL AS BOOLEAN) AS effective_denex, "initialPopulation" AND numerator AS effective_numer, CAST(NULL AS BOOLEAN) AS effective_denexcep, rank() OVER (PARTITION BY audit_key_value ORDER BY ("initialPopulation" AND numerator) DESC, "initialPopulation" DESC) AS rank 
FROM results.measure_158_0_all 
WHERE "initialPopulation") AS anon_1 
WHERE anon_1.rank = 1
;

