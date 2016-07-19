set search_path = results;

CREATE TABLE results.measure_123_patient_base (
	base_patient_id INTEGER
)


;

INSERT INTO results.measure_123_patient_base (base_patient_id)
SELECT base_patients.patient_id AS base_patient_id
FROM hqmf_test.patients AS base_patients
;

CREATE INDEX ix_measure_123_patient_base_patient_id ON results.measure_123_patient_base (base_patient_id)
;

---found pcsection 0

CREATE TABLE results.measure_123_conj_35 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_123_conj_35 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_33.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_33.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_33.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_33.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_123_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.diagnosis_active.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.113.12.1057'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_123_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_33
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
   FROM results.measure_123_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.113.12.1059'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_123_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_34
;

CREATE INDEX ix_measure_123_conj_35_patient_id ON results.measure_123_conj_35 (patient_id)
;


CREATE TABLE results.measure_123_conj_38 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_123_conj_38 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_36.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_36.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_36.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_36.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_123_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.diagnosis_active.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.113.12.1057'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_123_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_36
UNION
SELECT dc_37.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_37.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_37.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_37.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_123_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.113.12.1059'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_123_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_37
;

CREATE INDEX ix_measure_123_conj_38_patient_id ON results.measure_123_conj_38 (patient_id)
;


CREATE TABLE results.measure_123_conj_42 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_123_conj_42 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_40.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_40.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_40.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_40.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_123_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.diagnosis_active.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.113.12.1058'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_123_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_40
UNION
SELECT dc_41.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_41.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_41.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_41.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_123_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.113.12.1059'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_123_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_41
;

CREATE INDEX ix_measure_123_conj_42_patient_id ON results.measure_123_conj_42 (patient_id)
;


CREATE TABLE results.measure_123_conj_45 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_123_conj_45 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_43.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_43.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_43.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_43.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_123_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.diagnosis_active.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.113.12.1058'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_123_patient_base.base_patient_id
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
   FROM results.measure_123_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.113.12.1059'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_123_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_44
;

CREATE INDEX ix_measure_123_conj_45_patient_id ON results.measure_123_conj_45 (patient_id)
;


CREATE TABLE results.measure_123_conj_56 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_123_conj_56 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_50.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_50.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_50.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_50.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_123_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_123_patient_base.base_patient_id
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
   FROM results.measure_123_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_123_patient_base.base_patient_id
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
   FROM results.measure_123_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1025'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_123_patient_base.base_patient_id
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
   FROM results.measure_123_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.encounter_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1023'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_123_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_53
UNION
SELECT dc_54.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_54.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_54.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_54.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_123_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.encounter_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1016'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_123_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_54
UNION
SELECT dc_55.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_55.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_55.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_55.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_123_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.526.3.1240'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_123_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_55
;

CREATE INDEX ix_measure_123_conj_56_patient_id ON results.measure_123_conj_56 (patient_id)
;


CREATE TABLE results.measure_123_conj_63 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_123_conj_63 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_57.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_57.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_57.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_57.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_123_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_123_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_57
UNION
SELECT dc_58.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_58.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_58.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_58.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_123_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_123_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_58
UNION
SELECT dc_59.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_59.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_59.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_59.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_123_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1025'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_123_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_59
UNION
SELECT dc_60.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_60.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_60.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_60.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_123_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.encounter_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1023'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_123_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_60
UNION
SELECT dc_61.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_61.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_61.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_61.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_123_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.encounter_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1016'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_123_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_61
UNION
SELECT dc_62.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_62.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_62.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_62.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_123_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.526.3.1240'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_123_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_62
;

CREATE INDEX ix_measure_123_conj_63_patient_id ON results.measure_123_conj_63 (patient_id)
;

create or replace view results.measure_123_0_all as SELECT results.measure_123_patient_base.base_patient_id,

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
                 AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.113.12.1056'
                 WHERE hqmf_test.diagnosis_active.patient_id = results.measure_123_patient_base.base_patient_id
                   AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
                        OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)
                   AND hqmf_test.diagnosis_active.start_dt < CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_2))
   AND (EXISTS
          (SELECT anon_3.patient_id,
                  anon_3.start_dt,
                  anon_3.end_dt,
                  anon_3.audit_key_value,
                  anon_3.row_number_18
           FROM
             (SELECT results.measure_123_conj_38.patient_id AS patient_id,
                     results.measure_123_conj_38.start_dt AS start_dt,
                     results.measure_123_conj_38.end_dt AS end_dt,
                     results.measure_123_conj_38.audit_key_value AS audit_key_value,
                     CAST(row_number() OVER (PARTITION BY results.measure_123_conj_38.patient_id
                                             ORDER BY coalesce(results.measure_123_conj_38.start_dt, results.measure_123_conj_38.end_dt)) AS INTEGER) AS row_number_18
              FROM results.measure_123_conj_38
              WHERE results.measure_123_conj_38.patient_id = results.measure_123_patient_base.base_patient_id
                AND results.measure_123_conj_38.start_dt < CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_3))
   AND (EXISTS
          (SELECT anon_4.patient_id,
                  anon_4.start_dt,
                  anon_4.end_dt,
                  anon_4.audit_key_value,
                  anon_4.row_number_20
           FROM
             (SELECT results.measure_123_conj_45.patient_id AS patient_id,
                     results.measure_123_conj_45.start_dt AS start_dt,
                     results.measure_123_conj_45.end_dt AS end_dt,
                     results.measure_123_conj_45.audit_key_value AS audit_key_value,
                     CAST(row_number() OVER (PARTITION BY results.measure_123_conj_45.patient_id
                                             ORDER BY coalesce(results.measure_123_conj_45.start_dt, results.measure_123_conj_45.end_dt)) AS INTEGER) AS row_number_20
              FROM results.measure_123_conj_45
              WHERE results.measure_123_conj_45.patient_id = results.measure_123_patient_base.base_patient_id
                AND results.measure_123_conj_45.start_dt < CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_4)) AS anon_1) AS "denominatorExclusions",

  (SELECT (EXISTS
             (SELECT anon_6.hqmf_test_diagnosis_active_patient_id,
                     anon_6.hqmf_test_diagnosis_active_start_dt,
                     anon_6.hqmf_test_diagnosis_active_end_dt,
                     anon_6.hqmf_test_diagnosis_active_audit_key_value
              FROM
                (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
                        hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
                        hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
                        hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
                 FROM hqmf_test.diagnosis_active
                 JOIN
                 valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
                 AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.103.12.1001'
                 WHERE hqmf_test.diagnosis_active.patient_id = results.measure_123_patient_base.base_patient_id
                   AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
                        OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)
                   AND (hqmf_test.diagnosis_active.end_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                        AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) >= hqmf_test.diagnosis_active.start_dt
                        OR hqmf_test.diagnosis_active.start_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                        AND hqmf_test.diagnosis_active.end_dt IS NULL
                        OR CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) <= hqmf_test.diagnosis_active.end_dt
                        AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) IS NULL
                        OR hqmf_test.diagnosis_active.start_dt IS NULL
                        AND hqmf_test.diagnosis_active.end_dt IS NULL)) AS anon_6))
   AND (EXISTS
          (SELECT anon_7.hqmf_test_patient_characteristic_birthdate_patient_id,
                  anon_7.hqmf_test_patient_characteristic_birthdate_start_dt,
                  anon_7.hqmf_test_patient_characteristic_birthdate_end_dt,
                  anon_7.hqmf_test_patient_characteristic_birthdate_audit_key_valu_1
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
              WHERE hqmf_test.patient_characteristic_birthdate.patient_id = results.measure_123_patient_base.base_patient_id
                AND (CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) = false)
                AND hqmf_test.patient_characteristic_birthdate.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 18) AS anon_7))
   AND (EXISTS
          (SELECT anon_8.hqmf_test_patient_characteristic_birthdate_patient_id,
                  anon_8.hqmf_test_patient_characteristic_birthdate_start_dt,
                  anon_8.hqmf_test_patient_characteristic_birthdate_end_dt,
                  anon_8.hqmf_test_patient_characteristic_birthdate_audit_key_valu_1
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
              WHERE hqmf_test.patient_characteristic_birthdate.patient_id = results.measure_123_patient_base.base_patient_id
                AND (CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) = false)
                AND hqmf_test.patient_characteristic_birthdate.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
                AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) < 75) AS anon_8))
   AND (EXISTS
          (SELECT anon_9.patient_id,
                  anon_9.start_dt,
                  anon_9.end_dt,
                  anon_9.audit_key_value,
                  anon_9.row_number_14
           FROM
             (SELECT results.measure_123_conj_63.patient_id AS patient_id,
                     results.measure_123_conj_63.start_dt AS start_dt,
                     results.measure_123_conj_63.end_dt AS end_dt,
                     results.measure_123_conj_63.audit_key_value AS audit_key_value,
                     CAST(row_number() OVER (PARTITION BY results.measure_123_conj_63.patient_id
                                             ORDER BY coalesce(results.measure_123_conj_63.start_dt, results.measure_123_conj_63.end_dt)) AS INTEGER) AS row_number_14
              FROM results.measure_123_conj_63
              WHERE results.measure_123_conj_63.patient_id = results.measure_123_patient_base.base_patient_id
                AND results.measure_123_conj_63.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND results.measure_123_conj_63.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_9)) AS anon_5) AS "initialPopulation",

  (SELECT (EXISTS
             (SELECT anon_11.hqmf_test_physical_exam_performed_patient_id,
                     anon_11.hqmf_test_physical_exam_performed_start_dt,
                     anon_11.hqmf_test_physical_exam_performed_end_dt,
                     anon_11.hqmf_test_physical_exam_performed_audit_key_value
              FROM
                (SELECT hqmf_test.physical_exam_performed.patient_id AS hqmf_test_physical_exam_performed_patient_id,
                        hqmf_test.physical_exam_performed.start_dt AS hqmf_test_physical_exam_performed_start_dt,
                        hqmf_test.physical_exam_performed.end_dt AS hqmf_test_physical_exam_performed_end_dt,
                        hqmf_test.physical_exam_performed.audit_key_value AS hqmf_test_physical_exam_performed_audit_key_value
                 FROM hqmf_test.physical_exam_performed
                 JOIN
                 valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.physical_exam_performed.code
                 AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.103.12.1013'
                 WHERE hqmf_test.physical_exam_performed.patient_id = results.measure_123_patient_base.base_patient_id
                   AND (CAST(hqmf_test.physical_exam_performed.negation AS BOOLEAN) IS NULL
                        OR CAST(hqmf_test.physical_exam_performed.negation AS BOOLEAN) = false)
                   AND hqmf_test.physical_exam_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                   AND hqmf_test.physical_exam_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_11))
   AND (EXISTS
          (SELECT anon_12.hqmf_test_physical_exam_performed_patient_id,
                  anon_12.hqmf_test_physical_exam_performed_start_dt,
                  anon_12.hqmf_test_physical_exam_performed_end_dt,
                  anon_12.hqmf_test_physical_exam_performed_audit_key_value
           FROM
             (SELECT hqmf_test.physical_exam_performed.patient_id AS hqmf_test_physical_exam_performed_patient_id,
                     hqmf_test.physical_exam_performed.start_dt AS hqmf_test_physical_exam_performed_start_dt,
                     hqmf_test.physical_exam_performed.end_dt AS hqmf_test_physical_exam_performed_end_dt,
                     hqmf_test.physical_exam_performed.audit_key_value AS hqmf_test_physical_exam_performed_audit_key_value
              FROM hqmf_test.physical_exam_performed
              JOIN
              valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.physical_exam_performed.code
              AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.103.12.1014'
              WHERE hqmf_test.physical_exam_performed.patient_id = results.measure_123_patient_base.base_patient_id
                AND (CAST(hqmf_test.physical_exam_performed.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.physical_exam_performed.negation AS BOOLEAN) = false)
                AND hqmf_test.physical_exam_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND hqmf_test.physical_exam_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_12))
   AND (EXISTS
          (SELECT anon_13.hqmf_test_physical_exam_performed_patient_id,
                  anon_13.hqmf_test_physical_exam_performed_start_dt,
                  anon_13.hqmf_test_physical_exam_performed_end_dt,
                  anon_13.hqmf_test_physical_exam_performed_audit_key_value
           FROM
             (SELECT hqmf_test.physical_exam_performed.patient_id AS hqmf_test_physical_exam_performed_patient_id,
                     hqmf_test.physical_exam_performed.start_dt AS hqmf_test_physical_exam_performed_start_dt,
                     hqmf_test.physical_exam_performed.end_dt AS hqmf_test_physical_exam_performed_end_dt,
                     hqmf_test.physical_exam_performed.audit_key_value AS hqmf_test_physical_exam_performed_audit_key_value
              FROM hqmf_test.physical_exam_performed
              JOIN
              valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.physical_exam_performed.code
              AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.103.12.1015'
              WHERE hqmf_test.physical_exam_performed.patient_id = results.measure_123_patient_base.base_patient_id
                AND (CAST(hqmf_test.physical_exam_performed.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.physical_exam_performed.negation AS BOOLEAN) = false)
                AND hqmf_test.physical_exam_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND hqmf_test.physical_exam_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_13)) AS anon_10) AS numerator
FROM results.measure_123_patient_base;

CREATE TABLE results.measure_123_0_patient_summary (
	patient_id INTEGER, 
	effective_ipp BOOLEAN, 
	effective_denom BOOLEAN, 
	effective_denex BOOLEAN, 
	effective_numer BOOLEAN, 
	effective_denexcep BOOLEAN
)


;

---window_colname is base_patient_id
INSERT INTO results.measure_123_0_patient_summary (patient_id, effective_ipp, effective_denom, effective_denex, effective_numer, effective_denexcep) SELECT DISTINCT anon_1.patient_id, anon_1.effective_ipp, anon_1.effective_denom, anon_1.effective_denex, anon_1.effective_numer, anon_1.effective_denexcep 
FROM (SELECT base_patient_id AS patient_id, "initialPopulation" AS effective_ipp, "initialPopulation" AS effective_denom, "initialPopulation" AND "denominatorExclusions" AS effective_denex, "initialPopulation" AND NOT ("initialPopulation" AND "denominatorExclusions") AND numerator AS effective_numer, CAST(NULL AS BOOLEAN) AS effective_denexcep, rank() OVER (PARTITION BY base_patient_id ORDER BY ("initialPopulation" AND "denominatorExclusions") DESC, ("initialPopulation" AND NOT ("initialPopulation" AND "denominatorExclusions") AND numerator) DESC, "initialPopulation" DESC) AS rank 
FROM results.measure_123_0_all 
WHERE "initialPopulation") AS anon_1 
WHERE anon_1.rank = 1
;

