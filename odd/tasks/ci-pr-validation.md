# Pull request CI validation

## Objective

Verify package and example changes automatically before they can merge into
`main`, while keeping pub.dev publication as a separate release-only workflow.

## Scope

- Add a pull-request GitHub Actions workflow.
- Validate formatting, analysis, tests, and publish archive contents.
- Analyze the Flutter example independently.
- Document the required branch-protection checks.

## Constraints

- No publishing credentials or write permissions in the pull-request workflow.
- Pin the Flutter toolchain to the repository-compatible stable version.
- Preserve `.github/workflows/publish.yml` for tag-based CD.

## Tasks

- [x] Add package CI checks.
- [x] Add example analysis checks.
- [x] Document merge-gate configuration.
- [x] Validate workflow inputs and local equivalents.

## Acceptance criteria

- The workflow runs for pull requests targeting `main`.
- It has read-only repository permissions and cancels superseded runs.
- Package formatting, analysis, tests, and `dart pub publish --dry-run` run in CI.
- The example installs dependencies and passes analysis.
- CD remains tag-triggered and separate from PR validation.

## Verification evidence

- Local package format, analysis, and tests: passed.
- `dart pub publish --dry-run`: passed with existing worktree and license-name
  warnings; no archive validation failure.
- Local example analysis: not run because this branch does not yet contain a
  committed `example/pubspec.yaml`; the workflow handles that case explicitly.
- Workflow YAML parsed successfully with PyYAML; `actionlint` was unavailable in
  the local environment.

## Commit evidence

Pending work-unit commit.
