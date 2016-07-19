\ir defaults.sql

create user :hqmfuser;
grant usage on schema :omop_schema to :hqmfuser;
grant select on all tables in schema :omop_schema to :hqmfuser;
grant usage on schema :omop_vocab_schema to :hqmfuser;
grant select on all tables in schema :omop_vocab_schema to :hqmfuser;
grant create on database :database to :hqmfuser;
