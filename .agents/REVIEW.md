Review the current implementation for architecture violations and behavior
that could make the public package unsafe or difficult to adopt.

Check:
- Is any platform-specific code leaking into the `stt_dart` public library?
- Are public APIs documented?
- Are errors typed?
- Are streams closed correctly?
- Are subscriptions cancelled?
- Are there race conditions in start/stop/dispose?
- Is the API stable enough for public package usage?

For every finding, include:

1. Severity: blocker, important, or follow-up.
2. File path and relevant symbol or line.
3. Evidence from the implementation or a failed check.
4. A minimal suggested patch or test.

Also report the checks that passed, the checks that were unavailable, and any
assumptions made during the review. Do not treat a passing static check as
evidence that a native platform integration works at runtime.
