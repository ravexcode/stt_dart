# MVP 1 foundation

## Objective

Replace the generated calculator scaffold with the first usable,
platform-independent speech-to-text contract and local development path.

## Problem

The package currently exposes only `Calculator`; consumers cannot configure a
recognizer, receive transcript events, handle typed failures, or run an example
without native platform support.

## Scope

- Define the public STT configuration, result, error, and lifecycle contracts.
- Provide a deterministic in-memory mock for application development and tests.
- Add focused unit tests for models, behavior, stream lifecycle, and errors.
- Add a Flutter example that uses the mock without platform code.
- Update README and contributor guidance for the MVP 1 workflow.
- Do not add platform integrations, audio capture, or external dependencies.

## Constraints

- Keep the public API platform-independent.
- Keep microphone capture separate from transcription.
- Preserve typed errors and documented lifecycle behavior.
- Prefer small, reviewable work units; forecast is under 400 authored lines.

## Authorized scope

The user explicitly requested starting MVP 1 from `.agents/ROADMAP.md`.

## Checks

- TDD mode: not configured; use focused tests plus `flutter analyze`.
- Route: direct implementation after CodeGraph exploration; no subagent
  mechanism is available in this runtime.
- Delivery strategy: single work unit, unless verification reveals a coherent
  split is needed.

## Tasks

- [x] MVP1-1: Implement public contract and in-memory mock.
- [x] MVP1-2: Add focused tests and lifecycle/error coverage.
- [x] MVP1-3: Add example and update package/contributor documentation.
- [x] MVP1-4: Run checks and record evidence.

## Acceptance criteria

- A consumer can configure and start the recognizer without platform imports.
- Transcript results are delivered through a stream.
- Invalid lifecycle operations produce typed exceptions.
- The mock can emit interim and final results deterministically.
- The example runs against the mock.
- `flutter analyze` and `flutter test` pass.

## Progress

Completed.

## Verification evidence

- `dart format --output=none --set-exit-if-changed .` — passed for the changed
  Dart sources.
- `flutter analyze` — passed with no issues.
- `flutter test` — passed; 6 tests passed.
- `cd example && flutter pub get && flutter analyze` — passed with no issues.
- `git diff --check` — passed.

## Commit evidence

Pending work-unit commit.

## Next step

Create the work-unit commit for the completed MVP 1 foundation and review the
diff before deciding whether to proceed to MVP 2.
