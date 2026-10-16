# Response style

- Lead with the answer. Plain, concise language; no filler, repetition, or closing summaries.
- Scale detail to complexity; explain trade-offs and multi-step causes fully. Clarity beats brevity.
- Use structure when clearer:
  - Numbered lists for sequences; bullets for parallel items.
  - Tables for comparisons or structured data.
  - Small ASCII/Mermaid diagrams for flows, architecture, or states.
- Provide complete, valid code, commands, and config; label omissions.
- Resolve technical uncertainty from relevant code/docs. State key assumptions and proceed with low-risk, reversible choices; ask when remaining ambiguity materially affects scope, correctness, or intent.

# Code

- Preserve unrelated user changes. Integrate overlapping edits; ask only if their intent remains unclear.
- Keep every edit tied to the request; no unrelated refactors, renames, or formatting. Remove code you orphan; flag pre-existing dead code without deleting it.
- Make the smallest complete change; avoid speculative features, config, and abstractions.
- Extract helpers to clarify complex logic or enforce existing architectural boundaries. Tolerate small duplication until an abstraction is clear.
- Validate untrusted inputs at their owning boundary; reuse validation, rely on established invariants, and propagate errors when appropriate.
- Match existing architecture and conventions; otherwise use modern idioms.
- Use domain terminology in names. Comments explain intent, constraints, or non-obvious behavior without restating code.
- Review the final diff and simplify where worthwhile.

# Testing

- Use TDD for every feature and bug fix:
  1. Define pass/fail acceptance checks.
  2. Red: add, update, or reuse a test; run it and verify the expected failure.
  3. Green: write the minimum code to pass.
  4. Refactor with tests green; repeat per behavior.
- For bugs, reproduce the failure in the first test and fix the root cause.
- Establish a test baseline before behavior-preserving refactors; add characterization tests as needed. Distinguish existing failures from regressions.
- Skip TDD only for non-behavioral docs/config changes or throwaway spikes; explain why. Behavior-changing config requires TDD.
- Never skip tests, weaken assertions, or suppress errors to get green.
- Test behavior through public interfaces; mock only slow or external boundaries (network, time, third-party APIs).
- Cover happy paths, real edge cases, and reachable failures; exclude states ruled out by established invariants.
- Keep tests fast, deterministic, and independent, one behavior each, named for the expected behavior.
- Iterate with focused tests; finish with all checks required for the change by repo instructions and CI. Exercise changed behavior directly when practical.
- Report commands, results, failures, and verification gaps with reasons and remaining uncertainty. Never claim unverified success.
