--
-- Based on a schema-only PostgreSQL database dump
--

-- Dumped from database version 9.5.0
-- Dumped by pg_dump version 9.5.0
\ir defaults.sql

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN9';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: :vocab_schema; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA :vocab_schema;


SET search_path = :vocab_schema, pg_catalog;

--
-- Name: concept_extras_sequence; Type: SEQUENCE; Schema: :vocab_schema; Owner: -
--

CREATE SEQUENCE concept_extras_sequence
    START WITH 1000000001
    INCREMENT BY 1
    MINVALUE 1000000001
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: concept_extras; Type: TABLE; Schema: :vocab_schema; Owner: -
--

CREATE TABLE concept_extras (
    concept_id integer DEFAULT nextval('concept_extras_sequence'::regclass) NOT NULL,
    concept_name text NOT NULL,
    concept_level numeric NOT NULL,
    concept_class text NOT NULL,
    vocabulary_id integer NOT NULL,
    concept_code text NOT NULL,
    valid_start_date date NOT NULL,
    valid_end_date date DEFAULT '2099-12-31'::date NOT NULL,
    invalid_reason character(1)
);


--
-- Name: COLUMN concept_extras.concept_id; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_extras.concept_id IS 'A system-generated identifier to uniquely identify each concept across all concept types.';


--
-- Name: COLUMN concept_extras.concept_name; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_extras.concept_name IS 'An unambiguous, meaningful and descriptive name for the concept.';


--
-- Name: COLUMN concept_extras.concept_level; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_extras.concept_level IS 'The level of hierarchy associated with the concept. Different concept levels are assigned to concepts to depict their seniority in a clearly defined hierarchy, such as drugs, conditions, etc. A concept level of 0 is assigned to concepts that are not part of a standard vocabulary, but are part of the vocabulary for reference purposes (e.g. drug form).';


--
-- Name: COLUMN concept_extras.concept_class; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_extras.concept_class IS 'The category or class of the concept along both the hierarchical tree as well as different domains within a vocabulary. Examples are ''Clinical Drug'', ''Ingredient'', ''Clinical Finding'' etc.';


--
-- Name: COLUMN concept_extras.vocabulary_id; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_extras.vocabulary_id IS 'A foreign key to the vocabulary table indicating from which source the concept has been adapted.';


--
-- Name: COLUMN concept_extras.concept_code; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_extras.concept_code IS 'The concept code represents the identifier of the concept in the source data it originates from, such as SNOMED-CT concept IDs, RxNorm RXCUIs etc. Note that concept codes are not unique across vocabularies.';


--
-- Name: COLUMN concept_extras.valid_start_date; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_extras.valid_start_date IS 'The date when the was first recorded.';


--
-- Name: COLUMN concept_extras.valid_end_date; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_extras.valid_end_date IS 'The date when the concept became invalid because it was deleted or superseded (updated) by a new concept. The default value is 31-Dec-2099.';


--
-- Name: COLUMN concept_extras.invalid_reason; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_extras.invalid_reason IS 'Concepts that are replaced with a new concept are designated "Updated" (U) and concepts that are removed without replacement are "Deprecated" (D).';


--
-- Name: concept; Type: VIEW; Schema: :vocab_schema; Owner: -
--

CREATE VIEW concept AS
 SELECT concept_extras.concept_id,
    concept_extras.concept_name,
    concept_extras.concept_level,
    concept_extras.concept_class,
    concept_extras.vocabulary_id,
    concept_extras.concept_code,
    concept_extras.valid_start_date,
    concept_extras.valid_end_date,
    concept_extras.invalid_reason
   FROM concept_extras
UNION
 SELECT concept.concept_id,
    concept.concept_name,
    concept.concept_level,
    concept.concept_class,
    concept.vocabulary_id,
    concept.concept_code,
    concept.valid_start_date,
    concept.valid_end_date,
    concept.invalid_reason
   FROM :omop_vocab_schema.concept;


--
-- Name: vocabulary_extras_sequence; Type: SEQUENCE; Schema: :vocab_schema; Owner: -
--

CREATE SEQUENCE vocabulary_extras_sequence
    START WITH 40000
    INCREMENT BY 1
    MINVALUE 40000
    NO MAXVALUE
    CACHE 1;


--
-- Name: vocabulary_extras; Type: TABLE; Schema: :vocab_schema; Owner: -
--

CREATE TABLE vocabulary_extras (
    vocabulary_id integer DEFAULT nextval('vocabulary_extras_sequence'::regclass) NOT NULL,
    vocabulary_name text NOT NULL
);


--
-- Name: COLUMN vocabulary_extras.vocabulary_id; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN vocabulary_extras.vocabulary_id IS 'Unique identifier for each of the vocabulary sources used in the observational analysis.';


--
-- Name: COLUMN vocabulary_extras.vocabulary_name; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN vocabulary_extras.vocabulary_name IS 'Elaborative name for each of the vocabulary sources';


--
-- Name: vocabulary; Type: VIEW; Schema: :vocab_schema; Owner: -
--

CREATE VIEW vocabulary AS
 SELECT vocabulary_extras.vocabulary_id,
    vocabulary_extras.vocabulary_name
   FROM vocabulary_extras
UNION
 SELECT vocabulary.vocabulary_id,
    vocabulary.vocabulary_name
   FROM :omop_vocab_schema.vocabulary;


--
-- Name: concept_ancestor_extras; Type: TABLE; Schema: :vocab_schema; Owner: -
--

CREATE TABLE concept_ancestor_extras (
    ancestor_concept_id integer NOT NULL,
    descendant_concept_id integer NOT NULL,
    max_levels_of_separation numeric,
    min_levels_of_separation numeric
);


--
-- Name: COLUMN concept_ancestor_extras.ancestor_concept_id; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_ancestor_extras.ancestor_concept_id IS 'A foreign key to the concept code in the concept table for the higher-level concept that forms the ancestor in the relationship.';


--
-- Name: COLUMN concept_ancestor_extras.descendant_concept_id; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_ancestor_extras.descendant_concept_id IS 'A foreign key to the concept code in the concept table for the lower-level concept that forms the descendant in the relationship.';


--
-- Name: COLUMN concept_ancestor_extras.max_levels_of_separation; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_ancestor_extras.max_levels_of_separation IS 'The maximum separation in number of levels of hierarchy between ancestor and descendant concepts. This is an optional attribute that is used to simplify hierarchic analysis. ';


--
-- Name: COLUMN concept_ancestor_extras.min_levels_of_separation; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_ancestor_extras.min_levels_of_separation IS 'The minimum separation in number of levels of hierarchy between ancestor and descendant concepts. This is an optional attribute that is used to simplify hierarchic analysis.';


--
-- Name: concept_ancestor; Type: VIEW; Schema: :vocab_schema; Owner: -
--

CREATE VIEW concept_ancestor AS
 SELECT concept_ancestor_extras.ancestor_concept_id,
    concept_ancestor_extras.descendant_concept_id,
    concept_ancestor_extras.max_levels_of_separation,
    concept_ancestor_extras.min_levels_of_separation
   FROM concept_ancestor_extras
UNION
 SELECT concept_ancestor.ancestor_concept_id,
    concept_ancestor.descendant_concept_id,
    concept_ancestor.max_levels_of_separation,
    concept_ancestor.min_levels_of_separation
   FROM :omop_vocab_schema.concept_ancestor;


--
-- Name: concept_relationship_extras; Type: TABLE; Schema: :vocab_schema; Owner: -
--

CREATE TABLE concept_relationship_extras (
    concept_id_1 integer NOT NULL,
    concept_id_2 integer NOT NULL,
    relationship_id integer NOT NULL,
    valid_start_date date NOT NULL,
    valid_end_date date DEFAULT '2099-12-31'::date NOT NULL,
    invalid_reason character(1)
);


--
-- Name: COLUMN concept_relationship_extras.concept_id_1; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_relationship_extras.concept_id_1 IS 'A foreign key to the concept in the concept table associated with the relationship. Relationships are directional, and this field represents the source concept designation.';


--
-- Name: COLUMN concept_relationship_extras.concept_id_2; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_relationship_extras.concept_id_2 IS 'A foreign key to the concept in the concept table associated with the relationship. Relationships are directional, and this field represents the destination concept designation.';


--
-- Name: COLUMN concept_relationship_extras.relationship_id; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_relationship_extras.relationship_id IS 'The type of relationship as defined in the relationship table.';


--
-- Name: COLUMN concept_relationship_extras.valid_start_date; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_relationship_extras.valid_start_date IS 'The date when the the relationship was first recorded.';


--
-- Name: COLUMN concept_relationship_extras.valid_end_date; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_relationship_extras.valid_end_date IS 'The date when the relationship became invalid because it was deleted or superseded (updated) by a new relationship. Default value is 31-Dec-2099.';


--
-- Name: COLUMN concept_relationship_extras.invalid_reason; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN concept_relationship_extras.invalid_reason IS 'Reason the relationship was invalidated. Possible values are D (deleted), U (replaced with an update) or NULL when valid_end_date has the default  value.';


--
-- Name: concept_relationship; Type: VIEW; Schema: :vocab_schema; Owner: -
--

CREATE VIEW concept_relationship AS
 SELECT concept_relationship_extras.concept_id_1,
    concept_relationship_extras.concept_id_2,
    concept_relationship_extras.relationship_id,
    concept_relationship_extras.valid_start_date,
    concept_relationship_extras.valid_end_date,
    concept_relationship_extras.invalid_reason
   FROM concept_relationship_extras
UNION
 SELECT concept_relationship.concept_id_1,
    concept_relationship.concept_id_2,
    concept_relationship.relationship_id,
    concept_relationship.valid_start_date,
    concept_relationship.valid_end_date,
    concept_relationship.invalid_reason
   FROM :omop_vocab_schema.concept_relationship;


--
-- Name: drug_approval_extras; Type: TABLE; Schema: :vocab_schema; Owner: -
--

CREATE TABLE drug_approval_extras (
    ingredient_concept_id integer NOT NULL,
    approval_date date NOT NULL,
    approved_by text DEFAULT 'FDA'::text NOT NULL
);


--
-- Name: drug_approval; Type: VIEW; Schema: :vocab_schema; Owner: -
--

CREATE VIEW drug_approval AS
 SELECT drug_approval_extras.ingredient_concept_id,
    drug_approval_extras.approval_date,
    drug_approval_extras.approved_by
   FROM drug_approval_extras
UNION
 SELECT drug_approval.ingredient_concept_id,
    drug_approval.approval_date,
    drug_approval.approved_by
   FROM :omop_vocab_schema.drug_approval;


--
-- Name: drug_strength_extras; Type: TABLE; Schema: :vocab_schema; Owner: -
--

CREATE TABLE drug_strength_extras (
    drug_concept_id integer NOT NULL,
    ingredient_concept_id integer NOT NULL,
    amount_value numeric,
    amount_unit text,
    concentration_value numeric,
    concentration_enum_unit text,
    concentration_denom_unit text,
    valid_start_date date NOT NULL,
    valid_end_date date NOT NULL,
    invalid_reason text
);


--
-- Name: drug_strength; Type: VIEW; Schema: :vocab_schema; Owner: -
--

CREATE VIEW drug_strength AS
 SELECT drug_strength_extras.drug_concept_id,
    drug_strength_extras.ingredient_concept_id,
    drug_strength_extras.amount_value,
    drug_strength_extras.amount_unit,
    drug_strength_extras.concentration_value,
    drug_strength_extras.concentration_enum_unit,
    drug_strength_extras.concentration_denom_unit,
    drug_strength_extras.valid_start_date,
    drug_strength_extras.valid_end_date,
    drug_strength_extras.invalid_reason
   FROM drug_strength_extras
UNION
 SELECT drug_strength.drug_concept_id,
    drug_strength.ingredient_concept_id,
    drug_strength.amount_value,
    drug_strength.amount_unit,
    drug_strength.concentration_value,
    drug_strength.concentration_enum_unit,
    drug_strength.concentration_denom_unit,
    drug_strength.valid_start_date,
    drug_strength.valid_end_date,
    drug_strength.invalid_reason
   FROM :omop_vocab_schema.drug_strength;


--
-- Name: relationship_extras_sequence; Type: SEQUENCE; Schema: :vocab_schema; Owner: -
--

CREATE SEQUENCE relationship_extras_sequence
    START WITH 1000
    INCREMENT BY 1
    MINVALUE 1000
    NO MAXVALUE
    CACHE 1;


--
-- Name: relationship_extras; Type: TABLE; Schema: :vocab_schema; Owner: -
--

CREATE TABLE relationship_extras (
    relationship_id integer DEFAULT nextval('relationship_extras_sequence'::regclass) NOT NULL,
    relationship_name text NOT NULL,
    is_hierarchical integer NOT NULL,
    defines_ancestry integer DEFAULT 1 NOT NULL,
    reverse_relationship integer
);


--
-- Name: COLUMN relationship_extras.relationship_id; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN relationship_extras.relationship_id IS 'The type of relationship captured by the relationship record.';


--
-- Name: COLUMN relationship_extras.relationship_name; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN relationship_extras.relationship_name IS 'The text that describes the relationship type.';


--
-- Name: COLUMN relationship_extras.is_hierarchical; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN relationship_extras.is_hierarchical IS 'Defines whether a relationship defines concepts into classes or hierarchies. Values are Y for hierarchical relationship or NULL if not';


--
-- Name: COLUMN relationship_extras.defines_ancestry; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN relationship_extras.defines_ancestry IS 'Defines whether a hierarchical relationship contributes to the concept_ancestor table. These are subsets of the hierarchical relationships. Valid values are Y or NULL.';


--
-- Name: COLUMN relationship_extras.reverse_relationship; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN relationship_extras.reverse_relationship IS 'Relationship ID of the reverse relationship to this one. Corresponding records of reverse relationships have their concept_id_1 and concept_id_2 swapped.';


--
-- Name: relationship; Type: VIEW; Schema: :vocab_schema; Owner: -
--

CREATE VIEW relationship AS
 SELECT relationship_extras.relationship_id,
    relationship_extras.relationship_name,
    relationship_extras.is_hierarchical,
    relationship_extras.defines_ancestry,
    relationship_extras.reverse_relationship
   FROM relationship_extras
UNION
 SELECT relationship.relationship_id,
    relationship.relationship_name,
    relationship.is_hierarchical,
    relationship.defines_ancestry,
    relationship.reverse_relationship
   FROM :omop_vocab_schema.relationship;


--
-- Name: source_to_concept_map_extras; Type: TABLE; Schema: :vocab_schema; Owner: -
--

CREATE TABLE source_to_concept_map_extras (
    source_code text NOT NULL,
    source_vocabulary_id integer NOT NULL,
    source_code_description text,
    target_concept_id integer NOT NULL,
    target_vocabulary_id integer NOT NULL,
    mapping_type text,
    primary_map character(1),
    valid_start_date date NOT NULL,
    valid_end_date date DEFAULT '2099-12-31'::date NOT NULL,
    invalid_reason character(1),
    CONSTRAINT source_to_concept_map_invalid_reason_check CHECK ((invalid_reason = ANY (ARRAY['D'::bpchar, 'U'::bpchar])))
);


--
-- Name: COLUMN source_to_concept_map_extras.source_code; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN source_to_concept_map_extras.source_code IS 'The source code being translated into a standard concept.';


--
-- Name: COLUMN source_to_concept_map_extras.source_vocabulary_id; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN source_to_concept_map_extras.source_vocabulary_id IS 'A foreign key to the vocabulary table defining the vocabulary of the source code that is being mapped to the standard vocabulary.';


--
-- Name: COLUMN source_to_concept_map_extras.source_code_description; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN source_to_concept_map_extras.source_code_description IS 'An optional description for the source code. This is included as a convenience to compare the description of the source code to the name of the concept.';


--
-- Name: COLUMN source_to_concept_map_extras.target_concept_id; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN source_to_concept_map_extras.target_concept_id IS 'A foreign key to the concept to which the source code is being mapped.';


--
-- Name: COLUMN source_to_concept_map_extras.target_vocabulary_id; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN source_to_concept_map_extras.target_vocabulary_id IS 'A foreign key to the vocabulary table defining the vocabulary of the target concept.';


--
-- Name: COLUMN source_to_concept_map_extras.mapping_type; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN source_to_concept_map_extras.mapping_type IS 'A string identifying the observational data element being translated. Examples include ''DRUG'', ''CONDITION'', ''PROCEDURE'', ''PROCEDURE DRUG'' etc. It is important to pick the appropriate mapping record when the same source code is being mapped to different concepts in different contexts. As an example a procedure code for drug administration can be mapped to a procedure concept or a drug concept.';


--
-- Name: COLUMN source_to_concept_map_extras.primary_map; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN source_to_concept_map_extras.primary_map IS 'A boolean value identifying the primary mapping relationship for those sets where the source_code, the source_concept_type_id and the mapping type is identical (one-to-many mappings). The ETL will only consider the primary map. Permitted values are Y and null.';


--
-- Name: COLUMN source_to_concept_map_extras.valid_start_date; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN source_to_concept_map_extras.valid_start_date IS 'The date when the mapping instance was first recorded.';


--
-- Name: COLUMN source_to_concept_map_extras.valid_end_date; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN source_to_concept_map_extras.valid_end_date IS 'The date when the mapping instance became invalid because it was deleted or superseded (updated) by a new relationship. Default value is 31-Dec-2099.';


--
-- Name: COLUMN source_to_concept_map_extras.invalid_reason; Type: COMMENT; Schema: :vocab_schema; Owner: -
--

COMMENT ON COLUMN source_to_concept_map_extras.invalid_reason IS 'Reason the mapping instance was invalidated. Possible values are D (deleted), U (replaced with an update) or NULL when valid_end_date has the default  value.';


--
-- Name: source_to_concept_map; Type: VIEW; Schema: :vocab_schema; Owner: -
--

CREATE VIEW source_to_concept_map AS
 SELECT source_to_concept_map_extras.source_code,
    source_to_concept_map_extras.source_vocabulary_id,
    source_to_concept_map_extras.source_code_description,
    source_to_concept_map_extras.target_concept_id,
    source_to_concept_map_extras.target_vocabulary_id,
    source_to_concept_map_extras.mapping_type,
    source_to_concept_map_extras.primary_map,
    source_to_concept_map_extras.valid_start_date,
    source_to_concept_map_extras.valid_end_date,
    source_to_concept_map_extras.invalid_reason
   FROM source_to_concept_map_extras
UNION
 SELECT source_to_concept_map.source_code,
    source_to_concept_map.source_vocabulary_id,
    source_to_concept_map.source_code_description,
    source_to_concept_map.target_concept_id,
    source_to_concept_map.target_vocabulary_id,
    source_to_concept_map.mapping_type,
    source_to_concept_map.primary_map,
    source_to_concept_map.valid_start_date,
    source_to_concept_map.valid_end_date,
    source_to_concept_map.invalid_reason
   FROM :omop_vocab_schema.source_to_concept_map;


--
-- Name: concept_ancestor_extras_pkey; Type: CONSTRAINT; Schema: :vocab_schema; Owner: -
--

ALTER TABLE ONLY concept_ancestor_extras
    ADD CONSTRAINT concept_ancestor_extras_pkey PRIMARY KEY (ancestor_concept_id, descendant_concept_id);


--
-- Name: concept_extras_pkey; Type: CONSTRAINT; Schema: :vocab_schema; Owner: -
--

ALTER TABLE ONLY concept_extras
    ADD CONSTRAINT concept_extras_pkey PRIMARY KEY (concept_id);


--
-- Name: concept_relationship_extras_pkey; Type: CONSTRAINT; Schema: :vocab_schema; Owner: -
--

ALTER TABLE ONLY concept_relationship_extras
    ADD CONSTRAINT concept_relationship_extras_pkey PRIMARY KEY (concept_id_1, concept_id_2, relationship_id);


--
-- Name: relationship_extras_pkey; Type: CONSTRAINT; Schema: :vocab_schema; Owner: -
--

ALTER TABLE ONLY relationship_extras
    ADD CONSTRAINT relationship_extras_pkey PRIMARY KEY (relationship_id);

ALTER TABLE relationship_extras CLUSTER ON relationship_extras_pkey;


--
-- Name: source_to_concept_map_extras_pkey; Type: CONSTRAINT; Schema: :vocab_schema; Owner: -
--

ALTER TABLE ONLY source_to_concept_map_extras
    ADD CONSTRAINT source_to_concept_map_extras_pkey PRIMARY KEY (source_vocabulary_id, target_concept_id, source_code, valid_end_date);


--
-- Name: vocabulary_extras_pkey; Type: CONSTRAINT; Schema: :vocab_schema; Owner: -
--

ALTER TABLE ONLY vocabulary_extras
    ADD CONSTRAINT vocabulary_extras_pkey PRIMARY KEY (vocabulary_id);

ALTER TABLE vocabulary_extras CLUSTER ON vocabulary_extras_pkey;


--
-- Name: vocabulary_extras_vocabulary_name_key; Type: CONSTRAINT; Schema: :vocab_schema; Owner: -
--

ALTER TABLE ONLY vocabulary_extras
    ADD CONSTRAINT vocabulary_extras_vocabulary_name_key UNIQUE (vocabulary_name);


--
-- Name: concept_ancestor_extras_ancestor_concept_id_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX concept_ancestor_extras_ancestor_concept_id_idx ON concept_ancestor_extras USING btree (ancestor_concept_id);


--
-- Name: concept_ancestor_extras_descendant_concept_id_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX concept_ancestor_extras_descendant_concept_id_idx ON concept_ancestor_extras USING btree (descendant_concept_id);


--
-- Name: concept_concept_code_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX concept_concept_code_idx ON concept_extras USING btree (concept_code);


--
-- Name: concept_concept_code_vocab_id_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX concept_concept_code_vocab_id_idx ON concept_extras USING btree (concept_code, vocabulary_id);


--
-- Name: concept_extras_concept_class_concept_id_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX concept_extras_concept_class_concept_id_idx ON concept_extras USING btree (concept_class, concept_id);


--
-- Name: concept_extras_concept_code_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX concept_extras_concept_code_idx ON concept_extras USING btree (concept_code);


--
-- Name: concept_extras_concept_code_vocabulary_id_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX concept_extras_concept_code_vocabulary_id_idx ON concept_extras USING btree (concept_code, vocabulary_id);


--
-- Name: concept_extras_concept_id_concept_level_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX concept_extras_concept_id_concept_level_idx ON concept_extras USING btree (concept_id, concept_level);


--
-- Name: concept_extras_vocabulary_id_concept_class_concept_id_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX concept_extras_vocabulary_id_concept_class_concept_id_idx ON concept_extras USING btree (vocabulary_id, concept_class, concept_id);


--
-- Name: concept_extras_vocabulary_id_concept_code_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX concept_extras_vocabulary_id_concept_code_idx ON concept_extras USING btree (vocabulary_id, concept_code);


--
-- Name: concept_extras_vocabulary_id_concept_id_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX concept_extras_vocabulary_id_concept_id_idx ON concept_extras USING btree (vocabulary_id, concept_id);


--
-- Name: concept_relationship_extras_concept_id_1_concept_id_2_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX concept_relationship_extras_concept_id_1_concept_id_2_idx ON concept_relationship_extras USING btree (concept_id_1, concept_id_2);


--
-- Name: concept_relationship_extras_concept_id_2_concept_id_1_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX concept_relationship_extras_concept_id_2_concept_id_1_idx ON concept_relationship_extras USING btree (concept_id_2, concept_id_1);


--
-- Name: concept_vocab_code_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX concept_vocab_code_idx ON concept_extras USING btree (vocabulary_id, concept_code);

ALTER TABLE concept_extras CLUSTER ON concept_vocab_code_idx;


--
-- Name: source_to_concept_map_extras_source_code_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX source_to_concept_map_extras_source_code_idx ON source_to_concept_map_extras USING btree (source_code);


--
-- Name: source_to_concept_map_extras_source_code_source_vocabulary__idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX source_to_concept_map_extras_source_code_source_vocabulary__idx ON source_to_concept_map_extras USING btree (source_code, source_vocabulary_id, target_vocabulary_id) WHERE ((invalid_reason IS NULL) AND (primary_map = 'Y'::bpchar));


--
-- Name: source_to_concept_map_extras_source_vocabulary_id_source_co_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX source_to_concept_map_extras_source_vocabulary_id_source_co_idx ON source_to_concept_map_extras USING btree (source_vocabulary_id, source_code, target_vocabulary_id);


--
-- Name: source_to_concept_map_source_code_source_vocabulary_id_targ_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX source_to_concept_map_source_code_source_vocabulary_id_targ_idx ON source_to_concept_map_extras USING btree (source_code, source_vocabulary_id, target_vocabulary_id) WHERE ((invalid_reason IS NULL) AND (primary_map = 'Y'::bpchar));


--
-- Name: source_to_concept_map_source_idx; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX source_to_concept_map_source_idx ON source_to_concept_map_extras USING btree (source_vocabulary_id, source_code, target_vocabulary_id);

ALTER TABLE source_to_concept_map_extras CLUSTER ON source_to_concept_map_source_idx;


--
-- Name: x_an_an; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX x_an_an ON concept_ancestor_extras USING btree (ancestor_concept_id);


--
-- Name: x_an_d; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX x_an_d ON concept_ancestor_extras USING btree (descendant_concept_id);


--
-- Name: xcoc_id_lev; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX xcoc_id_lev ON concept_extras USING btree (concept_id, concept_level);


--
-- Name: xcon_2cd; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX xcon_2cd ON concept_extras USING btree (concept_class, concept_id);


--
-- Name: xcon_2id; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX xcon_2id ON concept_extras USING btree (vocabulary_id, concept_id);


--
-- Name: xcon_3cd; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX xcon_3cd ON concept_extras USING btree (vocabulary_id, concept_class, concept_id);


--
-- Name: xid12; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX xid12 ON concept_relationship_extras USING btree (concept_id_1, concept_id_2);

ALTER TABLE concept_relationship_extras CLUSTER ON xid12;


--
-- Name: xid21; Type: INDEX; Schema: :vocab_schema; Owner: -
--

CREATE INDEX xid21 ON concept_relationship_extras USING btree (concept_id_2, concept_id_1);


--
-- PostgreSQL database dump complete
--

