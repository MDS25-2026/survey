// Deployment config for the study page. This file is public — that is expected.
//
// The Supabase anon key is designed to be exposed in client code. What keeps responses private is
// the table's row-level security policy: INSERT allowed for anonymous users, SELECT denied. Set
// that up with setup.sql BEFORE putting the real values here, and verify it — an anon key against
// a table with SELECT open lets anyone with the link read every response.
//
// Left blank, the form still works: it shows the participant their answers as text to send back
// manually rather than silently losing them.

window.STUDY_CONFIG = {
  url: "",   // https://<project>.supabase.co/rest/v1/study_responses
  key: ""    // the anon / publishable key, not the service key
};
