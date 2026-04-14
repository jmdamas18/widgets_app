import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final themeProvider = NotifierProvider<ThemeNotifier, bool>(ThemeNotifier.new);

class ThemeNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle() => state = !state;
}

final colorListProvider = NotifierProvider<ColorListNotifier, List<Color>>(ColorListNotifier.new);

class ColorListNotifier extends Notifier<List<Color>> {
  @override
  List<Color> build() => colorList;
}

final selectedColorProvider = NotifierProvider<SelectedColorNotifier, int>(SelectedColorNotifier.new);

class SelectedColorNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void select(int index) => state = index;
}
