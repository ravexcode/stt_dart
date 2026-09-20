import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stt_dart/stt_dart.dart';

void main() {
  runApp(const SttDartExampleApp());
}

class SttDartExampleApp extends StatelessWidget {
  const SttDartExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stt_dart example',
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: const SpeechDemoPage(),
    );
  }
}

class SpeechDemoPage extends StatefulWidget {
  const SpeechDemoPage({super.key});

  @override
  State<SpeechDemoPage> createState() => _SpeechDemoPageState();
}

class _SpeechDemoPageState extends State<SpeechDemoPage> {
  final MockSpeechToText _recognizer = MockSpeechToText();
  late final StreamSubscription<SpeechToTextResult> _resultSubscription;
  SpeechToTextResult? _latestResult;

  @override
  void initState() {
    super.initState();
    _resultSubscription = _recognizer.results.listen((result) {
      if (mounted) {
        setState(() => _latestResult = result);
      }
    });
  }

  @override
  void dispose() {
    _resultSubscription.cancel();
    _recognizer.dispose();
    super.dispose();
  }

  Future<void> _toggleSession() async {
    if (_recognizer.isStarted) {
      await _recognizer.stop();
      setState(() {});
      return;
    }

    await _recognizer.start(const SpeechToTextConfig());
    _recognizer.emitResult(
      const SpeechToTextResult(
        transcript: 'Hello from the in-memory recognizer.',
        isFinal: true,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final result = _latestResult;

    return Scaffold(
      appBar: AppBar(title: const Text('stt_dart example')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result?.transcript ?? 'No transcript yet',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              Text(result?.isFinal == true ? 'Final' : 'Waiting'),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _toggleSession,
                child: Text(_recognizer.isStarted ? 'Stop' : 'Start mock'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
