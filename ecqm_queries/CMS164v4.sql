set search_path = results;

CREATE TABLE results.measure_164_patient_base (
	base_patient_id INTEGER
)


;

INSERT INTO results.measure_164_patient_base (base_patient_id)
SELECT base_patients.patient_id AS base_patient_id
FROM hqmf_test.patients AS base_patients
;

CREATE INDEX ix_measure_164_patient_base_patient_id ON results.measure_164_patient_base (base_patient_id)
;

---found pcsection 0

CREATE TABLE results.measure_164_conj_31 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_164_conj_31 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_29.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_29.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_29.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_29.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.procedure_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1010'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_29
UNION
SELECT dc_30.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_30.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_30.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_30.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.procedure_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1002'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_30
;

CREATE INDEX ix_measure_164_conj_31_patient_id ON results.measure_164_conj_31 (patient_id)
;


CREATE TABLE results.measure_164_conj_32 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_164_conj_32 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_26.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_26.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_26.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_26.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.diagnosis_active.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1001'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)
     AND hqmf_test.diagnosis_active.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
     AND month_delta(hqmf_test.diagnosis_active.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
     AND month_delta(hqmf_test.diagnosis_active.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) <= 12) AS dc_26
UNION
SELECT dc_27.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_27.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_27.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_27.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1003'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)
     AND (hqmf_test.diagnosis_active.end_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
          AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) >= hqmf_test.diagnosis_active.start_dt
          OR hqmf_test.diagnosis_active.start_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
          AND hqmf_test.diagnosis_active.end_dt IS NULL
          OR CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) <= hqmf_test.diagnosis_active.end_dt
          AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) IS NULL
          OR hqmf_test.diagnosis_active.start_dt IS NULL
          AND hqmf_test.diagnosis_active.end_dt IS NULL)) AS dc_27
UNION
SELECT anon_1.patient_id AS patient_id,
       anon_1.start_dt AS start_dt,
       anon_1.end_dt AS end_dt,
       anon_1.audit_key_value AS audit_key_value
FROM
  (SELECT results.measure_164_conj_31.patient_id AS patient_id,
          results.measure_164_conj_31.start_dt AS start_dt,
          results.measure_164_conj_31.end_dt AS end_dt,
          results.measure_164_conj_31.audit_key_value AS audit_key_value,
          CAST(row_number() OVER (PARTITION BY results.measure_164_conj_31.patient_id
                                  ORDER BY coalesce(results.measure_164_conj_31.start_dt, results.measure_164_conj_31.end_dt)) AS INTEGER) AS row_number_9
   FROM results.measure_164_conj_31,
        results.measure_164_patient_base
   WHERE results.measure_164_conj_31.patient_id = results.measure_164_patient_base.base_patient_id
     AND results.measure_164_conj_31.end_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
     AND month_delta(results.measure_164_conj_31.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
     AND month_delta(results.measure_164_conj_31.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) <= 12) AS anon_1
;

CREATE INDEX ix_measure_164_conj_32_patient_id ON results.measure_164_conj_32 (patient_id)
;


CREATE TABLE results.measure_164_conj_38 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_164_conj_38 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_36.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_36.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_36.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_36.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.procedure_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1010'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_36
UNION
SELECT dc_37.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_37.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_37.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_37.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.procedure_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1002'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_37
;

CREATE INDEX ix_measure_164_conj_38_patient_id ON results.measure_164_conj_38 (patient_id)
;


CREATE TABLE results.measure_164_conj_39 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_164_conj_39 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_33.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_33.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_33.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_33.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.diagnosis_active.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1001'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)
     AND hqmf_test.diagnosis_active.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
     AND month_delta(hqmf_test.diagnosis_active.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
     AND month_delta(hqmf_test.diagnosis_active.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) <= 12) AS dc_33
UNION
SELECT dc_34.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_34.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_34.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_34.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1003'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)
     AND (hqmf_test.diagnosis_active.end_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
          AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) >= hqmf_test.diagnosis_active.start_dt
          OR hqmf_test.diagnosis_active.start_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
          AND hqmf_test.diagnosis_active.end_dt IS NULL
          OR CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) <= hqmf_test.diagnosis_active.end_dt
          AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) IS NULL
          OR hqmf_test.diagnosis_active.start_dt IS NULL
          AND hqmf_test.diagnosis_active.end_dt IS NULL)) AS dc_34
UNION
SELECT anon_1.patient_id AS patient_id,
       anon_1.start_dt AS start_dt,
       anon_1.end_dt AS end_dt,
       anon_1.audit_key_value AS audit_key_value
FROM
  (SELECT results.measure_164_conj_38.patient_id AS patient_id,
          results.measure_164_conj_38.start_dt AS start_dt,
          results.measure_164_conj_38.end_dt AS end_dt,
          results.measure_164_conj_38.audit_key_value AS audit_key_value,
          CAST(row_number() OVER (PARTITION BY results.measure_164_conj_38.patient_id
                                  ORDER BY coalesce(results.measure_164_conj_38.start_dt, results.measure_164_conj_38.end_dt)) AS INTEGER) AS row_number_9
   FROM results.measure_164_conj_38,
        results.measure_164_patient_base
   WHERE results.measure_164_conj_38.patient_id = results.measure_164_patient_base.base_patient_id
     AND results.measure_164_conj_38.end_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
     AND month_delta(results.measure_164_conj_38.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
     AND month_delta(results.measure_164_conj_38.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) <= 12) AS anon_1
;

CREATE INDEX ix_measure_164_conj_39_patient_id ON results.measure_164_conj_39 (patient_id)
;


CREATE TABLE results.measure_164_conj_47 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_164_conj_47 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_41.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_41.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_41.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_41.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_41
UNION
SELECT dc_42.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_42.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_42.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_42.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_42
UNION
SELECT dc_43.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_43.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_43.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_43.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1025'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_43
UNION
SELECT dc_44.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_44.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_44.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_44.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.encounter_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1023'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_44
UNION
SELECT dc_45.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_45.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_45.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_45.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.encounter_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1016'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_45
UNION
SELECT dc_46.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_46.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_46.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_46.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.526.3.1240'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_46
;

CREATE INDEX ix_measure_164_conj_47_patient_id ON results.measure_164_conj_47 (patient_id)
;


CREATE TABLE results.measure_164_conj_54 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_164_conj_54 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_48.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_48.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_48.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_48.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_48
UNION
SELECT dc_49.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_49.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_49.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_49.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_49
UNION
SELECT dc_50.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_50.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_50.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_50.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1025'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_50
UNION
SELECT dc_51.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_51.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_51.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_51.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.encounter_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1023'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_51
UNION
SELECT dc_52.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_52.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_52.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_52.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.encounter_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1016'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_52
UNION
SELECT dc_53.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_53.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_53.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_53.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_164_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.526.3.1240'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_164_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_53
;

CREATE INDEX ix_measure_164_conj_54_patient_id ON results.measure_164_conj_54 (patient_id)
;

create or replace view results.measure_164_0_all as SELECT results.measure_164_patient_base.base_patient_id,

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
                 WHERE hqmf_test.patient_characteristic_birthdate.patient_id = results.measure_164_patient_base.base_patient_id
                   AND (CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) IS NULL
                        OR CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) = false)
                   AND hqmf_test.patient_characteristic_birthdate.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                   AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 18) AS anon_2))
   AND (EXISTS
          (SELECT anon_3.patient_id,
                  anon_3.start_dt,
                  anon_3.end_dt,
                  anon_3.audit_key_value,
                  anon_3.row_number_6
           FROM
             (SELECT results.measure_164_conj_39.patient_id AS patient_id,
                     results.measure_164_conj_39.start_dt AS start_dt,
                     results.measure_164_conj_39.end_dt AS end_dt,
                     results.measure_164_conj_39.audit_key_value AS audit_key_value,
                     CAST(row_number() OVER (PARTITION BY results.measure_164_conj_39.patient_id
                                             ORDER BY coalesce(results.measure_164_conj_39.start_dt, results.measure_164_conj_39.end_dt)) AS INTEGER) AS row_number_6
              FROM results.measure_164_conj_39
              WHERE results.measure_164_conj_39.patient_id = results.measure_164_patient_base.base_patient_id) AS anon_3))
   AND (EXISTS
          (SELECT anon_4.patient_id,
                  anon_4.start_dt,
                  anon_4.end_dt,
                  anon_4.audit_key_value,
                  anon_4.row_number_16
           FROM
             (SELECT results.measure_164_conj_54.patient_id AS patient_id,
                     results.measure_164_conj_54.start_dt AS start_dt,
                     results.measure_164_conj_54.end_dt AS end_dt,
                     results.measure_164_conj_54.audit_key_value AS audit_key_value,
                     CAST(row_number() OVER (PARTITION BY results.measure_164_conj_54.patient_id
                                             ORDER BY coalesce(results.measure_164_conj_54.start_dt, results.measure_164_conj_54.end_dt)) AS INTEGER) AS row_number_16
              FROM results.measure_164_conj_54
              WHERE results.measure_164_conj_54.patient_id = results.measure_164_patient_base.base_patient_id
                AND results.measure_164_conj_54.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND results.measure_164_conj_54.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_4)) AS anon_1) AS "initialPopulation",

  (SELECT EXISTS
     (SELECT anon_5.hqmf_test_medication_active_patient_id,
             anon_5.hqmf_test_medication_active_start_dt,
             anon_5.hqmf_test_medication_active_end_dt,
             anon_5.hqmf_test_medication_active_audit_key_value
      FROM
        (SELECT hqmf_test.medication_active.patient_id AS hqmf_test_medication_active_patient_id,
                hqmf_test.medication_active.start_dt AS hqmf_test_medication_active_start_dt,
                hqmf_test.medication_active.end_dt AS hqmf_test_medication_active_end_dt,
                hqmf_test.medication_active.audit_key_value AS hqmf_test_medication_active_audit_key_value
         FROM hqmf_test.medication_active
         JOIN
         valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.medication_active.code
         AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.196.12.1211'
         WHERE hqmf_test.medication_active.patient_id = results.measure_164_patient_base.base_patient_id
           AND (CAST(hqmf_test.medication_active.negation AS BOOLEAN) IS NULL
                OR CAST(hqmf_test.medication_active.negation AS BOOLEAN) = false)
           AND (hqmf_test.medication_active.end_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) >= hqmf_test.medication_active.start_dt
                OR hqmf_test.medication_active.start_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND hqmf_test.medication_active.end_dt IS NULL
                OR CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) <= hqmf_test.medication_active.end_dt
                AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) IS NULL
                OR hqmf_test.medication_active.start_dt IS NULL
                AND hqmf_test.medication_active.end_dt IS NULL)) AS anon_5) AS xists) AS numerator
FROM results.measure_164_patient_base;

CREATE TABLE results.measure_164_0_patient_summary (
	patient_id INTEGER, 
	effective_ipp BOOLEAN, 
	effective_denom BOOLEAN, 
	effective_denex BOOLEAN, 
	effective_numer BOOLEAN, 
	effective_denexcep BOOLEAN
)


;

---window_colname is base_patient_id
INSERT INTO results.measure_164_0_patient_summary (patient_id, effective_ipp, effective_denom, effective_denex, effective_numer, effective_denexcep) SELECT DISTINCT anon_1.patient_id, anon_1.effective_ipp, anon_1.effective_denom, anon_1.effective_denex, anon_1.effective_numer, anon_1.effective_denexcep 
FROM (SELECT base_patient_id AS patient_id, "initialPopulation" AS effective_ipp, "initialPopulation" AS effective_denom, CAST(NULL AS BOOLEAN) AS effective_denex, "initialPopulation" AND numerator AS effective_numer, CAST(NULL AS BOOLEAN) AS effective_denexcep, rank() OVER (PARTITION BY base_patient_id ORDER BY ("initialPopulation" AND numerator) DESC, "initialPopulation" DESC) AS rank 
FROM results.measure_164_0_all 
WHERE "initialPopulation") AS anon_1 
WHERE anon_1.rank = 1
;

