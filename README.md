# Ministering Assignment Tool

A web tool for an Elders quorum presidency to manage ministering companionships and household assignments. Drag and drop, district filtering, and a Google Sheet as the live roster.

## Quick reference

- **The tool URL**: `https://young-frank.github.io/camelot-first/` (share with the presidency, keep off public channels)
- **Source of truth for the roster**: your Google Sheet
- **Source of truth for assignments**: Supabase (you don't touch this directly)
- **To update who's in the ward**: edit the Google Sheet, click "Refresh roster" in the tool

## Day-to-day workflow

This is the section you'll use most often. Once setup is done (further down), this is all you need to know.

### Adding a new household

A new family moves into the ward.

1. Open your Google Sheet.
2. Click the **Households** tab at the bottom.
3. Add a new row at the bottom. Fill in three columns:
   - **District**: e.g. `District 1`
   - **Family Name**: how you want them displayed in the tool (e.g. `Smith` or `Smith (J)` if there are already other Smiths)
   - **Members**: semicolon-separated list, e.g. `Smith, John; Smith, Jane; Smith, Junior`
4. Open the tool, click **"Refresh roster"** (top right).
5. The new household appears in the right-side panel, ready to drag onto a companionship.

### Adding a new person (assignee)

A new minister becomes available.

1. Google Sheet → **Assignees** tab.
2. Add a new row. Fill in:
   - **District**: e.g. `District 2`
   - **Assignee Name**: format as `Last, First` to match existing data (e.g. `Smith, John`)
   - **Address**: street address with city and zip
3. Tool → **Refresh roster**.
4. They appear in the available people list on the left.

### When someone moves out

1. Google Sheet → delete or blank out their row in either tab.
2. Tool → **Refresh roster**.
3. Any companionship that contained that person is automatically flagged "Needs replacement" and shows up in the **Issues** tab.
4. Their household assignments stay intact (so you don't lose track of who needs new ministers).
5. Drag a replacement person onto the companionship. The flag clears once nobody in the companionship is missing.

Same logic for a removed household: it gets a "(missing)" flag inside its companionship pill, and you can click the pill to remove the assignment.

### When an address or name changes

Just edit the cell in the Google Sheet, then Refresh roster. The tool picks up the change.

**Caveat about renames**: the tool identifies people and households by name. If you change someone's name in the sheet (e.g. typo fix), the tool will treat it as the old person disappearing and a new person appearing. The old name will be flagged as "missing" in their companionship. To handle a rename cleanly: drag the renamed person back onto their old companionship to replace the missing one. Same with renamed households.

### Building or adjusting companionships

This is the main board.

- **Drag people from the left** into a companionship card to assign them.
- **Drag households from the right** onto a companionship to assign that household.
- **Click any pill** (a person or household chip inside a companionship) to remove it.
- **Click "+ New companionship"** to make an empty one. Then drag people and households into it. (Note: the empty companionship persists in the database the moment you click "+ New". If you don't add anything to it, you can click "Remove" to discard.)
- **District filter** at the top right narrows everything to one district. Companionships can cross districts if you want; the filter just controls visibility.

### Tracking who needs ministers

- The **Unassigned** tab shows people without a companionship and households without ministers, scoped to the current district filter.
- The **Issues** tab shows companionships that have someone (or some household) missing after a roster refresh. Address these first.

### Important rules baked into the tool

- A person can be in at most one companionship at a time. Dragging someone into a new companionship removes them from their previous one automatically.
- A household can be assigned to at most one companionship at a time. Same auto-remove behavior.
- A companionship can hold up to 3 people. Trying to drag a 4th gets blocked.
- Removed people are flagged, not deleted. Your historical data stays.

## Do I need to touch Supabase or GitHub for normal updates?

**No.** Just the Google Sheet, and click Refresh roster.

You only touch:

- **Supabase**: never, unless something corrupts and we need to debug
- **GitHub**: only if you want to change the tool's code (passphrase, features, fixes)

The Google Sheet is your single point of maintenance for the roster.

---

## Architecture (for reference)

The tool is one HTML file. It reads the assignee and household roster from your Google Sheet (read-only, public link sharing, via Sheets API). It stores companionships and household assignments in Supabase. A passphrase gate plus the deployed URL is the security boundary. Hosted free on GitHub Pages.

## What's in this repo

- `index.html`: the entire app
- `schema.sql`: ran once in Supabase to create the tables
- `seed.sql`: ran once to load existing 52 companionships from the original spreadsheet
- `.github/workflows/deploy.yml`: auto-deploys to GitHub Pages on every push
- `README.md`: this file

---

## First-time setup (already done, kept for reference)

### 1. Supabase tables

Schema and seed already loaded into project `hwbayyapshaqdsyoxwjv`. To start fresh:

```sql
delete from companionships;
```

Then re-run `seed.sql`. Cascades clear related tables.

To delete only test rows that have no members or households:

```sql
delete from companionships
where (select count(*) from companionship_members where companionship_id = companionships.id) = 0
  and (select count(*) from companionship_households where companionship_id = companionships.id) = 0;
```

### 2. Google Sheet

- Original Excel file uploaded to Drive, converted to Google Sheets (`File > Save as Google Sheets`)
- Sharing set to "Anyone with the link, Viewer"
- Sheet ID is the long string in the URL between `/d/` and `/edit`

### 3. Google Sheets API key

- Created in [Google Cloud Console](https://console.cloud.google.com)
- Project: `ministering-tool`
- Sheets API enabled (APIs & Services > Library)
- API key created (APIs & Services > Credentials)
- Restricted to: Sheets API only, websites `https://young-frank.github.io/*`

### 4. GitHub Pages deploy

- Repo: `young-frank/camelot-first`
- Settings > Pages > Source: GitHub Actions
- Each push to `main` triggers `.github/workflows/deploy.yml` and redeploys

### 5. Tool configured

- Settings dialog → paste Sheet ID and API Key → Save and reload
- Stored in browser localStorage (each presidency member needs to do this once on their device)

---

## Changing the passphrase

The default `ministering` is too obvious. To set a real one:

1. Open the deployed page, enter passphrase, open DevTools (F12) > Console.
2. Paste, replacing `your-new-pass`:
   ```javascript
   crypto.subtle.digest('SHA-256', new TextEncoder().encode('your-new-pass')).then(h => console.log(Array.from(new Uint8Array(h)).map(b => b.toString(16).padStart(2,'0')).join('')))
   ```
3. Copy the hex string that prints.
4. In GitHub, edit `index.html`. Find:
   ```javascript
   const PASS_HASH = '';
   ```
   Paste your hash inside the quotes.
5. A few lines above, change:
   ```javascript
   const DEFAULT_PASS = 'ministering';
   ```
   to:
   ```javascript
   const DEFAULT_PASS = '';
   ```
6. Commit. GitHub Actions redeploys automatically (about 60 seconds).

## Sharing with the presidency

Each presidency member needs:
1. The URL: `https://young-frank.github.io/camelot-first/`
2. The current passphrase
3. The Sheet ID and API Key (to paste into Settings on first load)

Send privately, not in shared chats. Bookmark recommended.

## Troubleshooting

| Problem | Likely cause | Fix |
|---------|--------------|-----|
| "Could not fetch sheet" | Wrong Sheet ID or API key, sheet not public, or API key restrictions don't include the URL | Re-check Settings; verify in Google Cloud Console under Credentials |
| Everyone shows as "(missing)" | Sheet not loaded yet | Refresh roster; if still failing, check Settings |
| Tool loads but is empty | New presidency member hasn't set Sheet ID yet | Click Settings, paste credentials |
| Companionship count is wrong | Empty test companionships sitting around | Run the cleanup SQL above |
| Two people editing at once shows conflicts | Last-write-wins is normal for this scale | Refresh and reapply |

## Future improvements (not built yet)

- Notes per companionship (database column exists, just no UI)
- Real-time sync between presidency members (currently each user fetches on load)
- Proximity-based pairing suggestions (UI toggle was in the prototype, removed for production simplicity)
- Move from passphrase to Supabase email auth (would let you add/remove presidency members by email instead of changing the shared passphrase)

## Credits

Built April 2026.
