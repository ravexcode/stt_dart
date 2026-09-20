# AGENTS

- Goal:
  - Expose a clean Dart/Flutter API for speech-to-text. Users should not write platform-specific code.

- Important:
  - Native code is allowed internally, but must be hidden behind the Dart API.

Constraints:
- Do not implement unrelated platforms.
- Do not add dependencies unless justified.
- Do not change public API without updating tests and docs.
- Add tests for every public model and behavior.
- Prefer small, reviewable changes.

## Links
- [Architecture](./.agents/ARCHITECTURE.md)
- [Tasks](./.agents/TASKS.md)
- [Review](./.agents/REVIEW.md)
- [ROADMAP](./.agents/ROADMAP.md)
