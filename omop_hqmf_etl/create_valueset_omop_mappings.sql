\ir defaults.sql
set search_path = :valueset_schema, :vocab_schema;

create table :valueset_schema.hqmf_code_lists (
  code integer,
  code_list_id text
);

create index hqmf_code_lists_code_idx on hqmf_code_lists(code);
create index hqmf_code_lists_code_list_id_idx on hqmf_code_lists(code_list_id);
cluster hqmf_code_lists using hqmf_code_lists_code_idx;

comment on table hqmf_code_lists is 'Derived table - associates OMOP concepts (for individual codes) to HQMF vocabulary IDs';
comment on column hqmf_code_lists.code is 'Concept ID associated with a particular code.';
comment on column hqmf_code_lists.code_list_id is 'HQMF vocabulary OID.';

insert into hqmf_code_lists (code, code_list_id)
  select distinct
    r.concept_id_1,
    c.concept_code
from concept_relationship r join concept c
   on c.concept_id = r.concept_id_2
where r.invalid_reason is null and
   r.valid_start_date <= now() and r.valid_end_date >= now() and
   r.relationship_id in (:value_set_member_relationship_id, :value_set_member_relationship_id_mapped);

cluster hqmf_code_lists;
analyze hqmf_code_lists;

create table omop_level_2_concept_code_lists (
   code integer,
   code_list_id text
);

create view code_lists as
  select code, code_list_id from hqmf_code_lists
union
  select code, code_list_id from omop_level_2_concept_code_lists;

create table if not exists med_status_map (
   omop_concept_id integer,
   hqmf_status text
);

truncate table med_status_map;

insert into med_status_map (omop_concept_id, hqmf_status) values
  (38000177, 'ordered'),
  (38000178, 'active'),
  (38000175, 'dispensed'),
  (38000176, 'dispensed'),
  (38000179, 'administered'),
  (38000180, 'administered')
;


-- verify that all codes in value set definitions are mapped into concepts in code lists
create table value_code_xref as
    select distinct v.code, v.code_system, v.code_system_name, v.display_name, c.concept_id, c.concept_name
      from value_set_entries v
      join unified_vocabulary_map m on m.hqmf_code_system_oid = v.code_system
      join concept c on c.concept_code = v.code and c.vocabulary_id = m.omop_vocabulary_id and c.vocabulary_id != 0
    union distinct
    select distinct v.code, v.code_system, v.code_system_name, v.display_name, s.target_concept_id concept_id, c.concept_name
      from value_set_entries v
      join unified_vocabulary_map m on m.hqmf_code_system_oid = v.code_system
      join source_to_concept_map s on s.source_code = v.code and s.source_vocabulary_id = m.omop_vocabulary_id
      join concept c on c.concept_id = s.target_concept_id and c.vocabulary_id != 0;

create index value_code_xref_code_system_code_idx on value_code_xref (code_system, code);
cluster value_code_xref using value_code_xref_code_system_code_idx;
analyze value_code_xref;

create table value_set_sanity_checks (
    test_name text,
    passed boolean
);

insert into value_set_sanity_checks(test_name, passed)
    select 'all concepts mapped from all value sets are in the code list for that value set',
       not exists (
          select 1 from value_set_entries v
            where not exists (
              select 1 from value_code_xref x 
                join code_lists c on c.code = x.concept_id
                where x.code_system = v.code_system and x.code = v.code));

create table value_set_code_xref as
   select v.value_set_name,
          e.value_set_oid,
          e.code_system,
          e.code,
          e.code_system_name,
          e.display_name,
          x.concept_id,
          x.concept_name
   from value_sets v join value_set_entries e on e.value_set_oid = v.value_set_oid
      left join value_code_xref x on x.code = e.code and x.code_system = e.code_system;

create table value_set_code_systems as
   select value_set_oid, code_system, min(code_system_name) code_system_name from value_set_entries group by value_set_oid, code_system;
alter table value_set_code_systems add primary key (value_set_oid, code_system);
cluster value_set_code_systems using value_set_code_systems_pkey;

create table code_lists_value_set_reverse_map as
   select
     v.value_set_oid,
     v.value_set_name,
     s.code_system,
     s.code_system_name,
     c.concept_id,
     c.concept_code,
     c.concept_name,
     c.vocabulary_id,
     vo.vocabulary_name,
     exists (select 1 from value_set_entries e where e.value_set_oid = v.value_set_oid
               and e.code_system = s.code_system and e.code = c.concept_code) in_original_value_set
   from code_lists l
     join value_sets v on v.value_set_oid = l.code_list_id
     join value_set_code_systems s on s.value_set_oid = v.value_set_oid
     join unified_vocabulary_map m on m.hqmf_code_system_oid = s.code_system
     join concept c on c.vocabulary_id = m.omop_vocabulary_id and c.concept_id = l.code
     join vocabulary vo on vo.vocabulary_id = c.vocabulary_id
   union distinct
   select
     v.value_set_oid,
     v.value_set_name,
     s.code_system,
     s.code_system_name,
     scm.target_concept_id,
     scm.source_code,
     scm.source_code_description,
     scm.source_vocabulary_id,
     vo.vocabulary_name,
     exists (select 1 from value_set_entries e where e.value_set_oid = v.value_set_oid
               and e.code_system = s.code_system and e.code = scm.source_code) in_original_value_set
   from code_lists l
     join value_sets v on v.value_set_oid = l.code_list_id
     join value_set_code_systems s on s.value_set_oid = v.value_set_oid
     join unified_vocabulary_map m on m.hqmf_code_system_oid = s.code_system
     join source_to_concept_map scm on scm.source_vocabulary_id = m.omop_vocabulary_id and scm.target_concept_id = l.code
           and primary_map = 'Y' and invalid_reason is null
     join concept c on c.concept_id = scm.target_concept_id
     join vocabulary vo on vo.vocabulary_id = scm.source_vocabulary_id;

create index code_lists_value_set_reverse_map_code_system_value_set_oid_idx on code_lists_value_set_reverse_map(code_system, value_set_oid);
cluster code_lists_value_set_reverse_map using code_lists_value_set_reverse_map_code_system_value_set_oid_idx;
create index on code_lists_value_set_reverse_map(in_original_value_set);
