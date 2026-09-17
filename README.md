# Sorting Work Emails by Urgency

Participant instrument for a priority-calibration study, run by MDS25 (Monash University) as part
of a Final-Year Project on an email assistant that sorts mail by urgency.

The page is generated — do not hand-edit `index.html`. It is built from
`backend/scripts/build_study_site.py` in the project repository, which holds the source emails and
the analysis code. Regenerate and commit the output rather than patching it here.

## What is in this repo

| File | |
|------|--|
| `index.html` | The study, generated. Self-contained: no build step, no dependencies. |
| `config.js` | Where responses are sent. Edit this; it is the only file meant to be hand-edited. |
| `setup.sql` | Creates the response table and its security policy. Run once. |

## Deploying

1. Run `setup.sql` in the Supabase SQL editor.
2. **Verify that the anon key cannot read the table** — the check is written at the bottom of
   `setup.sql`. Do not skip it, and do not send the link until it passes.
3. Put the project URL and anon key in `config.js`.
4. Settings → Pages → deploy from `main`, root.

With `config.js` left blank the form still works: a participant sees their answers as text to send
back by hand instead of losing them.

## What this collects

Answers only. No name, no email address, no identifier of any kind — responses are numbered, not
named. That is a deliberate design constraint, not an oversight: it is what keeps the study clear
of personal-data obligations, and the consent text on the page says so.

## Privacy of the emails shown

The emails are from the Enron corpus, released publicly by a US regulator following the company's
collapse and used widely in research. They are shown unedited because the system under study was
measured on the unedited text.
