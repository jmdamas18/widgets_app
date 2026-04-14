import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String route;
  final IconData icon;

  const MenuItem({required this.title, required this.subTitle, required this.route, required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(title: 'Riverpod Counter Screen', subTitle: 'Contador con Riverpod', route: '/counter', icon: Icons.numbers),
  MenuItem(title: 'Botones', subTitle: 'Varios tipos de botones', route: '/buttons', icon: Icons.smart_button_outlined),
  MenuItem(title: 'Tarjetas', subTitle: 'Varios tipos de tarjetas', route: '/cards', icon: Icons.credit_card),
  MenuItem(title: 'Indicadores de Progreso', subTitle: 'Generales y controlados', route: '/progress', icon: Icons.refresh),
  MenuItem(title: 'Snack Bars y Dialogs', subTitle: 'Indicadores y diálogos', route: '/snackbars', icon: Icons.info),
  MenuItem(title: 'Animaciones', subTitle: 'Animaciones predefinidas', route: '/animated', icon: Icons.animation),
  MenuItem(title: 'UI Controls + Tiles', subTitle: 'Controles de UI', route: '/ui-controls', icon: Icons.build_circle),
  MenuItem(title: 'Tutorial App', subTitle: 'Guía de la aplicación', route: '/tutorial', icon: Icons.school),
  MenuItem(title: 'Infinite Scroll & Pull Refresh', subTitle: 'Listas infinitas y pull to refresh', route: '/infinite', icon: Icons.list),
  MenuItem(title: 'Cambiar Tema', subTitle: 'Cambiar el tema de la aplicación', route: '/theme-changer', icon: Icons.color_lens_outlined),
];
