set search_path = results;

CREATE TABLE results.measure_122_so_target_1 (
	patient_id INTEGER, 
	audit_key_value BIGINT, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE
)


;

INSERT INTO results.measure_122_so_target_1 (patient_id, audit_key_value, start_dt, end_dt)
SELECT hqmf_test.laboratory_test_performed.patient_id AS patient_id,
       hqmf_test.laboratory_test_performed.audit_key_value AS audit_key_value,
       hqmf_test.laboratory_test_performed.start_dt AS start_dt,
       hqmf_test.laboratory_test_performed.end_dt AS end_dt
FROM hqmf_test.laboratory_test_performed
JOIN
valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.laboratory_test_performed.code
AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.198.12.1013'
WHERE CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
  OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false
;

CREATE INDEX ix_measure_122_so_target_1_patient_id ON results.measure_122_so_target_1 (patient_id)
;


CREATE TABLE results.measure_122_patient_base (
	base_patient_id INTEGER, 
	so_39_audit_key_value BIGINT, 
	so_39_start_dt TIMESTAMP WITHOUT TIME ZONE, 
	so_39_end_dt TIMESTAMP WITHOUT TIME ZONE, 
	so_19_audit_key_value BIGINT, 
	so_19_start_dt TIMESTAMP WITHOUT TIME ZONE, 
	so_19_end_dt TIMESTAMP WITHOUT TIME ZONE, 
	so_37_audit_key_value BIGINT, 
	so_37_start_dt TIMESTAMP WITHOUT TIME ZONE, 
	so_37_end_dt TIMESTAMP WITHOUT TIME ZONE, 
	so_12_audit_key_value BIGINT, 
	so_12_start_dt TIMESTAMP WITHOUT TIME ZONE, 
	so_12_end_dt TIMESTAMP WITHOUT TIME ZONE
)


;

INSERT INTO results.measure_122_patient_base (base_patient_id, so_39_audit_key_value, so_39_start_dt, so_39_end_dt, so_19_audit_key_value, so_19_start_dt, so_19_end_dt, so_37_audit_key_value, so_37_start_dt, so_37_end_dt, so_12_audit_key_value, so_12_start_dt, so_12_end_dt)
SELECT base_patients.patient_id AS base_patient_id,
       so_39.audit_key_value AS so_39_audit_key_value,
       so_39.start_dt AS so_39_start_dt,
       so_39.end_dt AS so_39_end_dt,
       so_19.audit_key_value AS so_19_audit_key_value,
       so_19.start_dt AS so_19_start_dt,
       so_19.end_dt AS so_19_end_dt,
       so_37.audit_key_value AS so_37_audit_key_value,
       so_37.start_dt AS so_37_start_dt,
       so_37.end_dt AS so_37_end_dt,
       so_12.audit_key_value AS so_12_audit_key_value,
       so_12.start_dt AS so_12_start_dt,
       so_12.end_dt AS so_12_end_dt
FROM hqmf_test.patients AS base_patients
LEFT OUTER JOIN
  (SELECT results.measure_122_so_target_1.patient_id AS patient_id,
          results.measure_122_so_target_1.audit_key_value AS audit_key_value,
          results.measure_122_so_target_1.start_dt AS start_dt,
          results.measure_122_so_target_1.end_dt AS end_dt
   FROM results.measure_122_so_target_1) AS so_39 ON so_39.patient_id = base_patients.patient_id
LEFT OUTER JOIN
  (SELECT results.measure_122_so_target_1.patient_id AS patient_id,
          results.measure_122_so_target_1.audit_key_value AS audit_key_value,
          results.measure_122_so_target_1.start_dt AS start_dt,
          results.measure_122_so_target_1.end_dt AS end_dt
   FROM results.measure_122_so_target_1) AS so_19 ON so_19.patient_id = base_patients.patient_id
LEFT OUTER JOIN
  (SELECT ordinal_1.patient_id AS patient_id,
          ordinal_1.audit_key_value AS audit_key_value,
          ordinal_1.start_dt AS start_dt,
          ordinal_1.end_dt AS end_dt
   FROM
     (SELECT results.measure_122_so_target_1.patient_id AS patient_id,
             results.measure_122_so_target_1.audit_key_value AS audit_key_value,
             results.measure_122_so_target_1.start_dt AS start_dt,
             results.measure_122_so_target_1.end_dt AS end_dt
      FROM results.measure_122_so_target_1
      WHERE results.measure_122_so_target_1.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
        AND results.measure_122_so_target_1.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS ordinal_1
   WHERE false) AS so_37 ON so_37.patient_id = base_patients.patient_id
LEFT OUTER JOIN
  (SELECT results.measure_122_so_target_1.patient_id AS patient_id,
          results.measure_122_so_target_1.audit_key_value AS audit_key_value,
          results.measure_122_so_target_1.start_dt AS start_dt,
          results.measure_122_so_target_1.end_dt AS end_dt
   FROM results.measure_122_so_target_1) AS so_12 ON so_12.patient_id = base_patients.patient_id
AND so_12.audit_key_value != so_19.audit_key_value
;

CREATE INDEX ix_measure_122_patient_base_patient_id ON results.measure_122_patient_base (base_patient_id)
;

---found pcsection 0

CREATE TABLE results.measure_122_conj_37 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_122_conj_37 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_31.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_31.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_31.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_31.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_122_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_122_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_31
UNION
SELECT dc_32.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_32.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_32.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_32.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_122_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_122_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_32
UNION
SELECT dc_33.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_33.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_33.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_33.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_122_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1025'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_122_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_33
UNION
SELECT dc_34.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_34.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_34.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_34.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_122_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.encounter_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1023'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_122_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_34
UNION
SELECT dc_35.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_35.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_35.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_35.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_122_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.encounter_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1016'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_122_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_35
UNION
SELECT dc_36.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_36.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_36.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_36.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_122_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.526.3.1240'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_122_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_36
;

CREATE INDEX ix_measure_122_conj_37_patient_id ON results.measure_122_conj_37 (patient_id)
;


CREATE TABLE results.measure_122_conj_44 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_122_conj_44 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_38.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_38.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_38.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_38.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_122_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_122_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_38
UNION
SELECT dc_39.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_39.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_39.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_39.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_122_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_122_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_39
UNION
SELECT dc_40.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_40.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_40.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_40.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_122_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1025'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_122_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_40
UNION
SELECT dc_41.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_41.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_41.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_41.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_122_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.encounter_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1023'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_122_patient_base.base_patient_id
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
   FROM results.measure_122_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.encounter_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1016'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_122_patient_base.base_patient_id
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
   FROM results.measure_122_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.526.3.1240'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_122_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_43
;

CREATE INDEX ix_measure_122_conj_44_patient_id ON results.measure_122_conj_44 (patient_id)
;


CREATE TABLE results.measure_122_conj_48 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_122_conj_48 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_46.hqmf_test_laboratory_test_performed_patient_id AS patient_id,
       dc_46.hqmf_test_laboratory_test_performed_start_dt AS start_dt,
       dc_46.hqmf_test_laboratory_test_performed_end_dt AS end_dt,
       dc_46.hqmf_test_laboratory_test_performed_audit_key_value AS audit_key_value
FROM
  (SELECT ordinal_1.hqmf_test_laboratory_test_performed_patient_id AS hqmf_test_laboratory_test_performed_patient_id,
          ordinal_1.hqmf_test_laboratory_test_performed_start_dt AS hqmf_test_laboratory_test_performed_start_dt,
          ordinal_1.hqmf_test_laboratory_test_performed_end_dt AS hqmf_test_laboratory_test_performed_end_dt,
          ordinal_1.hqmf_test_laboratory_test_performed_audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value,
          ordinal_1.row_number_7 AS row_number_7
   FROM
     (SELECT hqmf_test.laboratory_test_performed.patient_id AS hqmf_test_laboratory_test_performed_patient_id,
             hqmf_test.laboratory_test_performed.start_dt AS hqmf_test_laboratory_test_performed_start_dt,
             hqmf_test.laboratory_test_performed.end_dt AS hqmf_test_laboratory_test_performed_end_dt,
             hqmf_test.laboratory_test_performed.audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value,
             CAST(row_number() OVER (PARTITION BY hqmf_test.laboratory_test_performed.patient_id
                                     ORDER BY coalesce(hqmf_test.laboratory_test_performed.start_dt, hqmf_test.laboratory_test_performed.end_dt) DESC) AS INTEGER) AS row_number_7
      FROM results.measure_122_patient_base,
           hqmf_test.laboratory_test_performed
      JOIN
      valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.laboratory_test_performed.code
      AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.198.12.1013'
      WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_122_patient_base.base_patient_id
        AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
             OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
        AND hqmf_test.laboratory_test_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
        AND hqmf_test.laboratory_test_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
        AND hqmf_test.laboratory_test_performed.value IS NOT NULL) AS ordinal_1
   WHERE ordinal_1.row_number_7 = 1) AS dc_46 INTERSECT
SELECT dc_47.hqmf_test_laboratory_test_performed_patient_id AS patient_id,
       dc_47.hqmf_test_laboratory_test_performed_start_dt AS start_dt,
       dc_47.hqmf_test_laboratory_test_performed_end_dt AS end_dt,
       dc_47.hqmf_test_laboratory_test_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.laboratory_test_performed.patient_id AS hqmf_test_laboratory_test_performed_patient_id,
          hqmf_test.laboratory_test_performed.start_dt AS hqmf_test_laboratory_test_performed_start_dt,
          hqmf_test.laboratory_test_performed.end_dt AS hqmf_test_laboratory_test_performed_end_dt,
          hqmf_test.laboratory_test_performed.audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value
   FROM results.measure_122_patient_base,
        hqmf_test.laboratory_test_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.laboratory_test_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.198.12.1013'
   WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_122_patient_base.base_patient_id
     AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.laboratory_test_performed.value > 9) AS dc_47
;

CREATE INDEX ix_measure_122_conj_48_patient_id ON results.measure_122_conj_48 (patient_id)
;


CREATE TABLE results.measure_122_conj_51 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_122_conj_51 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_49.hqmf_test_laboratory_test_performed_patient_id AS patient_id,
       dc_49.hqmf_test_laboratory_test_performed_start_dt AS start_dt,
       dc_49.hqmf_test_laboratory_test_performed_end_dt AS end_dt,
       dc_49.hqmf_test_laboratory_test_performed_audit_key_value AS audit_key_value
FROM
  (SELECT ordinal_1.hqmf_test_laboratory_test_performed_patient_id AS hqmf_test_laboratory_test_performed_patient_id,
          ordinal_1.hqmf_test_laboratory_test_performed_start_dt AS hqmf_test_laboratory_test_performed_start_dt,
          ordinal_1.hqmf_test_laboratory_test_performed_end_dt AS hqmf_test_laboratory_test_performed_end_dt,
          ordinal_1.hqmf_test_laboratory_test_performed_audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value,
          ordinal_1.row_number_7 AS row_number_7
   FROM
     (SELECT hqmf_test.laboratory_test_performed.patient_id AS hqmf_test_laboratory_test_performed_patient_id,
             hqmf_test.laboratory_test_performed.start_dt AS hqmf_test_laboratory_test_performed_start_dt,
             hqmf_test.laboratory_test_performed.end_dt AS hqmf_test_laboratory_test_performed_end_dt,
             hqmf_test.laboratory_test_performed.audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value,
             CAST(row_number() OVER (PARTITION BY hqmf_test.laboratory_test_performed.patient_id
                                     ORDER BY coalesce(hqmf_test.laboratory_test_performed.start_dt, hqmf_test.laboratory_test_performed.end_dt) DESC) AS INTEGER) AS row_number_7
      FROM results.measure_122_patient_base,
           hqmf_test.laboratory_test_performed
      JOIN
      valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.laboratory_test_performed.code
      AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.198.12.1013'
      WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_122_patient_base.base_patient_id
        AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
             OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
        AND hqmf_test.laboratory_test_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
        AND hqmf_test.laboratory_test_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
        AND hqmf_test.laboratory_test_performed.value IS NOT NULL) AS ordinal_1
   WHERE ordinal_1.row_number_7 = 1) AS dc_49 INTERSECT
SELECT dc_50.hqmf_test_laboratory_test_performed_patient_id AS patient_id,
       dc_50.hqmf_test_laboratory_test_performed_start_dt AS start_dt,
       dc_50.hqmf_test_laboratory_test_performed_end_dt AS end_dt,
       dc_50.hqmf_test_laboratory_test_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.laboratory_test_performed.patient_id AS hqmf_test_laboratory_test_performed_patient_id,
          hqmf_test.laboratory_test_performed.start_dt AS hqmf_test_laboratory_test_performed_start_dt,
          hqmf_test.laboratory_test_performed.end_dt AS hqmf_test_laboratory_test_performed_end_dt,
          hqmf_test.laboratory_test_performed.audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value
   FROM results.measure_122_patient_base,
        hqmf_test.laboratory_test_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.laboratory_test_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.198.12.1013'
   WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_122_patient_base.base_patient_id
     AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.laboratory_test_performed.value > 9) AS dc_50
;

CREATE INDEX ix_measure_122_conj_51_patient_id ON results.measure_122_conj_51 (patient_id)
;

create or replace view results.measure_122_0_all as SELECT results.measure_122_patient_base.base_patient_id,
       results.measure_122_patient_base.so_39_audit_key_value,
       results.measure_122_patient_base.so_39_start_dt,
       results.measure_122_patient_base.so_39_end_dt,
       results.measure_122_patient_base.so_19_audit_key_value,
       results.measure_122_patient_base.so_19_start_dt,
       results.measure_122_patient_base.so_19_end_dt,
       results.measure_122_patient_base.so_37_audit_key_value,
       results.measure_122_patient_base.so_37_start_dt,
       results.measure_122_patient_base.so_37_end_dt,
       results.measure_122_patient_base.so_12_audit_key_value,
       results.measure_122_patient_base.so_12_start_dt,
       results.measure_122_patient_base.so_12_end_dt,

  (SELECT (EXISTS
             (SELECT anon_2.hqmf_test_diagnosis_active_patient_id,
                     anon_2.hqmf_test_diagnosis_active_start_dt,
                     anon_2.hqmf_test_diagnosis_active_end_dt,
                     anon_2.hqmf_test_diagnosis_active_audit_key_value
              FROM
                (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
                        hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
                        hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
                        hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
                 FROM hqmf_test.diagnosis_active
                 JOIN
                 valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.diagnosis_active.code
                 AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.103.12.1001'
                 WHERE hqmf_test.diagnosis_active.patient_id = results.measure_122_patient_base.base_patient_id
                   AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
                        OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)
                   AND (hqmf_test.diagnosis_active.end_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                        AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) >= hqmf_test.diagnosis_active.start_dt
                        OR hqmf_test.diagnosis_active.start_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                        AND hqmf_test.diagnosis_active.end_dt IS NULL
                        OR CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) <= hqmf_test.diagnosis_active.end_dt
                        AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) IS NULL
                        OR hqmf_test.diagnosis_active.start_dt IS NULL
                        AND hqmf_test.diagnosis_active.end_dt IS NULL)) AS anon_2))
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
              WHERE hqmf_test.patient_characteristic_birthdate.patient_id = results.measure_122_patient_base.base_patient_id
                AND (CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) = false)
                AND hqmf_test.patient_characteristic_birthdate.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 18) AS anon_3))
   AND (EXISTS
          (SELECT anon_4.hqmf_test_patient_characteristic_birthdate_patient_id,
                  anon_4.hqmf_test_patient_characteristic_birthdate_start_dt,
                  anon_4.hqmf_test_patient_characteristic_birthdate_end_dt,
                  anon_4.hqmf_test_patient_characteristic_birthdate_audit_key_valu_1
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
              WHERE hqmf_test.patient_characteristic_birthdate.patient_id = results.measure_122_patient_base.base_patient_id
                AND (CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) = false)
                AND hqmf_test.patient_characteristic_birthdate.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
                AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) < 75) AS anon_4))
   AND (EXISTS
          (SELECT anon_5.patient_id,
                  anon_5.start_dt,
                  anon_5.end_dt,
                  anon_5.audit_key_value,
                  anon_5.row_number_6
           FROM
             (SELECT results.measure_122_conj_44.patient_id AS patient_id,
                     results.measure_122_conj_44.start_dt AS start_dt,
                     results.measure_122_conj_44.end_dt AS end_dt,
                     results.measure_122_conj_44.audit_key_value AS audit_key_value,
                     CAST(row_number() OVER (PARTITION BY results.measure_122_conj_44.patient_id
                                             ORDER BY coalesce(results.measure_122_conj_44.start_dt, results.measure_122_conj_44.end_dt)) AS INTEGER) AS row_number_6
              FROM results.measure_122_conj_44
              WHERE results.measure_122_conj_44.patient_id = results.measure_122_patient_base.base_patient_id
                AND results.measure_122_conj_44.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND results.measure_122_conj_44.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_5)) AS anon_1) AS "initialPopulation",

  (SELECT (EXISTS
             (SELECT anon_7.patient_id,
                     anon_7.start_dt,
                     anon_7.end_dt,
                     anon_7.audit_key_value,
                     anon_7.row_number_13
              FROM
                (SELECT results.measure_122_conj_51.patient_id AS patient_id,
                        results.measure_122_conj_51.start_dt AS start_dt,
                        results.measure_122_conj_51.end_dt AS end_dt,
                        results.measure_122_conj_51.audit_key_value AS audit_key_value,
                        CAST(row_number() OVER (PARTITION BY results.measure_122_conj_51.patient_id
                                                ORDER BY coalesce(results.measure_122_conj_51.start_dt, results.measure_122_conj_51.end_dt)) AS INTEGER) AS row_number_13
                 FROM results.measure_122_conj_51
                 WHERE results.measure_122_conj_51.patient_id = results.measure_122_patient_base.base_patient_id) AS anon_7))
   OR (EXISTS
         (SELECT anon_8.patient_id,
                 anon_8.audit_key_value,
                 anon_8.start_dt,
                 anon_8.end_dt
          FROM
            (SELECT ordinal_1.patient_id AS patient_id,
                    ordinal_1.audit_key_value AS audit_key_value,
                    ordinal_1.start_dt AS start_dt,
                    ordinal_1.end_dt AS end_dt
             FROM
               (SELECT results.measure_122_so_target_1.patient_id AS patient_id,
                       results.measure_122_so_target_1.audit_key_value AS audit_key_value,
                       results.measure_122_so_target_1.start_dt AS start_dt,
                       results.measure_122_so_target_1.end_dt AS end_dt
                FROM results.measure_122_so_target_1
                WHERE results.measure_122_so_target_1.audit_key_value = results.measure_122_patient_base.so_37_audit_key_value
                  AND results.measure_122_so_target_1.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                  AND results.measure_122_so_target_1.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS ordinal_1
             WHERE false) AS anon_8))
   AND NOT EXISTS
     (SELECT anon_9.patient_id,
             anon_9.audit_key_value,
             anon_9.start_dt,
             anon_9.end_dt
      FROM
        (SELECT results.measure_122_so_target_1.patient_id AS patient_id,
                results.measure_122_so_target_1.audit_key_value AS audit_key_value,
                results.measure_122_so_target_1.start_dt AS start_dt,
                results.measure_122_so_target_1.end_dt AS end_dt
         FROM results.measure_122_so_target_1
         WHERE results.measure_122_so_target_1.audit_key_value = results.measure_122_patient_base.so_39_audit_key_value) AS anon_9)
   OR NOT EXISTS
     (SELECT anon_10.hqmf_test_laboratory_test_performed_patient_id,
             anon_10.hqmf_test_laboratory_test_performed_start_dt,
             anon_10.hqmf_test_laboratory_test_performed_end_dt,
             anon_10.hqmf_test_laboratory_test_performed_audit_key_value
      FROM
        (SELECT hqmf_test.laboratory_test_performed.patient_id AS hqmf_test_laboratory_test_performed_patient_id,
                hqmf_test.laboratory_test_performed.start_dt AS hqmf_test_laboratory_test_performed_start_dt,
                hqmf_test.laboratory_test_performed.end_dt AS hqmf_test_laboratory_test_performed_end_dt,
                hqmf_test.laboratory_test_performed.audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value
         FROM hqmf_test.laboratory_test_performed
         JOIN
         valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.laboratory_test_performed.code
         AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.198.12.1013'
         WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_122_patient_base.base_patient_id
           AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
                OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
           AND hqmf_test.laboratory_test_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
           AND hqmf_test.laboratory_test_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_10) AS anon_6) AS numerator
FROM results.measure_122_patient_base;

CREATE TABLE results.measure_122_0_patient_summary (
	patient_id INTEGER, 
	effective_ipp BOOLEAN, 
	effective_denom BOOLEAN, 
	effective_denex BOOLEAN, 
	effective_numer BOOLEAN, 
	effective_denexcep BOOLEAN
)


;

---window_colname is base_patient_id
INSERT INTO results.measure_122_0_patient_summary (patient_id, effective_ipp, effective_denom, effective_denex, effective_numer, effective_denexcep) SELECT DISTINCT anon_1.patient_id, anon_1.effective_ipp, anon_1.effective_denom, anon_1.effective_denex, anon_1.effective_numer, anon_1.effective_denexcep 
FROM (SELECT base_patient_id AS patient_id, "initialPopulation" AS effective_ipp, "initialPopulation" AS effective_denom, CAST(NULL AS BOOLEAN) AS effective_denex, "initialPopulation" AND numerator AS effective_numer, CAST(NULL AS BOOLEAN) AS effective_denexcep, rank() OVER (PARTITION BY base_patient_id ORDER BY ("initialPopulation" AND numerator) DESC, "initialPopulation" DESC) AS rank 
FROM results.measure_122_0_all 
WHERE "initialPopulation") AS anon_1 
WHERE anon_1.rank = 1
;

--multiple possibilities for index col
