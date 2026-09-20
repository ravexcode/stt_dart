# Architecture

This project exposes a Dart-first API for speech-to-text in Flutter.

Users of this package must not write platform-specific code.

Native code is allowed internally inside platform implementations.

## Layers

1. Public API
2. Platform interface
3. Audio input
4. Speech recognition engine
5. Platform implementation

## Rules

- The public API must remain platform-agnostic.
- Platform-specific code must stay inside platform packages.
- No native implementation may leak into `universal_stt`.
- All public APIs must have documentation comments.
- All errors must use typed exceptions.
- Audio must be streamed as PCM frames.
- Recognition engines must be replaceable.
- Microphone input and speech recognition must remain separate.
