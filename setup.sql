-- Run this in the Supabase SQL editor before putting real values in config.js.
--
-- The security model: the page holds an anon key that anyone can read out of the page source, so
-- the table must allow inserting a response and nothing else. No select, no update, no delete.

create table if not exists public.study_responses (
  id          uuid primary key default gen_random_uuid(),
  created_at  timestamptz not null default now(),
  answers     jsonb not null
);

alter table public.study_responses enable row level security;

-- Anonymous visitors may add a response.
drop policy if exists "anon can submit" on public.study_responses;
create policy "anon can submit"
  on public.study_responses for insert
  to anon
  with check (true);

-- Deliberately no select/update/delete policy for anon. With RLS enabled, anything without a
-- policy is denied, so the anon key cannot read responses back. Fetch them with the service key
-- from scripts/fetch_study_responses.py, or through the Supabase dashboard.

-- Verify after running this. From a terminal, with the ANON key:
--
--   curl -s "https://<project>.supabase.co/rest/v1/study_responses?select=*" \
--     -H "apikey: <anon key>" -H "Authorization: Bearer <anon key>"
--
-- It must return an empty array or a permission error — never rows. If it returns rows, the
-- policy is wrong and the link must not be sent to anyone.
