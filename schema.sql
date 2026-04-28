-- Ministering Tool: Supabase schema
-- Paste this into Supabase SQL Editor and run, ONCE, on a fresh project.

-- Companionships table: one row per companionship.
create table companionships (
  id uuid primary key default gen_random_uuid(),
  district text,
  notes text,
  needs_replacement boolean default false,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Members of each companionship (1, 2, or 3 people).
-- We store the name as text alongside the id so the historical record
-- still reads correctly even if the source sheet changes.
create table companionship_members (
  id uuid primary key default gen_random_uuid(),
  companionship_id uuid references companionships(id) on delete cascade,
  assignee_name text not null,
  assignee_id text not null,
  is_missing boolean default false,
  created_at timestamptz default now()
);

-- Households assigned to each companionship.
create table companionship_households (
  id uuid primary key default gen_random_uuid(),
  companionship_id uuid references companionships(id) on delete cascade,
  household_name text not null,
  household_id text not null,
  is_missing boolean default false,
  created_at timestamptz default now()
);

-- Indexes for fast lookups
create index idx_members_comp on companionship_members(companionship_id);
create index idx_households_comp on companionship_households(companionship_id);
create index idx_comp_district on companionships(district);

-- Updated_at trigger
create or replace function set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

create trigger comp_updated_at
  before update on companionships
  for each row execute function set_updated_at();

-- Row-level security: allow the anon key to read and write.
-- The passphrase gate in the app is the access control.
-- Without RLS enabled, Supabase blocks anon access entirely; with RLS
-- enabled and a permissive policy, the anon key works as intended.
alter table companionships enable row level security;
alter table companionship_members enable row level security;
alter table companionship_households enable row level security;

create policy "anon all" on companionships for all using (true) with check (true);
create policy "anon all" on companionship_members for all using (true) with check (true);
create policy "anon all" on companionship_households for all using (true) with check (true);
