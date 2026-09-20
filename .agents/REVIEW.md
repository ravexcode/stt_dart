Review the current implementation for architecture violations.

Check:
- Is any platform-specific code leaking into universal_stt?
- Are public APIs documented?
- Are errors typed?
- Are streams closed correctly?
- Are subscriptions cancelled?
- Are there race conditions in start/stop/dispose?
- Is the API stable enough for public package usage?

Return findings with file paths and suggested patches.
