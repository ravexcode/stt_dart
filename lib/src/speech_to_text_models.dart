/// Configuration used when starting a speech-to-text session.
class SpeechToTextConfig {
  /// Creates a speech-to-text configuration.
  const SpeechToTextConfig({
    this.localeId = 'en-US',
    this.sampleRate = 16_000,
    this.channelCount = 1,
    this.interimResults = true,
  });

  /// BCP-47 language tag requested from the recognition engine.
  final String localeId;

  /// Audio sample rate in hertz.
  final int sampleRate;

  /// Number of interleaved audio channels.
  final int channelCount;

  /// Whether the engine should emit non-final transcript updates.
  final bool interimResults;

  /// Validates values that are independent of a platform implementation.
  void validate() {
    if (localeId.trim().isEmpty) {
      throw const SpeechToTextException(
        code: SpeechToTextErrorCode.invalidConfiguration,
        message: 'localeId must not be empty.',
      );
    }

    if (sampleRate <= 0) {
      throw const SpeechToTextException(
        code: SpeechToTextErrorCode.invalidConfiguration,
        message: 'sampleRate must be greater than zero.',
      );
    }

    if (channelCount <= 0) {
      throw const SpeechToTextException(
        code: SpeechToTextErrorCode.invalidConfiguration,
        message: 'channelCount must be greater than zero.',
      );
    }
  }
}

/// A transcript update emitted by a speech-to-text session.
class SpeechToTextResult {
  /// Creates a transcript result.
  const SpeechToTextResult({
    required this.transcript,
    required this.isFinal,
    this.confidence,
  });

  /// The text recognized so far.
  final String transcript;

  /// Whether this update closes the current utterance.
  final bool isFinal;

  /// Optional confidence score in the inclusive range from 0 to 1.
  final double? confidence;
}

/// Stable categories for failures exposed by the public API.
enum SpeechToTextErrorCode {
  /// The supplied configuration is not valid.
  invalidConfiguration,

  /// A session is already active.
  alreadyStarted,

  /// An operation requires an active session.
  notStarted,

  /// The recognizer has already been disposed.
  disposed,
}

/// A typed failure from a speech-to-text operation.
class SpeechToTextException implements Exception {
  /// Creates a typed speech-to-text exception.
  const SpeechToTextException({required this.code, required this.message});

  /// Machine-readable category of this failure.
  final SpeechToTextErrorCode code;

  /// Human-readable explanation of this failure.
  final String message;

  @override
  String toString() => 'SpeechToTextException(${code.name}): $message';
}
