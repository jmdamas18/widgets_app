import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicators')),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text('Circular Progress Indicator'),
          const SizedBox(height: 10),
          CircularProgressIndicator(strokeWidth: 3, backgroundColor: Colors.black38),

          const SizedBox(height: 30),
          Text('Circular & Linear Progress Indicator Controlado'),
          const SizedBox(height: 10),
          _ControllerProgressIndicator(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) => (value * 2) / 100).takeWhile((value) => value <= 1),
      builder: (context, asyncSnapshot) {
        final progressValue = asyncSnapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value: progressValue, strokeWidth: 3, backgroundColor: Colors.black38),
              const SizedBox(width: 20),
              Expanded(
                child: LinearProgressIndicator(value: progressValue, backgroundColor: Colors.black38),
              ),
            ],
          ),
        );
      },
    );
  }
}
