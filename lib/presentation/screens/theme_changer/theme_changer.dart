import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChanger extends ConsumerWidget {
  static const name = 'theme_changer_screen';

  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bool isDarkMode = ref.watch(darkNotifierProvider);
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              // ref.read(darkNotifierProvider.notifier).toggle();
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colorList = ref.watch(colorListNotifierProvider);
    // final int selectedColor = ref.watch(selectedColorNotifierProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectColor;

    return RadioGroup<int>(
      groupValue: selectedColor,
      onChanged: (value) {
        if (value != null) {
          // ref.read(selectedColorNotifierProvider.notifier).select(value);
          ref.read(themeNotifierProvider.notifier).selectColor(value);
        }
      },
      child: ListView.builder(
        itemCount: colorList.length,
        itemBuilder: (context, index) {
          final Color color = colorList[index];

          return RadioListTile(
            title: Text('Color ${index + 1}', style: TextStyle(color: color)),
            subtitle: Text('${color.toARGB32()}'),
            activeColor: color,
            value: index,
          );
        },
      ),
    );
  }
}
