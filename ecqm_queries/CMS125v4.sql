set search_path = results;

CREATE TABLE results.measure_125_patient_base (
	base_patient_id INTEGER
)


;

INSERT INTO results.measure_125_patient_base (base_patient_id)
SELECT base_patients.patient_id AS base_patient_id
FROM hqmf_test.patients AS base_patients
;

CREATE INDEX ix_measure_125_patient_base_patient_id ON results.measure_125_patient_base (base_patient_id)
;

---found pcsection 0

CREATE TABLE results.measure_125_conj_36 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_125_conj_36 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_30.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_30.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_30.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_30.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_125_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_125_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_30
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
   FROM results.measure_125_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_125_patient_base.base_patient_id
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
   FROM results.measure_125_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1025'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_125_patient_base.base_patient_id
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
   FROM results.measure_125_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.encounter_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1023'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_125_patient_base.base_patient_id
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
   FROM results.measure_125_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.encounter_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1016'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_125_patient_base.base_patient_id
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
   FROM results.measure_125_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.526.3.1240'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_125_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_35
;

CREATE INDEX ix_measure_125_conj_36_patient_id ON results.measure_125_conj_36 (patient_id)
;


CREATE TABLE results.measure_125_conj_43 (
	patient_id INTEGER, 
	start_dt TIMESTAMP WITHOUT TIME ZONE, 
	end_dt TIMESTAMP WITHOUT TIME ZONE, 
	audit_key_value BIGINT
)


;

INSERT INTO results.measure_125_conj_43 (patient_id, start_dt, end_dt, audit_key_value)
SELECT dc_37.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_37.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_37.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_37.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_125_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.encounter_performed.code
   AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1001'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_125_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_37
UNION
SELECT dc_38.hqmf_test_encounter_performed_patient_id AS patient_id,
       dc_38.hqmf_test_encounter_performed_start_dt AS start_dt,
       dc_38.hqmf_test_encounter_performed_end_dt AS end_dt,
       dc_38.hqmf_test_encounter_performed_audit_key_value AS audit_key_value
FROM
  (SELECT hqmf_test.encounter_performed.patient_id AS hqmf_test_encounter_performed_patient_id,
          hqmf_test.encounter_performed.start_dt AS hqmf_test_encounter_performed_start_dt,
          hqmf_test.encounter_performed.end_dt AS hqmf_test_encounter_performed_end_dt,
          hqmf_test.encounter_performed.audit_key_value AS hqmf_test_encounter_performed_audit_key_value
   FROM results.measure_125_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.encounter_performed.code
   AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1048'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_125_patient_base.base_patient_id
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
   FROM results.measure_125_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.encounter_performed.code
   AND code_lists_3.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1025'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_125_patient_base.base_patient_id
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
   FROM results.measure_125_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_4 ON code_lists_4.code = hqmf_test.encounter_performed.code
   AND code_lists_4.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1023'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_125_patient_base.base_patient_id
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
   FROM results.measure_125_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_5 ON code_lists_5.code = hqmf_test.encounter_performed.code
   AND code_lists_5.code_list_id = '2.16.840.1.113883.3.464.1003.101.12.1016'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_125_patient_base.base_patient_id
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
   FROM results.measure_125_patient_base,
        hqmf_test.encounter_performed
   JOIN
   valuesets.code_lists AS code_lists_6 ON code_lists_6.code = hqmf_test.encounter_performed.code
   AND code_lists_6.code_list_id = '2.16.840.1.113883.3.526.3.1240'
   WHERE hqmf_test.encounter_performed.patient_id = results.measure_125_patient_base.base_patient_id
     AND (CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) IS NULL
          OR CAST(hqmf_test.encounter_performed.negation AS BOOLEAN) = false)) AS dc_42
;

CREATE INDEX ix_measure_125_conj_43_patient_id ON results.measure_125_conj_43 (patient_id)
;

create or replace view results.measure_125_0_all as SELECT results.measure_125_patient_base.base_patient_id,

  (SELECT (EXISTS
             (SELECT anon_2.hqmf_test_procedure_performed_patient_id,
                     anon_2.hqmf_test_procedure_performed_start_dt,
                     anon_2.hqmf_test_procedure_performed_end_dt,
                     anon_2.hqmf_test_procedure_performed_audit_key_value
              FROM
                (SELECT hqmf_test.procedure_performed.patient_id AS hqmf_test_procedure_performed_patient_id,
                        hqmf_test.procedure_performed.start_dt AS hqmf_test_procedure_performed_start_dt,
                        hqmf_test.procedure_performed.end_dt AS hqmf_test_procedure_performed_end_dt,
                        hqmf_test.procedure_performed.audit_key_value AS hqmf_test_procedure_performed_audit_key_value
                 FROM hqmf_test.procedure_performed
                 JOIN
                 valuesets.code_lists AS code_lists_1 ON code_lists_1.code = hqmf_test.procedure_performed.code
                 AND code_lists_1.code_list_id = '2.16.840.1.113883.3.464.1003.198.12.1005'
                 WHERE hqmf_test.procedure_performed.patient_id = results.measure_125_patient_base.base_patient_id
                   AND (CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) IS NULL
                        OR CAST(hqmf_test.procedure_performed.negation AS BOOLEAN) = false)
                   AND hqmf_test.procedure_performed.end_dt < CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_2))
   AND (EXISTS
          (SELECT anon_4.anon_3
           FROM
             (SELECT NULL AS anon_3
              HAVING count(*) >= 2
              AND count(*) <= 2) AS anon_4)) AS anon_1) AS "denominatorExclusions",

  (SELECT EXISTS
     (SELECT anon_5.hqmf_test_diagnostic_study_performed_patient_id,
             anon_5.hqmf_test_diagnostic_study_performed_start_dt,
             anon_5.hqmf_test_diagnostic_study_performed_end_dt,
             anon_5.hqmf_test_diagnostic_study_performed_audit_key_value
      FROM
        (SELECT hqmf_test.diagnostic_study_performed.patient_id AS hqmf_test_diagnostic_study_performed_patient_id,
                hqmf_test.diagnostic_study_performed.start_dt AS hqmf_test_diagnostic_study_performed_start_dt,
                hqmf_test.diagnostic_study_performed.end_dt AS hqmf_test_diagnostic_study_performed_end_dt,
                hqmf_test.diagnostic_study_performed.audit_key_value AS hqmf_test_diagnostic_study_performed_audit_key_value
         FROM hqmf_test.diagnostic_study_performed
         JOIN
         valuesets.code_lists AS code_lists_2 ON code_lists_2.code = hqmf_test.diagnostic_study_performed.code
         AND code_lists_2.code_list_id = '2.16.840.1.113883.3.464.1003.108.12.1018'
         WHERE hqmf_test.diagnostic_study_performed.patient_id = results.measure_125_patient_base.base_patient_id
           AND (CAST(hqmf_test.diagnostic_study_performed.negation AS BOOLEAN) IS NULL
                OR CAST(hqmf_test.diagnostic_study_performed.negation AS BOOLEAN) = false)
           AND hqmf_test.diagnostic_study_performed.end_dt < CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
           AND month_delta(hqmf_test.diagnostic_study_performed.end_dt, CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
           AND month_delta(hqmf_test.diagnostic_study_performed.end_dt, CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) < 24) AS anon_5) AS xists) AS numerator,

  (SELECT (EXISTS
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
                 WHERE hqmf_test.patient_characteristic_birthdate.patient_id = results.measure_125_patient_base.base_patient_id
                   AND (CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) IS NULL
                        OR CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) = false)
                   AND hqmf_test.patient_characteristic_birthdate.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                   AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 41) AS anon_7))
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
              WHERE hqmf_test.patient_characteristic_birthdate.patient_id = results.measure_125_patient_base.base_patient_id
                AND (CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.patient_characteristic_birthdate.negation AS BOOLEAN) = false)
                AND hqmf_test.patient_characteristic_birthdate.start_dt < CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) >= 0
                AND year_delta(hqmf_test.patient_characteristic_birthdate.start_dt, CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) < 69) AS anon_8))
   AND (EXISTS
          (SELECT anon_9.hqmf_test_patient_characteristic_sex_patient_id,
                  anon_9.hqmf_test_patient_characteristic_sex_start_dt,
                  anon_9.hqmf_test_patient_characteristic_sex_end_dt,
                  anon_9.hqmf_test_patient_characteristic_sex_audit_key_value
           FROM
             (SELECT hqmf_test.patient_characteristic_sex.patient_id AS hqmf_test_patient_characteristic_sex_patient_id,
                     hqmf_test.patient_characteristic_sex.start_dt AS hqmf_test_patient_characteristic_sex_start_dt,
                     hqmf_test.patient_characteristic_sex.end_dt AS hqmf_test_patient_characteristic_sex_end_dt,
                     hqmf_test.patient_characteristic_sex.audit_key_value AS hqmf_test_patient_characteristic_sex_audit_key_value
              FROM hqmf_test.patient_characteristic_sex
              JOIN
              valuesets.code_lists AS code_lists_3 ON code_lists_3.code = hqmf_test.patient_characteristic_sex.code
              AND code_lists_3.code_list_id = '2.16.840.1.113883.3.560.100.2'
              WHERE hqmf_test.patient_characteristic_sex.patient_id = results.measure_125_patient_base.base_patient_id
                AND (CAST(hqmf_test.patient_characteristic_sex.negation AS BOOLEAN) IS NULL
                     OR CAST(hqmf_test.patient_characteristic_sex.negation AS BOOLEAN) = false)) AS anon_9))
   AND (EXISTS
          (SELECT anon_10.patient_id,
                  anon_10.start_dt,
                  anon_10.end_dt,
                  anon_10.audit_key_value,
                  anon_10.row_number_7
           FROM
             (SELECT results.measure_125_conj_43.patient_id AS patient_id,
                     results.measure_125_conj_43.start_dt AS start_dt,
                     results.measure_125_conj_43.end_dt AS end_dt,
                     results.measure_125_conj_43.audit_key_value AS audit_key_value,
                     CAST(row_number() OVER (PARTITION BY results.measure_125_conj_43.patient_id
                                             ORDER BY coalesce(results.measure_125_conj_43.start_dt, results.measure_125_conj_43.end_dt)) AS INTEGER) AS row_number_7
              FROM results.measure_125_conj_43
              WHERE results.measure_125_conj_43.patient_id = results.measure_125_patient_base.base_patient_id
                AND results.measure_125_conj_43.start_dt >= CAST('2015-01-01T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)
                AND results.measure_125_conj_43.end_dt <= CAST('2015-12-31T00:00:00' AS TIMESTAMP WITHOUT TIME ZONE)) AS anon_10)) AS anon_6) AS "initialPopulation"
FROM results.measure_125_patient_base;

CREATE TABLE results.measure_125_0_patient_summary (
	patient_id INTEGER, 
	effective_ipp BOOLEAN, 
	effective_denom BOOLEAN, 
	effective_denex BOOLEAN, 
	effective_numer BOOLEAN, 
	effective_denexcep BOOLEAN
)


;

---window_colname is base_patient_id
INSERT INTO results.measure_125_0_patient_summary (patient_id, effective_ipp, effective_denom, effective_denex, effective_numer, effective_denexcep) SELECT DISTINCT anon_1.patient_id, anon_1.effective_ipp, anon_1.effective_denom, anon_1.effective_denex, anon_1.effective_numer, anon_1.effective_denexcep 
FROM (SELECT base_patient_id AS patient_id, "initialPopulation" AS effective_ipp, "initialPopulation" AS effective_denom, "initialPopulation" AND "denominatorExclusions" AS effective_denex, "initialPopulation" AND NOT ("initialPopulation" AND "denominatorExclusions") AND numerator AS effective_numer, CAST(NULL AS BOOLEAN) AS effective_denexcep, rank() OVER (PARTITION BY base_patient_id ORDER BY ("initialPopulation" AND "denominatorExclusions") DESC, ("initialPopulation" AND NOT ("initialPopulation" AND "denominatorExclusions") AND numerator) DESC, "initialPopulation" DESC) AS rank 
FROM results.measure_125_0_all 
WHERE "initialPopulation") AS anon_1 
WHERE anon_1.rank = 1
;

