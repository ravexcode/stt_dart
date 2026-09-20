# Contributing to stt_dart

Thank you for helping build `stt_dart`. Contributions are welcome for documentation, tests, API design, platform integrations, and speech-to-text functionality.

The current target is MVP 1: the platform-independent public contract, typed
configuration and errors, the in-memory mock, focused tests, and the Flutter
example. Do not add native microphone integrations until the MVP 1 contract is
stable and the relevant roadmap item is opened.

## Before you start

1. Search existing issues and pull requests so your work does not duplicate an open discussion.
2. For a significant API or architectural change, open an issue first and describe the proposed behavior.
3. Keep pull requests focused on one coherent change.

## Local setup

```bash
git clone https://github.com/ravexcode/stt_dart.git
cd stt_dart
flutter pub get
```

Use the stable Flutter channel and the Dart SDK constraint declared in `pubspec.yaml`.

## Checks before opening a pull request

Run all applicable checks:

```bash
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
dart pub publish --dry-run
```

If a check cannot run locally, explain why in the pull request description. Add or update tests whenever behavior changes.

For public API changes, update the API documentation, `.agents/ARCHITECTURE.md`,
and `.agents/TASKS.md` when the lifecycle or acceptance criteria change.

## Pull request merge checks

Pull requests targeting `main` run the `Pull request checks` workflow. Configure
the repository's `main` branch protection to require these status checks before
merging:

- `Package checks`
- `Example checks`

The workflow validates the package but does not publish it. Publication remains
restricted to matching version tags through `.github/workflows/publish.yml`.

## Commit and pull request guidance

- Use a clear imperative commit subject, such as `Add microphone permission guidance`.
- Explain the motivation, implementation, and testing in the pull request description.
- Include platform-specific considerations for Android, iOS, web, desktop, or accessibility when relevant.
- Do not commit credentials, generated secrets, local build output, or `.dart_tool` contents.

## Reporting issues

Include the Flutter and Dart versions, target platform, package version or commit, a minimal reproduction, and relevant logs. Please remove personal audio, transcripts, tokens, and other sensitive data before sharing logs.

## Code of conduct

Be respectful, constructive, and welcoming. Harassment, discrimination, and personal attacks are not acceptable in project discussions.

## License

By contributing, you agree that your contributions will be distributed under the [MIT License](LICENSE.md).
