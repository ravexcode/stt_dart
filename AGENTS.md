# AGENTS

## Goal

Expose a clean Dart/Flutter API for speech-to-text. Package users should not
need to write platform-specific code.

## Working agreement

- Keep the public API platform-agnostic and documented with Dart doc comments.
- Keep microphone capture separate from transcription and keep both behind
  replaceable interfaces.
- Prefer the smallest coherent change. Do not broaden the supported platforms
  or introduce a new dependency without recording the reason.
- When a public model, method, stream, or error changes, update its tests and
  the relevant documentation in the same change.
- Preserve existing work and avoid formatting-only rewrites.

## Definition of done

A change is ready when:

1. Its scope is reflected in `.agents/TASKS.md` or the roadmap.
2. Public behavior has focused tests, including relevant error and lifecycle
   cases.
3. `flutter analyze` and `flutter test` pass locally.
4. Public API documentation and architecture notes remain accurate.
5. The review checklist in `.agents/REVIEW.md` has been considered, with any
   remaining limitation called out explicitly.

Do not claim platform support, native integration, or release readiness based
only on static analysis or unit tests.

## Links
- [Architecture](./.agents/ARCHITECTURE.md)
- [Tasks](./.agents/TASKS.md)
- [Review](./.agents/REVIEW.md)
- [ROADMAP](./.agents/ROADMAP.md)
