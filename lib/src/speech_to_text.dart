import 'speech_to_text_models.dart';

/// A platform-independent speech-to-text session.
abstract interface class SpeechToText {
  /// Transcript updates emitted by the active session.
  Stream<SpeechToTextResult> get results;

  /// Whether a session is currently active.
  bool get isStarted;

  /// Starts a session with [config].
  Future<void> start(SpeechToTextConfig config);

  /// Stops the active session while keeping the recognizer reusable.
  Future<void> stop();

  /// Releases resources permanently.
  Future<void> dispose();
}
