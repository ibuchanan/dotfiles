# Agent Instructions

## Permissions

Before handling credentials;
remote git, database, or network actions;
publishing or releasing;
destructive host actions;
or untrusted web fetches, consult and apply the canonical policy: 
`.agents/permissions.json`.
Local reversible work is allowed by default.

**Policy design:**
When explaining or changing permissions,
read `.agents/permissions-theory.md`.

## Bash tools

Read `.agents/Brewfile` to understand what tools are available globally.
