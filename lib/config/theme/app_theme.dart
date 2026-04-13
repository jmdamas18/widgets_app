import 'package:flutter/material.dart';

const colorList = <Color>[Colors.blue, Colors.teal, Colors.red, Colors.green, Colors.orange, Colors.purple, Colors.pink, Colors.brown, Colors.cyan, Colors.indigo];

class AppTheme {
  final int selectColor;

  AppTheme({this.selectColor = 0}) : assert(selectColor >= 0 && selectColor < colorList.length, 'SelectColor must be between 0 and ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(useMaterial3: true, colorSchemeSeed: colorList[selectColor], appBarTheme: AppBarTheme(centerTitle: false));
}
