# stt_dart

[![pub package](https://img.shields.io/pub/v/stt_dart.svg)](https://pub.dev/packages/stt_dart)
[![pub points](https://img.shields.io/pub/points/stt_dart)](https://pub.dev/packages/stt_dart/score)
[![Build](https://github.com/ravexcode/stt_dart/actions/workflows/publish.yml/badge.svg)](https://github.com/ravexcode/stt_dart/actions/workflows/publish.yml)

`stt_dart` is an open-source Flutter package for processing a user's voice from audio and converting it into text.

> The package is currently in its foundation stage. The public speech-to-text API and platform integrations are still being developed.

## Goals

- Provide a clear, Flutter-friendly API for speech-to-text workflows.
- Keep audio capture and transcription concerns easy to integrate into Flutter apps.
- Support an open development process with reproducible releases.

## Installation

Add `stt_dart` to your `pubspec.yaml`:

```yaml
dependencies:
  stt_dart: ^0.0.1
```

Then fetch the package:

```bash
flutter pub get
```

The first release is not available on pub.dev until it has been published. See [Contributing](CONTRIBUTING.md) for local development instructions.

## Current usage

The speech-to-text API is not available yet. Until the first implementation is released, use the repository to follow development and contribute to the API design.

## Development

Requirements:

- Flutter stable
- Dart SDK compatible with the version in [`pubspec.yaml`](pubspec.yaml)

Run the checks locally:

```bash
flutter pub get
flutter analyze
flutter test
dart pub publish --dry-run
```

## Releases

Releases are published from GitHub Actions using pub.dev's OIDC-based automated publishing. After the initial package version has been published manually, update `version` in `pubspec.yaml`, commit the change, and push a matching tag:

```bash
git tag v0.0.2
git push origin v0.0.2
```

The tag version must match the package version. The repository must also be enabled as an automated publisher in the pub.dev package administration settings.

## Contributing

Issues, documentation improvements, tests, and implementation work are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request.

## License

This project is distributed under the [MIT License](LICENSE.md).
