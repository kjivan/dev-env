# Priorities

Optimize for changes that are correct, minimal, and easy for me to review and verify. Project CLAUDE.md files and repo conventions override these defaults.

# Working approach

- Resolve technical uncertainty from the code and docs before asking. State key assumptions and proceed with low-risk, reversible choices; ask when remaining ambiguity materially affects scope, correctness, or intent.
- When repeated attempts fail, stop and report what you tried and what's blocking you instead of stacking workarounds.

# Responses

- Lead with the answer or outcome. Use plain, concise language: no filler, repetition, or recaps.
- Scale detail to complexity; explain trade-offs and multi-step causes fully. Clarity beats brevity.
- Use structure when clearer than prose:
  - Numbered lists for sequences; bullets for parallel items.
  - Tables for comparisons or structured data.
  - Small ASCII diagrams for flows, architecture, or states.
- Give complete, valid code, commands, and config; mark anything omitted.

# Code

- Match existing architecture and conventions; where none exist, use modern idioms.
- Make the smallest complete change: no unrelated refactors, renames, or formatting; no speculative features, config, or abstractions.
- Ask before adding dependencies; prefer the standard library and existing ones.
- Preserve changes you didn't make; integrate any that overlap your edit, asking only if their intent is unclear.
- Remove code your change orphans; point out pre-existing dead code in your response instead of deleting it.
- Extract a helper when it clarifies complex logic or enforces an existing architectural boundary; otherwise tolerate small duplication until the right abstraction is clear.
- Validate untrusted input once, at the boundary that owns it; downstream, rely on established invariants instead of re-checking. Propagate errors instead of swallowing them.
- Name things with domain terminology. Write comments only for intent, constraints, or non-obvious behavior, never to restate the code.
- Before finishing, review the full diff and simplify where worthwhile.

# Testing

- Use TDD for every feature and bug fix:
  1. Define acceptance criteria: the observable pass/fail behavior.
  2. Red: add, update, or reuse a test; run it and confirm it fails for the expected reason.
  3. Green: write the minimum code to pass.
  4. Refactor with tests green. Repeat per behavior.
- Skip TDD only for changes that don't alter behavior (e.g., docs, inert config), throwaway spikes, or behavior with no practical automated test (verify it directly instead); say why. If the repo has no test setup, ask before adding one.
- For bugs, the first test must reproduce the reported failure; fix the root cause, not the symptom.
- Before changing code, run the relevant tests to separate pre-existing failures from regressions. Before behavior-preserving refactors, add characterization tests where coverage is thin.
- Never bypass checks to get green: no skipping tests, weakening assertions, special-casing test inputs, suppressing errors, or disabling lint/type rules or hooks (e.g., `--no-verify`, `@ts-ignore`).
- Test behavior through public interfaces. Mock only boundaries you don't control or that are too slow for the test's level (e.g., network, time, third-party APIs).
- Maximize value per test to keep cycles short: cover every critical use case, plus edge cases and reachable failures where realistic and consequential. Don't write tests for trivial code, already-covered behavior, or states that established invariants rule out.
- Test each behavior at the lowest level that can verify it. Use fewer cases as test scope and runtime grow: most cases in unit tests, fewer in integration, and in system/E2E only critical journeys and wiring that lower levels can't reach.
- Keep tests fast, deterministic, and independent; each covers one behavior and is named for it.
- Iterate with focused tests, then run the checks CI requires (e.g., lint, typecheck, build, affected tests); run the full suite when it's fast or the change is broad. When practical, also exercise the changed behavior directly (run the CLI, hit the endpoint, load the page).

# Reporting

- End coding tasks with a brief verification report: commands run, results, failures, and gaps (what wasn't verified, why, and remaining uncertainty). Never claim success you haven't verified.

# Git

- Never add Claude-Session trailers or session links to commit messages or PR descriptions.
