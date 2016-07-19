set search_path = results;

CREATE TABLE results.measure_134_patient_base (
	base_patient_id INTEGER
)


;

INSERT INTO results.measure_134_patient_base (base_patient_id)
SELECT base_patients.patient_id AS base_patient_id
FROM hqmf_test.patients AS base_patients
;

CREATE INDEX ix_measure_134_patient_base_patient_id ON results.measure_134_patient_base (base_patient_id)
;

---found pcsection 0

CREATE TABLE results.measure_134_conj_37 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_134_conj_37 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_32.hqmf_test_medication_active_patient_id AS patient_id,
       dc_32.hqmf_test_medication_active_start_dt AS start_dt,
       dc_32.hqmf_test_medication_active_end_dt AS end_dt,
       dc_32.hqmf_test_medication_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.medication_active.patient_id AS hqmf_test_medication_active_patient_id,
          hqmf_test.medication_active.start_dt AS hqmf_test_medication_active_start_dt,
          hqmf_test.medication_active.end_dt AS hqmf_test_medication_active_end_dt,
          hqmf_test.medication_active.audit_key_value AS hqmf_test_medication_active_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.medication_active
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.medication_active.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.526.3.1139'
   WHERE hqmf_test.medication_active.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.medication_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.medication_active.negation AS BOOLEAN) = false)) AS dc_32
UNION
SELECT dc_33.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_33.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_33.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_33.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1017'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_134_patient_base.base_patient_id
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
   FROM results.measure_134_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.diagnosis_active.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1018'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_34
UNION
SELECT dc_35.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_35.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_35.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_35.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.diagnosis_active.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1004'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_35
UNION
SELECT dc_36.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_36.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_36.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_36.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.diagnosis_active.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.526.3.1003'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_36
;

CREATE INDEX ix_measure_134_conj_37_patient_id ON results.measure_134_conj_37 (patient_id)
;


CREATE TABLE results.measure_134_conj_43 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_134_conj_43 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_38.hqmf_test_medication_active_patient_id AS patient_id,
       dc_38.hqmf_test_medication_active_start_dt AS start_dt,
       dc_38.hqmf_test_medication_active_end_dt AS end_dt,
       dc_38.hqmf_test_medication_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.medication_active.patient_id AS hqmf_test_medication_active_patient_id,
          hqmf_test.medication_active.start_dt AS hqmf_test_medication_active_start_dt,
          hqmf_test.medication_active.end_dt AS hqmf_test_medication_active_end_dt,
          hqmf_test.medication_active.audit_key_value AS hqmf_test_medication_active_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.medication_active
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.medication_active.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.526.3.1139'
   WHERE hqmf_test.medication_active.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.medication_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.medication_active.negation AS BOOLEAN) = false)) AS dc_38
UNION
SELECT dc_39.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_39.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_39.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_39.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1017'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_39
UNION
SELECT dc_40.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_40.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_40.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_40.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.diagnosis_active.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1018'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_134_patient_base.base_patient_id
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
   FROM results.measure_134_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.diagnosis_active.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1004'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_41
UNION
SELECT dc_42.hqmf_test_diagnosis_active_patient_id AS patient_id,
       dc_42.hqmf_test_diagnosis_active_start_dt AS start_dt,
       dc_42.hqmf_test_diagnosis_active_end_dt AS end_dt,
       dc_42.hqmf_test_diagnosis_active_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
          hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
          hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
          hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.diagnosis_active
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.diagnosis_active.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.526.3.1003'
   WHERE hqmf_test.diagnosis_active.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)) AS dc_42
;

CREATE INDEX ix_measure_134_conj_43_patient_id ON results.measure_134_conj_43 (patient_id)
;


CREATE TABLE results.measure_134_conj_52 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_134_conj_52 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_45.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_45.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_45.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_45.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.procedure_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1012'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_45
UNION
SELECT dc_46.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_46.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_46.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_46.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.procedure_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1011'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_46
UNION
SELECT dc_47.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_47.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_47.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_47.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.procedure_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1013'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_47
UNION
SELECT dc_48.hqmf_test_intervention_performed_patient_id AS patient_id,
       dc_48.hqmf_test_intervention_performed_start_dt AS start_dt,
       dc_48.hqmf_test_intervention_performed_end_dt AS end_dt,
       dc_48.hqmf_test_intervention_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.intervention_performed.patient_id AS hqmf_test_intervention_performed_patient_id,
          hqmf_test.intervention_performed.start_dt AS hqmf_test_intervention_performed_start_dt,
          hqmf_test.intervention_performed.end_dt AS hqmf_test_intervention_performed_end_dt,
          hqmf_test.intervention_performed.audit_key_value AS hqmf_test_intervention_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.intervention_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.intervention_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1015'
   WHERE hqmf_test.intervention_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.intervention_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.intervention_performed.negation AS BOOLEAN) = false)) AS dc_48
UNION
SELECT dc_49.hqmf_test_intervention_performed_patient_id AS patient_id,
       dc_49.hqmf_test_intervention_performed_start_dt AS start_dt,
       dc_49.hqmf_test_intervention_performed_end_dt AS end_dt,
       dc_49.hqmf_test_intervention_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.intervention_performed.patient_id AS hqmf_test_intervention_performed_patient_id,
          hqmf_test.intervention_performed.start_dt AS hqmf_test_intervention_performed_start_dt,
          hqmf_test.intervention_performed.end_dt AS hqmf_test_intervention_performed_end_dt,
          hqmf_test.intervention_performed.audit_key_value AS hqmf_test_intervention_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.intervention_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.intervention_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1016'
   WHERE hqmf_test.intervention_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.intervention_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.intervention_performed.negation AS BOOLEAN) = false)) AS dc_49
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
   FROM results.measure_134_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1014'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_50
UNION
SELECT dc_51.hqmf_test_laboratory_test_performed_patient_id AS patient_id,
       dc_51.hqmf_test_laboratory_test_performed_start_dt AS start_dt,
       dc_51.hqmf_test_laboratory_test_performed_end_dt AS end_dt,
       dc_51.hqmf_test_laboratory_test_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.laboratory_test_performed.patient_id AS hqmf_test_laboratory_test_performed_patient_id,
          hqmf_test.laboratory_test_performed.start_dt AS hqmf_test_laboratory_test_performed_start_dt,
          hqmf_test.laboratory_test_performed.end_dt AS hqmf_test_laboratory_test_performed_end_dt,
          hqmf_test.laboratory_test_performed.audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.laboratory_test_performed
   JOIN
   valuesets.code_lists AS code_lists_7 ON code_lists_7.code = hqmf_test.laboratory_test_performed.code
   AND code_lists_7.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1024'
   WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.laboratory_test_performed.value IS NOT NULL) AS dc_51
;

CREATE INDEX ix_measure_134_conj_52_patient_id ON results.measure_134_conj_52 (patient_id)
;


CREATE TABLE results.measure_134_conj_60 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_134_conj_60 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_53.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_53.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_53.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_53.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.procedure_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1012'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_53
UNION
SELECT dc_54.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_54.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_54.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_54.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.procedure_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1011'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_54
UNION
SELECT dc_55.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_55.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_55.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_55.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.procedure_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1013'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_55
UNION
SELECT dc_56.hqmf_test_intervention_performed_patient_id AS patient_id,
       dc_56.hqmf_test_intervention_performed_start_dt AS start_dt,
       dc_56.hqmf_test_intervention_performed_end_dt AS end_dt,
       dc_56.hqmf_test_intervention_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.intervention_performed.patient_id AS hqmf_test_intervention_performed_patient_id,
          hqmf_test.intervention_performed.start_dt AS hqmf_test_intervention_performed_start_dt,
          hqmf_test.intervention_performed.end_dt AS hqmf_test_intervention_performed_end_dt,
          hqmf_test.intervention_performed.audit_key_value AS hqmf_test_intervention_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.intervention_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.intervention_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1015'
   WHERE hqmf_test.intervention_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.intervention_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.intervention_performed.negation AS BOOLEAN) = false)) AS dc_56
UNION
SELECT dc_57.hqmf_test_intervention_performed_patient_id AS patient_id,
       dc_57.hqmf_test_intervention_performed_start_dt AS start_dt,
       dc_57.hqmf_test_intervention_performed_end_dt AS end_dt,
       dc_57.hqmf_test_intervention_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.intervention_performed.patient_id AS hqmf_test_intervention_performed_patient_id,
          hqmf_test.intervention_performed.start_dt AS hqmf_test_intervention_performed_start_dt,
          hqmf_test.intervention_performed.end_dt AS hqmf_test_intervention_performed_end_dt,
          hqmf_test.intervention_performed.audit_key_value AS hqmf_test_intervention_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.intervention_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.intervention_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1016'
   WHERE hqmf_test.intervention_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.intervention_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.intervention_performed.negation AS BOOLEAN) = false)) AS dc_57
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
   FROM results.measure_134_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1014'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_58
UNION
SELECT dc_59.hqmf_test_laboratory_test_performed_patient_id AS patient_id,
       dc_59.hqmf_test_laboratory_test_performed_start_dt AS start_dt,
       dc_59.hqmf_test_laboratory_test_performed_end_dt AS end_dt,
       dc_59.hqmf_test_laboratory_test_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.laboratory_test_performed.patient_id AS hqmf_test_laboratory_test_performed_patient_id,
          hqmf_test.laboratory_test_performed.start_dt AS hqmf_test_laboratory_test_performed_start_dt,
          hqmf_test.laboratory_test_performed.end_dt AS hqmf_test_laboratory_test_performed_end_dt,
          hqmf_test.laboratory_test_performed.audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.laboratory_test_performed
   JOIN
   valuesets.code_lists AS code_lists_7 ON code_lists_7.code = hqmf_test.laboratory_test_performed.code
   AND code_lists_7.code_list_id = '2.16.840.1.113883.3.464.1003.109.12.1024'
   WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.laboratory_test_performed.value IS NOT NULL) AS dc_59
;

CREATE INDEX ix_measure_134_conj_60_patient_id ON results.measure_134_conj_60 (patient_id)
;


CREATE TABLE results.measure_134_conj_71 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_134_conj_71 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_65.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_65.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_65.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_65.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_65
UNION
SELECT dc_66.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_66.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_66.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_66.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_66
UNION
SELECT dc_67.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_67.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_67.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_67.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1025'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_67
UNION
SELECT dc_68.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_68.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_68.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_68.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.encounter_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1023'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_68
UNION
SELECT dc_69.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_69.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_69.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_69.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.encounter_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1016'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_69
UNION
SELECT dc_70.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_70.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_70.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_70.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.526.3.1240'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_70
;

CREATE INDEX ix_measure_134_conj_71_patient_id ON results.measure_134_conj_71 (patient_id)
;


CREATE TABLE results.measure_134_conj_78 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_134_conj_78 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_72.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_72.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_72.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_72.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_72
UNION
SELECT dc_73.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_73.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_73.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_73.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_73
UNION
SELECT dc_74.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_74.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_74.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_74.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1025'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_74
UNION
SELECT dc_75.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_75.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_75.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_75.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.encounter_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1023'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_75
UNION
SELECT dc_76.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_76.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_76.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_76.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.encounter_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1016'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_76
UNION
SELECT dc_77.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_77.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_77.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_77.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_134_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.526.3.1240'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_134_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_77
;

CREATE INDEX ix_measure_134_conj_78_patient_id ON results.measure_134_conj_78 (patient_id)
;

create or replace view results.measure_134_0_all as SELECT results.measure_134_patient_base.base_patient_id,

  (SELECT (EXISTS
             (SELECT anon_2.patient_id,
                     anon_2.start_dt,
                     anon_2.end_dt,
                     anon_2.audit_key_value,
                     anon_2.row_number_24
              FROM
                (SELECT results.measure_134_conj_43.patient_id AS patient_id,
                        results.measure_134_conj_43.start_dt AS start_dt,
                        results.measure_134_conj_43.end_dt AS end_dt,
                        results.measure_134_conj_43.audit_key_value AS audit_key_value,
                        CAST(row_number() OVER (PARTITION BY results.measure_134_conj_43.patient_id
                                                ORDER BY coalesce(results.measure_134_conj_43.start_dt, results.measure_134_conj_43.end_dt)) AS INTEGER) AS row_number_24
                 FROM results.measure_134_conj_43
                 WHERE results.measure_134_conj_43.patient_id = results.measure_134_patient_base.base_patient_id
                   AND (results.measure_134_conj_43.end_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                        AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) >= results.measure_134_conj_43.start_dt
                        OR results.measure_134_conj_43.start_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                        AND results.measure_134_conj_43.end_dt IS NULL
                        OR CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) <= results.measure_134_conj_43.end_dt
                        AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) IS NULL
                        OR results.measure_134_conj_43.start_dt IS NULL
                        AND results.measure_134_conj_43.end_dt IS NULL)) AS anon_2))
   OR (EXISTS
         (SELECT anon_3.patient_id,
                 anon_3.start_dt,
                 anon_3.end_dt,
                 anon_3.audit_key_value,
                 anon_3.row_number_12
          FROM
            (SELECT results.measure_134_conj_60.patient_id AS patient_id,
                    results.measure_134_conj_60.start_dt AS start_dt,
                    results.measure_134_conj_60.end_dt AS end_dt,
                    results.measure_134_conj_60.audit_key_value AS audit_key_value,
                    CAST(row_number() OVER (PARTITION BY results.measure_134_conj_60.patient_id
                                            ORDER BY coalesce(results.measure_134_conj_60.start_dt, results.measure_134_conj_60.end_dt)) AS INTEGER) AS row_number_12
             FROM results.measure_134_conj_60
             WHERE results.measure_134_conj_60.patient_id = results.measure_134_patient_base.base_patient_id
               AND results.measure_134_conj_60.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
               AND results.measure_134_conj_60.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_3)) AS anon_1) AS numerator,

  (SELECT (EXISTS
             (SELECT anon_5.hqmf_test_patient_characteristic_birthdate_patient_id,
                     anon_5.hqmf_test_patient_characteristic_birthdate_start_dt,
                     anon_5.hqmf_test_patient_characteristic_birthdate_end_dt,
                     anon_5.hqmf_test_patient_characteristic_birthdate_audit_key_valu_1
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
                 WHERE hqmf_test.patient_characteristic_birthdate.patient_id = results.measure_134_patient_base.base_patient_id
                   AND (CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) IS NULL
                        OR CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) = false)
                   AND hqmf_test.patient_characteristic_birthdate.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                   AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 18) AS anon_5))
   AND (EXISTS
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
              valuesets.individual_code_map AS individual_code_map_2 ON individual_code_map_2.code = hqmf_test.patient_characteristic_birthdate.code
              AND individual_code_map_2.code_system_oid = '2.16.840.1.113883.6.1'
              AND individual_code_map_2.measure_code = '21112-8'
              WHERE hqmf_test.patient_characteristic_birthdate.patient_id = results.measure_134_patient_base.base_patient_id
                AND (CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) = false)
                AND hqmf_test.patient_characteristic_birthdate.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
                AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) < 75) AS anon_6))
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
              valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.diagnosis_active.code
              AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.103.12.1001'
              WHERE hqmf_test.diagnosis_active.patient_id = results.measure_134_patient_base.base_patient_id
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
                  anon_8.start_dt,
                  anon_8.end_dt,
                  anon_8.audit_key_value,
                  anon_8.row_number_8
           FROM
             (SELECT results.measure_134_conj_78.patient_id AS patient_id,
                     results.measure_134_conj_78.start_dt AS start_dt,
                     results.measure_134_conj_78.end_dt AS end_dt,
                     results.measure_134_conj_78.audit_key_value AS audit_key_value,
                     CAST(row_number() OVER (PARTITION BY results.measure_134_conj_78.patient_id
                                             ORDER BY coalesce(results.measure_134_conj_78.start_dt, results.measure_134_conj_78.end_dt)) AS INTEGER) AS row_number_8
              FROM results.measure_134_conj_78
              WHERE results.measure_134_conj_78.patient_id = results.measure_134_patient_base.base_patient_id
                AND results.measure_134_conj_78.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND results.measure_134_conj_78.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_8)) AS anon_4) AS "initialPopulation"
FROM results.measure_134_patient_base;

CREATE TABLE results.measure_134_0_patient_summary (
	patient_id INTEGER, 
	effective_ipp BOOLEAN, 
	effective_denom BOOLEAN, 
	effective_denex BOOLEAN, 
	effective_numer BOOLEAN, 
	effective_denexcep BOOLEAN
)


;

---window_colname is base_patient_id
INSERT INTO results.measure_134_0_patient_summary (patient_id, effective_ipp, effective_denom, effective_denex, effective_numer, effective_denexcep) SELECT DISTINCT anon_1.patient_id, anon_1.effective_ipp, anon_1.effective_denom, anon_1.effective_denex, anon_1.effective_numer, anon_1.effective_denexcep 
FROM (SELECT base_patient_id AS patient_id, "initialPopulation" AS effective_ipp, "initialPopulation" AS effective_denom, CAST(NULL AS BOOLEAN) AS effective_denex, "initialPopulation" AND numerator AS effective_numer, CAST(NULL AS BOOLEAN) AS effective_denexcep, rank() OVER (PARTITION BY base_patient_id ORDER BY ("initialPopulation" AND numerator) DESC, "initialPopulation" DESC) AS rank 
FROM results.measure_134_0_all 
WHERE "initialPopulation") AS anon_1 
WHERE anon_1.rank = 1
;

