-- Academy schema: API grants voor anon / authenticated (na expose in Data API)
-- Fix: "permission denied for schema academy"

grant usage on schema academy to postgres, anon, authenticated, service_role;

grant all on all tables in schema academy to postgres, service_role;
grant select, insert, update, delete on all tables in schema academy to authenticated;
grant select on all tables in schema academy to anon;

grant all on all routines in schema academy to postgres, service_role;
grant execute on all functions in schema academy to authenticated, service_role;

alter default privileges for role postgres in schema academy
  grant all on tables to postgres, service_role;

alter default privileges for role postgres in schema academy
  grant select, insert, update, delete on tables to authenticated;

alter default privileges for role postgres in schema academy
  grant select on tables to anon;
