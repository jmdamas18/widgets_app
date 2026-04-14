import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// final darkNotifierProvider = NotifierProvider<DarkThemeNotifier, bool>(DarkThemeNotifier.new);

// class DarkThemeNotifier extends Notifier<bool> {
//   @override
//   bool build() => false;

//   void toggle() => state = !state;
// }

// final selectedColorNotifierProvider = NotifierProvider<SelectedColorNotifier, int>(SelectedColorNotifier.new);

// class SelectedColorNotifier extends Notifier<int> {
//   @override
//   int build() => 0;

//   void select(int index) => state = index;
// }

final colorListNotifierProvider = NotifierProvider<ColorListNotifier, List<Color>>(ColorListNotifier.new);

class ColorListNotifier extends Notifier<List<Color>> {
  @override
  List<Color> build() => colorList;
}

final themeNotifierProvider = NotifierProvider<ThemeNotifier, AppTheme>(ThemeNotifier.new);

class ThemeNotifier extends Notifier<AppTheme> {
  @override
  AppTheme build() => AppTheme();

  void toggleDarkMode() => state = state.copyWith(isDarkMode: !state.isDarkMode);
  void selectColor(int index) => state = state.copyWith(selectColor: index);
}
