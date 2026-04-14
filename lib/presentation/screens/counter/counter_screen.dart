import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final int clickCounter = ref.watch(counterProvider);
    // final bool isDarkMode = ref.watch(darkNotifierProvider);
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Counter Screen'),
        actions: [IconButton(icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode), onPressed: () => ref.read(themeNotifierProvider.notifier).toggleDarkMode())],
      ),
      body: Center(child: Text('Valor: $clickCounter', style: titleStyle)),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'btn-reset',
            child: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(counterProvider.notifier).reset();
            },
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            heroTag: 'btn-increment',
            child: const Icon(Icons.add),
            onPressed: () {
              ref.read(counterProvider.notifier).increment();
            },
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            heroTag: 'btn-decrement',
            child: const Icon(Icons.remove),
            onPressed: () {
              if (clickCounter == 0) return;

              ref.read(counterProvider.notifier).decrement();
            },
          ),
        ],
      ),
    );
  }
}
