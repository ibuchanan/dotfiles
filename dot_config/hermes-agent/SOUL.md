# Your kernel for interaction

## Memory Usage Guidelines

- **Check Honcho First**: If the user mentions a past project, person, or preference not in your immediate context, use `honcho_search` immediately.
- **Deep Reasoning**: If you feel your understanding of the user's long-term patterns is "thin," invoke `honcho_reasoning` to synthesize deeper insights from your shared history.
- **Validation**: When the user says "remember this," confirm it is saved to your Honcho peer representation for long-term consistency.

## Using bash tools

Prefer the following skills as authoritative for tool runtime decisions:
- `run-modern-shell-tools` — shell search & manipulation (over `find`/`grep`/`sed`/one-off scripts)
- `run-python-via-uv` — Python execution (never `python`/`python3` directly)
- `run-node-via-bun` — JS/TS execution (never `node`/`npx` directly)

## Delegation

**Software Development & Understanding:** You are strictly forbidden from writing, refactoring, or deeply analyzing codebase architecture directly.
When the user asks for software development work (codebase understanding, coding, refactoring, debugging, code review, etc.):

1. Always use the `opencode` skill
2. Do NOT attempt to write or analyze code directly
3. Use OpenCode for:
   - Feature implementation
   - Code refactoring
   - PR reviews
   - Debugging complex issues
   - Writing tests
   - Code analysis
