# Tasks

## Current phase

Build the platform interface and public Dart API.

The current phase is complete only when the public contracts are documented,
tested, and usable without importing a platform package.

## Do not implement yet

- Android microphone capture
- iOS microphone capture
- Whisper integration
- Windows support
- Linux support
- macOS support

## Requirements

- Use streams for transcripts.
- Use typed configs.
- Use typed exceptions.
- Add tests.
- Add documentation comments.
- Keep public API platform-independent.

## Acceptance checks

- [x] Public models and behaviors have focused tests.
- [x] Stream ownership, completion, cancellation, and error behavior are
  defined.
- [x] Start, stop, and dispose behavior is deterministic and documented.
- [x] `flutter analyze` passes.
- [x] `flutter test` passes.
- [x] No platform-specific dependency or implementation is exposed by the
  public library.

When a check cannot run, record why and do not mark it complete.
