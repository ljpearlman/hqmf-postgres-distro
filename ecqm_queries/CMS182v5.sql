set search_path = results;

CREATE TABLE results.measure_182_patient_base (
	base_patient_id INTEGER
)


;

INSERT INTO results.measure_182_patient_base (base_patient_id)
SELECT base_patients.patient_id AS base_patient_id
FROM hqmf_test.patients AS base_patients
;

CREATE INDEX ix_measure_182_patient_base_patient_id ON results.measure_182_patient_base (base_patient_id)
;

---found pcsection 0

CREATE TABLE results.measure_182_conj_39 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_182_conj_39 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_37.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_37.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_37.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_37.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.procedure_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1010'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_37
UNION
SELECT dc_38.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_38.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_38.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_38.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.procedure_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1002'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_38
;

CREATE INDEX ix_measure_182_conj_39_patient_id ON results.measure_182_conj_39 (patient_id)
;


CREATE TABLE results.measure_182_conj_42 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_182_conj_42 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_40.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_40.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_40.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_40.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.procedure_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1010'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_40
UNION
SELECT dc_41.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_41.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_41.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_41.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.procedure_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1002'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_41
;

CREATE INDEX ix_measure_182_conj_42_patient_id ON results.measure_182_conj_42 (patient_id)
;


CREATE TABLE results.measure_182_conj_50 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_182_conj_50 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_44.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_44.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_44.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_44.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
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
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
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
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1025'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_46
UNION
SELECT dc_47.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_47.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_47.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_47.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.encounter_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1023'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_47
UNION
SELECT dc_48.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_48.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_48.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_48.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.encounter_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1016'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
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
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.526.3.1240'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_49
;

CREATE INDEX ix_measure_182_conj_50_patient_id ON results.measure_182_conj_50 (patient_id)
;


CREATE TABLE results.measure_182_conj_57 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_182_conj_57 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_51.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_51.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_51.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_51.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
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
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
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
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1025'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
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
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.encounter_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1023'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
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
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.encounter_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1016'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_55
UNION
SELECT dc_56.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_56.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_56.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_56.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.526.3.1240'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_56
;

CREATE INDEX ix_measure_182_conj_57_patient_id ON results.measure_182_conj_57 (patient_id)
;


CREATE TABLE results.measure_182_conj_61 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_182_conj_61 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_59.hqmf_test_laboratory_test_performed_patient_id AS patient_id,
       dc_59.hqmf_test_laboratory_test_performed_start_dt AS start_dt,
       dc_59.hqmf_test_laboratory_test_performed_end_dt AS end_dt,
       dc_59.hqmf_test_laboratory_test_performed_audit_key_value AS audit_key_value
FROM
  (SELECT ordinal_1.hqmf_test_laboratory_test_performed_patient_id AS hqmf_test_laboratory_test_performed_patient_id,
          ordinal_1.hqmf_test_laboratory_test_performed_start_dt AS hqmf_test_laboratory_test_performed_start_dt,
          ordinal_1.hqmf_test_laboratory_test_performed_end_dt AS hqmf_test_laboratory_test_performed_end_dt,
          ordinal_1.hqmf_test_laboratory_test_performed_audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value,
          ordinal_1.row_number_13 AS row_number_13
   FROM
     (SELECT hqmf_test.laboratory_test_performed.patient_id AS hqmf_test_laboratory_test_performed_patient_id,
             hqmf_test.laboratory_test_performed.start_dt AS hqmf_test_laboratory_test_performed_start_dt,
             hqmf_test.laboratory_test_performed.end_dt AS hqmf_test_laboratory_test_performed_end_dt,
             hqmf_test.laboratory_test_performed.audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value,
             CAST(row_number() OVER (PARTITION BY hqmf_test.laboratory_test_performed.patient_id
                                     ORDER BY coalesce(hqmf_test.laboratory_test_performed.start_dt, hqmf_test.laboratory_test_performed.end_dt) DESC) AS INTEGER) AS row_number_13
      FROM results.measure_182_patient_base,
           hqmf_test.laboratory_test_performed
      JOIN
      valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.laboratory_test_performed.code
      AND code_lists_1.code_list_id = '2.16.840.1.113883.3.117.1.7.1.215'
      WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_182_patient_base.base_patient_id
        AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
             OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
        AND hqmf_test.laboratory_test_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
        AND hqmf_test.laboratory_test_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
        AND hqmf_test.laboratory_test_performed.value IS NOT NULL) AS ordinal_1
   WHERE ordinal_1.row_number_13 = 1) AS dc_59 INTERSECT
SELECT dc_60.hqmf_test_laboratory_test_performed_patient_id AS patient_id,
       dc_60.hqmf_test_laboratory_test_performed_start_dt AS start_dt,
       dc_60.hqmf_test_laboratory_test_performed_end_dt AS end_dt,
       dc_60.hqmf_test_laboratory_test_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.laboratory_test_performed.patient_id AS hqmf_test_laboratory_test_performed_patient_id,
          hqmf_test.laboratory_test_performed.start_dt AS hqmf_test_laboratory_test_performed_start_dt,
          hqmf_test.laboratory_test_performed.end_dt AS hqmf_test_laboratory_test_performed_end_dt,
          hqmf_test.laboratory_test_performed.audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.laboratory_test_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.laboratory_test_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.117.1.7.1.215'
   WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.laboratory_test_performed.value < 100) AS dc_60
;

CREATE INDEX ix_measure_182_conj_61_patient_id ON results.measure_182_conj_61 (patient_id)
;


CREATE TABLE results.measure_182_conj_64 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_182_conj_64 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_62.hqmf_test_laboratory_test_performed_patient_id AS patient_id,
       dc_62.hqmf_test_laboratory_test_performed_start_dt AS start_dt,
       dc_62.hqmf_test_laboratory_test_performed_end_dt AS end_dt,
       dc_62.hqmf_test_laboratory_test_performed_audit_key_value AS audit_key_value
FROM
  (SELECT ordinal_1.hqmf_test_laboratory_test_performed_patient_id AS hqmf_test_laboratory_test_performed_patient_id,
          ordinal_1.hqmf_test_laboratory_test_performed_start_dt AS hqmf_test_laboratory_test_performed_start_dt,
          ordinal_1.hqmf_test_laboratory_test_performed_end_dt AS hqmf_test_laboratory_test_performed_end_dt,
          ordinal_1.hqmf_test_laboratory_test_performed_audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value,
          ordinal_1.row_number_13 AS row_number_13
   FROM
     (SELECT hqmf_test.laboratory_test_performed.patient_id AS hqmf_test_laboratory_test_performed_patient_id,
             hqmf_test.laboratory_test_performed.start_dt AS hqmf_test_laboratory_test_performed_start_dt,
             hqmf_test.laboratory_test_performed.end_dt AS hqmf_test_laboratory_test_performed_end_dt,
             hqmf_test.laboratory_test_performed.audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value,
             CAST(row_number() OVER (PARTITION BY hqmf_test.laboratory_test_performed.patient_id
                                     ORDER BY coalesce(hqmf_test.laboratory_test_performed.start_dt, hqmf_test.laboratory_test_performed.end_dt) DESC) AS INTEGER) AS row_number_13
      FROM results.measure_182_patient_base,
           hqmf_test.laboratory_test_performed
      JOIN
      valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.laboratory_test_performed.code
      AND code_lists_1.code_list_id = '2.16.840.1.113883.3.117.1.7.1.215'
      WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_182_patient_base.base_patient_id
        AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
             OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
        AND hqmf_test.laboratory_test_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
        AND hqmf_test.laboratory_test_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
        AND hqmf_test.laboratory_test_performed.value IS NOT NULL) AS ordinal_1
   WHERE ordinal_1.row_number_13 = 1) AS dc_62 INTERSECT
SELECT dc_63.hqmf_test_laboratory_test_performed_patient_id AS patient_id,
       dc_63.hqmf_test_laboratory_test_performed_start_dt AS start_dt,
       dc_63.hqmf_test_laboratory_test_performed_end_dt AS end_dt,
       dc_63.hqmf_test_laboratory_test_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.laboratory_test_performed.patient_id AS hqmf_test_laboratory_test_performed_patient_id,
          hqmf_test.laboratory_test_performed.start_dt AS hqmf_test_laboratory_test_performed_start_dt,
          hqmf_test.laboratory_test_performed.end_dt AS hqmf_test_laboratory_test_performed_end_dt,
          hqmf_test.laboratory_test_performed.audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.laboratory_test_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.laboratory_test_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.117.1.7.1.215'
   WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
     AND hqmf_test.laboratory_test_performed.value < 100) AS dc_63
;

CREATE INDEX ix_measure_182_conj_64_patient_id ON results.measure_182_conj_64 (patient_id)
;

create or replace view results.measure_182_0_all as SELECT results.measure_182_patient_base.base_patient_id,

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
                 WHERE hqmf_test.patient_characteristic_birthdate.patient_id = results.measure_182_patient_base.base_patient_id
                   AND (CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) IS NULL
                        OR CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) = false)
                   AND hqmf_test.patient_characteristic_birthdate.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                   AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 18) AS anon_2))
   AND ((EXISTS
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
               valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.diagnosis_active.code
               AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1001'
               WHERE hqmf_test.diagnosis_active.patient_id = results.measure_182_patient_base.base_patient_id
                 AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
                      OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)
                 AND hqmf_test.diagnosis_active.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                 AND month_delta(hqmf_test.diagnosis_active.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
                 AND month_delta(hqmf_test.diagnosis_active.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) <= 12) AS anon_3))
        OR (EXISTS
              (SELECT anon_4.hqmf_test_diagnosis_active_patient_id,
                      anon_4.hqmf_test_diagnosis_active_start_dt,
                      anon_4.hqmf_test_diagnosis_active_end_dt,
                      anon_4.hqmf_test_diagnosis_active_audit_key_value
               FROM
                 (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
                         hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
                         hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
                         hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
                  FROM hqmf_test.diagnosis_active
                  JOIN
                  valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
                  AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1003'
                  WHERE hqmf_test.diagnosis_active.patient_id = results.measure_182_patient_base.base_patient_id
                    AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
                         OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)
                    AND (hqmf_test.diagnosis_active.end_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                         AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) >= hqmf_test.diagnosis_active.start_dt
                         OR hqmf_test.diagnosis_active.start_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                         AND hqmf_test.diagnosis_active.end_dt IS NULL
                         OR CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) <= hqmf_test.diagnosis_active.end_dt
                         AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) IS NULL
                         OR hqmf_test.diagnosis_active.start_dt IS NULL
                         AND hqmf_test.diagnosis_active.end_dt IS NULL)) AS anon_4))
        OR (EXISTS
              (SELECT anon_5.patient_id,
                      anon_5.start_dt,
                      anon_5.end_dt,
                      anon_5.audit_key_value,
                      anon_5.row_number_27
               FROM
                 (SELECT results.measure_182_conj_42.patient_id AS patient_id,
                         results.measure_182_conj_42.start_dt AS start_dt,
                         results.measure_182_conj_42.end_dt AS end_dt,
                         results.measure_182_conj_42.audit_key_value AS audit_key_value,
                         CAST(row_number() OVER (PARTITION BY results.measure_182_conj_42.patient_id
                                                 ORDER BY coalesce(results.measure_182_conj_42.start_dt, results.measure_182_conj_42.end_dt)) AS INTEGER) AS row_number_27
                  FROM results.measure_182_conj_42
                  WHERE results.measure_182_conj_42.patient_id = results.measure_182_patient_base.base_patient_id
                    AND results.measure_182_conj_42.end_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                    AND month_delta(results.measure_182_conj_42.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
                    AND month_delta(results.measure_182_conj_42.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) <= 12) AS anon_5)))
   AND (EXISTS
          (SELECT anon_6.patient_id,
                  anon_6.start_dt,
                  anon_6.end_dt,
                  anon_6.audit_key_value,
                  anon_6.row_number_12
           FROM
             (SELECT results.measure_182_conj_57.patient_id AS patient_id,
                     results.measure_182_conj_57.start_dt AS start_dt,
                     results.measure_182_conj_57.end_dt AS end_dt,
                     results.measure_182_conj_57.audit_key_value AS audit_key_value,
                     CAST(row_number() OVER (PARTITION BY results.measure_182_conj_57.patient_id
                                             ORDER BY coalesce(results.measure_182_conj_57.start_dt, results.measure_182_conj_57.end_dt)) AS INTEGER) AS row_number_12
              FROM results.measure_182_conj_57
              WHERE results.measure_182_conj_57.patient_id = results.measure_182_patient_base.base_patient_id
                AND results.measure_182_conj_57.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND results.measure_182_conj_57.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_6)) AS anon_1) AS "initialPopulation",

  (SELECT EXISTS
     (SELECT anon_7.patient_id,
             anon_7.start_dt,
             anon_7.end_dt,
             anon_7.audit_key_value,
             anon_7.row_number_19
      FROM
        (SELECT results.measure_182_conj_64.patient_id AS patient_id,
                results.measure_182_conj_64.start_dt AS start_dt,
                results.measure_182_conj_64.end_dt AS end_dt,
                results.measure_182_conj_64.audit_key_value AS audit_key_value,
                CAST(row_number() OVER (PARTITION BY results.measure_182_conj_64.patient_id
                                        ORDER BY coalesce(results.measure_182_conj_64.start_dt, results.measure_182_conj_64.end_dt)) AS INTEGER) AS row_number_19
         FROM results.measure_182_conj_64
         WHERE results.measure_182_conj_64.patient_id = results.measure_182_patient_base.base_patient_id) AS anon_7) AS xists) AS numerator
FROM results.measure_182_patient_base;

CREATE TABLE results.measure_182_0_patient_summary (
	patient_id INTEGER, 
	effective_ipp BOOLEAN, 
	effective_denom BOOLEAN, 
	effective_denex BOOLEAN, 
	effective_numer BOOLEAN, 
	effective_denexcep BOOLEAN
)


;

---window_colname is base_patient_id
INSERT INTO results.measure_182_0_patient_summary (patient_id, effective_ipp, effective_denom, effective_denex, effective_numer, effective_denexcep) SELECT DISTINCT anon_1.patient_id, anon_1.effective_ipp, anon_1.effective_denom, anon_1.effective_denex, anon_1.effective_numer, anon_1.effective_denexcep 
FROM (SELECT base_patient_id AS patient_id, "initialPopulation" AS effective_ipp, "initialPopulation" AS effective_denom, CAST(NULL AS BOOLEAN) AS effective_denex, "initialPopulation" AND numerator AS effective_numer, CAST(NULL AS BOOLEAN) AS effective_denexcep, rank() OVER (PARTITION BY base_patient_id ORDER BY ("initialPopulation" AND numerator) DESC, "initialPopulation" DESC) AS rank 
FROM results.measure_182_0_all 
WHERE "initialPopulation") AS anon_1 
WHERE anon_1.rank = 1
;

---found pcsection 1

CREATE TABLE results.measure_182_conj_71 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_182_conj_71 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_69.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_69.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_69.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_69.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.procedure_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1010'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_69
UNION
SELECT dc_70.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_70.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_70.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_70.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.procedure_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1002'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_70
;

CREATE INDEX ix_measure_182_conj_71_patient_id ON results.measure_182_conj_71 (patient_id)
;


CREATE TABLE results.measure_182_conj_74 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_182_conj_74 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_72.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_72.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_72.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_72.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.procedure_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1010'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_72
UNION
SELECT dc_73.hqmf_test_procedure_performed_patient_id AS patient_id,
       dc_73.hqmf_test_procedure_performed_start_dt AS start_dt,
       dc_73.hqmf_test_procedure_performed_end_dt AS end_dt,
       dc_73.hqmf_test_procedure_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
          hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
          hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
          hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.procedure_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.procedure_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1002'
   WHERE hqmf_test.procedure_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)) AS dc_73
;

CREATE INDEX ix_measure_182_conj_74_patient_id ON results.measure_182_conj_74 (patient_id)
;


CREATE TABLE results.measure_182_conj_82 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_182_conj_82 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_76.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_76.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_76.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_76.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
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
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_77
UNION
SELECT dc_78.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_78.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_78.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_78.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1025'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_78
UNION
SELECT dc_79.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_79.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_79.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_79.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.encounter_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1023'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_79
UNION
SELECT dc_80.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_80.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_80.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_80.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.encounter_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1016'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_80
UNION
SELECT dc_81.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_81.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_81.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_81.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.526.3.1240'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_81
;

CREATE INDEX ix_measure_182_conj_82_patient_id ON results.measure_182_conj_82 (patient_id)
;


CREATE TABLE results.measure_182_conj_89 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_182_conj_89 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_83.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_83.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_83.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_83.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_83
UNION
SELECT dc_84.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_84.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_84.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_84.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_84
UNION
SELECT dc_85.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_85.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_85.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_85.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1025'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_85
UNION
SELECT dc_86.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_86.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_86.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_86.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.encounter_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1023'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_86
UNION
SELECT dc_87.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_87.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_87.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_87.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.encounter_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1016'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_87
UNION
SELECT dc_88.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_88.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_88.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_88.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_182_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.526.3.1240'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_182_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_88
;

CREATE INDEX ix_measure_182_conj_89_patient_id ON results.measure_182_conj_89 (patient_id)
;

create or replace view results.measure_182_1_all as SELECT results.measure_182_patient_base.base_patient_id,

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
                 WHERE hqmf_test.patient_characteristic_birthdate.patient_id = results.measure_182_patient_base.base_patient_id
                   AND (CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) IS NULL
                        OR CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) = false)
                   AND hqmf_test.patient_characteristic_birthdate.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                   AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 18) AS anon_2))
   AND ((EXISTS
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
               valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.diagnosis_active.code
               AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1001'
               WHERE hqmf_test.diagnosis_active.patient_id = results.measure_182_patient_base.base_patient_id
                 AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
                      OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)
                 AND hqmf_test.diagnosis_active.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                 AND month_delta(hqmf_test.diagnosis_active.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
                 AND month_delta(hqmf_test.diagnosis_active.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) <= 12) AS anon_3))
        OR (EXISTS
              (SELECT anon_4.hqmf_test_diagnosis_active_patient_id,
                      anon_4.hqmf_test_diagnosis_active_start_dt,
                      anon_4.hqmf_test_diagnosis_active_end_dt,
                      anon_4.hqmf_test_diagnosis_active_audit_key_value
               FROM
                 (SELECT hqmf_test.diagnosis_active.patient_id AS hqmf_test_diagnosis_active_patient_id,
                         hqmf_test.diagnosis_active.start_dt AS hqmf_test_diagnosis_active_start_dt,
                         hqmf_test.diagnosis_active.end_dt AS hqmf_test_diagnosis_active_end_dt,
                         hqmf_test.diagnosis_active.audit_key_value AS hqmf_test_diagnosis_active_audit_key_value
                  FROM hqmf_test.diagnosis_active
                  JOIN
                  valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnosis_active.code
                  AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1003'
                  WHERE hqmf_test.diagnosis_active.patient_id = results.measure_182_patient_base.base_patient_id
                    AND (CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) IS NULL
                         OR CAST(hqmf_test.diagnosis_active.negation AS BOOLEAN) = false)
                    AND (hqmf_test.diagnosis_active.end_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                         AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) >= hqmf_test.diagnosis_active.start_dt
                         OR hqmf_test.diagnosis_active.start_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                         AND hqmf_test.diagnosis_active.end_dt IS NULL
                         OR CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) <= hqmf_test.diagnosis_active.end_dt
                         AND CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE) IS NULL
                         OR hqmf_test.diagnosis_active.start_dt IS NULL
                         AND hqmf_test.diagnosis_active.end_dt IS NULL)) AS anon_4))
        OR (EXISTS
              (SELECT anon_5.patient_id,
                      anon_5.start_dt,
                      anon_5.end_dt,
                      anon_5.audit_key_value,
                      anon_5.row_number_27
               FROM
                 (SELECT results.measure_182_conj_74.patient_id AS patient_id,
                         results.measure_182_conj_74.start_dt AS start_dt,
                         results.measure_182_conj_74.end_dt AS end_dt,
                         results.measure_182_conj_74.audit_key_value AS audit_key_value,
                         CAST(row_number() OVER (PARTITION BY results.measure_182_conj_74.patient_id
                                                 ORDER BY coalesce(results.measure_182_conj_74.start_dt, results.measure_182_conj_74.end_dt)) AS INTEGER) AS row_number_27
                  FROM results.measure_182_conj_74
                  WHERE results.measure_182_conj_74.patient_id = results.measure_182_patient_base.base_patient_id
                    AND results.measure_182_conj_74.end_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                    AND month_delta(results.measure_182_conj_74.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
                    AND month_delta(results.measure_182_conj_74.end_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) <= 12) AS anon_5)))
   AND (EXISTS
          (SELECT anon_6.patient_id,
                  anon_6.start_dt,
                  anon_6.end_dt,
                  anon_6.audit_key_value,
                  anon_6.row_number_12
           FROM
             (SELECT results.measure_182_conj_89.patient_id AS patient_id,
                     results.measure_182_conj_89.start_dt AS start_dt,
                     results.measure_182_conj_89.end_dt AS end_dt,
                     results.measure_182_conj_89.audit_key_value AS audit_key_value,
                     CAST(row_number() OVER (PARTITION BY results.measure_182_conj_89.patient_id
                                             ORDER BY coalesce(results.measure_182_conj_89.start_dt, results.measure_182_conj_89.end_dt)) AS INTEGER) AS row_number_12
              FROM results.measure_182_conj_89
              WHERE results.measure_182_conj_89.patient_id = results.measure_182_patient_base.base_patient_id
                AND results.measure_182_conj_89.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND results.measure_182_conj_89.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_6)) AS anon_1) AS "initialPopulation",

  (SELECT (EXISTS
             (SELECT anon_8.hqmf_test_laboratory_test_performed_patient_id,
                     anon_8.hqmf_test_laboratory_test_performed_start_dt,
                     anon_8.hqmf_test_laboratory_test_performed_end_dt,
                     anon_8.hqmf_test_laboratory_test_performed_audit_key_value
              FROM
                (SELECT hqmf_test.laboratory_test_performed.patient_id AS hqmf_test_laboratory_test_performed_patient_id,
                        hqmf_test.laboratory_test_performed.start_dt AS hqmf_test_laboratory_test_performed_start_dt,
                        hqmf_test.laboratory_test_performed.end_dt AS hqmf_test_laboratory_test_performed_end_dt,
                        hqmf_test.laboratory_test_performed.audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value
                 FROM hqmf_test.laboratory_test_performed
                 JOIN
                 valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.laboratory_test_performed.code
                 AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1013'
                 WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_182_patient_base.base_patient_id
                   AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
                        OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
                   AND hqmf_test.laboratory_test_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                   AND hqmf_test.laboratory_test_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                   AND hqmf_test.laboratory_test_performed.value IS NOT NULL) AS anon_8))
   AND (EXISTS
          (SELECT anon_9.hqmf_test_laboratory_test_performed_patient_id,
                  anon_9.hqmf_test_laboratory_test_performed_start_dt,
                  anon_9.hqmf_test_laboratory_test_performed_end_dt,
                  anon_9.hqmf_test_laboratory_test_performed_audit_key_value
           FROM
             (SELECT hqmf_test.laboratory_test_performed.patient_id AS hqmf_test_laboratory_test_performed_patient_id,
                     hqmf_test.laboratory_test_performed.start_dt AS hqmf_test_laboratory_test_performed_start_dt,
                     hqmf_test.laboratory_test_performed.end_dt AS hqmf_test_laboratory_test_performed_end_dt,
                     hqmf_test.laboratory_test_performed.audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value
              FROM hqmf_test.laboratory_test_performed
              JOIN
              valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.laboratory_test_performed.code
              AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1012'
              WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_182_patient_base.base_patient_id
                AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
                AND hqmf_test.laboratory_test_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND hqmf_test.laboratory_test_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND hqmf_test.laboratory_test_performed.value IS NOT NULL) AS anon_9))
   AND (EXISTS
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
              valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.laboratory_test_performed.code
              AND code_lists_5.code_list_id = '2.16.840.1.113883.3.117.1.7.1.215'
              WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_182_patient_base.base_patient_id
                AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
                AND hqmf_test.laboratory_test_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND hqmf_test.laboratory_test_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND hqmf_test.laboratory_test_performed.value IS NOT NULL) AS anon_10))
   AND (EXISTS
          (SELECT anon_11.hqmf_test_laboratory_test_performed_patient_id,
                  anon_11.hqmf_test_laboratory_test_performed_start_dt,
                  anon_11.hqmf_test_laboratory_test_performed_end_dt,
                  anon_11.hqmf_test_laboratory_test_performed_audit_key_value
           FROM
             (SELECT hqmf_test.laboratory_test_performed.patient_id AS hqmf_test_laboratory_test_performed_patient_id,
                     hqmf_test.laboratory_test_performed.start_dt AS hqmf_test_laboratory_test_performed_start_dt,
                     hqmf_test.laboratory_test_performed.end_dt AS hqmf_test_laboratory_test_performed_end_dt,
                     hqmf_test.laboratory_test_performed.audit_key_value AS hqmf_test_laboratory_test_performed_audit_key_value
              FROM hqmf_test.laboratory_test_performed
              JOIN
              valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.laboratory_test_performed.code
              AND code_lists_6.code_list_id = '2.16.840.1.113883.3.464.1003.104.12.1014'
              WHERE hqmf_test.laboratory_test_performed.patient_id = results.measure_182_patient_base.base_patient_id
                AND (CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.laboratory_test_performed.negation AS BOOLEAN) = false)
                AND hqmf_test.laboratory_test_performed.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND hqmf_test.laboratory_test_performed.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND hqmf_test.laboratory_test_performed.value IS NOT NULL) AS anon_11)) AS anon_7) AS numerator
FROM results.measure_182_patient_base;

CREATE TABLE results.measure_182_1_patient_summary (
	patient_id INTEGER, 
	effective_ipp BOOLEAN, 
	effective_denom BOOLEAN, 
	effective_denex BOOLEAN, 
	effective_numer BOOLEAN, 
	effective_denexcep BOOLEAN
)


;

---window_colname is base_patient_id
INSERT INTO results.measure_182_1_patient_summary (patient_id, effective_ipp, effective_denom, effective_denex, effective_numer, effective_denexcep) SELECT DISTINCT anon_1.patient_id, anon_1.effective_ipp, anon_1.effective_denom, anon_1.effective_denex, anon_1.effective_numer, anon_1.effective_denexcep 
FROM (SELECT base_patient_id AS patient_id, "initialPopulation" AS effective_ipp, "initialPopulation" AS effective_denom, CAST(NULL AS BOOLEAN) AS effective_denex, "initialPopulation" AND numerator AS effective_numer, CAST(NULL AS BOOLEAN) AS effective_denexcep, rank() OVER (PARTITION BY base_patient_id ORDER BY ("initialPopulation" AND numerator) DESC, "initialPopulation" DESC) AS rank 
FROM results.measure_182_1_all 
WHERE "initialPopulation") AS anon_1 
WHERE anon_1.rank = 1
;

