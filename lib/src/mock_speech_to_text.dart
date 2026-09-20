import 'dart:async';

import 'speech_to_text.dart';
import 'speech_to_text_models.dart';

/// An in-memory recognizer for tests, examples, and local UI development.
class MockSpeechToText implements SpeechToText {
  final StreamController<SpeechToTextResult> _resultsController =
      StreamController<SpeechToTextResult>.broadcast();

  bool _isStarted = false;
  bool _isDisposed = false;

  @override
  Stream<SpeechToTextResult> get results => _resultsController.stream;

  @override
  bool get isStarted => _isStarted;

  @override
  Future<void> start(SpeechToTextConfig config) async {
    _throwIfDisposed();
    config.validate();

    if (_isStarted) {
      throw const SpeechToTextException(
        code: SpeechToTextErrorCode.alreadyStarted,
        message: 'The speech-to-text session is already started.',
      );
    }

    _isStarted = true;
  }

  @override
  Future<void> stop() async {
    _throwIfDisposed();

    if (!_isStarted) {
      throw const SpeechToTextException(
        code: SpeechToTextErrorCode.notStarted,
        message: 'The speech-to-text session is not started.',
      );
    }

    _isStarted = false;
  }

  /// Emits a result into the active session.
  void emitResult(SpeechToTextResult result) {
    _throwIfDisposed();

    if (!_isStarted) {
      throw const SpeechToTextException(
        code: SpeechToTextErrorCode.notStarted,
        message: 'The speech-to-text session is not started.',
      );
    }

    _resultsController.add(result);
  }

  @override
  Future<void> dispose() async {
    if (_isDisposed) {
      return;
    }

    _isStarted = false;
    _isDisposed = true;
    await _resultsController.close();
  }

  void _throwIfDisposed() {
    if (_isDisposed) {
      throw const SpeechToTextException(
        code: SpeechToTextErrorCode.disposed,
        message: 'The speech-to-text recognizer has been disposed.',
      );
    }
  }
}
