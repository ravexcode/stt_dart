# Architecture

This project exposes a Dart-first API for speech-to-text in Flutter through the
`stt_dart` package.

Users of this package must not write platform-specific code.

Native code is allowed internally inside platform implementations.

## Layers

1. Public API
2. Platform interface
3. Audio input
4. Speech recognition engine
5. Platform implementation

Dependencies may point from an outer layer to an inner layer, never the other
way around. The public API must not import platform implementations directly.

## Rules

- The public API must remain platform-agnostic.
- Platform-specific code must stay inside platform packages.
- No native implementation may leak into the `stt_dart` public library.
- All public APIs must have documentation comments.
- All errors must use typed exceptions.
- Audio must be streamed as PCM frames.
- Recognition engines must be replaceable.
- Microphone input and speech recognition must remain separate.

## Change rules

- Add a public abstraction before adding a platform implementation.
- Keep platform-specific types, permissions, codecs, and lifecycle details out
  of the public package API.
- Model lifecycle explicitly: start, stop, and dispose must be safe to call and
  must close streams and cancel subscriptions deterministically.
- In MVP 1, `stop()` ends the active session but keeps the recognizer reusable;
  `dispose()` is the terminal operation and closes the result stream.
- Document an architectural exception in the review notes before merging it.
