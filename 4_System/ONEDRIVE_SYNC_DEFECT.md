# OneDrive Sync Defect Log

**Status**: 🔴 **ACTIVE FALLBACK - Requires Investigation**

**Date Observed**: 2026-07-31

---

## Problem

The OneDrive sync pipeline is not successfully running against the live Microsoft Graph API. On last attempt (2026-07-27 17:16:29), the ingestion orchestrator caught a failure and fell back to reading from the local `1_Source/` directory tree instead.

```
**Source Mode**: local-fallback
**Reason**: Cloud API unavailable
```

### Implications

- **Live OneDrive data is stale** — the 140 indexed files were extracted from a fallback read, not a fresh cloud sync
- **Updates to OneDrive won't be picked up** — new/modified documents won't appear in synthesis until the cloud pipeline is fixed
- **This is masked as success** — the ingestion still produces 46MB of usable content, so the system works, but it's not live

---

## Root Cause (Unconfirmed)

Likely one of:

1. **Azure OAuth token expired or invalid** — MS_CLIENT_ID / MS_TENANT misconfigured
2. **OneDrive path inaccessible** — `/Documents/Study/Artificial Intelligence` doesn't exist or permissions changed
3. **Graph API rate limiting** — too many requests, hit the cap
4. **Network/connectivity issue** — cloud_ingest can't reach api.microsoft.com

---

## How to Fix

### Step 1: Check Credentials
```bash
cd C:\Users\aksha\.openclaw\agents\branding_engine\tools\cloud_ingest
cat .env | grep -E "MS_|ONEDRIVE"
```

Verify:
- `MS_CLIENT_ID` is set (currently: `14d82eec-204b-4c2f-b7e8-296a70dab67e`)
- `MS_TENANT` is correct (`consumers` for personal account)
- `ONEDRIVE_ROOT_PATH` exists (`/Documents/Study/Artificial Intelligence`)

### Step 2: Test Cloud API Directly
```bash
# Clear token cache to force fresh auth
rm -f token-cache.json
node index.js
```

Watch for:
- Device code auth flow (should prompt for login)
- Graph API responses (200 OK or errors)
- File list from OneDrive root

### Step 3: Check OneDrive Path
Log into OneDrive web and verify the path exists:
- Drive → Documents → Study → Artificial Intelligence

If path has changed, update `.env`:
```
ONEDRIVE_ROOT_PATH=/Documents/Study/Artificial Intelligence (or new path)
```

### Step 4: Re-run Ingestion
```bash
npm run ingest
```

After success:
```bash
cd C:\Users\aksha\.openclaw
node split-ingestion.js  # Re-extract sources
node audit-sources.js    # Re-audit
```

---

## Current Audit State

| Source | Tokens | Status | Notes |
|--------|--------|--------|-------|
| **14_Onedrive** | 17.3M | **HIGH** | 117 extracted files, 91% populated (all from fallback) |
| **12_AI_Chats** | 29K | HIGH | Live (2 recent chats) |
| **13_Github_Repos** | 2.8M | HIGH | Live (284 files from 15 repos) |
| **15_NotebookLM** | 591K | HIGH | Live (21 course modules) |
| **11_Project_Boards** | 11.3M | HIGH | Not used (cache junk) |

**Missing from OneDrive**: Any files modified after 2026-07-27 17:16:29

---

## Recommended Next Step

**Run the cloud sync now** to:
1. Verify whether the API is actually broken or just misconfigured
2. Get fresh OneDrive data if API works
3. If API fails again, log the specific error for debugging

Timeline: This should be prioritized before any synthesis claims to use "current" OneDrive portfolio data.
