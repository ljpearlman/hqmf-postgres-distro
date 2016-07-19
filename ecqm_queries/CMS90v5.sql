set search_path = results;

CREATE TABLE results.measure_90_conj_32 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_90_conj_32 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_30.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_30.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_30.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_30.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
     OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false) AS dc_30
UNION
SELECT dc_31.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_31.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_31.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_31.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
     OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false) AS dc_31
;

CREATE INDEX ix_measure_90_conj_32_patient_id ON results.measure_90_conj_32 (patient_id)
;


CREATE TABLE results.measure_90_conj_34 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_90_conj_34 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_29.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_29.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_29.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_29.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM
     (SELECT ordinal_1.patient_id AS patient_id,
             ordinal_1.start_dt AS start_dt,
             ordinal_1.end_dt AS end_dt,
             ordinal_1.audit_key_value AS audit_key_value,
             ordinal_1.row_number_11 AS row_number_11
      FROM
        (SELECT results.measure_90_conj_32.patient_id AS patient_id,
                results.measure_90_conj_32.start_dt AS start_dt,
                results.measure_90_conj_32.end_dt AS end_dt,
                results.measure_90_conj_32.audit_key_value AS audit_key_value,
                CAST(row_number() OVER (PARTITION BY results.measure_90_conj_32.patient_id
                                        ORDER BY coalesce(results.measure_90_conj_32.start_dt, results.measure_90_conj_32.end_dt)) AS INTEGER) AS row_number_11
         FROM results.measure_90_conj_32
         WHERE results.measure_90_conj_32.end_dt > CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
           AND day_delta(results.measure_90_conj_32.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
           AND day_delta(results.measure_90_conj_32.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) <= 185) AS ordinal_1
      WHERE ordinal_1.row_number_11 = 1) AS so_target_39_grouper,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.encounter_performed.patient_id = so_target_39_grouper.patient_id
     AND hqmf_test.encounter_performed.start_dt > so_target_39_grouper.end_dt
     AND day_delta(hqmf_test.encounter_performed.start_dt, so_target_39_grouper.end_dt) >= 30) AS dc_29 INTERSECT
SELECT dc_33.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_33.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_33.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_33.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM
     (SELECT ordinal_1.patient_id AS patient_id,
             ordinal_1.start_dt AS start_dt,
             ordinal_1.end_dt AS end_dt,
             ordinal_1.audit_key_value AS audit_key_value,
             ordinal_1.row_number_11 AS row_number_11
      FROM
        (SELECT results.measure_90_conj_32.patient_id AS patient_id,
                results.measure_90_conj_32.start_dt AS start_dt,
                results.measure_90_conj_32.end_dt AS end_dt,
                results.measure_90_conj_32.audit_key_value AS audit_key_value,
                CAST(row_number() OVER (PARTITION BY results.measure_90_conj_32.patient_id
                                        ORDER BY coalesce(results.measure_90_conj_32.start_dt, results.measure_90_conj_32.end_dt)) AS INTEGER) AS row_number_11
         FROM results.measure_90_conj_32
         WHERE results.measure_90_conj_32.end_dt > CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
           AND day_delta(results.measure_90_conj_32.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
           AND day_delta(results.measure_90_conj_32.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) <= 185) AS ordinal_1
      WHERE ordinal_1.row_number_11 = 1) AS so_target_39_grouper,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.encounter_performed.patient_id = so_target_39_grouper.patient_id
     AND hqmf_test.encounter_performed.start_dt > so_target_39_grouper.end_dt
     AND day_delta(hqmf_test.encounter_performed.start_dt, so_target_39_grouper.end_dt) >= 0
     AND day_delta(hqmf_test.encounter_performed.start_dt, so_target_39_grouper.end_dt) <= 180) AS dc_33
;

CREATE INDEX ix_measure_90_conj_34_patient_id ON results.measure_90_conj_34 (patient_id)
;


CREATE TABLE results.measure_90_conj_38 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_90_conj_38 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_36.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_36.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_36.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_36.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM
     (SELECT ordinal_1.patient_id AS patient_id,
             ordinal_1.start_dt AS start_dt,
             ordinal_1.end_dt AS end_dt,
             ordinal_1.audit_key_value AS audit_key_value,
             ordinal_1.row_number_11 AS row_number_11
      FROM
        (SELECT results.measure_90_conj_32.patient_id AS patient_id,
                results.measure_90_conj_32.start_dt AS start_dt,
                results.measure_90_conj_32.end_dt AS end_dt,
                results.measure_90_conj_32.audit_key_value AS audit_key_value,
                CAST(row_number() OVER (PARTITION BY results.measure_90_conj_32.patient_id
                                        ORDER BY coalesce(results.measure_90_conj_32.start_dt, results.measure_90_conj_32.end_dt)) AS INTEGER) AS row_number_11
         FROM results.measure_90_conj_32
         WHERE results.measure_90_conj_32.end_dt > CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
           AND day_delta(results.measure_90_conj_32.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
           AND day_delta(results.measure_90_conj_32.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) <= 185) AS ordinal_1
      WHERE ordinal_1.row_number_11 = 1) AS so_target_39_grouper,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.encounter_performed.patient_id = so_target_39_grouper.patient_id
     AND hqmf_test.encounter_performed.start_dt > so_target_39_grouper.end_dt
     AND day_delta(hqmf_test.encounter_performed.start_dt, so_target_39_grouper.end_dt) >= 30) AS dc_36 INTERSECT
SELECT dc_37.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_37.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_37.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_37.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM
     (SELECT ordinal_1.patient_id AS patient_id,
             ordinal_1.start_dt AS start_dt,
             ordinal_1.end_dt AS end_dt,
             ordinal_1.audit_key_value AS audit_key_value,
             ordinal_1.row_number_11 AS row_number_11
      FROM
        (SELECT results.measure_90_conj_32.patient_id AS patient_id,
                results.measure_90_conj_32.start_dt AS start_dt,
                results.measure_90_conj_32.end_dt AS end_dt,
                results.measure_90_conj_32.audit_key_value AS audit_key_value,
                CAST(row_number() OVER (PARTITION BY results.measure_90_conj_32.patient_id
                                        ORDER BY coalesce(results.measure_90_conj_32.start_dt, results.measure_90_conj_32.end_dt)) AS INTEGER) AS row_number_11
         FROM results.measure_90_conj_32
         WHERE results.measure_90_conj_32.end_dt > CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
           AND day_delta(results.measure_90_conj_32.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
           AND day_delta(results.measure_90_conj_32.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) <= 185) AS ordinal_1
      WHERE ordinal_1.row_number_11 = 1) AS so_target_39_grouper,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.encounter_performed.patient_id = so_target_39_grouper.patient_id
     AND hqmf_test.encounter_performed.start_dt > so_target_39_grouper.end_dt
     AND day_delta(hqmf_test.encounter_performed.start_dt, so_target_39_grouper.end_dt) >= 0
     AND day_delta(hqmf_test.encounter_performed.start_dt, so_target_39_grouper.end_dt) <= 180) AS dc_37
;

CREATE INDEX ix_measure_90_conj_38_patient_id ON results.measure_90_conj_38 (patient_id)
;


CREATE TABLE results.measure_90_conj_39 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_90_conj_39 (patient_id, start_dt, end_dt, audit_key_value)
SELECT anon_1.patient_id AS patient_id,
       anon_1.start_dt AS start_dt,
       anon_1.end_dt AS end_dt,
       anon_1.audit_key_value AS audit_key_value
FROM
  (SELECT ordinal_1.patient_id AS patient_id,
          ordinal_1.start_dt AS start_dt,
          ordinal_1.end_dt AS end_dt,
          ordinal_1.audit_key_value AS audit_key_value,
          ordinal_1.row_number_8 AS row_number_8
   FROM
     (SELECT results.measure_90_conj_34.patient_id AS patient_id,
             results.measure_90_conj_34.start_dt AS start_dt,
             results.measure_90_conj_34.end_dt AS end_dt,
             results.measure_90_conj_34.audit_key_value AS audit_key_value,
             CAST(row_number() OVER (PARTITION BY results.measure_90_conj_34.patient_id
                                     ORDER BY coalesce(results.measure_90_conj_34.start_dt, results.measure_90_conj_34.end_dt) DESC) AS INTEGER) AS row_number_8
      FROM results.measure_90_conj_34) AS ordinal_1
   WHERE ordinal_1.row_number_8 = 1) AS anon_1
UNION
SELECT anon_2.patient_id AS patient_id,
       anon_2.start_dt AS start_dt,
       anon_2.end_dt AS end_dt,
       anon_2.audit_key_value AS audit_key_value
FROM
  (SELECT ordinal_1.patient_id AS patient_id,
          ordinal_1.start_dt AS start_dt,
          ordinal_1.end_dt AS end_dt,
          ordinal_1.audit_key_value AS audit_key_value,
          ordinal_1.row_number_9 AS row_number_9
   FROM
     (SELECT results.measure_90_conj_38.patient_id AS patient_id,
             results.measure_90_conj_38.start_dt AS start_dt,
             results.measure_90_conj_38.end_dt AS end_dt,
             results.measure_90_conj_38.audit_key_value AS audit_key_value,
             CAST(row_number() OVER (PARTITION BY results.measure_90_conj_38.patient_id
                                     ORDER BY coalesce(results.measure_90_conj_38.start_dt, results.measure_90_conj_38.end_dt) DESC) AS INTEGER) AS row_number_9
      FROM results.measure_90_conj_38) AS ordinal_1
   WHERE ordinal_1.row_number_9 = 1) AS anon_2
;

CREATE INDEX ix_measure_90_conj_39_patient_id ON results.measure_90_conj_39 (patient_id)
;


CREATE TABLE results.measure_90_so_target_50 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT, 
	row_number_4 INTEGER
)


;

INSERT INTO results.measure_90_so_target_50 (patient_id, start_dt, end_dt, audit_key_value, row_number_4)
SELECT results.measure_90_conj_39.patient_id,
       results.measure_90_conj_39.start_dt,
       results.measure_90_conj_39.end_dt,
       results.measure_90_conj_39.audit_key_value,
       CAST(row_number() OVER (PARTITION BY results.measure_90_conj_39.patient_id
                               ORDER BY coalesce(results.measure_90_conj_39.start_dt, results.measure_90_conj_39.end_dt)) AS INTEGER) AS row_number_4
FROM results.measure_90_conj_39
;

CREATE INDEX ix_measure_90_so_target_50_patient_id ON results.measure_90_so_target_50 (patient_id)
;


CREATE TABLE results.measure_90_so_target_39 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT, 
	row_number_11 INTEGER
)


;

INSERT INTO results.measure_90_so_target_39 (patient_id, start_dt, end_dt, audit_key_value, row_number_11)
SELECT ordinal_1.patient_id,
       ordinal_1.start_dt,
       ordinal_1.end_dt,
       ordinal_1.audit_key_value,
       ordinal_1.row_number_11
FROM
  (SELECT results.measure_90_conj_32.patient_id AS patient_id,
          results.measure_90_conj_32.start_dt AS start_dt,
          results.measure_90_conj_32.end_dt AS end_dt,
          results.measure_90_conj_32.audit_key_value AS audit_key_value,
          CAST(row_number() OVER (PARTITION BY results.measure_90_conj_32.patient_id
                                  ORDER BY coalesce(results.measure_90_conj_32.start_dt, results.measure_90_conj_32.end_dt)) AS INTEGER) AS row_number_11
   FROM results.measure_90_conj_32
   WHERE results.measure_90_conj_32.end_dt > CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
     AND day_delta(results.measure_90_conj_32.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
     AND day_delta(results.measure_90_conj_32.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) <= 185) AS ordinal_1
WHERE ordinal_1.row_number_11 = 1
;

CREATE INDEX ix_measure_90_so_target_39_patient_id ON results.measure_90_so_target_39 (patient_id)
;


CREATE TABLE results.measure_90_patient_base (
	base_patient_id INTEGER, 
	so_51_audit_key_value BIGINT, 
	so_51_start_dt TIMESTAMP WITHOUT TIME ZONE, 
	so_51_end_dt TIMESTAMP WITHOUT TIME ZONE, 
	so_53_audit_key_value BIGINT, 
	so_53_start_dt TIMESTAMP WITHOUT TIME ZONE, 
	so_53_end_dt TIMESTAMP WITHOUT TIME ZONE
)


;

INSERT INTO results.measure_90_patient_base (base_patient_id, so_51_audit_key_value, so_51_start_dt, so_51_end_dt, so_53_audit_key_value, so_53_start_dt, so_53_end_dt)
SELECT base_patients.patient_id AS base_patient_id,
       so_51.audit_key_value AS so_51_audit_key_value,
       so_51.start_dt AS so_51_start_dt,
       so_51.end_dt AS so_51_end_dt,
       so_53.audit_key_value AS so_53_audit_key_value,
       so_53.start_dt AS so_53_start_dt,
       so_53.end_dt AS so_53_end_dt
FROM hqmf_test.patients AS base_patients
LEFT OUTER JOIN
  (SELECT results.measure_90_so_target_50.patient_id AS patient_id,
          results.measure_90_so_target_50.audit_key_value AS audit_key_value,
          results.measure_90_so_target_50.start_dt AS start_dt,
          results.measure_90_so_target_50.end_dt AS end_dt
   FROM results.measure_90_so_target_50) AS so_51 ON so_51.patient_id = base_patients.patient_id
LEFT OUTER JOIN
  (SELECT results.measure_90_so_target_39.patient_id AS patient_id,
          results.measure_90_so_target_39.audit_key_value AS audit_key_value,
          results.measure_90_so_target_39.start_dt AS start_dt,
          results.measure_90_so_target_39.end_dt AS end_dt
   FROM results.measure_90_so_target_39) AS so_53 ON so_53.patient_id = base_patients.patient_id
;

CREATE INDEX ix_measure_90_patient_base_patient_id ON results.measure_90_patient_base (base_patient_id)
;

---found pcsection 0

CREATE TABLE results.measure_90_conj_45 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_90_conj_45 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_43.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_43.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_43.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_43.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_90_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.diagnosis_active.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.526.3.1025'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_90_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_43
UNION
SELECT dc_44.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_44.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_44.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_44.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_90_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.108.12.1011'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_90_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_44
;

CREATE INDEX ix_measure_90_conj_45_patient_id ON results.measure_90_conj_45 (patient_id)
;


CREATE TABLE results.measure_90_conj_48 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_90_conj_48 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_46.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_46.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_46.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_46.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_90_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.diagnosis_active.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.526.3.1025'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_90_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_46
UNION
SELECT dc_47.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_47.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_47.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_47.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_90_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.108.12.1011'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_90_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_47
;

CREATE INDEX ix_measure_90_conj_48_patient_id ON results.measure_90_conj_48 (patient_id)
;

create or replace view results.measure_90_0_all as SELECT results.measure_90_patient_base.base_patient_id,
       results.measure_90_patient_base.so_51_audit_key_value,
       results.measure_90_patient_base.so_51_start_dt,
       results.measure_90_patient_base.so_51_end_dt,
       results.measure_90_patient_base.so_53_audit_key_value,
       results.measure_90_patient_base.so_53_start_dt,
       results.measure_90_patient_base.so_53_end_dt,

  (SELECT (EXISTS
             (SELECT anon_2.hqmf_test_functional_status_performed_patient_id,
                     anon_2.hqmf_test_functional_status_performed_start_dt,
                     anon_2.hqmf_test_functional_status_performed_end_dt,
                     anon_2.hqmf_test_functional_status_performed_audit_key_value
              FROM
                (SELECT hqmf_test.functional_status_performed.patient_id AS hqmf_test_functional_status_performed_patient_id,
                        hqmf_test.functional_status_performed.start_dt AS hqmf_test_functional_status_performed_start_dt,
                        hqmf_test.functional_status_performed.end_dt AS hqmf_test_functional_status_performed_end_dt,
                        hqmf_test.functional_status_performed.audit_key_value AS hqmf_test_functional_status_performed_audit_key_value
                 FROM
                   (SELECT results.measure_90_so_target_39.patient_id AS patient_id,
                           results.measure_90_so_target_39.audit_key_value AS audit_key_value,
                           results.measure_90_so_target_39.start_dt AS start_dt,
                           results.measure_90_so_target_39.end_dt AS end_dt
                    FROM results.measure_90_so_target_39) AS so_53,
                      hqmf_test.functional_status_performed
                 JOIN
                 valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.functional_status_performed.code
                 AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.118.12.1031'
                 WHERE hqmf_test.functional_status_performed.patient_id = results.measure_90_patient_base.base_patient_id
                   AND (CAST(hqmf_test.functional_status_performed.negation AS BOOLEAN) IS NULL
                        OR CAST(hqmf_test.functional_status_performed.negation AS BOOLEAN) = false)
                   AND hqmf_test.functional_status_performed.patient_id = so_53.patient_id
                   AND hqmf_test.functional_status_performed.end_dt < results.measure_90_patient_base.so_53_end_dt
                   AND week_delta(hqmf_test.functional_status_performed.end_dt, results.measure_90_patient_base.so_53_end_dt) >= 0
                   AND week_delta(hqmf_test.functional_status_performed.end_dt, results.measure_90_patient_base.so_53_end_dt) <= 2
                   AND hqmf_test.functional_status_performed.value IS NOT NULL) AS anon_2))
   AND (EXISTS
          (SELECT anon_3.hqmf_test_functional_status_performed_patient_id,
                  anon_3.hqmf_test_functional_status_performed_start_dt,
                  anon_3.hqmf_test_functional_status_performed_end_dt,
                  anon_3.hqmf_test_functional_status_performed_audit_key_value
           FROM
             (SELECT hqmf_test.functional_status_performed.patient_id AS hqmf_test_functional_status_performed_patient_id,
                     hqmf_test.functional_status_performed.start_dt AS hqmf_test_functional_status_performed_start_dt,
                     hqmf_test.functional_status_performed.end_dt AS hqmf_test_functional_status_performed_end_dt,
                     hqmf_test.functional_status_performed.audit_key_value AS hqmf_test_functional_status_performed_audit_key_value
              FROM
                (SELECT results.measure_90_so_target_50.patient_id AS patient_id,
                        results.measure_90_so_target_50.audit_key_value AS audit_key_value,
                        results.measure_90_so_target_50.start_dt AS start_dt,
                        results.measure_90_so_target_50.end_dt AS end_dt
                 FROM results.measure_90_so_target_50) AS so_51,
                   hqmf_test.functional_status_performed
              JOIN
              valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.functional_status_performed.code
              AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.118.12.1031'
              WHERE hqmf_test.functional_status_performed.patient_id = results.measure_90_patient_base.base_patient_id
                AND (CAST(hqmf_test.functional_status_performed.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.functional_status_performed.negation AS BOOLEAN) = false)
                AND hqmf_test.functional_status_performed.patient_id = so_51.patient_id
                AND hqmf_test.functional_status_performed.end_dt < results.measure_90_patient_base.so_51_end_dt
                AND week_delta(hqmf_test.functional_status_performed.end_dt, results.measure_90_patient_base.so_51_end_dt) >= 0
                AND week_delta(hqmf_test.functional_status_performed.end_dt, results.measure_90_patient_base.so_51_end_dt) <= 2
                AND hqmf_test.functional_status_performed.value IS NOT NULL) AS anon_3)) AS anon_1) AS numerator,

  (SELECT EXISTS
     (SELECT anon_4.patient_id,
             anon_4.start_dt,
             anon_4.end_dt,
             anon_4.audit_key_value,
             anon_4.row_number_16
      FROM
        (SELECT results.measure_90_conj_48.patient_id AS patient_id,
                results.measure_90_conj_48.start_dt AS start_dt,
                results.measure_90_conj_48.end_dt AS end_dt,
                results.measure_90_conj_48.audit_key_value AS audit_key_value,
                CAST(row_number() OVER (PARTITION BY results.measure_90_conj_48.patient_id
                                        ORDER BY coalesce(results.measure_90_conj_48.start_dt, results.measure_90_conj_48.end_dt)) AS INTEGER) AS row_number_16
         FROM results.measure_90_conj_48
         WHERE results.measure_90_conj_48.patient_id = results.measure_90_patient_base.base_patient_id
           AND (results.measure_90_conj_48.end_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) >= results.measure_90_conj_48.start_dt
                OR results.measure_90_conj_48.start_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND results.measure_90_conj_48.end_dt IS NULL
                OR CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) <= results.measure_90_conj_48.end_dt
                AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) IS NULL
                OR results.measure_90_conj_48.start_dt IS NULL
                AND results.measure_90_conj_48.end_dt IS NULL)) AS anon_4) AS xists) AS "denominatorExclusions",

  (SELECT (EXISTS
             (SELECT anon_6.hqmf_test_patient_characteristic_birthdate_patient_id,
                     anon_6.hqmf_test_patient_characteristic_birthdate_start_dt,
                     anon_6.hqmf_test_patient_characteristic_birthdate_end_dt,
                     anon_6.hqmf_test_patient_characteristic_birthdate_audit_key_valu_1
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
                 WHERE hqmf_test.patient_characteristic_birthdate.patient_id = results.measure_90_patient_base.base_patient_id
                   AND (CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) IS NULL
                        OR CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) = false)
                   AND hqmf_test.patient_characteristic_birthdate.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                   AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 65) AS anon_6))
   AND (EXISTS
          (SELECT anon_7.hqmf_test_diagnosis_active_patient_id,
                  anon_7.hqmf_test_diagnosis_active_start_dt,
                  anon_7.hqmf_test_diagnosis_active_end_dt,
                  anon_7.hqmf_test_diagnosis_active_audit_key_value
           FROM
             (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
                     hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
                     hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
                     hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
              FROM hqmf_test.diagnosis_active
              JOIN
              valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.diagnosis_active.code
              AND code_lists_3.code_list_id = '2.16.840.1.113883.3.526.3.376'
              WHERE hqmf_test.diagnosis_active.patient_id = results.measure_90_patient_base.base_patient_id
                AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)
                AND (hqmf_test.diagnosis_active.end_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                     AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) >= hqmf_test.diagnosis_active.start_dt
                     OR hqmf_test.diagnosis_active.start_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                     AND hqmf_test.diagnosis_active.end_dt IS NULL
                     OR CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) <= hqmf_test.diagnosis_active.end_dt
                     AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) IS NULL
                     OR hqmf_test.diagnosis_active.start_dt IS NULL
                     AND hqmf_test.diagnosis_active.end_dt IS NULL)) AS anon_7))
   AND (EXISTS
          (SELECT anon_8.patient_id,
                  anon_8.audit_key_value,
                  anon_8.start_dt,
                  anon_8.end_dt
           FROM
             (SELECT results.measure_90_so_target_50.patient_id AS patient_id,
                     results.measure_90_so_target_50.audit_key_value AS audit_key_value,
                     results.measure_90_so_target_50.start_dt AS start_dt,
                     results.measure_90_so_target_50.end_dt AS end_dt
              FROM results.measure_90_so_target_50
              WHERE results.measure_90_so_target_50.audit_key_value = results.measure_90_patient_base.so_51_audit_key_value) AS anon_8))
   AND (EXISTS
          (SELECT anon_9.patient_id,
                  anon_9.audit_key_value,
                  anon_9.start_dt,
                  anon_9.end_dt
           FROM
             (SELECT results.measure_90_so_target_39.patient_id AS patient_id,
                     results.measure_90_so_target_39.audit_key_value AS audit_key_value,
                     results.measure_90_so_target_39.start_dt AS start_dt,
                     results.measure_90_so_target_39.end_dt AS end_dt
              FROM results.measure_90_so_target_39
              WHERE results.measure_90_so_target_39.audit_key_value = results.measure_90_patient_base.so_53_audit_key_value) AS anon_9)) AS anon_5) AS "initialPopulation"
FROM results.measure_90_patient_base;

CREATE TABLE results.measure_90_0_patient_summary (
	patient_id INTEGER, 
	effective_ipp BOOLEAN, 
	effective_denom BOOLEAN, 
	effective_denex BOOLEAN, 
	effective_numer BOOLEAN, 
	effective_denexcep BOOLEAN
)


;

---window_colname is base_patient_id
INSERT INTO results.measure_90_0_patient_summary (patient_id, effective_ipp, effective_denom, effective_denex, effective_numer, effective_denexcep) SELECT DISTINCT anon_1.patient_id, anon_1.effective_ipp, anon_1.effective_denom, anon_1.effective_denex, anon_1.effective_numer, anon_1.effective_denexcep 
FROM (SELECT base_patient_id AS patient_id, "initialPopulation" AS effective_ipp, "initialPopulation" AS effective_denom, "initialPopulation" AND "denominatorExclusions" AS effective_denex, "initialPopulation" AND NOT ("initialPopulation" AND "denominatorExclusions") AND numerator AS effective_numer, CAST(NULL AS BOOLEAN) AS effective_denexcep, rank() OVER (PARTITION BY base_patient_id ORDER BY ("initialPopulation" AND "denominatorExclusions") DESC, ("initialPopulation" AND NOT ("initialPopulation" AND "denominatorExclusions") AND numerator) DESC, "initialPopulation" DESC) AS rank 
FROM results.measure_90_0_all 
WHERE "initialPopulation") AS anon_1 
WHERE anon_1.rank = 1
;

--multiple possibilities for index col
