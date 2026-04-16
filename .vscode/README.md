# VS Code Setup for Foodly

## ⚠️ API keys and secrets are NO LONGER hardcoded here

As of the 2026-04 security sprint, `launch.json` and `tasks.json` reference all secrets via `${env:VAR_NAME}` instead of embedding them in source. You need to set these environment variables in the shell that launches VS Code.

## Required env vars

### Paid API keys (always required)

These back paid services — must rotate periodically. They're still embedded in the compiled binary (Gap #10 in `be-foodly/docs/security-hardening-backlog.md`).

```bash
export OPENAI_API_KEY="sk-proj-..."
export REPLICATE_API_KEY="r8_..."
export GOOGLE_MAPS_API_KEY="AIza..."          # Geocoding & Maps; restrict by bundle/referrer in GCP console
```

### OAuth / client IDs (required for Google Sign-In)

```bash
export GOOGLE_SIGN_IN_CLIENT_ID="951890938827-....apps.googleusercontent.com"
```

### Analytics

```bash
export ANALYTICS_TOKEN="..."   # Mixpanel/analytics token — treat as secret
```

### Dev-only auto-login (launch.json dev configs)

These prefill the login form during development. Use a throwaway Mailinator account — never your real credentials.

```bash
export LOG_EMAIL="hwaldmann@mailinator.com"
export LOG_PASS="..."
```

### Public menu dev target (launch.json public-menu-web only)

UUID of the business used when running the public menu web target in dev.

```bash
export MENU_DEV_UUID="..."
```

## Recommended setup (macOS + zsh)

### Option A — `~/.zshrc` (simplest, persistent)

Add the exports to your `~/.zshrc`:

```bash
cat >> ~/.zshrc <<'EOF'
# Foodly dev env vars
export OPENAI_API_KEY="sk-proj-..."
export REPLICATE_API_KEY="r8_..."
export GOOGLE_MAPS_API_KEY="AIza..."
export GOOGLE_SIGN_IN_CLIENT_ID="951890938827-....apps.googleusercontent.com"
export ANALYTICS_TOKEN="..."
export LOG_EMAIL="hwaldmann@mailinator.com"
export LOG_PASS="..."
export MENU_DEV_UUID="..."
EOF
source ~/.zshrc
```

Then **launch VS Code from the terminal** so it inherits those vars:

```bash
cd "~/Development/Foodly Apps/foodly_world/foodly_world"
code .
```

If you launch VS Code from Finder or Spotlight, it does NOT inherit `~/.zshrc` — env vars will be empty. Use the terminal.

### Option B — `direnv` (per-project, recommended)

Install `direnv` once: `brew install direnv`, then add `eval "$(direnv hook zsh)"` to `~/.zshrc`.

Create `foodly_world/foodly_world/.envrc` (already gitignored via `.gitignore` line for `.env*`):

```bash
export OPENAI_API_KEY="sk-proj-..."
export REPLICATE_API_KEY="r8_..."
export GOOGLE_MAPS_API_KEY="AIza..."
export GOOGLE_SIGN_IN_CLIENT_ID="951890938827-....apps.googleusercontent.com"
export ANALYTICS_TOKEN="..."
export LOG_EMAIL="hwaldmann@mailinator.com"
export LOG_PASS="..."
export MENU_DEV_UUID="..."
```

Run `direnv allow` in that folder. Now env vars load automatically when you `cd` into the project.

### Option C — macOS plist (GUI launches work too)

If you launch VS Code from Finder/Spotlight and want the vars to still work:

```bash
launchctl setenv OPENAI_API_KEY "sk-proj-..."
launchctl setenv REPLICATE_API_KEY "r8_..."
launchctl setenv GOOGLE_MAPS_API_KEY "AIza..."
launchctl setenv GOOGLE_SIGN_IN_CLIENT_ID "951890938827-....apps.googleusercontent.com"
launchctl setenv ANALYTICS_TOKEN "..."
launchctl setenv LOG_EMAIL "hwaldmann@mailinator.com"
launchctl setenv LOG_PASS "..."
launchctl setenv MENU_DEV_UUID "..."
```

⚠️ Caveat: these vars become visible to **every process on your user account** and don't persist across reboot. Not recommended for daily use — prefer Option A or B.

## Verifying it works

Once env vars are set, reload VS Code (`Cmd+Shift+P` → "Developer: Reload Window") and start a Flutter launch configuration. In the Debug Console you should see the Flutter command with the keys interpolated. If you see literally `${env:OPENAI_API_KEY}` (or any other var) in the logged command, VS Code didn't have that var set.

Quick sanity check from the terminal where VS Code was launched:

```bash
echo "$OPENAI_API_KEY" "$REPLICATE_API_KEY" "$GOOGLE_MAPS_API_KEY" \
     "$GOOGLE_SIGN_IN_CLIENT_ID" "$ANALYTICS_TOKEN" \
     "$LOG_EMAIL" "$LOG_PASS" "$MENU_DEV_UUID"
```

Any empty slot in that output = a broken build/launch config.

## Why this change?

Previously these keys lived directly in `launch.json` and `tasks.json`, which are tracked in git. That meant the keys were exposed in:

1. Every historical commit — anyone with read access to the repo could recover them.
2. Any GitHub fork, mirror, or cached copy.
3. Any local clone, forever.

Rotating the keys solved the _current_ exposure, but the only way to prevent re-leaking on the next edit was to get the keys out of tracked files entirely.

See `be-foodly/docs/security-hardening-backlog.md` Gap #10 for the longer-term fix: moving paid-API calls server-side so the mobile binary never holds these keys at all.

## What about git history?

The old keys are **still in git history**. Rotation neutralized them, so this is no longer a live risk — but if the repo ever goes public, consider purging history with [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/) before making it public.

Keys that MUST be rotated after this migration (because they lived in plaintext in tracked config):

- `GOOGLE_MAPS_API_KEY` — rotate in GCP Console; restrict by iOS bundle, Android package, and HTTP referrers so a leaked key can't be abused.
- `GOOGLE_SIGN_IN_CLIENT_ID` — technically public in OAuth public-client flows, but regenerate if you want a clean slate.
- `ANALYTICS_TOKEN` — rotate in your analytics provider.
- `LOG_PASS` — change the password on that mailinator test account.

`OPENAI_API_KEY` and `REPLICATE_API_KEY` were already rotated in the earlier (April 2026) sprint.
