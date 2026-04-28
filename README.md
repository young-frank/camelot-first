# Ministering Assignment Tool

A simple web tool for an Elders quorum presidency to manage ministering companionships and household assignments. Drag and drop, district filtering, real-time sync across the presidency, and a Google Sheet as the live roster.

## Architecture in one paragraph

The tool is one HTML file. It loads the assignee and household roster from your Google Sheet (read-only, via the public Sheets API). It stores companionships and household assignments in a Supabase database (free tier, real-time, all presidency members see the same data). A passphrase gate plus an unguessable URL is the security boundary. Hosted free on GitHub Pages.

## What's in this repo

- `index.html`: the entire app
- `schema.sql`: run this once in Supabase to create the tables
- `seed.sql`: optional one-time seed of the 80-some existing assignments from the original spreadsheet
- `.github/workflows/deploy.yml`: auto-deploy to GitHub Pages on every push to main
- `README.md`: this file

## Setup, in order

### 1. Create the Supabase tables

1. Go to your Supabase project (`hwbayyapshaqdsyoxwjv`).
2. Open the SQL Editor (left sidebar, looks like a database icon).
3. Click "New query".
4. Paste the contents of `schema.sql`.
5. Click Run.

You should see "Success. No rows returned." Verify by clicking Table Editor in the sidebar; you should see three new tables: `companionships`, `companionship_members`, `companionship_households`.

### 2. Seed the existing assignments

1. SQL Editor again, new query.
2. Paste `seed.sql`.
3. Click Run.

You should see something like "Success. 52 rows" plus more for the joined inserts. Switch to Table Editor and confirm you have 52 rows in `companionships`.

If you ever want to start fresh, run this in the SQL editor:
```sql
delete from companionships;
```
The cascade will clean up the related tables.

### 3. Move your spreadsheet to Google Sheets

The tool reads from Google Sheets, not Excel. You need to:

1. Upload `Ministering_Assignments.xlsx` to Google Drive.
2. Right-click it, Open with > Google Sheets. Then File > Save as Google Sheets.
3. Share the resulting Google Sheet: click Share, change to "Anyone with the link" and "Viewer". Copy the link.
4. The Sheet ID is the long string in the URL between `/d/` and `/edit`. Save it.

### 4. Get a Google Sheets API key

1. Go to [console.cloud.google.com](https://console.cloud.google.com).
2. Create a new project (any name, e.g. "ministering").
3. From the left menu: APIs and Services > Library. Search for "Google Sheets API". Click it, click Enable.
4. APIs and Services > Credentials > Create Credentials > API key. Copy it.
5. Strongly recommended: click the new API key, "Edit API key" and:
   - Under "API restrictions", restrict to "Google Sheets API".
   - Under "Application restrictions", set to "Websites" and add your GitHub Pages URL once it exists (we'll get it in the next step).

### 5. Deploy to GitHub Pages

1. Create a new GitHub repo. Use a hard-to-guess name (e.g. `mw-min-x7k2m9` rather than `ministering`). Public is fine since the passphrase is the real gate.
2. Drop the contents of this folder into the repo (`index.html`, `schema.sql`, `seed.sql`, `.github/`, `README.md`).
3. Commit and push.
4. In the repo, go to Settings > Pages.
5. Under "Source", choose "GitHub Actions".
6. Wait a minute. The Actions tab will show a deploy workflow running. When it's done, you'll get a URL like `https://yourusername.github.io/mw-min-x7k2m9/`.

### 6. Open the tool and add the sheet credentials

1. Visit the URL.
2. Default passphrase is `ministering`. Enter it.
3. Click Settings (top right).
4. Paste your Sheet ID and API Key. Click "Save and reload".
5. The roster should load: 87 people, 111 households, plus the 52 seeded companionships from your existing assignments.

### 7. Change the passphrase

The default `ministering` is too obvious for production. To set your own:

1. Open your deployed page in Chrome. Open DevTools (F12 or right-click > Inspect) > Console tab.
2. Paste this, replacing `your-new-pass` with the passphrase you want:
   ```javascript
   crypto.subtle.digest('SHA-256', new TextEncoder().encode('your-new-pass')).then(h =>
     console.log(Array.from(new Uint8Array(h)).map(b => b.toString(16).padStart(2,'0')).join('')))
   ```
3. Copy the long hex string that prints.
4. Open `index.html` in your repo, find:
   ```javascript
   const PASS_HASH = '';
   ```
   and paste your hash inside the quotes.
5. Optionally, also change `DEFAULT_PASS` to an empty string so the default cannot be used as a fallback.
6. Commit and push. GitHub Pages redeploys automatically.

## Sharing it with the presidency

Send them:
1. The URL
2. The passphrase

Through a private channel (Signal, text, in person). Not in a Slack or Teams channel where past members might still have access.

## Daily use

- **Companionship Board** is the main view. Drag people from the left into companionships. Drag households from the right onto a companionship to assign them. Click any pill to remove that person or household.
- **Assignments Table** is for printing or reviewing the full picture.
- **Unassigned** shows who and what still needs coverage.
- **Issues** appears when someone has moved out of the ward (after a roster refresh) or a household is gone. The companionship is flagged, but the rest of it stays put until you replace the missing person.
- **District filter** in the top right narrows everything to one district.
- **Refresh roster** pulls the latest from Google Sheets. Do this whenever the ward clerk updates the sheet.

## How it handles people moving out

When you click Refresh roster and someone is no longer in the sheet:
- That person is flagged "(missing)" in their companionship.
- The companionship gets a "Needs replacement" badge and shows up in the Issues tab.
- Their households stay assigned (so you don't lose track of who needs new ministers).
- Drag a replacement onto the companionship to fix it. The "Needs replacement" flag clears automatically when no one in the companionship is missing.

Same logic applies if a household is removed from the sheet.

## Adjusting things later

- **Add more districts**: just add them to the District column in the sheet, hit Refresh.
- **Add notes to a companionship**: not in the UI yet, but the database has a `notes` column ready when you want it.
- **Move from passphrase to real auth**: Supabase has email auth built in. We'd swap the passphrase gate for a Supabase login, restrict the database policies to authenticated users, and add presidency members by email. Half a day of work.

## A note on security

The "anon key" in the code is meant to be public, by Supabase's design. The real protection is:
1. The unguessable URL (only the presidency knows it)
2. The passphrase gate (prevents casual access)
3. Optional: GitHub repo could be private if you upgrade to a paid plan

Do not post the URL in any public space. Do not commit the passphrase to the repo. If the passphrase leaks, change it (step 7 above) and tell the presidency.

The data itself: ward member names, addresses, and ministering pairings. Sensitive enough to keep behind the gate, not so sensitive that a leak would be catastrophic. Treat it like you'd treat the Google Sheet itself.

## If something breaks

- **"Could not fetch sheet" error**: probably an API key issue. In Settings, double-check the key and Sheet ID. Make sure the sheet is "Anyone with the link can view".
- **Tool loads but no roster appears**: check browser console (F12) for the actual error.
- **Companionships missing after refresh**: never happens automatically. We never delete companionships, only flag them. Check the Issues tab.
- **Two presidency members editing at once**: last write wins. Conflicts are unlikely but possible. If they happen, refresh the page.

## Credits

Built for [your ward], April 2026.
