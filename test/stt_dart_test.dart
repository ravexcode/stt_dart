import 'package:flutter_test/flutter_test.dart';
import 'package:stt_dart/stt_dart.dart';

void main() {
  group('SpeechToTextConfig', () {
    test('provides platform-independent defaults', () {
      const config = SpeechToTextConfig();

      expect(config.localeId, 'en-US');
      expect(config.sampleRate, 16_000);
      expect(config.channelCount, 1);
      expect(config.interimResults, isTrue);
    });

    test('rejects invalid values with a typed exception', () {
      expect(
        () => const SpeechToTextConfig(localeId: '').validate(),
        throwsA(
          isA<SpeechToTextException>().having(
            (error) => error.code,
            'code',
            SpeechToTextErrorCode.invalidConfiguration,
          ),
        ),
      );
    });
  });

  test('represents transcript text, finality, and confidence', () {
    const result = SpeechToTextResult(
      transcript: 'hello world',
      isFinal: true,
      confidence: 0.95,
    );

    expect(result.transcript, 'hello world');
    expect(result.isFinal, isTrue);
    expect(result.confidence, 0.95);
  });

  group('MockSpeechToText', () {
    late MockSpeechToText recognizer;

    setUp(() {
      recognizer = MockSpeechToText();
    });

    tearDown(() async {
      await recognizer.dispose();
    });

    test('emits interim and final results through a reusable stream', () async {
      final results = <SpeechToTextResult>[];
      final subscription = recognizer.results.listen(results.add);

      await recognizer.start(const SpeechToTextConfig());
      recognizer.emitResult(
        const SpeechToTextResult(transcript: 'hel', isFinal: false),
      );
      recognizer.emitResult(
        const SpeechToTextResult(transcript: 'hello', isFinal: true),
      );
      await Future<void>.delayed(Duration.zero);

      expect(recognizer.isStarted, isTrue);
      expect(results.map((result) => result.transcript), ['hel', 'hello']);

      await recognizer.stop();
      await recognizer.start(const SpeechToTextConfig(localeId: 'es-MX'));
      expect(recognizer.isStarted, isTrue);

      await subscription.cancel();
    });

    test('rejects duplicate starts and stopping an inactive session', () async {
      await recognizer.start(const SpeechToTextConfig());

      await expectLater(
        recognizer.start(const SpeechToTextConfig()),
        throwsA(
          isA<SpeechToTextException>().having(
            (error) => error.code,
            'code',
            SpeechToTextErrorCode.alreadyStarted,
          ),
        ),
      );

      await recognizer.stop();
      await expectLater(
        recognizer.stop(),
        throwsA(
          isA<SpeechToTextException>().having(
            (error) => error.code,
            'code',
            SpeechToTextErrorCode.notStarted,
          ),
        ),
      );
    });

    test('closes resources and rejects operations after dispose', () async {
      final streamDone = expectLater(recognizer.results, emitsDone);

      await recognizer.dispose();
      await streamDone;
      await recognizer.dispose();

      await expectLater(
        recognizer.start(const SpeechToTextConfig()),
        throwsA(
          isA<SpeechToTextException>().having(
            (error) => error.code,
            'code',
            SpeechToTextErrorCode.disposed,
          ),
        ),
      );
    });
  });
}
