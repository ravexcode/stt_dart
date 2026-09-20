# Open-source foundation

## Objective

Prepare `stt_dart` for public Flutter package development and publication on pub.dev.

## Problem

The repository is still the default Flutter package scaffold. It lacks project documentation, a usable license, GitHub contribution guidance, package metadata, and a safe publication workflow.

## Scope

- Initialize and configure the local Git repository for `https://github.com/ravexcode/stt_dart.git`.
- Document the package purpose, current status, setup, usage direction, and release process.
- Add contributor guidance for an open-source project.
- Add an MIT license.
- Add a tag-based GitHub Actions workflow for OIDC publication to pub.dev.
- Keep the current speech-to-text implementation scope explicit; do not invent an API that does not exist yet.

## Constraints

- Package name: `stt_dart`.
- Repository owner: `ravexcode`.
- Publication must use pub.dev automated publishing through GitHub Actions.
- The workflow must not contain a long-lived pub.dev credential.

## Authorized scope

The user explicitly requested the repository setup, documentation, license, GitHub workflow, and pubspec metadata changes.

## Resolved checks

- TDD mode: not configured for this documentation/configuration task; use package analysis and dry-run publication checks.
- Delivery strategy: single work unit; forecast under 400 authored lines.
- Route: direct inline after CodeGraph exploration; the requested files are configuration/documentation artifacts and no multi-file runtime implementation is needed.

## Tasks

- [x] OSSF-1: Configure repository identity and package metadata.
- [x] OSSF-2: Add public project documentation and license.
- [x] OSSF-3: Add and validate tag-based pub.dev publication workflow.

## Acceptance criteria

- Git repository has `main` as its initial branch and the requested `origin` URL.
- `pubspec.yaml` identifies the package and its repository/documentation URLs.
- `README.md`, `CONTRIBUTING.md`, and `LICENSE.md` are suitable starting documents for an open-source package.
- `.github/workflows/publish.yml` publishes only version tags through the official reusable Dart workflow with OIDC permission.
- `flutter analyze`, `flutter test`, and `dart pub publish --dry-run` complete successfully.

## Progress

Completed. Git metadata, package metadata, documentation, license, and workflow are in place.

## Verification evidence

- `dart format --output=none --set-exit-if-changed .` — passed.
- `flutter analyze` — passed with no issues.
- `flutter test` — passed; 1 test passed.
- `dart pub publish --dry-run` — passed with 0 warnings and a 3 KB archive; `.pubignore` excludes internal planning, CI, build, and IDE files.
- GitHub workflow uses `dart-lang/setup-dart/.github/workflows/publish.yml@v1`, OIDC `id-token: write`, and `vX.Y.Z` tags.

## Commit evidence

- `98f2e0e` — `chore: prepare package for open source release`.

## Next step

Configure automated publishing on pub.dev for `ravexcode/stt_dart`, publish the first version manually, and push future matching version tags.
